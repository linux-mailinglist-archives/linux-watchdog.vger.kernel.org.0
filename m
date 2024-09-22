Return-Path: <linux-watchdog+bounces-2002-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3C97E0E2
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Sep 2024 12:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FE0E1C2093C
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Sep 2024 10:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8779D524D7;
	Sun, 22 Sep 2024 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="RhHAdd2b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D66B663;
	Sun, 22 Sep 2024 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727000704; cv=none; b=FTOfZuuBKKjmecUELFHU/+CBaFRS0H/DyPqnJ7IHzPab9LwoottAU9mgQfWG+BVaGWJMK5ukMnOulSYbm8Us3kBRm7P8VII1tqlfkbfY6cXjO+LOi7or+h4eU42RVUBbwy+aQmjOGKyWw0Y61Cu+zNZQ/5ceQZEgZBzYaFNIumg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727000704; c=relaxed/simple;
	bh=w/ZWHCQc40nkBw6bes7cbk5X0VzoOhqf3DRFWJ2Sqmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tyhKluPQj4Qb1P0Rl4UOT7Ra5MNJT8KUgYiQUJaKBhPlBiZ5Ki8uSY+OpnoNLFA6MDWc/HThXFHsXJ+P2N59xAZsJ6jd6IT5h/Bj85224VrHuDZv0ax3X2axtqWzt4Cc1C3BiApyWgs75MXF0uziSboBUAwwAhjPlfJM3DWhi90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=RhHAdd2b; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 81F22401AE; Sun, 22 Sep 2024 11:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 81F22401AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1726998821;
	bh=w/ZWHCQc40nkBw6bes7cbk5X0VzoOhqf3DRFWJ2Sqmg=;
	h=Date:From:To:Cc:Subject:From;
	b=RhHAdd2bbk/EQe/SPNvKhztvoz4PpirZzhFpKLPGzO6Sx7L1ORicgiVLapF2eg58C
	 4TYJG/b+htKnvt4nbIEv3C0JSdzqHdYq5fuXp8wKnuj/KoMk6ttUwjxKwfi7+Rqg8X
	 Kz1XOxxsY8C+rHBvoHQ3JsjhZv1N3VYT7rkxN+RU=
Date: Sun, 22 Sep 2024 11:53:41 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Chen Ni <nichen@iscas.ac.cn>, Fabio Estevam <festevam@denx.de>,
	Frank Li <Frank.Li@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marek Vasut <marex@denx.de>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [GIT PULL REQUEST] watchdog - v6.12 release cycle.
Message-ID: <20240922095341.GA1554@www.linux-watchdog.org>
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

Please pull following watchdog changes for the v6.12 release cycle.

This series contains:
* Add Watchdog Timer driver for RZ/V2H(P)
* Add Cirrus EP93x
* Some small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit bc83b4d1f08695e85e85d36f7b803da58010161d:

  Merge tag 'bcachefs-2024-09-09' of git://evilpiepirate.org/bcachefs (2024-09-09 09:49:23 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.12-rc1

for you to fetch changes up to 134d2531ef82043e8bf219497a4f1eb8fe21a6b7:

  watchdog: Convert comma to semicolon (2024-09-17 13:41:31 +0200)

----------------------------------------------------------------
linux-watchdog 6.12-rc1 tag

----------------------------------------------------------------
Alexander Sverdlin (1):
      watchdog: imx_sc_wdt: detect if already running

Chen Ni (2):
      watchdog: iTCO_wdt: Convert comma to semicolon
      drivers: watchdog: marvell_gti: Convert comma to semicolon

Fabio Estevam (1):
      watchdog: imx2_wdt: Remove __maybe_unused notations

Frank Li (1):
      watchdog: imx7ulp_wdt: move post_rcs_wait into struct imx_wdt_hw_feature

Jonas Blixt (1):
      watchdog: imx_sc_wdt: Don't disable WDT in suspend

Lad Prabhakar (3):
      dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
      watchdog: Add Watchdog Timer driver for RZ/V2H(P)
      watchdog: rzv2h_wdt: Add missing MODULE_LICENSE tag to fix modpost error

Marek Vasut (1):
      dt-bindings: watchdog: stm32-iwdg: Document interrupt and wakeup properties

Nikita Shubin (1):
      dt-bindings: watchdog: Add Cirrus EP93x

Shen Lichuan (1):
      watchdog: Convert comma to semicolon

 .../bindings/watchdog/cirrus,ep9301-wdt.yaml       |  42 ++++
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |  17 +-
 .../bindings/watchdog/st,stm32-iwdg.yaml           |   6 +
 drivers/watchdog/Kconfig                           |   9 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/iTCO_wdt.c                        |   4 +-
 drivers/watchdog/imx2_wdt.c                        |  10 +-
 drivers/watchdog/imx7ulp_wdt.c                     |  21 +-
 drivers/watchdog/imx_sc_wdt.c                      |  46 ++--
 drivers/watchdog/marvell_gti_wdt.c                 |   4 +-
 drivers/watchdog/pm8916_wdt.c                      |   2 +-
 drivers/watchdog/rzv2h_wdt.c                       | 273 +++++++++++++++++++++
 12 files changed, 388 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml
 create mode 100644 drivers/watchdog/rzv2h_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.


