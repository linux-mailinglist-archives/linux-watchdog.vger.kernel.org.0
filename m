Return-Path: <linux-watchdog+bounces-2076-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1937991029
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D37521C239A7
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB581ADFE2;
	Fri,  4 Oct 2024 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hpNw6klj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1103B1ADFE5
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072211; cv=none; b=Ck1g+t/QxkcI35SnWXA95n4EakgH4c6WFYS7nEWkOcRl8eO8EHofOu9BVVMRchWhMKe9P9wpear+Mu8I8ZqQ/IJyMQrmb7qRlcCpnsnEHVruCFTK8ryEFyiiLGrR2wYni1wwYKgynM4Bbzjlz4gT2GNSYlRlAfeL+QHPvahN/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072211; c=relaxed/simple;
	bh=al6r3J1XvWz+qtQauqxukHeMJBUFZaCsGtAxq/emG+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e2oQWq30ApsgBKEnNmSwzVlfrHtKllnLYwEkj1Y5iAjlYuD+HqvqMxrgslHf5IAOEIiWlOIbxns/T+bw4Zlw1uhF7U9bUKB/O9scYleol3GtyvZy2AEkP0y2v7aH18oP0Q8v1nDEGyJ6dM7WMHaQyMVdCOL4n+ZegEtz9wRNrEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hpNw6klj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=oxFvBwHLQIyYtq
	XIRO1kguuDD0F+GEZfx9tyLIEoAb8=; b=hpNw6kljb1v1clVoTIr4WT8kJxQT04
	r14NDklqofNuVRFfCG2bF5D87lDflWpt4J3czlNOfbcUmsPS7LPfM6ZbDLytgVAZ
	0o1Xdt2obQbCi49GQatRsvJs7iAng/sOtOmmecC0If/oTQRVV9ondrfpxCBTRDZ/
	CCfUhRuvFOjRz0LJWL+Le6g3Phc+JFhZhaxjdT02Sja6Art07SfCoDV1a93PUmgN
	VMM8eJQcCTalPA7rGvFZ3dkrU6xPNzUZi3sCwNkWznq6LVYH08BMix11/eAFIcPs
	Nhc7AHYrr4kH3ALgmfpK+Sl+2SmRXz5ORqS3Gc/0l4bYc88qOK/QAI9A==
Received: (qmail 3546497 invoked from network); 4 Oct 2024 22:03:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:27 +0200
X-UD-Smtp-Session: l3s3148p1@68cTKqwjTtdQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean-Marie Verdun <verdun@hpe.com>,
	linux-watchdog@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [RFC PATCH 0/9] watchdog: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:03 +0200
Message-ID: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working with the rza-driver, I noticed that the watchdog core does
not always print out errors when registering a watchdog fails. Only most
of the time. With a simple refactoring, it will always print out. We can
remove similar printouts then from drivers. This series does exactly
that. Not sure about the core change, thus still RFC. There are two more
drivers outside the 'watchdog' dir which could benefit from this change,
but I left them out for now until I know this path is acceptable.

Looking forward to comments...


Wolfram Sang (9):
  watchdog: always print when registering watchdog fails
  watchdog: da9055_wdt: don't print out if registering watchdog fails
  watchdog: hpe-wdt: don't print out if registering watchdog fails
  watchdog: iTCO_wdt: don't print out if registering watchdog fails
  watchdog: it87_wdt: don't print out if registering watchdog fails
  watchdog: octeon-wdt: don't print out if registering watchdog fails
  watchdog: rti_wdt: don't print out if registering watchdog fails
  watchdog: rza_wdt: don't print out if registering watchdog fails
  watchdog: sl28cpld_wdt: don't print out if registering watchdog fails

 drivers/watchdog/da9055_wdt.c      |  7 +------
 drivers/watchdog/gxp-wdt.c         |  4 +---
 drivers/watchdog/iTCO_wdt.c        |  4 +---
 drivers/watchdog/it87_wdt.c        |  4 +---
 drivers/watchdog/octeon-wdt-main.c |  4 +---
 drivers/watchdog/rti_wdt.c         |  4 +---
 drivers/watchdog/rza_wdt.c         |  7 +------
 drivers/watchdog/sl28cpld_wdt.c    |  4 +---
 drivers/watchdog/watchdog_core.c   | 26 +++++++++++++++++---------
 9 files changed, 25 insertions(+), 39 deletions(-)

-- 
2.45.2


