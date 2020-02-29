Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 988B717469C
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Feb 2020 12:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgB2Lw4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 29 Feb 2020 06:52:56 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44532 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgB2Lw4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 29 Feb 2020 06:52:56 -0500
Received: by mail-lj1-f193.google.com with SMTP id q8so6301632ljj.11
        for <linux-watchdog@vger.kernel.org>; Sat, 29 Feb 2020 03:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9IvdHo9Zw2zr1wtMnTWdYsp6uDpTTR/knb3yNeoa+qI=;
        b=frx8E8Ec0YjMPHjYtxkubm1saz8B2JR9k8SuZ+5L77Wv90unhdP7BejQG0LoKkTaEP
         PIGrY+2juMAthlZ5C9waIACmI/pVXLBBX5P/I7RxyPMGAewEK6KoW0LMqAaJbuIn+3YN
         7fdAlI0q3+VyMy+fkxIzKu9XzylEMjptDI+HHHVWDQciiCSI6J/KrGXXsFDr0JF0uJsZ
         wY3tIJWezGSaqD5iWkhCzo8dtnKjWeQ0jG++rpFf8dSY1Tzr+1uXP6wwW+oHbuFc1MQd
         YbKeaf6vFqTuHtOCPcLhaI65Kffyw/hTlEUMokqP8+/WGHeKuNocDq46NVDoSLp9hQnQ
         wSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9IvdHo9Zw2zr1wtMnTWdYsp6uDpTTR/knb3yNeoa+qI=;
        b=jbyT3L2ZWTPTdG+kXqvfkdmctOwqmi0+yG3rutZpz5HtK7EPMGf5He6rpPhZCZF2/D
         jii2jXLMs9QpXZRqBNQuF0ey4ytUAHaxO3CC9plUt+RHd1g7ficyQLk8/QSBLi2iT776
         /0kSnbm4MuwTXCZzhi53F2g1FswZunWLvXR/9TXnKc+4SRyT0DF5w0f59tisVGF3mGw/
         HeS7dS0y5dppngKCanA54tkUJ9UNsDNN6o43Li1MZDzHzrVJ8mBKqtuWYpxFM3URDgEI
         nr3SS2JUaYnZMgllsRW6zXGrcq4hNP4qln0YQYBgzx06CNPf/Lk7SeBl+jMSLdRjJNH4
         sj8A==
X-Gm-Message-State: ANhLgQ0iWLWDoT+b/PWyxyqE4K0K04J6832nEneUpgdGrE1zfpPBEB2a
        BGWQkSrW5WKwp+Gcf0aLsaHMg3hfZBY=
X-Google-Smtp-Source: ADFU+vsvTXkxqDcDbZPPpmfkbdtr04bb8+2B2K+UOMnH1Rz9uVxji2OJc1LVCSlcDgKDp3zaIzVQrw==
X-Received: by 2002:a05:651c:149:: with SMTP id c9mr5990527ljd.80.1582977174376;
        Sat, 29 Feb 2020 03:52:54 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id e8sm8276228lfc.18.2020.02.29.03.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 03:52:53 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] watchdog: wm831x_wdt: Remove GPIO handling
Date:   Sat, 29 Feb 2020 12:50:46 +0100
Message-Id: <20200229115046.57781-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

An attempt to convert the driver to using GPIO descriptors
(see Link tag) was discouraged in favor of deleting the
handling of the update GPIO altogehter since there are
no in-tree users.

This patch deletes the GPIO handling instead.

Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/linux-watchdog/20200210102209.289379-1-linus.walleij@linaro.org/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I am also fine with the elder patch being applied, obviously.
---
 drivers/watchdog/wm831x_wdt.c    | 27 ---------------------------
 include/linux/mfd/wm831x/pdata.h |  1 -
 2 files changed, 28 deletions(-)

diff --git a/drivers/watchdog/wm831x_wdt.c b/drivers/watchdog/wm831x_wdt.c
index 030ce240620d..d96ad8f38bd2 100644
--- a/drivers/watchdog/wm831x_wdt.c
+++ b/drivers/watchdog/wm831x_wdt.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 #include <linux/uaccess.h>
-#include <linux/gpio.h>
 
 #include <linux/mfd/wm831x/core.h>
 #include <linux/mfd/wm831x/pdata.h>
@@ -29,7 +28,6 @@ struct wm831x_wdt_drvdata {
 	struct watchdog_device wdt;
 	struct wm831x *wm831x;
 	struct mutex lock;
-	int update_gpio;
 	int update_state;
 };
 
@@ -103,14 +101,6 @@ static int wm831x_wdt_ping(struct watchdog_device *wdt_dev)
 
 	mutex_lock(&driver_data->lock);
 
-	if (driver_data->update_gpio) {
-		gpio_set_value_cansleep(driver_data->update_gpio,
-					driver_data->update_state);
-		driver_data->update_state = !driver_data->update_state;
-		ret = 0;
-		goto out;
-	}
-
 	reg = wm831x_reg_read(wm831x, WM831X_WATCHDOG);
 
 	if (!(reg & WM831X_WDOG_RST_SRC)) {
@@ -239,23 +229,6 @@ static int wm831x_wdt_probe(struct platform_device *pdev)
 		reg |= pdata->secondary << WM831X_WDOG_SECACT_SHIFT;
 		reg |= pdata->software << WM831X_WDOG_RST_SRC_SHIFT;
 
-		if (pdata->update_gpio) {
-			ret = devm_gpio_request_one(dev, pdata->update_gpio,
-						    GPIOF_OUT_INIT_LOW,
-						    "Watchdog update");
-			if (ret < 0) {
-				dev_err(wm831x->dev,
-					"Failed to request update GPIO: %d\n",
-					ret);
-				return ret;
-			}
-
-			driver_data->update_gpio = pdata->update_gpio;
-
-			/* Make sure the watchdog takes hardware updates */
-			reg |= WM831X_WDOG_RST_SRC;
-		}
-
 		ret = wm831x_reg_unlock(wm831x);
 		if (ret == 0) {
 			ret = wm831x_reg_write(wm831x, WM831X_WATCHDOG, reg);
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 986986fe4e4e..75aa94dadf1c 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -89,7 +89,6 @@ enum wm831x_watchdog_action {
 
 struct wm831x_watchdog_pdata {
 	enum wm831x_watchdog_action primary, secondary;
-	int update_gpio;
 	unsigned int software:1;
 };
 
-- 
2.24.1

