Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEE8151D0D
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 16:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgBDPVa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 10:21:30 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36029 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgBDPVa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 10:21:30 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so4165824wma.1;
        Tue, 04 Feb 2020 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GhE5FW40OPB90pmIillZl/71nzFIm2pOC803DrZ4Spw=;
        b=Z4H66yf0ClAGZ9BU9Y1LjQyl8Ns+xdotOdY3OLtZcf7OMRs2jRCAc1RFWdkKqv3Ge4
         ajcwLi6kYGhEeQEv+X6c7uZtL310AGgjRwH6joEcoR56RGRNSK9Zbo4BSrecXFNUtu/d
         RGpAhtm/ChL1jX7kNaOHhr8V9w+ZcV6fyjNiNrq89p85D84E4jNAiyLZgHmP2dX0dm3u
         0PGue8Tk4zklj0ulPaa0t/GTe13hxoLZ9qpLakHhxydDCDRhEEpPxAKBB2MX0UxGyx86
         VkkyldEAOrIbz6m9zM4Eg8UFJeCOkWi5K8QYFUBUDuOS35wYEL+OGy3HXpB6k2vMxFop
         FGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GhE5FW40OPB90pmIillZl/71nzFIm2pOC803DrZ4Spw=;
        b=qZr5YYNB96MVATmMITWbK06SIoLbRDVI0ZOiDW5qflbAGfY8MzLTCJsMTtq6KFa92X
         G3JpP1+QVa6rfeVBP6cmE68hasAjIbobhenNL51Y9J1j+GY3Yn2lhgyYDADAKSqP5LmM
         AP2iSoC3lxot8W+QQ2pWzGj9vpSaFmlGtbcHtM/BU9p0dTIkMqzWL0YU5E8maZMIa2Oc
         gsPENnYyO7D07sX2B2vfWb7Fo4q2JJ1/+bf49jZACYblie+TNO7JeiKN9o+uXBxDyB98
         iiNRRVbUUI/diYNVViS917JsgTdLA+tTob/Fcmnu7TO+uhRVVAzRSl/ZStIT4baAzLtA
         HzZQ==
X-Gm-Message-State: APjAAAXo5DAQZF0aUTI4kUdyYZEOEkIuQzkW5nLj5V3pLOTrOmSEKy0h
        E3S1h2z39vrk6S4VjltXnco=
X-Google-Smtp-Source: APXvYqxj2GHvAQRiTyHO73SCccCsAxR0kmLAN3Xf1aA64me3ICvJ8h71Ene7V4cxj8rM4pJPz1nACw==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr6184072wmk.131.1580829687814;
        Tue, 04 Feb 2020 07:21:27 -0800 (PST)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.googlemail.com with ESMTPSA id x10sm29902174wrv.60.2020.02.04.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 07:21:27 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] watchdog: qcom-wdt: add option to skip pretimeout
Date:   Tue,  4 Feb 2020 16:21:01 +0100
Message-Id: <20200204152104.13278-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Some platform like ipq806x doesn't support pretimeout.
As the driver check if there are available interrupts and ipq806x
use msm-timer that require interrupts, the watchdog fail to probe
as request_irq tries to use a ppi interrupt. Add an option to skip
pretimeout setup and use the normal watchdog probe.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/watchdog/qcom-wdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index a494543d3ae1..e689e97e883e 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -189,6 +189,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	u32 percpu_offset;
 	int irq, ret;
 	struct clk *clk;
+	bool nopretimeout;
 
 	regs = of_device_get_match_data(dev);
 	if (!regs) {
@@ -204,6 +205,8 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	if (!res)
 		return -ENOMEM;
 
+	nopretimeout = of_property_read_bool(np, "no-pretimeout");
+
 	/* We use CPU0's DGT for the watchdog */
 	if (of_property_read_u32(np, "cpu-offset", &percpu_offset))
 		percpu_offset = 0;
@@ -247,7 +250,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 
 	/* check if there is pretimeout support */
 	irq = platform_get_irq(pdev, 0);
-	if (irq > 0) {
+	if (!nopretimeout && irq > 0) {
 		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
 				       IRQF_TRIGGER_RISING,
 				       "wdt_bark", &wdt->wdd);
-- 
2.24.0

