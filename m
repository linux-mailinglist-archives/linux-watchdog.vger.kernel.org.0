Return-Path: <linux-watchdog+bounces-3027-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB5A49117
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2025 06:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E6373B733F
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2025 05:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD1F10E5;
	Fri, 28 Feb 2025 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Vu7cfS28"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7AB4409;
	Fri, 28 Feb 2025 05:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740721721; cv=none; b=gLiOvsilAnn8Kzh7jpDp4mtNMhyYFO2+1xlYBOKymfIfnSttHrUO/2AQriYpqVJ98mqy6vZBIRVWAqJM51gh/o1vEJX3u3hP72Aq0Hj6lJ7k7oQSx7tzs6IaD9EV5DaMbLvGIsaNk9c2dsP03NzVCL6u0W1WlLNu4BK50ZBS5g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740721721; c=relaxed/simple;
	bh=QYITdVb8vsBP779z1q8VkaRymvTLVI6dS1oiz+gxWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9A0+NwuKHxY2R6G3t15VZioMvdnwtnyfAYT8NOYquVnzn3u9CPbkYr958ElYJT2Gj4oj4v/OTvsixp3aAF3KsLi2l5Ca548AqgJO1EG/C2rhkHCvoVVjNce2ur9XvrDF56wOvkCz49XPiLvSXStZAiLMy3HVztvb3BJAtzHxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Vu7cfS28; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AB6QOslPDo+0V61z04D3ADuMwr+/qgVY7yWk2j9zYkc=; b=Vu7cfS28RWydFFttuqhIJgGfUi
	x76s3p58gznDnn9wGjB0aOGWsz09UVdg7eRWx9Na9u6Rj0Osd6IXpLmyZ1JyGrlDhssaHLKorCS8O
	zGakBYZxFG6jwdwZ6+3x/hX82daNQPio7d9TtBLiym7GQyL1orUfEkhC6sB/XskwW2r/BFTBSbAnJ
	jipWBSVTNSYcbPtXKAba6LEsliVMvrYFQ/HkhxsQBiFPrhDQ9tRElCKLRYTelC4AjVu1HHY37Vdoa
	+vAfwXlOzhsv/cfLS6sh0dfLcgPSKZMLb55ArgvFUueZAXmi/RfclQac5YGKjDjO8FeoXrKnUU6N4
	3qONfC/g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1tntEX-000Ltn-NH; Fri, 28 Feb 2025 05:48:25 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 55540BE2DE0; Fri, 28 Feb 2025 06:48:24 +0100 (CET)
Date: Fri, 28 Feb 2025 06:48:24 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Terry Bowman <terry.bowman@amd.com>, Robert Richter <rrichter@amd.com>,
	Jean Delvare <jdelvare@suse.de>, Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	=?utf-8?B?0L/RgNC+0LPRgNCw0LzQvNC40YHRgiDQvdC10LrRgtC+?= <programmer11180@programist.ru>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Report of a nonworking P5100/SB800 TCO WatchDog after
 1f182aca2300 ("Watchdog: sp5100_tco: Refactor MMIO base address
 initialization") changes
Message-ID: <Z8FOKKYfxigexFhJ@eldamar.lan>
References: <Z8FNaycb6bpW9JA_@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8FNaycb6bpW9JA_@eldamar.lan>
X-Debian-User: carnil

On Fri, Feb 28, 2025 at 06:45:15AM +0100, Salvatore Bonaccorso wrote:
> Hi
> 
> A user in Debian reported quite a long back an issue that after the
> update to the 5.18 version but present still up to recent kernel
> versions his SP5100/SB800 TCO WatchDog would not work anymore.
> 
> The report is at: https://bugs.debian.org/1054231
> 
> > Hello. WatchDog broken since version 5.17. Kernel write an error to syslog.
> > Tested versions: 5.10, 5.15, 5.16, 5.17, 5.19, 6.1, 6.5.
> > 
> > From syslog:
> > KERNEL 5.16 (and lower)
> > Oct 19 12:24:12 debian-gateway kernel: Linux version 5.16.0-6-amd64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.2.0-19) 11.2.0, GNU ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT Debian 5.16.18-1 (2022-03-29)
> > ...
> > Oct 19 12:24:13 debian-gateway kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
> > 
> > KERNEL 5.17 (and higher)
> > Oct 18 20:36:00 debian-gateway kernel: Linux version 5.17.0-3-amd64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-3) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT Debian 5.17.11-1 (2022-05-26)
> > ...
> > Oct 18 20:36:01 debian-gateway kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
> > Oct 18 20:36:01 debian-gateway kernel: sp5100-tco sp5100-tco: Failed to reserve MMIO or alternate MMIO region
> > Oct 18 20:36:01 debian-gateway kernel: sp5100-tco: probe of sp5100-tco failed with error -16
> 
> I had a look only recently at open bugs which were stalled in Debian
> and had a look at upstrema changes, and I'm not sure if this was a
> kernel problem at all an the change is introduced around
> 
> 
> 5559598742fb ("drm/amd/display: Pass non-null to dcn20_validate_apply_pipe_split_flags")
> (https://git.kernel.org/linus/1f182aca230086d4a4469c0f9136a6ea762d6385)
> which is 5.18-rc1 and got backported to 5.17.10 and 5.15.42.

And me failing twice in a row, the above should clearly be
1f182aca2300 ("Watchdog: sp5100_tco: Refactor MMIO base address
initialization").

> The reporter confirmed that the problem does not show up with the old
> packaged image we can get from the snapshots archive 5.7.6-1 but
> happends reconfirmed with 6.7.11-1 and say there are no MMIO related
> settings to adjust in BIOS.
> 
> Does the above ring some bell?
> 
> Regards,
> Salvatore

Regards,
Salvatore

