Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186647CAC2
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfGaRnF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 13:43:05 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34814 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbfGaRnD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 13:43:03 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so26179323pgc.1;
        Wed, 31 Jul 2019 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RnccxTMv5+LcoppvjojR/fSKkox/Hhf3XMW3FYv8fqE=;
        b=tXa44HXR5xfJHnRGG15h9FQetBMUhenRl3sm87oP8YRVsqYY0cy054Z1Z/p5gMzNKc
         UpD1N5lvG7eYieD5vypBah15wgmZcKOJYgV5caqovynwdvDCAf6PYU35xMEAF2JKUXdE
         NksYgv4fQLuMxhtdHVCYz3KPymT3LO9LKUCxXKrguSeRZX+CmB2BgTzbWe9Yq5+Ay6l+
         mYJ1MZ0lepNzgtV4qFcie+IMSda3IpnVjfI76KHjItpxq4t/RJBir1eMn8a3vs9o4VCy
         GvSscBUDYG+s9i4aOkJUo54oZqUflQMbfC0ZDaerCh6nIINCy6SouQQFCnkM8BeiMLXm
         gSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RnccxTMv5+LcoppvjojR/fSKkox/Hhf3XMW3FYv8fqE=;
        b=WyUt4rCwxakQ60SB1BsRXx1i5WyQeBcc3e9NUhZLZbnYcHjHol2rZ/aG7Xy0GlrdJw
         DSbGqoLVUzDEMf5MuTnDQdDMYzOR/43pYpwgVqFz1bcuMe3RvdrupXHP9bF0WU7bkCe/
         IkhBhJVfueJ/BUYpohLPgJrWK0FyhSIhcEetAA9ewF+anwgjjpcgBIkAHuCrbStbxfAd
         bub1KQMYhFIbxSgnSbO6im0IKq7t3qJ1DQvn6tyMrrmAMGoygMIETcvN+2xPmO2xXsb7
         0DGoK7ZB/VChM1HrR0HP72YByNyei06V6RXLesUrKYIAz+YsYBKZk/8t58tAWS0h4lJA
         NCfA==
X-Gm-Message-State: APjAAAXfnKsh2hHY41lPNVDao9YZGX4i1xc5icSsmxNLFZKStDdxBYFV
        h8JdPBCRnoAgkPTqr/cJl1hz5a/L
X-Google-Smtp-Source: APXvYqztJRy80ROLAN9XD0XKanZ5OUWLyXWDy3qubqx2akOfIqdJsSZ+7ei1laY0oem2q7ji4ueCYQ==
X-Received: by 2002:a17:90a:7787:: with SMTP id v7mr4099480pjk.143.1564594982503;
        Wed, 31 Jul 2019 10:43:02 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:4ad:5a0b:2aff:6e0f:8973:5a26])
        by smtp.gmail.com with ESMTPSA id k8sm65941259pgm.14.2019.07.31.10.43.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 10:43:01 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] watchdog: ziirave_wdt: Be verbose about errors in probe()
Date:   Wed, 31 Jul 2019 10:42:49 -0700
Message-Id: <20190731174252.18041-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731174252.18041-1-andrew.smirnov@gmail.com>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The driver is quite silent in case of probe failure, which makes it
more difficult to diagnose problem from the kernel log. Add logging to
all of the silent error paths ziirave_wdt_probe() to improve that.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 6ec028fb2635..8c71341a9c1c 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -658,8 +658,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 	 */
 	if (w_priv->wdd.timeout == 0) {
 		val = i2c_smbus_read_byte_data(client, ZIIRAVE_WDT_TIMEOUT);
-		if (val < 0)
+		if (val < 0) {
+			dev_err(&client->dev, "Failed to read timeout\n");
 			return val;
+		}
 
 		if (val < ZIIRAVE_TIMEOUT_MIN)
 			return -ENODEV;
@@ -668,8 +670,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 	} else {
 		ret = ziirave_wdt_set_timeout(&w_priv->wdd,
 					      w_priv->wdd.timeout);
-		if (ret)
+		if (ret) {
+			dev_err(&client->dev, "Failed to set timeout\n");
 			return ret;
+		}
 
 		dev_info(&client->dev, "Timeout set to %ds\n",
 			 w_priv->wdd.timeout);
@@ -681,34 +685,46 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 
 	/* If in unconfigured state, set to stopped */
 	val = i2c_smbus_read_byte_data(client, ZIIRAVE_WDT_STATE);
-	if (val < 0)
+	if (val < 0) {
+		dev_err(&client->dev, "Failed to read state\n");
 		return val;
+	}
 
 	if (val == ZIIRAVE_STATE_INITIAL)
 		ziirave_wdt_stop(&w_priv->wdd);
 
 	ret = ziirave_wdt_init_duration(client);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "Failed to init duration\n");
 		return ret;
+	}
 
 	ret = ziirave_wdt_revision(client, &w_priv->firmware_rev,
 				   ZIIRAVE_WDT_FIRM_VER_MAJOR);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "Failed to read firmware version\n");
 		return ret;
+	}
 
 	ret = ziirave_wdt_revision(client, &w_priv->bootloader_rev,
 				   ZIIRAVE_WDT_BOOT_VER_MAJOR);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "Failed to read bootloader version\n");
 		return ret;
+	}
 
 	w_priv->reset_reason = i2c_smbus_read_byte_data(client,
 						ZIIRAVE_WDT_RESET_REASON);
-	if (w_priv->reset_reason < 0)
+	if (w_priv->reset_reason < 0) {
+		dev_err(&client->dev, "Failed to read reset reason\n");
 		return w_priv->reset_reason;
+	}
 
 	if (w_priv->reset_reason >= ARRAY_SIZE(ziirave_reasons) ||
-	    !ziirave_reasons[w_priv->reset_reason])
+	    !ziirave_reasons[w_priv->reset_reason]) {
+		dev_err(&client->dev, "Invalid reset reason\n");
 		return -ENODEV;
+	}
 
 	ret = watchdog_register_device(&w_priv->wdd);
 
-- 
2.21.0

