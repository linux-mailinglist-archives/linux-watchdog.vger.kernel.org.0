Return-Path: <linux-watchdog+bounces-2752-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28AA1B55D
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 13:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B05507A48FD
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 12:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910A921A424;
	Fri, 24 Jan 2025 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="GI9axznC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8811D5CF5;
	Fri, 24 Jan 2025 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737720687; cv=none; b=g62OJffI/LgYUGhM8D0y+M1fCaaPZEM0mL6+BZOlmMI9JAgTaxRhrBDJd+BZHiVKHKTP+cXjF1GHE43VC4t7wQo9mU70334gtxwKO8lWreQHgw6aydQ/JtS0mK9ZptSdwtSHLRMqHenu1hsLepCbw29YZ6zULDwGPR7BfQhp45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737720687; c=relaxed/simple;
	bh=JJ2KJcZYOFXJH0vnGwh17wXGaQ73HjsfObiARFj3ALY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rcrJQ30qjEZ6orcXTlr31JjG19UU5r9aKFbD2XL1vtAhHylJnMEVESLW5HZ0nGBHyJqYJ2cm2Q3B7CZlHKNtfv1N2mJD9UGek1oua69c7835lxj4BbF4pJOGnuzHyBIwb1nmKn52rS8UUCCjc/IooasF//5Df9nryuN9alzBD3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=GI9axznC; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id D096C409FE; Fri, 24 Jan 2025 12:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org D096C409FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1737718141;
	bh=JJ2KJcZYOFXJH0vnGwh17wXGaQ73HjsfObiARFj3ALY=;
	h=Date:From:To:Cc:Subject:From;
	b=GI9axznCKl3pI/5qxrsJ/FRLglNOziTqEWFpcq1n+ApCfa2VfEejmgbbtvL+ZYOD4
	 DUvbg8m8FDANUVfIEtVTRXKPK8U21WaqdGdhvg4mMwNuk0ZDIfxWkwcliDy95T+ZGk
	 /Tj3BPm3P9dkufVem7lhuMbwXl9SskPAJp9mV010=
Date: Fri, 24 Jan 2025 12:29:01 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Mike Crowe <mac@mcrowe.com>
Subject: [GIT PULL REQUEST] watchdog - v6.10 release cycle.
Message-ID: <20250124112901.GA32479@www.linux-watchdog.org>
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
* Add Qualcomm IPQ5424
* da9052_wdt: add support for bootstatus bits
* Other small fixes and improvements.

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.14-rc1

for you to fetch changes up to b3db0b5356ff573d4e48b1306dd9a785d679f9b0:

  dt-bindings: watchdog: Document Qualcomm IPQ5424 (2025-01-06 19:38:08 +0100)

----------------------------------------------------------------
linux-watchdog 6.14-rc1 tag

----------------------------------------------------------------
Alexander Sverdlin (1):
      watchdog: rti: Fix off-by-one in heartbeat recovery

Joe Hattori (1):
      watchdog: rti_wdt: Fix an OF node leak in rti_wdt_probe()

Lad Prabhakar (2):
      watchdog: rzv2h_wdt: Use local `dev` pointer in probe
      watchdog: sp805_wdt: Drop documentation of non-existent `status` member

Luca Ceresoli (1):
      watchdog: max77620: fix excess field in kerneldoc

Manikanta Mylavarapu (1):
      dt-bindings: watchdog: Document Qualcomm IPQ5424

Marcus Folkesson (1):
      watchdog: da9052_wdt: add support for bootstatus bits

Mike Crowe (1):
      watchdog: sp805: Report correct timeleft at maximum

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml |  1 +
 drivers/watchdog/da9052_wdt.c                            | 13 ++++++++++++-
 drivers/watchdog/max77620_wdt.c                          |  1 -
 drivers/watchdog/rti_wdt.c                               |  4 +++-
 drivers/watchdog/rzv2h_wdt.c                             | 16 ++++++++--------
 drivers/watchdog/sp805_wdt.c                             |  3 +--
 6 files changed, 25 insertions(+), 13 deletions(-)
----------------------------------------------------------------

Kind regards,
Wim.


