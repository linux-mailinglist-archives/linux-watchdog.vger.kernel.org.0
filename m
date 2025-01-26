Return-Path: <linux-watchdog+bounces-2762-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8468BA1C5FC
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 02:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADB9F167CE0
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 01:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8261189912;
	Sun, 26 Jan 2025 01:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPzWejWW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF8188713;
	Sun, 26 Jan 2025 01:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737853407; cv=none; b=W/vLZ9QLSyOk9J5UoOJJUZajAI9t4Pz6BzjsCHGSthx4GIo4U1HGVV1lWrJfG2nyfnDuQhPAOVhvvvGPaq0u6VRUToAPCyoxuqB/t4yrshA57kwWt70dttBukPYdZF0KbP1Cw1z+73asF1wA0SDVkQ6rrtk+XF1ZAc+AXlXMg8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737853407; c=relaxed/simple;
	bh=nYPi/Rgm6AORZ6lVx13lEtpAS/+oRSHdmKR6EOJLZtw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=amlftLutYkcrpv7lG0+jZ023qSY/4zE/XKvmHeXcY0UcqD+QBHva1Lhnx+wOCXAh6R9EO7tehEVPjijNs6oRmIe7flpIO3tsjFtPksEGIJjMUl8kY6iGjZcTrpTR4YcPieQD8qAgwlRDwfDH4Z1xKSGm8as+rN46FxGEh/KCCpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPzWejWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBCCC4CEDF;
	Sun, 26 Jan 2025 01:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737853407;
	bh=nYPi/Rgm6AORZ6lVx13lEtpAS/+oRSHdmKR6EOJLZtw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NPzWejWWcczoLkt+61bTX97zjD1iQeXujP2yPOskym3N0jTDyQ4eFhsX6dm7NbPzt
	 RF6uYMkQQ3wMlGIxXjCO3aJ+P5Wycdr9V+cIc1fKM6/WoXYYfA8UIfQ7xmNlGie7MX
	 gk67G1N74FIKyRUYQn8jcEVolW1yn30mY9FbsszLr55OPQsbt5E+QyxYnp3gXwsHXn
	 MmDJoulDTw4HFVLtHedOLGdm+W25z5K1qf4oTeqGxMojWDXpCdlcel2FdraAsWHmlE
	 pUEiVcbXL9/GHnj5LBOoxNixtKQmyvUX+b7bxOBp85hggXWtd+HDXGS/RDCJYq08Tv
	 x9u70v9k9R6Hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFFC380AA79;
	Sun, 26 Jan 2025 01:03:53 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.10 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250124112901.GA32479@www.linux-watchdog.org>
References: <20250124112901.GA32479@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250124112901.GA32479@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.14-rc1
X-PR-Tracked-Commit-Id: b3db0b5356ff573d4e48b1306dd9a785d679f9b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eda061cccd146fcbe71051bb4aa5a8672b71216e
Message-Id: <173785343244.2645989.15367914995722820354.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jan 2025 01:03:52 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Lad Prabhakar <prabhakar.csengg@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Marcus Folkesson <marcus.folkesson@gmail.com>, Mike Crowe <mac@mcrowe.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 24 Jan 2025 12:29:01 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eda061cccd146fcbe71051bb4aa5a8672b71216e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

