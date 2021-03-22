Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF9D343AC4
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Mar 2021 08:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhCVHjM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Mar 2021 03:39:12 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:42709 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhCVHiq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Mar 2021 03:38:46 -0400
Received: by mail-lf1-f43.google.com with SMTP id o10so19665313lfb.9;
        Mon, 22 Mar 2021 00:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ufjH8UXytToswCfYagSqIAjTWmllgUhOGrl0yZoSiKw=;
        b=GkChdgXAzrIZgoqgg6Af14P+/THIlMkJMDidQOUJXBkaL1zlKK75qSR+KKUdoEmEnC
         2BiNVSTtLikJLUa7qZ9kq4m8uW4WuS+UEJEF1/GVtZGSAYyGjECqYraWi9MtABw05BKH
         NO/HmBuLKla/t500oFZ2d+7ioIC9xyfc5q95Koi4ec1aQP3YDa0q4z3n+GJYxZVXb74z
         KUQmt1CpNOUFYJl5Bt9zd2sdnAk5gR2XEh1vearg2jF4Nki27wOed84jRbQm8rq7UaOV
         mxSoeeMZIughIFPPa+w/QaPGes+UxinD8bbeDAeoctpWiGqpVN4+JkmBYS06LFJVWpRq
         P6qQ==
X-Gm-Message-State: AOAM532nV9LpCGHTqyBh1bxKbFPwtVGRI+pJ9YfYkciBdtdE4n8/5MM1
        vQDDQEqBihcbKpGLqt9UcFk=
X-Google-Smtp-Source: ABdhPJwi5WBaAFSOoCKTO1x7JtkTXB19ZE656ZV3ZO3mONvy2QaB4ElH5AdNKDSg+bJCT3fBinGONw==
X-Received: by 2002:a05:6512:321a:: with SMTP id d26mr8291242lfe.353.1616398723557;
        Mon, 22 Mar 2021 00:38:43 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5673b7-246.dhcp.inet.fi. [86.115.183.246])
        by smtp.gmail.com with ESMTPSA id u4sm645714lfb.98.2021.03.22.00.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 00:38:43 -0700 (PDT)
Date:   Mon, 22 Mar 2021 09:38:37 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: [RFC RESEND PATCH v2 8/8] watchdog: retu_wdt: Clean-up by using
 managed work init
Message-ID: <5f1a80d6f88d12b23dbb864e3201fe720cd9bb74.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Few drivers implement remove call-back only for ensuring a delayed
work gets cancelled prior driver removal. Clean-up these by switching
to use devm_delayed_work_autocancel() instead.

This change is compile-tested only. All testing is appreciated.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/watchdog/retu_wdt.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/retu_wdt.c b/drivers/watchdog/retu_wdt.c
index 258dfcf9cbda..2b9017e1cd91 100644
--- a/drivers/watchdog/retu_wdt.c
+++ b/drivers/watchdog/retu_wdt.c
@@ -8,6 +8,7 @@
  * Rewritten by Aaro Koskinen.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/device.h>
@@ -127,9 +128,12 @@ static int retu_wdt_probe(struct platform_device *pdev)
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
 
@@ -138,25 +142,11 @@ static int retu_wdt_probe(struct platform_device *pdev)
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
