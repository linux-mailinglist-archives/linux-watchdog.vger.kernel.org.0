Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E44808A82D
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfHLUKi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:10:38 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43230 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfHLUJ1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:27 -0400
Received: by mail-pg1-f195.google.com with SMTP id r26so14085447pgl.10;
        Mon, 12 Aug 2019 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s01id/bOKqHbSZOwJqDeTGRrZOkCw7N0lkNR7ywaBCU=;
        b=bOm1smK3FIK/qm4nWXJQ3M+ZQ99uM0jxgqV7Q2SaY2u+bSx4syNKCD4U2Sdqy+60Je
         Uf16hlgCEouo117pVAp9X0Nm6ch9AEhIQzp+7+wtrKZ4wCcyNBBH5MhiHDkjZJ0czzgl
         kPRwVKAQrQmvvdlU7mpbA2WxNrWa+AUoWOwP7oFPvhclWkqBnd1nHnClzb6mwneOr6Se
         klg3yfVEFHbIZQKEsf0sum28+PBBfttsunme1LlOLTcAsnoYBPeKhwQ9RYuaMk70vyxv
         BttDGCROP1bTllyYwtaMNeRBAbmKxSsakIDPkzDJ3ldui/BPzdFytOiytUA9acuXC8b1
         crXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s01id/bOKqHbSZOwJqDeTGRrZOkCw7N0lkNR7ywaBCU=;
        b=a8tjBH1HvBeIWFbb3VY3lVGZUe5AZrcHesMbACtruVPnMMVcqJyhyRktRgmEeJuMGg
         veSLJKxD/dVZWZI7jG5jPpkfzZDQE7E2unbSFYbNlRROtVYGaJRkRl3G1qgME/QywTUu
         UUtzCvfhJVmLCRLtHHGIrZ0UMHuWmIAcg+MwMl3OLcZ98rwHv86Ov/t5IwFm9PBu0R0T
         mXsdFtAvmlE04TOmOazuxuBLLHyosLsyQQYfUTFFrYJLzD+THTb7BNLrrsyS3InZTTBk
         75f/sehhoAxh8Vt+8pVcDFffLlsL9RexIY6fIZ01FlejFtwnnZhbTeyZYBl64FyxcoJ1
         XRBg==
X-Gm-Message-State: APjAAAWzBKE1/Eyi7tjj4V0iR0aR2gwPzttrmEdzspakvFnnBHdPeixj
        jUf8fh6eIDLwIJAJ5oxvlBacoUFB
X-Google-Smtp-Source: APXvYqwnOkLd8FQChENX81H6oxLjr0wNdj8grTifdhEXAM7laAo9vmVoeIvqe8bTpgjNhZO8F/MZfQ==
X-Received: by 2002:a62:640c:: with SMTP id y12mr36702608pfb.166.1565640566249;
        Mon, 12 Aug 2019 13:09:26 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:25 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/22] watchdog: ziirave_wdt: Simplify ziirave_firm_write_pkt()
Date:   Mon, 12 Aug 2019 13:08:50 -0700
Message-Id: <20190812200906.31344-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There no reason why ziirave_firm_write_pkt() has to take firmware
data via 'struct ihex_binrec' and it can just take address, data pointer
and data length as individual arguments. Make this change to allow us
to drastically simplify handling page crossing case by removing all of
the extra code required to split 'struct ihex_binrec' into two.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 116 +++++++++++++--------------------
 1 file changed, 44 insertions(+), 72 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 75c066602c00..b2d5ff0c22fe 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -51,6 +51,7 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
 #define ZIIRAVE_FIRM_PKT_DATA_SIZE	16
 #define ZIIRAVE_FIRM_FLASH_MEMORY_START	0x1600
 #define ZIIRAVE_FIRM_FLASH_MEMORY_END	0x2bbf
+#define ZIIRAVE_FIRM_PAGE_SIZE		128
 
 /* Received and ready for next Download packet. */
 #define ZIIRAVE_FIRM_DOWNLOAD_ACK	1
@@ -244,27 +245,26 @@ static int ziirave_firm_write_byte(struct watchdog_device *wdd, u8 command,
  *     Data0 .. Data15: Array of 16 bytes of data.
  *     Checksum: Checksum byte to verify data integrity.
  */
-static int ziirave_firm_write_pkt(struct watchdog_device *wdd,
-				  const struct ihex_binrec *rec)
+static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
+				    u32 addr, const u8 *data, u8 len)
 {
+	const u16 addr16 = (u16)addr / 2;
 	struct i2c_client *client = to_i2c_client(wdd->parent);
 	u8 i, checksum = 0, packet[ZIIRAVE_FIRM_PKT_TOTAL_SIZE];
 	int ret;
-	u16 addr;
 
 	memset(packet, 0, ARRAY_SIZE(packet));
 
 	/* Packet length */
-	packet[0] = (u8)be16_to_cpu(rec->len);
+	packet[0] = len;
 	/* Packet address */
-	addr = (be32_to_cpu(rec->addr) & 0xffff) >> 1;
-	packet[1] = addr & 0xff;
-	packet[2] = (addr & 0xff00) >> 8;
+	packet[1] = addr16 & 0xff;
+	packet[2] = (addr16 & 0xff00) >> 8;
 
 	/* Packet data */
-	if (be16_to_cpu(rec->len) > ZIIRAVE_FIRM_PKT_DATA_SIZE)
+	if (len > ZIIRAVE_FIRM_PKT_DATA_SIZE)
 		return -EMSGSIZE;
-	memcpy(packet + 3, rec->data, be16_to_cpu(rec->len));
+	memcpy(packet + 3, data, len);
 
 	/* Packet checksum */
 	for (i = 0; i < ZIIRAVE_FIRM_PKT_TOTAL_SIZE - 1; i++)
@@ -276,11 +276,35 @@ static int ziirave_firm_write_pkt(struct watchdog_device *wdd,
 	if (ret)
 		dev_err(&client->dev,
 		      "Failed to write firmware packet at address 0x%04x: %d\n",
-		      addr, ret);
+		      addr16, ret);
 
 	return ret;
 }
 
+static int ziirave_firm_write_pkt(struct watchdog_device *wdd,
+				  u32 addr, const u8 *data, u8 len)
+{
+	const u8 max_write_len = ZIIRAVE_FIRM_PAGE_SIZE -
+		(addr - ALIGN_DOWN(addr, ZIIRAVE_FIRM_PAGE_SIZE));
+	int ret;
+
+	if (len > max_write_len) {
+		/*
+		 * If data crossed page boundary we need to split this
+		 * write in two
+		 */
+		ret = __ziirave_firm_write_pkt(wdd, addr, data, max_write_len);
+		if (ret)
+			return ret;
+
+		addr += max_write_len;
+		data += max_write_len;
+		len  -= max_write_len;
+	}
+
+	return __ziirave_firm_write_pkt(wdd, addr, data, len);
+}
+
 static int ziirave_firm_verify(struct watchdog_device *wdd,
 			       const struct firmware *fw)
 {
@@ -333,9 +357,8 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 			       const struct firmware *fw)
 {
 	struct i2c_client *client = to_i2c_client(wdd->parent);
-	int ret, words_till_page_break;
 	const struct ihex_binrec *rec;
-	struct ihex_binrec *rec_new;
+	int ret;
 
 	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_JUMP_TO_BOOTLOADER, 1,
 				      false);
@@ -366,68 +389,17 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 			return -EMSGSIZE;
 		}
 
-		/* Calculate words till page break */
-		words_till_page_break = (64 - ((be32_to_cpu(rec->addr) >> 1) &
-					 0x3f));
-		if ((be16_to_cpu(rec->len) >> 1) > words_till_page_break) {
-			/*
-			 * Data in passes page boundary, so we need to split in
-			 * two blocks of data. Create a packet with the first
-			 * block of data.
-			 */
-			rec_new = kzalloc(sizeof(struct ihex_binrec) +
-					  (words_till_page_break << 1),
-					  GFP_KERNEL);
-			if (!rec_new)
-				return -ENOMEM;
-
-			rec_new->len = cpu_to_be16(words_till_page_break << 1);
-			rec_new->addr = rec->addr;
-			memcpy(rec_new->data, rec->data,
-			       be16_to_cpu(rec_new->len));
-
-			ret = ziirave_firm_write_pkt(wdd, rec_new);
-			kfree(rec_new);
-			if (ret)
-				return ret;
-
-			/* Create a packet with the second block of data */
-			rec_new = kzalloc(sizeof(struct ihex_binrec) +
-					  be16_to_cpu(rec->len) -
-					  (words_till_page_break << 1),
-					  GFP_KERNEL);
-			if (!rec_new)
-				return -ENOMEM;
-
-			/* Remaining bytes */
-			rec_new->len = rec->len -
-				       cpu_to_be16(words_till_page_break << 1);
-
-			rec_new->addr = cpu_to_be32(be32_to_cpu(rec->addr) +
-					(words_till_page_break << 1));
-
-			memcpy(rec_new->data,
-			       rec->data + (words_till_page_break << 1),
-			       be16_to_cpu(rec_new->len));
-
-			ret = ziirave_firm_write_pkt(wdd, rec_new);
-			kfree(rec_new);
-			if (ret)
-				return ret;
-		} else {
-			ret = ziirave_firm_write_pkt(wdd, rec);
-			if (ret)
-				return ret;
-		}
+		ret = ziirave_firm_write_pkt(wdd, be32_to_cpu(rec->addr),
+					     rec->data, be16_to_cpu(rec->len));
+		if (ret)
+			return ret;
 	}
 
-	/* For end of download, the length field will be set to 0 */
-	rec_new = kzalloc(sizeof(struct ihex_binrec) + 1, GFP_KERNEL);
-	if (!rec_new)
-		return -ENOMEM;
-
-	ret = ziirave_firm_write_pkt(wdd, rec_new);
-	kfree(rec_new);
+	/*
+	 * Finish firmware download process by sending a zero length
+	 * payload
+	 */
+	ret = ziirave_firm_write_pkt(wdd, 0, NULL, 0);
 	if (ret) {
 		dev_err(&client->dev, "Failed to send EMPTY packet: %d\n", ret);
 		return ret;
-- 
2.21.0

