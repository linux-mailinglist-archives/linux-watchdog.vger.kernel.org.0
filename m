Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF41F2AAFAB
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Nov 2020 04:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgKIDBG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 22:01:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKIDBG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 22:01:06 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1904BC0613CF;
        Sun,  8 Nov 2020 19:01:06 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 62so5779719pgg.12;
        Sun, 08 Nov 2020 19:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d5Okb+bKE2F9destA6FuDQoNvbzUpEWsIIoQzZu0fGU=;
        b=Jegh1z/9YUkA/NiE/+03skdq36MPFngOSIpMja8PqIgQS9LYnbIHiUJdnXpfEbOaZ+
         UfmFCPvistYbmhXXs+UF8LJkm7h/v63eqEPbmWjVRSxKetE7FlbYlQY3hXXzhtRITUKX
         gYAuQEtXajMAq29L+5WCXsfbKZZgoFZFPA8p7CAHr2aI7GMsnEJuUFz0ARj4kJfYhS5y
         HWt/kqRhZNwUwRnBwUVHbeyl5BnISfGVO6PnUS06EMzRJBizrG4/INZND7PIM85HRunl
         41AuGdaA3WKA/KpV3EZH8CH3D6dw3BkRRbvU7CIKseJqgKxOVziYA55bxc2GCIMgo8Qo
         NQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5Okb+bKE2F9destA6FuDQoNvbzUpEWsIIoQzZu0fGU=;
        b=giMB56mwC/1NC5yrTns9pkR+LV1ovQQSHTWofKl/iYnIaM6arIAIdad9kUafPiViSW
         W/BxrKfmSYtgLzDrkWnT2h7mpZSLfBU7QNkCdaYyIHBy+lcoSbAeqH7NJXOT37mwBkGJ
         4FqUozR7kW3s5tdw1JALdSfg9UUpvrlXgqTpPEh097n1CnFgL6tAUp0m6t0dv1Pmqeqd
         yWqTR3aTnhoLYH3OreC8vD79VMDGoUEdcyVAwJFoLeEwUAyhLeeH837LQZK3GwveWgsh
         qU0w8cFGLBxH09jL4mJaJ8Drhjidqe5mPjl4U8BhDxGeNm6IgFBB61OX5PUIUQgNRFCT
         HMnA==
X-Gm-Message-State: AOAM532MNag0X4hnm7EBpejkn+rbDIccmF1LTkxHbyiG+jekPGY67cnS
        jkO8xMlhim07CqBQfomtmrI=
X-Google-Smtp-Source: ABdhPJzavVMl0333dN3xTm0qb8m3V9l0m0hIMeU4uHy1cEfOPFq50ESHMPKwx95dnmuWOA2lMMp8sA==
X-Received: by 2002:a17:90b:118b:: with SMTP id gk11mr11157495pjb.178.1604890865768;
        Sun, 08 Nov 2020 19:01:05 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id u197sm4344606pfc.127.2020.11.08.19.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 19:01:05 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Jingchao Ye <jingchao.ye@unisoc.com>,
        Xiaoqing Wu <xiaoqing.wu@unisoc.com>
Subject: [PATCH v3 1/3] watchdog: sprd: remove watchdog disable from resume fail path
Date:   Mon,  9 Nov 2020 11:00:53 +0800
Message-Id: <20201109030055.27378-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109030055.27378-1-zhang.lyra@gmail.com>
References: <20201109030055.27378-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Lingling Xu <ling_ling.xu@unisoc.com>

sprd_wdt_start() would return fail if the loading operation is not completed
in a certain time, disabling watchdog for that case would probably cause
the kernel crash when kick watchdog later, that's too bad, so remove the
watchdog disable operation for the fail case to make sure other parts in
the kernel can run normally.

[ chunyan: Massaged changelog ]

Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/sprd_wdt.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index 65cb55f3916f..f3c90b4afead 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -345,15 +345,10 @@ static int __maybe_unused sprd_wdt_pm_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (watchdog_active(&wdt->wdd)) {
+	if (watchdog_active(&wdt->wdd))
 		ret = sprd_wdt_start(&wdt->wdd);
-		if (ret) {
-			sprd_wdt_disable(wdt);
-			return ret;
-		}
-	}
 
-	return 0;
+	return ret;
 }
 
 static const struct dev_pm_ops sprd_wdt_pm_ops = {
-- 
2.20.1

