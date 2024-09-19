Return-Path: <linux-watchdog+bounces-1992-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C0197CF08
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 00:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86156281763
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 22:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F5F1B29CD;
	Thu, 19 Sep 2024 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="8dP53nBv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85401B29C6;
	Thu, 19 Sep 2024 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726783417; cv=none; b=bsqNye164/02FQMx8de16fy71+fBI6jT4i3tfZz1+SnpB1MPtMdaekAKy1MJnhUGynkF2m6hRnJi6xaFmg4PgTwBQtO+d/5Jufl5NJCktrvpQpbmPVMzHL/xi8OhYI2ux0EJwf1PtgIavyxYasikclWaQuLw0A+gmxpVUCDY3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726783417; c=relaxed/simple;
	bh=QW4+1KKGJY+s1DJGWLQcjCthftxRyxioRpUTjBW+9XY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDT8zaDlyYtJ9GhsqsJQa/LerAtrYL56XTTse5INMgJD296HtdRsQTW6DfJlK9rbNLTLo+azYJSqWd0wcLT+KAgzjGV5dkdGcMGJHAkRKyLMU94zC6xUwLm4H8xF+CJkLMKeot60eZj5KQ+5rUKGEp7+sIk0Cxk0gCfW8ebcjEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8dP53nBv; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Wwr5tc/2MQBgqyVSbXdpoSg01DffOELLVlpjQ44Q0FA=; b=8dP53nBv9j/XLYSo//wG3O7Hmd
	Fh5LVAVc25DcfLEgD1NB6BT0igQeRqQ2eNTe6Py8YCmvilUIIFFE9hEfoLqUIYCu4JAQVFyzj46i4
	Ym6VsKPew1KkfwaRUfhORLb+EkuJ3BjXP2mtUUcbqXgKzOdZjpleIWJ2SyxYpa99AApqpzxHXec+l
	MOuAcWBoHy43z8mucHIfPRqMpYxuxq3G54TkgN3ounxpWgBPuyolxfx53OTz8PPjL5pOpZmw5GAiq
	HP++SX7KE3WavCifX5Qp9ATYGDM1Xm+sSajqfojCbCJSPNpoIbC1A6v7BFRON368TpoMrfTsvK5/a
	ruaoTeBQ==;
Date: Fri, 20 Sep 2024 00:03:32 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: rn5t618: use proper module tables
Message-ID: <20240920000332.377f370a@akair>
In-Reply-To: <2543aa99-0069-4eb1-a37b-204f3e6bbf6c@kernel.org>
References: <20240918212925.1191953-1-andreas@kemnade.info>
	<f52deaf1-492e-4cbe-8e46-8999ae2e481f@roeck-us.net>
	<20240919125005.0bcd17e4@akair>
	<2543aa99-0069-4eb1-a37b-204f3e6bbf6c@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 19 Sep 2024 13:02:55 +0200
schrieb Krzysztof Kozlowski <krzk@kernel.org>:

> On 19/09/2024 12:50, Andreas Kemnade wrote:
> > Am Wed, 18 Sep 2024 15:43:40 -0700
> > schrieb Guenter Roeck <linux@roeck-us.net>:
> >   
> >> On 9/18/24 14:29, Andreas Kemnade wrote:  
> >>> Avoid requiring MODULE_ALIASES by declaring proper device id
> >>> tables.
> >>>
> >>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>    
> >>
> >> This needs a better rationale. There are more than 40 watchdog
> >> drivers using MODULE_ALIAS. I would hate having to deal with 40+
> >> patches just for cosmetic reasons, not counting the thousands of
> >> instances of MODULE_ALIAS in the kernel, including the more than
> >> 1,000 instances of "MODULE_ALIAS.*platform:".
> >>  
> > basically reviewers were arguing against patches from me bringing in
> > MODULE_ALIASES. So I decided to clean up a bit in my backyard. Not
> > sure whether such things could by done by coccinelle but at least
> > it could be tested via output of modinfo.
> > 
> > This is one example for such a patch:
> > https://lore.kernel.org/linux-clk/119f56c8-5f38-eb48-7157-6033932f0430@linaro.org/
> >   
> 
> There are multiple aspects here:
> 1. People (including me) copy code which they do no understand. Or
> without really digging into it, because they do not have time. They
> just copy it, regardless whether the code is necessary or not.
> MODULE_ALIAS is one of such examples. It got copied to new drivers
> just because some other driver had it.
> 
and copy nowadays unaccepted design patterns. Probably best to look at
the newest example.

> 2. MODULE_ALIAS creates basically ABI - some user-space might depend
> on it, so removal might affect user. I think I was not dropping it
> from the drivers in cases it would actually drop an alias. I was only
> dropping duplicated aliases. That's not the case here, I believe.
> 
> 3. MODULE_ALIAS scales poor. I believe proper xxx_device_id table is
> better.
> 
> 4. But it does not mean that one single line - MODULE_ALIAS - should
> be replaced in existing drivers into full-blown ID table. I think I
> never proposed such patches for existing drivers. Why? Because if
> there was no such need so far, means there were no scalability issues.
> 
Thanks for the long explanation.

Regards,
Andreas

