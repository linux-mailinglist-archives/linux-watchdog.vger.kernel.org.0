Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899D9407533
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Sep 2021 06:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhIKEao (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Sep 2021 00:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhIKEan (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Sep 2021 00:30:43 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B27C061574;
        Fri, 10 Sep 2021 21:29:30 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id l17-20020a4ae391000000b00294ad0b1f52so1269200oov.10;
        Fri, 10 Sep 2021 21:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRCcdM81EEYiYZkpOOdI8A5If1TLi9jMkP3YynEYVVQ=;
        b=OJ+T+BjLsu0TTQCLUapemwtxyAO8dGvnGiSxYtTIcTXMKvf2qEylV3ADREKwZYyUd0
         vo+S1rfQIFhNRm0bVnf9EOzYkxzZ92k2YxiLmmOXZE4y3p/J/yba8wRBR0S9L3eEHEb1
         pRswhthnvIBB14KrOAubkh2+JFMSX9ykucQ1emLoVx/waAIiYVVe+yaTdX6jbI4fi6sc
         94nvdrhwO0RuNMcUGWst3EKIdF/SRsCr5mQSxIF+f1LyGyYs8JWmbrSd9B9s2rKeYz+O
         ZNupu29eyXZkYx6WNJldez8uC9HI5uUJs/yXdKh6waqcJUtXcmbYb+Z9U/F9Q5R3VV6p
         NCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=tRCcdM81EEYiYZkpOOdI8A5If1TLi9jMkP3YynEYVVQ=;
        b=l2CDjmKYyR1TPbnFIQTwcVH/4HTjit1k8wgS/28he6ZwRxFcSdXTJveGqjnBQdd6A4
         Qb5y0JlEgyG+3hULaOlkymI6fu3Ubr90BfpJZvGl1m6VhxDys/QXkp2Kz4QSrX/tGrRP
         0vKLOxneby60aieEl0gyYgAByd3STDahVe8JWqvrhClmp8x+xD8u16X8oWsUO4STMf8G
         F5WDYtmQu8zI2500VFkZFQHN1WP4DLnTgcEfNgQeF5KM0Lw17JlGo92QYFDl++b3omBU
         970pxkDwPFPaiJT+eqwk7aNcE6k3KnFs+LO93DpD4IlgcnqXLhk4/IO9j4TZ6V8MzdbC
         3xGA==
X-Gm-Message-State: AOAM532mIPk6xOTrTWh+HHX95MLUaRWSaAe8IipxcFGqj7wX0gGB7JTo
        B7AtqHtO6uJ88Nqq1/QyQu4=
X-Google-Smtp-Source: ABdhPJweg5kvOp4gg7hY1T6W0mVeWSFNP3rseAlCRBAlkJ3HJsuDnzK7/MerOFIva8/jPw5aDwr6mQ==
X-Received: by 2002:a05:6820:235:: with SMTP id j21mr833106oob.75.1631334569872;
        Fri, 10 Sep 2021 21:29:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j10sm206875oog.13.2021.09.10.21.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 21:29:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] watchdog: ixp4xx_wdt: Fix address space warning
Date:   Fri, 10 Sep 2021 21:29:25 -0700
Message-Id: <20210911042925.556889-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

sparse reports the following address space warning.

drivers/watchdog/ixp4xx_wdt.c:122:20: sparse:
	incorrect type in assignment (different address spaces)
drivers/watchdog/ixp4xx_wdt.c:122:20: sparse:
	expected void [noderef] __iomem *base
drivers/watchdog/ixp4xx_wdt.c:122:20: sparse:
	got void *platform_data

Add a typecast to solve the problem.

Fixes: 21a0a29d16c6 ("watchdog: ixp4xx: Rewrite driver to use core")
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/ixp4xx_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
index 2693ffb24ac7..31b03fa71341 100644
--- a/drivers/watchdog/ixp4xx_wdt.c
+++ b/drivers/watchdog/ixp4xx_wdt.c
@@ -119,7 +119,7 @@ static int ixp4xx_wdt_probe(struct platform_device *pdev)
 	iwdt = devm_kzalloc(dev, sizeof(*iwdt), GFP_KERNEL);
 	if (!iwdt)
 		return -ENOMEM;
-	iwdt->base = dev->platform_data;
+	iwdt->base = (void __iomem *)dev->platform_data;
 
 	/*
 	 * Retrieve rate from a fixed clock from the device tree if
-- 
2.33.0

