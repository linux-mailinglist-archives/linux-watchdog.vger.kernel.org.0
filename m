Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CA945EFDC
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 15:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377819AbhKZOaF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 09:30:05 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:57752 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353694AbhKZO2E (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 09:28:04 -0500
X-Greylist: delayed 713 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Nov 2021 09:26:01 EST
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AQEAYI6014284
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 15:10:34 +0100
Received: from localhost.localdomain ([139.22.47.90])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQEAUXJ030519;
        Fri, 26 Nov 2021 15:10:33 +0100
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
Subject: [PATCH v4 4/4] platform/x86: pmc_atom: improve critclk_systems matching for Siemens PCs
Date:   Fri, 26 Nov 2021 15:10:27 +0100
Message-Id: <20211126141027.16161-5-henning.schild@siemens.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211126141027.16161-1-henning.schild@siemens.com>
References: <20211126141027.16161-1-henning.schild@siemens.com>
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
 drivers/platform/x86/pmc_atom.c | 54 ++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index a9d2a4b98e57..a40fae6edc84 100644
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
@@ -394,30 +422,17 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Beckhoff Baytrail",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "CBxx63"),
 		},
 	},
 	{
-		.ident = "SIMATIC IPC227E",
+		.ident = "SIEMENS AG",
+		.callback = dmi_callback_siemens,
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
 
@@ -429,7 +444,6 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 {
 	struct platform_device *clkdev;
 	struct pmc_clk_data *clk_data;
-	const struct dmi_system_id *d = dmi_first_match(critclk_systems);
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
@@ -437,10 +451,8 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 
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
2.32.0

