Return-Path: <linux-watchdog+bounces-3509-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F229AB8F76
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 20:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE14E1BC0FBD
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 18:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F2629B77B;
	Thu, 15 May 2025 18:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTN9/uSz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E01298CB2;
	Thu, 15 May 2025 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335338; cv=none; b=Ly3NQMM9MFZYxXcBX278wyTfa7ZLa5Nyy1T46N/v0+/eNrkP878ANydYP4KbtFbDLSnAXidSeB4xFQ6H1dr2nYws7LUzw4GkmiXW9/VqYtXtJJWsgPUGQlPfUNAvHJAohKQC8+bUYxqio5Wq+giChS8KzG3HZjD7sHZYx1hXJFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335338; c=relaxed/simple;
	bh=2XFRYiD91queAeJhWuLHIGRtox7ITgkji4UZkOxOnJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICJRjAuwV3dbXpIeYkewj2/+vuEJUTfxeQsnZmDw/FIh1Ij57LeqyJ+zsPuZgMd8SMmguyNz09KeCklx+xzN3DsIjLqSqE9qkATiVX+u5vZqI2zvgu6MxwohPQnz/LcftJWIuujmD8YXlLmO4Vum6HfSOV7cNOgQtNZDT5aiDak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTN9/uSz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1865963e87.0;
        Thu, 15 May 2025 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335334; x=1747940134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kWPjrBd/613IEnzahoCitSYpNjnmHuaFTPRIcMwrRo=;
        b=JTN9/uSzIULndI7E8oFaroP0xua9KObivcdelI/J+SFB2CYv0RlfXSo2mUX9eE8hoQ
         SyNl3YQGWWA2OvHzZhB9tsRaDNvUEfyybZxZWnKInbiPXlzuD/y2CmKTS7i8o8KvDwYD
         Vpv613FrgZTjm8VDG1rOkRtOf8PwZSZ+CoQhHp+toBywYMj1PI2vnMJQZDfIiLQGOa09
         yqZWLYwUdklVv+tZcSgE34VwkCf7tJT6Ns6sv276aMCuzqn7pWUSd26f/CE1OzV3Ews0
         fAOuB9AQ/c63VaYqmFw763fjX34qrlM+J3IHeGt5KYCjesi1C9ezvQGW2F8Q3yswv2qc
         HRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335334; x=1747940134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kWPjrBd/613IEnzahoCitSYpNjnmHuaFTPRIcMwrRo=;
        b=Ac7bqNhrJLW4F8ru1VKMltVWNpYwEFimGfuBOcuDAo/lmiTX9J4lP4brirBySmyYao
         q6aRb491XIlGM987c4UORlkcxJfzxDDwKyvkjNflMgZ2KfP783lHZpWEj4+TruKnSSlp
         ls6bZ340nvXMeZufP3txoDMUtd+G6CoHGq0GY7M/Zag2ewyztqzyRscUkBLXLxV3jYAr
         FaCu12377toHEbLUu+LSCVn03cWexUSBKFMsUrB5rEmNKRCNLFaLH66e7fKKRKmB8emg
         NKspR9QRdHc2arVB1VIn1gBdGKiQ09+fRnfJfKR0a2gFgrzn6Way4U9IGe9bh94++Hx6
         A1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVtLcofmKVoFQrRN0E8L3bSymgXalWAGnQTwngyj928UVyBWJnzPvq/iEtjQttCxOH4J95gLBhx2IrryZCw7hQ=@vger.kernel.org, AJvYcCWXoFplM64LOYx43TIlKm0DMp38f7qahNTrKO/zQg2HOv9Em8zKehUY9pfUUh8tB+zD7b24qDXwTnLF@vger.kernel.org, AJvYcCWnyStsf1lQcvYMtS224/LjYP45qb0SVTCSqjGZugcjtPhGVqpPTOLX+37aPY1ZMF8r7vq1Bc+wZPe7+8ED@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ynEgK/f9DNtimkYAZazzkNUNkK4irZESnnLpXQrxJDEW1aGW
	ihmiK+QdkzX4g6a2JUILwFlLsyTjv6E+bcOmqxqmCF66dLcPvs5Qap/q
X-Gm-Gg: ASbGnctHyzFKjf0Zgd524ZTJDddgofnaLQ5BTYNog3Hgff3j6CI1exnghnUrXjASk4H
	S+ciSUxaL6S/tzHuu/bmL7UQvyjffUKnjK4/p8MvR8C8bK0Ut5KCrNYlHk5GpdZvNZA7qGD52Y4
	bInDpxZfPQUo81X6/0nSPNfRr4cFuMMdvkfOm0QVBFx84loebH4HnrzwCLdszmVCI3NPzmmFJfO
	yBAhGwYlIC6I9GpYP4/yhKMVbn+FfDJWipyu4toy03EqZAXCXTK8x6EZQMZ1fSMFmzhPKFXFqb9
	apHSAPt0JCY0fNOdGjaKBon9Zw0xUX8fl1eBAMWnD/q8+RPRgcytBme1gcNEbOwH
X-Google-Smtp-Source: AGHT+IGEs4fWZGHCmoPX8DHxcqfmeaQBK7SGcY2ZAhMdx5ivNIe71+v8W7lZ8Ob1Opu59vWYlaooiQ==
X-Received: by 2002:a05:6512:31d2:b0:54a:cc76:ad5e with SMTP id 2adb3069b0e04-550e71981e2mr223781e87.3.1747335333916;
        Thu, 15 May 2025 11:55:33 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:33 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 21:55:29 +0300
Subject: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com>
References: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
In-Reply-To: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=6862;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=2XFRYiD91queAeJhWuLHIGRtox7ITgkji4UZkOxOnJU=;
 b=TCQO3le/NzI+O9M2LYnIFQZPy6L1dVDvBwVsgTeULw4pXLs/se7iBNx5Z11uwcTanQn+OeT+N
 PalmzHKo5kvAqLiKno6ziebxGbP/kUaEgcuoAV8Kx+bhK2dIPyFI6nq
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoCs can use their system timer's first channel as a
watchdog device which will reset the system if the clocksource counter
matches the value given in its match register 0 and if the watchdog
function is enabled.

Since the watchdog function is tightly coupled to the timer itself, it
is implemented as a child platform device of the timer device, and just
reuses the MMIO registers already remapped by the timer driver. This is
similar to the approach taken by gxp-wdt.c

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 MAINTAINERS                   |   1 +
 drivers/watchdog/Kconfig      |  14 +++++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/vt8500-wdt.c | 116 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8b2843491c47182a4fc6c76f5c29b6c411830a6..d809643b76ad299ca1c08804540b08cc4a7184a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3446,6 +3446,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	drivers/watchdog/vt8500-wdt.c
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..429e4e775f1f458fd457067a3a039a5d544b4818 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2003,6 +2003,20 @@ config PIC32_DMT
 	  To compile this driver as a loadable module, choose M here.
 	  The module will be called pic32-dmt.
 
+config VT8500_WATCHDOG
+	tristate "VIA/WonderMedia VT8500 watchdog support"
+	depends on ARCH_VT8500 || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  VIA/WonderMedia SoCs can use their system timer as a hardware
+	  watchdog, as long as the first timer channel is free from other
+	  uses and respective function is enabled in its registers. To
+	  make use of it, say Y here and ensure that the device tree
+	  lists at least two interrupts for the VT8500 timer device.
+
+	  To compile this driver as a module, choose M here.
+	  The module will be called vt8500-wdt.
+
 # PARISC Architecture
 
 # POWERPC Architecture
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be3734fe6e701f753d45b 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
 obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
 obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
+obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
new file mode 100644
index 0000000000000000000000000000000000000000..8e605c850dd9f42c90104f362b74adac63dd9fdb
--- /dev/null
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#define TIMER_MATCH_REG(x)	(4 * (x))
+#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
+
+#define TIMER_WATCHDOG_EN_REG	0x0018
+#define TIMER_WD_EN		BIT(0)
+
+#define TIMER_CTRL_REG		0x0020
+#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
+#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
+
+#define TIMER_ACC_STS_REG	0x0024	 /* access status */
+#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
+#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
+#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
+
+#define VT8500_TIMER_HZ		3000000
+#define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
+
+struct vt8500_wdt {
+	void __iomem *regbase;
+	struct watchdog_device wdd;
+};
+
+static u64 vt8500_timer_read(void __iomem *regbase)
+{
+	int loops = msecs_to_loops(10);
+
+	writel(TIMER_CTRL_ENABLE | TIMER_CTRL_RD_REQ, regbase + TIMER_CTRL_REG);
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_RD_COUNTER
+	     && --loops)
+		cpu_relax();
+	return readl(regbase + TIMER_COUNT_REG);
+}
+
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt *drvdata = watchdog_get_drvdata(wdd);
+	u64 cycles = wdd->timeout * VT8500_TIMER_HZ;
+	u64 deadline = vt8500_timer_read(drvdata->regbase) + cycles;
+
+	writel((u32)deadline, drvdata->regbase + TIMER_MATCH_REG(0));
+	writel(TIMER_WD_EN, drvdata->regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt *drvdata = watchdog_get_drvdata(wdd);
+
+	writel(0, drvdata->regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static const struct watchdog_ops vt8500_watchdog_ops = {
+	.start			= vt8500_watchdog_start,
+	.stop			= vt8500_watchdog_stop,
+};
+
+static const struct watchdog_info vt8500_watchdog_info = {
+	.identity		= "VIA VT8500 watchdog",
+	.options		= WDIOF_MAGICCLOSE |
+				  WDIOF_KEEPALIVEPING |
+				  WDIOF_SETTIMEOUT,
+};
+
+static int vt8500_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vt8500_wdt *drvdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(struct vt8500_wdt), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	/*
+	 * The register area where the timer and watchdog reside is disarranged.
+	 * Hence mapping individual register blocks for the timer and watchdog
+	 * is not recommended as they would have access to each others
+	 * registers. The timer driver creates the watchdog as a child device.
+	 * During the watchdogs creation, the timer driver passes the base
+	 * address to the watchdog over the private interface.
+	 */
+
+	drvdata->regbase = (void __iomem *)dev->platform_data;
+
+	drvdata->wdd.info = &vt8500_watchdog_info;
+	drvdata->wdd.ops = &vt8500_watchdog_ops;
+	drvdata->wdd.max_hw_heartbeat_ms = -1UL / (VT8500_TIMER_HZ / 1000);
+	drvdata->wdd.parent = dev;
+
+	watchdog_set_drvdata(&drvdata->wdd, drvdata);
+
+	return devm_watchdog_register_device(dev, &drvdata->wdd);
+}
+
+static struct platform_driver vt8500_wdt_driver = {
+	.probe = vt8500_wdt_probe,
+	.driver = {
+		.name =	"vt8500-wdt",
+	},
+};
+module_platform_driver(vt8500_wdt_driver);
+
+MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
+MODULE_DESCRIPTION("Driver for the VIA VT8500 watchdog timer");
+MODULE_LICENSE("GPL");

-- 
2.49.0


