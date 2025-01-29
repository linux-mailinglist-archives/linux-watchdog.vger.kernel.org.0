Return-Path: <linux-watchdog+bounces-2798-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4BA219D2
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 10:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BD7F165518
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 09:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201921A0714;
	Wed, 29 Jan 2025 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdHW5UHZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A3618F2C3;
	Wed, 29 Jan 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738142705; cv=none; b=AxeG0n8oMU1CvHzQen7Wqr6Mx3EikM6tQzoiRCJ764pWln8GpP2u+YsbMP35sWV87JWuV3NU9sbUKwWZGccCQREvcwDWlGP48ZL1XmAZTeAHz426pdwkG8/rjHRv3Szsu4tRPMnbr0Se17LAxdgzTYI00Hm4qOU5PDO5XYMd2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738142705; c=relaxed/simple;
	bh=3fRia947+wwMayHGXVB1Y57UJK0Opj68zoDHJ9AOlBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IDHO//8sh1E/emXmEE7zNzGb17IM+LimGcwHkM5b2RGYAEgJc+nib+wjWmzBA0FB6V+Cqu6Z9iHC0e9vXYS+jSZS4Pi8Ayfe9vJC4ZH03gJ81BCI2JvJZuAolESyamTbogXiCIaJbFvCC4lm5+34mR39Ja/wCUSeF3lal8yPZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdHW5UHZ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso6831004e87.2;
        Wed, 29 Jan 2025 01:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738142701; x=1738747501; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oS54gs70DOieOoAnp99KRojy6/B0YR/mxxtT1lvvxGs=;
        b=JdHW5UHZLUwRzj6VFwRPxTnv78rpqaAmtYML3UWJ7NM/TmBiuhEu8GIHJk1Op0Nfu5
         GiUgtZn650Dg3CfDMzaSvku/jfAYVqKVvvueTAQwIkKY7NtXWTTnbOXEMIW+j75R4sEY
         s9EeyPfiDq8jARXbb4gWF4yK/DspvsLNpMxrIm5Im7vJLeoKH9Fev416iwvz7DPyyUDA
         f0ZhKTMyGgVS9xReQOxPoiPPhj9+dzk8MjV1am9x3KghtSb7U7pFwXkTJ4MREvQEJWpK
         E89nHfwiaCvZpt8vhRVn8/dHGzE0EjE7FPwiKtphA1dE3OvSrbZnJRWnpt0n5FvvowoU
         uYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142701; x=1738747501;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oS54gs70DOieOoAnp99KRojy6/B0YR/mxxtT1lvvxGs=;
        b=ZdtxYX+OHdcYzk0sUE4c/tsqrAdkCybPOjgu0SM/wv0nxxogGhlKUrkAlddxQJxZIf
         J27RYS1ill2kvEsR1kuM3jvoE1ClInIvs56JgOfjHjvYGv9D9AaMgAw1yMBFtmwoe8+E
         9mZC1J9D40C34aFonOSe9e4LlaouiNGcGkFFJCc4qmeWJu03S25lOO0yvOHqLu3fX5c7
         7qfxv5JSBZXp6YbPqQzD8Fxo6/bAUZ/+FDjffFUoPDysjTtQ2vGXz/WGsgxwU5H5y+FD
         AiHcj9/CVU35Ptk+rJZ2b5a4AJKtgkuEgyJ6G7bvA3IV9ismwff1iGwzHbk8SYXdfnF2
         rhtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXobXyOmz0t9bba7byzo+pJy80Wrz2BNRfzXsFzkbPFUkAFjvP1TvzEXRk3qir4x5ObxWkSUU15OapXBQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Gc7k6FKS0rCGs87hmbFMorzL1sxtuOwdgAjSOh8vXcuh7kEj
	0/qxDDsfRiLHc9qjQKxK2JgR79ytz1u72FV7RCzIA4eK/xrez7eqyYdaMg==
X-Gm-Gg: ASbGncuhIZ+BVbwg7C/ipPMhZI6ZAsMNRt5WWbnTg4b/+BJU9kUbL2qqEccFgGQilgJ
	E0nD7muHCrfmOQWDbdYKWu3Yg0Phfp2f3S8sHbSLDeA7a6ZFOeUWChhxbUA9UptTowYBmFNzGte
	L5uEn0jdhV1Jibqy/DP0W0LnY24EBDSIqLP4XEkAfdgvVZI9VLr7jhyeIaeEO6N93K7dCY/FJ1I
	HhD6h6s0A2d2z0WWLYgmAfWCtI0pu3MOmPuGW7D3oC1hWfYHkerVWqyFrri9M3dZtd5i1p6D1Dd
	D2EL58cfH35UM1RHMDewCwUH7Zadb5aKBGFaMWR2I+ZCC8g6HnHNvYyWZ0fj
X-Google-Smtp-Source: AGHT+IHYiObGRBCIX7M6gndr8911hkv5hiaq/TDetZoYJbS7vyyqWwDWI6LqHz4uGBbXw+8PF56rrg==
X-Received: by 2002:a05:6512:108d:b0:542:63a8:3938 with SMTP id 2adb3069b0e04-543e4be9b70mr694230e87.20.1738142700325;
        Wed, 29 Jan 2025 01:25:00 -0800 (PST)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8379b8csm1925636e87.200.2025.01.29.01.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 01:24:58 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 29 Jan 2025 10:24:51 +0100
Subject: [PATCH] watchdog: da9052_wdt: respect TWDMIN
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-da9052-v1-1-aa0dfc2ad595@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOLzmWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyNL3ZRESwNTI10zM8OUtKQk85RUYwsloOKCotS0zAqwQdGxtbUAeND
 iw1gAAAA=
X-Change-ID: 20250129-da9052-661dfbb7de38
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@combitech.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3553;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=tJLljKw9Dd75YDkvw/GrgNCnIfi7dW4ZsAsHSsMclwU=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnmfPl2j3HbgO51IlcDcEeVGnhslr9VKRqYFkrx
 b2lUPhReXqJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ5nz5QAKCRCIgE5vWV1S
 MhmuD/oChlu0zlDcyvoR9oq8zN7Kq/tEt6BbNz9UDzaeqPcakJjaBIChAwgiGhrzqzy7DG+5BP2
 7RK34+NFx3ZH7kH6RIUQJBkk/O5ycy6hZktyiRLvEIo1i5RJxYS3rzcu7U1gtknjMpx5ztToXcM
 Hq1vbsbn+pFn++Nvc8Ind+pDt1tZYkEUju5LNY9y/xtvnSnhfEoBlBZ1olCcsR1M+scd6+TqxVO
 XaTY3+Ew3VU5m5XR3G8t9uRh/A/Ygl9qIZITRhktjOM6Ocojfwy7yHLqrTG86A8vsT5JHbu64mb
 tesCJ9R/m//ZqodQsltDtxWBcEkDH2flx3Dm+S6KbdAEt5zhzAheH/LulM7ObbtAM9NfTmJsn9L
 MG3QgN/ajW17q7SWPPRgVLp4X/ihtZY5SL6Pb04aUUPhU7IzKN/d1gw2mjdUkBKD2b9zmBgVnO0
 0+Na1J6mZ37flLOyQOrtKv+zHdqJrInoUeO6eSEjJtadhQUvquq+PiWaGYZmyN82oDVzvZmFDBj
 Xw0hgwlpOsfXuiYjkCJR7g7HA9hqayWVLu5i3Zqzn2kW+tP5Iwu6I1fiRA6E4AfIHWZLOxmzPgN
 zQt0KvqwlPgJQbauaIb6c+IAjwm4YrKJu3IbEiv0g4YOQngzVIetkknX79U01kBHMtZqjBRe13I
 c0HkKqHoT1SQZWg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

From: Marcus Folkesson <marcus.folkesson@combitech.com>

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


