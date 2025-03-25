Return-Path: <linux-watchdog+bounces-3131-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE0A6EA7C
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 08:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFFBC3B2618
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 07:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17BF253F22;
	Tue, 25 Mar 2025 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZgH5s8P"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D63253F00;
	Tue, 25 Mar 2025 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742887671; cv=none; b=lJGT8gvp5wL0Tj+gfyt6nl0XWhCI1TFArGJ08VeDkByJ5XiAj+n08xQ2FYV7thjahNUd1Xq5YvINmJHCLuEiZE4x9JFVbE0FM2V9lwyPYg42AzSloMOUUkyeIMff2YCFCy06HBt2Cs8dO119mxcQ/r7UGHjiwNIQI8/AqMHVQSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742887671; c=relaxed/simple;
	bh=6Bw7Z5pqrFp4Dfdtst6FATAGsH9+hZ6V94NiRFJRyrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIn72108GMJLAN7kVecTZYj2zNoq7BfkWyc/exQ8Iak4Ey+t4hAtRRq6rkbnFHz1jBXnSRmTkqDMsZuluRSpWiwjykAnNQzCFmgtqslH8x/GZ9TmyqVI9tsbuZ6tcFv4B6fsx6IOEwkWQ+F3zYop6vATC1jWdWobrIGkE7QaRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZgH5s8P; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30c05fd126cso46895451fa.3;
        Tue, 25 Mar 2025 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742887668; x=1743492468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSl8xyKeQ17PRGrc6DnGNwaWt4mlGOqzwR8Cl5P9HxU=;
        b=PZgH5s8Pnl9nD0PuX9y0lQI+Q97/NL1ufxY65xM5QYDstU7ATBpJQvVMsWT+uU47ZL
         koZxLADeL7EUOshb7sAb23hdyrX0MOvo4q5S7UW2jo5hVolMh0k5Yf5kHp44qpGGFWf6
         fZCkXlaVo7HyrPLOFc7CKCesVnUOjJN9de0YaxLFrY3SyozaigcYLwHPRX+zYeUn6vqM
         N76cTEjVirAuOv9KEifwdxbsfp+afC3RIbEi/IgdrR182cqhdsNOjLGnVA36bZOpZhnD
         Niwt8qPyWz374EmbiZ23HXREHhuYCBP5Ku3MkUj1d1QF8e4Uuhw117uft/xF8UtDe2ww
         YFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887668; x=1743492468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSl8xyKeQ17PRGrc6DnGNwaWt4mlGOqzwR8Cl5P9HxU=;
        b=mi7dG9vv5A37/gi01Xgs/VZcOp7+nwjLj4RMs+2e3QKM4VlI9ac0aUbpz6xv/6Odr3
         dRMm77A1NzS5pG3dlL6OU/WzqF+cQ2lCWYB6wJh1sqHbzFb+SNc1QYKVhIrH60vrT/hS
         EpeOZvYui4Z8oxGUOc1/oQkwr07PNxdMRqzHiZMowuW++e3ViGqhWsA5T+6OdBxceyvJ
         Upac3kjNNQr/Hy9sTDoTitNVDJSqurXxpHhjOVGV/NjdH8M0Jjp/ROG/cU4y+BGk63An
         wlrdYMX3OR1FqqilNf/cThmaB+Uog+lSfhbQr7FOykYYkHMoRT9rHcYX6KS0zlOjt14A
         urOg==
X-Forwarded-Encrypted: i=1; AJvYcCXeovYDcykXsfvJFCG7QolrqJdZKsNpKVUFKFHAF9DKFLi04uPHw9avpdnakWClavv7CU5Le/Hs6LUG8QM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU43kpN1Jh3nScg3wNYOl7JT0b/b0BPhDray8FhZI3IQf6YFTS
	8udK4vseKrJIXQrtSmT+qD8Iqt1JvrC4WFdcJs3UgRxMnDEhPmZ8
X-Gm-Gg: ASbGnctqJ+eUyEPGZjTkwGpeSD1oe8nnJr+yHQoVP693j/KRlmqME9UL+nfyGAEnm7m
	88ea4ULAUStodlcPAyE4HWIjtiNqEUD2PS8Vj246D1/zf81G3FNe67t8De8UyXyOxSJtypOu1A1
	MiwqfCBkSHfaW66q8Lt2s6lH+QrlNaXNomNmRKPe/A3mzppzBJlUNPbeGK/JJiAmRhp3DTVbRIy
	wOovrDMNg6Qb9+lcw1tt0KzsYcGXFq50KE8uEAU+Zb1cxCgkP2PyfDsrs9dN0FKV1ocpXdwtRcW
	sGqdfnceGALzjOb/rXL4BvuGFgAzHljJsdonkRlUJiIanfh1O0JCXozNwCJOXWTeQl/vJCQjJd8
	ielNFbWlESiyN
X-Google-Smtp-Source: AGHT+IE3p5wibeZS7r5Wizd4SZ156tClVZzLur1TaWLIzUUNXeGnIutFxr1qbtaOfXc0rLDoD5SkBA==
X-Received: by 2002:a05:651c:19a4:b0:30b:bfca:bbf2 with SMTP id 38308e7fff4ca-30d7e2011f6mr61912521fa.7.1742887667802;
        Tue, 25 Mar 2025 00:27:47 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d89661aa3sm14307621fa.31.2025.03.25.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 00:27:46 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 25 Mar 2025 08:27:13 +0100
Subject: [PATCH v2 2/4] watchdog: da9052_wdt: use timeout value from
 external inputs
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-da9052-fixes-v2-2-bfac3f07b4a4@gmail.com>
References: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
In-Reply-To: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=6Bw7Z5pqrFp4Dfdtst6FATAGsH9+hZ6V94NiRFJRyrI=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn4lraMFxEgiW1s3jnQa7Kc2/ulfbeb7Q37s810
 NTFa61MhWOJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+Ja2gAKCRCIgE5vWV1S
 Mhd4D/9g9R8uu7w+6pBQhdPN630SyRAHYQkbranlv119aQtfdlLzNQMdPtNyCky58YPOmogG8uE
 Y6v4NW1OZlGsDr6sv4c4EqIEq07X9toqFYo3jKUL9KLwxauu/Av4cqKUeU/qNBTuGG/YmqbExTm
 yuWbZ9B0+HawLZea7Kk1IVD2IEmk7v5QjvKU9d9Esv91oT1NkQr/8SOwCxd3NXrU6Xs+ObA5Fkb
 FE2VspwJQwG/feNw1zf9X8tGNia/W8G+iImatKmORhd52l5P52zwsrkumNMJ2cOiIegvOh0isE6
 i+hsH0tmnr/1D1JxdPrML6Ovzkda8OTjedZyZEA38h3/JLWxfJ0xLcY9F+vtvstLhzSzZYxLiQx
 KRf5tTQJbXFf1PT9zEW/IrKm9TjOOOF2LIzS4rYOC6Jt4x2Wpso1SVV9A+EUorQS9toE8b+f2Ed
 qT9KwgNU8DVI762kYz90BAXJNgd7NOK1/WtD41rsziMNUtwceakHU3NJHZLsY8HpBuK221FQrrI
 tze+Myl2SzXI9aZSoHM+VePjaezrNN/3QlNuUcdj4D/+/oSvZs+Notv5NSOhIOSuVj0hcnyTdX4
 omBTM7EZSAHSahdoJf5L9oIPoUNSJWahCtyL2m5ZJH6YRTVlTGZ+alMUihwtJFZ8Q6s4cBNzTEP
 UMxN9YPrFfbzHuA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Introduce the `timeout` module parameter and pass it to
watchdog_init_timeout(). If the parameter is not set or contains an
invalid value, fallback on the `timeout-secs` devicetree property value.

If none of the above is valid, go for the old default value.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index a8ff1e6a7903f6f139c5bb60d7d92ca39077ee04..fa9078d4c136a52f1193768fe93dc04189519679 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -36,6 +36,12 @@ MODULE_PARM_DESC(nowayout,
 		 "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static int timeout;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout,
+	"Watchdog timeout in seconds. (default = "
+	__MODULE_STRING(WDT_DEFAULT_TIMEOUT) ")");
+
 static const struct {
 	u8 reg_val;
 	int time;  /* Seconds */
@@ -178,6 +184,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
+	watchdog_init_timeout(da9052_wdt, timeout, dev);
 	watchdog_set_nowayout(da9052_wdt, nowayout);
 
 	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)

-- 
2.48.1


