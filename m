Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6068CF3E63
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2019 04:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfKHD3P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Nov 2019 22:29:15 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41920 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfKHD3P (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Nov 2019 22:29:15 -0500
Received: by mail-pl1-f195.google.com with SMTP id d29so3085038plj.8;
        Thu, 07 Nov 2019 19:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJCUfp8ZkVX+2Q/E2RA51yP281dLV5q+tGMP1kt6Ef8=;
        b=U/LqZXmxhh8yeGmbBFtUj4NR77Lm5hbRR8wTVSBW4aTEN2ZGLfadqRN7ImQUIFSqUy
         sjK0vvA9nvsEcVG+6F7ZEUbp1oDqZVs7y3wsDjSShszolJglwr6/8GnSQGffR/vrqK+j
         Pk+tGPaNICEovggBuwTNSv8EYKs3WKMsIVm5qaPBReQe/0tp1wHMQSyO0bUvBrOKbyTp
         nzJYu8ogUNwqNBa3ZGf087wPssKKXmt16lX17ocJvg3xQ+ySNGOkmgDE0M+dT2XGtRQd
         kOcLa4MvDCWjT/kF9JBmFHW2SjQexsv/GBZfWlG25fy1fdBWyX7hn1MzYuCRfDwCxdTf
         eepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=BJCUfp8ZkVX+2Q/E2RA51yP281dLV5q+tGMP1kt6Ef8=;
        b=jn7dTdVakPtGxj5HE8P8R6i7qJlRqX9Fb735am7aJRXi/E/Bvj6RGxKh4gSi9dNemI
         2eJobquMdOnM/Wdcf1nccPxqNaazmM+jwX7DpcE/HOJ6SdkKA7a3oqYa3uyo8w8FN1hZ
         YVXIRsdTVT8qu4sLoQhDVF1DJChYW0iij0V9ZWPYbmO3jqSIeKgxOqFEPuCJrK3cXUva
         yMcsy9PehoWeGCG0yBpA+ifIp+CUOOqmq5LIu/+AwsVRKjc+zWqK8k3jAz9ImEg4Lhuk
         j++QrFC81k7dczL9lJtkxZVp7MRcvXu3K7QeEY1Uf9LFhsLCdj2yu2R2j2Fse62mNrmz
         mWAw==
X-Gm-Message-State: APjAAAX1HDWqb3Rh4kUrY6JWtclY5d+7VjKmurJntnXwRqOxUp4O9DM7
        5/8XPV0BfpbGr1Rxock6tI0sFazcsug=
X-Google-Smtp-Source: APXvYqwUYaLV2Q5lctEAObWGMEHLJbNchUOQ++A589z1HlK7NWtmUmy5xzScfJRPCcXhohywYKP0ag==
X-Received: by 2002:a17:902:bb8f:: with SMTP id m15mr4371359pls.121.1573183754056;
        Thu, 07 Nov 2019 19:29:14 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
        by smtp.gmail.com with ESMTPSA id c13sm4219194pfo.5.2019.11.07.19.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 19:29:13 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: aspeed: Fix clock behaviour for ast2600
Date:   Fri,  8 Nov 2019 13:59:05 +1030
Message-Id: <20191108032905.22463-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The ast2600 no longer uses bit 4 in the control register to indicate a
1MHz clock (It now controls weather this watchdog is reset by a SOC
reset). This means we do not want to set it. It also does not need to be
set for the ast2500, as it is read-only on that SoC.

The comment next to the clock rate selection wandered away from where it
was set, so put it back next to the register setting it's describing.

Fixes: b3528b487448 ("watchdog: aspeed: Add support for AST2600")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 4ec0906bf12c..7e00960651fa 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -258,11 +258,6 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
-	/*
-	 * The ast2400 wdt can run at PCLK, or 1MHz. The ast2500 only
-	 * runs at 1MHz. We chose to always run at 1MHz, as there's no
-	 * good reason to have a faster watchdog counter.
-	 */
 	wdt->wdd.info = &aspeed_wdt_info;
 	wdt->wdd.ops = &aspeed_wdt_ops;
 	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
@@ -278,7 +273,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		return -EINVAL;
 	config = ofdid->data;
 
-	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
+	/*
+	 * On clock rates:
+	 *  - ast2400 wdt can run at PCLK, or 1MHz
+	 *  - ast2500 only runs at 1MHz, hard coding bit 4 to 1
+	 *  - ast2600 always runs at 1MHz
+	 *
+	 * Set the ast2400 to run at 1MHz as it simplifies the driver.
+	 */
+	if (of_device_is_compatible(np, "aspeed,ast2400-wdt"))
+		wdt->ctrl = WDT_CTRL_1MHZ_CLK;
 
 	/*
 	 * Control reset on a per-device basis to ensure the
-- 
2.24.0.rc1

