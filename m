Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 070CD8A81B
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbfHLUJp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42790 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbfHLUJo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id t132so50030737pgb.9;
        Mon, 12 Aug 2019 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y/3NpRbAXSpks6ZVOUgLBx0/AW1xab8Pj1LqMmAn7qo=;
        b=cJgAvxwGq/F1fGo6TMU9j0IylL76YLy2x522a6bJVRDKi+sykIKq48UoG6VLM+mYOY
         IaIxesN6lg3pQ46pvA68CocEE49WGIya5aQTsA0c5qqBOthtBeupSqwWFiBZUKZ7257Y
         3ZNv+5ywPSRpiQ/lB6Mqi1go+N+fZkEForZbaZQ7q5Ku5zQwdEbQBP7QJEFo9U/jD0wK
         DCMLVGYv2bYkkKUobJzeK1cJFdKK34c+atOZ4qtO/zA8wLz0LiyDXO/YlQ8dWlo4rLx6
         KuqT4/iYymHjpxT3AWZLYA1WYSDL7l//sPngo38Js843laHeZIeuLnNwCQuMHu8xAv56
         Nlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/3NpRbAXSpks6ZVOUgLBx0/AW1xab8Pj1LqMmAn7qo=;
        b=CT/Uys/Qm6GdWloQTOOypXn/HdPQLx7GSa0VeninVn+Xhd/dEMoh6LR5tjQiZtdZx8
         APVwwfQ7M1ViTBQCZIeJp+wT6zHFdBhHLmiBIMzRhUhKRVzxA2B9XzSAYIqR6pIhEHXb
         q8+K57HAGdLUDRwYAI/YRSLfU8K8XxPLtwscAMyrrqPH/+LWv1uvIwsB1H5tdOkP3zga
         8zE1xxP2Xg3ZVjL9zA30/DkAJPDUOElMUvwzFp8+4X1a5dcrTOiHhMP/locBFkWPSiOY
         cryZ6eEoYKregjPs54XFMJzivk3bq5KzfPfC1NnJ3V/v1NFcEyHxlxPRwtyEYdHyjl0a
         VJ0A==
X-Gm-Message-State: APjAAAVos5lqU30rG3RvWxpUoccgaJVsm4mcpvu/bU6p+XsaL/4c/1BH
        VGvDSs8wvT5PTnVeyAY37zIdJ+L7
X-Google-Smtp-Source: APXvYqzIJEo6XNER7IickBgoo+WdjfCIkgTxZCbeOfkljfSLpaPoSt0L/fKA8CgG8R2YuKBmC7wfJQ==
X-Received: by 2002:a17:90a:c24e:: with SMTP id d14mr919163pjx.129.1565640583255;
        Mon, 12 Aug 2019 13:09:43 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:42 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/22] watchdog: ziirave_wdt: Drop status polling code
Date:   Mon, 12 Aug 2019 13:09:03 -0700
Message-Id: <20190812200906.31344-20-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Bootloader firmware doesn't implement DOWNLOAD_START or
DOWNLOAD_PACKET in a non-blocking way. It will stretch the clock of
the first status byte read until the operation is complete. Polling
for the status is not really necessary since it will always succed on
the first try. Replace polling code with a simple single byte read to
simplify things.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 92df27350e41..681f65349779 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -57,11 +57,6 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
 
 /* Received and ready for next Download packet. */
 #define ZIIRAVE_FIRM_DOWNLOAD_ACK	1
-/* Currently writing to flash. Retry Download status in a moment! */
-#define ZIIRAVE_FIRM_DOWNLOAD_BUSY	2
-
-/* Wait for ACK timeout in ms */
-#define ZIIRAVE_FIRM_WAIT_FOR_ACK_TIMEOUT	50
 
 /* Firmware commands */
 #define ZIIRAVE_CMD_DOWNLOAD_START		0x10
@@ -175,25 +170,16 @@ static unsigned int ziirave_wdt_get_timeleft(struct watchdog_device *wdd)
 	return ret;
 }
 
-static int ziirave_firm_wait_for_ack(struct watchdog_device *wdd)
+static int ziirave_firm_read_ack(struct watchdog_device *wdd)
 {
 	struct i2c_client *client = to_i2c_client(wdd->parent);
 	int ret;
-	unsigned long timeout;
-
-	timeout = jiffies + msecs_to_jiffies(ZIIRAVE_FIRM_WAIT_FOR_ACK_TIMEOUT);
-	do {
-		if (time_after(jiffies, timeout))
-			return -ETIMEDOUT;
 
-		usleep_range(5000, 10000);
-
-		ret = i2c_smbus_read_byte(client);
-		if (ret < 0) {
-			dev_err(&client->dev, "Failed to read byte\n");
-			return ret;
-		}
-	} while (ret == ZIIRAVE_FIRM_DOWNLOAD_BUSY);
+	ret = i2c_smbus_read_byte(client);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read status byte\n");
+		return ret;
+	}
 
 	return ret == ZIIRAVE_FIRM_DOWNLOAD_ACK ? 0 : -EIO;
 }
@@ -226,7 +212,7 @@ static int ziirave_firm_write_block_data(struct watchdog_device *wdd,
 	}
 
 	if (wait_for_ack)
-		ret = ziirave_firm_wait_for_ack(wdd);
+		ret = ziirave_firm_read_ack(wdd);
 
 	return ret;
 }
-- 
2.21.0

