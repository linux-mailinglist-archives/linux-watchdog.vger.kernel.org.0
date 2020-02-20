Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38D08165376
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2020 01:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgBTAUt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Feb 2020 19:20:49 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45522 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgBTAUt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Feb 2020 19:20:49 -0500
Received: by mail-pl1-f196.google.com with SMTP id b22so780430pls.12
        for <linux-watchdog@vger.kernel.org>; Wed, 19 Feb 2020 16:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jTaHDD+09W3xPLB5zxqrZcfKt5xjlZG4YPPLRu8eAo=;
        b=b1XelOjvj05D0Bwh2OQjpR9HZva2lUVZkRpxeC9Q98tZq8EZ4K9eDHdlUPwmiOOop8
         QkMHi2N81LsFtlBSeEFLuFw3VZUe+PpiUS4er8PSCtS5Tt8WBr3C2D2/RiSBm/RQ/aId
         920+6K4rD3kfJybAs0JO6Bag2lo7zANivnhIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jTaHDD+09W3xPLB5zxqrZcfKt5xjlZG4YPPLRu8eAo=;
        b=h/wYromL+QpA/jq7kHM90XHrZzpxmv/gB041T1MjxeEHRjMEj2QR/IxMMQKvenS7eq
         MTTUSlH6C2jP76UaoAwuu7O8UpmTJyM2kN0xSkGcWc/AhSEOVzYNJb1aZwZ9NQ34O1ZI
         0+Ob+3p+QGZLkAzcwFA813bfBGSMFBOH3oiWwLVwiM1+ZoHguAj/+9/HUb+mPA8ElwGH
         W+b8+BMi1OeE6krgj1m13RtEKMuutHf3E6E4YW1MEcux8l+k+Os765LewCbNp7we6hXS
         gGaAFrZSjJ6IZeJU/vcISShkr+XmNajhut+jVcJgzlTxiAI9aWPQemM2XA3LQIUdYOMx
         FLpw==
X-Gm-Message-State: APjAAAVxu7luBGaiYisZe3VfRmIHlHLyTPM/tns+qsViAHFhyf8fRKmp
        EEe5QBYTPe8JCbzOhd97rYYJ1e15c3k=
X-Google-Smtp-Source: APXvYqxZJROEl7Go9mJ14zcRqIEZy8MOQhYz52cxdH9LK3/ms/0tqs13Hch4RiI8ug3rWwZp182Wog==
X-Received: by 2002:a17:902:104:: with SMTP id 4mr28045532plb.24.1582158048735;
        Wed, 19 Feb 2020 16:20:48 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g21sm804731pfb.126.2020.02.19.16.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:20:48 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] watchdog: qcom: Use irq flags from firmware
Date:   Wed, 19 Feb 2020 16:20:47 -0800
Message-Id: <20200220002047.115000-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The DT or ACPI tables should tell the driver what the irq flags are.
Given that this driver probes only on DT based platforms and those DT
platforms specify the irq flags we can safely drop the forced irq flag
setting here.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/watchdog/qcom-wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index eb47fe5ed280..c70e89013101 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -248,8 +248,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	/* check if there is pretimeout support */
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
-		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
-				       IRQF_TRIGGER_RISING,
+		ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
 				       "wdt_bark", &wdt->wdd);
 		if (ret)
 			return ret;
-- 
Sent by a computer, using git, on the internet

