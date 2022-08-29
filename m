Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC1D5A45B0
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Aug 2022 11:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiH2JEq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Aug 2022 05:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiH2JEo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Aug 2022 05:04:44 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44D05A3FE
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Aug 2022 02:04:41 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bx38so7353617ljb.10
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Aug 2022 02:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=BTq8W6EQCTwtKaWmGzapesg4+eB35IA9sCOabuOW53Q=;
        b=CJgb53oka5KEZZJ/95uqVpyn8d6UDIZn+EmlvYJ/TAYApDzj+3NkQcaEI8LHuY9c3t
         ZPWRK83t657TfXnCBJxun5IxI3Q59GUIqGf3FH0qubea70/KelGWoYKKaOUAIOqslsaA
         dD8hVHMdJFMLqc1o/mwss500mMLAlA35+I+nZ5y+JSIVQkUhUE4QIHnq/XFexjQrhIWS
         SrzyB+rsIcwsEyqfzREygcd6WTYNkYopE2J5OZQHrrl3gtyan28QNdgSIPAqqke+HSyi
         lK0fM5fembuxf0d5WJ4gPJzvOPKmsYg6+/W2pObpxIKnQthxWbjlnSnwhabNcFAGbVYV
         44kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=BTq8W6EQCTwtKaWmGzapesg4+eB35IA9sCOabuOW53Q=;
        b=JM1sbDB8ugXMAj3dkQOUqc9lGQuA9nfHToaoR5TmcTuYtQdCvLGGfEHvF5E8yz7BZY
         ZuG44ZJCjMFranFB5T8KQm8Zfbx552mAy/mhYotXjorOjB8IhBqOCiArrMjo0L5RWle8
         NwRf1evh9p0nyjEBKpDBpRR06WjFhJ4dG6CC64teqA7gAgYkB132Vc0vjeuDnunFshsI
         57VFEi+d6590+HXzw0vJXxi4M6N2xwUq7QVhAx7f/fVEbHNtbc8z96cM8DLpOKJ2H+kp
         Oblh1bo+KhkgrD2YIN9EhJSgjh0nco57KMYeSzGtcwmDS2mfiy7voY0hca6MzbCEV9ed
         F89g==
X-Gm-Message-State: ACgBeo17HL0nqws7y91VrO1vLstWJhS6mgyKEPQXG049XT2qYL1/9unu
        tgmgqAd3GRnTLzTsmIbpnFaHRqMTQ0EcUQ==
X-Google-Smtp-Source: AA6agR64c1mxHK9yI58x3ahMkOyUAn8eN+PRr6Lv0rxsGfpoa/zKcscHV5Bdk+5TgARi7AQ7tbo56g==
X-Received: by 2002:a2e:a549:0:b0:25f:e5b8:a826 with SMTP id e9-20020a2ea549000000b0025fe5b8a826mr5698513ljn.207.1661763879656;
        Mon, 29 Aug 2022 02:04:39 -0700 (PDT)
Received: from saproj-Latitude-5501.yandex.net ([2a02:6b8:0:40c:f668:a125:80b4:bce4])
        by smtp.gmail.com with ESMTPSA id g32-20020a0565123ba000b0048b0062a14fsm1201082lfv.144.2022.08.29.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:04:39 -0700 (PDT)
From:   Sergei Antonov <saproj@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        Sergei Antonov <saproj@gmail.com>
Subject: [PATCH v3] watchdog: ftwdt010_wdt: implement _restart() function
Date:   Mon, 29 Aug 2022 12:04:36 +0300
Message-Id: <20220829090436.452742-1-saproj@gmail.com>
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

Implement ftwdt010_wdt_restart(). It enables watchdog with timeout = 0
and disabled IRQ. Since it needs code similar to ftwdt010_wdt_start(),
add a new function ftwdt010_enable() and move common code there.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sergei Antonov <saproj@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

v2 -> v3:
Change history moved away from description.

v1 -> v2:
Do not let IRQ trigger when restarting.
Add a helper function ftwdt010_enable().


 drivers/watchdog/ftwdt010_wdt.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
index 21dcc7765688..0a5bbfd2823f 100644
--- a/drivers/watchdog/ftwdt010_wdt.c
+++ b/drivers/watchdog/ftwdt010_wdt.c
@@ -47,21 +47,28 @@ struct ftwdt010_wdt *to_ftwdt010_wdt(struct watchdog_device *wdd)
 	return container_of(wdd, struct ftwdt010_wdt, wdd);
 }
 
-static int ftwdt010_wdt_start(struct watchdog_device *wdd)
+static void ftwdt010_enable(struct ftwdt010_wdt *gwdt,
+			    unsigned int timeout,
+			    bool need_irq)
 {
-	struct ftwdt010_wdt *gwdt = to_ftwdt010_wdt(wdd);
 	u32 enable;
 
-	writel(wdd->timeout * WDT_CLOCK, gwdt->base + FTWDT010_WDLOAD);
+	writel(timeout * WDT_CLOCK, gwdt->base + FTWDT010_WDLOAD);
 	writel(WDRESTART_MAGIC, gwdt->base + FTWDT010_WDRESTART);
 	/* set clock before enabling */
 	enable = WDCR_CLOCK_5MHZ | WDCR_SYS_RST;
 	writel(enable, gwdt->base + FTWDT010_WDCR);
-	if (gwdt->has_irq)
+	if (need_irq)
 		enable |= WDCR_WDINTR;
 	enable |= WDCR_ENABLE;
 	writel(enable, gwdt->base + FTWDT010_WDCR);
+}
 
+static int ftwdt010_wdt_start(struct watchdog_device *wdd)
+{
+	struct ftwdt010_wdt *gwdt = to_ftwdt010_wdt(wdd);
+
+	ftwdt010_enable(gwdt, wdd->timeout, gwdt->has_irq);
 	return 0;
 }
 
@@ -93,6 +100,13 @@ static int ftwdt010_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
+				unsigned long action, void *data)
+{
+	ftwdt010_enable(to_ftwdt010_wdt(wdd), 0, false);
+	return 0;
+}
+
 static irqreturn_t ftwdt010_wdt_interrupt(int irq, void *data)
 {
 	struct ftwdt010_wdt *gwdt = data;
@@ -107,6 +121,7 @@ static const struct watchdog_ops ftwdt010_wdt_ops = {
 	.stop		= ftwdt010_wdt_stop,
 	.ping		= ftwdt010_wdt_ping,
 	.set_timeout	= ftwdt010_wdt_set_timeout,
+	.restart	= ftwdt010_wdt_restart,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.34.1

