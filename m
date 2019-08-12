Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0169D8A814
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfHLUJl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:41 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38636 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbfHLUJk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:40 -0400
Received: by mail-pg1-f194.google.com with SMTP id z14so12804930pga.5;
        Mon, 12 Aug 2019 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FmDMJc136Mrdy2NDd2zjpdm6i0On592v+7kBSJ6sTeQ=;
        b=NOensDYZhrWrJ1yAc8t/OFcxBoT+FNapnNx5u1G5mWmS119XygbjXUjAFlaDAFXhZV
         5rxRNLfsW9Si3RzD4IyjAHJDEz1ab4gVjQ2OK+umb0ItmoA2l2u+UJ3PFb6SQQTMYohG
         /0XiRVDfmt6YO0XRqyjzt9dd46R/Tv+svLQ8duDJQ1lTLER6WXNPbJTsyeGnMkvfIzig
         mtLU9sm7iRg23g9vHQB2hafatdKUgrlJgryzQedIri55FYDX86qai6XaMyz25vPfcj/f
         fDR3IRyUNGO/OGVlwiy+XrwU0pshtCDq400lQAkPZZAPmWa7wQfO+CYgBIQ0VX6nI+kd
         6UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FmDMJc136Mrdy2NDd2zjpdm6i0On592v+7kBSJ6sTeQ=;
        b=ZhEBirlNG1KPYLIDchdw5ftiop0tXyZC/dlyqYThgvMsvwjmzbffmBuKtFugv2/Na5
         Ev5lmspeTVrOLfYCUGX+v+woJ6QBoxh/djiafWaD/RLe7nENya5Hts58dYSkSMBhyl5p
         UsEsKaH5mT8R0SDJVMIFXV/XMhKW1mxa0tjE4bSkR1kQW+sUGZK3u0A5b0BNb6QdMYaT
         oWalj2tv7UPEWiQyfVct9ruuw8A5lCK06RZRfZYXmdgcQuj6FzCcItB+k1dbxggFSY/t
         eFac4XrsWNoeJ387wlm3t2AYB9NpAvqgl0ONExI+s/QOEHrnuVufi9I1FVvQ9tB/yc7x
         DQ1Q==
X-Gm-Message-State: APjAAAUnrgR1NvGV/jp+S6UuVXNgHI4LxWZR24DNIZnFH7tCdQf8No9i
        aEXeZJ3IB9r8Ge2rAOXpDPFZ5K1P
X-Google-Smtp-Source: APXvYqyYb64Ze15SAlKOdvZrc9MSzkB2laleMnJkUoX8zdWnG96d7BBoVf3jsJWlP6jdqqWifivBag==
X-Received: by 2002:a63:b64:: with SMTP id a36mr32262590pgl.215.1565640579472;
        Mon, 12 Aug 2019 13:09:39 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:38 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/22] watchdog: ziirave_wdt: Fix JUMP_TO_BOOTLOADER payload
Date:   Mon, 12 Aug 2019 13:09:00 -0700
Message-Id: <20190812200906.31344-17-andrew.smirnov@gmail.com>
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
JUMP_TO_BOOTLOADER:

S Addr Wr [A] 0x0c [A] 0x01 [A] P

using ziirave_firm_write_byte() will result in

S Addr Wr [A] 0x0c [A] 0x01 [A] 0x01 [A] P

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
 drivers/watchdog/ziirave_wdt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 0c150f3cf408..0185b9175cc0 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -72,6 +72,8 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
 #define ZIIRAVE_CMD_JUMP_TO_BOOTLOADER		0x0c
 #define ZIIRAVE_CMD_DOWNLOAD_PACKET		0x0e
 
+#define ZIIRAVE_CMD_JUMP_TO_BOOTLOADER_MAGIC	1
+
 #define ZIIRAVE_FW_VERSION_FMT	"02.%02u.%02u"
 #define ZIIRAVE_BL_VERSION_FMT	"01.%02u.%02u"
 
@@ -376,8 +378,9 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 	const struct ihex_binrec *rec;
 	int ret;
 
-	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_JUMP_TO_BOOTLOADER, 1,
-				      false);
+	ret = i2c_smbus_write_byte_data(client,
+					ZIIRAVE_CMD_JUMP_TO_BOOTLOADER,
+					ZIIRAVE_CMD_JUMP_TO_BOOTLOADER_MAGIC);
 	if (ret) {
 		dev_err(&client->dev, "Failed to jump to bootloader\n");
 		return ret;
-- 
2.21.0

