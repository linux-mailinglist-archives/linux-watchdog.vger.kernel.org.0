Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE6A88A824
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfHLUKO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:10:14 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44669 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbfHLUJi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id c81so1237350pfc.11;
        Mon, 12 Aug 2019 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xRnCXPOXDMuZQhnpqA+htuwTVhEEUcMOIJr19kWmsc=;
        b=FjXND/xQUqmA91G+FF/Jq1RGy1RXOfVBnb6Iydfjon9OnCBTWGXG+mpx7I9Wvken/P
         znGJeNu6doUGuE0HpbLpOroahAZJFCqB5XeplmWtHwZn0IZoGGaHMMnwgDz/KbLgW25b
         PgW0+Jp2kmlKRgiuiE7OON07VRLspfuL4z/ICSBdvWXgWCefaUgjMMB70Em4OvKNPDsU
         9PznDL7TakghuMOhZYCF7gEbDYCWZ6NEK7Y1VmlF8twXe6v1YWrde98/iDnarbGVhjBk
         gP48B8GjbyxAZskzidoSJSc6QB7cDlhZV695BQhvOaF3cAN1tpkT99WHAWUXOWGDWgMw
         SJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xRnCXPOXDMuZQhnpqA+htuwTVhEEUcMOIJr19kWmsc=;
        b=PCKamoEtqRW42OHJlYL4EcJD4BbX3dN802mG7mKKGvwbXJazt1MV5ZYt7CueblgiUR
         o0xomb0tqzg1j/FAUYUJujf5/npawzOmVyEo1hiy9z71EFeD22SLEquXzN1GEFDLBEfE
         a7vZ2d0uzUJrdnxfADS6OfXzhN8pbuGkMOqwlChizgVYCVBP7+4bDLAGcW9O6EBl6MFf
         t2sCUcgvo4byPCCfd4OA9XqGBk9RHQtU/Q04B0B+gLcQHtwWSG16YfeMT+fpSBAc5Rzk
         NlPCEQ+YP5zwBhqQUnp2NfMfk/a1H8hJJd+hN2XzYUdJcgO8CnBQet4TtqqLHqDOCocW
         mAIQ==
X-Gm-Message-State: APjAAAU17qGS0SklKSyFu40Ho97JCEi/fnIBLSyE5ZYUPmrINB9tE2on
        QnCOYlGuHqHg8GbKKjQ5CloeNezl
X-Google-Smtp-Source: APXvYqwt+H0sjUTZ6SSyeGRMxuVp1+16KAb2czF9wZ90mc42aXiUVIh6QYHQAKRgrf+pud+/cQiVUQ==
X-Received: by 2002:a63:553:: with SMTP id 80mr32443475pgf.280.1565640576764;
        Mon, 12 Aug 2019 13:09:36 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:36 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/22] watchdog: ziirave_wdt: Don't try to program readonly flash
Date:   Mon, 12 Aug 2019 13:08:58 -0700
Message-Id: <20190812200906.31344-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Bootloader code will ignore any attempts to write data to any flash
area outside of [ZIIRAVE_FIRM_FLASH_MEMORY_START;
ZIIRAVE_FIRM_FLASH_MEMORY_END]. Firmware update code already have an
appropriate check to skip those areas when validating updated
firmware. Firmware programming code, OTOH, does not and will
needlessly send no-op I2C traffic. Add an appropriate check to
__ziirave_firm_write_pkt() so as to save all of that wasted effort.

While at it, normalize all of the address handling code to use full
32-bit address in units of bytes and convert it to an appropriate
value only in places where that is necessary.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index f05095b08016..a3cc936858ad 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -51,8 +51,8 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
 
 #define ZIIRAVE_FIRM_PKT_TOTAL_SIZE	20
 #define ZIIRAVE_FIRM_PKT_DATA_SIZE	16
-#define ZIIRAVE_FIRM_FLASH_MEMORY_START	0x1600
-#define ZIIRAVE_FIRM_FLASH_MEMORY_END	0x2bbf
+#define ZIIRAVE_FIRM_FLASH_MEMORY_START	(2 * 0x1600)
+#define ZIIRAVE_FIRM_FLASH_MEMORY_END	(2 * 0x2bbf)
 #define ZIIRAVE_FIRM_PAGE_SIZE		128
 
 /* Received and ready for next Download packet. */
@@ -195,12 +195,13 @@ static int ziirave_firm_wait_for_ack(struct watchdog_device *wdd)
 	return ret == ZIIRAVE_FIRM_DOWNLOAD_ACK ? 0 : -EIO;
 }
 
-static int ziirave_firm_set_read_addr(struct watchdog_device *wdd, u16 addr)
+static int ziirave_firm_set_read_addr(struct watchdog_device *wdd, u32 addr)
 {
 	struct i2c_client *client = to_i2c_client(wdd->parent);
+	const u16 addr16 = (u16)addr / 2;
 	u8 address[2];
 
-	put_unaligned_le16(addr, address);
+	put_unaligned_le16(addr16, address);
 
 	return i2c_smbus_write_block_data(client,
 					  ZIIRAVE_CMD_DOWNLOAD_SET_READ_ADDR,
@@ -234,6 +235,12 @@ static int ziirave_firm_write_byte(struct watchdog_device *wdd, u8 command,
 					     wait_for_ack);
 }
 
+static bool ziirave_firm_addr_readonly(u32 addr)
+{
+	return addr < ZIIRAVE_FIRM_FLASH_MEMORY_START ||
+	       addr > ZIIRAVE_FIRM_FLASH_MEMORY_END;
+}
+
 /*
  * ziirave_firm_write_pkt() - Build and write a firmware packet
  *
@@ -261,6 +268,16 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 		return -EMSGSIZE;
 	}
 
+	/*
+	 * Ignore packets that are targeting program memory outisde of
+	 * app partition, since they will be ignored by the
+	 * bootloader. At the same time, we need to make sure we'll
+	 * allow zero length packet that will be sent as the last step
+	 * of firmware update
+	 */
+	if (len && ziirave_firm_addr_readonly(addr))
+		return 0;
+
 	/* Packet length */
 	packet[0] = len;
 	/* Packet address */
@@ -279,7 +296,7 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 	if (ret)
 		dev_err(&client->dev,
 		      "Failed to write firmware packet at address 0x%04x: %d\n",
-		      addr16, ret);
+		      addr, ret);
 
 	return ret;
 }
@@ -315,14 +332,12 @@ static int ziirave_firm_verify(struct watchdog_device *wdd,
 	const struct ihex_binrec *rec;
 	int i, ret;
 	u8 data[ZIIRAVE_FIRM_PKT_DATA_SIZE];
-	u16 addr;
 
 	for (rec = (void *)fw->data; rec; rec = ihex_next_binrec(rec)) {
 		const u16 len = be16_to_cpu(rec->len);
+		const u32 addr = be32_to_cpu(rec->addr);
 
-		addr = (be32_to_cpu(rec->addr) & 0xffff) >> 1;
-		if (addr < ZIIRAVE_FIRM_FLASH_MEMORY_START ||
-		    addr > ZIIRAVE_FIRM_FLASH_MEMORY_END)
+		if (ziirave_firm_addr_readonly(addr))
 			continue;
 
 		ret = ziirave_firm_set_read_addr(wdd, addr);
-- 
2.21.0

