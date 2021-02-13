Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74ECE31AB46
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Feb 2021 13:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhBMMTl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 Feb 2021 07:19:41 -0500
Received: from mail-lf1-f41.google.com ([209.85.167.41]:41776 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhBMMTi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 Feb 2021 07:19:38 -0500
Received: by mail-lf1-f41.google.com with SMTP id d24so3313555lfs.8;
        Sat, 13 Feb 2021 04:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WcoOJgJsCus9j+z1oc3UJY2GBbxvXHxxloSoBiuOvOQ=;
        b=ALyUcmchCotpVZiWEHetCgW5V8s/vFLxzeI19cBzEuhGO1K9G0x47C4RcfUQ3Ks5Ga
         L5lHrS6B8BkxdixZBJcfkEku4Ccnx7C6pOfBqr1UHnpL/naYiVI3H34eUKb3rv5CyDW+
         IdtXu8tfy9Gm5rc7H5iuYJpw0coU2kJVyLhhAiwZnKIGSIhFHCkHdsEgH2kk2kR4Glea
         ygGrl+/9S5yTdvfJV/m4EjQY0rZTeq0Q8dFPIoEIBG/r8mZTjCbYiGCW/kRqJ5tV/1aX
         vUbudVwdY9xzwD4fv1NHC08Cn0HhU9Fo/V4GMzPJu8RbCdnMvJviDyXfbGGA/3vjRBkv
         JSLg==
X-Gm-Message-State: AOAM5333NjPkPT5UE5MAiVV4YSexGoQ1aln5vtNyq02Wrl/oY7O41Eec
        wHfzelKjSTPo4qOpLuy2od6yOTLZIWtsOg==
X-Google-Smtp-Source: ABdhPJyzMxI8YixWXUsIVFeJM31vUFpyRSqjH+GUJFxCARCLS7L5vpJN4Y7JSBaPCVH30CtVdV9WBw==
X-Received: by 2002:a05:6512:1094:: with SMTP id j20mr4105261lfg.442.1613218735504;
        Sat, 13 Feb 2021 04:18:55 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id z8sm1330907lfr.124.2021.02.13.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 04:18:55 -0800 (PST)
Date:   Sat, 13 Feb 2021 14:18:48 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 7/7] watchdog: retu_wdt: Clean-up by using managed work
 init
Message-ID: <f157b14a3bd03cb94c9d11e3a6fc995bf4245edf.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Few drivers implement remove call-back only for ensuring a delayed
work gets cancelled prior driver removal. Clean-up these by switching
to use devm_delayed_work_autocancel() instead.

This change is compile-tested only. All testing is appreciated.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/watchdog/retu_wdt.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/retu_wdt.c b/drivers/watchdog/retu_wdt.c
index 258dfcf9cbda..3b65bdaf54b4 100644
--- a/drivers/watchdog/retu_wdt.c
+++ b/drivers/watchdog/retu_wdt.c
@@ -127,9 +127,12 @@ static int retu_wdt_probe(struct platform_device *pdev)
 	wdev->rdev		= rdev;
 	wdev->dev		= &pdev->dev;
 
-	INIT_DELAYED_WORK(&wdev->ping_work, retu_wdt_ping_work);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &wdev->ping_work,
+					   retu_wdt_ping_work);
+	if (ret)
+		return ret;
 
-	ret = watchdog_register_device(retu_wdt);
+	ret = devm_watchdog_register_device(&pdev->dev, retu_wdt);
 	if (ret < 0)
 		return ret;
 
@@ -138,25 +141,11 @@ static int retu_wdt_probe(struct platform_device *pdev)
 	else
 		retu_wdt_ping_enable(wdev);
 
-	platform_set_drvdata(pdev, retu_wdt);
-
-	return 0;
-}
-
-static int retu_wdt_remove(struct platform_device *pdev)
-{
-	struct watchdog_device *wdog = platform_get_drvdata(pdev);
-	struct retu_wdt_dev *wdev = watchdog_get_drvdata(wdog);
-
-	watchdog_unregister_device(wdog);
-	cancel_delayed_work_sync(&wdev->ping_work);
-
 	return 0;
 }
 
 static struct platform_driver retu_wdt_driver = {
 	.probe		= retu_wdt_probe,
-	.remove		= retu_wdt_remove,
 	.driver		= {
 		.name	= "retu-wdt",
 	},
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
