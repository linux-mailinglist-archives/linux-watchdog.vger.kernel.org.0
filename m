Return-Path: <linux-watchdog+bounces-2499-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE39E1D09
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Dec 2024 14:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 122BAB26F9D
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Dec 2024 12:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AAB1DF74A;
	Tue,  3 Dec 2024 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="PsU/nsmj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE113398B;
	Tue,  3 Dec 2024 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733229016; cv=none; b=CtC24p/4SzDcAhHiwEBWRN6PbdyLY9v3pjkcK/X1TP8U5XwiX9AzFBQm81c0dFlMQGZE6I0uKlZoZSMDYez6KG2ZUWDzGajv+Utt/EN6NWGfQVSO+so0IfrBNYGVctjNlGF0CdJT42PnjuQ7xSHoMEHQjwDCkz/kG+oLLQ9AzuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733229016; c=relaxed/simple;
	bh=7TRfX5wfxjYCtySYywhqY3QFl04GfuL1p+0jXqV0IUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnUqmmdXOV0MQvcqRPJe+6EvQt+kf26PkUrwzqzusqJlgNBnqbDzC8577cjIGRPqFa+xIvo0RfOYXZ7HNtavzHdWyBPW3lLci5UpaNhco00htlYxuqbVde2uBU2Lz76m5OxZapMfrzieK8fitH+O/OKpCsZRA8HKJt7ARAChh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=PsU/nsmj; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id B1E8140A03; Tue,  3 Dec 2024 12:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org B1E8140A03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1733226781;
	bh=7TRfX5wfxjYCtySYywhqY3QFl04GfuL1p+0jXqV0IUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsU/nsmjo7eAfQ8nOWB6wrzAMT/ufBB15lRccnOOfh2mzjP33K80Bpe6Vs6rQTsGQ
	 VFBv3odsw54tzVv1WBkukfTU13W18ZbmyV2AuiEmthL8cG39GS267PKGM1wk1rqQmp
	 ex7SkMHUs7j41H7vs/qiMG63yKKCNfbZqyr48faY=
Date: Tue, 3 Dec 2024 12:53:01 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Byoungtae Cho <bt.cho@samsung.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Fabio Estevam <festevam@denx.de>, Harini T <harini.t@amd.com>,
	James Hilliard <james.hilliard1@gmail.com>,
	Jean Delvare <jdelvare@suse.de>, lijuang <quic_lijuang@quicinc.com>,
	Marek Vasut <marex@denx.de>, Nick Chan <towinchenmi@gmail.com>,
	Oleksandr Ocheretnyi <oocheret@cisco.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rosen Penev <rosenp@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Xin Liu <quic_liuxin@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.13 release cycle.
Message-ID: <20241203115301.GA27487@www.linux-watchdog.org>
References: <20241202181849.GA5357@www.linux-watchdog.org>
 <Z04WJYlsYQABwAZb@sashalap>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z04WJYlsYQABwAZb@sashalap>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Sasha,

> On Mon, Dec 02, 2024 at 07:18:49PM +0100, Wim Van Sebroeck wrote:
> >are available in the git repository at:
> >
> > git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.13-rc1
> 
> Hey Wim,
> 
> Have you pushed the tag to the repo?
> 
> $ git ls-remote --tags git://www.linux-watchdog.org/linux-watchdog.git | grep v6\.13 | wc -l
> 0

Due to lack of sleep, I indeed added the tag on the wrong repo (the linux-watchdog-next repo).
Fixed.

Kind regards,
Wim.


