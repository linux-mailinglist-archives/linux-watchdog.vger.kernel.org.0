Return-Path: <linux-watchdog+bounces-2236-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 060939A42E2
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 17:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62CDBB220F3
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 15:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E800168488;
	Fri, 18 Oct 2024 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdXUFN8+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD11201277;
	Fri, 18 Oct 2024 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729266556; cv=none; b=PYRfbPjL2qkYjmo8wdxKL+zUFEjzpb9utwCmHjgpg7n9g5jlLsAoe1wmkQTDzipR1TslAjpZ4gMCwqvlOOYe1bMlfCakzBbXx1sKw4X/z+mR2KW22rLCdKTxb5bV1FrUYSWaFNt6R+6DPvTXDHeFNpY1mBjauLOZouqzVOct+94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729266556; c=relaxed/simple;
	bh=QER7MzGUAJpRfZBJfsxztm5YabQZp5nYIScBZTpOcLo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pqc5ZRYhzijTsLHusYb9lJjqq0XjneSwkTPNO4kHkFOSlyf52ZrNMJ/dP5jKrbcrLhd5TQp2cLnVc48qnPphSkV+SZgIwyuQugJt6/Ve9s3MU34P1/7iB/VoRSVb4JkD+S6lw96Dtbz4pMIBF9yznVpIXZI0o8DRNfA+IoIcsF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdXUFN8+; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a3a3075af2so9574355ab.3;
        Fri, 18 Oct 2024 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729266553; x=1729871353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxFLoMYM+V3NcfNE9D+d/B3L4jAdzp2sOmHVYldmzOw=;
        b=fdXUFN8+SzLsvRRqyTG5m6O/uwD0NFBUaKxNSB+N1itlcDOizlhkFReCDCvszWX3fq
         yLptTWeBaxfBpzHlMc+Prv3Mn8v0dCOhi7o2B8/bp7jxNWlJDagcq4ZSj9SJ2XOB7/CQ
         rR6d+TI4EHi1sv6Kiz9AvbqRGXVAdRQlwcoYlRUEaJqF7CcGAF0TqhXGJqTVa2fozZle
         8+ai2+QcBjz5fGXjRzCYg9j4QesSNlMDv4YJEwSVrxmM/TQdZ5LLa1bhQF2ks6IldWg3
         nFl9PRpDu7HLk7E7siFRxF9NMjsJ7GQBvphTGtFC1brgu82koFbaVCofrlsURNyzWyle
         3kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729266553; x=1729871353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxFLoMYM+V3NcfNE9D+d/B3L4jAdzp2sOmHVYldmzOw=;
        b=dazaAyjZpi9oWPIqN00Y1RUHZytc5qYFRX6HVyieWZ1wWDYroV1Kxv0RfDOBDBPVdS
         mXwoZQGhuzVsA6VeatKeDJB3sBFhboG8laNfyK+hRhoFSHIn2OyvSjFQLLVc+x2UihVk
         2Pk/twz1vUp0ehgIo0H7ND2kr4MqY2AUzJsgS2T46bZSihh52uaBiPbwg/6s6WS7012y
         l1f8/qWu6lUi/DE6kivA9mjD4mrbXECzhGmBxyP1ugOd8oLEjq71f1bpcRfOs/BcV4nv
         uSp3/D/AgFVgPeztTDZXs/h1kDTXNn+irH5xnwLDDNviQOZUYRXF5u8Z5AlN6roaK++U
         yuCA==
X-Forwarded-Encrypted: i=1; AJvYcCVn84oVir9Y4qh0lZPh7qvs1w41c5qtjkCxcjVkzruhhfyT+IlOWpLHKwexby52dd3Ht12lOpqZegiA0dU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoOl3slVX3LeUQrjhB6iI50GyBqOubb3zKeD+tV6Fp3OJdgYUS
	MB2gNNUY1BKCgayNAjTWd3RweYtOr8X6n3z0EIj1hxmyUl4LrTHoa7Dnww==
X-Google-Smtp-Source: AGHT+IGoLHIJ2W7YhUdX2nlyQCBSdRi5MU3uEMU9aush3FFld5s2QUqATyX5FzeOvGuVbw7+TuiI5w==
X-Received: by 2002:a05:6e02:1d85:b0:3a0:a4ac:ee36 with SMTP id e9e14a558f8ab-3a3f4046be7mr27632925ab.5.1729266553083;
        Fri, 18 Oct 2024 08:49:13 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net. [71.33.159.223])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a3f3ff7b7dsm4507865ab.52.2024.10.18.08.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:49:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
Date: Fri, 18 Oct 2024 09:48:59 -0600
Message-Id: <20241018154859.2543595-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the watchdog timer to work properly on the QCML04 board we need to
set PWRGD enable in the Environment Controller Configuration Registers
Special Configuration Register 1 when it is not already set, this may
be the case when the watchdog is not enabled from within the BIOS.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - remove QGLK02/IT87_WDT_BROKEN
---
 drivers/watchdog/it87_wdt.c | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 3e8c15138edd..b8be9af065b2 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -20,6 +20,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -40,6 +41,7 @@
 #define VAL		0x2f
 
 /* Logical device Numbers LDN */
+#define EC		0x04
 #define GPIO		0x07
 
 /* Configuration Registers and Functions */
@@ -73,6 +75,12 @@
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
@@ -240,6 +248,20 @@ static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
 	return ret;
 }
 
+enum {
+	IT87_WDT_OUTPUT_THROUGH_PWRGD	= BIT(0),
+};
+
+static const struct dmi_system_id it8786_quirks[] = {
+	{
+		/* Qotom Q30900P */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "QCML04"),
+		},
+		.driver_data = (void *)IT87_WDT_OUTPUT_THROUGH_PWRGD,
+	}
+};
+
 static const struct watchdog_info ident = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
 	.firmware_version = 1,
@@ -261,8 +283,10 @@ static struct watchdog_device wdt_dev = {
 
 static int __init it87_wdt_init(void)
 {
+	const struct dmi_system_id *dmi_id;
 	u8  chip_rev;
 	u8 ctrl;
+	int quirks = 0;
 	int rc;
 
 	rc = superio_enter();
@@ -273,6 +297,17 @@ static int __init it87_wdt_init(void)
 	chip_rev  = superio_inb(CHIPREV) & 0x0f;
 	superio_exit();
 
+	switch (chip_type) {
+	case IT8786_ID:
+		dmi_id = dmi_first_match(it8786_quirks);
+		break;
+	default:
+		dmi_id = NULL;
+	}
+
+	if (dmi_id)
+		quirks = (long)dmi_id->driver_data;
+
 	switch (chip_type) {
 	case IT8702_ID:
 		max_units = 255;
@@ -333,6 +368,15 @@ static int __init it87_wdt_init(void)
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
2.34.1


