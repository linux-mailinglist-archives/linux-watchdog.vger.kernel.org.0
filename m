Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF224153D0
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Sep 2021 01:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238426AbhIVXUH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 22 Sep 2021 19:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhIVXUG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 22 Sep 2021 19:20:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE80C061574
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Sep 2021 16:18:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i25so18807584lfg.6
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Sep 2021 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XWHoHaMPxRDd6KUyHTUtlTzeXeEx5cXpfpbjlCQ+0A4=;
        b=gP9CXgDNSVM/LavH2gUJP1ClgjZhEVZ1ShIw8JsuQbfKFOWub883G/23caxOYndAC1
         M7PDhNly8z3uhPs1/V2B8uY1AqqJDQUwgU+J+9gta4sfJZX4UiMQMll8iSxYMXX3yi47
         38VrD9ka43EaZnr6CtvNcC8dDTwPVVvUHQ2yar2ATydAPA10fdIQhqvr0I5FZtm5k+vf
         bVQqoRBCRy5XJO7RoLi3cfAS0qlbeY47kjLlt10PVLakm9ar4yzgQjsMkJHCvuCsbAF2
         /Oe/zCrqFlJ1hXBVq8ITVoKD4s101RE1/jRoB9T8W0mP10Y2fRmG3Zl0wFGOprDkB25a
         3fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XWHoHaMPxRDd6KUyHTUtlTzeXeEx5cXpfpbjlCQ+0A4=;
        b=PxAD5ZMdFr0aAxKke0FeeohRgBGQLV3Dq7yBjbwTsPmAE5ziHzCQ6WvdIT1gISLyru
         CfNEl4q/CBNERYohTQDwOyfrFHeFAqy4PcO4wds7Zy3pHAPNAhZVHpWhvr2kF/H4363c
         /DmCLnvrpt7X5jqhtSw6RaadlfuKehjW9ym7yNsEY6BMW5ptw5BZq6LlqtCXswtmkpFQ
         yrtifmsP9I3Rs27O8SSDYT5lpPbpzLsfgotZjeD63Wj7x4+xHkU5S9cWnWG+6oJCGYDy
         v9Q4ApsTgZD6osz/wXePyaqCWCjePtr6vpTEQgcy8+y/elg27K8I4Agp2i9J4bI29AXH
         +/ow==
X-Gm-Message-State: AOAM531S8Kn14Jjz6hlrKxYRGQ/wDbEnCf2HjQniCHi4E2yZhf21qTJe
        74VoePSoMmPjv1AxTWkZNSKNfw==
X-Google-Smtp-Source: ABdhPJzioIJqf8a4ahllXsaCa18LsUkdU6Dbe7GtduX0TYr9t+aAZ4hJWyJFNXyFf4KvZRzikambkg==
X-Received: by 2002:a05:6512:2354:: with SMTP id p20mr1447900lfu.204.1632352713921;
        Wed, 22 Sep 2021 16:18:33 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u28sm288044lfo.47.2021.09.22.16.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 16:18:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] watchdog: db8500_wdt: Rename driver
Date:   Thu, 23 Sep 2021 01:09:46 +0200
Message-Id: <20210922230947.1864357-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922230947.1864357-1-linus.walleij@linaro.org>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This driver is named after the ambition to support more SoCs than
the DB8500. Those were never produced, so cut down the scope and
rename the driver accordingly. Since the Kconfig for the watchdog
defaults to y this will still be built by default.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/watchdog/Kconfig                       | 8 ++++----
 drivers/watchdog/Makefile                      | 2 +-
 drivers/watchdog/{ux500_wdt.c => db8500_wdt.c} | 0
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/watchdog/{ux500_wdt.c => db8500_wdt.c} (100%)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b81fe4f7d434..b5fe869991f9 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -743,17 +743,17 @@ config IMX7ULP_WDT
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx7ulp_wdt.
 
-config UX500_WATCHDOG
-	tristate "ST-Ericsson Ux500 watchdog"
+config DB500_WATCHDOG
+	tristate "ST-Ericsson DB800 watchdog"
 	depends on MFD_DB8500_PRCMU
 	select WATCHDOG_CORE
 	default y
 	help
 	  Say Y here to include Watchdog timer support for the watchdog
-	  existing in the prcmu of ST-Ericsson Ux500 series platforms.
+	  existing in the prcmu of ST-Ericsson DB8500 platform.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called ux500_wdt.
+	  module will be called db500_wdt.
 
 config RETU_WATCHDOG
 	tristate "Retu watchdog"
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 1bd2d6f37c53..f500f242f46b 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -69,7 +69,7 @@ obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
 obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
 obj-$(CONFIG_IMX_SC_WDT) += imx_sc_wdt.o
 obj-$(CONFIG_IMX7ULP_WDT) += imx7ulp_wdt.o
-obj-$(CONFIG_UX500_WATCHDOG) += ux500_wdt.o
+obj-$(CONFIG_DB500_WATCHDOG) += db8500_wdt.o
 obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
 obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o
 obj-$(CONFIG_MOXART_WDT) += moxart_wdt.o
diff --git a/drivers/watchdog/ux500_wdt.c b/drivers/watchdog/db8500_wdt.c
similarity index 100%
rename from drivers/watchdog/ux500_wdt.c
rename to drivers/watchdog/db8500_wdt.c
-- 
2.31.1

