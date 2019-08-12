Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA49A8A804
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfHLUJX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:23 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35010 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727657AbfHLUJW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:22 -0400
Received: by mail-pg1-f193.google.com with SMTP id n4so8302850pgv.2;
        Mon, 12 Aug 2019 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DegDg2tvBAyXrJjc6gXX700jFAcfvGwUPaOS67cRtOc=;
        b=PXrJMfrzuS+VpWJ1SNAjz7a0dzCWasVv6vE2qk3HxkZIDuCI+f+v5gsHswxgmXeqwU
         5dx9LOp3WK3Ap0y7cGrK6ds33EcDDCsUCp7iJXlGnVxsHRNBHVg/Jh+DWnDkySE741dr
         PMZCwrlmm/mZiw0g3cXrdQzaW32AdvjLD2Z+zjdbQTrK//tgip98z4fjY1IUqKsvXDEw
         nHxj7n9FzM65x6+f8dutqRbfft1YqJZO7I7gM4sSWfWrCaNgtA25+Ozn4UiiDFfZM6zS
         rlxhw2+DUbkhanqsZclkrnJNRyebEgQGGLFsMI8bXS+/gzALQcal5YX5xoKCWG3dvYB3
         bqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DegDg2tvBAyXrJjc6gXX700jFAcfvGwUPaOS67cRtOc=;
        b=guBeDO8vhwaXv3PfqgX3WUmZ9krDvdl0E5v4Q9OG7XByi7dbXq1obWmLVKuBnrJgCf
         3YxbSAE4Thy/ga/gzvkfSCMsqQr4E9YenCk6McB6ZqevPhzNo3RKkY1J3SvoEfn17a2J
         FlIfQI53dUoBM2EfaWOwtFTv5WDIu7o6NosUgOT5gWPne4y0B7nkQ7U5snbXxLo6+5pO
         lYV1SU0CIEXkTSDLq8sDCUo8hpzCu/vjDS+XrK/34Vq5xV+P/xLWbQaylDQaPnNHARol
         EcM7tA9zwck/ckMjgFbYfYoIywlQVRF7YKjzq+jenLf3xc3BMg/5pgPD0Kzz0pU9GaDZ
         6Q+Q==
X-Gm-Message-State: APjAAAUuZ3OHQih2kWYZZaLizN57pvatjGm3fVzj+Rd+3F+hHULR/v7T
        fI72ZISJHYWtpA9vFQRfqAUMfqfk
X-Google-Smtp-Source: APXvYqwu/2FETnuIiQWtNg4giB5vY0hRC4rBp7tpnJ5h5smm+tsnZVvPA+2y/KJDM7lBwR3TaNTkFQ==
X-Received: by 2002:a17:90a:ad93:: with SMTP id s19mr955418pjq.36.1565640561479;
        Mon, 12 Aug 2019 13:09:21 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:20 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/22] watchdog: ziirave_wdt: Be verbose about errors in probe()
Date:   Mon, 12 Aug 2019 13:08:46 -0700
Message-Id: <20190812200906.31344-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
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

