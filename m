Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7035A8A81C
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfHLUJr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:47 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34706 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727832AbfHLUJq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:46 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so48333008plt.1;
        Mon, 12 Aug 2019 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G3aE0HR7FH8dxZEfkREqg9dVCNPdu5b7189bsJL1s1I=;
        b=VyJrl7Ydz3J26svxaTUS+WXyPZFZyX6onCknUDHWfh3YZrXjzwb6N7C8QDOQeZgv0l
         Jcv+4p5v5/UBKLMfJZ7/S7jXpfbrqRwhNbgGeJY/3jZ25jFOlJLkVqFH1B4/vJ1yB4ac
         KjVum2kt3pONCmil63qjxxe//95Y+3NKPNYaFU2hfZ/ye+kMXaV6eKhNn1wY+ts7hNvV
         ++oop01X74XIhItmvH6ZmKEoK+0uQ33iNDvLtATHyeaCuN7sr5gguixciutmyHHpy1di
         8QtHR5AByJ+auXIggRAfO2sGXlEPkhVKCyzxOAHMU+qgekXGsw2lDNaSKqdjSnVnoPRG
         IjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G3aE0HR7FH8dxZEfkREqg9dVCNPdu5b7189bsJL1s1I=;
        b=XN5oZZvb9F46UIMwIMRBQ/Ed4i8ZC1YsHKMyNNfB6kPGdU99D/pB4FH9XNKqQeieWi
         CREFjxkbe4m8SH/qbH31wfePmQQefA/leS9fIi745nwF1V88AO/nRzVJN0siQSmn099w
         WU/i0IitZNVc7s+MleEsOaQfkdEFZIpFz93smMu7Ua2NsIQT7RJF8lA8WQpDAp4ciqc1
         p0scmFfNU+/3WgBnuJmfH74kn44dWQZx87BUTU+Ka+0o/8dBpUZnU2KOIMmBviHNqrxH
         YaCWpJUBpQTk4A6TD74jBrfkhBEkZjpr19J2rSng1+G1b4Ru1a7VQy7ummEClUvrkahH
         TbRA==
X-Gm-Message-State: APjAAAU/Xy2dyadJNNRY3bvmkb/+jqF3dVYkq/3KtLDCdwq4cakVNE1i
        Crm8wQujKqni691tbTbhoGs/drnj
X-Google-Smtp-Source: APXvYqzC5WkgKM6qxhcGrKVd7zOiPyHZItfP6NE4i8jBUw8R8pdqODfSOlB82hwMuHUFAHFO/GGcMw==
X-Received: by 2002:a17:902:be01:: with SMTP id r1mr14556016pls.229.1565640585591;
        Mon, 12 Aug 2019 13:09:45 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:44 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/22] watchdog: ziirave_wdt: Drop ziirave_firm_write_block_data()
Date:   Mon, 12 Aug 2019 13:09:05 -0700
Message-Id: <20190812200906.31344-22-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There's only one user of ziirave_firm_write_block_data(), so we may as
well inline it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index ed69fa82e09c..48278034cda6 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -197,26 +197,6 @@ static int ziirave_firm_set_read_addr(struct watchdog_device *wdd, u32 addr)
 					  sizeof(address), address);
 }
 
-static int ziirave_firm_write_block_data(struct watchdog_device *wdd,
-					 u8 command, u8 length, const u8 *data,
-					 bool wait_for_ack)
-{
-	struct i2c_client *client = to_i2c_client(wdd->parent);
-	int ret;
-
-	ret = i2c_smbus_write_block_data(client, command, length, data);
-	if (ret) {
-		dev_err(&client->dev,
-			"Failed to send command 0x%02x: %d\n", command, ret);
-		return ret;
-	}
-
-	if (wait_for_ack)
-		ret = ziirave_firm_read_ack(wdd);
-
-	return ret;
-}
-
 static bool ziirave_firm_addr_readonly(u32 addr)
 {
 	return addr < ZIIRAVE_FIRM_FLASH_MEMORY_START ||
@@ -273,8 +253,15 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 		checksum += packet[i];
 	packet[ZIIRAVE_FIRM_PKT_TOTAL_SIZE - 1] = checksum;
 
-	ret = ziirave_firm_write_block_data(wdd, ZIIRAVE_CMD_DOWNLOAD_PACKET,
-					    sizeof(packet), packet, true);
+	ret = i2c_smbus_write_block_data(client, ZIIRAVE_CMD_DOWNLOAD_PACKET,
+					 sizeof(packet), packet);
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to send DOWNLOAD_PACKET: %d\n", ret);
+		return ret;
+	}
+
+	ret = ziirave_firm_read_ack(wdd);
 	if (ret)
 		dev_err(&client->dev,
 		      "Failed to write firmware packet at address 0x%04x: %d\n",
-- 
2.21.0

