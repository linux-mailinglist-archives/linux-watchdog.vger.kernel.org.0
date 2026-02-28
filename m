Return-Path: <linux-watchdog+bounces-5014-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P58K0JKomk61gQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5014-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:52:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3C71BFC9F
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDE0E30514BE
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BF72FF151;
	Sat, 28 Feb 2026 01:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbOyvab0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874921A9FB0
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243519; cv=none; b=F0dMZnu671pPMnXaNkBm4E17fpC/MHdEmWYAC7CQeSuvW2uNlOZ1wwk4y5HOXHimQ9BB5l5hMLDxIj6904hHGsBl+B9s3fi3aFEBESbGS9yVxcDMFc7fOGAW1XZaBp3PwyAs0o0co3DNhiZHh7fIG8z4K6McuTL8pa88MMa2OwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243519; c=relaxed/simple;
	bh=p84/9c+lfZlazK4tZjfQ3UP88youLp7IknBeopFaKlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+7PZ9zz3Pi6ZCut7R89TFAzfakFvsc7Bv44jRH7LB3pM/7HhXmCQ3IkgKkb0/yBBWibVUjPJY7f5b06nUMZd+NoGof503OzdtDTIClZ5QI/i5nN2TKDXNA7y3oVh7r1wf7WgtpHO+apZiiUoquIKlyYh7L9O8Eobllvvm3/SNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbOyvab0; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124a635476fso3222069c88.0
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 17:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243518; x=1772848318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxpD5YhuPnDwvCwH7jLspwJr53qOub2weuQCgq+RP8s=;
        b=LbOyvab0mMG/nexCqSDr/oWQHj9zaGPfgZndJTOHAj2iyBy5NsJU+cmwoNgV0w4kYk
         p8GggKd735F8EPEVfJruGMJGl3vOywRqfXrUBF+ozdsyPwamlcXp/Fy5eMeglWhSCl3w
         FWt/izFciF8PJF2YptVYTuJKfwtlRUhm1+qESuLkMReHaTB2qTmhLwo8pcgumW3l/eQX
         VXIJLNNPjjgFO87tU8bKUe6769AaLFgzkQbtrFivPeG5ir/zNsnixsFLBH60IR1lVkDO
         axDYmPQLZXyi09z727BRFZpBK8+Uwny8ksBiIR5jl3l1iOZrCF0Z+QNjtJgaCjT08GhS
         Flwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243518; x=1772848318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DxpD5YhuPnDwvCwH7jLspwJr53qOub2weuQCgq+RP8s=;
        b=E6V2VDD8uEemM6Hy9GKBc5XwnJec+2bvDB9UfHz1qRggD6HDGNl8gX8CooQVo3h8Er
         R3NTqmpYEBauK9nXafqsMuCEVeFbZBCWO5SL8RLtKLfHngcqgaMNzZjpumgcbbRtyIi4
         7kGb0fFJrNdQ8npCJoH3nQ07icp3pu+oExqFYDguCHaUPchG518S/hbSPYPvKRQlMCC0
         tXA/zcBXjGC+1HAtfBq2McQH1+vbR3dKxU+c53EeYNrzuRIsIiOqbZg/LbdnQ33H/4Xq
         nyCm5gB2LnlW3fE0B7nwfZRb0aLee3bBZpqGbTFiM70ARbNvkQbVfFB2O6rRwj8sygZW
         Creg==
X-Forwarded-Encrypted: i=1; AJvYcCVsIkTaUYcqGzNJdV3mapIBu+2KNih2KapXudZHepba4MoZNxERPy0+++nmZw2ZOZiYOe+ykg3bt7TJ00PcSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3naHXBOJW1G33gq4Lw4GeHmIn8SXRjCCvFvZ2YVywRwgKc/IX
	aFJtKpJ2lSsl/CPuaLhrf2urqv6k6UZH0uTv6ZAxsz06fE5ZVmh6fWux
X-Gm-Gg: ATEYQzx6Fo4ZqpkRtGwzUu73L2hktt4e8zqTyDiVBJ8gdjC7IdfW2UU85kuwQPL0c61
	/GoxIqh65DMOrbhhUnaAtAo7ammJjlz4+UinVjEAakEL7HLaSYo6gBSwd8GDHurc7RqYZJOMZd0
	L13qWOv2Z05dX/ZMAL8GVwZRGyBYzteNUA7MncBvs0VGoYlc8pgOjtKbxo2ocpz63uQmfVDihYc
	EBiv2CXKqrVe/vFFj0DuDwnG+q8QcwNZYiOZbFX7pZT0ta/jU5mbPr/GvFyq4oR0jRuCddl6mz5
	9uCa56O6Q9nlshTpbQf3Ydn9g99OHx2N58NnsNnYbQcu/KnsCIAqDEf53Bksa8Y9/tT1FbGObg5
	lFN7rPxkvazRdxYSazZJ4n9R50oA7upPdvXpNncSVCdxJ7LRq16tb5BRw4YfAUBzZQ0RRlPKDJw
	63p+j5gc07WmAkK9XWgek1WCFjsT4Z2C2anK2ETqAAKQwUr8E=
X-Received: by 2002:a05:7022:4591:b0:122:345:a944 with SMTP id a92af1059eb24-1278fc1f72dmr2016517c88.29.1772243517474;
        Fri, 27 Feb 2026 17:51:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm7200767c88.6.2026.02.27.17.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:51:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Feb 2026 17:51:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/5] docs: watchdog: pcwd: fix typo and driver info.
Message-ID: <bf38c59a-a719-4599-b1c6-802d06722e29@roeck-us.net>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-3-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228010402.2389343-3-rdunlap@infradead.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-5014-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,roeck-us.net:mid,roeck-us.net:email]
X-Rspamd-Queue-Id: 1A3C71BFC9F
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:03:59PM -0800, Randy Dunlap wrote:
> Correct a typo and some technical info for the pcwd driver.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

