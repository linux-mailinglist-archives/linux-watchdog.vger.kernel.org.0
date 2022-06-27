Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE72555D744
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jun 2022 15:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238655AbiF0Lxo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 Jun 2022 07:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239049AbiF0LxI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 Jun 2022 07:53:08 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84271BC1C
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Jun 2022 04:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P+6s8dWLOMqSqA0TNP/AuvKENjVv77kgcF6wzMFk6DI=; b=XGRlmOF0Kykcqg9giuV4lWfkkl
        qErdnvYPAgdZ7sTzktBBvnhRCNq8N6k6K1dpBhL2/pJpf/8NKVx/aep9st1yImg+2Q2hkN1GwsrBh
        3SueyG5/RrxHC60QCjKZvDWD2kDD4G7g99eKWH7OuezTtoauzanz7xKdI0/NXUgnlko+cD8sVGPqp
        Jqfsy4UWD2j84i02Nowa7ykHen3uX5yDCBvsZ2PML7FvR8v2YfRc9byn7DO3HQV75YWkR2bc3Qc3g
        BoxzgQmIj4og5wqZcqSnd2nQCp8Z4crjHAd6MPSE/ok966/Jy2IyOCptHbFQzzihQU+ls6vxz4+yB
        ReACG8ew==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o5mhn-006C6l-Gp; Mon, 27 Jun 2022 13:14:59 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 2/3] watchdog: pm8916_wdt: Report reboot reason
Date:   Mon, 27 Jun 2022 13:14:31 +0200
Message-Id: <20220627111432.2625168-3-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627111432.2625168-1-stephan.gerhold@kernkonzept.com>
References: <20220627111432.2625168-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The PM8916 PMIC provides "power-off reason" (POFF_REASON) registers
to allow detecting why the board was powered off or rebooted. This
can be used to expose if a reset happened due to a watchdog timeout.
The watchdog API also provides status bits for overtemperature and
undervoltage which happen to be reported in the same PMIC register.

Make this information available as part of the watchdog device
so userspace can decide to handle the situation accordingly.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 drivers/watchdog/pm8916_wdt.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 670cd79f4cf9..3fc03fdae466 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -9,6 +9,12 @@
 #include <linux/regmap.h>
 #include <linux/watchdog.h>
 
+#define PON_POFF_REASON1		0x0c
+#define PON_POFF_REASON1_PMIC_WD	BIT(2)
+#define PON_POFF_REASON2		0x0d
+#define PON_POFF_REASON2_UVLO		BIT(5)
+#define PON_POFF_REASON2_OTST3		BIT(6)
+
 #define PON_INT_RT_STS			0x10
 #define PMIC_WD_BARK_STS_BIT		BIT(6)
 
@@ -110,12 +116,14 @@ static irqreturn_t pm8916_wdt_isr(int irq, void *arg)
 }
 
 static const struct watchdog_info pm8916_wdt_ident = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
+		   WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER,
 	.identity = "QCOM PM8916 PON WDT",
 };
 
 static const struct watchdog_info pm8916_wdt_pt_ident = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
+		   WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER |
 		   WDIOF_PRETIMEOUT,
 	.identity = "QCOM PM8916 PON WDT",
 };
@@ -135,6 +143,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 	struct pm8916_wdt *wdt;
 	struct device *parent;
 	int err, irq;
+	u8 poff[2];
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
@@ -175,6 +184,20 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 		wdt->wdev.info = &pm8916_wdt_ident;
 	}
 
+	err = regmap_bulk_read(wdt->regmap, wdt->baseaddr + PON_POFF_REASON1,
+			       &poff, ARRAY_SIZE(poff));
+	if (err == 0) {
+		dev_dbg(dev, "POFF reason: %#x %#x\n", poff[0], poff[1]);
+		if (poff[0] & PON_POFF_REASON1_PMIC_WD)
+			wdt->wdev.bootstatus |= WDIOF_CARDRESET;
+		if (poff[1] & PON_POFF_REASON2_UVLO)
+			wdt->wdev.bootstatus |= WDIOF_POWERUNDER;
+		if (poff[1] & PON_POFF_REASON2_OTST3)
+			wdt->wdev.bootstatus |= WDIOF_OVERHEAT;
+	} else {
+		dev_err(dev, "failed to read POFF reason: %d\n", err);
+	}
+
 	/* Configure watchdog to hard-reset mode */
 	err = regmap_write(wdt->regmap,
 			   wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL,
-- 
2.30.2

