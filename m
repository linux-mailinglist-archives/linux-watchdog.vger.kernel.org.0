Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113B933BF3D
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 16:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbhCOPAA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 11:00:00 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:53985 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232141AbhCOO7d (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 10:59:33 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12FEx1hG025125
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Mar 2021 15:59:01 +0100
Received: from localhost.localdomain ([139.22.41.172])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12FEx0KA028580;
        Mon, 15 Mar 2021 15:59:00 +0100
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
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH] platform/x86: pmc_atom: use callback for all dmi quirk entries
Date:   Mon, 15 Mar 2021 15:58:55 +0100
Message-Id: <20210315145855.17174-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <ef5fe493-285d-145c-8d05-7f9bd0cb47c5@redhat.com>
References: <ef5fe493-285d-145c-8d05-7f9bd0cb47c5@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Introduce a global variable to remember the matching entry for later
printing. Also having a callback allows to stop matching after the first
hit.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/platform/x86/pmc_atom.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 38542d547f29..d0f74856cd8b 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -364,8 +364,16 @@ static void pmc_dbgfs_register(struct pmc_dev *pmc)
 #endif /* CONFIG_DEBUG_FS */
 
 static bool pmc_clk_is_critical = true;
+static const struct dmi_system_id *dmi_critical;
 
-static int siemens_clk_is_critical(const struct dmi_system_id *d)
+static int dmi_callback(const struct dmi_system_id *d)
+{
+	dmi_critical = d;
+
+	return 1;
+}
+
+static int dmi_callback_siemens(const struct dmi_system_id *d)
 {
 	u32 st_id;
 
@@ -373,7 +381,7 @@ static int siemens_clk_is_critical(const struct dmi_system_id *d)
 		goto out;
 
 	if (st_id == SIMATIC_IPC_IPC227E || st_id == SIMATIC_IPC_IPC277E)
-		return 1;
+		return dmi_callback(d);
 
 out:
 	pmc_clk_is_critical = false;
@@ -388,6 +396,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk0 is used for an external HSIC USB HUB */
 		.ident = "MPL CEC1x",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
@@ -396,6 +405,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
 		.ident = "Lex 3I380D",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
@@ -404,6 +414,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Lex 2I385SW",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "2I385SW"),
@@ -412,6 +423,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Beckhoff CB3163",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
 			DMI_MATCH(DMI_BOARD_NAME, "CB3163"),
@@ -420,6 +432,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Beckhoff CB4063",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
 			DMI_MATCH(DMI_BOARD_NAME, "CB4063"),
@@ -428,6 +441,7 @@ static const struct dmi_system_id critclk_systems[] = {
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Beckhoff CB6263",
+		.callback = dmi_callback,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
 			DMI_MATCH(DMI_BOARD_NAME, "CB6263"),
@@ -436,13 +450,14 @@ static const struct dmi_system_id critclk_systems[] = {
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
-		.callback = siemens_clk_is_critical,
+		.callback = dmi_callback_siemens,
 		.ident = "SIEMENS AG",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
@@ -457,7 +472,6 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 {
 	struct platform_device *clkdev;
 	struct pmc_clk_data *clk_data;
-	const struct dmi_system_id *d;
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
@@ -468,8 +482,8 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 	if (dmi_check_system(critclk_systems)) {
 		clk_data->critical = pmc_clk_is_critical;
 		if (clk_data->critical) {
-			d = dmi_first_match(critclk_systems);
-			pr_info("%s critclks quirk enabled\n", d->ident);
+			pr_info("%s critclks quirk enabled\n",
+				dmi_critical->ident);
 		}
 	}
 
-- 
2.26.2

