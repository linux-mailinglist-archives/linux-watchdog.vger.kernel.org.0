Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220EB5A28F2
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Aug 2022 15:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiHZN5U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Aug 2022 09:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiHZN5T (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Aug 2022 09:57:19 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B4EABD76
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 06:57:18 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u24so1706288lji.0
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 06:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=PhU2BN9P1/BghL33RFY+/rW8HlDuelRXvFUsERPAZqw=;
        b=FN2dpXJE1cEJ/7kCGriMchjb6HypP8/JUlY+W3UsQgF9KH/9JuuL/WDqHW7Sny1U1q
         nstZszUdbwhrQhIp1+/4napbeHgSNXd8SZIOOF3X6EM3+M+rZokg7iM6G0YclAjogWuD
         /tVZ4k0Qdxe+fNW1fhXrkOmyN/RDTUYv+bweq2tV8GkaKp1nyqmU+OflVvS/9bM5ym9/
         3X1mGDqEcVPk2OwvQT2qdjATgu1984e4Ej1UEDKQVMQBaeIjqdNLCH6Za4tYYIPbzFDL
         G2XsP+Gb9uDZUhtUIdi9shJSuxrhyKICQ/YiDcfA0FkbPo5yclKAYRSAmojyVTG1vqh9
         Vflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=PhU2BN9P1/BghL33RFY+/rW8HlDuelRXvFUsERPAZqw=;
        b=Z3tYUMRTRmR3P8vpkpBS81HJZg1OTWn2GgxyedPMaaGRg5Q0Yyg/lNvKv/lgh8+ek5
         UEfcCBtMLTD9LP+CpNqNcFLfvALW06qDyOEPTEngKnv7E/w2sSYk1USaaTSfHIGb73Q4
         B9reCBrD4AWas1qv5mnfcaFkV8rHGARRmJEhZX2Nvy+n2NnM+uFDV1Y3h+vMX+vOAYyA
         zMAqEa1cW2OCpXmT55idW1wcZH8TrpESeoOpxya+64TN4GQIYLMY1DDFTCNnHGe7lJMW
         FAxgtE7Vq3Toh+mdXKuvvHTYEZvfjxwwIg304T6AGrNARa3c9b8Yfl7J3geCTB643LnW
         Ex2A==
X-Gm-Message-State: ACgBeo3sblAvecaR64FNbvgPad4A2aNCKPUNIXLcs14aS/iXi+Td+XnY
        r9RcYfOF9V+QJ0qi0MrFG1PcbjUQk304sQ==
X-Google-Smtp-Source: AA6agR4GQ1qU5Vj6M6Dgguubs19azuK63lapD0spREC5Icu5uCyEIa58V9E1x04aKuXvhG3qsLZOkQ==
X-Received: by 2002:a05:651c:b2c:b0:25e:6e68:ff51 with SMTP id b44-20020a05651c0b2c00b0025e6e68ff51mr2320052ljr.349.1661522236470;
        Fri, 26 Aug 2022 06:57:16 -0700 (PDT)
Received: from saproj-Latitude-5501.yandex.net ([2a02:6b8:0:40c:8130:35cb:219d:e45f])
        by smtp.gmail.com with ESMTPSA id w21-20020a05651c119500b002618dae9fe8sm473324ljo.73.2022.08.26.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 06:57:16 -0700 (PDT)
From:   Sergei Antonov <saproj@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        Sergei Antonov <saproj@gmail.com>
Subject: [PATCH] watchdog: ftwdt010_wdt: add _restart() function
Date:   Fri, 26 Aug 2022 16:56:38 +0300
Message-Id: <20220826135638.3751835-1-saproj@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a missing _restart function to watchdog_ops.
FTWDT010 resets system when it is started with timeout = 0.

Signed-off-by: Sergei Antonov <saproj@gmail.com>
---
 drivers/watchdog/ftwdt010_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
index 21dcc7765688..9eaaaca1094d 100644
--- a/drivers/watchdog/ftwdt010_wdt.c
+++ b/drivers/watchdog/ftwdt010_wdt.c
@@ -93,6 +93,13 @@ static int ftwdt010_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
+				unsigned long action, void *data)
+{
+	wdd->timeout = 0;
+	return ftwdt010_wdt_start(wdd);
+}
+
 static irqreturn_t ftwdt010_wdt_interrupt(int irq, void *data)
 {
 	struct ftwdt010_wdt *gwdt = data;
@@ -107,6 +114,7 @@ static const struct watchdog_ops ftwdt010_wdt_ops = {
 	.stop		= ftwdt010_wdt_stop,
 	.ping		= ftwdt010_wdt_ping,
 	.set_timeout	= ftwdt010_wdt_set_timeout,
+	.restart	= ftwdt010_wdt_restart,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.34.1

