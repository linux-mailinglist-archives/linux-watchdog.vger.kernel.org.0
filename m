Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C148E7975DA
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Sep 2023 18:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbjIGQAZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Sep 2023 12:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236695AbjIGP5u (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Sep 2023 11:57:50 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3856AD36
        for <linux-watchdog@vger.kernel.org>; Thu,  7 Sep 2023 08:45:24 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bcc4347d2dso18919181fa.0
        for <linux-watchdog@vger.kernel.org>; Thu, 07 Sep 2023 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694101456; x=1694706256; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1Xg8daKkiRDx70DYNoiC72rqrty0xVzo35tP0pXzLM=;
        b=uxdUdsvNHVZgNIzJ8Xm1eT0uut/HXfIXqwdCEROH0y6mZgySpHCJHEpalKke2enjEr
         SR0hZjNDdbRamApOlPygxjG0tiBGrb1B75t3z5MelzdGNBKanWgyhw3JEkttcpLY4pqO
         2pTWa88iv8wiEVvcSoqDHhS/EjrIBvZiZ5qx1fLsDeuZQEXjvU63JlQduDR+4/ZlFDag
         YSe9Ioqux/0VkKOPhN20MPMFW4MDC5EFuZY3aQl3ZCUI5lTWa5DHk40j72pHZ8n7+Pny
         aQ9szfIinb2xNz1oFPLkyDitzdvST7rfuEFxb3bTCGlKpP1T6W8UL5UE0GSecIsRZZEm
         wQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101456; x=1694706256;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t1Xg8daKkiRDx70DYNoiC72rqrty0xVzo35tP0pXzLM=;
        b=F8l173Lk8Yuu9VThg/eXbGEbifJ6tqBgROpe3QGNbXGGtPZKehZPfBt9L4FqSeBW5d
         m2plAXGk9NvkBLodwkWHMXWxSlnGA+aJ/Og5yb2+mvW3eJ62K0ewEPNCcPtZxV71f8pC
         /wY1lzkc7DcTNa/RP0NnvrzIMsPky59ftdSMPixJu2Ir6Q7Y28Ry1AJ0ml1whYjTV2eN
         Uke46ZuVck110biZ0hV+TgSufh/dgcThaPrYB94HpN8GWhJ7cD6vu4+I5iFI3vOSNnyB
         97g85vHG0BKiYFrwop0xfD51iSV2oUJXIo2VRVoc1EP/OpyFa0h75a1COeuxAxeKxO3l
         iexA==
X-Gm-Message-State: AOJu0Yx33/9sKkc0Vc6Hx5xqxyn/iutpL8L3ou/y8gUg1z/7amjq739C
        v3r20EU0qp9VeUCSvb9/4H838s2qECh8eMCbtDw=
X-Google-Smtp-Source: AGHT+IFmOiv05mocpi1VtcAzIkJzCg0pJhhEwIKxEuNtBoOnNOTF9KpuJgW2+cmwkNw5fVoET3C7lg==
X-Received: by 2002:a05:600c:151:b0:400:6b36:ee2a with SMTP id w17-20020a05600c015100b004006b36ee2amr4511896wmm.26.1694080399345;
        Thu, 07 Sep 2023 02:53:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay30-20020a5d6f1e000000b0031f65cdd271sm3827670wrb.100.2023.09.07.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:53:19 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:53:15 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bharat Bhushan <bbhushan2@marvell.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] watchdog: marvell_gti_wdt: Fix error code in probe()
Message-ID: <af326fd7-ac71-43a1-b7de-81779b61d242@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This error path accidentally returns success.  Return -EINVAL instead.

Fixes: ef9e7fe2c890 ("Watchdog: Add marvell GTI watchdog driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/watchdog/marvell_gti_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/marvell_gti_wdt.c b/drivers/watchdog/marvell_gti_wdt.c
index d7eb8286e11e..1ec1e014ba83 100644
--- a/drivers/watchdog/marvell_gti_wdt.c
+++ b/drivers/watchdog/marvell_gti_wdt.c
@@ -271,7 +271,7 @@ static int gti_wdt_probe(struct platform_device *pdev)
 				   &wdt_idx);
 	if (!err) {
 		if (wdt_idx >= priv->data->gti_num_timers)
-			return dev_err_probe(&pdev->dev, err,
+			return dev_err_probe(&pdev->dev, -EINVAL,
 				"GTI wdog timer index not valid");
 
 		priv->wdt_timer_idx = wdt_idx;
-- 
2.39.2

