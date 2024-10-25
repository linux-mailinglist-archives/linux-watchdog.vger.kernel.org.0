Return-Path: <linux-watchdog+bounces-2306-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E569AFA12
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2024 08:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1967C1F21DB5
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2024 06:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FCD18F2F7;
	Fri, 25 Oct 2024 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es4JsFK9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBFB18DF85;
	Fri, 25 Oct 2024 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838096; cv=none; b=A4kK8UDJk/6/lzW62c3cU2rM0qeIc3k2RUABzHiLPaxLJS3LNMeOJxanQZx3Vlv5dYEVvk439XgDe1EvEyJBOb2BSRzV0yd68J9N42iGK6d8t6hlgvilhEfaBrWRgX1Y9AqHAmsETBpwnJUlJjTghP0ExVyii6vf5k4WTEWvCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838096; c=relaxed/simple;
	bh=M/+x2mpWZr7PBV9kF6t/mireJ1mJlWQCgAnedpEA9bk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EGkKiYcOwLGC/o9WjOWtUwENHPDaCm4K+TPh/DgDjpT17J+QGnGZe5UEdVwOkXVFy1Ekh44QPGOgdTJE1Y0SlDOvyT1SaCwnrYd4bLgimOSQ/ERRyTWfTEgOUCLeEWeO5SiXV5FXnmhLfFuXEv91AKxBaa7C3W2btpm/7abykcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es4JsFK9; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-83ab694ebe5so67985939f.0;
        Thu, 24 Oct 2024 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729838093; x=1730442893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWYBRj6CmYkNb42zlkk4hhoqwzra4+EVY46cpjPSL4o=;
        b=es4JsFK9e2gBBNm6hJoNvJpvf2kMglxUfmHq/5Uckc6blY0eRxk/u2TnG0/ubJCY0x
         O9mcw/uClotqR6tFIYPscY5RfNyGIREqAMTLn25Zcw+7cgMCAJKuVLHMfpxsX20gCmc3
         1RWlty0bOpy6WYy38yVxcY9C6MpvNDlCzzvH1bh97wbSiKmP73b68DiswhgrHyyyCe41
         D+zxz5AT511N8hYPjvlum0t42DIMGebBGb1/pib7JNVyHldPm75CGGsp0WRoUq0AoR2R
         nn2LQ39veklTmRNHhXTo8nE3bYo+Xop3guGaLRW4vFItAqCZd6gE+99s7ehjVLx2jmWi
         B3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729838093; x=1730442893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWYBRj6CmYkNb42zlkk4hhoqwzra4+EVY46cpjPSL4o=;
        b=cCvqNQ5BEW/Kc8QzvI5abQxY8Fbo5f3tlvivfDD03f/8YG9hBCrKzi7CEcuBNf4wn8
         WZKWzN3kK0C9x/rXm9JWZaRobdj+0NkOBGp4+xeMbNgtawiLC0rZROVcnnUI8BGfG6Fl
         tUAgBpn3K4Y+akyr9ikxUWqXThKFKivGnzV5b/sjvCUzbVjsxEUGssrpX3cEq6vCsnUO
         6G0OLsqGgPD1ihdEG629hdNkHXuJ/SLX/BygOPffv+B32mSfwzq4EQ4Xp7Mz3fbjQJtV
         J2Hk44HLn0b+/DupM9acR3kZ/g7RmUOnhQ7ULLwno83EieYm1iC8c9ih9JRpXC935pBI
         Femw==
X-Forwarded-Encrypted: i=1; AJvYcCUoC9XumpEWZ4fleJXrFLrhl0EsbUPfxnGPT06jdWZukOYKsY9FSi9D7jGi4dV2KimBKAXhMAtpwc3HguU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy505ro2LFqP4C7kye+BE292BZIT+8q3mdbqnVpIrqQzvwFfsJB
	T1O7BAmsX9GpFcd7bvDp+3GffpefMPVc0qiap/0emynWJcHgGEQrBw/M5w==
X-Google-Smtp-Source: AGHT+IGh1Va6/7C51TeNjaOekWAVBiwKThLFEX1TZYMT0N26+Q39IC98A2k4YsqYgpY3J5CNtkrknA==
X-Received: by 2002:a05:6602:14c6:b0:82a:2a67:9429 with SMTP id ca18e2360f4ac-83b0401bc85mr535279939f.5.1729838093543;
        Thu, 24 Oct 2024 23:34:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net. [97.118.131.57])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b13804ec6sm9807139f.32.2024.10.24.23.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:34:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
Date: Fri, 25 Oct 2024 00:34:40 -0600
Message-Id: <20241025063441.3494837-1-james.hilliard1@gmail.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes v3 -> v4:
  - NULL terminate it87_quirks table
Changes v2 -> v3:
  - add linux/bits.h header
  - check for quirks on all it87 chips
Changes v1 -> v2:
  - remove QGLK02/IT87_WDT_BROKEN
---
 drivers/watchdog/it87_wdt.c | 39 +++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 3e8c15138edd..1a5a0a2c3f2e 100644
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
2.34.1


