Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31ABA23BFE1
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgHDT2P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:28:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgHDT2P (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:28:15 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FCAF22CA0;
        Tue,  4 Aug 2020 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569295;
        bh=jL0qvrIWZbUG6iyW2+vlFy/rDnA34eVXXUTdLk1dH1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pi6SY3SUL0/7MiBZt2jitKAi1avA9Ai19KAHIvMhbgLFqULvT289Do353HeEsuRh6
         nsv65LJBKJWxFTWhwiuouhQPd+G+pGvQC7nFahhlxqCDGq1MHshl7MZy74rQCpKrGu
         As6mppldhxYGAaF8gcuispWPEDInceuejaQ2thpA=
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
Subject: [PATCH v2 09/13] ARM: s3c24xx: include common.h header in s3c2443.c
Date:   Tue,  4 Aug 2020 21:26:50 +0200
Message-Id: <20200804192654.12783-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Include common.h header in the s3c2443.c to bring the prototypes of
defined functions and fix W=1 compile warnings:

    arch/arm/mach-s3c24xx/s3c2443.c:60:12: warning: no previous prototype for 's3c2443_init' [-Wmissing-prototypes]
       60 | int __init s3c2443_init(void)
    arch/arm/mach-s3c24xx/s3c2443.c:77:13: warning: no previous prototype for 's3c2443_init_uarts' [-Wmissing-prototypes]
       77 | void __init s3c2443_init_uarts(struct s3c2410_uartcfg *cfg, int no)
    arch/arm/mach-s3c24xx/s3c2443.c:88:13: warning: no previous prototype for 's3c2443_map_io' [-Wmissing-prototypes]
       88 | void __init s3c2443_map_io(void)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/s3c2443.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 4cbeb74cf3d6..c278cfc10ba5 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -38,6 +38,7 @@
 #include <plat/cpu.h>
 #include <plat/adc-core.h>
 
+#include "common.h"
 #include "fb-core.h"
 #include "nand-core.h"
 #include "spi-core.h"
-- 
2.17.1

