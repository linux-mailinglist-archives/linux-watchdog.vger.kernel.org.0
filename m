Return-Path: <linux-watchdog+bounces-2527-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB519EB4D0
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 16:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E51216AA7E
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 15:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EDF1C07C2;
	Tue, 10 Dec 2024 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rbmwsa+Q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C991BD9E5;
	Tue, 10 Dec 2024 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844304; cv=none; b=esSKnVgxbI2RNtkWC2g6cZ/B1v+L3srobEkUoLIR1rwePgAtI07YMqGk8SK9jlxCncwrvnIXBe5JNhHdC5HL9CnlIjKC8GUN884gtNBZ64UlGW7vaDv2vUetRJ29hpQNk0b22+678Uqudg8xBvsNjd8VHaqxfqak3GWsA8GtYcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844304; c=relaxed/simple;
	bh=I1kMuxalrG1tOiGG0XNUf3MZl+lBoT6EfqxAWJlD0Ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i19ywCyUeqPiQRWRt2mw66MFa/4gkaCGFJ5wFHyx8+bxXSBDq69yFmo/pIc6Ul6cPy0wOLWY9fgDecSPFNi/dUubZdWMPd1URpmIFFeWbuGZwbCAghfJEZODX3AHVu+BOXrWDVjWdsMPsrrgJq8utvt0Gvo40x1tCmq/3tWd1sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rbmwsa+Q; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so2737252e87.2;
        Tue, 10 Dec 2024 07:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844301; x=1734449101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gqpWJBq7pNV+Z5/8wJrRuTCi2gLfz4ysR6a191O5dI=;
        b=Rbmwsa+QuES6YF1FFLE/8bjhRtTGXO8Bmp0fZPHLaBkoBzx+EhJjOOnX2f/RKGCx9W
         UL323OCCW/0EpJrNHsLwNh/KfH2ytPP79maVCvT0/n7M9oSac2IFiMygVvGohJ/ZwGs0
         VY8bY6RuifLuosH9MC2oTJKNv5EP8tB8+AKIINzIuC2xF03aml11SlFLIMgAvP6m96pi
         qobGH1c0lWTT1quXLWVbFDBIQzmYrQ/5PuAo5kmaMi1+T3XuPwmxwODIr7e3KYQp2Lqe
         ePyzs4hHYBc52kBhwiV0MiPlWOV/GnCxBrXjAWmkD0882AEUZSDaUutiTVYi1hnf/aVk
         f7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844301; x=1734449101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gqpWJBq7pNV+Z5/8wJrRuTCi2gLfz4ysR6a191O5dI=;
        b=VVNGaUkflMNG96O9jmAa8Za25i9aPfkjs1pVFBs8SSWLvjpL6ltadBFRP+eV+qsmPM
         NlQRZmSh/Te7mgwSibQElBo53+ZcVEyBYHUClC7ve1laXgwMNFafFUd3f7zaYO3KDXom
         upczc40pCNzfLNz1q23aAkrf+laj47R1Rr6ACCp6PcsIhr//pnJ2YlLEcc2TpjPMaybs
         Soq5pXiNJmcI+etFdY52ZqqNBPg5mZtMFYAVEO3Bn097M++73+7rWzkgqpBJpM0wPnMN
         m5AJGBnRFpW4Xo4RLCd2QtgyMcnvY/8vsVISm8bm6Ek5MtKI8PSZ4WQ2RcqkiGaVh+9M
         mSsA==
X-Forwarded-Encrypted: i=1; AJvYcCUtCS9lglrdRYypEc0rEavrEvb42skF16aqJQIsj1+kJqG3kWWR5dVrL+2yNn6uy9ckxt00Mnl2nBpboK1RJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytWd0SNroBme1CC3TTwhTcex19IGCfjEGCXJR+LLSjGCbh14OQ
	KK8YRgcZwTpTu+tNd2PaxBL/6+//vSkJNx07kPRWTlY0ZvmNCJJL
X-Gm-Gg: ASbGnctsoQzs6v2IfW+t63uxdP6qD7D7wTpXKat69p+zW59FWG2q0kg5YzkRNX2NQsM
	1Vm/O577E6pvNT/1nlu5GKQho9ZLynpQNAPoRRVn6PiIZsdHTpbkgrqvycckV0e/w+zPdjVRjLU
	VecKWghpG2dbcvBTdL5KMQDmmn3rMq26W825dMaE3/V0TLgf5ChsHZGJU0/zi/SsMF05iHk1GjQ
	kUZg1M/VOvl9dCRoTRrkL8MjtuCCccQPcTdPfwK2MXU0u/DZLTxMcKm3uz8o0ExH07Xozz/O4On
	HSnXRaXoFCuU9Gt00qU=
X-Google-Smtp-Source: AGHT+IGc9dqZbS3HkxQU8gIbWEmFKoX0ycc4CzfAmIUdKDkSNROYiB3H7zWMgZpI6nCuBXxRef7lAw==
X-Received: by 2002:a05:6512:3d06:b0:540:2201:57e1 with SMTP id 2adb3069b0e04-54022015a3bmr2615784e87.12.1733844300983;
        Tue, 10 Dec 2024 07:25:00 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e39375d36sm1254397e87.7.2024.12.10.07.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:25:00 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 10 Dec 2024 16:24:41 +0100
Subject: [PATCH v2 2/2] watchdog: da9052_wdt: add support for bootstatus
 bits
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-da9052-wdt-v2-2-95a5756e9ac8@gmail.com>
References: <20241210-da9052-wdt-v2-0-95a5756e9ac8@gmail.com>
In-Reply-To: <20241210-da9052-wdt-v2-0-95a5756e9ac8@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=I1kMuxalrG1tOiGG0XNUf3MZl+lBoT6EfqxAWJlD0Ko=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnWF1Dp8cFkIebLr1nk+oJN+lt+eW2F2SGTHFku
 7aekHgzfJiJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1hdQwAKCRCIgE5vWV1S
 Mn18EACry7h1PLIODUqJrmLqKo70kXAdwE44IPISaqipUMKdgnLVDr0M17q+Wt3NZhPNFDgP5u6
 5sE28IkgEIfCTZvNA9PaMvZVW0/j4CkxscdY9vpTFkJ3l+apYNxS+gzuXN7c+fpYJ7qWOapQAE+
 BcEC1Hp6XKyvNwxfM0AUZfMUccJZHTXvQYI4N6manDuvyhGNgamyWtDqDiTv3hjj/3B34X5Z0QQ
 4rT2ogh2z51lQDpo6aLnKVRq67bsJKN+vhLOLnSKSBbIj/ObBDnIPkuEh+Ay/QPIhhRQse3yNPy
 st3MAfL7Iy7aacTMqnq0hwcEN+Jn21rXiKhCoywl8SxNW7AylN+fFHh76dDh0n3Zjcog7wMT9mR
 IuXY+yUyWZ2YWJZm71UPsy67mbpcfcGtVSFeU0eKDO57qjZf05LoBLqcXMlCkrsyeJWBnMHwLQ2
 BantXH8Tr/k9zC/8ZVZ8oM0WW6Weq1zuBjPrLNlL6vVIeUIej4BQ6fJ1KKWlidG4SaDZT2EAPu5
 0Xni4bbXMuE/RY4OvXqxLR1mxh/q9xWPATzS7SbA6ay2NCTKh17nZg13p9LaiURvVyL2IqMf/ZN
 uy5BQahgQRtwsZceix0081LnYkspTcU9lyeStQW2MTymdm2gFnoH+t9t0uolxwfTP+q1lMEC7pU
 HTojM12GvoNCsmw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Enable support for these bootstatus bits:
    WDIOF_CARDRESET
    WDIOF_OVERHEAT
    WDIOF_POWERUNDER

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index d708c091bf1b1e3327a134d4d2244d4b883d14e4..77039f2f0be54273df1666fe40c413b6c89285a1 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -135,7 +135,11 @@ static int da9052_wdt_ping(struct watchdog_device *wdt_dev)
 }
 
 static const struct watchdog_info da9052_wdt_info = {
-	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.options =	WDIOF_SETTIMEOUT |
+			WDIOF_KEEPALIVEPING |
+			WDIOF_CARDRESET |
+			WDIOF_OVERHEAT |
+			WDIOF_POWERUNDER,
 	.identity	= "DA9052 Watchdog",
 };
 
@@ -169,6 +173,13 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt->parent = dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
 
+	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
+		da9052_wdt->bootstatus |= WDIOF_CARDRESET;
+	if (da9052->fault_log & DA9052_FAULTLOG_TEMPOVER)
+		da9052_wdt->bootstatus |= WDIOF_OVERHEAT;
+	if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
+		da9052_wdt->bootstatus |= WDIOF_POWERUNDER;
+
 	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
 				DA9052_CONTROLD_TWDSCALE, 0);
 	if (ret < 0) {

-- 
2.47.0


