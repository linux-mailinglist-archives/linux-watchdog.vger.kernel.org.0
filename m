Return-Path: <linux-watchdog+bounces-4333-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3CBBEF5E
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 20:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50A6E3C2261
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 18:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F432D3EF6;
	Mon,  6 Oct 2025 18:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPtkAnN5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6D02DCF50;
	Mon,  6 Oct 2025 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775348; cv=none; b=m4dytb0A8kJozqIqjT21/dk7hloJtW/cSjz9XHiDqqVE0WG87KN2FuDkb2jHWVmts0l6tcoIf9LQXIY4pBp8G2/a1q91fnFyylkFC6WP9fom07nRT2wwsSD2AYZewy57weZiWSzN/wxBUMoo2iVMg1thOKO4VYvWrdLrgl/aETo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775348; c=relaxed/simple;
	bh=HsDyti+BQrsZrm1M2RuoDt1scR3uM6AAuG7ETbts+cA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XUAcQ5v0yT/WIycwFTpKg7FsUoQuh9rmQV1wYDhwX0AESFI/8m7vCy7mHqKrbeAKEZWEmvUFZRjXKK6FRFrvAVTX+L5U75DG+i23Dcxp5ofo2KwxkQ4cKRTngVSZ/nZeSTPbd6B916pJg/448rZOs9R9vPAmTuUD8uNCKybvvtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPtkAnN5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7BBC4CEF7;
	Mon,  6 Oct 2025 18:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759775347;
	bh=HsDyti+BQrsZrm1M2RuoDt1scR3uM6AAuG7ETbts+cA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tPtkAnN5dWm2yPXBm+OwS4vePr+3omeLhzHshexLpdYUFCPZgYuJWxnDw0JS6ChuX
	 0fWMImAr3PQbDoXvir6F6qxdS2o3bmcCnFGPbb+J5ZYGbQfxtRDFav+Ts1/OS0PXGr
	 S/4MDEVxmiS5u3foGwEagQlI7zEHfINTB6IFVXdWkQWIfH8UsZtU+4AnMjElrrLEON
	 8uQPST/Ypf5lNu/EQdQ7Uw68bpWgQVRXAg5GypmcvHcBaHWdXlmAvTHoDTy1NoHLU8
	 k2huatRMUvVUTqVDZMWuJAAROlZcUtOAGFMdeqQ9d07Xm4ZmY6lnLlZshWPC6AY5BP
	 CYxFKOXs3AU2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE26D39D0C1A;
	Mon,  6 Oct 2025 18:28:58 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.18 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251006114633.GA23195@www.linux-watchdog.org>
References: <20251006114633.GA23195@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251006114633.GA23195@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.18-rc1
X-PR-Tracked-Commit-Id: c64c2a50cdd487e2270c875c1770cd55705d75ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 169c9d06a2656772285d3dd2c387e338b2e2b915
Message-Id: <175977533734.1510490.6742187347618615887.pr-tracker-bot@kernel.org>
Date: Mon, 06 Oct 2025 18:28:57 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jerry Hoemann <jerry.hoemann@hpe.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Michael Walle <mwalle@kernel.org>, Sangwook Shin <sw617.shin@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 6 Oct 2025 13:46:33 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/169c9d06a2656772285d3dd2c387e338b2e2b915

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

