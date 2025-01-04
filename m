Return-Path: <linux-watchdog+bounces-2655-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75424A0167B
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Jan 2025 20:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 271A67A011C
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Jan 2025 19:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A081A8F61;
	Sat,  4 Jan 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afXA+zGV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAE1BC3F;
	Sat,  4 Jan 2025 19:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736017542; cv=none; b=IL/JfbDnaX8L+g4LR1IJ5ljM+nl3tEEvrlM+ihiA3Awfcb9eCaECH86PyDmtt8jszBez5bIK7h6u8uDIOnkrOfrub2dSMk44m2e7Z1dAUrmYVCSz2DHVZljSWYtKkXftV7JasK6dRPw/Xt5NWISkJM8h3PepYe+NLvylmou/ogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736017542; c=relaxed/simple;
	bh=KKyrHjawuVXvkdaDpwqwueEw5yb9fLXqwBKqhXo/TL0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HBgwyHCpmtPXWrwCDc0gDAd0rMJaqqd6SCRBfRiBSRIwyYDpooHTnniLG5YMc78DB8l5UEQzL3YtXYFMzvjkyVOlzs+eU8VWz2dLaQcX8juT0e+tY05zXU31YnJDsMWHxa5JROg6jKrSFzqO3gA3DorTJ4ZhkCHeeR2oxWAYpAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afXA+zGV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056A7C4CED1;
	Sat,  4 Jan 2025 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736017540;
	bh=KKyrHjawuVXvkdaDpwqwueEw5yb9fLXqwBKqhXo/TL0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=afXA+zGVnm2S86PhgLES5nJBb5OPxJ+cHxNexFM5RUpk3yrbV8LgSBvvEnu4PKAtu
	 sjbYE7Mi42pNNqK3dWulcGE8y3V1dkCTxA8vB/eEr+2LvqacahSj3O3mT+9zrkEAS6
	 INgUl/DArq6LkEsiNlSKFqtDm7/VFCI9h9S3ucv6P3CX0pHB7t2BnPOJypEOqNQws8
	 RSnTYYm6lyPP4zJhfk7fCZMc4OtkLTP88PCz4Wu+MiXdXY+qBkaR/gxoM4x3Q479Y9
	 c5Tpgt87czZKQCJQig9yyVVcFp89t4CGI0N1BfJ4jGjfc1AZSaqCtaHtQSyTvZS8hk
	 v66ZozVbIkW5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2A9380A96F;
	Sat,  4 Jan 2025 19:06:01 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.10 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250104175842.GA15428@www.linux-watchdog.org>
References: <20250104175842.GA15428@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250104175842.GA15428@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.13-rc6
X-PR-Tracked-Commit-Id: cc0dc9e871a91aadf5b26a2d7760fb762e0d9203
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ab75170520d4964f3acf8bb1f91d34cbc650688e
Message-Id: <173601756063.2486886.1061939975743399707.pr-tracker-bot@kernel.org>
Date: Sat, 04 Jan 2025 19:06:00 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 4 Jan 2025 18:58:42 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.13-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ab75170520d4964f3acf8bb1f91d34cbc650688e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

