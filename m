Return-Path: <linux-watchdog+bounces-804-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CC1889AB5
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Mar 2024 11:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0C2E1C335CB
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Mar 2024 10:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239C2142E98;
	Mon, 25 Mar 2024 05:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPEdLRDi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26E9143C7C;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711332787; cv=none; b=sWKTEyc7QoaMWv+k8UbcsOWpwpz5Mxz5z+NgEnIpJAUXpu/eD3kXsEZBcarm6wQ9yOYsK3U2YYCiZSwMA9cW6nsi7k5t+3EvAY4A4zIu39WwCErYxaqghlpUoLUM/N8vRcq3+RNqPGp914EQb2rEd3q5swrmV5mLgSukygr+lPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711332787; c=relaxed/simple;
	bh=VstDcUb9xYeWi0RPLPPZayTBk7jxkDw7ZHo6lUj1r+k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XIx/uATz5wCP0e0ZB+YJnGAi6HvECUVdZuVKVPHqZDgWKKuvs5k6bgfiwYRGBOp2CEBlYa/J/U1Tiq/IpBGVjEifoKmnW+rO12mzERUQHnbylyJsio1MUAQqlqj16QmQjAKidBhuOQVCaO5nlNZOabWbZmH6AT4tiAl/ErI9kTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPEdLRDi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E524C43399;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711332787;
	bh=VstDcUb9xYeWi0RPLPPZayTBk7jxkDw7ZHo6lUj1r+k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cPEdLRDiMxY6/cbEnaf1kxPvEp+TlGcGlGKqdnTYDXfN79fx5g/n8ZmbGHLJ8TkAw
	 ohaTnsujQfxWgrzIcNBpUqL3RN5BHES6uW6zjrqio3ufsyzx7HleTMbPw5naBfBMHz
	 ct63KJR2QeCqexjlothSmuI890cQ3t25b+YdF9Kc4Pvhe3lHJxcDT8XtLAG2jmwATF
	 P5ZYEdZNnJhpKvLCZEYalW4hlYcFToxLY6OA7o5PHalAPX1LbaAbS0pAsdJAyMZ5nv
	 IDea7Gijpqpv35e9813wDVN2FOatW9KuUU7Sk02k5MBu2ggrIzU7r7aA1+w/5Qu9rP
	 AI36CxyNKnvkA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4EA86D2D0E3;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/3] Introduce EC-based watchdog
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171133278731.9916.6970811669090399263.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
References: <20240119084328.3135503-1-lma@chromium.org>
In-Reply-To: <20240119084328.3135503-1-lma@chromium.org>
To: =?utf-8?q?=C5=81ukasz_Majczak_=3Clma=40chromium=2Eorg=3E?=@codeaurora.org
Cc: gwendal@chromium.org, tzungbi@kernel.org, biernacki@google.com,
 wim@linux-watchdog.org, lee@kernel.org, bleung@chromium.org,
 groeck@chromium.org, krzk@kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Lee Jones <lee@kernel.org>:

On Fri, 19 Jan 2024 08:43:24 +0000 you wrote:
> Chromeos devices are equipped with the embedded controller (EC)
> that can be used as a watchdog. The following patches
> updates the structures and definitions required to
> communicate with EC-based watchdog and implements the
> driver itself.
> 
> The previous version of this patch was sent here:
> https://patchwork.kernel.org/project/linux-watchdog/list/?series=817925
> 
> [...]

Here is the summary with links:
  - [v3,1/3] platform/chrome: Update binary interface for EC-based watchdog
    https://git.kernel.org/chrome-platform/c/4d2ff655fb85
  - [v3,2/3] watchdog: Add ChromeOS EC-based watchdog driver
    (no matching commit)
  - [v3,3/3] mfd: cros_ec: Register EC-based watchdog subdevice
    https://git.kernel.org/chrome-platform/c/6cea614ba78d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



