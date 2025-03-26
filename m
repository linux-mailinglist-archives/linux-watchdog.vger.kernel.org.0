Return-Path: <linux-watchdog+bounces-3145-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD3A7129A
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 09:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06F151899004
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7C11CA81;
	Wed, 26 Mar 2025 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0bSnu/z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628AB1A38E4;
	Wed, 26 Mar 2025 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742977835; cv=none; b=AAyzZck3ZIX+RioKPoFUBX98aH6QYsxkChyhENaDKPmp64UIKJnptUuCVEZJnOHHnRuJARXsVXH3q0Ur3bmGWaRokuYSBdEREnOnEc2Qofy2wNUCFV/vLtOWORi6yOGCbe+ExcDUn3c2hbT28KIAO5KCnXWevcX+HSRvfERw/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742977835; c=relaxed/simple;
	bh=eKIFHuDfgG2JLghJI5Jj6HhQ9ZkGs6yg4/i8ykeba30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tanp/SaKmsjp6s43kFM5Ybt3VEm8Yg2gMaMNqDDzlMn/ZOungaSc6l0vFHAWEi9B1TlPZDLySa6h7zc0u7Edb62fx3jUhkypFO3nMmDZuqzi3Y9uwBk7bVsLUROY2T8xTBUHBexSL8T0kbwvv3FNcOi5CxO0XbXsegn1XfUSD+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0bSnu/z; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-548409cd2a8so7179539e87.3;
        Wed, 26 Mar 2025 01:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742977831; x=1743582631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJMWcf9PBUMQfOkrkjJxGLJQ6T1eFaGL3SYwJoC8vF8=;
        b=h0bSnu/zXDs/DPee8hIQj8kxBzcsa+GSOBYp3EG/Ofk5AeZuO0bFAyWAF5S7pKnNaU
         d20JAL5o3aOytZANCpq0iOHezi5YM6lcDnsyXDaGAuTwCWn9kIfMPmjrzwRSN4cj8gZT
         Qfx5BtV+96jSQ9wBBzSGXBfcMI08fBtuMHTPila5uNVSqXLdKx7CdKPH7yFKTZzqMg8v
         TDIkqThyePmT2Aiqxh5tfpv2Fad1E9aoKNdnfOJQQWgkC++cTIS+NaUb37Sqig0E7mHy
         Vef4DQEjyCUf7LzPeZNYlowrUmFm9KpOMQyRRLJ4UwgvZzgxDOr3YhudwURhPKs98dPn
         wyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742977831; x=1743582631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJMWcf9PBUMQfOkrkjJxGLJQ6T1eFaGL3SYwJoC8vF8=;
        b=dOASCpgIAmCqpx5DshgEvYGocRcTXBEPnhxJ2r4DbaboSrtdXEUgI1LAgtyt9TWXxr
         Poazc73XCjVbR7di0UWZyYMiUZl5yRPYsHbmRGtxtTQ/zjjJsyaDPhOXNmvgJY5+EkaO
         0i5BpN3LpREOUdo9T5kTwpWIgJ1DwvDzSAiDa0GekG2jsfR2/E24/r5ukZhuMJck5OGO
         qn9u5uJGZZTHrxtZruKfOydbeTGBcHTYso63+a35ecj6CVuQG1DIi2OBkZxf5QFQ8ZeR
         Zzq4luLzDBZMs5UoHVxaYQThw1hHv8jNxtvLX5G0+oK2MgI6y+5ukCw9LD/JAIwaFGG8
         rORw==
X-Forwarded-Encrypted: i=1; AJvYcCV5OGXvCA40Ofw/6jwcPMhzRSM7XkNeqGdqG1YWU0+8jyeMvhI5NsYXJOHcKQcf1XXq9bXE+zFsutTrTEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzey6TCYRMG+efETnZwJ6cneUhTYtEjlOJiH/I3kTCRg23iMoF/
	BWpCr+xdlvO/5wO18qz92MsCK55dwoLZFKlaA6vPSOuyvuOG67edLXGhj7UQ
X-Gm-Gg: ASbGncuzXTrOwLwl/53MltLHIj4nBOun8Vk0qZH4MwkBSFrY4Qmv55W84oNjHEfvHtv
	VtnZRn8WKmb6Bn53a3O7fAncEPabXlgmok5EvbBGsqIdwczG13RqGOHRaYDLLC2D1RCaIoEksHY
	AMTsfJHu2JvUsGEIqOG7d7TyEEL06rMPNu8nuEjzdlc+ksNjpOdd85a48cVfDw2gmg3GWYY+cNu
	J2RkfffJACcrP53JMF5SpQ4h0FTOak1XMkw9lAAglmT+5i12QQriYOksSg7SUZaKaGsQXW+E+ly
	NqElo1MInqddYM6AHwNBWkF4NGP1O7w65K5iuZe59z0RsdnsZPop4nAIxvzrVpmZSbuTtCkWoXD
	mPi+mMVQqRXJQ
X-Google-Smtp-Source: AGHT+IHTWpQ7i8lsqOnX/ywWP6CSnzvcImpvdhaJlG0prEx7zrrJnBnV+/PnH4rRifaJVBcGDcuQRQ==
X-Received: by 2002:a05:6512:3b06:b0:545:4cb:b25d with SMTP id 2adb3069b0e04-54ad64868a1mr6377110e87.13.1742977830474;
        Wed, 26 Mar 2025 01:30:30 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c6f2sm1707406e87.79.2025.03.26.01.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:30:28 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 26 Mar 2025 09:29:48 +0100
Subject: [PATCH v3 1/4] watchdog: da9052_wdt: add support for nowayout
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-da9052-fixes-v3-1-a38a560fef0e@gmail.com>
References: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
In-Reply-To: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=eKIFHuDfgG2JLghJI5Jj6HhQ9ZkGs6yg4/i8ykeba30=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn47sJ4LdFK1deGPlPAo0/78ymDQqMnxoqva/vv
 sCvmjaPE/GJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+O7CQAKCRCIgE5vWV1S
 Mh43D/9lwjh7w8k/F/9nyuFJW5UhSK8aozMVYQeeFtXtdpOdzq+AXf5HTto0ifrRUch+p4+JsPq
 SlRdkPLyEm+HvelfZHk+3xGSpuux5L/DadZNSAEyPJ2P5j1/3DaumYTxOORRiw+0pLpYCxuMAYe
 2hE/oBprQa5b0+ACV0QH1feTVDac4knFsWYbc0oINVx5EDiallXqoNo0Y9G+VoF2H2u/Og8JRRF
 Xb/ZcIgm3imyROa6nDDqxlNqxsAxNZSyrS2aO+WSSC1ez3jeYA+6djYC/5SBdMCQsdKNidwYTcl
 Tbrisgox0f6uUnkXyExIQOQzq5t5Ff7LjjESPNo6kwgr3x+3bS6qC/Vcu0g230IYIeEbAX4+6Q7
 TsrAWAbKNCtjd9UeyngMq08tWVggLeXNCTUKc7Qwfo51fsQjlRDze5f2jOYEkHQpNDfCBerWt/s
 paSuoVV+jObu++P1bI2jp4PebNpOsK9eKCt8Bpcv5je3s8bNDiotTuI+jt0z2liXhkr1zeb7nFv
 m3nHrg55FSy4e0wxnNiW5y4pIQsLp+zDNhG20S50c20+lcE1FWcdpxmaf/JAqlB6KhA8ev8maDu
 pIqVrFj9D2HSoefqAx3L6xt9TFwgoMQb9C6jCdJg/NT/4yJHPqhkuymT2T1JrnDtwYluNNogafW
 Fu+kR0Ir067317g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add nowayout module parameter for not stopping the
watchdog when userspae application quits.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index 77039f2f0be54273df1666fe40c413b6c89285a1..a8ff1e6a7903f6f139c5bb60d7d92ca39077ee04 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -30,6 +30,12 @@ struct da9052_wdt_data {
 	unsigned long jpast;
 };
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		 "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 static const struct {
 	u8 reg_val;
 	int time;  /* Seconds */
@@ -172,6 +178,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
+	watchdog_set_nowayout(da9052_wdt, nowayout);
 
 	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
 		da9052_wdt->bootstatus |= WDIOF_CARDRESET;

-- 
2.48.1


