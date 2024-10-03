Return-Path: <linux-watchdog+bounces-2074-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A6098F924
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Oct 2024 23:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D87791C2155F
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Oct 2024 21:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925B51A01BC;
	Thu,  3 Oct 2024 21:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6wVjimV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C03B17C77;
	Thu,  3 Oct 2024 21:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727991912; cv=none; b=n8Cp5DILxEgDCwIMGzd/42TaJJ3/Wvq7QGljNcBHtuS/j2tOCPbAbcD54B7hTzYV1/PZIwxj1N/svEtfD7o4isqTe5SjduVUVprDKm02YVjscveNK7U3pyj/a3u5lsaqoGOF2mBsYIhAabPyNgKR5gKh8mNq/gUDQCKeyZhLApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727991912; c=relaxed/simple;
	bh=WtWBTg60ekANhyFhClNdfMXGmJN4sAQvmIO01pWtryk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKxC7BOw3GwEE+lZ9N6JRw8x8UFbnDkj6xv+2dG45tAHj+Bi0DcxkUXXXeO1WasUtx6B2g6P7OODJWwD4X0SJUeWpweaHzOnre8aSsuZSdmipcygA6sa1EtDk1jYmhFUhyNQbma/PpJxLKAc7mgp82hRu61/DgqKn9hkUhqke2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6wVjimV; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7198cb6bb02so1133795b3a.3;
        Thu, 03 Oct 2024 14:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727991910; x=1728596710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5uqc89Ky5zPPcv77jFdz/zr6ORch4eRxMGcQW85bIo=;
        b=i6wVjimV2kx2nPJxGQoxlWGdXnrBkxPnGwe5rU0PQIF2Zvfd5nv3ENAIpod2MLlnW/
         iVtakjXNNVtTNfE0XQMqNxVU9Cp2W/C6HAqX3sRY/xVjnA4gAbPF4Ry4MUDCkHUCUUo2
         WnafH4edheZ4oYyT+hwu18PX7FzMH2MFIf0pRzVFy7IG9NsH9SAdwh3WG6lE+Ad8UOxt
         cYDf/yb/xe1WhM8bhxTlEtJFMISgF6TpPvYy5c1qhAnabkL8LQo3WpeUPmPvVN6AQXiW
         r969wv+I8R6/fTEidVZ5Ky/ezYQKRNQyUojED4O8es873oLyzI+kRXvFk8SNSOpO5Ljf
         3XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991910; x=1728596710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5uqc89Ky5zPPcv77jFdz/zr6ORch4eRxMGcQW85bIo=;
        b=ohhnuzgKed2we+00m0Tvzer/SeM3WvLpA9q7rvzbPjKFgzPEM8Sa11AsuvGQ2b/dui
         3uC/pImga5s0Sp6KEkmF9gDM+SM8hXvdfsQGvecpSj1PE0UtyfDfzYohpGWWK5s/BJIf
         RHDeb2f39kRf5MTnXSpHrTseYQVVNMQA475aIkrQsZcYm+5YiRJjGdxfU3gu4yf4FBsw
         rGadmCwCesdstCEl2Fjq0aHGkqRdPemkM1IiOYPR7DH0i0zjSEtnVV3OPqqrWsEpD9/7
         YbNnS8ARrWnx5vzdBG7M2c9mEMh4mEiqBtgLnx/m1w60omiIavPBnYkjGBh8cZamk3jb
         Gocg==
X-Forwarded-Encrypted: i=1; AJvYcCX3LjNLixBJAwPIrQCfz795cPQzgpFQQnVHvWeJehi16OYxftRk91ah2O8R6u71zgPIfBh840l/oMxMEZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFrdnrfZit5SwB5WKd43y6xnQ+lVs+utm5N7tJ3MVCgBEwnp3
	gEbxZkSuAClWhw6RxTB4qtrgRo1oD9hhl4ZJtTHCb8kyaQdn572su2AfAq7w
X-Google-Smtp-Source: AGHT+IFPXpOdVc/6fKagij2S42sap0gghgPhAA8/ywPdhF4+cwAmtV61cKsw0iKY+tZnXS2NPJMUDg==
X-Received: by 2002:a05:6a20:c88a:b0:1cf:4ad8:83b9 with SMTP id adf61e73a8af0-1d6dfae299fmr905979637.43.1727991910113;
        Thu, 03 Oct 2024 14:45:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9dde471sm1836894b3a.135.2024.10.03.14.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:45:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] watchdog: armada_37xx_wdt: remove struct resource
Date: Thu,  3 Oct 2024 14:45:08 -0700
Message-ID: <20241003214508.121107-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need for it with devm_platform_ioremap_resource. Simplifies probe
slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/watchdog/armada_37xx_wdt.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/armada_37xx_wdt.c b/drivers/watchdog/armada_37xx_wdt.c
index 8133a5d05647..a17a7911771a 100644
--- a/drivers/watchdog/armada_37xx_wdt.c
+++ b/drivers/watchdog/armada_37xx_wdt.c
@@ -248,7 +248,6 @@ static const struct watchdog_ops armada_37xx_wdt_ops = {
 static int armada_37xx_wdt_probe(struct platform_device *pdev)
 {
 	struct armada_37xx_watchdog *dev;
-	struct resource *res;
 	struct regmap *regmap;
 	int ret;
 
@@ -266,12 +265,9 @@ static int armada_37xx_wdt_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	dev->cpu_misc = regmap;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-	dev->reg = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!dev->reg)
-		return -ENOMEM;
+	dev->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->reg))
+		return PTR_ERR(dev->reg);
 
 	/* init clock */
 	dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-- 
2.46.2


