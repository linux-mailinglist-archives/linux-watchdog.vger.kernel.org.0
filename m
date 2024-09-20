Return-Path: <linux-watchdog+bounces-1997-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C67CE97D78B
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 17:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6B51F21C7A
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 15:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B6013D28A;
	Fri, 20 Sep 2024 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O2s0btrf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE2217DE16
	for <linux-watchdog@vger.kernel.org>; Fri, 20 Sep 2024 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846524; cv=none; b=MIOuyopCOw798/WFkhNmSpk57S/F/Z+JmlnkHxnkYaAt8cvtKrUuUkq51DtUQXeMPc1qNXJ/Ku+0UhRknQetHrR70Q9ZxouunIiGMaOgIgmj/zL2hzCIK1YDn9LWiY4ohjpriaMmeePf7N1wZl1f3oEhlbdREW1bPuqfhqGY8jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846524; c=relaxed/simple;
	bh=mwMAGDmK8Un80Sz53kxxyN3VjU+WlkHvXI01c91ArLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Nlnl3WTRvJu1foFfyB1xdnmpZ9bD4f5lXHT2zyyuelzCQkSFPPsieKOQGZ9189nemfmyW6KWKYlb9KKsE1Yw8SYjWDFesenx671D6C+WAQxaxfqX/fFBxtWbzjdRSxNOhdCmRtt/kfzIFQGpgwYUtHtt87QqrWzy9Yy9DqmyuWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O2s0btrf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so20403825e9.1
        for <linux-watchdog@vger.kernel.org>; Fri, 20 Sep 2024 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726846521; x=1727451321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7W5gSqYMNVOE2hqiKIz0DH0bS2ae4cjdLMrTwESeSA=;
        b=O2s0btrfEyfJDpHFnbhei7wwTH4Nxp7MNkHFNTSUSiwBABqs0Eq9Cd7Rp/EPEDvKcn
         CsDsahC5qGck/iKOxJj4jcvdas6YsKdLAXNczOaHsb3/d8fN8tVOFH2f70DnZpvr+cwP
         qiU89H7gmbMfrLfxuvVOP+j2rr0RU7c8mX4vMh/wU1b61OCT7D+AqhfF2eduQF5rYvZt
         rpDE38IPofNn5jNQL9YEIo3GEU9IDaKJlp+OL356hLEPhfXbjt1hytlOHQXt6L2K9wx0
         fzL8VtQ0gT0XqF29PMqB+ftWpb/zuY8TExgvWMchnjUZdUjM9W4HgRFdAehMbcJ8ZGtZ
         EcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846521; x=1727451321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7W5gSqYMNVOE2hqiKIz0DH0bS2ae4cjdLMrTwESeSA=;
        b=G1AmeopBpKo4TH+WxwEhT9WEOmigklyWHKU+hk7adz7ablynGcYz/NGn3FqYk8Dlsa
         hYKhdNCWoSIOuvJ9IAcNeeDHZBA+eqedUlFMRcMsaPbolLcqLD1fsZy8i6hJ8uxVWEiF
         FLSoT3TQcBKcvkCOkHQDCn08NjF412IMoS2uB3oKL4L/KmeA4Hl5QZb1kzfPXv1RSwK0
         ARn6WVCEGwTe7IcJgCJXkvupI5ECoftxjzu9KrAda0tC5veWOAA52iEb4fvxsBtV+u19
         Rwh0b4BqUMVrof4tnOLEqMjAO6VUHdnBlQDrXIbG6tT+Ic9+w4g9tF7NJAUj3DwrzWlY
         0h6Q==
X-Gm-Message-State: AOJu0YwAVrxaZXYWiCUSKtJIE7cI4YyL5QkPkwYtzWRvibLJqQliNlyX
	ooq/M2Wx8KCxeDLGEPvo6ZhD6ug/HCBuSRyPndKjw5Dc+EZDMUzuVfbb/FaBfugHtrGuPl2EJJ3
	n
X-Google-Smtp-Source: AGHT+IG4lLEzvgfgDFn++dSiqxw4R58mOHo0lpAXm9gwpHyatD5ZutYlJWPbc/EubHuW4fIzVq859g==
X-Received: by 2002:a05:600c:548e:b0:42c:b1ee:4b04 with SMTP id 5b1f17b1804b1-42e7c19bb69mr22017805e9.28.1726846521109;
        Fri, 20 Sep 2024 08:35:21 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afd5b79sm26060585e9.26.2024.09.20.08.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:35:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: ziirave_wdt: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:34:36 +0200
Message-ID: <20240920153430.503212-18-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=mwMAGDmK8Un80Sz53kxxyN3VjU+WlkHvXI01c91ArLI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZYcdzYps1gvYiHEJQplgHfNFNqMm4REqmDxf bvIUOAfKsWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2WHAAKCRCPgPtYfRL+ TjGgB/47SnLUJKZrJuqk7jHKj5ch7h6QdmrS7SIHFeunSHYAU83Y3Pu8O64sO3D0/7AL17XpnSe 4zTlPfFYei1v2mbmLqrtUJgw83K1svr9nkRx1/QO60V0akwToM7OaE4wHNQdGvPCNnIjxR5p5+V jvhObpo1BgPAqBeHR6jdvWvZmv2OYX+Z9N/HQaEMP2dZwjFoKfP2qiCwVHVwmLeutxLAMvs+zXG tHS1zxkDNOhomAdcvgVdwPkgumttKmIhAR4GkRYOf/BHXs8xPzv9aOx9hcogiCt8Rx5twQPFh4m 6z2PXvUX7J8Mm3VIqzap8wAfDf8HIKwqwYWr3SeXSRQvtv9I
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/watchdog/ziirave_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 5ed33df68e9a..78df5ebe5810 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -715,7 +715,7 @@ static void ziirave_wdt_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ziirave_wdt_id[] = {
-	{ "rave-wdt", 0 },
+	{ "rave-wdt" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ziirave_wdt_id);

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2


