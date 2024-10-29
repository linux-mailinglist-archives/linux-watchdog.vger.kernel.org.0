Return-Path: <linux-watchdog+bounces-2367-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF69B3FC6
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 02:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA0A1C21F16
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 01:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00210188733;
	Tue, 29 Oct 2024 01:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp9NUbcl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A780054;
	Tue, 29 Oct 2024 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165483; cv=none; b=J1YQXK3gLLVHWkMJERqaQfQfFNUsNwOpP45txZmv1q6g8fF1yeVkmtZP+fHJ4BFdJs6fmMB9m3Ix3MMtQ0cd8m/a6gPlqGJ2OSFYThdYBuaZPt1hBntrwks5qOlQpIO0DjdBvE8IfrAPyfUekpUvkdkKNRZWJwv1aIJ6SH+dj80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165483; c=relaxed/simple;
	bh=VqoKn0i085NYBXXwHkUOwL2fkvCdHCGrJiPFJ/U3NUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxXqMfh2SzD2MkFdbAIz5vTF/OP7fi6ztxmDXbWb/X/e/lEg0uG5ejJZ4mE2foijm7d/VVezYGWNXHOwld+kT5L3A5snvNMr3SU6vIoci+4V+C1BchoRYXOoPK1icsi05zQyEcK1vGxrg5k2hy6r7c2+A+llj9akM3SgPB++3pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp9NUbcl; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7edb6879196so3142527a12.3;
        Mon, 28 Oct 2024 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165481; x=1730770281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLlIgnNlMn/MjFz2hg97vAWrW6LF9UehdPASjV2ScCU=;
        b=Wp9NUbclnPzUZmYrx5Y2TPFA0/jyqn8XFJ+oGEVtralTmn3ohhszIHeSfflewYH9NK
         HxG9/lqidsSYXB9gn7rzDxmRJzTaBPXzWSZ/EFomPI+fJdS0HOVCYfNcRKQRhhL9FDCT
         j49VZr2D3o4OenRwmbQb9TBhuunk8dU4MZ7Wfa5zReCeplGemsdtAOckgQJSezonFL3C
         oP5RV6fvmXT0l3ss95RIFFo/ekhQngvILqzo+Ap/Hwbnt06M0qlU3rTcxr81ieza/QMs
         3rfYqrYftEUvaxlFgn63iYoBNLguD09uha2Uo70GHhWKWX1QDKxQxRqgBQZyOdZSYGlY
         7ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165481; x=1730770281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLlIgnNlMn/MjFz2hg97vAWrW6LF9UehdPASjV2ScCU=;
        b=YdiVce+ggQhmwvBb/pFVD+KC9BotaOQF4V6Eu2y7FcBYIvaox4/N9vKEQYKrPJPY0e
         zAwjegk7P5EotDnOmnJCV060NvpliL9aN7WR4Bcf47tIu/yeEOfcWtof9/e7bO+er+j1
         KPtcZRTp2OUJ8Hid3lHds8JzLgOwI9oMyQV29jXJTGpMj8JWkLChL61qHnZ6MAGUJrPt
         cT1UQenlPSDX7s35Ke15s9CTqdifHGoOzIyxjpvtGi3z+9e89NQoUCLkIycovBuO/9VR
         6EQ244c9uLqtc83qkQVqECdrgL8mzQ+3q6WpxeQJIiLKIYnvTtThJzxXgOYhZHixQ1mQ
         b5JA==
X-Forwarded-Encrypted: i=1; AJvYcCV+lrqk0MHDVKtGcUnNrHfGO/H3GhWeUDaOvopKJl0k+wt8MKMJN0Dg6TETDNQZImjxTgV488/e5unfajtIRCI=@vger.kernel.org, AJvYcCX7j9FeLM/B1HuOCKC6xz1nLf5fKEyN1WPYZki2263BN9ElfXhJVa2/5La7+1cXkfjkLM6ChsMYUhlOIo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXvYRdT6Wj0yuJ407f7sO8Y3/ncxadnZWx3wP7gtc6t8MFRXL
	tpYMvmx/dAme93Ea+bOPO2WrBY6y7dEJfA74uRMbfv+uV31I2CeS
X-Google-Smtp-Source: AGHT+IFsJ8/5pQAcma2IcNhwC+EoCEWeaDrvUbuERmpkGhRfDc2AJixjHb6s+XFCiJXWVYDvFRJCIg==
X-Received: by 2002:a05:6a20:c6ce:b0:1d8:d302:16a7 with SMTP id adf61e73a8af0-1d9a83ab53emr11772805637.3.1730165481451;
        Mon, 28 Oct 2024 18:31:21 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:21 -0700 (PDT)
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
Subject: [PATCH v2 RESEND 1/2] watchdog: apple: Actually flush writes after requesting watchdog restart
Date: Tue, 29 Oct 2024 09:29:17 +0800
Message-ID: <20241029013055.45538-2-towinchenmi@gmail.com>
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

Although there is an existing code comment about flushing the writes,
writes were not actually being flushed.

Actually flush the writes by changing readl_relaxed() to readl().

Fixes: 4ed224aeaf661 ("watchdog: Add Apple SoC watchdog driver")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Guenter Roeck  <linux@roeck-us.net>
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
2.47.0


