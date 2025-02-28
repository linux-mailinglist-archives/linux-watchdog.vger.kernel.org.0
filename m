Return-Path: <linux-watchdog+bounces-3026-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B15A49114
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2025 06:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72DDA1891949
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2025 05:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AEE136351;
	Fri, 28 Feb 2025 05:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxLk5rYw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222E10E5;
	Fri, 28 Feb 2025 05:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740721521; cv=none; b=OecFdK5rFKEy39YJJnRyui/2ExjmpzNEASO4S770d8gzFGOxlZU+J2FqqnukQ/mHpcg9uszkaEaBvrwkQ5oOMnkr/pE9mgsPys/MXv1OGLM1y9BIf2ifxQL0nTr62r9mXCHtlfuSC+k32heVH7je5ImUa0BGWCmzNEvQg92QCxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740721521; c=relaxed/simple;
	bh=ZqCNpjf6g7/GpyUYXG7ZDp+0yD8RgPnvALy3XXC2m0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AV7Nrn7FDC7Vjv871ACznNAY9N/Tu8WeMjsC1cUDWiilnjj0nczgVVQAQT9vigt+ksasD3PgwxNyC6DBlpxAF5L9tgykt1uVnzsj/uSUXwepPgGZpZ0AaGu+m4A5ehPs8pfWBrghFMypnA+6cDuaoBiVcUb57TF/MUbstAsek8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxLk5rYw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390eebcc331so172153f8f.1;
        Thu, 27 Feb 2025 21:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740721518; x=1741326318; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7awwPtRK1mf6e45cfAiajRWVyXe2s9XIPiPpwvclm/g=;
        b=NxLk5rYwV4cj3llgfLuHpclZ1B/5EiiXGyrRYRjJc4tlPuy3SN3/3L10iHQEuBqXVy
         ADKAPzO4y65uBYkbWMTRhFruIE4LDK+Kewq+8LJ4VsymyaemBhLqZBZrihXBjAIAxFe7
         ssvG+V9IntA3lWUp/ap0AWQcrd2dk1YTmaAwLhAKlFu3pBcvkT7pwxCaf94H3pFpooKd
         fy8vZtpDxGOqOh1jEYuN37vvR+ri2S2i/3N5XclNsTDp1QWlsNSsHEgBzbQunmY9tspk
         aJK0qFv1XPQkiwYxAucccnm9uSOiXr73OH3k1H4ZyI9CDqoBzyl7y0bK6okCTa46TeDj
         7ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740721518; x=1741326318;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7awwPtRK1mf6e45cfAiajRWVyXe2s9XIPiPpwvclm/g=;
        b=ArSdYhIu8ZBtE7z01BR5etSq9xm2e/h2qQFdjTm7xvCzgtibGJVnlDYGhIhukDhEiE
         V8EYv54NnN1NbjlCqktS948rcCq+I/fcyV7/W3sjCx3vPzIq60gTom4wgf3NTOTBdbfZ
         PX4GdNwheYq0I1A8jukmMJzssyTXY0veITi77lYirYqa73SGdaEk7m+LTc8+PJ40CPrT
         OhnLbZWrrG9+de7KoTF2gFG9B4XJV7fsVDhDv5fhkaRhjsua/skAyEEThAUxqcy0sy8I
         DVWr0lhD6Z4XXxT/2+SH2vg22vmSOGjQVFe9wDQRipa8t0kGFUy0Zc+lEoaAkW5mDNfh
         ys9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnedD1PNj5RuBrPJMXKpa0MpvWFUU5JLK6S2YVjYlqzWAkcQgh1FsMZ5gHubE0/q70nKnsN2xGPSMFagc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAAwksQLrAVbfOMjBpHzDN4OaHJhYHGu9YvqWRtVMkWFGxhLon
	arCht80NRO4tfD5u7JcnIjBbc+zBXa/dErrSqy4t73GeDcuE3iGB
X-Gm-Gg: ASbGnctkb4CveoyAMtZn97c1CPGHL2j1bH+d27S5BPf7FX6hrBQ+OE1TZEtRUHm37Dl
	IhTB+gIEsd74FnzFucbjwCkKWDxGYvVTS5chsCOQdMiVBzVz5tzdd4710Ia1u68DM6kp45E7zA8
	tc7hTgUQYzllHUvfSpBKKB1KeN4JGKHowbA2k40Ox+GMGAWBQC+bI88ZDDJz9i70Um1lyxQG8Y4
	Tlzr8ibxQxeg80USAXCMTOxd+yJHi4R8LrC4hUNvCY5RcLOmLX446fwpCddVK71BUN6Uu1Pf5dZ
	XugR8CrOO0gxjPrNA5KQIRbxbTrDjLvHa09HJHnuGy2Z8ohTg5dUSxoUSFI=
X-Google-Smtp-Source: AGHT+IGUt38tH21UY1y/PR7YrpTZfeWm8QQKpz/rk9iRNqSDNWUTGUcTh8PBEf2ystdDH/QswJULqg==
X-Received: by 2002:a5d:6dad:0:b0:38d:ae4e:2267 with SMTP id ffacd0b85a97d-390ec12f046mr1377578f8f.11.1740721517649;
        Thu, 27 Feb 2025 21:45:17 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4847e62sm4089231f8f.67.2025.02.27.21.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 21:45:16 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 9FBE9BE2DE0; Fri, 28 Feb 2025 06:45:15 +0100 (CET)
Date: Fri, 28 Feb 2025 06:45:15 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Terry Bowman <terry.bowman@amd.com>, Robert Richter <rrichter@amd.com>,
	Jean Delvare <jdelvare@suse.de>, Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	=?utf-8?B?0L/RgNC+0LPRgNCw0LzQvNC40YHRgiDQvdC10LrRgtC+?= <programmer11180@programist.ru>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Report of a nonworking P5100/SB800 TCO WatchDog after 1f182aca2300
 ("Watchdog: sp5100_tco: Refactor MMIO base address initialization") changes
Message-ID: <Z8FNaycb6bpW9JA_@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

A user in Debian reported quite a long back an issue that after the
update to the 5.18 version but present still up to recent kernel
versions his SP5100/SB800 TCO WatchDog would not work anymore.

The report is at: https://bugs.debian.org/1054231

> Hello. WatchDog broken since version 5.17. Kernel write an error to syslog.
> Tested versions: 5.10, 5.15, 5.16, 5.17, 5.19, 6.1, 6.5.
> 
> From syslog:
> KERNEL 5.16 (and lower)
> Oct 19 12:24:12 debian-gateway kernel: Linux version 5.16.0-6-amd64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.2.0-19) 11.2.0, GNU ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT Debian 5.16.18-1 (2022-03-29)
> ...
> Oct 19 12:24:13 debian-gateway kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
> 
> KERNEL 5.17 (and higher)
> Oct 18 20:36:00 debian-gateway kernel: Linux version 5.17.0-3-amd64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-3) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT Debian 5.17.11-1 (2022-05-26)
> ...
> Oct 18 20:36:01 debian-gateway kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
> Oct 18 20:36:01 debian-gateway kernel: sp5100-tco sp5100-tco: Failed to reserve MMIO or alternate MMIO region
> Oct 18 20:36:01 debian-gateway kernel: sp5100-tco: probe of sp5100-tco failed with error -16

I had a look only recently at open bugs which were stalled in Debian
and had a look at upstrema changes, and I'm not sure if this was a
kernel problem at all an the change is introduced around


5559598742fb ("drm/amd/display: Pass non-null to dcn20_validate_apply_pipe_split_flags")
(https://git.kernel.org/linus/1f182aca230086d4a4469c0f9136a6ea762d6385)
which is 5.18-rc1 and got backported to 5.17.10 and 5.15.42.

The reporter confirmed that the problem does not show up with the old
packaged image we can get from the snapshots archive 5.7.6-1 but
happends reconfirmed with 6.7.11-1 and say there are no MMIO related
settings to adjust in BIOS.

Does the above ring some bell?

Regards,
Salvatore

