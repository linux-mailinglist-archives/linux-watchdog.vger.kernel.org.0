Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 929CBE8E76
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2019 18:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfJ2Rku (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 13:40:50 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43582 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbfJ2Rku (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 13:40:50 -0400
Received: by mail-qt1-f194.google.com with SMTP id c26so2770497qtj.10
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2019 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fCtbEiPh4RVwJQFmLbcxYcjZMuCT1CfeoiRz2toc4rs=;
        b=BGbyT7aG7xJfe77ae++8pKxAHf3lqxRfOJApKzZpcfoh+20ZQyEEaTQNg8A3RWjwZr
         kFpV4J0xSYaasH3wd+D2+XCiumhiUGYRZHqraKl4pSmN4BUsWj+Fz09BowwZrLoKX6Yj
         zD8UnHDGlD4ossadnsm6uieSxfOY4JTGqc9pWcAF9lz3cETyAGxpq9qD2G3S4ENvAYtC
         N5x4dTvfQwsdvT0YxwQc2iEUUgdF01C7Rv/jmMb7nhUkaECTHj1HIiKSf/KopsHpsGFO
         XPOGUEM/iX/InkWdDJrpzs4zp1yEMpXjIzjG3fq8T9KDkUGKbi+tQYxQGA8dujO4S7f3
         5bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fCtbEiPh4RVwJQFmLbcxYcjZMuCT1CfeoiRz2toc4rs=;
        b=kBpVKfl2QW/9rHIQ28jxMoqZ4MzRj36mhSb2Hs6BFCbPuVIR48VuWBdQDaenGZN/Gt
         6qiM/4ZM7Guej0Hc6rusdyPjrJifI8KAws1v/3YqAG0pkV040v+j08wm/H+Ea5M/Eik2
         gozvYc5ESXUX8c4z6Fs1k979wmTPMKi3dMyZn7W6EuPAbdl9DJpe0USAY7+TUZSR1X9r
         qiUcnwUJTR1r7typiXu3WJQCg1RyUKJ94KcFkKTPSZB+29R+g4cj3c2qVHhUIB7kl6Fo
         cIZwTDozlPO7FEGVKgkYBsychq1PtFQffn/QbGN/bKC1K7wLNeBs07nTJVRYFhWobtDz
         QPUA==
X-Gm-Message-State: APjAAAWloKfdR7x4krYSLwDtVnrHfDCrElvce3oO+Y4i7hTjBB/N98z0
        H7mJ/JO+aQDjwx8nbk+GrZk=
X-Google-Smtp-Source: APXvYqwURNXyGJAniOrJlVckcVE63XFuWpOlqP4tNYSMIzeEXQkoKpnFaqdDWLqNhflu3kTlT9Q0Xw==
X-Received: by 2002:a05:6214:421:: with SMTP id a1mr16180491qvy.0.1572370847839;
        Tue, 29 Oct 2019 10:40:47 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id c21sm7417725qtg.61.2019.10.29.10.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:40:47 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Anson.Huang@nxp.com, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/5] watchdog: imx7ulp: Remove unused structure member
Date:   Tue, 29 Oct 2019 14:40:35 -0300
Message-Id: <20191029174037.25381-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029174037.25381-1-festevam@gmail.com>
References: <20191029174037.25381-1-festevam@gmail.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The 'notifier_block' structure member is unused, so just remove it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 670102924bc1..ed4f7d439f2e 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -41,7 +41,6 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
 struct imx7ulp_wdt_device {
-	struct notifier_block restart_handler;
 	struct watchdog_device wdd;
 	void __iomem *base;
 	struct clk *clk;
-- 
2.17.1

