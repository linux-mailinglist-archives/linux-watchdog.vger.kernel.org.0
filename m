Return-Path: <linux-watchdog+bounces-2368-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7AC9B3FC8
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 02:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED0141F23182
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 01:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACAA18FC7F;
	Tue, 29 Oct 2024 01:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxfL5b8o"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941B07DA68;
	Tue, 29 Oct 2024 01:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165487; cv=none; b=TzriD6QFhH1dU+f5LnJ3O+XbHJX/InbHbwJecU6sNjRV9TDFo7QbfmY7TrM3atZ1ZZcTrxvMZBm/1BTatzpKrvTghRrM4jSwvjy1ihA+kPOtoaJvvS+qliwH8UsAQOSUHHus9jRlA10Z65kMo48/g0CA7DTii32Rww1Blh41asE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165487; c=relaxed/simple;
	bh=NSHVBWbogICthgN37WJmF2hsHjd0eXsxGqoFlVCPbp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hj+ErK8NgJs9DEloaB6LE0uHagSSW1U3+XEL6ocohqU8wc/zvq//b7w1BwB5+eO0Q+hy4U4FDBWQIHsCk/DOZp6mfzMSazJCy/uR520v0iQwSx0mat/xmMC5/rgYx3l0/ZGZQ+bkk6K3Z65mzV5SU58W8xD24xcBlWQ41MQxMtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxfL5b8o; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e681bc315so3442250b3a.0;
        Mon, 28 Oct 2024 18:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165485; x=1730770285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F22qCHP6afNbcrGoAQJ3oBUeXfRzjwgHNZ47hyoRqrs=;
        b=mxfL5b8oX2fwQ7FOUDIK7pbW1pFuk8tygOqj62At2z+bHN9s6e2AlBvO0d1V3d7Jim
         OUd/tTYEbQh6g7/ISW+mmH/iIf0g0E9IGQij4JIT/EtaOilb9Dm39XK2zqvlsYOK/z/j
         D3I68Dvc87837YklReAQdERsZVPTzmeyyQQv+U4H3fiUyw1dPlOHznLPqYqamigTO7GS
         hhRCYxbiSrDRLqQiDLyHbDd3+/ClMIF7cHydOm1VoTxUFQbv6nETwfPPGECm/8TteOWB
         d3XXqlaQrqkPL2NISUdkyJbuuExInwO0L2fkoB4vKRP/z7vQpULwDJrPkXj3pbbR9v2b
         7Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165485; x=1730770285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F22qCHP6afNbcrGoAQJ3oBUeXfRzjwgHNZ47hyoRqrs=;
        b=umsjUm4ywGVOYluaiIbv7BflI+qMK1fUdXLX1DMpqoA+bZ93KcVwNU8Eq+cSSo8yGG
         keTfuo1mnFriYUpJ+GyAUh9+08xw6VuQsnl9mo1sCeA6gZNvgrom6YA2RIlxxc9sVY8c
         UE/uhU+ZI8p8AUS3RtGrmJAKdpJeIdKXP0mieBJt+k9gz05+JMOGbpNV9121gUcuL6Nq
         CrN3KS5b7xVykCgKanEUc5j3JcJP9QyKCenfy1V1P+YmlWY3vKvGPwsmJe7SfIsJcAHF
         osR8xHCxDRbKGcL5hc1vUfMUEzjW6kcNivCeARF8QPgPwnOvgutAgWP+XSA1jMQHBcmq
         XKPw==
X-Forwarded-Encrypted: i=1; AJvYcCWXMcIVEeAa2bgFpPIcVXYe0Xa9rSUtNGrhmMoez0wRE4OV8k1SVVJ48jisAyukZPwEDM8lszz26ee3lIl3R0A=@vger.kernel.org, AJvYcCXxTiRF3Tsh+PsGgJahq4x87BMuJyfkTrFYl1L6AVtDPpxNhe2Ik1jA5hLMDZKmhL8jwrSKAPauQZSPTQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGRonWIj+PRTv/b/KV6XWAZv21LtbqrE7+IbK5N9cWkb9C1wBF
	nHkpg/sAnqbSMBzpGNtndWALmLU02680EyBYw9/b2eLuXD+ncBad
X-Google-Smtp-Source: AGHT+IGyIb7Q8egCdWVoHzLFh6oz2bKRaVNI9AS0F5sLQSVgIeGhhVlP3LwlcUK0ZiaVTtFh86x4rw==
X-Received: by 2002:a05:6a00:741e:b0:71e:66e6:ca17 with SMTP id d2e1a72fcca58-720967cfbe7mr578632b3a.9.1730165484691;
        Mon, 28 Oct 2024 18:31:24 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:23 -0700 (PDT)
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
Subject: [PATCH v2 RESEND 2/2] watchdog: apple: Increase reset delay to 150ms
Date: Tue, 29 Oct 2024 09:29:18 +0800
Message-ID: <20241029013055.45538-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029013055.45538-1-towinchenmi@gmail.com>
References: <20241029013055.45538-1-towinchenmi@gmail.com>
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
index 62dabf223d90..95d9e37df41c 100644
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
 	(void)readl(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
-	mdelay(50);
+	mdelay(150);
 
 	return 0;
 }
-- 
2.47.0


