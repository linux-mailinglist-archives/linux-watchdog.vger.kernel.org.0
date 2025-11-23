Return-Path: <linux-watchdog+bounces-4634-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6CC7E70D
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Nov 2025 21:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BDE63A4B45
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Nov 2025 20:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC754190664;
	Sun, 23 Nov 2025 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHAWJT95"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1973126BF1
	for <linux-watchdog@vger.kernel.org>; Sun, 23 Nov 2025 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763929485; cv=none; b=hrA/AHdhjCW3Kc4xO1ukitPOeGUMUDgUW+VQun53/gpqpWmhHSdn3IUD8sbL1Eze57aPq7AahOFodPBHp6peEnathiQ137dmaggAXp3K7TIqNwkcC99Uq8E+Kml8qVnL1y0gVmg/1bZ3fppJDtqcjbGaW9LM02QDeYrGJfdLEmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763929485; c=relaxed/simple;
	bh=C4VolNS8osgWBF5JqiGi/ig8fzkkzBWyNcybWwlZlh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SX4UlF6g5dXxOnsMcPJchHUJ9fY58evszoskQ+6k8Lyv5OMqk8MER6nvnW33C43pZBmq+OVvGpx8yTKp/rUXeBfp5uQiWmgc5uITks3xixDPZ7YGAQTWU4UWr4XiMCdZ2W/IY4xhPrG7To3FMMCQO0kRsXvg2/wCTUs34UUjC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHAWJT95; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37cf475a1fdso2998671fa.1
        for <linux-watchdog@vger.kernel.org>; Sun, 23 Nov 2025 12:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763929482; x=1764534282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AF5ogFOESgOt7rvRfEwnyUu5pZ0Em2kftQ5XUCG+Du0=;
        b=VHAWJT95tdEei5tMAUuxSu1IUXxbfKxoZQzuK2+UkFfn0xYDAWBWkYCB4DTmYfX51o
         OJWddXjz/f04x7apx2kUsUW/ZqiZbMUIhTQz9iln1yHIaCkGB9Z6FD5iYfjNWReQkEaT
         XEAYPBb+raTNaUG7SZv8kgWK+/kily2w1+ExoOSiDvAsBB53rdz1wCQx/n6zi3rg6uZX
         LabBKY3FZv1OYolJqM8gEN5PqMI6cF9ANCpR/uem2gTWAeuaqfsn72cRWIt/9+25kij0
         +zRFLlkPwTUQNMBUj5OX8oAVkyfqNE8Ltjgk+sdSJtBPii0ABjkbKkm7GMuxRixX7AWS
         6mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763929482; x=1764534282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AF5ogFOESgOt7rvRfEwnyUu5pZ0Em2kftQ5XUCG+Du0=;
        b=Kymin6LiRm5pufZ1SzAPuVF8PEYtNbqGNHKxbDxQm5qO9VhMwnmv/W8MJlAL467j6w
         hzJXQ7mY9qe0EuX/featPy/cAWyijZOKE0JHqf8k6G72o1LjOClX3rCVeX1owBtsXwKS
         XDX8mND7LNbb3cdIzhKZASKxA9m2VvX6oTneIfCdJ+SHgogg2YjkzvKrwEBvLWYm8azC
         /M4tAyxX418fxvvwgzOQlFnLTON95crksXa5Fy/br8bf5iwv3TYVndkihtLuMB4mesP4
         mGFsIAguNlOiIt7FlMyQK7FcP+cj5lzJ3w1JEU904iJVSbi6RQpv2XyBZRX02C+2LpyY
         OdKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT2MC0mmZP6DBu/KxlUdAMOl7qLNxpzNnMv1Fsww7P7R151CGqyYcSI1ui78zsHmY2jKJc2jAv3PoblnIzfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0olAib5fXkfuAxX8KL6M7/fh55tnFni+7HzwmgazLuNC5+6py
	vWANGmq+EU9cYoTdcFQgY/k7iuS4ClNGXGoaHYgEw+TjEW68sg1di8QC
X-Gm-Gg: ASbGncvX+mcKDJYR9h3iyfHsZ0IJZOkSNFkKAAjJL5e0/6ZLe8UdN9JQUObElkABFzw
	EraUr8/Da0B9hX4SjFRA8W2ZLmy2du7K4842WSS4gxuO1pGmx7FJBFG0nSA+GVO/U53SCF7fsM4
	A015OmDFVdvncV8ACs1OAqvze/itK7RFmbht4f+dod12FarOTWZfvqIPwhuBmUaP+dzLDp8BAdT
	gVcJpGLaUHBJOOVL7Z05W0OrEPzNSi4TwLOxNu1Jv6c1t1BXNINdlXFv8YZ16Wid8isOHD/tvB3
	C2RGoWv+Pp0vnZ5+f1Ic69tsty1BR9KU/MWYLDQcCOcc8/yfGRX4vs2RHcsBNTK28WbP7/eFyh1
	dLSAdVZ8n7G4ffHXmVBSFD32Jzg8O3fSMek6TTXVKUVQnrzs9raFKi9T//qNmK4oxGdBl3mTjbq
	xruS2X+/irYOmpZW5pVXnaABRkm7NShjbnvSEW/x8qyzbQL3eJSls=
X-Google-Smtp-Source: AGHT+IElMmJIMHZiMdJFwuffpKzKXBYS7kUrz2YRBC6mjXJcPZe+Z3suYg7bX4lYoavOAlzsAyWpjA==
X-Received: by 2002:a2e:3509:0:b0:378:e540:2f69 with SMTP id 38308e7fff4ca-37cd92e0edbmr18198111fa.45.1763929482031;
        Sun, 23 Nov 2025 12:24:42 -0800 (PST)
Received: from CryoVivoBook.. (176-67-24-127.dynamic-pool.mclaut.cc. [176.67.24.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59d3esm23275771fa.14.2025.11.23.12.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 12:24:41 -0800 (PST)
From: Oleksandr Suvorov <cryosay@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Oleksandr Suvorov <cryosay@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: imx7ulp_wdt: handle the nowayout option
Date: Sun, 23 Nov 2025 22:24:33 +0200
Message-ID: <20251123202437.2340955-1-cryosay@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module parameter `nowayout` indicates whether the watchdog should ever
be allowed to stop, but the driver currently ignores this option.

Pass the `nowayout` parameter to the watchdog core by setting the
WDOG_NO_WAY_OUT flag accordingly.

Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>

---

 drivers/watchdog/imx7ulp_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 0f13a30533574..03479110453ce 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -346,6 +346,7 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 	watchdog_set_drvdata(wdog, imx7ulp_wdt);
+	watchdog_set_nowayout(wdog, nowayout);
 
 	imx7ulp_wdt->hw = of_device_get_match_data(dev);
 	ret = imx7ulp_wdt_init(imx7ulp_wdt, wdog->timeout * imx7ulp_wdt->hw->wdog_clock_rate);
-- 
2.43.0

base-commit: 1af5c1d3a90246a15225fc7de0ed7e5f9b2f3f98
branch: master-imc7ulp_wdt-nowayout

