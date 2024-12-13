Return-Path: <linux-watchdog+bounces-2566-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D339F135E
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 18:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3613188D3B2
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 17:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADC61E47A6;
	Fri, 13 Dec 2024 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHsPkfiD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB11E32CD;
	Fri, 13 Dec 2024 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109930; cv=none; b=lEf67Bx22RWVk6S322w3bNuhWhoovOPvMBXGaoogkHN+5BRLvf4K+QyGN27mp9slhA5KqL3waIyReUMqfqRXtBeAOwJxVs+MrjlKHAVYkXqNoMvXBhT0vwZmNYIqIZR9Ei0X37nsIEon8CkAZ0iB2I0iMvSx6W93DD358fafQnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109930; c=relaxed/simple;
	bh=CHbe1zLgcnP1mR9tPoz57MNsLOaPtRXtLWYQ5MpI0b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sommXURkVkRUU43kwfjclRNdetmBbtJim9ESlXyKZpAkJ0oG+i2a7qklu+zA5JokyyInr9mmZcXLW8PHfi5uen1LVpUI9s+kmIowKVJ2ygbgI77vOeNUUr9p1fKI06/wHByDQtu/1hwB/pvw97vmDs88NTAawmmdt1PYi6TjlSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHsPkfiD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-382610c7116so976684f8f.0;
        Fri, 13 Dec 2024 09:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734109927; x=1734714727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cosCweGLIq6uw1npapxshH9Q6LNZZ3gk39ygK5yk0BE=;
        b=eHsPkfiDuyx7RPZcq0k5AOxkqBA2vxGmR09VnQfOGEywSePnbAoG8uL1sBle6ZjN9N
         isaWCYfWIpJ2FjWi7KOHB44bI04y28aiv0qdttNmDyxc2sb2I7GzSXgWT+ZDoGY85vaU
         hx20XllDJhmCb9LfB8MyrUKT4Y1l4MzJK0ZvBsbWbtWbOPzH5c1xrrfVHkbE11pFF5Rw
         ZemVa4c/zZReOCxqhDEMYDT06LwWInmbuU7jIbSTSylmbsWN/IVKSD+0odn67D2kJgl1
         6aC4EML03N46/l6JH2D6r6tenc562ZqMD5hAu9ceiS0Io8yyeTGyuX6oqLxmjfepVnpg
         TzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734109927; x=1734714727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cosCweGLIq6uw1npapxshH9Q6LNZZ3gk39ygK5yk0BE=;
        b=CiU6jbQxOnCatHFki8f0sD613+75QlHtfZ7hmZd7KNjbWr2wQvesQ+GOoHWEx7NAuA
         MgsUMRyBJ5Tqzuh0jRpBPELH8InfB9PXWxUic2js8PWqf9CCAFZRHAilURM05G0Zezrg
         5j6BaSn9OPIVcnAUrQ2rMIcBcAj/a4yxoEFlbLCGY8LPvzQ399726vfTiaXkfinpHgSA
         6MXOkT0yfuKUWEDFs6gQLHqZM2m6lPTUJJG/oo8w3Yz7wK7qpx2dyvv9VWkDjsgZXI5M
         K5pHr3Ctgd/yyPT9VIDceNmgfoA5bip7HMw7Av9bxSKUfF3UhUSeHNZAcsK++ldWTiVu
         IF8w==
X-Forwarded-Encrypted: i=1; AJvYcCUozpJd1n6SfaXiCi/uSk3xTffm400IYPpzkUbT/vD/1/TSYPsORj4RoxbFJFe3oEjSnAyIST5ksU/oCYb3Yynd3g==@vger.kernel.org, AJvYcCXjz5sfdGeJpALq22QhAkf9O8aaz+MmPNsemMTuCEOuM9pYgJ/p9PWE5tNg6HrrZQ/23aAOp0UlHePdYMCITsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc2ztFbpPLjvv8GPE6njaPnCRL/WMfnNP++IQfl4H7Hr5OXlFd
	rNY2M4D1Jlux8/2vWPztUeOoxA+S+BPkZBuFIUSCczeQCh1KQcJK
X-Gm-Gg: ASbGncsrv0D2qreM8ODIdqZYdJVdKRznVL2zNy/r2/aJs/DrPAwRjN0KxBWccCRkRz/
	mXskD2lTkbQoERiSPaYyu8xZAgB1ECeF4alrJZtaTvEu0zKMl1TcmS06/Xg/MnjrfrL/JH2QiyP
	b8TRt1rwkffQP6uNd8n4NAxBsQ5IAN8Eti5lUnT/izC3SO10eJei244SU5ZZofCrcrmtJM/e5zS
	1zIh8iOE+NVMHu4ATR6KTgtP7lQWZ7E0pa/sLrBAmJ3cBHXEtqcqkRre7yy17FlrPWssCtaA0P2
	ld0ViX/AnQ==
X-Google-Smtp-Source: AGHT+IHGfwaqXzCxa7Lf0mWp+aEiNVr/jNbfnXNOrEMLInrQnPWme3JxrJhozowbSBBn+qS6iR5MRg==
X-Received: by 2002:a05:6000:795:b0:385:e5d8:3ef1 with SMTP id ffacd0b85a97d-3888e0b8f92mr2922944f8f.44.1734109926499;
        Fri, 13 Dec 2024 09:12:06 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8060905sm3803f8f.99.2024.12.13.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:12:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] watchdog: rzv2h_wdt: Use local `dev` pointer in probe
Date: Fri, 13 Dec 2024 17:11:57 +0000
Message-ID: <20241213171157.898934-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the `rzv2h_wdt_probe()` function to consistently use the local
`dev` pointer, which is already extracted from `&pdev->dev`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 1d1b17312747..8defd0241213 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -217,24 +217,24 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->pclk = devm_clk_get_prepared(&pdev->dev, "pclk");
+	priv->pclk = devm_clk_get_prepared(dev, "pclk");
 	if (IS_ERR(priv->pclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(priv->pclk), "no pclk");
+		return dev_err_probe(dev, PTR_ERR(priv->pclk), "no pclk");
 
-	priv->oscclk = devm_clk_get_prepared(&pdev->dev, "oscclk");
+	priv->oscclk = devm_clk_get_prepared(dev, "oscclk");
 	if (IS_ERR(priv->oscclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(priv->oscclk), "no oscclk");
+		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "no oscclk");
 
-	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	priv->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(priv->rstc))
-		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
+		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
 	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * CLOCK_DIV_BY_256) /
 					 clk_get_rate(priv->oscclk);
 	dev_dbg(dev, "max hw timeout of %dms\n", priv->wdev.max_hw_heartbeat_ms);
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
@@ -251,7 +251,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		dev_warn(dev, "Specified timeout invalid, using default");
 
-	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
+	return devm_watchdog_register_device(dev, &priv->wdev);
 }
 
 static const struct of_device_id rzv2h_wdt_ids[] = {
-- 
2.43.0


