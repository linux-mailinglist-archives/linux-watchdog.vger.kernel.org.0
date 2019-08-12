Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41ABB8A807
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbfHLUJ0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:26 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46080 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727657AbfHLUJZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:25 -0400
Received: by mail-pg1-f196.google.com with SMTP id w3so12829618pgt.13;
        Mon, 12 Aug 2019 13:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jEZoU65CYKkhJ//nkcnVx5x5ywWiKoHTZZ29p5BWWTg=;
        b=iNVVNqeRFZBPxHGfQlmxfKGEZibrqHSwoQpnwvOErULZ9JhSdd09pQwUB+dpH3Klpa
         N4j7PExnKorc+tIyPlrrSq4VqAQSbTF/qd1AcnYDHT1H2iOer6Y/McYVdlRVe+/d7921
         4GxxFakT3aH8glDMYIL6oqFoRumBHvyd+nYked6TcFZ9M5Bn3BXXburXDHE26HEQIPbc
         dpTc5MFWlONZQxrYihgZsM7d5GWFiyQ2C/2QbpVTYxuzaAzGWfz6qybE6bfJ8Ub7Bm4m
         MMPUBmeiZxTCM8VDvd6yQeEUI8kYm2pmTzD/AB9nNlcAutsK82hjKRGLcNNxwvhyLe60
         rFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jEZoU65CYKkhJ//nkcnVx5x5ywWiKoHTZZ29p5BWWTg=;
        b=gYe3hojme//FaUtb0y721Y9Y2zjV9IaET7NvYsH8FXnbcDp1w6D6Snaeb2fTWxe9vT
         S2iF/jTt0l7rCGJkS7wVDzjIXxRVPurO1l1wVCRmjElXAYuVz5uTDKXxESaSRt8Xk4K0
         U7ACwXZhf3UtcK66CSaVV5zVbagxq16ju0n0JmTRGgSlB7bTipP5jJfxsJd5eQR/X7KK
         msFyZHIRp5YLFgvmS1EFeuuZb0q91MQLs6EPtxW+/93oYjQ7m95fG3mAldVIMUXiigtZ
         Y0CPvUHJ1kGsvJUkJk04o2dYEe6JTt7VOGSnatPZosdZIX5hkAbjYCmLksv0Z+ip/JbD
         q5nQ==
X-Gm-Message-State: APjAAAWYVtu93vG7JBq/1Fzumuoq+t9PoRoDsnjhop21eL7zQa6ATBEu
        YSE8SGI3dYgfEu4cQxv8YcQHJ6Dl
X-Google-Smtp-Source: APXvYqwZdZi1eqYARjIfbuKgRo4ipWyXBrI2oG+fTR9Z3SWJvIAFXrRt6Cg3uvvDLf6blZKBvCclTA==
X-Received: by 2002:a62:1808:: with SMTP id 8mr11125738pfy.177.1565640564884;
        Mon, 12 Aug 2019 13:09:24 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:24 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/22] watchdog: ziirave_wdt: Log bootloader/firmware info during probe
Date:   Mon, 12 Aug 2019 13:08:49 -0700
Message-Id: <20190812200906.31344-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Log bootloader/firmware info during probe. This information is
available via sysfs already, but it's really helpful to have this in
kernel log during startup as well.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index a11b92383c5f..75c066602c00 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -69,6 +69,9 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
 #define ZIIRAVE_CMD_JUMP_TO_BOOTLOADER		0x0c
 #define ZIIRAVE_CMD_DOWNLOAD_PACKET		0x0e
 
+#define ZIIRAVE_FW_VERSION_FMT	"02.%02u.%02u"
+#define ZIIRAVE_BL_VERSION_FMT	"01.%02u.%02u"
+
 struct ziirave_wdt_rev {
 	unsigned char major;
 	unsigned char minor;
@@ -489,7 +492,7 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, "02.%02u.%02u", w_priv->firmware_rev.major,
+	ret = sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.major,
 		      w_priv->firmware_rev.minor);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
@@ -512,7 +515,7 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, "01.%02u.%02u", w_priv->bootloader_rev.major,
+	ret = sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.major,
 		      w_priv->bootloader_rev.minor);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
@@ -579,7 +582,8 @@ static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev,
 		goto unlock_mutex;
 	}
 
-	dev_info(&client->dev, "Firmware updated to version 02.%02u.%02u\n",
+	dev_info(&client->dev,
+		 "Firmware updated to version " ZIIRAVE_FW_VERSION_FMT "\n",
 		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
 
 	/* Restore the watchdog timeout */
@@ -716,6 +720,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	dev_info(&client->dev,
+		 "Firmware version: " ZIIRAVE_FW_VERSION_FMT "\n",
+		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
+
 	ret = ziirave_wdt_revision(client, &w_priv->bootloader_rev,
 				   ZIIRAVE_WDT_BOOT_VER_MAJOR);
 	if (ret) {
@@ -723,6 +731,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	dev_info(&client->dev,
+		 "Bootloader version: " ZIIRAVE_BL_VERSION_FMT "\n",
+		 w_priv->bootloader_rev.major, w_priv->bootloader_rev.minor);
+
 	w_priv->reset_reason = i2c_smbus_read_byte_data(client,
 						ZIIRAVE_WDT_RESET_REASON);
 	if (w_priv->reset_reason < 0) {
-- 
2.21.0

