Return-Path: <linux-watchdog+bounces-3558-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F651ABF513
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 15:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C8DC3AE296
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 13:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333D326FA5E;
	Wed, 21 May 2025 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVMqIu4x"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2D2472A0;
	Wed, 21 May 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832450; cv=none; b=FbLzbfDVlvgO76vJmRJqzqaiGCPnjZhxIJuXqLx36912DHfK1lJ7UEWl3fLVw9qnQPRAY6ezONLr/1Cs5+Z18uod7UDN03ySLyTUq6t2bAA/6v5t5dFfy5MRwJnWXi5+2iPGcARFdEVJfFUA2rKWAe2TICtDntaNU0c+nfebGT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832450; c=relaxed/simple;
	bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5xVo346xxNSDp8PLvbp+uNUGVY3n/17cM7OKTQE1H0CFoaI/35mVYaSVIXbXMpNMrE5kHdddoT2GLJnvSTqtuGfcjiusd02kkJWWuok/g4A2Ht/gTlOp6DYWBOKFCyBQrI3ScC7dJAPqQyyU/fOGq/sklpsBO9AZ5Oik+gLLeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVMqIu4x; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-233b1e4376fso11015725ad.0;
        Wed, 21 May 2025 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832448; x=1748437248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=MVMqIu4xq7mLYx5NKInrL/bxsgi+LOA4lfzpl91BW05otYunTIyf0CZmo9P5YK6R76
         l4XcxIIGnom7a9OFmQ/87lN+RIJ9F03wjKYa1fE7dgVWGyfooimhwX115ecGNfar3KaH
         apT2mbMjgoh0N2oSvo9vhNHiz76lzhphWNpLKTEztXp4iGYiL8HfMnGJRM1d1mYnDOHc
         wpC684s+vj+HfEi1BAJoBXxc0RbVdTqZ7ZDCyAgxqwn9Yw2zHLm42ecSyU/NP3G4d9ey
         SzNLWdZ/+zulf6rvzIrowW/Lp+nvPFwEd7qjxNPFFmXVrG2naqL2Hk6tgemhVt+0miiT
         dhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832448; x=1748437248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=ijiQP7VLe7jqkPIOUKI5J4QN0P6Qfs7zoOMc9n4vwd42Ql5883SLCi52jINyejXbD6
         QR02pWmbyy4mEVBd/5EmGY1ckw1SEP0NLSDt5DenF1mH5U0cs6vGMmqqTElo6gLEbevZ
         9xUVyo+GZ+inOvu/E2UMCh4UYej/4A9DO+hGZQkweCU7tdM53fY6Xk5kYjNIY4UYVyR9
         pi3T2qbANDBlzEnlXsHI81dj8YeKp6lQUCqj19z8dZJmHykZn2jPozAJoc10D/X5ZULJ
         5Sq5RJmFMlPtNWmpKwf5ggDQUQBzzcpr9oX0u46vMjls17oLiNs3LkbqpUbncAFKbzRE
         n6jA==
X-Forwarded-Encrypted: i=1; AJvYcCUvjeb4HgSP8UQe4LNiUlcAX/gV/eoIrGAz2RPqWrq6YLr4cfPppin9pfYrl8Oon3QtlaV+6+K/Z47MlyvAn44=@vger.kernel.org, AJvYcCVLtxwIDXzwayrEec/MB3ntBAF+qsqv5WPIENx/e4KU0VkWcS2pMNlwyRd0QHl8ViVJKCVqtgLpsR8xdN2O@vger.kernel.org, AJvYcCXUtyMRpwpSumZAozDBkYxvd4uGTI/ecl9jBEf1C4mNh6aSC4HM5RlB2y9dNPCV2vZVRq0vpRN9wYb4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8MWO6s+sh5ilaUd5XoBXrEfTux2bXFJOz9129rToxEuArDfA8
	0WCXl99vkUmMAAmRFaetotN3cEsto/necBC7Wky9AdmHL+b8Ix5DTqmv
X-Gm-Gg: ASbGnctjvRNk5hQF6qQCxjcwMNRdMb+7QCwwiRKtiV9Tj8SqilK1P6LKp7Oa4/V9YPh
	+nh46KO0GSj/C6OFgZYeaX8j/ZdxF1rFiyM4QTOUWbxip2ds2msfWqbU4kJpWCN40XmUU3D4zy+
	auQ1zmp+HYqJFAexDmHU9ewWpbC0vURYdm6IrZmf4QgkrtxE80Cdx0+t7B1KwXffWAS9uNHpLle
	cYnnJzfmmRYSvdjAn9pbBUeO/E1wOPzqXTAO+ps/d3R3u6nXaeLwaAaARZLvv2S77cSLTv7rNJO
	5mNWddGDoUeHrtJPb1L/AsCRGdTX5YRmpoHvkhRkb1fRyjIP6I3RKlczIMptouq74f/bpXqpOQ=
	=
X-Google-Smtp-Source: AGHT+IH1pAZ/QDuhkSFov8qWnII/LJQJzBBwIw07F/5GZwDMHlVRxDclmLZX/TiYT3yDkgAhQkvUJA==
X-Received: by 2002:a17:903:328a:b0:231:e331:b7dd with SMTP id d9443c01a7336-231e331bb86mr249082995ad.35.1747832447449;
        Wed, 21 May 2025 06:00:47 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm92691165ad.53.2025.05.21.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:47 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 17:00:10 +0400
Subject: [PATCH v5 2/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v5-2-7e4bd11df72e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747832426; l=4723;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
 b=e8o0CrD8GZC2S47V/O4WBUFkX0VcW3YFuX1KeveHl37zUKZWUB0cMMUzUlTGzuqc+JeKvgbMl
 Ip/Y54Ix8DNClbj28OKnDZwcvd2jcZ8lJ/DtMDyneHBCZgSQcwJM7nY
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


