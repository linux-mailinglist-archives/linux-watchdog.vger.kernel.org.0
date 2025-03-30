Return-Path: <linux-watchdog+bounces-3179-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E75A759B0
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 Mar 2025 12:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A269D7A4259
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 Mar 2025 10:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C188B149DFF;
	Sun, 30 Mar 2025 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="BEAzv8RE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1170A1876;
	Sun, 30 Mar 2025 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743332303; cv=none; b=A0NOL7tJaceSlAoZpWsIc61jT67BrZ82J9MybiW0k4hbuddKOZnJjK/YyNX9ztXj30ku97g4RPTyqLscas8oqquAcbYxbZtTc6FS7FtP+dc0RMEtBk3hdCQ/K2EvOJvbMDQqr+Ed/q7mam56ovRKxrE5xcnLjMeJUiyVDp5PSSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743332303; c=relaxed/simple;
	bh=uVIQEOtI630sSjcBztuICMnYQfAn3q9dl1aF4VCv7Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nlxA352xqUjMwMll8ie5xpHidxd+47+fUFUQwzlNPUycHLWzNzfcW7YbxQtp2fyHPAldYgipDMDOK1eGcaTI5GFx16pIcCVzV+JJiuTOzv3JIUdXVPc6FKxxDT8aUlxP98EUHhEoUZl5g1loqfFXK1uisZzgYPHdHP9GDccwMMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=BEAzv8RE; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 1C3E840A00; Sun, 30 Mar 2025 12:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 1C3E840A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20250313; t=1743329614;
	bh=uVIQEOtI630sSjcBztuICMnYQfAn3q9dl1aF4VCv7Zk=;
	h=Date:From:To:Cc:Subject:From;
	b=BEAzv8REy4FtouX2ZOsTsRZ05+2up5KXdS0lkYsAyH73qS4Eti6xUKj/1IoKw0e0R
	 j75FdjqmAxGH1biH+gqspa/p9cmlXoP3ek4MSavYiIxDKY6417WlMqjK/8Hmu73t8e
	 v7O2PlMRtDEhrZxhN1PEIOO7WN3J/O7aSsTbbxYQjC1F518OL+excWx6ARlck24LY1
	 QLqomYpSfycOBgyjtpFtgn7o/HJHrjwINcv9JMrB2ioUeBR/cLH4woZqhOspQeoSxS
	 QDYjecYzVekAEaEBnTe0DfVDjnUqIMMvCYfUtwPONgTgCO7Gk3sZzw5pq14Fo21ynV
	 ZZAE+IUWvM3Zg==
Date: Sun, 30 Mar 2025 12:13:33 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Biju Das <biju.das.jz@bp.renesas.com>, Chen Ni <nichen@iscas.ac.cn>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	Frank Li <Frank.Li@nxp.com>, Kyunghwan Seo <khwan.seo@samsung.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Stephen Boyd <swboyd@chromium.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [GIT PULL REQUEST] watchdog - v6.15 release cycle.
Message-ID: <20250330101333.GA18497@www.linux-watchdog.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Linus,

Please pull following watchdog changes for the v6.15 release cycle.

This series contains:
* Add watchdog driver for Lenovo SE30 platform
* Add support for Allwinner A523
* Add i.MX94 support
* watchdog framework: Convert to use device property
* renesas,wdt: Document RZ/G3E support
* Various other fixes and improvemenents

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.15-rc1

for you to fetch changes up to 9bc64d338b0b4b2061049df8b701f9786857690e:

  watchdog: sunxi_wdt: Add support for Allwinner A523 (2025-03-25 14:11:16 +0100)

----------------------------------------------------------------
linux-watchdog 6.15-rc1 tag

----------------------------------------------------------------
Andre Przywara (2):
      dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
      watchdog: sunxi_wdt: Add support for Allwinner A523

Andy Shevchenko (1):
      watchdog: nic7018_wdt: tidy up ACPI ID table

Arnd Bergmann (1):
      watchdog: aspeed: fix 64-bit division

Biju Das (2):
      watchdog: Enable RZV2HWDT driver depend on ARCH_RENESAS
      dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support

Chen Ni (1):
      watchdog: npcm: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare

Chin-Ting Kuo (1):
      watchdog: aspeed: Update bootstatus handling

Frank Li (1):
      dt-bindings: watchdog: fsl-imx7ulp-wdt: Add i.MX94 support

Guenter Roeck (1):
      watchdog: Convert to use device property

Kyunghwan Seo (1):
      watchdog: s3c2410_wdt: Fix PMU register bits for ExynosAutoV920 SoC

Mark Pearson (1):
      watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30 platform

Stephen Boyd (1):
      watchdog: cros-ec: Add newlines to printks

Stephen Rothwell (1):
      watchdog: lenovo_se30_wdt: include io.h for devm_ioremap()

 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml |   2 +
 .../bindings/watchdog/fsl-imx7ulp-wdt.yaml         |   4 +
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |   4 +
 drivers/watchdog/Kconfig                           |  22 +-
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aspeed_wdt.c                      |  81 ++++-
 drivers/watchdog/cros_ec_wdt.c                     |  10 +-
 drivers/watchdog/lenovo_se30_wdt.c                 | 394 +++++++++++++++++++++
 drivers/watchdog/nic7018_wdt.c                     |   9 +-
 drivers/watchdog/npcm_wdt.c                        |   9 +-
 drivers/watchdog/s3c2410_wdt.c                     |  10 +-
 drivers/watchdog/sunxi_wdt.c                       |  11 +
 drivers/watchdog/watchdog_core.c                   |   6 +-
 13 files changed, 535 insertions(+), 28 deletions(-)
 create mode 100644 drivers/watchdog/lenovo_se30_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.


