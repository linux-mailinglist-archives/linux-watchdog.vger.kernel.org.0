Return-Path: <linux-watchdog+bounces-3599-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FEAAC9F47
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Jun 2025 18:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F9571747F7
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Jun 2025 16:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69241F9EC0;
	Sun,  1 Jun 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPlu6OG7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5761EF38E;
	Sun,  1 Jun 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748793917; cv=none; b=GgA4MTyFOK+f2nSlCmSkIz6/HKAYtTKlHbJFjj9ZpVce7fWRIEmhNfPTgIDPGS1rbPdn0EolFkgDGR5wPLj1qXt3BhYpjTfs5eg7vsvZklFoVpzz0xzhndnZHxELOsffZo0CC8WRRJ2sacg1jkv2F3ki1X6ob+q8fWK5q147U20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748793917; c=relaxed/simple;
	bh=ian1KcyTAW2sh2M3PcioRz3ECkzQ3T5m+5eQ2TnuKWA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Keji0IhEp8+THtIwE1hKexgTRDifi94H06Tb0krFO5vmf43nkcUbHQil0J8iYiPW98+YidZChLzRgLxvRYNgZAxOkebCrtGg1pRG27T1TDC86eJxEYSxhX4Lo5ypv6Og9NtFmb53mYqAG+AY0NzD7nym5NHnmsEzi1ZM+SoUuvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPlu6OG7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4FEC4CEE7;
	Sun,  1 Jun 2025 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748793917;
	bh=ian1KcyTAW2sh2M3PcioRz3ECkzQ3T5m+5eQ2TnuKWA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DPlu6OG7215QpXeu2iHKiT+7etmsDwu4bMnBITpKCZXbNEWwB75F3A9Sq6wBrpeC4
	 Ft0zKOiMM59xDZludm0LO0DyMEqq53BlAdtMDqmS9EK1u9A9hCfekrUHr8A7sv2dFo
	 VA0vebA8OXQJGKVJRDsKVMNh4vQmPTSWvsgUShVAh3IQ61YviCL5jBQrF5lBHUWVLv
	 t8o1O1CD8j2fZTYSUXIo4TLF1Lh3aEEIraPJPer48sPUYlmDvpJwQfW0VgvJOdUHsU
	 PYvB1RRR9tt0X4UfdABdqoqcWi8pGbgAFsIYiPc1MuuwsTOvSGfTvlvz+HWNxUJ/I7
	 lduD0juWS+F4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F05380AA7C;
	Sun,  1 Jun 2025 16:05:51 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.16 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250601112900.GA6378@www.linux-watchdog.org>
References: <20250601112900.GA6378@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250601112900.GA6378@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.16-rc1
X-PR-Tracked-Commit-Id: 158f9f2f71523bab787f4fa7a7a1f390524350ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb1556ec94647060c6b52bf434b9fd824724a6f4
Message-Id: <174879395005.436212.3560969600818646414.pr-tracker-bot@kernel.org>
Date: Sun, 01 Jun 2025 16:05:50 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Antonio Borneo <antonio.borneo@foss.st.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Diogo Ivo <diogo.ivo@siemens.com>, Florian Klink <flokli@flokli.de>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Henry Martin <bsdhenrymartin@gmail.com>, Igor Belwon <igor.belwon@mentallysanemainliners.org>, Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marcus Folkesson <marcus.folkesson@gmail.com>, Thomas Richard <thomas.richard@bootlin.com>, Ziyan Fu <fuzy5@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 1 Jun 2025 13:29:00 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb1556ec94647060c6b52bf434b9fd824724a6f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

