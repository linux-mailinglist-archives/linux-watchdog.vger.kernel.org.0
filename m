Return-Path: <linux-watchdog+bounces-1206-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973891D0D4
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 Jun 2024 11:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03EEA281A92
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 Jun 2024 09:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D0F535D4;
	Sun, 30 Jun 2024 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="b1e/lUSS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD316282ED;
	Sun, 30 Jun 2024 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719740060; cv=none; b=M0I7COXcTx8KMlZtXWvBUezRV6BoR9sBzGo+ODsjk7V7nCP1ceat5DDIy8HV54RJmSMQ2EcJSKNN4zb9ONY8bOaflRVd3kF3k6N2qdOJgw2QzuZ4cUd30FJYnFJXhhXGVkK9+6VSqHHqge5L7nqEz0qybIrLOD/xqB2jmpT8rqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719740060; c=relaxed/simple;
	bh=k+G8NV2hvavRL0EHhCZYJQFAgauLbWs7Fncj83jaM6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsopRjjsMRN/IrUXGaQDfrXjcNvyO0seXC45lGzr0x808oIPcGHxFAPnKwOqDyIWsoU4BT1VperGeGChqN2vN44p2N+xYs5hOaNhx63uRXkDEVtsfJWpC273WWcJ8yq1il5BlCXfRjNdxeEaVu2jor3inARQ/NteS+6v4pp6IUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=b1e/lUSS; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 6C18B40A00; Sun, 30 Jun 2024 11:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 6C18B40A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1719738843;
	bh=k+G8NV2hvavRL0EHhCZYJQFAgauLbWs7Fncj83jaM6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1e/lUSS9zcUNcbVDGSsvzX1RVsSzOjhsF+M/29s6KnIKBWK0n5JrhHVML3gKF5KL
	 ghBTdwxgp5SCkmZ0vy/Xng+eGW5F8Km3+RgS+d5nvpqibCLrASnfUcRYBtO3FCfsK4
	 Dgsk8nhwoOr5f1hQT44Koa8CNE69vVJ3JaG+Fh1I=
Date: Sun, 30 Jun 2024 11:14:03 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.10 release cycle (fixes).
Message-ID: <20240630091403.GA12993@www.linux-watchdog.org>
References: <20240625133151.GA1554@www.linux-watchdog.org>
 <CAHk-=whgnEuO1+8Gk3AiWeuSeAuCoUWnkuxUvczHwfJL+juAsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whgnEuO1+8Gk3AiWeuSeAuCoUWnkuxUvczHwfJL+juAsA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Linus,

> On Tue, 25 Jun 2024 at 06:51, Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
> >
> >   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.10-rc-fixes
> 
> ENOSUCHTAG.
> 
> I do see the commit you mention in HEAD, but there's no actual signed
> tag referencing it.
> 
> Forgot to push out (and then didn't react to the error messages that
> git request-pull gave you)?

It didn't gave me any warnings, so I took time to investigate it this morning.
Turns out I did not do it on the linux-watchdog tree but on the linux-watchog-next tree :-( .
Such a stupid mistake from my side...

I'll fix it and will come back.

Kind regards,
Wim.


