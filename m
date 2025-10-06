Return-Path: <linux-watchdog+bounces-4328-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D7BBE0EF
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 14:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 269984E62D6
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 12:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BFE223339;
	Mon,  6 Oct 2025 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="KkEA9hI0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728011C69D;
	Mon,  6 Oct 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754440; cv=none; b=LW/oZy1QGsomA2fBrb5wHkdNXv4sdMR6eUKIvBo2YDqXO/X1XJ07Ky19cwICohA9wu8Gl/elllr8zd1ElZZgx/bb00XSAxhkADbRbIw0shVHTuXPiU1mUCcjZNpzC/TBJ6bIObpf7uz3enknerJLTJFel2FIgWHduW8lTxcRZbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754440; c=relaxed/simple;
	bh=u6MAwDPTW+DutUODWNAyTuUiMrElceEFAXo3cyLw9Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wr9tI7We3A0Ea8k1Y2HOYekqEDKPPRISO0mQImV4+ZJ9pEdHL4i6+/1ooFD6zSfzWiVBQ/WDVTt1yXA1bNLYVNAzo8Tphk6Fy0SywameQWReIA2iSuzN6JtTNDyOcTLA+Z6mraGKvOuDUy7zz+01rfS41xf9V2DECLL2poyXwTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=KkEA9hI0; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 1344D409D1; Mon,  6 Oct 2025 13:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 1344D409D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20250313; t=1759751194;
	bh=u6MAwDPTW+DutUODWNAyTuUiMrElceEFAXo3cyLw9Ao=;
	h=Date:From:To:Cc:Subject:From;
	b=KkEA9hI0DzCpZLdQoPnjTYc5BHH6faqeMjT2/o+JTIZTZi08t7w7JNgRr1gIwneWB
	 DKZF6hGXNGSExtn9SY/ML5Hct9wK8encG1t8AsF4Rq8Gbp4AM/KQeI9EmNmiuM64YW
	 evOdA0o3s6Ho5rnufTBOowBLS1/cMXjLs1Il/sJV6BuaEzMQKGV+47mIpzNzZEmJxE
	 QTJN3huqjvk9pCk0CLWNfzWRRXw2WN/zeiAsP6aDX/X+slRhdorBfNoSWDCp9ODin6
	 r7OtzZbRiZ02+Z7F1DvxWsI3eMHhZ++Xz0/wgjWpO150U0knxTQaKoiGiuVlEb+oPn
	 zbnPS0a9LkBsQ==
Date: Mon, 6 Oct 2025 13:46:33 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerry Hoemann <jerry.hoemann@hpe.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Michael Walle <mwalle@kernel.org>,
	Sangwook Shin <sw617.shin@samsung.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [GIT PULL REQUEST] watchdog - v6.18 release cycle.
Message-ID: <20251006114633.GA23195@www.linux-watchdog.org>
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

Please pull following watchdog changes for the v6.18 release cycle.

This series contains:
* renesas,wdt: Add support for RZ/T2H and RZ/N2H
* add SMARC-sAM67 support
* Several small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit f777d1112ee597d7f7dd3ca232220873a34ad0c8:

  Merge tag 'vfs-6.17-rc6.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs (2025-09-08 07:53:01 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.18-rc1

for you to fetch changes up to c64c2a50cdd487e2270c875c1770cd55705d75ff:

  watchdog/hpwdt New maintianer (2025-09-28 14:05:58 +0200)

----------------------------------------------------------------
linux-watchdog 6.18-rc1 tag

----------------------------------------------------------------
Christophe Leroy (1):
      watchdog: mpc8xxx_wdt: Reload the watchdog timer when enabling the watchdog

Guenter Roeck (1):
      watchdog: intel_oc_wdt: Do not try to write into const memory

Jerry Hoemann (1):
      watchdog/hpwdt New maintianer

Lad Prabhakar (6):
      dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
      watchdog: rzv2h: Obtain clock-divider and timeout values from OF match data
      watchdog: rzv2h: Make "oscclk" and reset controller optional
      watchdog: rzv2h: Add support for configurable count clock source
      watchdog: rzv2h: Add support for RZ/T2H
      watchdog: rzv2h: Improve error strings and add newlines

Michael Walle (1):
      dt-bindings: watchdog: add SMARC-sAM67 support

Sangwook Shin (5):
      watchdog: s3c2410_wdt: Replace hardcoded values with macro definitions
      watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
      watchdog: s3c2410_wdt: Increase max timeout value of watchdog
      watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_CNT
      watchdog: s3c2410_wdt: exynosautov9: Enable supported features

Wolfram Sang (3):
      watchdog: rzg2l_wdt: don't print superfluous errors
      watchdog: rzv2h_wdt: don't print superfluous errors
      watchdog: visconti: don't print superfluous errors

 .../bindings/watchdog/kontron,sl28cpld-wdt.yaml    |   7 +-
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |  36 ++++-
 MAINTAINERS                                        |   2 +-
 drivers/watchdog/intel_oc_wdt.c                    |   8 +-
 drivers/watchdog/mpc8xxx_wdt.c                     |   2 +
 drivers/watchdog/rzg2l_wdt.c                       |   4 +-
 drivers/watchdog/rzv2h_wdt.c                       | 150 ++++++++++++++++++---
 drivers/watchdog/s3c2410_wdt.c                     |  46 +++++--
 drivers/watchdog/visconti_wdt.c                    |   5 +-
 9 files changed, 212 insertions(+), 48 deletions(-)
----------------------------------------------------------------

Kind regards,
Wim.


