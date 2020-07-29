Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D302232236
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 18:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgG2QK6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 12:10:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgG2QK6 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 12:10:58 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E333320809;
        Wed, 29 Jul 2020 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596039057;
        bh=MTQc91L8nEUije9/E2iQNE+itwpGFsm/mjfkGzLQAoo=;
        h=From:To:Cc:Subject:Date:From;
        b=uHe5x4NeAE581Czkj+sihuBZ4wP9Ln2MxRJVS1QC6lxC4MTCjrDb69eBA3pl3EUfh
         pUQJk6PLPMEXUDdsa5jdFXIQ+2bagoNNjdqN8HCs0MAEsX5iwSJ/ppn6jNqg/lBcHC
         91iPYEecf0ePA52Nh5BisBkcgfnJ4VxMY4D0RjlE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vincent Sanders <vince@simtec.co.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
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
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: [PATCH 0/7] ARM: samsung: Cleanup of various S3C bits
Date:   Wed, 29 Jul 2020 18:09:35 +0200
Message-Id: <20200729160942.28867-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

I tried to cleanup few warnings in S3C machine code which lead to
finding some bigger issues.

Patches touch mostly the ARM Samsung machine code except patch #1 (clk)
and #5 (watchdog).  They are independent from each other, except
some conflicting lines.

The last three patches would welcome some testing... as I did not
perform such (lack of S3C hardware).

Best regards,
Krzysztof


Krzysztof Kozlowski (7):
  clk: samsung: s3c64xx: Declare s3c64xx_clk_init() in shared header
  ARM: s3c64xx: Include header to fix -Wmissing-prototypes
  ARM: s3c: Remove plat-samsung/.../samsung-time.h
  ARM: samsung: Fix language typo
  ARM: samsung: Kill useless HAVE_S3C2410_WATCHDOG
  ARM: s3c64xx: Switch to generic watchdog driver reset
  ARM: s3c24xx: Fix missing system reset

 MAINTAINERS                                   |  1 +
 arch/arm/Kconfig                              |  3 +-
 arch/arm/mach-exynos/Kconfig                  |  1 -
 arch/arm/mach-s3c24xx/common.h                | 12 +++
 arch/arm/mach-s3c24xx/mach-amlm5900.c         |  2 -
 arch/arm/mach-s3c24xx/mach-anubis.c           |  1 -
 arch/arm/mach-s3c24xx/mach-at2440evb.c        |  1 -
 arch/arm/mach-s3c24xx/mach-bast.c             |  1 -
 arch/arm/mach-s3c24xx/mach-gta02.c            |  1 -
 arch/arm/mach-s3c24xx/mach-h1940.c            |  1 -
 arch/arm/mach-s3c24xx/mach-jive.c             |  1 -
 arch/arm/mach-s3c24xx/mach-mini2440.c         |  1 -
 arch/arm/mach-s3c24xx/mach-n30.c              |  1 -
 arch/arm/mach-s3c24xx/mach-nexcoder.c         |  1 -
 arch/arm/mach-s3c24xx/mach-osiris.c           |  1 -
 arch/arm/mach-s3c24xx/mach-otom.c             |  1 -
 arch/arm/mach-s3c24xx/mach-qt2410.c           |  1 -
 arch/arm/mach-s3c24xx/mach-rx1950.c           |  1 -
 arch/arm/mach-s3c24xx/mach-rx3715.c           |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2410.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2413.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2416.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2440.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2443.c         |  1 -
 arch/arm/mach-s3c24xx/mach-tct_hammer.c       |  1 -
 arch/arm/mach-s3c24xx/mach-vr1000.c           |  1 -
 arch/arm/mach-s3c24xx/mach-vstms.c            |  1 -
 arch/arm/mach-s3c64xx/Kconfig                 |  5 +-
 arch/arm/mach-s3c64xx/common.c                | 16 +---
 arch/arm/mach-s3c64xx/common.h                | 17 +++-
 arch/arm/mach-s3c64xx/mach-anw6410.c          |  2 -
 arch/arm/mach-s3c64xx/mach-crag6410.c         |  2 -
 arch/arm/mach-s3c64xx/mach-hmt.c              |  2 -
 arch/arm/mach-s3c64xx/mach-mini6410.c         |  2 -
 arch/arm/mach-s3c64xx/mach-ncp.c              |  2 -
 arch/arm/mach-s3c64xx/mach-real6410.c         |  2 -
 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c       | 17 ----
 arch/arm/mach-s3c64xx/mach-smartq.c           |  1 -
 arch/arm/mach-s3c64xx/mach-smartq5.c          |  2 -
 arch/arm/mach-s3c64xx/mach-smartq7.c          |  2 -
 arch/arm/mach-s3c64xx/mach-smdk6400.c         |  2 -
 arch/arm/mach-s3c64xx/mach-smdk6410.c         |  2 -
 arch/arm/mach-s3c64xx/setup-spi.c             |  1 +
 arch/arm/mach-s3c64xx/watchdog-reset.h        | 16 ----
 arch/arm/mach-s5pv210/Kconfig                 |  1 -
 arch/arm/plat-samsung/Kconfig                 | 10 +-
 arch/arm/plat-samsung/Makefile                |  1 -
 .../plat-samsung/include/plat/samsung-time.h  | 26 ------
 arch/arm/plat-samsung/watchdog-reset.c        | 93 -------------------
 arch/arm64/Kconfig.platforms                  |  1 -
 drivers/clk/samsung/clk-s3c64xx.c             |  1 +
 drivers/watchdog/Kconfig                      |  8 --
 include/linux/clk/samsung.h                   | 21 +++++
 53 files changed, 59 insertions(+), 237 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/watchdog-reset.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
 delete mode 100644 arch/arm/plat-samsung/watchdog-reset.c
 create mode 100644 include/linux/clk/samsung.h

-- 
2.17.1

