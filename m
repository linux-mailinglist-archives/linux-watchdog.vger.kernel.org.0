Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2B7A8A806
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfHLUJ0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:26 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43937 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbfHLUJY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:24 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so41296708pld.10;
        Mon, 12 Aug 2019 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FAkiHbs5735QnUwhI1DDee38S7XbX5mLL8p2xUkayFw=;
        b=SZpvUHcveQfGkXaOtrVybbHvnWzzlVW4o160Sr6vOMxVeMFvUXR6JAroTAfrrSBgiH
         k6bNrqEBT4Mc80xV+/nvoHDyWzt3pS1hbTJ+qv6nciV3ivhxYFUAtTwetCMeT6jMS7sc
         HS7su40a5Yjbs40OtSoiyVLvaWLssfM/dTDw7chLhopknhyHq7PGojGtaVy/u81nQUtg
         I/ZLwE21VU5keCgbXeZyJhDjyDTKggi9itx2W+W0P0A82mr/ryNWwE/d5jYuKo0cy45b
         YHZCi05qWvHgJf8FSYwbqGRaEkuywlMwGCdaiWZ03jLXFPQDtZFe3AuXKfZNPiXsqbuP
         TpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FAkiHbs5735QnUwhI1DDee38S7XbX5mLL8p2xUkayFw=;
        b=tBwEQgBtL1kiAtvkSLJpzroCdG/GUq3Ss/Cd2dzfNXYlVV55gMUWPMVQU+znNVCfyd
         9QNQCDyW23pw9B207YYyGAYkHUsbfdtdk+zf5ya8+gPaBXQKbsvHTT34MmPnVs3G5Vp4
         yskFudiHr8NWeEeqj7Z0tBm5QZlCF/EHXmR8L8AwSQrozQFg8Nu6dofRn5du/nMAyp2+
         iTgYZSGDgv1HBZByr1hJ3AQYWRI0IqR5D333fgXlfHnjaGhZ5CEMbo5a3LimE1S8XKpC
         zr/qfTqvDAM08Q9YU7611dFffQ98ovXzGELPmLb1cc/LcfGn2zphUveVmokmGca97x0g
         8w6A==
X-Gm-Message-State: APjAAAXutylM1xFUSjX3OUanMZylzakSve7qUTGYOPLEKHMGaWpBNKi+
        in68ry1Cg5/PzqwOsRobZ1kD9EmF
X-Google-Smtp-Source: APXvYqxq7rPFBorjef8bA9idco6czMcatBnBbTid+/C+psuskRBrCxEhNfhAQe1CeynF3R5sLRD/zQ==
X-Received: by 2002:a17:902:2987:: with SMTP id h7mr34109726plb.37.1565640563524;
        Mon, 12 Aug 2019 13:09:23 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:22 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/22] watchdog: ziirave_wdt: Don't bail out on unexpected timeout value
Date:   Mon, 12 Aug 2019 13:08:48 -0700
Message-Id: <20190812200906.31344-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Reprogramming bootloader on watchdog MCU will result in reported
default timeout value of "0". That in turn will be unnecessarily
rejected by the driver as invalid device (-ENODEV). Simplify probe to
read stored timeout value, set it to a sane default if it is bogus,
and then program that value unconditionally.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index b3e255b40209..a11b92383c5f 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -23,6 +23,7 @@
 
 #define ZIIRAVE_TIMEOUT_MIN	3
 #define ZIIRAVE_TIMEOUT_MAX	255
+#define ZIIRAVE_TIMEOUT_DEFAULT	30
 
 #define ZIIRAVE_PING_VALUE	0x0
 
@@ -673,22 +674,21 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 			return val;
 		}
 
-		if (val < ZIIRAVE_TIMEOUT_MIN)
-			return -ENODEV;
+		if (val > ZIIRAVE_TIMEOUT_MAX ||
+		    val < ZIIRAVE_TIMEOUT_MIN)
+			val = ZIIRAVE_TIMEOUT_DEFAULT;
 
 		w_priv->wdd.timeout = val;
-	} else {
-		ret = ziirave_wdt_set_timeout(&w_priv->wdd,
-					      w_priv->wdd.timeout);
-		if (ret) {
-			dev_err(&client->dev, "Failed to set timeout\n");
-			return ret;
-		}
+	}
 
-		dev_info(&client->dev, "Timeout set to %ds\n",
-			 w_priv->wdd.timeout);
+	ret = ziirave_wdt_set_timeout(&w_priv->wdd, w_priv->wdd.timeout);
+	if (ret) {
+		dev_err(&client->dev, "Failed to set timeout\n");
+		return ret;
 	}
 
+	dev_info(&client->dev, "Timeout set to %ds\n", w_priv->wdd.timeout);
+
 	watchdog_set_nowayout(&w_priv->wdd, nowayout);
 
 	i2c_set_clientdata(client, w_priv);
-- 
2.21.0

