Return-Path: <linux-watchdog+bounces-3947-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B188B188D7
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 23:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 142A11C86147
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 21:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CBD28EBE5;
	Fri,  1 Aug 2025 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsPcsVk4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9137728E616;
	Fri,  1 Aug 2025 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754084186; cv=none; b=AimXD+LPtMw2ZcTewTsXKKEHX7Py02ckpAOaLUz5uAiknTYt96LNCfUwBd9KY6QgnZR3qe6GtWlh8n96wC7fEog/ftB4MUNVEu0Cf4b5rO1c0oHcZUDeaeznJ/QA4Xs2ppxax7WDJ0z8OFfUPwh0K4ry26VUd3lkPIGo58FSQI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754084186; c=relaxed/simple;
	bh=J1+jMVUVLwT2y8TPoX/9YwGbXpgk9ralC/Q6d8rm7z4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fGimMtrI+AsGZmdvnwVm6XMD0qtMPCIHji9jqHF1KkJVNB6HXKSIQc5LyJ597461xqbkXxSx1SKL+H8efG925YJrh5Cn6QRA08Q5OunOxmxWWpAOx0GEQwrT6wXW4TwX6j73f9mLWwJHxSUgnZvDDulVt3oNt3FzCBfKP6x6V+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsPcsVk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF4CC4CEE7;
	Fri,  1 Aug 2025 21:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754084186;
	bh=J1+jMVUVLwT2y8TPoX/9YwGbXpgk9ralC/Q6d8rm7z4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SsPcsVk43w6sRmzLVHGMPDccngmjIrBrCuJOtsa2XmWV8wXmw2xRhxnn9qpAssVHn
	 pFH6TqCBZoAuhBlNNz2k7pI/dqOcFKIuL/v+1vbBymgXCBmuXjo2PD5N5pk7UGG6oM
	 wj8BDry67DYWrIbh5cgl/t5EEelVPXYROFIKgZh58bdD8Pmx7fZNy9EGOL5rd1X/QB
	 Snk1V76nvmOzLZ60y8ehCTjpz348//zq4CkDPxnnHWD+HI97Sv3zPNlKrUPIetehbi
	 gIzslf185MEDswdA6kkVsQ7ureyIJyDEZmE8pxkDnSVrImXfLZ5o1KBi4iLAo0WPKY
	 T9NNYLNZc4Ruw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF9E383BF56;
	Fri,  1 Aug 2025 21:36:42 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.17 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250801125410.GA25291@www.linux-watchdog.org>
References: <20250801125410.GA25291@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250801125410.GA25291@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.17-rc1
X-PR-Tracked-Commit-Id: 48defdf6b083f74a44e1f742db284960d3444aec
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 877d94c74e4c6665d2af55c0154363b43b947e60
Message-Id: <175408420155.4088284.7267031643900186592.pr-tracker-bot@kernel.org>
Date: Fri, 01 Aug 2025 21:36:41 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Aaron Plattner <aplattner@nvidia.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, Ziyan Fu <fuzy5@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 1 Aug 2025 14:54:10 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/877d94c74e4c6665d2af55c0154363b43b947e60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

