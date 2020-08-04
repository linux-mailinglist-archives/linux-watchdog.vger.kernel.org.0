Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B805923BFF1
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgHDT2j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:28:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726961AbgHDT2i (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:28:38 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E42F822CA0;
        Tue,  4 Aug 2020 19:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569318;
        bh=nHtU3jC68K1szov6StQnB9nGWj8YGb5ZSEYff2gaNZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x3CJiubP9wgIU42gAEtOSgXFF600wkRT/BddRn49+S/ZUrq7GkjK4innamltxZyDi
         NIxLMqMT7Wl/HZflJWFHTUWhx1bWWYIxiwvK/ZkN/CUzEcO0KUGkenjp+uA4QSU5i8
         Ghjn108+3bhzjIs8Hm3l4L9nKfLDG9phid8fml0A=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with prototypes and unify declaration
Date:   Tue,  4 Aug 2020 21:26:54 +0200
Message-Id: <20200804192654.12783-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The s3c_camif_gpio_put() declaration in
include/media/drv-intf/s3c_camif.h header was different than definition.
Fixing this allows to include that header to also fix the W=1 compile
warnings:

    arch/arm/mach-s3c24xx/setup-camif.c:28:5: warning: no previous prototype for 's3c_camif_gpio_get' [-Wmissing-prototypes]
       28 | int s3c_camif_gpio_get(void)
    arch/arm/mach-s3c24xx/setup-camif.c:56:6: warning: no previous prototype for 's3c_camif_gpio_put' [-Wmissing-prototypes]
       56 | void s3c_camif_gpio_put(void)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/setup-camif.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/setup-camif.c b/arch/arm/mach-s3c24xx/setup-camif.c
index 2b262fae3f61..4046afaad645 100644
--- a/arch/arm/mach-s3c24xx/setup-camif.c
+++ b/arch/arm/mach-s3c24xx/setup-camif.c
@@ -7,6 +7,7 @@
 #include <linux/gpio.h>
 #include <plat/gpio-cfg.h>
 #include <mach/gpio-samsung.h>
+#include <media/drv-intf/s3c_camif.h>
 
 /* Number of camera port pins, without FIELD */
 #define S3C_CAMIF_NUM_GPIOS	13
@@ -53,7 +54,7 @@ int s3c_camif_gpio_get(void)
 	return 0;
 }
 
-void s3c_camif_gpio_put(void)
+int s3c_camif_gpio_put(void)
 {
 	int i, gpio_start, gpio_reset;
 
@@ -64,4 +65,6 @@ void s3c_camif_gpio_put(void)
 		if (gpio != gpio_reset)
 			gpio_free(gpio);
 	}
+
+	return 0;
 }
-- 
2.17.1

