Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C302423BFEF
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgHDT2d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:28:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:40898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727124AbgHDT2c (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:28:32 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3463522CA1;
        Tue,  4 Aug 2020 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569312;
        bh=0xKanm6E3fkk6zot9QwJ67UHOYBOs+wAgdA9lr/fbcg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gpljav+vdTG8u8cLpw8pBmP50k/KD2bBhLSoM7BdjLenKPpu5kMea0ammxrgH6mE5
         7yg8Ok5NGGrKaYfN0mFoSX4EsX9V6fZA7pOZw3mtJt/UHem3XP1uFDauG0HXwrPbrJ
         LtD6WGrrOvylTCvyK4AMJgeB2AffK4MyRfezy8Lg=
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
Subject: [PATCH v2 12/13] ARM: s3c24xx: ts: document function argument
Date:   Tue,  4 Aug 2020 21:26:53 +0200
Message-Id: <20200804192654.12783-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Document function argument in kerneldoc comment to fix W=1 compile
warning:

    arch/arm/mach-s3c24xx/setup-ts.c:27: warning: Function parameter or member 'dev' not described in 's3c24xx_ts_cfg_gpio'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/setup-ts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/setup-ts.c b/arch/arm/mach-s3c24xx/setup-ts.c
index bf1a7fcf465f..272d65400b71 100644
--- a/arch/arm/mach-s3c24xx/setup-ts.c
+++ b/arch/arm/mach-s3c24xx/setup-ts.c
@@ -18,6 +18,7 @@ struct platform_device; /* don't need the contents */
 
 /**
  * s3c24xx_ts_cfg_gpio - configure gpio for s3c2410 systems
+ * @dev: Device to configure GPIO for (ignored)
  *
  * Configure the GPIO for the S3C2410 system, where we have external FETs
  * connected to the device (later systems such as the S3C2440 integrate
-- 
2.17.1

