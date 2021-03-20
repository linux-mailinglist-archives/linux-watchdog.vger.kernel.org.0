Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90622342FAF
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Mar 2021 22:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhCTVfY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Mar 2021 17:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCTVfT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Mar 2021 17:35:19 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1187C061574;
        Sat, 20 Mar 2021 14:35:18 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id f12so9624792qtq.4;
        Sat, 20 Mar 2021 14:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AktKeE1+h+3g1MEfueGy0aFk88PrZLP/qzcYYZBxJkI=;
        b=NnLQpCkXgeHGkAJRDCuLOY5tjRVgeAoXBC5RMZuvI6PQIV20acXkOMa1yALXuUXwab
         61Z2VbwaY5xA+/+kwxBeO378pkchI3zMKTyBj1cI2hams7ajnVNvJexLlUoGQJpd1Bp4
         wfndKBYfPwjACk+mrFo8xx+WXiUoZfMbPcZD4cdsV3MMvWocQoHNX+ahe1DZarjNk8h/
         X2ZZr5PEaQnLd4pRnNiLNsXevNEP6hy3BimRsYw46fDfeDKjOJmFODDzUS/aCCk+ZOEi
         RyVIUgf7sK1h48X4W+GiZJWGBXGMAYFYYgEZcN/lC5vOo0Y4vL2Sjgc23lqto+JPrW08
         IijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AktKeE1+h+3g1MEfueGy0aFk88PrZLP/qzcYYZBxJkI=;
        b=DGPvfQhxwy6Ypa2oa8L8e1uPQHt/guaskgfyUrU21vDQ2JMnNyvps0LbpJK+/+JwtJ
         isueo3eZggG1bI+Yx/Wz1CtsPbvFOq6RSUqG7fLorffNRwN49CH0SIZ9sSpUmP9p0FnQ
         855Vf/FR2wz1PZWyDttkf9/JjrBZ0Z9hS1EK1vaNM/IzeuM11YUpIfHErXSxmDt84r5W
         xdgDu8B+2Yzj88VkNEHmeasSYpKW4QAlxj88o+CGVXr2WtJfNtaJLT2LuDk/C9u8XB/r
         KkhyZ5hqfHaauK77SWzZ47nnuKBqAKJzeUZ2OfDV3qhEIFZ5wLCFoQkh3uBP9Z7CeAij
         d0dA==
X-Gm-Message-State: AOAM5309RaHITqZqxhrEIp54QIbK1+1/PwNKTmh4dt3WrntUCPY84WpG
        LHg7u2I8H8mfrNMzFOPrs48=
X-Google-Smtp-Source: ABdhPJylHGK86aY/lUA7yIIHGPQMU/IlbkDga5ZA/tMmR3KW7yqirJ+jSnx5qzh2/Cel0hjcy3QIsA==
X-Received: by 2002:ac8:6c4a:: with SMTP id z10mr236579qtu.229.1616276118238;
        Sat, 20 Mar 2021 14:35:18 -0700 (PDT)
Received: from localhost.localdomain ([138.199.13.205])
        by smtp.gmail.com with ESMTPSA id h8sm1254195qta.53.2021.03.20.14.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:35:17 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] watchdog: Fix a typo
Date:   Sun, 21 Mar 2021 03:03:01 +0530
Message-Id: <20210320213301.8513-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

s/parmeter/parameter/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/watchdog/sl28cpld_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sl28cpld_wdt.c b/drivers/watchdog/sl28cpld_wdt.c
index a45047d8d9ab..2de93298475f 100644
--- a/drivers/watchdog/sl28cpld_wdt.c
+++ b/drivers/watchdog/sl28cpld_wdt.c
@@ -164,7 +164,7 @@ static int sl28cpld_wdt_probe(struct platform_device *pdev)

 	/*
 	 * Initial timeout value, may be overwritten by device tree or module
-	 * parmeter in watchdog_init_timeout().
+	 * parameter in watchdog_init_timeout().
 	 *
 	 * Reading a zero here means that either the hardware has a default
 	 * value of zero (which is very unlikely and definitely a hardware
--
2.26.2

