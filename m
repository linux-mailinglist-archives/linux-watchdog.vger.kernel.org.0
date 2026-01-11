Return-Path: <linux-watchdog+bounces-4792-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC3D0F835
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 18:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C02A4300662C
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 17:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2701E5B7A;
	Sun, 11 Jan 2026 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKlOVDnN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCAF156677
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768152634; cv=none; b=ZGyVhLLZYhuHCWiPIDo65i/KJyiWbHKJ9gu8RUph2uVqy2rfIgWFbTafnzplDnh3xFuYBp6ulR0/cBbOharbvK/yHHrvEpmQp33HOQtQivPzAGxZN55D9mBCQfZJHhmmV/KiF03LSFUONCBMahuJghD4QRuuMcB92nqemtjWmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768152634; c=relaxed/simple;
	bh=7VZpYSNTIyeuxkRGN+r67rmzBHe1Pr9K7IFJ/0/wK5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tD0YwVKtEjlzldhMdUVyIe0mldCcDTE3GpKn+8V7F19RrUiY9l1N4eG66ghT81jrUlLLl/tgOES1LzluZ37x1OB7P/g1z+4JM0UuKK6IXDEUjQ3bBrXKvIzqLz+ME/1Kq8N35G3OZK40slB2t89nNIoBK+Tr3K9XjxydFYjkWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKlOVDnN; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso3537416a12.2
        for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 09:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768152632; x=1768757432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7nrSGen9ELczdoZIkrP+ZjFm7clYGQK8MfF+8Qg6DBA=;
        b=KKlOVDnNOQbYXBA5cgeAqfEG6NW/IimBbjy9r/zVHhhYmQdDjjiqjAKseOr1uCozX0
         XBb6eijqwBIbrfwVkz2DEK/VKS1uAy8tM5Sit1KctbU/1lpCjuqw7ZsHa5xmj+q06ezM
         yTJa4qF24PcuXLGk1xk4u4tZMDP7tX0ME3BX4/5HsWXIReaow3mDKlP76aN/CCZVmnK9
         o7Gdg5n9+PBkPlT03kM3JyHbni8CUEjzjITmJZyAHQftEsPbQqRjz8Wfw9PG5n1JWuYW
         54uuLTEu+Qpf327EnQOkZNeQeg9RubJGDd0XXDjzFs/wKhaVK5NDyteTutGHJLAUHpgM
         UHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768152632; x=1768757432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nrSGen9ELczdoZIkrP+ZjFm7clYGQK8MfF+8Qg6DBA=;
        b=pDrllDUmJLqNyYvxSnyA2QjQdEkO4kYnEYAXkmKuQJ++OAA02YilKgN2KAmTr+Ogu1
         wNFdARSv+Cwrx+VMoQudzaVmF9fzEUsIXrTgkzxw2VazwT/htio0TcvKXmFzJyqsC9PR
         5LsWXu+oDGLn8mZCzg8Zl/b3/NxbEe/Xae6UkQAsuHbGLeB84eeOPRolFRNnuXEMzXXR
         PNZUnSnyBw3eFbBUeS44Yik6ZEO4c+DNXDIb5QdACjw+Jmfpga4LUBW3Uowp2OkwlD5k
         fI1PuwI0mvKjTU7wygX8nylmP4u/V7xjmY8oW+XDh9bQRMHgPJD+6S5xadUFYSGxaN1h
         wokg==
X-Forwarded-Encrypted: i=1; AJvYcCW09Nt1y9FjEtifaGbWNyN/bCbkQ6iAbA/QWsSYEzmrb9TM50vtgQkoEKINz/tVyqCN297qH9vbEb9Y0JbcHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBAp/SWJQHbUaxNJMe+BOprXv2BlXWZoF/BArtG8BWArRWL5xz
	UbevEcb/GvCi9Gc9NUKpAbCe3b9njUkrPMKmN+J7E5iS3prW8T0rhzI=
X-Gm-Gg: AY/fxX7fAAeGtZGOeJdBGhkrAco4XORDMDfvVWNk15Hz1/iZCsSsnIY+bxFwbidhY+k
	NR72gDsGgch3pqwMWaUXjbfPDlrSMM5BhERIM5HSIEVLiWXd/ByaB4vxfBCVaDQDquf0gpJPYrS
	/2NrOSsilk5R99isuFqijQ0gtF43wqQtnXIgRzLyeOtj5EQsgYrqzrV8xqwVx8EHvKPE5obZl3g
	uKmR3vZBNjR3gbzzzpaEnCT0p4qCRNTobkTyXV5Vdttb2IbCfzQEE4DV/MQh5WTToviVqdm8lDo
	CePdxl0PTpfjYByPlckr+cwTnCaRSp3yyapyHgc0gR9/02Lp5fbpttu6tWr3U+u8CXHiXVTilvc
	RkPrEXWe7n5vuYAr/dH89SX6YRH569LN6bZ9n/K957DAHrSJDIXSjEG5GZVFJASN+AP2ix7Ctl3
	636XiQQ3WQiguz//6TXwBfm+h208I=
X-Google-Smtp-Source: AGHT+IEeqHwYLv7QxsawYg2jczXhkYltIB2FIksnniX2UukfReFNgpA9EFXp0v3MzGEAKGHJ7GFDgw==
X-Received: by 2002:a05:6a20:7d8a:b0:34f:afaa:125b with SMTP id adf61e73a8af0-3898f992bfcmr14037306637.50.1768152632273;
        Sun, 11 Jan 2026 09:30:32 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([45.136.255.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b9a3d32sm5066831a91.14.2026.01.11.09.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 09:30:31 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] watchdog: starfive-wdt: Fix PM reference leak in probe error path 
Date: Mon, 12 Jan 2026 01:29:15 +0800
Message-ID: <20260111172914.2191-2-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM reference count is not expected to be incremented on return in
functions starfive_wdt_probe.

However, pm_runtime_get_sync will increment pm usage counter
even failed. Forgetting to putting operation will result in a
reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: db728ea9c7be ("drivers: watchdog: Add StarFive Watchdog driver")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/watchdog/starfive-wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index ed71d3960a0f..af55adc4a3c6 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -446,7 +446,7 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, wdt);
 	pm_runtime_enable(&pdev->dev);
 	if (pm_runtime_enabled(&pdev->dev)) {
-		ret = pm_runtime_get_sync(&pdev->dev);
+		ret = pm_runtime_resume_and_get(&pdev->dev);
 		if (ret < 0)
 			return ret;
 	} else {
-- 
2.34.1


