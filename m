Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 652098A80E
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfHLUJe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:34 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38535 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbfHLUJe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:34 -0400
Received: by mail-pf1-f194.google.com with SMTP id o70so4903238pfg.5;
        Mon, 12 Aug 2019 13:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cfi8eGhAZL6laytKQF8w9HsoqEDugdT9/babz9jDHkc=;
        b=jvOueJScWyTv5hPktqL67tKU+G+nHHbssgO2NxwnM3Phte4m35xeEEbWvijGUANTaA
         X2CtR0mgFZP12VSVBGlwlApKm/S0hWKajypQUyNbgbNpbXRxBYq1f/MNEkL5w6rgEDxs
         gZy7qNMtNSEzV+WeknGAQ44Xh6/QxG5owPywb1rD3JzQu2nogCW4kUVua7viuQgEiVC2
         zcQKqMk6WxmlEqbe1odWSHoQr5xjt0oFsPVWLCXTMcXILQEPDKVmKk3mMaAi1wbdV4HP
         dznNxEws1L9mN/NBdNAdqxe9hLw4qkbci5rir4ImWjqce9C3+lPAClfzcGxixBcFF1HF
         ralA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cfi8eGhAZL6laytKQF8w9HsoqEDugdT9/babz9jDHkc=;
        b=CRrTd7zAOnEHgJWM6dYcqxN9nE7lPxXby+272ImIFQgi/VAOkwAdF1nIyK2Ny/81AH
         auhNAf1ILMOiHpqSb9DO2snPHpROhpiFcqYbmFa/26U9Ac9EvlFVXeI4u2OLQe3OmmDp
         gjz510+08fhfSGDMuA8PF+wHGEKPr9FnbU7BgqtSOdAQjaNeFSA6rcT+52Ps/8DMQW7E
         4ozUYnHyRRmDshpkHPc8eAsEFX3lErbdqRvNfvHPdbRddMu9FjvvqMNiKez0Lq+X425p
         yjP1u4uKBScw6b0/Yx5ZNwnknVvBrz5wclt5pMgNRR00bdpYAY5dj+UKjY5nTU9AF2B1
         jYyA==
X-Gm-Message-State: APjAAAVvqiCncxPziuFcW+DPgb6hEBoFoXGl0Y1kM7J+p2l8p+1h7aL3
        o3Mj0/HSnPDsdyEpJo//lnemSSqM
X-Google-Smtp-Source: APXvYqwKhD3zWqzaQMN4Z79u0WX4qY6wPt62R+zZK08bzjGifFhDRr8j8LzbZzVZe/F6zDNt6A6pyg==
X-Received: by 2002:aa7:8585:: with SMTP id w5mr3468136pfn.1.1565640572742;
        Mon, 12 Aug 2019 13:09:32 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:31 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/22] watchdog: ziirave_wdt: Make use of put_unaligned_le16
Date:   Mon, 12 Aug 2019 13:08:55 -0700
Message-Id: <20190812200906.31344-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Instead of doing this explicitly use put_unaligned_le16() to place
16-bit address value into command payload.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 69694f2836d7..38cf3ca329d7 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -21,6 +21,8 @@
 #include <linux/version.h>
 #include <linux/watchdog.h>
 
+#include <asm/unaligned.h>
+
 #define ZIIRAVE_TIMEOUT_MIN	3
 #define ZIIRAVE_TIMEOUT_MAX	255
 #define ZIIRAVE_TIMEOUT_DEFAULT	30
@@ -198,8 +200,7 @@ static int ziirave_firm_set_read_addr(struct watchdog_device *wdd, u16 addr)
 	struct i2c_client *client = to_i2c_client(wdd->parent);
 	u8 address[2];
 
-	address[0] = addr & 0xff;
-	address[1] = (addr >> 8) & 0xff;
+	put_unaligned_le16(addr, address);
 
 	return i2c_smbus_write_block_data(client,
 					  ZIIRAVE_CMD_DOWNLOAD_SET_READ_ADDR,
@@ -263,8 +264,7 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 	/* Packet length */
 	packet[0] = len;
 	/* Packet address */
-	packet[1] = addr16 & 0xff;
-	packet[2] = (addr16 & 0xff00) >> 8;
+	put_unaligned_le16(addr16, packet + 1);
 
 	memcpy(packet + 3, data, len);
 	memset(packet + 3 + len, 0, ZIIRAVE_FIRM_PKT_DATA_SIZE - len);
-- 
2.21.0

