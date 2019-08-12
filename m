Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4EB8A820
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfHLUJy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:54 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37942 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfHLUJr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:47 -0400
Received: by mail-pl1-f195.google.com with SMTP id m12so9677874plt.5;
        Mon, 12 Aug 2019 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rSn4tuKZh7KjRckQWxe8eHwjIPe1tvzNwIGDPWFexuA=;
        b=L85U5s9VnXBzPRt7PgMVfUXCp3mUWeCz2zIrBHDPgy2M3a5LA7zC548ijnAqRUvFMi
         B3QeuoZVIRyryI/cj7631lBmjkirVO6hsqZNDgtmYVGOr9k7JTDPEou2wifbSQjUoap+
         xXq7Y0NEPJb7i4Y5GSFFwzs9ia/fUIDv1HAKEmpm/emMwWaFa2Yro24/SHjAiYAQs36i
         iak/u2OedUbaT8jZV5bpsNnCUKP9TLxEBdJTRzdYweF8SFQFcJ3JZHKit/tmlT9BVZ6c
         1daQLqR5uEhDuCeU1uwzs/sgTGKsXyfsSBWb1Cu6ztz9n6fdDMau9GFpNxK8ABFCzywT
         PJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rSn4tuKZh7KjRckQWxe8eHwjIPe1tvzNwIGDPWFexuA=;
        b=lWvPZuOdKwl7gePZzC4tjKbGk3S9lq0qks/Ut+/bnxvucoqLO7vLVhIqWsnaSA0vTD
         Cq/UR4Xe8j/aOLbI/kwSfjRlxtCIa4zze5mDYZXMMVkrqqoNvBjoYX5OAYP8I1qw8dcA
         24HpVjD41dSXOhPZpwoJS1zB/2lsLzjahAUoVFn3MeLNSTkTf+Gl1imZGeD7mwaePvkj
         s9WsSH0u8y0a+WKy9XgPqpOdV6Ve6qaOuDgN9XnIbDJA+mXjgD/D0ac5Rpq/NlCvKmIP
         WQNke2lD+kLE9+wWa1o2vsC1RQDjvnGD1YM9FNhxsWXlXcVP7NtkT+tHbYCP7CL278kT
         Xbxw==
X-Gm-Message-State: APjAAAUvOrxEtwfGX+95ucTPmCm1ez9hTFOjyZzxrm0jdF6AQapM64qB
        4rER33AlIskJndZxWtvNr1nSoMl7
X-Google-Smtp-Source: APXvYqxgLPHrsjbeN3KKiZy1HL5N9Jye7eNgNXlR2sJEh5MyAo6nY8jKCeWFYGX34RD1zRgDOIFTdA==
X-Received: by 2002:a17:902:b202:: with SMTP id t2mr6440736plr.303.1565640586869;
        Mon, 12 Aug 2019 13:09:46 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:46 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/22] watchdog: ziirave_wdt: Update checked I2C functionality mask
Date:   Mon, 12 Aug 2019 13:09:06 -0700
Message-Id: <20190812200906.31344-23-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Update checked I2C functionality mask to reflect all of the SMBus
primitives used by this driver.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 48278034cda6..4a363a8b2d20 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -602,7 +602,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 	struct ziirave_wdt_data *w_priv;
 	int val;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_BYTE |
+				     I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WRITE_BLOCK_DATA))
 		return -ENODEV;
 
 	w_priv = devm_kzalloc(&client->dev, sizeof(*w_priv), GFP_KERNEL);
-- 
2.21.0

