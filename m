Return-Path: <linux-watchdog+bounces-2240-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164119A5777
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 01:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D3D41C20EDF
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Oct 2024 23:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCB612F38B;
	Sun, 20 Oct 2024 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EawY5epa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C967462;
	Sun, 20 Oct 2024 23:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729466677; cv=none; b=PkY8A7eQ+J6bHlzN5HFiwzERDXqRdUheO9OpzoJu8h3141fR/4w6wLpoBTSoDVzwVpjEb7AybJ21OdtgKTUk+FOtQ6DZB1GXr6VxQtuspNjyN8Z7GFr0buYtwHSbOf4iq2ZWy5zfOCnuAvw06SoJhZzeCo9mMeyJokmFNPQ8xEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729466677; c=relaxed/simple;
	bh=q5+6tiGuH8I+PeYq8sgTXcD2n3fv1os7KsHt4Bflnpw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J5nChgN6v6b3ZfFnNBd2ElizngSd7z28M5DX3phVC84s8q0RkjzI90/C5xe+KSY4Pj9kW8l/bLuYLTdqVgOH1SMBCYHCmYeS3eucHzKeUyw+VoECiCW2i2LEvo8W8/S/OUro3wpU00rv81K0wJkenyNu4DZJ0Bmf/LXXXKxoxZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EawY5epa; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-83abf71f244so69371539f.1;
        Sun, 20 Oct 2024 16:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729466674; x=1730071474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=42UobsR/0n1L8B+weH9JLBfiExsdGpMlCqPADTCaHGE=;
        b=EawY5epameUtA7CpnmT93c4ssplWsz61CbqlRALNwOusZEhqbE2wTN4id3ojoa4GdL
         uE53cuA4f1E3jT/6z1/nSzvAfyh4Z0KMamo1y2tXP76uHHRlkMyfp3QJTApn1JQ1CSHw
         a0dkTVJcOxidkKjdaWlQ2vzP+0nzJvmPhXznQDqqldcvRdHP06mFfg3OsG9XdSK/t6kg
         O2Xj07rt584hrDn19jbyIkk5nlNl7Gjn8azVKyhAGEy3WRnYgrsEYUnvI+6vXP/s0+bV
         qEAB1UQRattVDsspJ7Oarmpn/m3Pom+LsKldD3n5rxPoi3jbonOtRDTK/u+u21wwGq9T
         odSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729466674; x=1730071474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42UobsR/0n1L8B+weH9JLBfiExsdGpMlCqPADTCaHGE=;
        b=XCax3IX9KtoMLWYf2hYrHtrb0gwphDJJfVHI+1ITVQlPM9fX8iFmORyaZgC2RrZhS0
         zP6JV46+fDDUqu03YCoVwb+ZYEPVTyWeBDiXz80cbVaNHqQiGINbW8fF1jfe5iSeG5op
         ECZUW7swwZRF00yBl+/cIw73bD7oyQaIfMwt9ZWoXgLVBlDMtot22+sCDK0Eo29UB3l6
         q+TLjbAlhWveLwcai6lJRWVqys6YDNFQOLiq7DLwbcugBDxBsePlKTlm6RYOgMm50yB4
         MyaF45l0BIzBpskcNLCctc4eDcrx5dTP4d54lr4awidR1zp8IZPAqjesNspnkw0drYjg
         C3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCX3hfORSiF3mrQuWau26pubhL75PEwf2JTWtcGiUiq2EhHZ275YE9DxKgEH4dTSP41RSSP6+7fd2YNli8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJnU17kx2vzfqvfMTzWMYt55kf1NxEFU7h7+8yFNPMhEINgBtT
	aa/fqcmviPIp/EYno8Sx7fwl3+q9iVMGYldQuXCipVg9VCUTxpkv1TdaDQ==
X-Google-Smtp-Source: AGHT+IGcwFuqv1ztuvUGJOKLdPLBdimn6j8jJ0kHEZTzIMBAmr3HCcByglSxIkc63LSMeJg3hlaNMw==
X-Received: by 2002:a05:6602:6343:b0:803:5e55:ecb2 with SMTP id ca18e2360f4ac-83aba2f9a3fmr795577939f.0.1729466673915;
        Sun, 20 Oct 2024 16:24:33 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net. [71.33.159.223])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83ad1dce129sm67506739f.34.2024.10.20.16.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 16:24:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
Date: Sun, 20 Oct 2024 17:24:09 -0600
Message-Id: <20241020232410.2576778-1-james.hilliard1@gmail.com>
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
Changes v2 -> v3:
  - add linux/bits.h header
  - check for quirks on all it87 chips
Changes v1 -> v2:
  - remove QGLK02/IT87_WDT_BROKEN
---
 drivers/watchdog/it87_wdt.c | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 3e8c15138edd..03274e48e834 100644
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
@@ -240,6 +249,20 @@ static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
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
+	}
+};
+
 static const struct watchdog_info ident = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
 	.firmware_version = 1,
@@ -261,8 +284,10 @@ static struct watchdog_device wdt_dev = {
 
 static int __init it87_wdt_init(void)
 {
+	const struct dmi_system_id *dmi_id;
 	u8  chip_rev;
 	u8 ctrl;
+	int quirks = 0;
 	int rc;
 
 	rc = superio_enter();
@@ -273,6 +298,10 @@ static int __init it87_wdt_init(void)
 	chip_rev  = superio_inb(CHIPREV) & 0x0f;
 	superio_exit();
 
+	dmi_id = dmi_first_match(it87_quirks);
+	if (dmi_id)
+		quirks = (long)dmi_id->driver_data;
+
 	switch (chip_type) {
 	case IT8702_ID:
 		max_units = 255;
@@ -333,6 +362,15 @@ static int __init it87_wdt_init(void)
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


