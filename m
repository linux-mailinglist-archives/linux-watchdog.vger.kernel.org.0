Return-Path: <linux-watchdog+bounces-2799-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7578FA219D5
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 10:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0DF61886B4F
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 09:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389FC1A0714;
	Wed, 29 Jan 2025 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb6rXYKX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268A8462;
	Wed, 29 Jan 2025 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738142891; cv=none; b=KqIbemmvKBHAqY8oR6S10kjbYdQB94PzkF4xsUd/pygAt+2T5kHaaEV+KHp9Sg5GHy6y33LaqJ7beengsQbdx4MGaD3GxD31AmrPMY+ea8oLNHgHGPX9ZNqXMIWC5ICkrjiCaZV1a/8b+BM29mafWJ3QgYVwkglZctTM4tgb3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738142891; c=relaxed/simple;
	bh=bstLlNNMUSL9GLMeRITPC6FJBEtJ1HMb74bi9UtZ8M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BL6tidJxl+hH/q9UqyD8Q9vnNzxEeKc7+Mejkgdt1CpAtXMI7JLu9PZGO4w85SUY7wuTfmok8tWFZY0n49cHXOkEJSdrfa9FExfSc1DqPrpm6s4tzKgzjxBuu9wn+hSEzkXnbrmCTUO4INd35Fhv6nLQkDt2a+9M4+Yl4F3rvjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb6rXYKX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so7417031e87.3;
        Wed, 29 Jan 2025 01:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738142887; x=1738747687; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=buVhDuRguPlyJZPyEvCsXVBFflGX5iw4xHFgTeamWsI=;
        b=gb6rXYKX8IefV5k+Zd+fJo6kfzyJ65lFMWEwQTEkd/ho94hE4eMxXJgkdLJmtRtB2V
         sdR84TgMoqrxRDAtipoI4igd11iFbfvBN5VQa5/wNGVWafs+FRZY94q9QlHvBJ0Tmy1M
         unlBLqeCviVk4Y4UX2qquzXDNTQxJkx2iodWD/U7QNul0srL0lZ0Gy83XScuyX7ShUfE
         pDIi/RaQwd4Hh6wR1M1o9+bBCgLX3OL3PZMglV/jHpk/F2e0azCR/bp8kkXk0EXe+XmL
         eeaJl1j26UC8h2ADmv3g6qbsjZM6XbV+49McL7Rs0k1WPAid8ZX+O8zKKHxin/upBqOM
         8phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142887; x=1738747687;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buVhDuRguPlyJZPyEvCsXVBFflGX5iw4xHFgTeamWsI=;
        b=Rq2ybde/BjzcGi6Sr33PDSoaRMA3lhwAly2/sy+yPicuIASYvcJWzPFd6DrA6LoLJS
         QnLylAkw1zvp2Sy5uCI9xeQiOx/EpmcsbaE2F6KqA8SvIeKa6stTbW7ItmyaZGlHiiS6
         CrYrp/B+J4jpR+0cKJLJkDH4+XkzegyhvugpLP3Zz+xv0HmzIhpbK8FOXfHWPNJsHI6H
         e0Q6qSGIPP5bsTZyfw65pVPNBwgtJ8VoIufo3w15GMM7VcdGKDLp8ntdP6HBxx4mx+zV
         oNlMHjXmWUKIbri0ZiHqwds+oZ7WHwOC7DPlGo+VWCFA9tHYh93NHxsNaZeRzM9Fyze3
         kKHA==
X-Forwarded-Encrypted: i=1; AJvYcCVz9Cv7MoQEpC/1YickPcvvPF1wxRK81596322zcMvSrGFixBvfzfTYbnTyvD1dsxPpi1QKdbeIzdNsLJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtHztSEAZwOiYplELHtGptxKkPY6EdaeS1V7iTtrxmqBA2wZ5
	dMdMEEvHJK21brzHJ6DmSi5li4IlEVm8jNZeq7nGTH1FEeqDNAv0
X-Gm-Gg: ASbGncus9oeyNbqFj2SvKcZeqeTHw77RfCYaFoLLVIjicayByV5g9ENh8aW3bMd5rLs
	SYeFbsEXJIFfGBauYKFX3fAxpk9t8DgrCdZLw3g/cRI3rBidzDP8Tp9RUkYVvf9HJwHmex6ShJd
	EjreZteBSaL+DQMXgEUmj0CcxlOPPOvAA4c0TXkStI3urimppFbwr8rtzhDTorqi6iaE1NSvgJs
	Q4ti/QQSEas6ZYbYVY9dbMi+B994+WUAIzvvMd52gp1f970Gp+RXooiv2RiykWGYQy3pyE3MGj1
	cTF37DXeYMXiu05jh67VUrV2vFzKoAe4WoJCY+56zk8OOAczTneM6s/Hwcbb
X-Google-Smtp-Source: AGHT+IEsxAcsjKyMe+Xrnabdze3nkd6Wp/8ROWGaGmpAXS67Lg9chpYFVF9n3KiCaw0vBBrZmQLu7A==
X-Received: by 2002:ac2:4294:0:b0:542:2e04:edb3 with SMTP id 2adb3069b0e04-543e4c3a22bmr687438e87.49.1738142886930;
        Wed, 29 Jan 2025 01:28:06 -0800 (PST)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c82272c3sm1957918e87.39.2025.01.29.01.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 01:28:05 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 29 Jan 2025 10:27:52 +0100
Subject: [PATCH v2] watchdog: da9052_wdt: respect TWDMIN
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-da9052-v2-1-1ae2b263d936@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJf0mWcC/2XMQQ7CIBCF4as0sxYDGKq48h6miykM7SS2GDBE0
 3B3sVuX/8vLt0GmxJTh2m2QqHDmuLbQhw7cjOtEgn1r0FIbqbQVHq00WvS98mEcz55OF2jnZ6L
 A7x26D61nzq+YPrtb1G/9I4oSSiBKH5xGb6y5TQvy4+jiAkOt9QsbXMcknAAAAA==
X-Change-ID: 20250129-da9052-661dfbb7de38
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=bstLlNNMUSL9GLMeRITPC6FJBEtJ1HMb74bi9UtZ8M8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnmfSe9y05JqSH5/xh/TYWd2ztxdbWr4JfpB0df
 rfZe09PQV+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ5n0ngAKCRCIgE5vWV1S
 Mhd4D/42UBaf+XWIenKy7jSTAPF4DNaAeyC/zyVTmEVUon2tTC8eNi3qroB5J9HQPYU/t+t/X/p
 AO4llFpL/7iXkF4W/3gz0OvYHHMdemDoKd0dy/aivdJ64QR5GKO1k7NyfiV6l+YDz3T0jom/hku
 mYMcz4OVcYJrobC66obwyJSR2znTQoC3hGvLTtYZ9k0nkbrXtMYKZS4a+Zs6y75ajlwJr30eLMS
 EI7Z/zTrs651udLsm9Ssx8R5NtF3dYy4ASykgf5+xN1UDfuOzhUE3M3PrRHFdwoqBv1IEV/Pqrd
 GiFZ643GOoMRBDWLQcMSAK5zi9pW6FVWrE5brgVZ7FWUjBZrOQSAALr8VBjdC76kqtY0Gqvi6Z0
 QrxYmI2N0VaaklkfaZc2wPjEmSDWSAsLDL+wfcq856drcpirpra5Zp91as+zxNZK3Zp9aO8GvWD
 KPPfSQSeB7VkNkokgD+MnrlTSQLNcOEpqvwmNw9v8Phawv/7EYhrhPxSE6gaVghrqh7u6DqLyVb
 ASGsrugLdBYd986i6KB2Ey8vkr1+qNPgVEdSxoT6AnI5YI1KnB2Iy4fRt74gZjxzty2AT3o5L5A
 7uIBFbLN4rgMKeVwsikh1hBnNXEdL05vwJtmywYXGLmV+Mfd0+6HBpKPLRxRMbDHkkaAvYLJuH0
 9poETHufbUn4fxw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

We have to wait at least the minimium time for the watchdog window
(TWDMIN) before writings to the wdt register after the
watchdog is activated.
Otherwise the chip will assert TWD_ERROR and power down to reset mode.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
The current implementation does not respect the time window for all
cases not it handle when the jiffie wrap around.
E.g. setting a new timeout and immediately perform a 'ping' causes the
chip to assert TWD_ERROR.
---
Changes in v2:
- Use the right author email.
- Link to v1: https://lore.kernel.org/r/20250129-da9052-v1-1-aa0dfc2ad595@gmail.com
---
 drivers/watchdog/da9052_wdt.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index 77039f2f0be54273df1666fe40c413b6c89285a1..5ca957a6c2219d99cb3e653205e3f556f7cfb56f 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -45,6 +45,21 @@ static const struct {
 	{ 7, 131 },
 };
 
+static void da9052_wdt_wait_for_twdmin(struct watchdog_device *wdt_dev)
+{
+	struct da9052_wdt_data *driver_data = watchdog_get_drvdata(wdt_dev);
+	unsigned long msecs, twdmin, jnow = jiffies;
+
+	/*
+	 * The host must wait at least TWDMIN ms between writings to the watchdog
+	 * register or the DA9052 will assert TWD_ERROR and power down to RESET mode.
+	 */
+	twdmin  = driver_data->jpast + msecs_to_jiffies(DA9052_TWDMIN);
+	if (time_before(jnow, twdmin)) {
+		msecs = jiffies_to_msecs(twdmin - jnow);
+		mdelay(msecs);
+	}
+}
 
 static int da9052_wdt_set_timeout(struct watchdog_device *wdt_dev,
 				  unsigned int timeout)
@@ -53,6 +68,7 @@ static int da9052_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	struct da9052 *da9052 = driver_data->da9052;
 	int ret, i;
 
+	da9052_wdt_wait_for_twdmin(wdt_dev);
 	/*
 	 * Disable the Watchdog timer before setting
 	 * new time out.
@@ -89,8 +105,8 @@ static int da9052_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		}
 
 		wdt_dev->timeout = timeout;
-		driver_data->jpast = jiffies;
 	}
+	driver_data->jpast = jiffies;
 
 	return 0;
 }
@@ -109,16 +125,9 @@ static int da9052_wdt_ping(struct watchdog_device *wdt_dev)
 {
 	struct da9052_wdt_data *driver_data = watchdog_get_drvdata(wdt_dev);
 	struct da9052 *da9052 = driver_data->da9052;
-	unsigned long msec, jnow = jiffies;
 	int ret;
 
-	/*
-	 * We have a minimum time for watchdog window called TWDMIN. A write
-	 * to the watchdog before this elapsed time should cause an error.
-	 */
-	msec = (jnow - driver_data->jpast) * 1000/HZ;
-	if (msec < DA9052_TWDMIN)
-		mdelay(msec);
+	da9052_wdt_wait_for_twdmin(wdt_dev);
 
 	/* Reset the watchdog timer */
 	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
@@ -130,8 +139,11 @@ static int da9052_wdt_ping(struct watchdog_device *wdt_dev)
 	 * FIXME: Reset the watchdog core, in general PMIC
 	 * is supposed to do this
 	 */
-	return da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
+	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
 				 DA9052_CONTROLD_WATCHDOG, 0 << 7);
+
+	driver_data->jpast = jiffies;
+	return ret;
 }
 
 static const struct watchdog_info da9052_wdt_info = {
@@ -187,6 +199,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	driver_data->jpast = jiffies;
 	return devm_watchdog_register_device(dev, &driver_data->wdt);
 }
 

---
base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
change-id: 20250129-da9052-661dfbb7de38

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


