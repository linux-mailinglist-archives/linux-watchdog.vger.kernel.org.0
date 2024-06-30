Return-Path: <linux-watchdog+bounces-1208-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A5291D280
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 Jun 2024 17:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB78F1C20845
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 Jun 2024 15:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C47615383C;
	Sun, 30 Jun 2024 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0v7Y0Iw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D215383F;
	Sun, 30 Jun 2024 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719762363; cv=none; b=dOWHZ57t0ogcVeiOIho8iagWgj0bhr3w0T3xkDM8eZBlrZHsYp+Nr7D1RBgPOP0Qt0DM8yTBazjFD2B7W/YPIY8DfLm4isrEOV7fmRUuNl+SReZiUBd6hgOuphgj0BBJsx//0aNRDaDLHaOvXHe45LrMcX+VZv/dua9UfyhLjxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719762363; c=relaxed/simple;
	bh=DGaL9GzS4XlQKNaq+W/gqgj0+12C0l+HhzPNdEgYNtw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=icmajhsxceeHY4Ygti4hBa9U8A4BvbEl4yQ6V3Nn0+IofzYrz8lnMbGue81WwOF9iwlesK8HUstGlOOnknD1B6eHCGrKiHLwO9psa6DhdGJsIFLr2NKGxdON7dctn7NFcnvhg1LHdwbAQJZmYV+iKqSMInvk1Kl2STE/BYKdeSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0v7Y0Iw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7FE8C2BD10;
	Sun, 30 Jun 2024 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719762362;
	bh=DGaL9GzS4XlQKNaq+W/gqgj0+12C0l+HhzPNdEgYNtw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=g0v7Y0IwuFfcRqHXw2C5w+/b3pq92WVMAJq0c4kLz6vUPF+4q1hGp2KgFRNCL4gwW
	 buftoFmICdEVUgMwqT8iRUoxCfnBo6dRsWs/Rt5WXjh1fQ/MCmtbed40JW/3sbuIAj
	 KFyxrdakGJ5CJA38VOq1RDuFGCCyWegZ1wMXq7kQ/6WNQUxfpcNce2S+S8wfCRW5+a
	 Rt8NCUyGXi//321pz5K20SvXVrwCVZR/X6ghl4+FFNRyDJQMJwBEzlcA4IYUIJxfd8
	 eLEqkgN92th/x6jtkzaySHuWh4KGOxv735kUjGGIZiumtjlmQmXuw83gJEYkGL1HT0
	 wZvnfcMAuP6FQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE057C433A2;
	Sun, 30 Jun 2024 15:46:02 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.10 release cycle (fixes).
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240625133151.GA1554@www.linux-watchdog.org>
References: <20240625133151.GA1554@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240625133151.GA1554@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.10-rc-fixes
X-PR-Tracked-Commit-Id: acf9e67a7625367b89440855572b29c5ec19dd20
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 327fceff3b634e6f21bbe60bd1d28e41d5b1d924
Message-Id: <171976236290.1786.9447781866447775015.pr-tracker-bot@kernel.org>
Date: Sun, 30 Jun 2024 15:46:02 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>, Jeff Johnson <quic_jjohnson@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 25 Jun 2024 15:31:51 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.10-rc-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/327fceff3b634e6f21bbe60bd1d28e41d5b1d924

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

