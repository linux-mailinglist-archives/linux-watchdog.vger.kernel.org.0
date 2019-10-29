Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB90E8E77
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2019 18:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbfJ2Rkx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 13:40:53 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33725 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729025AbfJ2Rkx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 13:40:53 -0400
Received: by mail-qk1-f193.google.com with SMTP id 71so13117748qkl.0
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2019 10:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8EHIOJjx9TW9fBNO1txxDakXsrb9eKAqZMrFe7L1UJ8=;
        b=N4uvAWbnMxnlVQuwSPhWuI+iHQ9cP/3WcMWZTEdu2sOqxGCu64ZiUmvMqDr75iWqjJ
         924n3vRWAP7OC9FD//0dAOkGhRkwoIj1cr1xY9WyeHVHIRMd/PY3nFUhUg/0rFhzVsWf
         uGljh9zykeSUOaq+ZTyD2nBzINJKhreVRBSrCKwDpKrismWW5ZstpMgTUbJ2FFn9Z14I
         p28hnXKLQvV6fnSjUf1OZENvG6o9jlKk77/xOsQK42fOZLrqDnrpB+gsq9E14o/RgKrY
         p9XW+cdqmqARM/+PUtR+XzmD8RgD6kh0NSsYJqDtyfVj+cgdvN/vL0RR3tAAjvsnu+oh
         G+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8EHIOJjx9TW9fBNO1txxDakXsrb9eKAqZMrFe7L1UJ8=;
        b=SbvIQXcSf/TQiegQcKM5Mf+5JpIqxAHbMqzBy4X52o+GVRov+izCEzt7J8Y+3Hmdma
         9BdX4zE3DVa4KDY/qP7U37+wE1TpgoRgN2bkYs3MJCcu/9zAWMfB211yPBDgZgbNGPQB
         W6D4Ts+fkvl3Xx76du8vzDhVWGstcGOR3Or0enrOzyNNSQBGEz0JQILKZL+e5hKNWciQ
         mM9T3AOVsdzePZVH03jubsP7FTNc3KFywEoxTjlz+RYRvnVs8S0KptUP3MgfOZItyfxa
         WVDeMXNLECjXfP72hbmibVc24dLiVbturwhLsncC3mWROSqxSgTYfY3LunBDqkYFeiVd
         0ZGg==
X-Gm-Message-State: APjAAAX/6hSnzL1uzyTcQDoLzq2uLYe1kZJqBCKZLnRf5WnxsNERppL1
        /7Xxt1l89toFA02SCaz8dhA=
X-Google-Smtp-Source: APXvYqwozPWGOSN9tsS1yu7qfr2Aa7y1eEkITkGZh5Y68PCV2QICDELDXgGev/CLPLSRWy1vZCPvdg==
X-Received: by 2002:a05:620a:548:: with SMTP id o8mr16594098qko.44.1572370851073;
        Tue, 29 Oct 2019 10:40:51 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id c21sm7417725qtg.61.2019.10.29.10.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:40:50 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Anson.Huang@nxp.com, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 4/5] watchdog: imx7ulp: Remove inline annotations
Date:   Tue, 29 Oct 2019 14:40:36 -0300
Message-Id: <20191029174037.25381-4-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029174037.25381-1-festevam@gmail.com>
References: <20191029174037.25381-1-festevam@gmail.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Compiler is smart enough and knows when to inline, so there
is no need to mark some of these functions as 'inline'.

Remove such annotations.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index ed4f7d439f2e..bcef3b6a9782 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -46,7 +46,7 @@ struct imx7ulp_wdt_device {
 	struct clk *clk;
 };
 
-static inline void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
+static void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
 {
 	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
 
@@ -59,7 +59,7 @@ static inline void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
 		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
 }
 
-static inline bool imx7ulp_wdt_is_enabled(void __iomem *base)
+static bool imx7ulp_wdt_is_enabled(void __iomem *base)
 {
 	u32 val = readl(base + WDOG_CS);
 
@@ -132,7 +132,7 @@ static const struct watchdog_info imx7ulp_wdt_info = {
 		    WDIOF_MAGICCLOSE,
 };
 
-static inline void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
+static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
 {
 	u32 val;
 
-- 
2.17.1

