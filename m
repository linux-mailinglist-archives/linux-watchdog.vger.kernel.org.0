Return-Path: <linux-watchdog+bounces-2070-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D3298C415
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2024 19:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5F661F250C3
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2024 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1811CBE85;
	Tue,  1 Oct 2024 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etWUpshL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB21C9EAA;
	Tue,  1 Oct 2024 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802043; cv=none; b=AtKU6PyF9PBSxbrKrm5pqm/sOIv/axkiCwdUvpsgaKo0HJ2NVjX+wCSUKpSF5aL4NB55fNnPpXyjaBa6oMtkK1NLkU6cLUZmxsw7I0uhU3NkPq9+y0R+GVqh8MHsHMTDL6WhyxNScovY9c97DT1Ld5KKQf+nzjO4yfvfO5Ttuno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802043; c=relaxed/simple;
	bh=XqLd+pXvyaQyau2YcXhMbU1ix+Q4b7XOj3ImJVBv4XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOAD9hpkEVsumCwv9gFMlgLkAR6Vq2Cu9+7UAOQv0mYcjXIEalIWxrow6tLZdmpCrqHrOVYeVQk1pXCdF96GMnv+Mo/5QfHdTT4Lx29aQYcuN4Q5XPr6KyywLFE7zOBR20uUqIMvEE5PQrvGwmyccioOmDT6etJqwywxbqZPHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etWUpshL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718e2855479so4158070b3a.1;
        Tue, 01 Oct 2024 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727802041; x=1728406841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK0basgN0caXy6pJhRrEiTQEkdwQudaB+HfTNGByWoo=;
        b=etWUpshLQUKtQmxs9rIH0lW7uVOu98VexQMnpxGrZ6iOgA99aIgkzmhypMgF/IiKEn
         +7/kSTQXwIEhnnM83A1RsFAWDzF4n+CRLVW0nz7OxtqoXEoM6YEkUBbVdf8QrdEaJyIA
         ago1906mveOaVdcF6NBpmw3DsE5t+DmAzsShdPv8DZfIv9PUCkNjSmHoMO3deZWeEnup
         QfgsEqBA3dPVxDmKEmWwdD8bRjcMSiTJ6uUNkmF6bG94kX136btaTGXc4hZSyKKykZTk
         nLPuIpAbL1meqHIfpN6x3vWzMPRvp9Mx5xm+f2skNSeuqWJCY54QcvFDLmj+pZWPOdo7
         2X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727802041; x=1728406841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZK0basgN0caXy6pJhRrEiTQEkdwQudaB+HfTNGByWoo=;
        b=a7ucsWbw7Q7Lr2m5AkLcP++X15jSzsecx4amzt0lU2wjO93/+oZMiEtuTthNwGdqmb
         pxbpLz40nJm7prstJJ4KWxDGE8xwcdOYVBXttmPJy6dlZPzR7b7+KMH4t/d6kTxkCeOn
         +SmmDbP/8gqQImw24m21pYu9azFTM9ALAqU0ryt6uwvz8kq5t33AgO3aSKbwevQ0Sn/8
         hl7iOEsVTjpiVsLJzPDDxMmQdeez9CH3O63iq3oApB/mzF4h36O+D6dWX+2Ljur5S6JE
         ml1zqNCw9t8mjCKj4gWrmaaQ19zS1Dlu/F6bPW0L4o6RkCn5OWUeqHgbQJjNTHmYt8xH
         pbdg==
X-Forwarded-Encrypted: i=1; AJvYcCUTKI57JHj05EbncY7Ia8ySCjWcI+C/OFcli3G6rAEwPr5n6L7jKaxwOxRiAf5lfIhnHPP+y5YEKCpkC4lYpRE=@vger.kernel.org, AJvYcCWrOo8LvmqUINHxgikxnX9gSlqVNcPRIp+T4z/9KBaqN9RgVNsqm43P/5rcANCcaEaT8+cKMenfsqBL50o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK+TMSgpPbJ+k7rAtKPNqo3SXUfwb68xGCqRqS6IvkbtuxCLh4
	rJXYyVi0EGHfgGNqGeon8nEiuvbMGoI/4fkmGU2LnleEOHawwWeO
X-Google-Smtp-Source: AGHT+IGSi2gxdtKct+45b4m5zF0ZBj7/3pYWbnN++bcS5SKmJSk64eiCV8YmteZG9KCnAGLvlJKFMg==
X-Received: by 2002:a05:6a00:3997:b0:718:dd89:a1db with SMTP id d2e1a72fcca58-71dc5d6f588mr412601b3a.28.1727802040771;
        Tue, 01 Oct 2024 10:00:40 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71b2651623asm8234054b3a.120.2024.10.01.10.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:00:40 -0700 (PDT)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 1/2] watchdog: apple: Actually flush writes after requesting watchdog restart
Date: Wed,  2 Oct 2024 00:59:51 +0800
Message-ID: <20241001170018.20139-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001170018.20139-1-towinchenmi@gmail.com>
References: <20241001170018.20139-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although there is an existing code comment about flushing the writes,
writes were not actually being flushed.

Actually flush the writes by changing readl_relaxed() to readl().

Fixes: 4ed224aeaf661 ("watchdog: Add Apple SoC watchdog driver")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/watchdog/apple_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index d4f739932f0b..62dabf223d90 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -130,7 +130,7 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
 	 * 50ms here to be safe.
 	 */
-	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	(void)readl(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
 	mdelay(50);
 
 	return 0;
-- 
2.46.0


