Return-Path: <linux-watchdog+bounces-3561-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936FAABF53D
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 15:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634843AD386
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 13:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B2427055B;
	Wed, 21 May 2025 13:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eqj28pWA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F401B95B;
	Wed, 21 May 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832469; cv=none; b=LIy4kfx+lA+C/V5kVjSq1f1KaDaILe8OrnjxcX63GGlQtNxliHzMfXDxh/l5eHvqk82gvUzTgTeo3UY1+x28A1Ie/tQ/iK5F4y+1eoKy+gw2JNN5+ecExw6IZiFP/yGJsNQ1urzQMqZx55sFNxbBMnSOcHSYgiGZmNqHuXtWdv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832469; c=relaxed/simple;
	bh=fg2O/NiYrG5jnAySQDhAJUCwCiNOphjw1AELvkeniPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPJitPlnQQSUmTceI1o500ulwwnknWNG0nVQD8ryUjMk+u5+zexXBayUbfxIxMXEf9oaVPCOlN9SApJ40mH1quxGYlF4epfGoVR7ighzesXu/kVfpOZkd5Tb3DGt9pO70O5qAgu0YwiEhDyx1gu+UGFCtBikmar2JCSNpTCNEZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eqj28pWA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23274dbcbc2so20333415ad.1;
        Wed, 21 May 2025 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832467; x=1748437267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUsodPmJtak7dzPlFPK8l9nfS7vdyCUD4wkq3fhB9qw=;
        b=Eqj28pWAZM7809XH8DfVwrHUqBTrUkXXQ9BMK+fmCruq8W1firH4+xjNzVXjtaRV9W
         sCa4ED/b1Cl4tuCBQstWfxiH4HBnKHN9vbdNw9mT9lSvMkOs6OX//xEWeMJv4VuLYnyA
         sCsvjHnrInk5Lk8HvY5bDU4vxv109mZ+mwEqKmot7siXsOkHa8hTbJiUqymhUkDZCMWU
         rRAL2YO+/3cxtqDygU7XVDE+ilQZgy4qJfr7LP6yVFVa95W+Ef4bf+InAupk7D0il+E0
         /KNIZ8F7DzaQGmzir3Ot4EzSOaSI9xHyEqb9ML9CSGxzxlYEJ1NULuMBbuyRdNJQKBa7
         zpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832467; x=1748437267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUsodPmJtak7dzPlFPK8l9nfS7vdyCUD4wkq3fhB9qw=;
        b=KENEtiTpxGjLA+jxm/9ymSK1lxDV2dP6q7aymhm0jWV1EEgECmato/lepC2XzECC5I
         4RZz3SIJZa/JfO9Cjqg2A4XyCzn5XE+Mf2HM0sK77nUS4IZexwRfTpv2iV/ZFq5h3XoM
         XZQ7q6k2kHa3TDN42vK18BoSJEXBYsMXGYprYJt45Mqcb2/GBEsa+SL88k4vmMIE57ZR
         5NTdE3v95kWLYhIkFvAcxL4Z8x/QXxYE/PIaVyXq5G6g3MLzs3KxbMNqAknoHK8m++2O
         7LXRxyLDL1707I87EKV4VLA2zCiUijd0VUzIrpPvbba/7O0DZqjq0IIYviU8L+wPr48v
         jIuA==
X-Forwarded-Encrypted: i=1; AJvYcCVTH8hFLkGw372IoPpQ81XbxPnm7YR/kdNNeRodIkUr5w2tpvvrRxYJHOtQcuPCk+dvohI4DehO2NRQNHIW24A=@vger.kernel.org, AJvYcCVnKq6eX3lqIwvmtNX3T+6RYcFXwqSBTu7oCp2na+eZHAxSTHdx4IKh+DMH4Ztuev4+4tUJNnTZZpH0@vger.kernel.org, AJvYcCWH13AcseRAY6gWsqdabTVQHbpmNOgGfQFqDsdE8fHi7WsWFpz3c/cs8j+la5KUTkULPxmETF0B2x50lLrz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwe70r0SEMV1D56QYo/62JTflH2XoJSkWSn5kDXoD0jkgexRh0
	keLule54OKceMD4le0EXbHcEGaNDBAMACp64f0qeu6kK6rcOnqufQLEb
X-Gm-Gg: ASbGncv6gWSf+4Vd1b+XMn3KaDdDdBhqG/JdMdYurx9qARdiczVB4KkTFDEpJGfkx/d
	szHE7cuoarbSvS+R3/2YD6jbnZy4PEnm5jXvUe/petbl91K2XU3P7F2rOoqoEyA41uRkKlsGLP8
	DKfgnA7Z9Ckrgb2iUAUjhOYo7TtYgIGQchFG2ct9cmArjEZMPtp5zk0xFe6Q3xnU2hIQOb/ZGgZ
	HmJyVven2q839vpwatjRHLjh9Hbd9t56iDtVHctpmUHivrVZjeBofJxkKHyqm7By4QNcdPmVCAm
	52y/x2etrerqo6v8mqUpj5MBH1sAGtALiC46fa5yKsDwJJ9e0OMLFkDDQmUmYaQ=
X-Google-Smtp-Source: AGHT+IHi9JKW8hrJ0oTUZGRbjiYsmE67PwWiZFYcvvLI4U1V7ygYEi+JkVupxNUINvhANVgU2PeZAg==
X-Received: by 2002:a17:903:2284:b0:22f:b25b:8e93 with SMTP id d9443c01a7336-231de3b9f2cmr307998035ad.48.1747832466871;
        Wed, 21 May 2025 06:01:06 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm92691165ad.53.2025.05.21.06.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:01:06 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 17:00:12 +0400
Subject: [PATCH v5 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v5-4-7e4bd11df72e@gmail.com>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747832426; l=5807;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=fg2O/NiYrG5jnAySQDhAJUCwCiNOphjw1AELvkeniPk=;
 b=lPyHbAc5NFVsW+VOhQpf2YBYDPTf4Ebr3BvqCdjt0B+TlJG5YPcpy/khytwwsZQyC7Hi/lIy3
 NeyS5Nvh+ayDb6Z7dhbTmUqbOjMp82ryHbvz0/v7CfcGs3yxL+GxZru
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoCs can use their system timer's first channel as a
watchdog device which will reset the system if the clocksource counter
matches the value given in its match register 0 and if the watchdog
function is enabled.

Since the watchdog function is tightly coupled to the timer itself, it
is implemented as an auxiliary device of the timer device

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 MAINTAINERS                   |  1 +
 drivers/watchdog/Kconfig      | 15 ++++++++
 drivers/watchdog/Makefile     |  1 +
 drivers/watchdog/vt8500-wdt.c | 88 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556260662dab469ed091 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3447,6 +3447,7 @@ F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
+F:	drivers/watchdog/vt8500-wdt.c
 F:	include/linux/vt8500-timer.h
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..2e59303306feba7e15a015c2fce25b1290dc4cbc 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1115,6 +1115,21 @@ config SUNPLUS_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called sunplus_wdt.
 
+config VT8500_WATCHDOG
+	tristate "VIA/WonderMedia VT8500 watchdog support"
+	depends on ARCH_VT8500 || COMPILE_TEST
+	select WATCHDOG_CORE
+	select AUXILIARY_BUS
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
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
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
index 0000000000000000000000000000000000000000..a47ee714e7c0172e89a31b0d6c064fff338bd5b6
--- /dev/null
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+#include <linux/vt8500-timer.h>
+
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+	u32 deadline = min(wdd->timeout * 1000, wdd->max_hw_heartbeat_ms);
+
+	/* The deadline is matched against the hardware clocksource counter,
+	 * which is a u32 value incrementing at VT8500_TIMER_HZ and continuing
+	 * past wraparound. When the return value of timer_next is greater than
+	 * U32_MAX then the match should occur after the hardware counter wraps
+	 * around, thus we take only the lower 32 bits of timer_next return val
+	 */
+	deadline = info->timer_next((u64)deadline * (VT8500_TIMER_HZ / 1000));
+	writel(deadline, info->wdt_match);
+	writel(1, info->wdt_en);
+	return 0;
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+
+	writel(0, info->wdt_en);
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
+static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *id)
+{
+	struct vt8500_wdt_info *info;
+	struct watchdog_device *wdd;
+
+	wdd = devm_kzalloc(&auxdev->dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+
+	wdd->info = &vt8500_watchdog_info;
+	wdd->ops = &vt8500_watchdog_ops;
+	wdd->max_hw_heartbeat_ms = U32_MAX / (VT8500_TIMER_HZ / 1000);
+	wdd->parent = &auxdev->dev;
+
+	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
+	watchdog_set_drvdata(wdd, info);
+
+	return devm_watchdog_register_device(&auxdev->dev, wdd);
+}
+
+static const struct auxiliary_device_id vt8500_wdt_ids[] = {
+	{ .name = "timer_vt8500.vt8500-wdt" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(auxiliary, my_auxiliary_id_table);
+
+static struct auxiliary_driver vt8500_wdt_driver = {
+	.name =	"vt8500-wdt",
+	.probe = vt8500_wdt_probe,
+	.id_table = vt8500_wdt_ids,
+};
+module_auxiliary_driver(vt8500_wdt_driver);
+
+MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
+MODULE_DESCRIPTION("Driver for the VIA VT8500 watchdog timer");
+MODULE_LICENSE("GPL");

-- 
2.49.0


