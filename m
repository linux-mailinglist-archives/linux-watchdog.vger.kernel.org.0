Return-Path: <linux-watchdog+bounces-1207-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94D91D107
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 Jun 2024 12:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF92F28198C
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 Jun 2024 10:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65C812E1C4;
	Sun, 30 Jun 2024 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="vtxK/kQ/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE6E2C6BD;
	Sun, 30 Jun 2024 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719741875; cv=none; b=c7DYA/aRw9gQjEdsnNcm1E5ULdz9umocB5LpRq742Cunn2WoxI6eMjI5o0nS4wNjAaj/Qgn3O4yQjKLq4oCKyITtms8x1reOHfIYzIJBX3rAd42S9+4qdE6wSYas25UUQDOygqrRK3c0T+8VXMGL1YfcodYDx9Ke41NjFx5cRc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719741875; c=relaxed/simple;
	bh=ksI5U99p5TXI+fWs7G8VsLJMf0qVoJiuCSx528ExG58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N24Xn2ZkvurhhgFf66mlO+jCgE7iKpiCmt4AI5teHtera1L9RXgbr/hkg4aY2OmUHY+BsTap+TMdr3BScb8YDtFz4Vq1TEOMz6Cy+b92CkYYuHFrl/orcZd8IjEp3nb7OhyUEhytLEZA/J/6JtPKLhrzNYjk17BCG2bdXktC45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=vtxK/kQ/; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 97CB840A00; Sun, 30 Jun 2024 11:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 97CB840A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1719740666;
	bh=ksI5U99p5TXI+fWs7G8VsLJMf0qVoJiuCSx528ExG58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vtxK/kQ/4Au4lVVotFHMhEpiieOkXWxecYUtIpVWpnwvy/zbmlJ5v7qTVj/cm+bt6
	 u/i/srnPRNKzXm3zOVyGTHPJjJsqpGxxpajBG2dacFQr9rydP0n5nVI2khJ1PnyKPj
	 +w1GF5DNOcwwvKTAGEKozsPDwiKeG1DP5TyoUPfQ=
Date: Sun, 30 Jun 2024 11:44:26 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.10 release cycle (fixes).
Message-ID: <20240630094426.GA13073@www.linux-watchdog.org>
References: <20240625133151.GA1554@www.linux-watchdog.org>
 <CAHk-=whgnEuO1+8Gk3AiWeuSeAuCoUWnkuxUvczHwfJL+juAsA@mail.gmail.com>
 <20240630091403.GA12993@www.linux-watchdog.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630091403.GA12993@www.linux-watchdog.org>
User-Agent: Mutt/1.5.20 (2009-12-10)


Hi Linus,

> > On Tue, 25 Jun 2024 at 06:51, Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
> > >
> > >   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.10-rc-fixes
> > 
> > ENOSUCHTAG.
> > 
> > I do see the commit you mention in HEAD, but there's no actual signed
> > tag referencing it.
> > 
> > Forgot to push out (and then didn't react to the error messages that
> > git request-pull gave you)?
> 
> It didn't gave me any warnings, so I took time to investigate it this morning.
> Turns out I did not do it on the linux-watchdog tree but on the linux-watchog-next tree :-( .
> Such a stupid mistake from my side...
> 
> I'll fix it and will come back.

It's fixed now. Tag is on the correct tree. (Actually on both trees :-) ).

Kind regards,
Wim.


