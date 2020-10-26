Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29B062987F4
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Oct 2020 09:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771212AbgJZIJo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Oct 2020 04:09:44 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40803 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1771211AbgJZIJo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Oct 2020 04:09:44 -0400
Received: by mail-pj1-f65.google.com with SMTP id l2so2676788pjt.5;
        Mon, 26 Oct 2020 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=INIAEmZS8UjcdAD7KdEdkKuev1Mu+DgAwJosPnLiQh4=;
        b=QkO+pFxUeQYoTihQFihub1XH5I2mq+t1LiOcCsTkg6VpFtjTt1Tcg5yOqldeU1kxar
         DRPL6n9Ty5Y9rHLRgzDf+az6thXsoESHXMidNz4upAUKAAt931+No2mDh1pCq5VM+fEd
         YEul+Q3bFAUh9uwA99Gm3fz54Ku0T+IbLVNWcCf8aTKmK1N7NbgDpaiMTS9ikg6Xjd5p
         FRMZWb6VvqggwYwDCpitGiPlhHvu6nws9ciYaM++Es2ldvJwXCBkRBRFihN5rZVjHUgm
         lxptPvjEw/PB88dglePRZ8emFGgDxCZ/vVJ0OSpFGJ7aa9oG5wDPkdCkCJbv2KuROmyH
         Qx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=INIAEmZS8UjcdAD7KdEdkKuev1Mu+DgAwJosPnLiQh4=;
        b=B87UslwbxXNtwdcLbLK6nn/KYRI6XIV8T+EP4R6V8dehpokKSlFi7bEOAdsZk/Lole
         4VgEAQ/jLv5sgsLjGdrfVRslkPtwzr+WeJ8NAMxZ4Ol2ObZC9Hz2nwyOlIdT49S5uxWv
         gZiwhR3Bwpnm5A2DJVdHQW7WHx25E7rDs7NYi4GeOH1ETx7Gqp/I84ZkeOGhDoWJP6Dd
         U2Bs+ePgPmy+GNKvvAD0b72pD2BYCkMOhcqYpxCKXpu9mt/9c1gIjd5NNi9HsFfpBVHf
         q+MwImbB8jurIIQ+kFO7ZOiavzqlR4nerduCzECGQ5mt92v+qsIQyOQQMt54WCYnwYsq
         i9yQ==
X-Gm-Message-State: AOAM530N7mozoeaCCkJbPxmxI3hbHqzwQYce4t69o/Jk/jHXhQlkg3Ha
        b0NtGnsbrZhdxGZRv1G/I30=
X-Google-Smtp-Source: ABdhPJyzToMGH8CbR6iDc1Aoi4CAgKdronCbuGQbLA74shBU8uQ51tJ0ZuWQOYrHkmFZfQiCi2Q5pg==
X-Received: by 2002:a17:90a:9ab:: with SMTP id 40mr14724325pjo.26.1603699783694;
        Mon, 26 Oct 2020 01:09:43 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id j2sm542825pgi.48.2020.10.26.01.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 01:09:43 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH 1/3] watchdog: sprd: should not disable watchdog in resume
Date:   Mon, 26 Oct 2020 16:09:17 +0800
Message-Id: <20201026080919.28413-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201026080919.28413-1-zhang.lyra@gmail.com>
References: <20201026080919.28413-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Lingling Xu <ling_ling.xu@unisoc.com>

Don't disable watchdog in resume process, otherwise system would crash
once kick watchdog.

Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
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

