Return-Path: <linux-watchdog+bounces-1422-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC093B0DF
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2024 14:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84FAFB21702
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2024 12:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E428157489;
	Wed, 24 Jul 2024 12:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="u4jp/u9j"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655D5155740;
	Wed, 24 Jul 2024 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721823272; cv=none; b=M1HhSStc4iqAlBWhphfB92C94t42EAk8GCq7I6iq4g5kxwlG8WTM0TQEEJWP0MuwrcYznJ+Im1rb1v6xVCLOn2tAwz6msrqRTol5FSSEYh+L1SY4/PLIrkFV0yPZ0IS9VFbDmXAdmixfSYb1uty4G/AIsn1aOXbNlTo7RBWGbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721823272; c=relaxed/simple;
	bh=xmgN7D/hlJ4G3cTmV/7yO3RBYg43xuFNUEG6p+7+jOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQpl5623lk1EXd5v/2fZt/B8+SIiNeQ8slf4C8yrLvdoX+lG/BMysqKYpPEGXsdSmA/0oTKH886VDj/DsFa93CkHSDX1mrKOkhfgleo37+CRf1NzjEnw6ksM/iBwfhaOPcXTfG90Ao10ZQju9vj6W4pQ5LNTfM+RT6p8iULy2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=u4jp/u9j; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 8A116409F1; Wed, 24 Jul 2024 13:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 8A116409F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1721821974;
	bh=xmgN7D/hlJ4G3cTmV/7yO3RBYg43xuFNUEG6p+7+jOI=;
	h=Date:From:To:Cc:Subject:From;
	b=u4jp/u9jTfh1K7yoUgNtCCTWiusKZ8kO7QyLnmrn8QtT+hV4M0aFuAOy2Akdiw696
	 5EW9lH+t4Xw/egjdcqBek8bz4b9ZwbdMrjrzPsNkxWc8i1Y0//Qk5aq6+eCVFDAvu4
	 U3qKKjOcZ0yxNA28UGhYLKVZvjcB8AIZXxiXRhZs=
Date: Wed, 24 Jul 2024 13:52:54 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Biju Das <biju.das.jz@bp.renesas.com>, Chen Ni <nichen@iscas.ac.cn>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: [GIT PULL REQUEST] watchdog - v6.11 release cycle.
Message-ID: <20240724115254.GA19031@www.linux-watchdog.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Linus,

On this sad day where the belgian linux community said goodbye to P2:
Please pull following watchdog changes for the v6.11 release cycle.

This series contains:
* Make watchdog_class const
* reworking of the rzg2l_wdt driver
* Other small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.11-rc1

for you to fetch changes up to 63d097d46799dc6ab4d1430482cd5ab6a409c4ec:

  dt-bindings: watchdog: dlg,da9062-watchdog: Drop blank space (2024-07-18 20:35:41 +0200)

----------------------------------------------------------------
linux-watchdog 6.11-rc1 tag

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: watchdog: dlg,da9062-watchdog: Drop blank space

Chen Ni (3):
      watchdog: starfive: Add missing clk_disable_unprepare()
      watchdog: lenovo_se10_wdt: Convert comma to semicolon
      watchdog: rzn1: Convert comma to semicolon

Claudiu Beznea (9):
      watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and ARCH_R9A09G011
      watchdog: rzg2l_wdt: Make the driver depend on PM
      watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
      watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
      watchdog: rzg2l_wdt: Remove reset de-assert from probe
      watchdog: rzg2l_wdt: Remove comparison with zero
      watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
      watchdog: rzg2l_wdt: Add suspend/resume support
      dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support

Sascha Hauer (1):
      watchdog: imx7ulp_wdt: keep already running watchdog enabled

Thomas Weiﬂschuh (1):
      watchdog: Make watchdog_class const

 .../bindings/watchdog/dlg,da9062-watchdog.yaml     |   2 +-
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |   1 +
 drivers/watchdog/Kconfig                           |   3 +-
 drivers/watchdog/imx7ulp_wdt.c                     |   5 +
 drivers/watchdog/lenovo_se10_wdt.c                 |   4 +-
 drivers/watchdog/rzg2l_wdt.c                       | 113 ++++++++++++---------
 drivers/watchdog/rzn1_wdt.c                        |   6 +-
 drivers/watchdog/starfive-wdt.c                    |   4 +-
 drivers/watchdog/watchdog_dev.c                    |   2 +-
 9 files changed, 81 insertions(+), 59 deletions(-)
----------------------------------------------------------------

Kind regards,
Wim.


