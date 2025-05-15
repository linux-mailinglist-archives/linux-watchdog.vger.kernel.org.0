Return-Path: <linux-watchdog+bounces-3508-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4250AB8F73
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 20:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7180216F3C8
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 18:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAC729B22C;
	Thu, 15 May 2025 18:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2KWIiPT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D128DF09;
	Thu, 15 May 2025 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335336; cv=none; b=oQ63J+dsPoxYtg7JJpWf/yqj9RWgK5Ln724d64BhD4OOh/zmMQDwQdofJ+32PZYJzp59RAenKz1fpnHWtW5Du4uw+x0rVrlKNPQbiRbEidR2pa0hoylH1r4fAqWavBAvFTZ7KaY3/CEvhdbjpzzdyuFCjn/5Eo4khe9LPJ6rwbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335336; c=relaxed/simple;
	bh=QbpS/kQkJJiwh5PckUNMqicAThM5PNWf6q83MVBs0Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHWrXsE/29Go5CxFBFFjDkeNwLJ7P5DGF8dXkMqfW7EMAQ/aVgJgLS/yK37u4Eo3Y1gxy3an/laEaXqRly0mTvrYfbzoPs7JPim7g88zK/m8PEiWmb8YeH5+3DP1m4eMHD2btucPN0Jdoca+vPGbZfVQa/bkweYHlbklQMv1zYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2KWIiPT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1560912e87.0;
        Thu, 15 May 2025 11:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335333; x=1747940133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89X5cDkgwMX67Wp+mdH+TqpQpjI3cSH5Pn7YIWEV0tU=;
        b=O2KWIiPTuzhYw1iCjjZ/n3vhzKfoYF04pYxQ2ZXnYRaFK/PBcccuBKBcuKzDxiNtGa
         0N9PJsprqb+T+G8rBh8gybzHOqXPqu8y+cCcwqKq+gkUiewQntZQ8GVRmFdjA9WEih87
         AtwD+OUZ7jpKC2E6rCXT6aaZsbz70XutPwrrfg8yxcW/HtJyU6WN2p7OXOM1xDwKcUoy
         6/GG3BiLvGh8NFu/iXRsl11wTxH4wxNsosmZL9rg0EovncUFSrQRKTUyLGfsIag9JwW9
         33J2Xn5/1o/ySY2Gu5aJC5DY5fvGETUTbH00kxY5NgHaaxzQA6vRMkQVh/TERD6miqXI
         XKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335333; x=1747940133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89X5cDkgwMX67Wp+mdH+TqpQpjI3cSH5Pn7YIWEV0tU=;
        b=fLzEnGigpVoclmu0PXnCCsjbpS8iah0Tq8Li7xTWxefPktp2iMir7+ZaOBB0+jMwV8
         AdPqE5Ga0OiX567adbbfj+ve/DokdQnuDNjFpsD4Z9E1N0xPifQVMmJawcC3+OW/WjJe
         IfBnbikushpiwvi+Ghg9eMO1PuUdr53V8iGSzdt3qhRG+AqxasI1N9PmTq9chVcVXN3D
         oaGtQie3qEKLq8XWljcMTTEwet6Y5/L5XmqvldDltdYhDNwG7vo41p0ggR4KwmQuFzhk
         wFQy/VwUmIU6saHL+AUkPd2q7JOgTeEs+PfR+/+LuEg8xfHCZSAOac/vDitL1UV2TNci
         aSrA==
X-Forwarded-Encrypted: i=1; AJvYcCUDpCGN9IKsPyfFXoXd7WqTTpMwkdLsF/X9EBii+Lj9rSkYT3C893Tq0IF3CNa8bV/F21WD6b2EVZpf2gyD@vger.kernel.org, AJvYcCVMbFeNqF3W7VDQJaGVa5jxUNXDXpxHyr1u0x2iaCiw/3w2UntbBZz6YItwoNuS5rXoxlVcFW64Tj5C@vger.kernel.org, AJvYcCXM4pbE453HGQZNL9b7nAAfS9qd3lz4NMbZPTB7ESWfTpZmoCI8WdyPEazlqgfIMJB5hoi15U/rdm5mBP/A8uA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwm2VTeJ1rkO5YIkWBx+jW39C71rbtYP4niCYiJ6xzKvSqY4f
	rijfWhgfQtPkcTS74zbQevwhHgeBQjRMw4QaXNqEMTTMahYo53Ap4Hhn
X-Gm-Gg: ASbGncvTcHqVVoXTJs/x7ELvtCgZK9JlQeZx75KnfS8SpGIuvZXfkj2gnHwZw0a32Hn
	xSd2koIaOqIxeiu+6K3ZuZ8LYE34VcPF5W2VYp2u8jtveYs49hITWEPkr9C5enLlSaarX0zWrRh
	YVTDlxq7EYsf2bFJkkV5kZ5mgH57LPVDK9Bs4WH5Atryh2oKnmcinGLPNIp8uHsgmdjxrujmiI+
	m4RJlN9UhrSZKz/LK1lutK/oOV8S9mOy2IDlTITkFBeZJP/q5cTED/kaH5ey1I3C1DnHX0ZTNVz
	BcziAAi/JktIkoYXmfeSgRBfiQE2NtI7R2zTXi5hHPFavMRLcHPvKVUdmmY1jLVm
X-Google-Smtp-Source: AGHT+IFXphhaPfRYQNVaaNL19dEd3OxAeFx5dTiTdykGmgZQ7ms0RJw5IjYe+nVQU2nwQqYh4pYpSA==
X-Received: by 2002:a05:6512:3e04:b0:54b:f33:cc16 with SMTP id 2adb3069b0e04-550e71b2359mr207965e87.16.1747335332811;
        Thu, 15 May 2025 11:55:32 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:32 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 21:55:28 +0300
Subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=4681;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=QbpS/kQkJJiwh5PckUNMqicAThM5PNWf6q83MVBs0Vs=;
 b=NNBbfD5AkIXlxdWKECjLPB/BWipzyhlLO3lQ2bGgNY4WpyUStbEqnzJqvlhuzrdozgq9Wdp/4
 Rok+ZGrpZS4BrkT3pqfAh/A97GspyxUL7USnY8hmvT2cWFBEYgTAV8x
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia system timer can generate a watchdog reset when its
clocksource counter matches the value in the match register 0 and
watchdog function is enabled. For this to work, obvously the clock event
device must use a different match register (1~3) and respective interrupt.

Check if at least two interrupts are provided by the device tree, then use
match register 1 for system clock events and reserve match register 0 for
the watchdog. Instantiate a platform device for the watchdog and give it
access to the MMIO registers base of the timer through platform data.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/timer-vt8500.c | 68 +++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..122cc046140d5e9edff20ff41a49b4e62064dd40 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -21,6 +21,8 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
@@ -55,6 +57,9 @@
 #define MIN_OSCR_DELTA		16
 
 static void __iomem *regbase;
+static unsigned int sys_timer_ch;	 /* which match register to use
+					  * for the system timer
+					  */
 
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
@@ -81,15 +86,15 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
 
-	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(sys_timer_ch)
 	       && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
+	writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
@@ -131,7 +136,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
@@ -140,7 +147,7 @@ static int __init vt8500_timer_init(struct device_node *np)
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -166,4 +173,55 @@ static int __init vt8500_timer_init(struct device_node *np)
 	return 0;
 }
 
+/*
+ * This probe gets called after the timer is already up and running. This will create
+ * the watchdog device as a child since the registers are shared.
+ */
+static int vt8500_timer_probe(struct platform_device *pdev)
+{
+	struct platform_device *vt8500_watchdog_device;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	if (!sys_timer_ch) {
+		dev_info(dev, "Not enabling watchdog: only one irq was given");
+		return 0;
+	}
+
+	if (!regbase)
+		return dev_err_probe(dev, -ENOMEM,
+			"Timer not initialized, cannot create watchdog");
+
+	vt8500_watchdog_device = platform_device_alloc("vt8500-wdt", -1);
+	if (!vt8500_watchdog_device)
+		return dev_err_probe(dev, -ENOMEM,
+			"Failed to allocate vt8500-wdt");
+
+	/* Pass the base address as platform data and nothing else */
+	vt8500_watchdog_device->dev.platform_data = regbase;
+	vt8500_watchdog_device->dev.parent = dev;
+
+	ret = platform_device_add(vt8500_watchdog_device);
+	if (ret)
+		platform_device_put(vt8500_watchdog_device);
+
+	return ret;
+}
+
+static const struct of_device_id vt8500_timer_of_match[] = {
+	{ .compatible = "via,vt8500-timer", },
+	{},
+};
+
+static struct platform_driver vt8500_timer_driver = {
+	.probe  = vt8500_timer_probe,
+	.driver = {
+		.name = "vt8500-timer",
+		.of_match_table = vt8500_timer_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+builtin_platform_driver(vt8500_timer_driver);
+
 TIMER_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init);

-- 
2.49.0


