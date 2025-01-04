Return-Path: <linux-watchdog+bounces-2654-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D62A0165F
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Jan 2025 19:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7D0162D11
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Jan 2025 18:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D1E1C3F1C;
	Sat,  4 Jan 2025 18:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="UKCH+nYE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D7723CB;
	Sat,  4 Jan 2025 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736015849; cv=none; b=LuRDSpmTaGEnoTe41TzRgSwmyL6Z8W5fNCbWAY8Nmad/5Be9bl5lIMLAakAEmGp+Bcp0Xe65cP+xhYhH7Rr59J8Wrl+sbED0yRus4fxduQ05ZiyD4vwN03ERIVqmGkwS+qfbKQqWmrUo0YCSjo5A2arxOVzTdgLXREAoxfcNOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736015849; c=relaxed/simple;
	bh=978YavRrx9NtArdM/RvDSMUGwvbrTvXyTi+saLv1xcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DMMmvt5XfB8z36P9X8CO6zac/zWOniBPjQcZ0cVuwI5IDx9fcSEm50Pm+Rj2GYHMI79dGDgWolwpqc46Oc4zAG6yC+UbhYRFa4G6HMlZfo3fKaGfQ1JMU6W36PRmTqBPFPfMm1kcewdtG7gybcueXm37hDw43hwzYcu3OSdSInY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=UKCH+nYE; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id C2A4640A06; Sat,  4 Jan 2025 18:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org C2A4640A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1736013522;
	bh=978YavRrx9NtArdM/RvDSMUGwvbrTvXyTi+saLv1xcs=;
	h=Date:From:To:Cc:Subject:From;
	b=UKCH+nYEIxpm7NQoNGsbpY7ZWavrY5qKiXac8nEUvSMmDE3G64yNHfApvaVWZQFk/
	 LZn1O9tu0/324TBYt8jxs23FpWc5ydvI1Kr5DA3ggu/MojnXozBn1t5y5LCWdXGpu7
	 Glt+kmT2N3e4/cXL7EkwiAiuePNU6Idh/QJA5rU4=
Date: Sat, 4 Jan 2025 18:58:42 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: [GIT PULL REQUEST] watchdog - v6.10 release cycle.
Message-ID: <20250104175842.GA15428@www.linux-watchdog.org>
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

Please pull following watchdog changes for the v6.13 release cycle.

This series contains:
* stm32_iwdg: fix error message during driver probe

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit fc033cf25e612e840e545f8d5ad2edd6ba613ed5:

  Linux 6.13-rc5 (2024-12-29 13:15:45 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.13-rc6

for you to fetch changes up to cc0dc9e871a91aadf5b26a2d7760fb762e0d9203:

  watchdog: stm32_iwdg: fix error message during driver probe (2024-12-30 15:28:02 +0100)

----------------------------------------------------------------
linux-watchdog 6.13-rc6 tag

----------------------------------------------------------------
Clément Le Goffic (1):
      watchdog: stm32_iwdg: fix error message during driver probe

 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
----------------------------------------------------------------

Kind regards,
Wim.


