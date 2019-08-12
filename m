Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438AB8A810
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbfHLUJi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:38 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33791 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727442AbfHLUJg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id n190so9224057pgn.0;
        Mon, 12 Aug 2019 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Al/DgRidHVqo/g9YdSiEeqYKH6WNvd2YSDNAidLE1ZA=;
        b=nPY4ul+wXuULh52bDJnhEiH9sAiZvMb5ajFLmzcI1SOrnt0MlbILBY5UlE8F8l4Pkj
         1/WFaz+82IrsMuFa2jkrfwUqcBpYZxrGOmg64k6soAh00ztHlUh1BkfQ/AlUrOrU7ul+
         fie1PCYMslcj26JD9I9ayC2IX9+02aoKqVHQMZFvQfLaDQbgJKCtiJHf4BJVKGwAE99/
         X0JPsyRSxb1zMeljN6jjmq4iCArrekt4CzcmNLVGh/RyJzcUs8JjUVzB+gQD+FV6JMhv
         kjSl9Bw9PdInwJMYO8ZTdGUyhPTDx66ooXlFegSFuXLEZSgfEZR8jXcYTFQF2liW12Te
         Wrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Al/DgRidHVqo/g9YdSiEeqYKH6WNvd2YSDNAidLE1ZA=;
        b=IWYjyh6y2wIVH2i0fUiEVicTtigLhwTfM8dcEBQhFKlhyxLwsquUFfE7LAANIxfKwN
         Ckp3cSYeaAoOG6Cr5W9UcsOQ29uhlyHi76KV/RViw45Crw2B9olkYKHD5ARhs0I0GZm0
         jD2VdPnlI5ziLkasny/phoWjf8seJBP0BlcPsvKGby7enCuUVIuGgydqvHjpzHBbqwTq
         TS9ERJNTy5huxaPsxmH/zGQhBOD+xXmy2DQXEmPuJfy5xnglHbNMIVWUeCyZ10tvuTox
         iD9XFdi45atDljyyjDS8nnE0k1QxSA6kutGhl+/nGp3NN4POagPkTGtpp6ZM8yDmRZrW
         Ir+Q==
X-Gm-Message-State: APjAAAULfjXRVimfvYkpT71tZarAnW8mlWOs3eLR7a9oGQclvm1bf/HU
        LQbY+Xn/v5Bm1hQyLYDtRkRU0MVv
X-Google-Smtp-Source: APXvYqwNWHDTLHBZCyyK/C6H2ACoxORIKQr5blSl8h7eNNs9y3QLOqiTZIrF52txfoftssM0xnLdQg==
X-Received: by 2002:a63:2887:: with SMTP id o129mr25132359pgo.179.1565640575365;
        Mon, 12 Aug 2019 13:09:35 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:34 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/22] watchdog: ziirave_wdt: Don't read out more than 'len' firmware bytes
Date:   Mon, 12 Aug 2019 13:08:57 -0700
Message-Id: <20190812200906.31344-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

We only compare first 'len' bytes of read firmware, so we don't need
to read more that that.

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
index 4b95467bf239..f05095b08016 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -318,6 +318,8 @@ static int ziirave_firm_verify(struct watchdog_device *wdd,
 	u16 addr;
 
 	for (rec = (void *)fw->data; rec; rec = ihex_next_binrec(rec)) {
+		const u16 len = be16_to_cpu(rec->len);
+
 		addr = (be32_to_cpu(rec->addr) & 0xffff) >> 1;
 		if (addr < ZIIRAVE_FIRM_FLASH_MEMORY_START ||
 		    addr > ZIIRAVE_FIRM_FLASH_MEMORY_END)
@@ -331,7 +333,7 @@ static int ziirave_firm_verify(struct watchdog_device *wdd,
 			return ret;
 		}
 
-		for (i = 0; i < ARRAY_SIZE(data); i++) {
+		for (i = 0; i < len; i++) {
 			ret = i2c_smbus_read_byte_data(client,
 						ZIIRAVE_CMD_DOWNLOAD_READ_BYTE);
 			if (ret < 0) {
@@ -342,7 +344,7 @@ static int ziirave_firm_verify(struct watchdog_device *wdd,
 			data[i] = ret;
 		}
 
-		if (memcmp(data, rec->data, be16_to_cpu(rec->len))) {
+		if (memcmp(data, rec->data, len)) {
 			dev_err(&client->dev,
 				"Firmware mismatch at address 0x%04x\n", addr);
 			return -EINVAL;
-- 
2.21.0

