Return-Path: <linux-watchdog+bounces-5015-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCkLFZNKomk61gQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5015-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:53:23 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04741BFCC3
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6D293029AF1
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FC5158538;
	Sat, 28 Feb 2026 01:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF7n4E7C"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B67B3081BE
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 01:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243600; cv=none; b=gPPLQ3u1jGJsWAhVBe7YATF5SJOBKLx6K0+eOWyeKHShotz2Zer3ZPeAl1OjdFRsmCwd2k/2qBdmWzxPfkDQr1NnQXRBZOU2X0J/ksQVE3alAReuD23gE0zt/lqCO09GhmyM1DcLh5xbYxd1SecGn5d45yq83M978nucr3am7rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243600; c=relaxed/simple;
	bh=uJBC9++iqt162lkiJOxS26Hv2u+/N1Cek43ZwBUB7Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvkutOhicR+34m7ffUi/YoQgoyyRnwH9SXhfXmVNcQ+nBU6y2RPDeqeXgT7XfgvU3A8noq8coq0n7/JuHqdO1D/HLyRkBJpNno1+UlYFHUeH/iopvONmhvLTZDOWth5aGaqIxTBH7t4gtF6GJlBeQGu8vsTYEjLxqs/CpX/A7Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF7n4E7C; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bdcd7f0222so3741821eec.0
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 17:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243597; x=1772848397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nH3UsBo2SV+jK/1cDb4i/nx16X7bNeZrLF/ABqKb7ak=;
        b=gF7n4E7Cvt+TjzBEzuJIc7HO3RHpNxZPjVvV3PL6RikN4S+RDXnVKATUksU8Y7eoQ9
         v77n+cxC7aDHNs66iZUP0KfUYxSV0knfFDysbyreUaY7g2R1Mld36WSf6QhZv4k49u+m
         JesceP6d5VoNI8IF5lEOKIyKRU1ymq7gpMaFMONgiIIZFJGMt9LBU6+fukzaqTPbPoLh
         W28y0Y4R6O7sXgq8Tvn1RZHLvtf4bhdjxKxLuPIbEMVi0NyIRIzMe2QNvR5SaQzuJAYh
         iiu5R7U/dwS8JIX3Da+L1QbRCXYp8vFp+cRX1EWLYK1cHKmKfk8W86m1YSzg7zO7ZHy4
         /npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243597; x=1772848397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nH3UsBo2SV+jK/1cDb4i/nx16X7bNeZrLF/ABqKb7ak=;
        b=Pcbk/Whd4syYUEEOOyDSMT8ZFL17S8tHueHitaYejwuPXfvIyJVTG4BBNgMZQLcpED
         oHVREVFnBs4OMgPvLPXCR9RGPN+tDhiM8edWQ3DPXGi51jRuXQgEBqhM4KuuiSr63nMO
         0UAKACWXxHQrg6xI85Ii/XlppOTyn2ob00PvXtX3kK0YTt34xOenexU/XauOAnSru7ye
         asKbDngsEtvkZ0oRU67G09Fyjrlqg7FAi99GS2d+RqxgoaxFubjmQvikQBsveFmZKr/3
         2taCFCFP4TH4/Ciz3ICM6n9U1X+V1mc1NReZdUFhoFFTcuLSpJNwVHSlXofaX65ZV3BI
         WZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHhJyhdthWh7NJBhfEjJCmuJTS7bWkrh5KCtNlbcTn0XL/2Amh5NyQS+24vMDZHNtLMvFkHSpOcrbIxW2DlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZFb/fScWQNpf1YR/qEZoKN22MLgzLAWoFT8Rwq029f0tN+xXa
	7Mseb6J7s4Exg1rrZSEVsNyAJK6wRiahLamBPYJVTPu3uqjwy+wIAJ2k
X-Gm-Gg: ATEYQzz4tYRmKK9LKuM1zxkG4vWX0uTYS5g4KbJJ3Ee7w7RVRsGyOpKWwD/DAqNztOV
	UH3QoCW7fwWYsUHvxuxIevGk/J+q+bnEshojH58aDJDQ9rMyagzLeh+COyUEXK37Ss2sLPu+3cX
	OCFYpdEroQou0xqTRicaqmcjC4dvSElR9I0d4X8cNLl887Asb0HA6f2OCYrP/jt9klNONE7ygxC
	9i+Bo8XDfDIuJblFTUlc2HVdBuwnjmyBZe9gCasrSTy/2L4RGOp1YFP7um/gpkqrk7DG5QkQC/3
	smWn3G0rn5OuVlki/n0jUQ7Nt7ZPHQWupsnubnQg4NyXTf/s821xKvVPVvB1rXd53+CWrWDCey0
	uHeJNW2O+wE41+bv31xK7jD5SUtdaJvfn2nrMHjleg18kIM4NdPlFL3XWu5QjdElnBs4EysT1HM
	GeJJRgWFANwQnPs8spnfb6GB4sj6EIBUBaGny0
X-Received: by 2002:a05:7300:dc83:b0:2bd:d04c:a42e with SMTP id 5a478bee46e88-2bde1c1a1f3mr2209031eec.15.1772243596986;
        Fri, 27 Feb 2026 17:53:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cf0045sm4737697eec.11.2026.02.27.17.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:53:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Feb 2026 17:53:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/5] docs: watchdog-api: general cleaning
Message-ID: <766878b2-f697-4c6d-af30-313a3a5a752c@roeck-us.net>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-4-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228010402.2389343-4-rdunlap@infradead.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-5015-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:mid,roeck-us.net:email]
X-Rspamd-Queue-Id: A04741BFCC3
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:04:00PM -0800, Randy Dunlap wrote:
> Correct some grammar, punctuation, and capitalization mistakes.
> 
> Drop extra words in printf() calls [likely a copy-paste error].
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

