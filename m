Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF643309AC
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 09:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhCHIni (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 03:43:38 -0500
Received: from mail-lf1-f53.google.com ([209.85.167.53]:43458 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbhCHInY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 03:43:24 -0500
Received: by mail-lf1-f53.google.com with SMTP id d3so19681630lfg.10;
        Mon, 08 Mar 2021 00:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ufjH8UXytToswCfYagSqIAjTWmllgUhOGrl0yZoSiKw=;
        b=XXkHb6+WCWfwJb9A8v/lO1MJONztlKuzPJ73RFM0StzHis5VjVT3S9Vo235Z1imX3R
         NLOYYNLVkvkBmvZDPWh12B2k2QOzx81GsGaD1FBL3G/4+iDTcxhJbPccGqoLF8flwN7W
         HtI5fUZBU3nZSlBUItJ1EuEpT1y4391ywnl55vNXBA5hjJefqGMv3UjYrttaGcrLI7gy
         oQdvx60gbr/sqYgiv0b2gLOpyI85s+Eld9ynmMmhQ7tKesnMdewzSDzEKYo1R2QOqnC1
         cQaSVhTQt8QNHa5mnNo2cH/NF3ve/yjHItTC9rUal6ASmWBcCf9GJwhhPlLvm0c2jhNb
         5+9g==
X-Gm-Message-State: AOAM532Oorn8yxh3F+8V5xlEWEGtdhucys5C0DLcjwo4NCq1vbs57jNk
        c3rnWlzLUT8faU85T+MzGlw=
X-Google-Smtp-Source: ABdhPJzsooBoCEMkMrGt+rNFS5VhSKpxeb3jqdVpf1Dfmq0VCuxcNAnJstSaPcK1ooyoRTGLkZn1qg==
X-Received: by 2002:a05:6512:405:: with SMTP id u5mr13229589lfk.574.1615193003216;
        Mon, 08 Mar 2021 00:43:23 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id f26sm1275775lfe.118.2021.03.08.00.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 00:43:22 -0800 (PST)
Date:   Mon, 8 Mar 2021 10:43:16 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: [RFC PATCH v2 8/8] watchdog: retu_wdt: Clean-up by using managed
 work init
Message-ID: <8c1a5a62490b6a3d165784ce9ad07b9ab6e13e53.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
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
