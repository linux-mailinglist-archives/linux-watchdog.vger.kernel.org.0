Return-Path: <linux-watchdog+bounces-2024-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE64D984C33
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 22:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791E91F21266
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 20:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE1F13E02E;
	Tue, 24 Sep 2024 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hrvf/6S+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB014146A6C
	for <linux-watchdog@vger.kernel.org>; Tue, 24 Sep 2024 20:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209816; cv=none; b=WgnQItDqIzODhT2BfzNfqMoBQQT9NVyAQydIkaeJaNhjAOJ24fZHOAUv+IhCS+ujd2pw4+Ai6Nxk2u2Rry6lTaGmO642j4vbw7PbNHURy6Gtfh+qsewXqi/gUImi17tbBHdrfJsSxPK9IumwfF5Y+k6cQGXJf6WvaFyBjhUxWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209816; c=relaxed/simple;
	bh=RjhZmIYeR+M0Wgt3R3+Zf43g9wUy3dX3OflTvTLn7Xw=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=oiHWAn+QElJq3z8FkaE3uGKzlP20AT6NNqdckYKLyQoven+PsDIy9sTR5X64V758Qtjc4mpyMBfUv3+Je2Wh2EkndpzlWPMFU42oCJGRQEzuHgt3QKZZLf1//zViytnixINhayHdtt2UVYQiGvdkufsIDdsLRd1Ne7Aa6Fqdi2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hrvf/6S+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F525C4CEC4;
	Tue, 24 Sep 2024 20:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727209815;
	bh=RjhZmIYeR+M0Wgt3R3+Zf43g9wUy3dX3OflTvTLn7Xw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Hrvf/6S+uEZVn8EwhdsA8mpsoT2I+NCOqymYCOu2Z6Eab/aHpPK9c324oIIDCVO/J
	 sY1KF1jv8AT6j+LYRGgGspAxZYSwYn7R5z8EiXJC5e4AIisBcNEKKdvAry2AQFA7sX
	 4bno6vTJg2qF8hz2NLQle+aLuUxLwvS9GzSlbCbytFCdbmFbvKXi4888MvbMmf/g8e
	 ZhD5bB3O23tPzhLOjpK5SuE1q9dUR7omhqRaZjVvsKTNBa1r85S93bWnKuOcDKE+1b
	 KUna3oPFtywvv26X7/FvJrsujISgl22lwEDTw62cHIyhcKPZvsbtF9XH8UyOz619xa
	 o7QtJgHSA+O9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B2EF63806656;
	Tue, 24 Sep 2024 20:30:18 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: helpdesk@kernel.org, linux-watchdog@vger.kernel.org, 
 konstantin@linuxfoundation.org, xingyu.wu@starfivetech.com
Message-ID: <20240924-b219313-65096650962b@bugzilla.kernel.org>
In-Reply-To: <20240924-remarkable-rebel-dingo-25c95e@lemur>
References: <20240924-remarkable-rebel-dingo-25c95e@lemur>
Subject: Re: Bouncing maintainer: Samin Guo
X-Bugzilla-Product: kernel.org
X-Bugzilla-Component: Helpdesk
X-Mailer: bugspray 0.1-dev
Date: Tue, 24 Sep 2024 20:30:18 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219313

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


