Return-Path: <linux-watchdog+bounces-3941-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C359B182AA
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 15:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA30587B53
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 13:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523382E40B;
	Fri,  1 Aug 2025 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="yVW7+rlV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68E28F49;
	Fri,  1 Aug 2025 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754055992; cv=none; b=AHFVzHWFlGhy+TvJYZi4pdzZX+2M+5Y65LWGJeqk33Y33srFh6FIf62Qhqm1OHQj/UIOMZEWzRgWHPiE6X6sdH7s4svIzv5XHN+7zff2Oy6aySkxRBLtD+b+4aCAps0dRPlDF5XeEScpnWVJQAIgfCL4rzUUeRTO5K09qC63Vig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754055992; c=relaxed/simple;
	bh=MifSY8tRIAg1qFUULhDhX2OU31xcFDWcCK4ISt43qmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPBI5BwT32kR1KoOvgjKHMlgAIr+3aUkvXnf10fa5RRsH12kic5jNeKVQdkyWftHxoqTaN3g2pf/DCXEFtv9lpvYeIGtrZrc7PuOc7qVXtSvhBhcDc9EkpVXkOOW9emPHPO626s6AQOFAiy8ExZwaFdGXn1q1LGxyJdvkAE+J3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=yVW7+rlV; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 9913E40A0A; Fri,  1 Aug 2025 14:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 9913E40A0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20250313; t=1754052850;
	bh=MifSY8tRIAg1qFUULhDhX2OU31xcFDWcCK4ISt43qmI=;
	h=Date:From:To:Cc:Subject:From;
	b=yVW7+rlVjkwtuPwUlCy5K35O1MdxjHmt10XO5JDF2ixxbV9AJwqqc4MiziTKvN8lO
	 +6dCHzCRnATMUEsNzW+8NMQUlfP7f2ukZHGiXE82ZDK0cPLdqowOjnOrE3PA7WJ14j
	 O22sF2pyHlsc74QgYrv2V0MxcrasxZkFO1REURyVgzoovZfKUfIISnjxmJ1BAdW6nd
	 kvstkYaMuS+VrOfz0gQk16px39DRr/EJjW7FMN+jksgn3rf3lN5hcsNwRfBMiQzvXj
	 76iWM+igrP5qM+jy/bXsjBsiCTCGmUMyQ1KUq1ojc/6U86rvFXETzf2JU6M0gmY5NW
	 qRHRMQyTmt9+Q==
Date: Fri, 1 Aug 2025 14:54:10 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aaron Plattner <aplattner@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Ziyan Fu <fuzy5@lenovo.com>
Subject: [GIT PULL REQUEST] watchdog - v6.17 release cycle.
Message-ID: <20250801125410.GA25291@www.linux-watchdog.org>
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

Please pull following watchdog changes for the v6.17 release cycle.

This series contains:
* sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition
* Various improvements and fixes

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:

  Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.17-rc1

for you to fetch changes up to 48defdf6b083f74a44e1f742db284960d3444aec:

  watchdog: sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition (2025-07-28 12:07:08 +0200)

----------------------------------------------------------------
linux-watchdog 6.17-rc1 tag

----------------------------------------------------------------
Aaron Plattner (1):
      watchdog: sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition

Andy Shevchenko (2):
      watchdog: it87_wdt: Don't use "proxy" headers
      watchdog: Don't use "proxy" headers

Dan Carpenter (1):
      watchdog: ziirave_wdt: check record length in ziirave_firm_verify()

Frank Li (1):
      dt-bindings: watchdog: nxp,pnx4008-wdt: allow clocks property

Geert Uytterhoeven (1):
      watchdog: renesas_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Rob Herring (Arm) (1):
      watchdog: rti_wdt: Use of_reserved_mem_region_to_resource() for "memory-region"

Sebastian Reichel (1):
      watchdog: dw_wdt: Fix default timeout

Ziyan Fu (1):
      watchdog: iTCO_wdt: Report error if timeout configuration fails

 .../bindings/watchdog/nxp,pnx4008-wdt.yaml         |  3 ++
 drivers/watchdog/dw_wdt.c                          |  2 +
 drivers/watchdog/iTCO_wdt.c                        |  6 ++-
 drivers/watchdog/it87_wdt.c                        |  4 +-
 drivers/watchdog/renesas_wdt.c                     |  8 ++--
 drivers/watchdog/rti_wdt.c                         | 14 ++----
 drivers/watchdog/sbsa_gwdt.c                       | 50 ++++++++++++++++++++--
 drivers/watchdog/watchdog_core.h                   |  8 +++-
 drivers/watchdog/watchdog_pretimeout.c             |  2 +
 drivers/watchdog/ziirave_wdt.c                     |  3 ++
 include/linux/watchdog.h                           | 12 ++++--
 11 files changed, 87 insertions(+), 25 deletions(-)
----------------------------------------------------------------

Kind regards,
Wim.


