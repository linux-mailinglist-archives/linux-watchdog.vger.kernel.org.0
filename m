Return-Path: <linux-watchdog+bounces-4950-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJcTL0WAk2nm5wEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4950-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 21:38:29 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162F1477D0
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 21:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD2F2301D339
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 20:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346AA313E17;
	Mon, 16 Feb 2026 20:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUV689Nb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1122032AAA7;
	Mon, 16 Feb 2026 20:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274306; cv=none; b=d782RphNNJXaalgfWI2o3ep4AsmW20/h5BLENIJM6JEaD1BmLWkW602LZN9LJUQj9scKmXo4tvALpHY/qZNJ531jOv+vHBU9nBm1zqiYrW9sIknC9i3CnoDn2pMCNdht4oHXCCguyY0TR0s8dk3Of33MFRDnQR+xfYvBL06t45Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274306; c=relaxed/simple;
	bh=u0VfjmmsDlgzjZPOYle0W3yqw54kKVcI7EUkfkHBvmw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=B6vTgWESpKFHseLGeH/ZX+1HsdvPg8h4MpHDEtJBfgGj8aAXrdMeaEBvW3/RbtIbHcBTNh+omvuVDG6ou5S47EqNOfN6IXV6HqG3CfTf4OAjGblc6i2LK/wci0oytODQnDXMhX6Wzvv3D8CwklNtYUXRVpVKBuzzR6M+TaQOygo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUV689Nb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C13C19422;
	Mon, 16 Feb 2026 20:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771274306;
	bh=u0VfjmmsDlgzjZPOYle0W3yqw54kKVcI7EUkfkHBvmw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KUV689Nbm8fxLjEJenKxwJw9c/+gqoHEB+HB6MoQXJmjtFZD9D3ohdDaXchiF5aB8
	 +3xTmMt8KvY3vmyiRpauLg9kEB/iNxGDX+mqrzu1LbsrXillM2hsrcV0a+URjFsdhR
	 N9MATfdyqhceGHRnaXudpuwDg02jbLK6E9Hb1XgKfsvyVZ1WvdbQZRRnJU51R1p/0B
	 D+N+y2AYzIdMNDc3XO74QMlMHMG22oTy9Wpt3Wq+QqwmU3ADbg6WQ2IVxFj9TxrSJe
	 X+bXqeSHOXyRjxdbBFwufnEWuGsWPittur2pB6+UYCNML/BtBxD4rZ0ZceLeAzY37W
	 0S2RzQIwnLM3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8539139308C1;
	Mon, 16 Feb 2026 20:38:19 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v6.20 release cycle.
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260216132051.GA30445@www.linux-watchdog.org>
References: <20260216132051.GA30445@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260216132051.GA30445@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.20-rc1
X-PR-Tracked-Commit-Id: 450517fa5aae98b857c68743fd12ce93e4b8989d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 57d76ceccee4b497eb835831206b50e72915a501
Message-Id: <177127429813.3994460.12362055280942309332.pr-tracker-bot@kernel.org>
Date: Mon, 16 Feb 2026 20:38:18 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>, Kari Argillander <kari.argillander@gmail.com>, Kery Qi <qikeyu2017@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Naina Mehta <naina.mehta@oss.qualcomm.com>, Oleksandr Suvorov <cryosay@gmail.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,roeck-us.net,posteo.net,gmail.com,oss.qualcomm.com,intel.com,exactco.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-4950-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-watchdog];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3162F1477D0
X-Rspamd-Action: no action

The pull request you sent on Mon, 16 Feb 2026 14:20:51 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.20-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/57d76ceccee4b497eb835831206b50e72915a501

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

