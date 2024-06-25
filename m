Return-Path: <linux-watchdog+bounces-1187-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CBC9169BC
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Jun 2024 16:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5318E1F27425
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Jun 2024 14:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC1F1509A5;
	Tue, 25 Jun 2024 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="vxvjoZwt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B67ABE71;
	Tue, 25 Jun 2024 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719324037; cv=none; b=n7WnN4Y83xC/MQ4RUbtzQbQ3qXV9WRXfaNfJQlCKCs2rNIpWEhwOMLw60kScppYs8oo9bpU3T6SJgoyOXoAOxykJsvUEBInpl8mxJdzagqjTuqj4vlA/NxtGgbBYpUugWc5oBzLeEaL5U7QJidMwlqgsTV8SrfErpy6q/3PGkgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719324037; c=relaxed/simple;
	bh=Rb3KOLeLTiXVITDd5CHEUeEmlO2BzhhQejT8VB/17/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nhrDiXlAQ8ZS5Kf39gUz9aezbW0eEsUJamGSbIaT3MujZW3NIJM2e3gb4c4CS4LzP9+n0c/TuxZGusAGnM7DtDaSUSEKyTVUgpCf82FbLvDs/J3E3ADaV46E+3WIRnzIHxUOSab0+D5M9dUTTiaxrICyqjDHwBIgM0GeWbteknw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=vxvjoZwt; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 5640B401AE; Tue, 25 Jun 2024 15:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 5640B401AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1719322311;
	bh=Rb3KOLeLTiXVITDd5CHEUeEmlO2BzhhQejT8VB/17/I=;
	h=Date:From:To:Cc:Subject:From;
	b=vxvjoZwtJmvfDoK0x1VBzI4in6ZIWSRRb8uw/ELktZKw8k8JFt78HLx+Hb9g0JmpH
	 QscUMwiio6j4BtmBktY+G5LpCuAV4PruZ2q6mO/FPs7f95WfG6imok9ETggKd0Mj4P
	 Rs/R6Vlo5lYkkJPSYaCkxxllWnb5//lK/9zobOzI=
Date: Tue, 25 Jun 2024 15:31:51 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [GIT PULL REQUEST] watchdog - v6.10 release cycle (fixes).
Message-ID: <20240625133151.GA1554@www.linux-watchdog.org>
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
* lenovo_se10_wdt: add HAS_IOPORT dependency
* add missing MODULE_DESCRIPTION() macros

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.10-rc-fixes

for you to fetch changes up to acf9e67a7625367b89440855572b29c5ec19dd20:

  watchdog: add missing MODULE_DESCRIPTION() macros (2024-06-15 12:49:57 +0200)

----------------------------------------------------------------
linux-watchdog 6.10-rc-fixes tag

----------------------------------------------------------------
Arnd Bergmann (1):
      watchdog: lenovo_se10_wdt: add HAS_IOPORT dependency

Jeff Johnson (1):
      watchdog: add missing MODULE_DESCRIPTION() macros

 drivers/watchdog/Kconfig           | 1 +
 drivers/watchdog/menz69_wdt.c      | 1 +
 drivers/watchdog/omap_wdt.c        | 1 +
 drivers/watchdog/simatic-ipc-wdt.c | 1 +
 drivers/watchdog/ts4800_wdt.c      | 1 +
 drivers/watchdog/twl4030_wdt.c     | 1 +
 6 files changed, 6 insertions(+)
----------------------------------------------------------------

Kind regards,
Wim.


