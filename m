Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D487E8A816
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbfHLUJm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42784 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbfHLUJl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id t132so50030679pgb.9;
        Mon, 12 Aug 2019 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nE0TrNNGtWudMia7gsErH53LkjK1StyH8J2lmMfA2xM=;
        b=c3BZKJAbmlHupqnBU0pxDFNcsXsA2PpQkQVQsSrvPZ+FJm3rvvEj5RdJoWmBQeSoHS
         TFhQuIvRYuogfbqAdG89OlP58zOHv3AaFrymDG9Eih99geEu0OGv7dOfvgT+uWXYWHky
         GE7H5aZ+a+yQFsE+DHAmMsBMgwkp1uykC1UPIC+noHhhmUNnpA4yIJfSU7ScejCTUvnT
         /jqgDJf/lU0N9qSKMgZW/8AXQtVNvezhZa2KHQ4AvtWHwR1w2SYXrn+uxUc6qfyVx0Kx
         1RywUCd8rxsUyvPMStwCZjblPiLJwGCLCwLEM2DaSqw0elaVeKBImrPm6dtuN4xPHNdF
         lePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nE0TrNNGtWudMia7gsErH53LkjK1StyH8J2lmMfA2xM=;
        b=sUjzFr25X49JK3woSO19ueHLQBme4PIrf9jDpench8Ub95WX3Xl8LHCHpVr8nI2m5q
         EfZMpjFeAJZwGZEhcjKqPa1YoP+aSU8IIUCSd81lW/awe4DchN5lF2OikVKsgMkbMECt
         dF8A/dmH4xrYG8YQBHN1a6hsKjXWenHC8ZvYGYOEX7SoZnRhGEXIJxrRNtny1+ZFiO8W
         7IpaQs0smfBfhsKj5ae+Mm68K7Xa3Y7rhFulGhpoKQg8JT6ycqdWcguxe1jKTWoZVZRR
         TUJ4zVFxe+i3PnJQ0GfOyaYntjJDabjKzNEGcrBlT+oUk0MEBz2zNpG8cabjeHqho3W7
         /R5g==
X-Gm-Message-State: APjAAAXFZqGxt/htvkGI5aoZ/5tUz8c7Wk2d/+UH4egCLEyF/3sogHc1
        r8vFxt4uP6a/p354YYQOLV58OYeT
X-Google-Smtp-Source: APXvYqyeTYWCza9cI+EcxkmdflLPb8DUCRv3Gr0Q7o9JbVRE2n287hDcgutXuYO65batgbp8XtMSBA==
X-Received: by 2002:a63:d30f:: with SMTP id b15mr31187152pgg.341.1565640580464;
        Mon, 12 Aug 2019 13:09:40 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:39 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/22] watchdog: ziirave_wdt: Fix DOWNLOAD_END payload
Date:   Mon, 12 Aug 2019 13:09:01 -0700
Message-Id: <20190812200906.31344-18-andrew.smirnov@gmail.com>
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

S Addr Wr [A] 0x11 [A] P

using ziirave_firm_write_byte() will result in

S Addr Wr [A] 0x11 [A] 0x01 [A] 0x01 [A] P

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
 drivers/watchdog/ziirave_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 0185b9175cc0..a598780d73d3 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -425,7 +425,7 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 	}
 
 	/* End download operation */
-	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_DOWNLOAD_END, 1, false);
+	ret = i2c_smbus_write_byte(client, ZIIRAVE_CMD_DOWNLOAD_END);
 	if (ret) {
 		dev_err(&client->dev,
 			"Failed to end firmware download: %d\n", ret);
-- 
2.21.0

