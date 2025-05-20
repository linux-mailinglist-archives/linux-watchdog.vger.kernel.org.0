Return-Path: <linux-watchdog+bounces-3550-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DEABE45F
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 22:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D88337A7BFB
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 20:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65D62874E5;
	Tue, 20 May 2025 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgJvUAcG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A25727EC98;
	Tue, 20 May 2025 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771338; cv=none; b=FVKnB0Sxp9c5s6daZ6SzDyAVlaBKMkPuEH+P9O1V7cC2xX/3jocNgfYHdhxaKQE/u7hsC/DPA37PciTDJW14FKfPeeNr3rl5ZJhZLSC4JwkADwsI1jrvyOM2nuP29DdSUns2GwmOSpT/HOzptZcyhebFl5w/d8lITsmqn/KcGzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771338; c=relaxed/simple;
	bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+5IZo04tXAhbYcPQYR5VfQ2ZEmydb4HaALRgf3OD9uVAvoBaTW+1ExKRnYE0tofzTVThQ9jP+kTfnK8770dDqpI+tCutK1w9QUpH/o+0/CkmUoYKP7NWgltwkcb0Oyq3fVyJ/DVUEaIfNs0J78fQJRmLaYTgd5kHy7ZuHYoWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgJvUAcG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74267c68c11so5262756b3a.0;
        Tue, 20 May 2025 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771336; x=1748376136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=WgJvUAcGfQaeKfMDAsvBplOu9tZVUj3UrnarowRJpZE8LgWcDtpkWSfdF55gLileib
         QrIdz/WwoFaxUVBaRBHmBHSAlk4lS2eCeCsm1/5vH5jEhe4TNLFXbCgFNPajkVE1cqG7
         VkDXTVGX2pPXISXYmdvV2DBMkLQijlxBi7/z8zyZabecYVVBFwQZvrKrQJvtRZSe9HiS
         YGiFxhoZFt3GNYxHjhOeolf2HiuJrAvj5/WSb50Gd9Sd9oOvSOjmDg3W+Oc6EbXv3oJf
         sncsLMpwWt4YJRIHyV4p0O04zoWTv7fy2UOnF2NkJEsHyxgdj5FqHs80lZQ3MsLBQc4j
         xweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771336; x=1748376136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=ISXt3Q/x6Pb9aQ0Y8Mw/9apqZpz3y3JRs6ucNXMlfMankYb07qTxZVYdKIbU59S0wY
         jPJsDepskDb37LgY+/xz8ICWrWuYKXrQGRipWvjned6qfxgtROvktwzQQY4Z9HTKOMar
         DqHn4FQh1+kRItus3xqynjtFryXIsaZzALnYeF2o9B7oxrBHqn7ASVhOzWOGc5DRcRGh
         6S9hlNxt79kuKZ+L1AWFNFSBj89S3hD9r+Xr8mVZJhKmO/EoEgLQ8u4/4QrUE7qf0YdW
         rSTBKlFKpYusrzgbFJpo+g6g3XH2Qto57jZZLkvpsWS64LeWJgx/4rfzlx+PiAJgjBrv
         lvYA==
X-Forwarded-Encrypted: i=1; AJvYcCUPajLhY6GngarJflxfglIAIQRca689XYcuJlCXCeN3ZnmO3GTNkJHhEU7jtCdSfIbfvEDwdrRETbkzsDYIxRE=@vger.kernel.org, AJvYcCUXUGtL4w2/YV40vvUMctbRTqyI0W9v5xvGb+uhGWOOz3MDuBBplHs4+9n9boUiXLInsNNlOCYagNA95r4/@vger.kernel.org, AJvYcCVNuICEtVGYk0TY6/3BXiL47vOt7fJv70+bfs4uJYDQogMHc2ELZuZ2kTctu8/bbIopO+eSWEsgGqDa@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6fzRSHzHE3WCDAN3mv8kfdnrB3blJlW2fWCYIHzl5fLzXn6I
	s10caTp6VddX6OtOyiYrX6taX65qj/okPNcH7A2mpSwnPXYqAQDxoqEpRWns/XmGLm8=
X-Gm-Gg: ASbGncsKH5wvoCU5y06AQGCWNPakmLGTzPZBiNoZ7mLgfSDr/yV7ifSAGEVo21PuxfU
	pWdXxHOmzRQrFHq/h2Nw6rdBqfCqpxvL5mXjOA4saoVtL6htnhEf+Wizt4yp9ibHLmgcjSexFiL
	99lfz90K3n9FL5t6n5AJukGRD4aVJ/GO+7HFOvkz3fWt314zJhStQ76JFpiI6mz59P1+1m5tnq8
	OO83pt43FKwNijRfkOgbjb45DixTOiTWM8BXHNEeu3B/BF9YiPjRzRUJqqeEneom/BHr4h/Yj5x
	P1nU+eg7+b/RarARbOQeg0jqQEPApa03aFZRwM10zIjn3S/74wYZiqCl9cOzSqqkZkd7B3r8Pg=
	=
X-Google-Smtp-Source: AGHT+IHbuXHg/W6vSnqxmLG1ArO4kGbvEMiBikDCtc9Lx0vI8sgYtzMvJhfgnt11IeXH89wjamvdZw==
X-Received: by 2002:a05:6a21:1807:b0:203:becd:f9ce with SMTP id adf61e73a8af0-2170ce3a504mr24910455637.39.1747771336150;
        Tue, 20 May 2025 13:02:16 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:02:15 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 00:01:42 +0400
Subject: [PATCH v4 2/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v4-2-2d4306a16ae4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=4723;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
 b=AUuQnvbMDrfd8awkB3JMwlMLN9vm/FLiD+sdVZUb6xH9xoS1U1VL883Aoif/LNQPN3hW7AWAi
 ydT1S7bhS8CBszZsQt/uWDV5nxhBwd7Gd9dchd8CIXQJdq9qFKnyrHo
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


