Return-Path: <linux-watchdog+bounces-3507-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A295AB8F70
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 20:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B85213BCB3F
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 18:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C96298C37;
	Thu, 15 May 2025 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcgJ6W5e"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A36C28AAE1;
	Thu, 15 May 2025 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335335; cv=none; b=Tm4sHCFhljgTfAZXRpd77PLwDsv+1N//G/sXtIXNMQByOG8kYkdZKz38m8a/ZSJvbIImyIYi7iHPtTMwAqNTjRcHwfd2zCuY+GoKHoAvlNJJf7HctyYYRZC4/RYxzqC44SR2Zvw2fD49n9GzssNVRYvteyi+rk23681ngmzd71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335335; c=relaxed/simple;
	bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTlOl09Jf30z66TXLaa4/osoinKKQHghZGn4GmUG30cACsHTuIIPSbwMZZvWZ/vx0gEV94gUJv9pJY6gZhXcgu1XtzL5/gDPU7MdZUDGMclnMMv+h5ysFHPXd9pPTORbqGtKVkhVp21p7pEKAUbThribAgr6ty6jrcJgwZlhnjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcgJ6W5e; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54298ec925bso1873553e87.3;
        Thu, 15 May 2025 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335332; x=1747940132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=LcgJ6W5eChWX28qT8zq85zPjd/BZxawfJCAjGJILnZ8h8is/VsM4FWRefrbzU2YUbS
         bz4UsC4lwsIAR6CMnaigbVwLnC//fhTP9gTJMiERX46N80NSqLcoEcuckMtK8Lx9FDTe
         2+1Iv9E5gGZOh3DqJEJd02dh2pamRSyMxh5gZgCrwauEk+p7fa2P1WtdFBFjByA4t4e9
         /9rq4euSoFI3O7qXYG3gP6paPaIYnSaVc6B0IdPB4huPh5eUBYA+6ctg/K7jTgpyhk7+
         fwerbjJz8u/yaUuQmfQ3r1rrN/Qsxme4OMRuLQzNujkgvxAUEPiS+9rfd0jORMRMb3M3
         BtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335332; x=1747940132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=a+u/PfAPhqybJxfk+4MZtpP0r4Lu7U4zhl2p8a6Mlqymn8pKxfzB7hgIuclbWdpK24
         1ASH3M5sAWyajWDMqYavtuullSWkh1OFi8nRG41tjfR8oNJ2WX9UXXOpZBGrw27vvgVT
         pT75EJosgtruxGKNdXG6U2FWaWnycI+WD1qASd9N79Z0RsTMSYtGrNrUbEPjGZCwQLVI
         9yPGdshzx5TXmtmbRZAPJx6P1Ms2rvhngiUCcpYLuQQBqLa/3MTlGvzOY+f/OZ7pvfzl
         +ezbIQ6tUO7t8Pjoa4yEUuuA7iPIBSaslNMetufscwGc7qeBmnqiDz2eexf2D5Nj8yB/
         D2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE3muT5ULE9w6YBjstZhAUx+OTWiQZbLVNuEc2QhGJe7kuJ7X3LWVO5l+UZA8JtrEwOD0g3Rax2iPKUoHA@vger.kernel.org, AJvYcCVY7C5PlWbfZ4xZ0pOnDLzFVArkQMqpO9SPtDQ/fjGqQ5Jb26XGiJ1VeubXbKiV5cEkt7C9leDK27uS@vger.kernel.org, AJvYcCVhOZY7jBrC9c8sjgBEDuhed1m1ACBkXtDTAmxR8lrZ9X92r4gvUFwLnG7mmUDTENxCPahMNF4t3p8/lMSlsEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCPoQP6lLFDFT3+oCB1C/mr9eaOy//JJzF7QMMWxW0+sEoubw
	M8KiRDArd7JbJkhvSr4l0lEnumlxFIyJ0VMzF+EXZNdzGj/LncJQqW/5
X-Gm-Gg: ASbGncvqoWnxJKb4LMTs/9u0cI/M3nlmtGBjULSR+OVQUFf+a0aD+yabEekMIZrjtcz
	jyHmt/a16URJ+zcHoHc19nS8MCPdrErt8aH67TuhgtigmaXDhstrRkBXp0UVsvGwhZ6ZYsF5HkA
	veDdalHEXWKxsL/3clW6vPsi4LUepqt8Yweg6C4+wY0pDCSm7zhwWMlXkGTfoAQOpjWUW9RzSF+
	KDth6cQ57vB9IJ2uBtVZzJUopv/a3wLD8T7tBCMY6zzt2yppzPHuQ3BW/9yT78AM2ZDwfKfKBkw
	FvY/ycMtx2w/ffplkrAFicowaa9yoPhlzxmClX+QwmNp27Wn/zHI3IyoXoWt8STP
X-Google-Smtp-Source: AGHT+IHApBPb/phj1NVTHxxkqJc2zUdEfupFPSOaxaq4axktTPQJcm8n1VDeCMcQoF0U6De0zLqslA==
X-Received: by 2002:a05:6512:31d1:b0:54f:bc43:dafb with SMTP id 2adb3069b0e04-550e7243888mr215821e87.43.1747335331765;
        Thu, 15 May 2025 11:55:31 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:31 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 21:55:27 +0300
Subject: [PATCH v3 2/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-vt8500-timer-updates-v3-2-2197a1b062bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=4723;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
 b=oax/cP43gm6/fN+1TVTnpNq77UoNNvIAD9cQbR19U34VFUVdyq2fIGy/3QiCSwVASJSocHcBl
 gHX4ZTGOHRIAxWTYub6LTkjMpWNNQhcWHPEoZWR9SQ3DKbXm/Qp759D
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add defines for all known registers and their bits to make the code more
self-explanatory. While at that, replace _VAL suffixes with more
intuitive _REG suffixes on register offsets.

No functional changes.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/timer-vt8500.c | 65 ++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index a469b1b5f97233202bf01298b9f612e07026c20c..9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -24,15 +24,31 @@
 
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
-#define TIMER_MATCH_VAL		0x0000
-#define TIMER_COUNT_VAL		0x0010
-#define TIMER_STATUS_VAL	0x0014
-#define TIMER_IER_VAL		0x001c		/* interrupt enable */
-#define TIMER_CTRL_VAL		0x0020
-#define TIMER_AS_VAL		0x0024		/* access status */
-#define TIMER_COUNT_R_ACTIVE	(1 << 5)	/* not ready for read */
-#define TIMER_COUNT_W_ACTIVE	(1 << 4)	/* not ready for write */
-#define TIMER_MATCH_W_ACTIVE	(1 << 0)	/* not ready for write */
+
+#define TIMER_MATCH_REG(x)	(4 * (x))
+#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
+
+#define TIMER_STATUS_REG	0x0014
+#define TIMER_STATUS_MATCH(x)	BIT((x))
+#define TIMER_STATUS_CLEARALL	(TIMER_STATUS_MATCH(0) | \
+				 TIMER_STATUS_MATCH(1) | \
+				 TIMER_STATUS_MATCH(2) | \
+				 TIMER_STATUS_MATCH(3))
+
+#define TIMER_WATCHDOG_EN_REG	0x0018
+#define TIMER_WD_EN		BIT(0)
+
+#define TIMER_INT_EN_REG	0x001c	 /* interrupt enable */
+#define TIMER_INT_EN_MATCH(x)	BIT((x))
+
+#define TIMER_CTRL_REG		0x0020
+#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
+#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
+
+#define TIMER_ACC_STS_REG	0x0024	 /* access status */
+#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
+#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
+#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
 
 #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
 
@@ -43,11 +59,12 @@ static void __iomem *regbase;
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
 	int loops = msecs_to_loops(10);
-	writel(3, regbase + TIMER_CTRL_VAL);
-	while ((readl((regbase + TIMER_AS_VAL)) & TIMER_COUNT_R_ACTIVE)
-						&& --loops)
+
+	writel(TIMER_CTRL_ENABLE | TIMER_CTRL_RD_REQ, regbase + TIMER_CTRL_REG);
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_RD_COUNTER
+	     && --loops)
 		cpu_relax();
-	return readl(regbase + TIMER_COUNT_VAL);
+	return readl(regbase + TIMER_COUNT_REG);
 }
 
 static struct clocksource clocksource = {
@@ -63,23 +80,25 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 {
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
-	while ((readl(regbase + TIMER_AS_VAL) & TIMER_MATCH_W_ACTIVE)
-						&& --loops)
+
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
+	       && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_VAL);
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(1, regbase + TIMER_IER_VAL);
+	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
 
 static int vt8500_shutdown(struct clock_event_device *evt)
 {
-	writel(readl(regbase + TIMER_CTRL_VAL) | 1, regbase + TIMER_CTRL_VAL);
-	writel(0, regbase + TIMER_IER_VAL);
+	writel(readl(regbase + TIMER_CTRL_REG) | TIMER_CTRL_ENABLE,
+	       regbase + TIMER_CTRL_REG);
+	writel(0, regbase + TIMER_INT_EN_REG);
 	return 0;
 }
 
@@ -95,7 +114,7 @@ static struct clock_event_device clockevent = {
 static irqreturn_t vt8500_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evt = dev_id;
-	writel(0xf, regbase + TIMER_STATUS_VAL);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
 	evt->event_handler(evt);
 
 	return IRQ_HANDLED;
@@ -119,9 +138,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -EINVAL;
 	}
 
-	writel(1, regbase + TIMER_CTRL_VAL);
-	writel(0xf, regbase + TIMER_STATUS_VAL);
-	writel(~0, regbase + TIMER_MATCH_VAL);
+	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
+	writel(~0, regbase + TIMER_MATCH_REG(0));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {

-- 
2.49.0


