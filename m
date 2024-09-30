Return-Path: <linux-watchdog+bounces-2053-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7165A989A6D
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2024 08:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0921F21384
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2024 06:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696AC1F5EA;
	Mon, 30 Sep 2024 06:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1hGAYwt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24DD44C81;
	Mon, 30 Sep 2024 06:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727676454; cv=none; b=saZlUHo46gLfSCaIXCS28O0WEqWRjH298yvRmRbt2nrwiQILR5UBV52fqHxJaG9L0asWnYJ7MwNqag6l18qyAeyzpoe/HjpkZ3xtGyKzX8z21TNoQEvZA/aaHQyMhP+GUYmXpEf9XiEgQqOWWAJeQKT/clD+f9kEWNvVNuppIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727676454; c=relaxed/simple;
	bh=uPvB0xPoy+enSpJ9YrjNT7knO7PNytAdD7sOQVaxU5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4cGGA+Ki+gVRFL5dEKn45b8NpeatVEkSrGRFyeqKwQ6IKN1GBkzk/692+OflNRfF7vIJ+DD4vHs+hvLInBwdCLHUDdIrFp0GbGm9clkIHN0bMTh6tFHt0etjdCYDFDvK+xmIZv+fPKlE+YyLEOC94yHkHQAUrAnI57l/Kd6kvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1hGAYwt; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71b070ff24dso3561423b3a.2;
        Sun, 29 Sep 2024 23:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727676452; x=1728281252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMwZ52rgNs2z/qva8eWDKf1Jz818c0mIJR5j/Mc97DA=;
        b=e1hGAYwtZbOhvNZ5vIAsi/kY0YoGebQwvMbqPqcg30xb3CkoqEqheQUVe2TpB+lEFU
         lYgKigP8lkIBLG1sabMQFkAlDqHUQ2vPXVkexIZGXsPAF4duTw0zVttEsZe7kzE1WunO
         a2AtDiE2utSNXJBUW5mxld02D3XxtmgP/5YwmBY8Ix5daxwTxW6h5nDz/q/Ilk/fRlcC
         H8Qzkc65PM+1HeJMHRyiGkwowo6ZzGgrBUlwCBtmFUbtuJRpKoKzhkE9lyh42sbdfP/p
         JsOyXjxo+17utIQkmIeUNrSlsBQ8UdvpI9YGFMZ/Gsdvy4gl2lEObtdlsbOt/ZLyKjkv
         vfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727676452; x=1728281252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMwZ52rgNs2z/qva8eWDKf1Jz818c0mIJR5j/Mc97DA=;
        b=GzOWskCWscsVs+UN79lY/c5Nc2sVsndvgOLDbxV0fNtlBfLM+cKeiczGW7SGtsZYBF
         cCIU5iSYtWAhzbo1jc1Z+V4D4VMnxukpfHQoC1f+menrV5r6qncLXGxoV85pXnUIfKsW
         yCag4PV0DOZgT8JzPYyzbNX/qslGAkYkm1QhmbLgeiS3pkia1VNIf0tV4waFpV+mNUF3
         S/kfyFRgwrYqGwggZ113P0a9TD77/OcAFb1bSiCOl2kgS9BRPvwJ0x28oZnFRGMbq2Bv
         KGFxdYMAj3WU88ilxL3sMu2nDVqPMztPJwmB8q8ak0uuqxyDfg3rHXn2xU6vtVE73uy5
         IKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBtf+kljnO8jLG5eYEPeTJZgckWjcjIVRnobmh9QqiGm6gU4A0ZtBFj33BE+L6tKNbsCy5dAm2a8bvK+29Zj0=@vger.kernel.org, AJvYcCXQZ5JuByeWsF1SOyqIyTsI1RLEOFLJvQ8VD/wt1uAXfcZxmV8sO2PuM1dTlDdhKQH0YSNhnjMENoksIbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4l78jsPed+TGRNaJzc17d9ngjVULVzbBHJ2tYhuOgwVmzDSR3
	R9HKnbXJmnGtPGxeNvKwzUGRjf0L4U+mqKIVfTxeSEsRvOYN/kSB
X-Google-Smtp-Source: AGHT+IE3Cw/qK4kCNeEhAnR/8b7y5fEBPaeUkjz0+6Dgitm2s6Z0BNGPar86SjGu4uqzL46UjUAdqg==
X-Received: by 2002:a05:6a20:b70f:b0:1d4:fadf:2d14 with SMTP id adf61e73a8af0-1d4fadf3c80mr14163323637.0.1727676451567;
        Sun, 29 Sep 2024 23:07:31 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71b264bb351sm5506246b3a.62.2024.09.29.23.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 23:07:31 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND] watchdog: apple: Increase reset delay to 150ms
Date: Mon, 30 Sep 2024 14:06:33 +0800
Message-ID: <20240930060653.4024-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Apple A8X SoC seems to be slowest at resetting, taking up to around
125ms to reset. Wait 150ms to be safe here.

Reviewed-by: Sven Peter <sven@svenpeter.dev>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/watchdog/apple_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index d4f739932f0b..353ecf0b04dc 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -127,11 +127,11 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	/*
 	 * Flush writes and then wait for the SoC to reset. Even though the
 	 * reset is queued almost immediately experiments have shown that it
-	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
-	 * 50ms here to be safe.
+	 * can take up to ~120-125ms until the SoC is actually reset. Just
+	 * wait 150ms here to be safe.
 	 */
 	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
-	mdelay(50);
+	mdelay(150);
 
 	return 0;
 }

base-commit: cea5425829f77e476b03702426f6b3701299b925
-- 
2.46.0


