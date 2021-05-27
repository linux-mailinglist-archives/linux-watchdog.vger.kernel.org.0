Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439B0392B51
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 12:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236031AbhE0KDX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 06:03:23 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:50144 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbhE0KDX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 06:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1622109710; x=1653645710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jAo598UZNKi+UDMf4kevfiZHzfajlsdU+s2V++1FMJM=;
  b=jg7pkd/TE6AnRKpjCepu8i9JKXDUmQWOpVYEc3QlmRiWg3tZTI1rvMOK
   DEltWCYqhSC0anjGhdSnY//S1mclE5+EdycTWQfbVcJOpYNRC2+D6yGMT
   0px4idF1ne980kW/epYmJzQ/+gbGWc04VAuW4dcGneu8iG7uSk9Gk8jIe
   pE8OK7U88ErRia2U50+EDObCgPUIUl+O5uQ+gZB5ELVWmgH7XoctdG0gb
   WXjk84c7/9aeFHy7dXrvniF8VFmQznLqMHBiUBrDNfRRFA762efWp5Ej8
   Lo83En2vqOTHs7ge4ASPIuFIq04CeEpVgVrAa8Bw8XOWJGss7DiRkiONh
   A==;
IronPort-SDR: AC7yltpeuijXrHzTqhXoh6RV0Bfrk6pjN1QbwTXo0+M50hmVbbtrpZ6YnHhgR/yU4siFvZtEHO
 4m5nTAHetJxFvYpzjyzWtcF/sTrVpyyxHmo6fUBumYFPb2jBrVkrHqfnHFNR9i3GoiotPAAIHb
 pk2ATntMZfifDRmI9IaxBpzpRcaWf6iAXCbju85vEA7yrtLrywIvUqtz46GXsmiKoD9/qoHCoO
 ZA5QY33G1Tou+CVKPXL+muIWJgC3A2zeK8yT4LajY8kgj8xHhRxHB0aljry3IbatB2oxhUFahK
 9Dk=
X-IronPort-AV: E=Sophos;i="5.82,334,1613458800"; 
   d="scan'208";a="123151626"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2021 03:01:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 03:01:49 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 27 May 2021 03:01:46 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>
CC:     <nicolas.ferre@microchip.com>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 2/3] watchdog: sama5d4_wdt: add support for sama7g5-wdt
Date:   Thu, 27 May 2021 13:01:19 +0300
Message-ID: <20210527100120.266796-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527100120.266796-1-eugen.hristev@microchip.com>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add support for compatible sama7g5-wdt.
The sama7g5 wdt is the same hardware block as on sam9x60.
Adapt the driver to use the sam9x60/sama7g5 variant if either
of the two compatibles are selected (sam9x60-wdt/sama7g5-wdt).

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/watchdog/sama5d4_wdt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index e5d11d6a2600..ec20ad4e534f 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -268,8 +268,10 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 	wdd->min_timeout = MIN_WDT_TIMEOUT;
 	wdd->max_timeout = MAX_WDT_TIMEOUT;
 	wdt->last_ping = jiffies;
-	wdt->sam9x60_support = of_device_is_compatible(dev->of_node,
-						       "microchip,sam9x60-wdt");
+
+	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
+	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
+		wdt->sam9x60_support = true;
 
 	watchdog_set_drvdata(wdd, wdt);
 
@@ -329,6 +331,10 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
 	{
 		.compatible = "microchip,sam9x60-wdt",
 	},
+	{
+		.compatible = "microchip,sama7g5-wdt",
+	},
+
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
-- 
2.25.1

