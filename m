Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037423460AE
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Mar 2021 14:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhCWN65 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Mar 2021 09:58:57 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:34763 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbhCWN6f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Mar 2021 09:58:35 -0400
Received: by mail-lj1-f173.google.com with SMTP id f16so25786364ljm.1;
        Tue, 23 Mar 2021 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZDGujgIvq4cUdlRS1hitJJiQNttyRUZC0f5ucnLqVvE=;
        b=RxV8Imd19INyOeZiYs1eX/X4Ftwa+TfhLtTezfo9R++qbzhcxuI/dJHlhcOCHISM46
         rSo4S9/t5uFF4J45BFcHb/WKMcHn8YeUYGgL9Nt/kH5nWdcJNhBtreg87eR6LxE586BW
         SBi/nNbIPY4B6yiqC78kNgQEzmdB/pV1YUXcXZZxptl5rrws+hu2AmlJfx2yrz6SmhTs
         hicyZSUxBJfqvYUaQ9NeBcTSJAsqOYP3xkinTQlCZaqi/mnWyVyp/B+YXS/iN8oVEkgl
         jzj/iin+hqs3bsp5QW6ZArC2xpvGs3GajeRuWsvbPJ8zegOMuST7ZopDZD1SwjTCVfGL
         +GYg==
X-Gm-Message-State: AOAM533oFDiXNcM6wNq5T9k9Q1IvZ/7YbxlOI+1isaUwSvR6+LzlOqTQ
        uDZYOp+mhsPxYPe+InHYBOo=
X-Google-Smtp-Source: ABdhPJwdhJzzvN986C3XyFzgUWxYqXIJRHXvwrzK+YQqgettsR/237+CXSDLXbWwk/3KaO5NTvrSdg==
X-Received: by 2002:a2e:878c:: with SMTP id n12mr3359228lji.58.1616507913927;
        Tue, 23 Mar 2021 06:58:33 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id u12sm463191lff.126.2021.03.23.06.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:58:33 -0700 (PDT)
Date:   Tue, 23 Mar 2021 15:58:28 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v3 8/8] watchdog: retu_wdt: Clean-up by using managed work
 init
Message-ID: <be299515fbee2c311162ca99ea0dbee933044b56.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Few drivers implement remove call-back only for ensuring a delayed
work gets cancelled prior driver removal. Clean-up these by switching
to use devm_delayed_work_autocancel() instead.

This change is compile-tested only. All testing is appreciated.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Changelog from RFCv2:
 - RFC dropped. No functional changes.

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
