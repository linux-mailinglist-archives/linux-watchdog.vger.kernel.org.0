Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34578A818
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfHLUJo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:44 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44661 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbfHLUJn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:43 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so48269338plr.11;
        Mon, 12 Aug 2019 13:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GoHqMWoeBEMrIjbLSbTR7or87F8V770ooMxvzxudxeo=;
        b=pDEMCJ+gUgFE6FzktAdhoi91phyuBXIkv1Op7UAi8GjHzDwM18bQeFm1NnaojggXP8
         5cl5Alp2+X1Yiob1XMqYsHJeNm1e8j2rWhvGZ4k4mTJuesue9Xozkm/21rY3EwOfBk9r
         rhLohCGdss9wFB0oy5sxYFDLuC9GxICOCViBm1RylbuhL/8tQPLKVfdWKgLcDGdyBAI2
         9+emwTAtK/QUr1AWhPTXMWug00/kuktSAM2ZWl0Te++LZi9K/UBvd00OfbOSBTSbuia9
         kys5YM8ku7PCqC91Ka+liQu8QI6sMM3XZFZqEJYvE3QsOeNoP1H4PwMt/3TcRGAq03A2
         K6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GoHqMWoeBEMrIjbLSbTR7or87F8V770ooMxvzxudxeo=;
        b=dn8WL9qeoXJFTJtFrMxZi20B0mB0qIBgPgICLlLqDOEnVQl5QKisGwSun99nltrHh6
         SVJW2zKhStFxRgICoZmCAZk+xylzrkBVkGXio6X8PGI9yN6QD4LJ4UjxQvWYlN3dc7D/
         7uzsHC7XLIdm49/uByqB3NRrJU/4SrvkuvKNANyEazPsEl3RNmLmErmvriqK9PRrsc+A
         2qL1dY478uEiOG8y/A773cs/5J2i8WKqqknra9ta1daRlM/IaI7RYf4McsOUQ+KrjPVm
         zwn+z2h9ZdWgZYUAElbn4mlCEcOOOfM5LwHkxneZqoWEO73cMr6XNFViHZZGCPRgoxwi
         Z+sw==
X-Gm-Message-State: APjAAAX+4W0eF9kJGbQOApVMMyiXcR+Ag8G/Rag2K3nytAJb6crynKsd
        R59dIL5P0F2yM8TPH88vBljBYvvT
X-Google-Smtp-Source: APXvYqyaZ3b7dnxh52ixz5DMKHMYp0ySfvRh5bgox/pqOQR0u/zyebMTpeAe//iijAfGSxVWrJ3d7w==
X-Received: by 2002:a17:902:9a84:: with SMTP id w4mr33492746plp.160.1565640581949;
        Mon, 12 Aug 2019 13:09:41 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:41 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/22] watchdog: ziirave_wdt: Fix RESET_PROCESSOR payload
Date:   Mon, 12 Aug 2019 13:09:02 -0700
Message-Id: <20190812200906.31344-19-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Bootloader firmware expects the following traffic for
RESET_PROCESSOR:

S Addr Wr [A] 0x0b [A] 0x01 [A] P

using ziirave_firm_write_byte() will result in

S Addr Wr [A] 0x0b [A] 0x01 [A] 0x01 [A] P

which happens to work because firmware will ignore any extra bytes and
expected magic value matches byte count sent by
i2c_smbus_write_block_data(). Fix this by converting the code to use
i2c_smbus_write_byte_data() instead.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index a598780d73d3..92df27350e41 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -73,6 +73,7 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
 #define ZIIRAVE_CMD_DOWNLOAD_PACKET		0x0e
 
 #define ZIIRAVE_CMD_JUMP_TO_BOOTLOADER_MAGIC	1
+#define ZIIRAVE_CMD_RESET_PROCESSOR_MAGIC	1
 
 #define ZIIRAVE_FW_VERSION_FMT	"02.%02u.%02u"
 #define ZIIRAVE_BL_VERSION_FMT	"01.%02u.%02u"
@@ -433,8 +434,9 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 	}
 
 	/* Reset the processor */
-	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_RESET_PROCESSOR, 1,
-				      false);
+	ret = i2c_smbus_write_byte_data(client,
+					ZIIRAVE_CMD_RESET_PROCESSOR,
+					ZIIRAVE_CMD_RESET_PROCESSOR_MAGIC);
 	if (ret) {
 		dev_err(&client->dev,
 			"Failed to reset the watchdog: %d\n", ret);
-- 
2.21.0

