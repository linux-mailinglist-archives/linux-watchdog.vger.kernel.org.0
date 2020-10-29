Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9213F29E2D9
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 03:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729958AbgJ2CkN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Oct 2020 22:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728204AbgJ2Cjq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Oct 2020 22:39:46 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5A6C0613CF;
        Wed, 28 Oct 2020 19:39:46 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 13so1115149pfy.4;
        Wed, 28 Oct 2020 19:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d5Okb+bKE2F9destA6FuDQoNvbzUpEWsIIoQzZu0fGU=;
        b=JsOldeqhYIi0aPHXalTCm5SQsA6iPfyWZevGG6oQi0rtb0l2s1TS4kMaiTrCHWQ4pU
         zOtg6WoauDGZBNAU/AL77puRzIcVm+dLcbau/ZaV95A3RpfJpWPp/VIPz3ACStH+aQ+M
         POu8jKlsEkgcOELLVMYeqlgZfCSLnr0h8uyqkBNyLnkN269a90udxv7/0SsbbWN2eysx
         YfwloOLuobG6lfLFwB7wlO37OmgOWqWxAIsER5B40MDO1Tl4vtozQokTxhUx3o/MzlSi
         YmAEfSNjD9tElEij8tHRqEsiNujBbzPBh9TuvZzA82zRSJLSH7f7iZEhNpm2Wc/ZPtD6
         hdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5Okb+bKE2F9destA6FuDQoNvbzUpEWsIIoQzZu0fGU=;
        b=clgBeDFQDHLEuDh5upkI4ymBQKLAixToXgod9cBv+Dp5AU6ErKm0b6eP3ZnVXLFcfS
         u5vSR22P78SSdq1MVEXUcuiOLHtevBDHIK0kguuwzMdgjAyOhM2oleu06TY/cmXZ/cZU
         vxa24dLfq2z/TawC0LejmNBDBBovl4EfV1iaflqPEUoNBlG81IHxW3KgwGUahv8Ul6im
         dFhljvQIMldWUYEoUve/SaNB/qWHYa4EoCLVU+iMRaTBwkSG31fxQvoFeqBFtwLLOiHK
         Coc4F61VqUwx92+44vY8Ui0pTX5xB4xccQyxsyBxoYGE5IR8LqAYMTiVIKQkM9Wm7cku
         Zjkg==
X-Gm-Message-State: AOAM530vEjw0QhFnxPwhRJfx599HtabjtOtMIq6mexgm4ZtnCguS5sIc
        lYGldVEy1qNhYMZqYhiIMk3AW5iTvpzWZQ==
X-Google-Smtp-Source: ABdhPJzDONL5ZKlYbnPTAUkUF17XdCgSUhYhs/WgXtl61vH+wYPc1oD3haWu8NWQAwPlPxSTAdsUMg==
X-Received: by 2002:a63:609:: with SMTP id 9mr2085722pgg.227.1603939185921;
        Wed, 28 Oct 2020 19:39:45 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id kr14sm566260pjb.26.2020.10.28.19.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 19:39:45 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Jingchao Ye <jingchao.ye@unisoc.com>,
        Xiaoqing Wu <xiaoqing.wu@unisoc.com>
Subject: [PATCH v2 1/3] watchdog: sprd: remove watchdog disable from resume fail path
Date:   Thu, 29 Oct 2020 10:39:31 +0800
Message-Id: <20201029023933.24548-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029023933.24548-1-zhang.lyra@gmail.com>
References: <20201029023933.24548-1-zhang.lyra@gmail.com>
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

