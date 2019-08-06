Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB5982D53
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2019 10:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbfHFIBh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Aug 2019 04:01:37 -0400
Received: from gateway23.websitewelcome.com ([192.185.49.60]:15711 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727259AbfHFIBg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Aug 2019 04:01:36 -0400
X-Greylist: delayed 1298 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Aug 2019 04:01:36 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 91B6C963C
        for <linux-watchdog@vger.kernel.org>; Tue,  6 Aug 2019 02:39:57 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id uu4bhIYeSdnCeuu4bhkTXD; Tue, 06 Aug 2019 02:39:57 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rMb8EhNDgvwZDW23U2bwpQR78TVB+QUSBphTIsmLUOI=; b=mHhsGUjfGPriss/JpUPegNlxUH
        n2II9642+qB74ma4RwxzZEzM0IMpuvKx/eZ1nyGmgz2MXfs9gKSnKAgcEWTWWOJyGe2Ox+lvrMi53
        ML/PoaRIAemsnJX6sf/0BYz69MRjPPHa9eCfjYSlccrSsf3QY91MoR0XO/cz3AtSDTyEVhtIEmGUn
        f2WAu09FffWCc5POAIqmzSdWW0g59UBKMJAGooaM+UHk+ahHdLQF13LGGjN9R4qzpvI3TORh0wcqJ
        Os3l6z1mNn0BzmraM0637kEZfl8FUvnbx6LU36i0pBPasArp8PCTxeLZgcLmogE1xsUz2eC2h4WDR
        M2us38ww==;
Received: from [187.192.11.120] (port=43448 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1huu4a-000RP0-6J; Tue, 06 Aug 2019 02:39:56 -0500
Date:   Tue, 6 Aug 2019 02:39:53 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] watchdog: jz4740: Fix unused variable warning in
 jz4740_wdt_probe
Message-ID: <20190806073953.GA13685@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1huu4a-000RP0-6J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:43448
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix the following warning (Building: ci20_defconfig mips):

drivers/watchdog/jz4740_wdt.c: In function ‘jz4740_wdt_probe’:
drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable ‘ret’ [-Wunused-variable]
  int ret;
      ^~~
Fixes: 9ee644c9326c ("watchdog: jz4740_wdt: drop warning after registering device")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/watchdog/jz4740_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index d4a90916dd38..c6052ae54f32 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -162,7 +162,6 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct jz4740_wdt_drvdata *drvdata;
 	struct watchdog_device *jz4740_wdt;
-	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(struct jz4740_wdt_drvdata),
 			       GFP_KERNEL);
-- 
2.22.0

