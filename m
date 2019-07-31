Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 244BC7CAC5
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbfGaRnJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 13:43:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38879 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729495AbfGaRnJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 13:43:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id y15so32285014pfn.5;
        Wed, 31 Jul 2019 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qdP7zcW+fsPauZxZz+eQFRnAEj1f5IU9NKoZzh/om+g=;
        b=eVcB1DArHZXjOZuYdvsD76Fy22cr4pxD2N0Ar6T4p/tAZMZDaUr431SUCDf16cN2g0
         YAxqE4/ytqjfsqmgQSPTBz2RZ6yrntUJSLYahSBDS4ze4+iuRO5A+Ze+d1ZYilOcBNCA
         6JOezh5ndagN9dKbXS4hTEmusmoNt+9tGt5UBG6bwUbqlmMckZ/ToPEy2J1SNXPRac9N
         H8/s+2bBEbPTv9sQ/G+kW9vKrzSqtrBDc/6Rq7+ogQvVsRI7kI7DTG33X9/Q3VGkwmvP
         ASZGqscxPJe83BKuBJgZFjYzEIKUuk6WbehoDGWTufXvEENw5qcvvyPyCRBkruA4nP0r
         YcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qdP7zcW+fsPauZxZz+eQFRnAEj1f5IU9NKoZzh/om+g=;
        b=rSnme//CmrkzNC9DuvqPH10GFd4fhsXr90cUlTRwxqPDswAxCVrrga/1GqPP3RVyyU
         EOgWxhR5z+565yICzOGnpUMYbsSavfABLkDS4fePFl+I38162G3M2CxYn0nZKO7mLBSv
         VfOzu+eHbYg/PaEZtdcyX7qw5EM6FwuJboTW8VtgO3nmI7weOTMxwhQEaTrtwA/ntaPu
         IncMjYhCHbW4FvkzEAACKKQEff/xo4IyPXh30qHjHmg95Cb7AKIkuG8qN1RMApFM0BNl
         BIMOXE8LveVB/gBJ5GqXlf2Kf6iKVDN+eoPUCmQ3ml6VtPfqJkyDVaxj0pNeB+RqUKfO
         Yf0w==
X-Gm-Message-State: APjAAAVrClJUWXd3LzQa3XfdA20onu/TuHudk5uJ6GSRqE1ckG1btGJc
        EVKf3MEp17eRDGvce0zHBrtCTsqZ
X-Google-Smtp-Source: APXvYqxC1zj4+nftzjZqEJJIxCEGbwiSzWdB5H+pOucxoZmOZPbLbAPK0BTvJ/p2il1olsoJE/yHhA==
X-Received: by 2002:a17:90a:8d09:: with SMTP id c9mr4117269pjo.131.1564594988181;
        Wed, 31 Jul 2019 10:43:08 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:4ad:5a0b:2aff:6e0f:8973:5a26])
        by smtp.gmail.com with ESMTPSA id k8sm65941259pgm.14.2019.07.31.10.43.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 10:43:07 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] watchdog: ziirave_wdt: Log bootloader/firmware info during probe
Date:   Wed, 31 Jul 2019 10:42:52 -0700
Message-Id: <20190731174252.18041-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731174252.18041-1-andrew.smirnov@gmail.com>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
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
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 33c8d2eadada..84ba8820ac86 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -68,6 +68,9 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
 #define ZIIRAVE_CMD_JUMP_TO_BOOTLOADER		0x0c
 #define ZIIRAVE_CMD_DOWNLOAD_PACKET		0x0e
 
+#define ZIIRAVE_FW_VERSION_FMT	"02.%02u.%02u"
+#define ZIIRAVE_BL_VERSION_FMT	"01.%02u.%02u"
+
 struct ziirave_wdt_rev {
 	unsigned char major;
 	unsigned char minor;
@@ -482,7 +485,7 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, "02.%02u.%02u", w_priv->firmware_rev.major,
+	ret = sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.major,
 		      w_priv->firmware_rev.minor);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
@@ -505,7 +508,7 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = sprintf(buf, "01.%02u.%02u", w_priv->bootloader_rev.major,
+	ret = sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.major,
 		      w_priv->bootloader_rev.minor);
 
 	mutex_unlock(&w_priv->sysfs_mutex);
@@ -572,7 +575,8 @@ static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev,
 		goto unlock_mutex;
 	}
 
-	dev_info(&client->dev, "Firmware updated to version 02.%02u.%02u\n",
+	dev_info(&client->dev,
+		 "Firmware updated to version " ZIIRAVE_FW_VERSION_FMT "\n",
 		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
 
 	/* Restore the watchdog timeout */
@@ -706,6 +710,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	dev_info(&client->dev,
+		 "Firmware version: " ZIIRAVE_FW_VERSION_FMT "\n",
+		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
+
 	ret = ziirave_wdt_revision(client, &w_priv->bootloader_rev,
 				   ZIIRAVE_WDT_BOOT_VER_MAJOR);
 	if (ret) {
@@ -713,6 +721,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
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

