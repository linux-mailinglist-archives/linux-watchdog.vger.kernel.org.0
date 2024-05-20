Return-Path: <linux-watchdog+bounces-1064-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E98C9FAA
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2024 17:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3981C210A1
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2024 15:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373C1136E10;
	Mon, 20 May 2024 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="RL5D4mYb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78C4136E26;
	Mon, 20 May 2024 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716218803; cv=none; b=iz4Kq91bgodY6Y33HNdckvVEE1qQFUbqMToyhV9V7M7bOHND/LUkGf5Eb0TiSC5IhL2a5sLSxbBz7rIVywhwnk8+/8ZxY7TYMx+xtY0oQWf7D+xT8Dt355RVs2RgP6EYemcTBzO8h1083SeCMpXomgXz3d89xjpvhHbB0RJ1eDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716218803; c=relaxed/simple;
	bh=2kPC8/7VEMwe1FMH7DLKRv/rPLNUj8M87O0aGdTrOsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOBfv0wHBQRMbAiIRr15epbSvYEuN4tetLFiD7Q9+Zp/DwGFeJv1e/bVSFxdxfDKqHArVfc3R8iYGFgIvKYBzLAPqwEsQO0Ip8pMTAA02/D21kHDB60mWlGjB9NIQ5gQ5avestKzPI0Zl+IXOaysi03ENykeJaEUIJguVJWDgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=RL5D4mYb; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 68DCA40A00; Mon, 20 May 2024 17:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 68DCA40A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1716217285;
	bh=2kPC8/7VEMwe1FMH7DLKRv/rPLNUj8M87O0aGdTrOsc=;
	h=Date:From:To:Cc:Subject:From;
	b=RL5D4mYbX2CL9lsvzQne1UoC7l2Kf+BNuEaS7NOzaGEV/r0tOo0Qodvb/9qG+px6F
	 m7VCLmIUQoQ0dHe1fyoSLPpxYtjgsNOOu6GaTyis/kJoAN/tKnnG3p5Ztsf5DPOW4S
	 WhPrSIk8v8xOh8L+ThiCxG4XM7OyivxDv3KEbmKQ=
Date: Mon, 20 May 2024 17:01:25 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Chen Ni <nichen@iscas.ac.cn>,
	Dawei Li <set_pte_at@outlook.com>,
	Duoming Zhou <duoming@zju.edu.cn>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Judith Mendez <jm@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [GIT PULL REQUEST] watchdog - v6.10 release cycle.
Message-ID: <20240520150125.GA11491@www.linux-watchdog.org>
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

Please pull following watchdog changes for the v6.10 release cycle.

This series contains:
* Add Lenovo SE10 platform Watchdog Driver
* Other small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 0bbac3facb5d6cc0171c45c9873a2dc96bea9680:

  Linux 6.9-rc4 (2024-04-14 13:38:39 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.10-rc1

for you to fetch changes up to c45b8cfc6d5c12fbbc4d89b24b59402df99c1ecb:

  watchdog: LENOVO_SE10_WDT should depend on X86 && DMI (2024-05-11 11:32:06 +0200)

----------------------------------------------------------------
linux-watchdog 6.10-rc1 tag

----------------------------------------------------------------
Chen Ni (1):
      watchdog: sa1100: Fix PTR_ERR_OR_ZERO() vs NULL check in sa1100dog_probe()

Dawei Li (1):
      watchdog/wdt-main: Use cpumask_of() to avoid cpumask var on stack

Duoming Zhou (1):
      watchdog: cpu5wdt.c: Fix use-after-free bug caused by cpu5wdt_trigger

Geert Uytterhoeven (1):
      watchdog: LENOVO_SE10_WDT should depend on X86 && DMI

Judith Mendez (1):
      watchdog: rti_wdt: Set min_hw_heartbeat_ms to accommodate a safety margin

Krzysztof Kozlowski (1):
      watchdog: mtx-1: drop driver owner assignment

Mark Pearson (1):
      watchdog: lenovo_se10_wdt: Watchdog driver for Lenovo SE10 platform

Matti Vaittinen (1):
      watchdog: bd9576: Drop "always-running" property

Niklas Schnelle (1):
      watchdog: add HAS_IOPORT dependencies

 drivers/watchdog/Kconfig           |  69 +++++----
 drivers/watchdog/Makefile          |   1 +
 drivers/watchdog/bd9576_wdt.c      |  12 +-
 drivers/watchdog/cpu5wdt.c         |   2 +-
 drivers/watchdog/lenovo_se10_wdt.c | 308 +++++++++++++++++++++++++++++++++++++
 drivers/watchdog/mtx-1_wdt.c       |   1 -
 drivers/watchdog/octeon-wdt-main.c |   6 +-
 drivers/watchdog/rti_wdt.c         |  34 ++--
 drivers/watchdog/sa1100_wdt.c      |   5 +-
 9 files changed, 370 insertions(+), 68 deletions(-)
 create mode 100644 drivers/watchdog/lenovo_se10_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.


