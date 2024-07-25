Return-Path: <linux-watchdog+bounces-1426-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2093C7E6
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2024 19:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DCA71C21360
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2024 17:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B9219DF64;
	Thu, 25 Jul 2024 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNs7YgoZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F124D199EB4;
	Thu, 25 Jul 2024 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721930330; cv=none; b=r1IANjE6PSuV9BCOeEWmGCWmLiOqkjyVSmvD/sQ6YzKOd1H7MWe4LoLrDcduxlsbCfnleYozII7nh29YDPhDzcEM3Lt1sO4eNQEla5P43YZbgjymQN70xb/yRTP/MzGOilee2vAxgeSznipY8p2LIm4AZwJcQTcLCoUTb8mp2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721930330; c=relaxed/simple;
	bh=EGYBpKTIl+vBjeNpw+reRLBGEh+DlIq/lDipFjYTfkE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Vh3OSDLqoYb2mVOHkLobqoqTD4Sur0V7Vg6IzI9loXaBirX5S9z9WvuYgyumzhpS3U+c+v3UUv2DiNUYzP9jCX40eYx0xiLfHPVJMv87wkOB8Y1M54FxGX+I0MszbNxWKvHbY0bXtzhmv8FAkb5zR9qskRfrBjKpK2aRTFb5Dhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNs7YgoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5167C116B1;
	Thu, 25 Jul 2024 17:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721930329;
	bh=EGYBpKTIl+vBjeNpw+reRLBGEh+DlIq/lDipFjYTfkE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BNs7YgoZeXOiClzMwx2SzyA8POv1U+WrDl3LE5lxFLq+158TY2TrCO3exaECV4dwX
	 atEuafzF5NOTHY2njCO2nXA8XapB790VFUU14b8k69VWuPnpyC8ooFfZRBEoHj4qd+
	 cqnEx0lH5vABIgCHBs3klgr3bN/haImS5GaFv9Q1uSJQxaFY4PWyzOcGJ9AufXd8uu
	 noCV52oGO/QVZ92TxVrtWyi8r4kjt4M3s/OCuX0eRvqaPZp5acjYUkP1R6KZzdpVzA
	 NG6A17Zvt+QQ+LKxmCcx249xBvus7sZPmx5YRV15aYz1Uh2PzE4YC6yQgZKGXxJq5W
	 WWXA5gCXdCXDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC4D8C43445;
	Thu, 25 Jul 2024 17:58:49 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.11 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240724115254.GA19031@www.linux-watchdog.org>
References: <20240724115254.GA19031@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240724115254.GA19031@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.11-rc1
X-PR-Tracked-Commit-Id: 63d097d46799dc6ab4d1430482cd5ab6a409c4ec
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b2eed73360dffea91ea64e8f19330c950dd42ebb
Message-Id: <172193032982.22070.16396201789383088220.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jul 2024 17:58:49 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Biju Das <biju.das.jz@bp.renesas.com>, Chen Ni <nichen@iscas.ac.cn>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Sascha Hauer <s.hauer@pengutronix.de>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 24 Jul 2024 13:52:54 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b2eed73360dffea91ea64e8f19330c950dd42ebb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

