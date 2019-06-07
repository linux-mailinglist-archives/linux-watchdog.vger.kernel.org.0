Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C32391E5
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 18:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbfFGQYx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 12:24:53 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:59224 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730650AbfFGQYq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 12:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559924685; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JisP2PtItx8pScbwBo53KANuJqUu1hKZqyOryWZyMGA=;
        b=VQlDpqQ9K3jv3YA1LaD1EgI19I3iajVPaHNAGQR2MWm1bgaxoLREmzMXmkT+MgQXgdcEUs
        uoHk7Qcowa50LLtTUAJHiEoYU/+IR7zV+idqx92M3HCnlkTUURMLMJnRSFmRwFfwSIEHeY
        QN2/c38n7QmYW5Wm5KNVsz9+rxgT7Q0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 4/4] watchdog: jz4740: Make probe function __init_or_module
Date:   Fri,  7 Jun 2019 18:24:29 +0200
Message-Id: <20190607162429.17915-5-paul@crapouillou.net>
In-Reply-To: <20190607162429.17915-1-paul@crapouillou.net>
References: <20190607162429.17915-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This allows the probe function to be dropped after the kernel finished
its initialization, in the case where the driver was not compiled as a
module.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch

 drivers/watchdog/jz4740_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index 7519d80c5d05..2061788c1939 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -157,7 +157,7 @@ static const struct of_device_id jz4740_wdt_of_matches[] = {
 MODULE_DEVICE_TABLE(of, jz4740_wdt_of_matches);
 #endif
 
-static int jz4740_wdt_probe(struct platform_device *pdev)
+static int __init_or_module jz4740_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz4740_wdt_drvdata *drvdata;
-- 
2.21.0.593.g511ec345e18

