Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E1A8A82F
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfHLUKn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:10:43 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36001 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfHLUJX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so50030450pgm.3;
        Mon, 12 Aug 2019 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v5LhoIh9pEXsuxuOal6SQWOEU6dIDuk09/Lr+q8se7U=;
        b=m3tzM5Rjigj1YHXtE5lXE4sKYSMSgS8iLNxSaKt7AGhxG0BxGDK9ZOSakPs7RxdgMO
         2VH4MAV64sIbrqBsqspOusRH6kVALTy75Yo2u1xDsLjCvxKdYJCLKZFCeZOjFOvGwkwJ
         aUyuf7uJqp20+fNgsUNWg4IZYKbdh+8Y5fxBhnb4natmsQhYmAe+APl3sGE19HXNzbmy
         nXLICEQ8th490qXxDShMh4F4XAEfhTXnLe34ehmO91GvN8vHFCnN9RvEuq1P6lEecPQH
         7gTDYkgjXErCBYkF9W3Bas26Zp2qK7jJ0xLUnabG54+wufiWMTykWnGsT1AYrzCRHUPE
         aUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v5LhoIh9pEXsuxuOal6SQWOEU6dIDuk09/Lr+q8se7U=;
        b=rKQM76pvNtEw6Ux+hAXzLi350m5zxsQcwuix2AgeotMYIiwUlxK80ylQ79GBX0ox/n
         D5xBD9O2ReZJxjl8AUNAGn1vBJO6AubKVIYCP3kLFb6EQ6BeUu+tCn4XXLg3zI/DAqUy
         PDbt2DWCuq3qqpRV8rpPOP+U0Ko1Jc9IdYFFXRTet3HuhGQZx0rr2XgQy43zrgFwv7vg
         RCujOUxC0qLfd59NAKah4J2pJfMy1UY+FHpTHhPqkKoFN9U2lCKqONw6mHg311eQGZuH
         UpeXE3TVwpNquYcFbXLBWhj7XhU6bRJzBIkHKMVRAmSVg7LbzwHnuO79cGzlsf6GBsYp
         hvlg==
X-Gm-Message-State: APjAAAV8IACRtJ4VpyWVPIuplguZIMXsaF/81/576iLpRxFniMPQ2+6x
        MMYz/LykqXwUeSxxD8GYfaENNc3M
X-Google-Smtp-Source: APXvYqxiNEuuYTdNk/z8R1E7J8+LLjiEFuarmkwBZF4IeYgn7FceZwWLd3s8ejncGYTYmTQmohIUDw==
X-Received: by 2002:a62:1c93:: with SMTP id c141mr38374483pfc.9.1565640562519;
        Mon, 12 Aug 2019 13:09:22 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:21 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/22] watchdog: ziirave_wdt: Be more verbose during firmware update
Date:   Mon, 12 Aug 2019 13:08:47 -0700
Message-Id: <20190812200906.31344-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add more error logging to ziirave_firm_upload() for diagnostics.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 8c71341a9c1c..b3e255b40209 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -335,14 +335,18 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 
 	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_JUMP_TO_BOOTLOADER, 1,
 				      false);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "Failed to jump to bootloader\n");
 		return ret;
+	}
 
 	msleep(500);
 
 	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_DOWNLOAD_START, 1, true);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "Failed to start download\n");
 		return ret;
+	}
 
 	msleep(500);
 
@@ -438,14 +442,20 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 
 	/* End download operation */
 	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_DOWNLOAD_END, 1, false);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to end firmware download: %d\n", ret);
 		return ret;
+	}
 
 	/* Reset the processor */
 	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_RESET_PROCESSOR, 1,
 				      false);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to reset the watchdog: %d\n", ret);
 		return ret;
+	}
 
 	msleep(500);
 
-- 
2.21.0

