Return-Path: <linux-watchdog+bounces-2540-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5C9ED4E3
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 19:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FEE41888043
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 18:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091162036FF;
	Wed, 11 Dec 2024 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TucUnsGm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8AF1C3F27;
	Wed, 11 Dec 2024 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733943030; cv=none; b=u4jZD9wqRNsB/8UM6BhY2fP3o7mO5gLFQS6Z2Fsoa1o8Ro861TV+aMSLTsOxVK6cyWOmabatEfV9nHvg7r1XcSBTFBR54MEY30tS5DCovOsFMs/QgFTkGW23MObjnqdEgKOmBR+82Zk0193dYSaTz9p+EbEKGQlHlzY/PRA1HPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733943030; c=relaxed/simple;
	bh=si+HkGWTUu5iJBmrPqw+Eij7fvLdWJDbVQ5PJ6PzaAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XJd03pwnQtkpF6W8ayh7CfcSMxtJDZb3Jt4fsS07zlYJXFNfJvqd3JPMXdwB9wCL+wdjIFfhbVBb2wjiD3ClrwigkUPWR2mV/2Z1gg/Z7kqj5hhqZnVXVTVR0dxGKedDjyby9WLlMN2Flj5SvrTGIEYQxESoCbGahGQqUx3FTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TucUnsGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE30CC4CED2;
	Wed, 11 Dec 2024 18:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943030;
	bh=si+HkGWTUu5iJBmrPqw+Eij7fvLdWJDbVQ5PJ6PzaAs=;
	h=From:To:Cc:Subject:Date:From;
	b=TucUnsGmc8ieuXiLGh5rNWVeDExDH8En559wEDDsP0+7zBie8xxhljzAOG5q72wdk
	 2yXLPhHfcxlBpPMmCtV2jV3zDLaFPCMEQEc1K2mOCpn06VrZr1G/0TtCYWTOY35s0Y
	 VYgZlkSlcRekO1aWosMwxMAEi2FstoM5ljjk50cYv+2pclDIZUNhtOorth5xy1WOSy
	 4nhCnJw1dCCoTeojslbOYSVqW+QYWruIlboKKU4+EZ2x+W3p3f3Qihov5xcYbabuWu
	 +WLS63rX9OiyrzA+WfDVP/BFfVgBphDNLUx8g76EI16NXP0ISsV3v9zkwSSYmPH0vi
	 B94UVg9qExVWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 01/36] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
Date: Wed, 11 Dec 2024 13:49:17 -0500
Message-ID: <20241211185028.3841047-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.4
Content-Transfer-Encoding: 8bit

From: James Hilliard <james.hilliard1@gmail.com>

[ Upstream commit 43439076383a7611300334d1357c0f8883f40816 ]

For the watchdog timer to work properly on the QCML04 board we need to
set PWRGD enable in the Environment Controller Configuration Registers
Special Configuration Register 1 when it is not already set, this may
be the case when the watchdog is not enabled from within the BIOS.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20241025063441.3494837-1-james.hilliard1@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/it87_wdt.c | 39 +++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 3e8c15138edda..1a5a0a2c3f2e3 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -20,6 +20,8 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/bits.h>
+#include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -40,6 +42,7 @@
 #define VAL		0x2f
 
 /* Logical device Numbers LDN */
+#define EC		0x04
 #define GPIO		0x07
 
 /* Configuration Registers and Functions */
@@ -73,6 +76,12 @@
 #define IT8784_ID	0x8784
 #define IT8786_ID	0x8786
 
+/* Environment Controller Configuration Registers LDN=0x04 */
+#define SCR1		0xfa
+
+/* Environment Controller Bits SCR1 */
+#define WDT_PWRGD	0x20
+
 /* GPIO Configuration Registers LDN=0x07 */
 #define WDTCTRL		0x71
 #define WDTCFG		0x72
@@ -240,6 +249,21 @@ static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
 	return ret;
 }
 
+enum {
+	IT87_WDT_OUTPUT_THROUGH_PWRGD	= BIT(0),
+};
+
+static const struct dmi_system_id it87_quirks[] = {
+	{
+		/* Qotom Q30900P (IT8786) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "QCML04"),
+		},
+		.driver_data = (void *)IT87_WDT_OUTPUT_THROUGH_PWRGD,
+	},
+	{}
+};
+
 static const struct watchdog_info ident = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
 	.firmware_version = 1,
@@ -261,8 +285,10 @@ static struct watchdog_device wdt_dev = {
 
 static int __init it87_wdt_init(void)
 {
+	const struct dmi_system_id *dmi_id;
 	u8  chip_rev;
 	u8 ctrl;
+	int quirks = 0;
 	int rc;
 
 	rc = superio_enter();
@@ -273,6 +299,10 @@ static int __init it87_wdt_init(void)
 	chip_rev  = superio_inb(CHIPREV) & 0x0f;
 	superio_exit();
 
+	dmi_id = dmi_first_match(it87_quirks);
+	if (dmi_id)
+		quirks = (long)dmi_id->driver_data;
+
 	switch (chip_type) {
 	case IT8702_ID:
 		max_units = 255;
@@ -333,6 +363,15 @@ static int __init it87_wdt_init(void)
 		superio_outb(0x00, WDTCTRL);
 	}
 
+	if (quirks & IT87_WDT_OUTPUT_THROUGH_PWRGD) {
+		superio_select(EC);
+		ctrl = superio_inb(SCR1);
+		if (!(ctrl & WDT_PWRGD)) {
+			ctrl |= WDT_PWRGD;
+			superio_outb(ctrl, SCR1);
+		}
+	}
+
 	superio_exit();
 
 	if (timeout < 1 || timeout > max_units * 60) {
-- 
2.43.0


