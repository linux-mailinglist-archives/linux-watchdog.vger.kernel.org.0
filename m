Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11EE91572C4
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2020 11:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgBJKWQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Feb 2020 05:22:16 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42141 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgBJKWQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Feb 2020 05:22:16 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so3770783lfl.9
        for <linux-watchdog@vger.kernel.org>; Mon, 10 Feb 2020 02:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKndkQgMIYb0T7d6gUEFdQ62CKsl1/kt3dXyVx/QpMg=;
        b=R450X/a5Q+3FwUZlk+OjLz0rLuGJlsh/bjwhPAsz3QySYmHBrYEUe7CQ9kExPabHN0
         Y1pPBEleTHhHmtX9WMlqOq+y5MeWNEgPaoxluXb44Zsuonh6q/4zVTPgsejvhemiSmvS
         8mBx+j9QAOIEpNnaLi+eBQtD0WSnVzzoBgYNH2uICLjK14kBIEPJB2sgXozC9uUq5/KU
         PuV1V+6Vmoe88WmJ6Yy7dIq5fCR20+gbztUcaBydsZ8Ab0zclWhZyLQwrzoYJzlL0t+l
         EhoRNyUjf/97rdOKoy7AoXPFJ8ibrSeJZw1wfR6GCZVfzomhJoZe54S350RU7LKcJV67
         PgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKndkQgMIYb0T7d6gUEFdQ62CKsl1/kt3dXyVx/QpMg=;
        b=C/+RuCLZsa7TfW6cC6GnQFV21yvO4m7ZDOA/YY/iFfltXxnSx4qtEsYGA30gkL+mwG
         HrqHP6gZyIFJ475hWiQd90JVPlBvlJHuXf1SdewkjfcqNMHcygRlwsdsfYkY+dPGjV/y
         NbwtsUr+0oJRW7ypkz5ooAWoiUMJ0KFIn3M7Yd4mhMlaKY60qasTka0ll9a2wdrdwyLT
         8bOvrEo1i7e4+HBhTwBPt3D6+Lji3etwQE7M1Bizum+w6aR5P1UVtH40Oln/i/6rmW4t
         iU7RwKJ89t7u4sigptadd55EEWa71Kr8bHDGGq8DftLE1c7jeoM8rh6yvAhhDx12eUh2
         YcRw==
X-Gm-Message-State: APjAAAUQkz8DVB53d/ZZPzTD3KcKBYqVDcZvWL+Ud2VFeqbj45zkW2Ja
        PrGIylx0X5wk+BR/IdEp2iRpog==
X-Google-Smtp-Source: APXvYqzWLmmbIxi9V5N4Vy1R7vV6PsQLaIIVaOkuw8d5k+W+T6WKI+IgChz8d12sVzKGaXXyTuSNcw==
X-Received: by 2002:a19:cc07:: with SMTP id c7mr379544lfg.177.1581330133200;
        Mon, 10 Feb 2020 02:22:13 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id i197sm5062251lfi.56.2020.02.10.02.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 02:22:12 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH RESEND] watchdog: wm831x: Use GPIO descriptor
Date:   Mon, 10 Feb 2020 11:22:09 +0100
Message-Id: <20200210102209.289379-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The WM831x watchdog driver passes a global GPIO number from
platform data into this driver, this is discouraged so pass
a GPIO descriptor instead.

More thorough approaches are possible passing descriptors
associated with the device through machine descriptor tables,
but no boardfiles in the kernel currently use this driver
so it is hard to test.

Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/watchdog/wm831x_wdt.c    | 22 ++++++----------------
 include/linux/mfd/wm831x/pdata.h |  3 ++-
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/watchdog/wm831x_wdt.c b/drivers/watchdog/wm831x_wdt.c
index 030ce240620d..75c14287757f 100644
--- a/drivers/watchdog/wm831x_wdt.c
+++ b/drivers/watchdog/wm831x_wdt.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 #include <linux/uaccess.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <linux/mfd/wm831x/core.h>
 #include <linux/mfd/wm831x/pdata.h>
@@ -29,7 +29,7 @@ struct wm831x_wdt_drvdata {
 	struct watchdog_device wdt;
 	struct wm831x *wm831x;
 	struct mutex lock;
-	int update_gpio;
+	struct gpio_desc *update_gpiod;
 	int update_state;
 };
 
@@ -103,8 +103,8 @@ static int wm831x_wdt_ping(struct watchdog_device *wdt_dev)
 
 	mutex_lock(&driver_data->lock);
 
-	if (driver_data->update_gpio) {
-		gpio_set_value_cansleep(driver_data->update_gpio,
+	if (driver_data->update_gpiod) {
+		gpiod_set_value_cansleep(driver_data->update_gpiod,
 					driver_data->update_state);
 		driver_data->update_state = !driver_data->update_state;
 		ret = 0;
@@ -239,18 +239,8 @@ static int wm831x_wdt_probe(struct platform_device *pdev)
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
+		if (pdata->update_gpiod) {
+			driver_data->update_gpiod = pdata->update_gpiod;
 
 			/* Make sure the watchdog takes hardware updates */
 			reg |= WM831X_WDOG_RST_SRC;
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 986986fe4e4e..c6ce1b94d053 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -10,6 +10,7 @@
 #ifndef __MFD_WM831X_PDATA_H__
 #define __MFD_WM831X_PDATA_H__
 
+struct gpio_desc;
 struct wm831x;
 struct regulator_init_data;
 
@@ -89,7 +90,7 @@ enum wm831x_watchdog_action {
 
 struct wm831x_watchdog_pdata {
 	enum wm831x_watchdog_action primary, secondary;
-	int update_gpio;
+	struct gpio_desc *update_gpiod;
 	unsigned int software:1;
 };
 
-- 
2.23.0

