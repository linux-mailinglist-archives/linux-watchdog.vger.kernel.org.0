Return-Path: <linux-watchdog+bounces-2071-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E10498C417
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2024 19:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4483284DA3
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2024 17:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7FE1CBEB9;
	Tue,  1 Oct 2024 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7EjRY39"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBE1CBEA2;
	Tue,  1 Oct 2024 17:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802045; cv=none; b=hf5qD2kHsnDWpps0WnivUkU81O+NZyxtPxaXluIobR+MMiuVawp9kTgmMvwdoXSFBU62CWsfvwJ5ThupH6G0v+RLkwQT26kehwnFX7LMU72GiGb2ciVH+KwMFnheCgeZWrA7Lsibv5o9fqPZDLeWegU97wW+LW7NaddRfeVcp3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802045; c=relaxed/simple;
	bh=VZ5AMUvC0LmVrPDCncgnGWvSyVO8/wYZmtST1CyQ7ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciXbKwCN3c0BmgEicaeYxHMpHJbU7DZ1b9oi+uOkbtmgwFuivFC0FlgPObETOVbg2xNbp2LYAOOvNIlvt1xrHI7RKCHEdWWCKXMR5S2gCsyWbmMuL68Z9SeFQDF8L+JjZDNvyyCRms0m8W9lw78GsPRLB/fhGzK2dXOzq8twPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7EjRY39; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso4360857a12.2;
        Tue, 01 Oct 2024 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727802044; x=1728406844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgNguRTnjUZaIg7uPr+xWg/1h1wY5swm1wRQT6JqmIA=;
        b=m7EjRY39VwDifSp6/jSTqcDtkA3BgT9QCmL2BcpFuoIg948dCck8hYP8W8OS1UVwCC
         PxjpXURppqmgGMK0CdHSQcaoY+LHSbxfVfoms3U+J5zTGV7kYKJLfDz2sYFPEDlUbVPU
         hdU9GzsRqSqpu34TSjcQxWuvIlLUdBnrPvPwaovvD6oBmiztEZgGgkStziE8fLsMFoOV
         nDX7Rl3S6JfX2KjfW3tfFGm98f+7uutZCSlx1GR/XiEHRKI5pPpA7mgx/UQlNvzdctoH
         xQWgYejATT+WCA9dk7YM5gH+f7zWBnhwatGyn0WS15X7AGTzUqFhx0QTuOIK55TRLEnt
         yT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727802044; x=1728406844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgNguRTnjUZaIg7uPr+xWg/1h1wY5swm1wRQT6JqmIA=;
        b=FOKhC1kvyyEWz3X12wx38WQVcJayCeAPfoKzn6XWk2doJc8OyDrkfBHGTs4HhzBIye
         ef2znYVNiDsDElCcqKyIQ7E2IT+Vr5hGlkI0/tfNH0cCwmJjpR9aVcmoyTGf8yRwambD
         vux0LZ7pd5u0J4f0t8Lvqy7CC7ZzaCt1EAHT1/8fyyK5YId7rMCgU/F2N98krZTxnUQY
         JiQSJ0JwecarOtF/WxZ+3urbwY/rNTkc3wq3yF1uVd1inb1aqCndUhWlGA/XegNU6AT6
         yrVRiIk8labsjTclfkjfN5oGLvdX9CRdJNqKSVhxlakCV3xGFfaEuMgqmEki4HCSRRn9
         nsgg==
X-Forwarded-Encrypted: i=1; AJvYcCVYpGhfr1SYm/PAzEsp4RWDxfODfXAGl6RvwyZAls4Yh2KA5mrk5LUSKxqcmnmidWP3tsW+LClJtE3jQte4mxc=@vger.kernel.org, AJvYcCX2ZBLfFF0BFgyd7k0WgWnzQWFBVTJTjGY5kbb5inPbLUxizgWZWVG1fyD2D0IbfUfU6FuhyxB2lFdG/F0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH9iA5nttknnwpGsGCzOn3yCMZNMkLQ5BQKMzzW31OZD70fIT1
	qX8RhAauLTlVp1ubqkwHamHAJyxArtnk1brE4DPpWAlKJbpiHan1
X-Google-Smtp-Source: AGHT+IF+p9R1d1pnL6XCGLnTwwX3rwlZj+UtFNg6vndTxf9iMVY8yDmwifeIU5ozJ1PoZ+VX4QFIvw==
X-Received: by 2002:a05:6a21:1304:b0:1d2:bbd9:4646 with SMTP id adf61e73a8af0-1d5e2dd9d54mr508335637.38.1727802043346;
        Tue, 01 Oct 2024 10:00:43 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71b2651623asm8234054b3a.120.2024.10.01.10.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:00:42 -0700 (PDT)
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
Subject: [PATCH v2 2/2] watchdog: apple: Increase reset delay to 150ms
Date: Wed,  2 Oct 2024 00:59:52 +0800
Message-ID: <20241001170018.20139-3-towinchenmi@gmail.com>
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
2.46.0


