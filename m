Return-Path: <linux-watchdog+bounces-2227-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC6B9A3334
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 05:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 352111F21BC1
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 03:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E06715445B;
	Fri, 18 Oct 2024 03:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXnGX5wu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4E3BB22;
	Fri, 18 Oct 2024 03:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220988; cv=none; b=gfgiDap/Uc3A0AiybQZ0YPuhZkC5KQxOsx/iCxpciJxTD8/fxtsPe1pO+aGbzYvcmWkpFjdo8d5tbwGELV69B7+s72/P/VnCX9RqNproAl+idnFkz3NuK00EbBhZ+6fFQMOvi+0gIkjUhH25jRe0s+OVqmPvIrKyFpxntzD1Fa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220988; c=relaxed/simple;
	bh=foRp5QU2f5caIkImzdrkyJfTD9yGojYhe/F8YSFpj/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qKQZhmQK8ApqMThqc4dOEKkjystkQF4RdcAWgjcpf2T5aVmgJNPRzizVtNidO8+WndYtxWyPfeUTeIbLENaQwK3v4h6DPDtiK7/fA0XHw2pa3aM/xbg8abjRhZ9cSinZUOL/paAmptTUEsNY8vLBy9uTVlcf2d5Rzvzc/lTzPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXnGX5wu; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-83ab52ca5a9so44323139f.1;
        Thu, 17 Oct 2024 20:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729220986; x=1729825786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oP2jY0xTdh7YQARGJI4kmni3ffPTG2A8rU5gOI1nBIg=;
        b=fXnGX5wuA9Sjx9euFBr8SUhhru1Nhs/aoL3Ysr3JmbG6Z2nLaxLJ/e7JAUC4qtJoFF
         vnQCdzCMXoLel5h6MolUlChV/EP/7THjepMa/1qI0TtkKiulrHk2gXmAroFGVpxbagB7
         hgdfj7iig6KAia7+eXfpMHmcInnoLPtdKOPCGc99MUs5qWsqlAKuDhaox8UQEvxgECKU
         epy6/2pkFvcYWcvmyuTuCe1f2qpNohiRtClsNBSb/MigCvxg50aHJK4Uj4oLDjo5n98x
         rT0qjabJVas/h503ViaPYespJFQ0D4ekfpxgL39jMWC6+yU7csyDwhU3py1VF7Q0wMjm
         p6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220986; x=1729825786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oP2jY0xTdh7YQARGJI4kmni3ffPTG2A8rU5gOI1nBIg=;
        b=vGnRcbpDbH1Qb270DF2zbO7G4XH/KT8zdCMGXYHkhLDs0VSA1phvADXQte/dSVLLn8
         mQpEbcCUoD2ZQscapIFtWpAxUvj5jPeHGmchU6S2asy75SU2B8NHzWqksFg/1HSA7gXP
         AY/f0Fxbb0OjfCG5Km/yYWONqW6G3j5fObz+Tfqc/VA0yJRtma5SJ9z0PeO92r7v7Fms
         3h2p3e14oBQ/jbThBb/e2cqwPPzpvcFewtzPNnWbOT6R3PHjOl/8ipY5sY48dSNb84wp
         MoN5LV4PNA8ILUVgyVHnq357TNPInUusiyhFlZTKJnTBtvamiT898fXKJ9jwfsbWoarG
         xU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRbpVIquWwO2a/mjj0kctJzJkQFTVylj4Cow1df6uSs4u0zDnSS0d1BMGklQowU8WFECkneAsd4dFQmAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjGhEv8yoHrjx+FH8r56W1l8kqjGqy6mtcFSDe2AcS2PZBe3d
	8GFbUw8XGbCmi62KoJUXeinhUJtPTX0e0gDLg3WHsfQGoq7bd6ZYP3c37g==
X-Google-Smtp-Source: AGHT+IF87PiMnpLnE9rKIEW0X8bp69J1Zl7i8qmv6B6UgrPH38sK5VNjlqTaLht/u+iX5kYwrs/OuA==
X-Received: by 2002:a05:6602:158f:b0:83a:b71f:1b16 with SMTP id ca18e2360f4ac-83aba66a877mr93486139f.13.1729220985162;
        Thu, 17 Oct 2024 20:09:45 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net. [71.33.159.223])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc10b8784bsm200877173.69.2024.10.17.20.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 20:09:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: it87_wdt: add quirks for some Qotom IT8786 boards
Date: Thu, 17 Oct 2024 21:09:16 -0600
Message-Id: <20241018030917.2540841-1-james.hilliard1@gmail.com>
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

For the Qotom QGLK02 board the vendor indicates that the IT8786
watchdog hardware is not functional due to a conflict with the BIOS
power-on function, with PWRGD set the watchdog will trigger but the
board will poweroff rather than restart as expected. Disable the
it87 driver on this broken hardware.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/watchdog/it87_wdt.c | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 3e8c15138edd..dec501c21fd3 100644
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
@@ -240,6 +248,28 @@ static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
 	return ret;
 }
 
+enum {
+	IT87_WDT_BROKEN			= BIT(0),
+	IT87_WDT_OUTPUT_THROUGH_PWRGD	= BIT(1),
+};
+
+static const struct dmi_system_id it8786_quirks[] = {
+	{
+		/* Qotom Q730P/Q8XXG2-P */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "QGLK02"),
+		},
+		.driver_data = (void *)IT87_WDT_BROKEN,
+	},
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
@@ -261,8 +291,10 @@ static struct watchdog_device wdt_dev = {
 
 static int __init it87_wdt_init(void)
 {
+	const struct dmi_system_id *dmi_id;
 	u8  chip_rev;
 	u8 ctrl;
+	int quirks = 0;
 	int rc;
 
 	rc = superio_enter();
@@ -273,6 +305,20 @@ static int __init it87_wdt_init(void)
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
+	if (quirks & IT87_WDT_BROKEN)
+		return -ENODEV;
+
 	switch (chip_type) {
 	case IT8702_ID:
 		max_units = 255;
@@ -333,6 +379,15 @@ static int __init it87_wdt_init(void)
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


