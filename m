Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A448234D645
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 19:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbhC2Rub (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 13:50:31 -0400
Received: from gecko.sbs.de ([194.138.37.40]:33759 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230449AbhC2RuD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 13:50:03 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12THncwL009051
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 29 Mar 2021 19:49:38 +0200
Received: from localhost.localdomain ([167.87.41.127])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12THnYmx025235;
        Mon, 29 Mar 2021 19:49:37 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Henning Schild <henning.schild@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>,
        Michael Haener <michael.haener@siemens.com>
Subject: [PATCH v3 4/4] platform/x86: pmc_atom: improve critclk_systems matching for Siemens PCs
Date:   Mon, 29 Mar 2021 19:49:28 +0200
Message-Id: <20210329174928.18816-5-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210329174928.18816-1-henning.schild@siemens.com>
References: <20210329174928.18816-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Siemens industrial PCs unfortunately can not always be properly
identified the way we used to. An earlier commit introduced code that
allows proper identification without looking at DMI strings that could
differ based on product branding.
Switch over to that proper way and revert commits that used to collect
the machines based on unstable strings.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Fixes: e8796c6c69d1 ("platform/x86: pmc_atom: Add Siemens CONNECT ...")
Fixes: f110d252ae79 ("platform/x86: pmc_atom: Add Siemens SIMATIC ...")
Fixes: ad0d315b4d4e ("platform/x86: pmc_atom: Add Siemens SIMATIC ...")
Tested-by: Michael Haener <michael.haener@siemens.com>
Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/platform/x86/pmc_atom.c | 57 +++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index ca684ed760d1..9904fe6973df 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/platform_data/x86/clk-pmc-atom.h>
 #include <linux/platform_data/x86/pmc_atom.h>
+#include <linux/platform_data/x86/simatic-ipc.h>
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
@@ -362,6 +363,30 @@ static void pmc_dbgfs_register(struct pmc_dev *pmc)
 }
 #endif /* CONFIG_DEBUG_FS */
 
+static bool pmc_clk_is_critical = true;
+
+static int dmi_callback(const struct dmi_system_id *d)
+{
+	pr_info("%s critclks quirk enabled\n", d->ident);
+
+	return 1;
+}
+
+static int dmi_callback_siemens(const struct dmi_system_id *d)
+{
+	u32 st_id;
+
+	if (dmi_walk(simatic_ipc_find_dmi_entry_helper, &st_id))
+		goto out;
+
+	if (st_id == SIMATIC_IPC_IPC227E || st_id == SIMATIC_IPC_IPC277E)
+		return dmi_callback(d);
+
+out:
+	pmc_clk_is_critical = false;
+	return 1;
+}
+
 /*
  * Some systems need one or more of their pmc_plt_clks to be
  * marked as critical.
@@ -370,6 +395,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk0 is used for an external HSIC USB HUB */
 		.ident = "MPL CEC1x",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
@@ -378,6 +404,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
 		.ident = "Lex 3I380D",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
@@ -386,6 +413,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Lex 2I385SW",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "2I385SW"),
@@ -394,6 +422,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Beckhoff CB3163",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
 			DMI_MATCH(DMI_BOARD_NAME, "CB3163"),
@@ -402,6 +431,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Beckhoff CB4063",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
 			DMI_MATCH(DMI_BOARD_NAME, "CB4063"),
@@ -410,6 +440,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Beckhoff CB6263",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
 			DMI_MATCH(DMI_BOARD_NAME, "CB6263"),
@@ -418,30 +449,17 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Beckhoff CB6363",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
 			DMI_MATCH(DMI_BOARD_NAME, "CB6363"),
 		},
 	},
 	{
-		.ident = "SIMATIC IPC227E",
+		.callback = dmi_callback_siemens,
+		.ident = "SIEMENS AG",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "6ES7647-8B"),
-		},
-	},
-	{
-		.ident = "SIMATIC IPC277E",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "6AV7882-0"),
-		},
-	},
-	{
-		.ident = "CONNECT X300",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "A5E45074588"),
 		},
 	},
 
@@ -453,7 +471,6 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 {
 	struct platform_device *clkdev;
 	struct pmc_clk_data *clk_data;
-	const struct dmi_system_id *d = dmi_first_match(critclk_systems);
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
@@ -461,10 +478,8 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 
 	clk_data->base = pmc_regmap; /* offset is added by client */
 	clk_data->clks = pmc_data->clks;
-	if (d) {
-		clk_data->critical = true;
-		pr_info("%s critclks quirk enabled\n", d->ident);
-	}
+	if (dmi_check_system(critclk_systems))
+		clk_data->critical = pmc_clk_is_critical;
 
 	clkdev = platform_device_register_data(&pdev->dev, "clk-pmc-atom",
 					       PLATFORM_DEVID_NONE,
-- 
2.26.3

