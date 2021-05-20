Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B808389EE5
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 May 2021 09:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhETHay (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 03:30:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56734 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhETHax (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 03:30:53 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <juerg.haefliger@canonical.com>)
        id 1ljd7b-0005x1-Jw
        for linux-watchdog@vger.kernel.org; Thu, 20 May 2021 07:29:31 +0000
Received: by mail-ej1-f71.google.com with SMTP id p18-20020a1709067852b02903dab2a3e1easo1629343ejm.17
        for <linux-watchdog@vger.kernel.org>; Thu, 20 May 2021 00:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oO2SCYGtTo5Wt/hf8sMJwZqbwWNXWFclqIhqPsgzV88=;
        b=XMfhDL9P50z8f3w08RzU6TmL5d2JG8PdLp1T+Am0k2n35+BEWaH6X4jPc7sEdFcRt2
         7oNVJP6/4xzhdE3Po5p1uFYZ8MJp8LCAVE2OFrOx0SYkVGG7uDiXJg3zt1sbDYpAzbXi
         4f758YKO0DDYVVwxxx9Vo/BQUSO79qRgLtHDeN0NyzCGjgNjWAvo+y6+iZv7NmdtWSha
         NGp2ByYN7yRRvFaEVkqL4Y8eXy47AFlzPKSyGeocHVlUNl0xx1aHaOe55i00dfZLtmi6
         brHRztaeGj0MP7XN84OMLvddINGSEQjgCrCt1VuXMSJBeO1Iaux5CLGp9eaGy3swEGBJ
         n4Hw==
X-Gm-Message-State: AOAM531Y6V1PkEQMuIivjeGlbwbmWbhNbzPz9/u5Dxwaecjc4sBBnmJx
        TqeRKeaXTr3e/NOJiElk9e9r28QzRgQ+B20lJse/SamkQNE6asPxr8PtWBwBk7NEFgDIMXPIH86
        y6j2DDgCx/wXIo2Qd4d8jkKdSFv05zvKKWTiLqiEjjoF1
X-Received: by 2002:a50:f388:: with SMTP id g8mr3481204edm.236.1621495771349;
        Thu, 20 May 2021 00:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3llZrF7b+xOgLeASrg9WSKrMq2NRLbmtU5nmGIBP83yGNp6rNV05Tv5+nYK+is+hXlrkHTg==
X-Received: by 2002:a50:f388:: with SMTP id g8mr3481192edm.236.1621495771182;
        Thu, 20 May 2021 00:29:31 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id m9sm978873ejj.53.2021.05.20.00.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 00:29:30 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     joe@perches.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH] watchdog: ziirave_wdt: Remove VERSION_FMT defines and add sysfs newlines
Date:   Thu, 20 May 2021 09:29:18 +0200
Message-Id: <20210520072918.76482-1-juergh@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Remove the ZIIRAVE_{BL,FW}_VERION_FMT defines since they're only used in
very few places. While at it, add newlines to sysfs outputs.

Suggested-By: Joe Perches <joe@perches.com>
Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---

 Depends on: https://lore.kernel.org/lkml/20210511061812.480172-1-juergh@canonical.com/

 drivers/watchdog/ziirave_wdt.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 6c9414d09684..c5a9b820d43a 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -69,9 +69,6 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
 #define ZIIRAVE_CMD_JUMP_TO_BOOTLOADER_MAGIC	1
 #define ZIIRAVE_CMD_RESET_PROCESSOR_MAGIC	1
 
-#define ZIIRAVE_FW_VERSION_FMT	"02.%02u.%02u"
-#define ZIIRAVE_BL_VERSION_FMT	"01.%02u.%02u"
-
 struct ziirave_wdt_rev {
 	unsigned char major;
 	unsigned char minor;
@@ -445,7 +442,7 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
+	ret = sysfs_emit(buf, "02.%02u.%02u\n",
 			 w_priv->firmware_rev.major,
 			 w_priv->firmware_rev.minor);
 
@@ -469,7 +466,7 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
+	ret = sysfs_emit(buf, "01.%02u.%02u\n",
 			 w_priv->bootloader_rev.major,
 			 w_priv->bootloader_rev.minor);
 
@@ -493,7 +490,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
+	ret = sysfs_emit(buf, "%s\n", ziirave_reasons[w_priv->reset_reason]);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
 
@@ -538,7 +535,7 @@ static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev,
 	}
 
 	dev_info(&client->dev,
-		 "Firmware updated to version " ZIIRAVE_FW_VERSION_FMT "\n",
+		 "Firmware updated to version 02.%02u.%02u\n",
 		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
 
 	/* Restore the watchdog timeout */
@@ -679,7 +676,7 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 	}
 
 	dev_info(&client->dev,
-		 "Firmware version: " ZIIRAVE_FW_VERSION_FMT "\n",
+		 "Firmware version: 02.%02u.%02u\n",
 		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
 
 	ret = ziirave_wdt_revision(client, &w_priv->bootloader_rev,
@@ -690,7 +687,7 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 	}
 
 	dev_info(&client->dev,
-		 "Bootloader version: " ZIIRAVE_BL_VERSION_FMT "\n",
+		 "Bootloader version: 01.%02u.%02u\n",
 		 w_priv->bootloader_rev.major, w_priv->bootloader_rev.minor);
 
 	w_priv->reset_reason = i2c_smbus_read_byte_data(client,
-- 
2.27.0

