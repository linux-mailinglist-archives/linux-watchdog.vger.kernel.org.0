Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86C5C8A80C
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfHLUJc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43238 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbfHLUJb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id r26so14085547pgl.10;
        Mon, 12 Aug 2019 13:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qfkrKfTu6aSEYz9nb94lbej06C22MD5/E3UVVvaQRvw=;
        b=X7ynJwHXLWXnsclNvpp6MSr3yn7hpr5XJvNYL3PdsVgBrHRLT90xekoaOw7u+ZC9KP
         cU3gP5+3HxV+brOntvuMx4s5TMBrhc6Mzq9szXdql7exFHJUjAszfQuXSMBsccbleBr0
         lTkIfH/E361NiT9KtzSuFdYFdV3kKNNsRrWxzAolPLVD3yaFR0QoEMBYyKez/BxAgx29
         mZt0aKr4XVb1K/+odxUhOATHDU7SYcLp5oRsxR4xzZ50oxIFIjUZPux750OUUTcjQ3fo
         X+qElcdV7b0KCYdZtdSXGtmJqsZRwLAntt90PDwWBekLYk+ZsUYQOxgbLySAMGovUvzg
         xPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qfkrKfTu6aSEYz9nb94lbej06C22MD5/E3UVVvaQRvw=;
        b=hmFY9GYU8F3lzC/SJIuDVMp5Vv0ykhs93QFwpB5gx8r9fM9y8ovw7XuknIFyTMo6gj
         F02FbrakETQqFTJTc0WRJG0jAgKpsrwOZEQU0tsSirtnxczhSwQsHp3+MGFJmCOg8G47
         Z2Va/dGCAV1f4FMlNpphaV9kZY7QfAQehHuMy9XMYNZgOCsihmVzwM011IOP3H48rrUC
         J4ty8wSIg32FMDP4MRPN1QBWjHXvje8DAeq2d0x1eCQ4LTllO9EA7J2NiONPe5QqfgZ6
         XSzPuujDoCrEG9cJElzey/6FHRgDxEG3rZiGe9hQWv9q3lgQ0ssl90f/yhc2ud8kIOAE
         l/xQ==
X-Gm-Message-State: APjAAAVHgzmI4SMNmd+jhs4DpnckQsNXkOS6bTDm+rNMnGPVimtDNChg
        tPhMyLisIw1M2hT5dniGYsSSger1
X-Google-Smtp-Source: APXvYqzS8KZrfyTODXNtdQmW4FVzEWk/QoBBIpScB769gk4FK+UcYCi9i7Gnk9op527ftr07QnSpiw==
X-Received: by 2002:a65:458d:: with SMTP id o13mr31127428pgq.34.1565640570136;
        Mon, 12 Aug 2019 13:09:30 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:29 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/22] watchdog: ziirave_wdt: Fix incorrect use of ARRAY_SIZE
Date:   Mon, 12 Aug 2019 13:08:53 -0700
Message-Id: <20190812200906.31344-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Both memset() and ziirave_firm_write_block_data() expect length in
bytes as an argument, not a number of elements in array. It just
happens that in this particular case both values are equal. Modify the
code to use sizeof() instead.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 19da0910c2d1..e0f55cbdc603 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -203,7 +203,7 @@ static int ziirave_firm_set_read_addr(struct watchdog_device *wdd, u16 addr)
 
 	return i2c_smbus_write_block_data(client,
 					  ZIIRAVE_CMD_DOWNLOAD_SET_READ_ADDR,
-					  ARRAY_SIZE(address), address);
+					  sizeof(address), address);
 }
 
 static int ziirave_firm_write_block_data(struct watchdog_device *wdd,
@@ -260,7 +260,7 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 		return -EMSGSIZE;
 	}
 
-	memset(packet, 0, ARRAY_SIZE(packet));
+	memset(packet, 0, sizeof(packet));
 
 	/* Packet length */
 	packet[0] = len;
@@ -276,7 +276,7 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 	packet[ZIIRAVE_FIRM_PKT_TOTAL_SIZE - 1] = checksum;
 
 	ret = ziirave_firm_write_block_data(wdd, ZIIRAVE_CMD_DOWNLOAD_PACKET,
-					    ARRAY_SIZE(packet), packet, true);
+					    sizeof(packet), packet, true);
 	if (ret)
 		dev_err(&client->dev,
 		      "Failed to write firmware packet at address 0x%04x: %d\n",
-- 
2.21.0

