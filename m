Return-Path: <linux-watchdog+bounces-3148-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D554BA712A1
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 09:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B6441742AA
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 08:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33231AAA1F;
	Wed, 26 Mar 2025 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCC1pROb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE21A8412;
	Wed, 26 Mar 2025 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742977842; cv=none; b=Kb429JBAtaZbfcdhYGs+AqtQyg27QvN1JQsjizvX5P+61BavkHmTQPPgau8wyrpy6CPqyisUuffAySz3siJc38B4rgKAJryzZQHwiPfRge8lnKV/GI9w7DT5rAyMbYNrKcKWJfPB666j2DwCtIur30pLs2WtYubg9rTGseDon/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742977842; c=relaxed/simple;
	bh=H1i2HzaIIUrE1d4mbB0jXejm1mwEktSUX8xbptejSYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvIxeYJPlLQ58IDryseM2pE6D+Mkp1osQ26747MD1cCZJCfZRnslf7DRUqCcj0jKLFmdfXRAWmu13eTAmVwGuUVkHdVjjy21t7/hZXOlwMJICxLZzCC8QiiCuAKP49yAYoY1MyUYue5cA8IFGBCj83lBhNJf0Pb9vZ3bKfZtsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCC1pROb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-548430564d9so7074295e87.2;
        Wed, 26 Mar 2025 01:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742977839; x=1743582639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pph4bSFudd+EAgny1cIBTn3W4rzTFA3Be459jgpAyv0=;
        b=JCC1pRObHOv+GM+NyhSTDIjCc4VvwvOevKSQ/zSslAQ25lvHnrar5yVcm+cn0A2wG6
         eEr0hUrmsBiJeMqfqmVhh5kbTNzVI5ZD7AkurCj+BOJ1vkj92uIrwl7e/4X9cyfL1u2k
         kuVP30GNIV7lGmFufhX/7fpujZ+sVgcO7TxVQJmJGIG52DMeL19W87VWQ/MmszdmEYDg
         ft2wplcIo0Zw4i1sjEGm0m8jE5XRVhJtW339R7lLaOOsmYQh5jb6GbunCN86zH3nyTGt
         MmsqRu3d4IlmMp8D18n4OWWxwrora++olGx8BPHAd64ygrvTk1KPeZ65BkqnZ4WsSt7l
         paAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742977839; x=1743582639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pph4bSFudd+EAgny1cIBTn3W4rzTFA3Be459jgpAyv0=;
        b=SNop3yEOrdxFGYutrUPjw50v9y6Dn/UDSEvOodKfsWQ9RErc2e+pbq+W7ohL4YVgZy
         IYMFeZuGA+kDqmdQUn3w1F9ZZzG8IZNwKOI4J/oGyULmug2txQ4GgV2YV8WWtea7zrgj
         SS7ahEvyIIg4aoHhhGxvebSCg4/bKwXraO0OniAsaayZrFSlwQxoyjilVuEZFoisG6MT
         IuPuvQDkJ4+935PdvN7HcfUeHLQlyJ1BZUU5cPAEs+cs+noVig03s0nsdfvPt1d2Ynov
         I+wdmB5CPK9BKT9gQu20lLgahYssxvyP2gjdBCKOdwXAM3Ye4ztVf+btsJyY/qr1ZuP4
         fY5w==
X-Forwarded-Encrypted: i=1; AJvYcCW6pzjoiNPJTB+ejCFtkmdinmm/9+l2CKUCAhPsM1ZOCpbWBP5ChhdqU+xt9jCYKLkXHmpImME1uqeF7wU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeF7qPsoQsKl++5KVvBBYZ3adpC5LHZMb0mf30nxJMXj+k4dQk
	MsVm3raBnrKiG+ZrLYFACmy8c2zBoN/Ckqe6cTggBhskfXJhOub9g4NcC4OX
X-Gm-Gg: ASbGncte0ImTy3aDOpDDmJ4i84mXCkWcSKdXmJYLayyb/HBOx0KluPXZ5nAlHAQHTJk
	HgTFmblnaw9EIpbQ0wIJngCgcSm3jjLrEBFFIYZQkwtKLoaQCROu15+rtgGmsefHyq9HsenlIGp
	HrzgO/OHFI3nbCQEO836RQUFyPvbRQNU/inmZmSrhw+YLU8hB9ee5XMjambcVFnx+FldiFY7mQZ
	L2Nm0sVUAUxcKmY7auK25dcRoJloihW7xYWH05Y4fWS7obMW6Qu85dmUt498fMKFigyNog2fB5q
	em4vaYKfM7UMguXNIGSHuRHCwQNpOdWxDusLuqAJZMIZBsGM/iDErrXJPYkDD09pken+Ya9VUsZ
	g6GS2LJy/h5mw
X-Google-Smtp-Source: AGHT+IH/Maw9nedwMkjJtg7/PajbCat1i9vuOqI4WqWol3sW0Va5y/FrIwrIi4at1pGq8l7HGbY60A==
X-Received: by 2002:a05:6512:ba5:b0:54a:c4af:18 with SMTP id 2adb3069b0e04-54ad6486711mr6942056e87.22.1742977838459;
        Wed, 26 Mar 2025 01:30:38 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c6f2sm1707406e87.79.2025.03.26.01.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:30:36 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 26 Mar 2025 09:29:51 +0100
Subject: [PATCH v3 4/4] watchdog: da9052_wdt: respect TWDMIN
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-da9052-fixes-v3-4-a38a560fef0e@gmail.com>
References: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
In-Reply-To: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=H1i2HzaIIUrE1d4mbB0jXejm1mwEktSUX8xbptejSYU=;
 b=kA0DAAgBiIBOb1ldUjIByyZiAGfjuxnIHagNV+rSUzz+iP8FwlZVQ/eg9gUofl8MQYLDdYNcL
 4kCMwQAAQgAHRYhBAVRoui2bLVNZMEsZYiATm9ZXVIyBQJn47sZAAoJEIiATm9ZXVIysfUP/2Hz
 ywzdfucAV/c5pkxV/VZg7th2nUA9wE5+OeC3eaH8qjJIdfq7Pwr5tSJ6gGqK7KzVHP1UhEMj1NU
 2AQfYAgQCUTpKQKtyLFj4Ix3TjfdTBDVtHmw1XbkdcYPHQoUox9q6Ilqjm5mh3lCnzYHkrLnWZF
 6d/6j5RqfTSb9yQbmm80Ey4WY4K3nb0teXUNW3uzTIqP00dfRW+NX+cCZ0zjLG6WdKrgHplQumB
 bfREqm6MO3Jh9csflwWXbcRqZ7/27zC9fr1ERpbCADvpczhzIxtafZvGPsk5Ocdh18b2ZVxWStG
 RnDfbtMrXMCW+AWb5dl1LklMecyzRH/FNOAX93h4pPVHpR+0GSTIpXGp5V92u+ywHP14PrIzibs
 9W3u7DHLxfudVNUjzP4MUW8g2asV+zR/u1ZndLV8vYDi0xB/+gNNSEfApfBkiCchvyAqHyIeKpk
 fLotRk1NYWLoaCnb4ZUSQUhyNDllL8Knt4fHXbAMGf+YlDX8Vw6ROwIpedRGixu4X124yr55icn
 W/RT9HFVGYfnarTr702ENi8xrl0ag26a3y/hT2/YOhyj0bkiGnVOA0tE8jYZuThS/HI++N6kvS+
 oL9PaIB76mJEgSr6Hwx/zW5PF7rPXHkdILJzoDEZlX8k+JTcp5s6u7NhC/mpTJzuxyDC2yXHrM1
 ZOiaV
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

We have to wait at least the minimium time for the watchdog window
(TWDMIN) before writings to the wdt register after the
watchdog is activated.
Otherwise the chip will assert TWD_ERROR and power down to reset mode.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index 5bef70cb74b36412b427f5cf7255f16b8eb00ac7..afb7887c3a1e865d3c581c5ab77bb91a5533ff07 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -180,6 +180,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt = &driver_data->wdt;
 
 	da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
+	da9052_wdt->min_hw_heartbeat_ms = DA9052_TWDMIN;
 	da9052_wdt->info = &da9052_wdt_info;
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;

-- 
2.48.1


