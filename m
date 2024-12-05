Return-Path: <linux-watchdog+bounces-2505-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 875699E5E29
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Dec 2024 19:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CCD31882A11
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Dec 2024 18:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C945226EEE;
	Thu,  5 Dec 2024 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bf+lT9dQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25233221461;
	Thu,  5 Dec 2024 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733422887; cv=none; b=iXY3SbKg8ZNR3fV2bFQuG3PlbpcFU8QtMUQR1TjzVrOdoNrAByNKgnzRpmBrJpknmUhMLAXgLdfGOGRASRH0lSh0FzNTPSI7tPDbufdc6t0xldo/9G0ZQa+Fl8u7ngYLFN7wVL+Q1t/oALqM71FhcbIEMHc1rVAbfW07NgLBnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733422887; c=relaxed/simple;
	bh=PJZVeD+ssPQp/USs52Rsa/YED330gBkVqJHrAaCyIwM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bf+sCtRIeOtJLyGgw15U95Ub+sYXTZ34tmkjz0tHz62cnH4mjeyoK0d/gqcUBqt95SURslHK/CBDsfHMWCFtOs8u4P2Gx8v5r+VUi1dCXR90WB7wvlgRWh+8ZJ8jFRMBRn8nNZbsfa9ewyltEQH1KSGMnGkNcZQv/t05bDvD3XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bf+lT9dQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0775C4CED1;
	Thu,  5 Dec 2024 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733422887;
	bh=PJZVeD+ssPQp/USs52Rsa/YED330gBkVqJHrAaCyIwM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Bf+lT9dQoiVJkmFYLM2ozTpwSGQVXH9Kv4MBSCV0h25tkrZs4ydDt/yX/EifT6RA8
	 ak7hL2DLeVgw6I6q48jo5eitPWiRa2jCacvhk436XY0o2LEBpRIhhkTmVzu8DMmzSG
	 3tcB0TK2ybuYUbsH4TfW5cb+aucyeSN0CTcpMmscgj501jLubv5Hy7iK1CmYGlT9ty
	 DfaGyknvkL+kDfvBKVeMcUh5lxTMn/LdKVhfLNFBZ+T8vDqxSpRqg2V9pmO7fakm3S
	 p70Ej6uTYifjQ6+Drwg8v1YYQDdikM8az7yGCVJio2P+F4TysTPUoTN51Pd2LZqCht
	 2vK2BQ4+FclzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBD72380A951;
	Thu,  5 Dec 2024 18:21:42 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.13 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241202181849.GA5357@www.linux-watchdog.org>
References: <20241202181849.GA5357@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241202181849.GA5357@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.13-rc1
X-PR-Tracked-Commit-Id: 4962ee045d8f06638714d801ab0fb72f89c16690
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42d52acfb10cfc53139a1139e1c401a52c3f924c
Message-Id: <173342290164.2016621.8697383979949097855.pr-tracker-bot@kernel.org>
Date: Thu, 05 Dec 2024 18:21:41 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, Animesh Agarwal <animeshagarwal28@gmail.com>, Byoungtae Cho <bt.cho@samsung.com>, Christian Marangi <ansuelsmth@gmail.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Colin Ian King <colin.i.king@gmail.com>, Fabio Estevam <festevam@denx.de>, Harini T <harini.t@amd.com>, James Hilliard <james.hilliard1@gmail.com>, Jean Delvare <jdelvare@suse.de>, lijuang <quic_lijuang@quicinc.com>, Marek Vasut <marex@denx.de>, Nick Chan <towinchenmi@gmail.com>, Oleksandr Ocheretnyi <oocheret@cisco.com>, Peter Griffin <peter.griffin@linaro.org>, Rosen Penev <rosenp@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Xingyu Wu <xingyu.wu@star
 fivetech.com>, Xin Liu <quic_liuxin@quicinc.com>, Yan Zhen <yanzhen@vivo.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 2 Dec 2024 19:18:49 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42d52acfb10cfc53139a1139e1c401a52c3f924c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

