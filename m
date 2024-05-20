Return-Path: <linux-watchdog+bounces-1065-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF588CA0C0
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2024 18:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E838F1F21AF4
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2024 16:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1654B27452;
	Mon, 20 May 2024 16:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdg/tufr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43CBE57D;
	Mon, 20 May 2024 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716222828; cv=none; b=CRiotmNdcg1xnGdhEKI/f7GwkiyEIc9uHvv5Ik8pCyHaOljFlxGs7L+gtzuRTDYxIXEQ1DnXoo3qrmONqYukTNyKY3bL04FIX/v73obFR/L5vLiGWT7eTSbVEi7ITl4yPxOenELN5sOQprjfRU8RrChLYB5Nehv6jCgN9TppjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716222828; c=relaxed/simple;
	bh=IIeLtntH4flbTsHL1sGlH/ufYgcgDbGukGNwmb9Rujs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VPpOQnco9MwKSS6w49dbqUUBcvXgUFU9scd+TYbctRzOAKda2PAQuIbzNsyKmB6tCyr8v1WJ92x4HwKXirmmct9gyMKm+tKfs2ytXWBUH531O9Xhv1rZYY2h6qbSxXBm5+TSz2FJbb0ocGy+ErlHpHarppHte26KrlOrPbHKov0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdg/tufr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6812C32789;
	Mon, 20 May 2024 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716222827;
	bh=IIeLtntH4flbTsHL1sGlH/ufYgcgDbGukGNwmb9Rujs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Vdg/tufrWm2438C5ztd7uoeooioFS1JLCm5ewc/nDo1MFPz3/xUfkmS6kGdDsVRLb
	 hCimKnMidAl6+5U3feRl83eFXWjKVAle6/XBtTKABfc3Nf217lenCaslg0DmnppToO
	 s6IgT65m1IVmcKYQGKrBG3n0K590kY3ijBfT/8R9CmxY4cqnIxIEkkyDk2JDw3yS8m
	 +C1ElptbVqNscuYNdv+0+y8rnh8euCZ+iXln21uaDxOFZay9IFnpqm7rU/CbofFoKU
	 xALm6k2tqa44VLBaIbI7TBEunBc2L7rhRzXI/+ht0qpZnnN4fwvSkpF0cg7I+V+eMY
	 51derYLHooKaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD1A0C54BB1;
	Mon, 20 May 2024 16:33:47 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.10 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240520150125.GA11491@www.linux-watchdog.org>
References: <20240520150125.GA11491@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240520150125.GA11491@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.10-rc1
X-PR-Tracked-Commit-Id: c45b8cfc6d5c12fbbc4d89b24b59402df99c1ecb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a913d94eef59f6d1d907c3214f12827144bab6a5
Message-Id: <171622282776.31783.14977303179662559585.pr-tracker-bot@kernel.org>
Date: Mon, 20 May 2024 16:33:47 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Chen Ni <nichen@iscas.ac.cn>, Dawei Li <set_pte_at@outlook.com>, Duoming Zhou <duoming@zju.edu.cn>, Geert Uytterhoeven <geert+renesas@glider.be>, Judith Mendez <jm@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, Matti Vaittinen <mazziesaccount@gmail.com>, Niklas Schnelle <schnelle@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 May 2024 17:01:25 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a913d94eef59f6d1d907c3214f12827144bab6a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

