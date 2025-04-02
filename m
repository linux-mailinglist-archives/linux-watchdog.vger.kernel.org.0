Return-Path: <linux-watchdog+bounces-3187-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33AEA785F6
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 03:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F95C7A2819
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 01:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0711517D2;
	Wed,  2 Apr 2025 01:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjRx6Kwh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C5A1401C;
	Wed,  2 Apr 2025 01:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743555705; cv=none; b=lZ3PV7WveEQdphwpVPdCgMsAu1Lu7EuDSi1qfgy4olM4GiNR7yDjWdhnQqFyTV+DI3zv1EAeT+FbhiZpXoI1D3UKdxzqkvQd1O3e03hdnvv4Cgx6x4JUtRuhRQtf+vrD23jfaKQAFvGMGSd+fUqesnYds1M/mSdxE25wZQmeJP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743555705; c=relaxed/simple;
	bh=wDCZw1/rEUjbtEQ/buyMxMxErOO0Q0YsJqCv0Ge5jYM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=By8dyUd/90Uy4LC9FOd4JQpzK8RKD0yyuoq46vE/sINrOdNbbzmTafjbTKtovFn5+J5/0sIwUPC0LqwwDZrYrZP/d2SU/kvFVwPlzpNxxV2IBEDFF48KEK/rktPbLbgXLat6tZaAIFo+CBCRjkf8WUKBLUWoAhuChjPjldbF1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjRx6Kwh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34880C4CEE4;
	Wed,  2 Apr 2025 01:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743555705;
	bh=wDCZw1/rEUjbtEQ/buyMxMxErOO0Q0YsJqCv0Ge5jYM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YjRx6KwhMq0WvIk47ELpWjpyOF1k/WF0Z1g//3elteg0GhYK4m2QI8B0v4GxKojlY
	 Y5InPKdI+J5H2bLHcmJYutQPMFIJQZsW3FHrpuux9fh5QYi1dupxUaL74Yd1h1RoqW
	 BWJNomE3ZsVNUrm0WU5jKXlvXQO9vspR6liQ9yVpujOi04gkQ4c+dy8ivDkgsoBiEK
	 cosX+T09MI2AyVeysrnf8O1mHhhcnmwjcW3LEftDgSnus5CjpQqNhDbm0Iwt0voCJF
	 tZMCfcecUjDiJYLF1pWbBFKXWxe0m3qUB0ZqJmAbsMEOcAtj+GWfCE6Brjdi7aKHyC
	 qWvABy6+yx85w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E09380AAFA;
	Wed,  2 Apr 2025 01:02:23 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.15 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250330101333.GA18497@www.linux-watchdog.org>
References: <20250330101333.GA18497@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250330101333.GA18497@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.15-rc1
X-PR-Tracked-Commit-Id: 9bc64d338b0b4b2061049df8b701f9786857690e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 696c45bcc3c35486578fd741d8551865aee42915
Message-Id: <174355574186.978371.6976728017778504251.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 01:02:21 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Andre Przywara <andre.przywara@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Biju Das <biju.das.jz@bp.renesas.com>, Chen Ni <nichen@iscas.ac.cn>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Frank Li <Frank.Li@nxp.com>, Kyunghwan Seo <khwan.seo@samsung.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, Stephen Boyd <swboyd@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Mar 2025 12:13:33 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/696c45bcc3c35486578fd741d8551865aee42915

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

