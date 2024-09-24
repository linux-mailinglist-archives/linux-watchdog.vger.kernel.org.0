Return-Path: <linux-watchdog+bounces-2021-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DED98483B
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 17:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908DD282D99
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 15:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247141AB50A;
	Tue, 24 Sep 2024 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXIY7GIk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA35B1A4F30;
	Tue, 24 Sep 2024 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727190468; cv=none; b=lCN7kFBI4t8HSXItpaWrkLXvalZPunTbg1TH2tLD7hD56UMnXWw/b44h69e5vm2LOO9zbOsCvcdf5cB9CAx5N3+Gea+9qZGqrYJF+t0TRrS7il+70U2ndIobbFmblwPD4RviLc9pZD/Z6ZhFtaCBVzwnFNt0QwYUmAP13IimriY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727190468; c=relaxed/simple;
	bh=TBVZS5I/tsaXX9mMohoWRCq6ZqMV4ADDrABkBybvC6E=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=qjnISCaoPI9fC/L1qQc2ecFntfWE3pfOROpDcg+c5D8RwonSg/oksgIl2jSsmYeEJU/aE6rOQbH2dsar5T5QJ+kFW4g2ErnmDfvjveD4U2tRBC1LoCS/eemNbau01kcKytf4smmcgAkqyaKH1ZksZV4yqYKarMIn0xeIiM1UcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXIY7GIk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEC8C4CEC4;
	Tue, 24 Sep 2024 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727190467;
	bh=TBVZS5I/tsaXX9mMohoWRCq6ZqMV4ADDrABkBybvC6E=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=YXIY7GIkg/gD+Dwfj9oauRjuaKrwQBZ7KgnOj7S6ARR8kbBIrM3qi0CH9sURkUloJ
	 AhCFRCqmGSBZLAgbS9S30SNDlY4fo/GRrnuL0GfncdbP1fsr3rUhqc4bNpFycqKxxR
	 OgsmSA+KDkxp+FedyJQ9xFVMEc8SYecCrpf/nVhOU0pvcB2DpbB2P5N+8yM3Ou9Onw
	 pxMrZrdYEIYR/GHtoVQcZ1B7Lq4soC0e0RtZ7EBlAubfbPpbf+0f3Fg7fb6shEHimJ
	 mF56uagroigMZdxVjhnJJYZVJ/4N2C8M9vl8B/ywxf1oSCoP9QJjNdGE+wVpM/eCMm
	 Sx7x2S1DfEMtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0284A3806656;
	Tue, 24 Sep 2024 15:07:50 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: helpdesk@kernel.org, xingtong_wu@163.com, 
 konstantin@linuxfoundation.org, linux-watchdog@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, tobias.schaffner@siemens.com, 
 linux-leds@vger.kernel.org
Message-ID: <20240924-b219308-dff6b18aadda@bugzilla.kernel.org>
In-Reply-To: <20240924-straight-rigorous-earthworm-f8f242@lemur>
References: <20240924-straight-rigorous-earthworm-f8f242@lemur>
Subject: Re: Bouncing maintainers: Xing Tong Wu, Gerd Haeussler
X-Bugzilla-Product: kernel.org
X-Bugzilla-Component: Helpdesk
X-Mailer: bugspray 0.1-dev
Date: Tue, 24 Sep 2024 15:07:50 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219308

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


