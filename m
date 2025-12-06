Return-Path: <linux-watchdog+bounces-4653-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE2CCAACBE
	for <lists+linux-watchdog@lfdr.de>; Sat, 06 Dec 2025 20:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 919BB31365D7
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Dec 2025 19:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52A8302779;
	Sat,  6 Dec 2025 19:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bfv80AIg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAAC3019BE;
	Sat,  6 Dec 2025 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765048049; cv=none; b=Q3f+Qf1aAypK9OFM3XQfqRMG6rHmMUh3PMbraC/9PJkNLZT3czihPMW3vUYHjTF3RogdWursnX3lMyFbiXPSP0lH6e2b99wTXJe5TPkoArxWFxL2xHl7AY4k7iDVl/Qhy+CSyocJlp8KwCJFe6nzIXnjoDydxztFAj85GUL+BS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765048049; c=relaxed/simple;
	bh=nk+6lOdDxFTGbSzDTxAcrNsDuGwoYCnicGb/pCjD9Y8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Q5TxatAhQWnB0MiGGJ8oZANXl0xRzB4LZoFqc+yWuAioyuXGSkK28BQ2p+xfn6B+AGiF6EaIus72AZN9KSo8JR7vOhnDXJ2s6EkVROlofJ9fXFkSJMWzq5sRWycbCKxrpD0x4o/QuIv1RfiM7KOkaRS/su21sllR/18WouZvBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bfv80AIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7711C4CEF5;
	Sat,  6 Dec 2025 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765048048;
	bh=nk+6lOdDxFTGbSzDTxAcrNsDuGwoYCnicGb/pCjD9Y8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Bfv80AIgxBucJYn/OsYlDqMMmTBIGxLRHrZlD+LZBY/dHOQSxSmpdJLwjHsDXI8qU
	 ETY3lrqsNcu1anTxoTk5kbvc2DmdphY++VJEIv1Qv9l2yy/ObvSRhxVW1iXbdWiHAD
	 S736JyeBBd3N50y2YgzcN7j+2c1fgE098kyaKrSw/ez4ZPzaDwObQy6JCx2vjF1rW6
	 uj+BAGfnG0EMpncM1QhRNFdtHw/FVl0cZik3ByGXd8f6vhhRJ+Dx2pDy2oyEB3D4bp
	 kJoENnAC+tZBK+d2PeuzCsYMfjjPjcOTjgnca9phKEKEoSIjrPkDo9BCThcqsJDVPr
	 YGFgUArnOb97Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2E683808200;
	Sat,  6 Dec 2025 19:04:26 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.19 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251206111338.GA4014@www.linux-watchdog.org>
References: <20251206111338.GA4014@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251206111338.GA4014@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.19-rc1
X-PR-Tracked-Commit-Id: 5bcc5786a0cfa9249ccbe539833040a6285d0de3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fbff94967958e46f7404b2dfbcf3b19e96aaaae2
Message-Id: <176504786572.2170003.1968226829444190752.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 19:04:25 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Aleksander Jan Bajkowski <olek2@wp.pl>, Binbin Zhou <zhoubinbin@loongson.cn>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Christian Marangi <ansuelsmth@gmail.com>, Haotian Zhang <vulab@iscas.ac.cn>, Heiko Stuebner <heiko@sntech.de>, Jack Hsu <jh.hsu@mediatek.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Li Qiang <liqiang01@kylinos.cn>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Zoe Gates <zoe@zeocities.dev>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 6 Dec 2025 12:13:38 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fbff94967958e46f7404b2dfbcf3b19e96aaaae2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

