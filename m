Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F4123EC7C
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Aug 2020 13:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgHGL3T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 07:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgHGL3P (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 07:29:15 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF74C061574;
        Fri,  7 Aug 2020 04:29:13 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e4so753979pjd.0;
        Fri, 07 Aug 2020 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Tc8At/QEqo0WB6SQrqrAMeHhKm8O5UVe5hOaDVBMf4Q=;
        b=YqpJYDqfX3R1Tttp1FIJl2jiVU8y4FnU4ev0ZzDa7Xc3OrvDip60ahrp3Oz3E9FQkY
         MP/AZ6aIk4a6adh/RaI9M3O5/4kK478XX/c+UlGKWT7B/JfQQI2VY/1iNSdFd4YfGHnW
         XWHoFerbrdqTML+3XLaHEB3NCUel/0MMtAUIJE/IZwciuo75HJyZaRS2sfBy1FoaQQBS
         xPqMGyYpMzBwXaNHbuyqc66hwNacN36icZMJpAVrlcKo0ngmoh4vW8HzXD4lRRBSE0s0
         LHbcAJqgsC57LYNtiCCIEN9xnxUa233plXewp/o8FAWTGWnlIR4Gn879WdWRE/LEzQ8W
         U3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Tc8At/QEqo0WB6SQrqrAMeHhKm8O5UVe5hOaDVBMf4Q=;
        b=ryEeF3lKNo1rD6w1f1bsjSdSFkEqWae7dS+QiqIAdQ+7730lKBqBfLdGgXI1HVs6Un
         PE/vX7ecLcxITS3nR1IlZwm1lrCEc7w8GXuKgWee9+/RjvWkZV6h/v1M2jLLJIG8hZtV
         KXoK98dHtj+pDhn+smL2oZvEwoNdAj9Jqlv268LejjsZ1kITnMKXaoDXGQNu4GnyfqcN
         sjqkvcWy/qv0vctjwZmvWxIbocmBzkLMAZilx8Xwk0wqVYcMMT1I3H8R847d2N0AF1fE
         TAnmLNmlOM9BdrR5sRRqk4IkDJyKYpI85a2SlIduhhvEVzgTBFHFMmgWpYaLS/C/RAid
         Bn8Q==
X-Gm-Message-State: AOAM530tGqk0570dsk3a87bwNqi401pOKT+TbShdHL1eX1BQBt2av4Hs
        InBQERhm2kLOCl0d+Z2ShA==
X-Google-Smtp-Source: ABdhPJyTHM2tCmVW8FHuxxKdaG24HIac0G0vgJt4yuy9iY17brNNYSUbPauw+jvDLnTJpsKMp2dfww==
X-Received: by 2002:a17:90a:8589:: with SMTP id m9mr13458123pjn.109.1596799751211;
        Fri, 07 Aug 2020 04:29:11 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:cfe:b80f:eaf6:78ad:579f:4f52])
        by smtp.gmail.com with ESMTPSA id d9sm11125777pgv.45.2020.08.07.04.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 04:29:10 -0700 (PDT)
From:   madhuparnabhowmik10@gmail.com
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        andrianov@ispras.ru, ldv-project@linuxtesting.org,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Subject: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
Date:   Fri,  7 Aug 2020 16:59:02 +0530
Message-Id: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
after misc_register(), hence if ioctl is called before its
initialization which can call rdc321x_wdt_start() function,
it will see an uninitialized value of rdc321x_wdt_device.queue,
hence initialize it before misc_register().
Also, rdc321x_wdt_device.default_ticks is accessed in reset()
function called from write callback, thus initialize it before
misc_register().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 drivers/watchdog/rdc321x_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
index 57187efeb86f..f0c94ea51c3e 100644
--- a/drivers/watchdog/rdc321x_wdt.c
+++ b/drivers/watchdog/rdc321x_wdt.c
@@ -231,6 +231,8 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
 
 	rdc321x_wdt_device.sb_pdev = pdata->sb_pdev;
 	rdc321x_wdt_device.base_reg = r->start;
+	rdc321x_wdt_device.queue = 0;
+	rdc321x_wdt_device.default_ticks = ticks;
 
 	err = misc_register(&rdc321x_wdt_misc);
 	if (err < 0) {
@@ -245,14 +247,11 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
 				rdc321x_wdt_device.base_reg, RDC_WDT_RST);
 
 	init_completion(&rdc321x_wdt_device.stop);
-	rdc321x_wdt_device.queue = 0;
 
 	clear_bit(0, &rdc321x_wdt_device.inuse);
 
 	timer_setup(&rdc321x_wdt_device.timer, rdc321x_wdt_trigger, 0);
 
-	rdc321x_wdt_device.default_ticks = ticks;
-
 	dev_info(&pdev->dev, "watchdog init success\n");
 
 	return 0;
-- 
2.17.1

