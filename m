Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C2523BFEB
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgHDT21 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:28:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727124AbgHDT21 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:28:27 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5439F22BED;
        Tue,  4 Aug 2020 19:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569306;
        bh=Sftn4epoCLqAwjBylR9Az43Z5oS92gbF9zDuuQ3Jbsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PaaEC0Cu81JXbpx0VPRJpMqI27MvQFjd92096H9QGoYMoZoieM2bvVc+kKrEzc4Yg
         AvULxgwjtB8ZyHRRP4bYnXTHXLVovBPr6AqPfJPqk9cOf/oxxhxAvR6+JGS/nSEh6s
         FjDhXLyCqAv09Qs3FDOyZdagpJaI/mUWJn6v88zM=
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
Subject: [PATCH v2 11/13] ARM: s3c24xx: ts: include platform data header
Date:   Tue,  4 Aug 2020 21:26:52 +0200
Message-Id: <20200804192654.12783-12-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Include platform_data/touchscreen-s3c2410.h header in the touchscreen
code to bring the prototypes of defined functions and fix W=1 compile
warning:

    arch/arm/mach-s3c24xx/setup-ts.c:24:6: warning: no previous prototype for 's3c24xx_ts_cfg_gpio' [-Wmissing-prototypes]
       24 | void s3c24xx_ts_cfg_gpio(struct platform_device *dev)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/setup-ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-s3c24xx/setup-ts.c b/arch/arm/mach-s3c24xx/setup-ts.c
index 53a14d4f4852..bf1a7fcf465f 100644
--- a/arch/arm/mach-s3c24xx/setup-ts.c
+++ b/arch/arm/mach-s3c24xx/setup-ts.c
@@ -10,6 +10,8 @@
 
 struct platform_device; /* don't need the contents */
 
+#include <linux/platform_data/touchscreen-s3c2410.h>
+
 #include <plat/gpio-cfg.h>
 #include <mach/hardware.h>
 #include <mach/gpio-samsung.h>
-- 
2.17.1

