Return-Path: <linux-watchdog+bounces-3552-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40EABE465
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 22:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 625DC4C1BF3
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 20:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2379926B960;
	Tue, 20 May 2025 20:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZZnJfM/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FD288CB7;
	Tue, 20 May 2025 20:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771358; cv=none; b=hyP6mObjSbELJdWENNnLY+3MiJUBjBsHzSm5Vx0fUhdirQ6o1/YxF6FVNfjHM5S4XysG+aaszojHi+e3uxv0ijRDL+1wXJ+u2c9NfXmzB/vv9MSgAqHl8mBlImvnvIYq7ayWbq/DNZoLZ1wsbEG+2sRcTAgWFgIG+TKoiiHgCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771358; c=relaxed/simple;
	bh=qeLngx3703X+Z3T6OTmsiw5w/nGbO6F+UA6hRWuYz9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXFi0qeVFUzk4eJvG/9sgAOItnle/Zdwt7gFemlPkEHVdSpaThiFXdbrfoKTBmImblBd56ridUZItU2YXAXRF/9I9hMse6jacwyknQyoWpb4cD4hbi0B4cTuZGq5syt4r/xqCQ8xgLq57yGkRbnXSBwRpG7Hj8WyASnC1wdILKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZZnJfM/; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742b614581dso4570715b3a.3;
        Tue, 20 May 2025 13:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771355; x=1748376155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OilI7sycFnkHdmKoo1s8NQ3T9dco8FEq3kcJbQef9xQ=;
        b=SZZnJfM/agtJ/2K6aK9B6aSfpjT9jr6/1dZ3SHAq8MT0FoOUQSzzoAaHHURE9ePMrE
         BUtwb+J6T10Ng7edeGhMB67TlnLY+BCsJ0UxesLAEblbyb+n0q/iuSh9hyycWjf+qvoL
         6adY7/GY+F9xXdFIT2Gq1WA4Wh60zgU8D0rCWR+iFze9QDkBmJEp04nW6N4qORUujshn
         jMcNL5LENlIZVyJqqElH93VnmljXV0ue/BE2VHZBYK1pE7ki5mCzDK9Q6KNdxN+eNTdV
         7L45IzHrRe88pbxQDf9hsXR+Cq77r1CBzUySprlqY4T+VbrWPmumRlO2u9RpFYRtE8m5
         zmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771355; x=1748376155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OilI7sycFnkHdmKoo1s8NQ3T9dco8FEq3kcJbQef9xQ=;
        b=h/DwTcxAg+GyL8MFJbbYUXACFFEX9EZsUsGopdMcc3opWeUpimFt683NaYsFkgoSKf
         37To0W9HGubkps1BPCRebr6IL/SMTQNp5ScCnvEhL4aIZYgZmh5HLwzOBnPyQIV32Wt2
         f7Ad8zPh5b45mALODmVWaeWoLrmm9cnozISkJksjXS+3wgLpATXsO2l4Qr7iqoTDcTJw
         X/tayb7WGJsZ+B6nRJq3ELMztOMI74h6/fS6ABJbbOITK9VFm0v7ei+YhFWiKCrDAmvO
         tAkYdT91bdRyvz/t1PVm5R/5jisC7WesU4ULIBKrg4EuBlQqquEtdn6W7gmzxGu3O9VM
         0LNg==
X-Forwarded-Encrypted: i=1; AJvYcCVUH8m5Oue0hVloZLC98jYIQXYjixrKwI9oavH0n0rKyUo0wAHLKHT+9fSnsHbU22aRs2cip+sRna+QykouHvk=@vger.kernel.org, AJvYcCVtgKGlX+4B6tLgC69GzQ7QEHBbTW+4LzfpQl/rdEVgGTKa4DUVKEmr92ruGvO1c55GqXo09KLUviaS@vger.kernel.org, AJvYcCWnemXXA2Es0qMSUExRD8eDwF8+5u/70e2eH4kzBz012AANpnRDJ8+/GtcWzVw1pZjIP2Tk33/R+pdQCkp/@vger.kernel.org
X-Gm-Message-State: AOJu0YxkhTcH4u+e61nGmMvro/5NPr6Lkj9XCiAj/YsnJc1W7fIW05/i
	xD9yl4vnjEPJc836AX1sEMOvubuSdLRg631O4LoMu3QIJxJIMQctfwlJi73yc7h/H4g=
X-Gm-Gg: ASbGncuo0/PLFuavUBjUmeNidMGDeIA2JfUSc5m0fqaElne3zXdU+T2lqR9l97AQSqs
	xxwmiCY2EDN+enOhX5F+MO3U2Juq5w7/4CzxAoab9Uptu7BTn858BvFXEweWDoY1+5qCqp5euL+
	J7TXkqUSP/GIMA9j/CD/RIPT7mxfmjkBxJ3X3wT2N7xQ9+oWTQEuyCsxHBUo9/FBZ9W5GnKUy1C
	VwRCUxEvtJV4gu3kptPnqtZNXyfZcFeaYDoZW+j9yZEVT0SUUaoPwHDQWVvMLFqvg55D/BdOgXZ
	Rmjp0aCiwM1rxk9x+z29FQx5MJjVtPpQqXsWxlJE/rJFInvXXdcryrJWXKiInaw=
X-Google-Smtp-Source: AGHT+IEhswQQobet3SESatd0Ctpu3CzAb+wp/b+kOVjsj+yXjzeVIvW0SymyOexlFvQlNXrXVnoyHQ==
X-Received: by 2002:a05:6a20:6f8c:b0:215:f519:e2dc with SMTP id adf61e73a8af0-2170cb25042mr26000159637.14.1747771355447;
        Tue, 20 May 2025 13:02:35 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:02:35 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 00:01:44 +0400
Subject: [PATCH v4 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=5323;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=qeLngx3703X+Z3T6OTmsiw5w/nGbO6F+UA6hRWuYz9Q=;
 b=E9764OMTvoClSJRuZ7a/FQ8x0MgaPIWF+b2u9p2Kz7GTxhjaJrF7IO8KAdCNGK8Pe5jJohMLN
 ZuEitiKIh3NDdywXAKwsst8un4CHZtcsI0DSGnvdnIblGrV0iZNwYlO
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
 drivers/watchdog/vt8500-wdt.c | 80 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

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
index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97f6e3ee868bd3bf1534a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2003,6 +2003,21 @@ config PIC32_DMT
 	  To compile this driver as a loadable module, choose M here.
 	  The module will be called pic32-dmt.
 
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
index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1d28e955f00bef00e9db
--- /dev/null
+++ b/drivers/watchdog/vt8500-wdt.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+#include <linux/vt8500-timer.h>
+
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
+	u64 deadline = info->timer_next(wdd->timeout * VT8500_TIMER_HZ);
+
+	writel((u32)deadline, info->wdt_match);
+	writel(TIMER_WD_EN, info->wdt_en);
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


