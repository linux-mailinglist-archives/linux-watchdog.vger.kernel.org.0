Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 289F58A819
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbfHLUJp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:45 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35062 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfHLUJp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:45 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so48288655plp.2;
        Mon, 12 Aug 2019 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RxWEj5XMwOhp9jEr2BxVYNQrB7abAMc2i7oVzlWuaws=;
        b=WD2YxYTpoBV1JC+G2nKak6sdXHA3qCJi8wJA+7zeuD5M9aSSf2wmtsl7QzQ+A5qvkc
         xO0ZSxarhAiHUXECiVGFUAC1TlEbB/a7xbmV5Nn0pJeUW9Uma32kSsnMmusKqax0mScI
         CrRBdipJJkm4hbLzXtIOBikrtq1qpHct/m4rSH9b1wprYKGw1MFzEOPtiCenFBYIBD5A
         sPDnypOwlfaaAt6FarR544rmqr1l9Y6YFOsHUMQNlgKhgJfv5MVDrlpuZvLpuWkJeCx2
         BwJu1LCwCtT0JjhYyqQG0RynzwzRSNYOh+Jl7oNKCBynZyo/RqTrwYguMaM25ZiOGXqG
         hYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RxWEj5XMwOhp9jEr2BxVYNQrB7abAMc2i7oVzlWuaws=;
        b=fm3AD7giNxJh+Totymbx/nJLxkNhxKJpWxpCkD4Uwezv9MEKpKMs4MWCW3P1zX/rIe
         7YTiZZG1ndUm5pNzTHQvc7yOi41cH2qiEO61OCHxn8DBStiNkgBrYlcFRTp2omdKn7xa
         L3iChPsypmuU7+0HbTG0W7RwpdhAHKb/az7DCIPSPQSBE1MX1emUq8CoFi/+HE5oiZK+
         MPr2FEoIegBE/7qjq21guz4wwZbUJiuN6cGV6rR9Teq/3IS/etUydWsmUwFUxQqxC+C7
         AEG0ITmIHr7AetrfVAYJHYsi6SaPoGMg8TpgHNMYQGIamG4hdseojIXumM57frTH/NrQ
         r5SA==
X-Gm-Message-State: APjAAAXHBfuU5A2VrMkX0/fjj2QZ/T6jZjmJ1hAdxSYzBFDBQCxAVPMZ
        td3Yi72JvHcwTVmMFeQ9DS1LP0G7
X-Google-Smtp-Source: APXvYqzkSsXZeoXM7L24AckIu+2acToD1OycG49Ca+NmMtt6Bk0QCXvBSoK2nsomtXYmVCPZ71OIfw==
X-Received: by 2002:a17:902:100a:: with SMTP id b10mr33728350pla.338.1565640584405;
        Mon, 12 Aug 2019 13:09:44 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:43 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/22] watchdog: ziirave_wdt: Fix DOWNLOAD_START payload
Date:   Mon, 12 Aug 2019 13:09:04 -0700
Message-Id: <20190812200906.31344-21-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Bootloader firmware expects the following traffic for DOWNLOAD_END:

S Addr Wr [A] 0x10 [A] P

using ziirave_firm_write_byte() will result in

S Addr Wr [A] 0x10 [A] 0x01 [A] 0x01 [A] P

which happens to work because firmware will ignore any extra bytes
sent. Fix this by converting the code to use i2c_smbus_write_byte()
instead.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 681f65349779..ed69fa82e09c 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -217,13 +217,6 @@ static int ziirave_firm_write_block_data(struct watchdog_device *wdd,
 	return ret;
 }
 
-static int ziirave_firm_write_byte(struct watchdog_device *wdd, u8 command,
-				   u8 byte, bool wait_for_ack)
-{
-	return ziirave_firm_write_block_data(wdd, command, 1, &byte,
-					     wait_for_ack);
-}
-
 static bool ziirave_firm_addr_readonly(u32 addr)
 {
 	return addr < ZIIRAVE_FIRM_FLASH_MEMORY_START ||
@@ -375,12 +368,18 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 
 	msleep(500);
 
-	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_DOWNLOAD_START, 1, true);
+	ret = i2c_smbus_write_byte(client, ZIIRAVE_CMD_DOWNLOAD_START);
 	if (ret) {
 		dev_err(&client->dev, "Failed to start download\n");
 		return ret;
 	}
 
+	ret = ziirave_firm_read_ack(wdd);
+	if (ret) {
+		dev_err(&client->dev, "No ACK for start download\n");
+		return ret;
+	}
+
 	msleep(500);
 
 	for (rec = (void *)fw->data; rec; rec = ihex_next_binrec(rec)) {
-- 
2.21.0

