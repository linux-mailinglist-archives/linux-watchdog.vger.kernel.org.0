Return-Path: <linux-watchdog+bounces-5013-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J62bExJKomk61gQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5013-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:51:14 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A17DA1BFC88
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82B56304A2E7
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649952FDC26;
	Sat, 28 Feb 2026 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qqz+LBc6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A232253950
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243470; cv=none; b=TMuS9o7TsESzMspyMLGylLZoRMLBy5pU8wrkBudrXejT0BiIfAa2mxQv/2mYY6GswzpPpzJct9dMPKxnch0Sn6vPZg26wen7gmrqEc4sn4SE5txVJuzbgRJa70BFhtCweUBgEcILOq+/9VrYNi+6Adwh8RC0+1VtVGkTFgb3uX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243470; c=relaxed/simple;
	bh=gIumB9HImraDox1hWN3n9EH2/4+Lo4nMNxttwLK0DMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lo6Ia2bK2MDdFAcSx88fmZtXXAuo8Nc6nKRQ1Mjr2PH/aARtp3kseaNcnMsXrk6qVsLTx1l9jFZmwZui9Ozhep+cwQHn8gXGkSiznwfJuLKtZJHH1/DIL2WjGgihq8X6Z+E0UC3sbHJd3SWCvkcpao6xGBgD26cBh4nRPqmTiLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qqz+LBc6; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdcb30fe8aso4881558eec.0
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 17:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243468; x=1772848268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYsPGO5+402nK3xRFhcy2EAHOfgolTxteUiFETL5D3c=;
        b=Qqz+LBc6qWvy8+NQiNgB6eDEUdr+7Fom5xWgyRYLCd3RcsLX9AjWSYJ2/yFpSOKp6r
         Cg1KUvL7GCODW3z3HRd59dYgU3whRd7Ij6qhSqAFmEfR2ps6UtSrMvjiaXhHuhTJXhUb
         Kn7ZUrZODhQQCn6dia+de8CYbYbSNUVlL9bTgRugDR5ZpFg79dRhHPD0/Mr49Riz7t8O
         utqRYGMHysy98D1LCfE0znF8B4H0DpHHlAAdR5+OOVIQ6MR4oKHRJanzfEhlMySKktBv
         uUbzutb3YQMXgU/VImcNqFHQ6n+huwTtAK51yRgDpDwl1195OncQoYKV9cFov1HckJn/
         Cb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243468; x=1772848268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xYsPGO5+402nK3xRFhcy2EAHOfgolTxteUiFETL5D3c=;
        b=Hd4pM2ZnMZslQwCAyx0K05S76xPN2vKQ00DXe5xhrMc1LAXK+af65rnDQ6WD+hAE4O
         kU9MtXbbtL0FcQ/Hx2K4H73wMFWYqdtRBmuBho180pir9bILvNOsDOC8iRPqkYToRdFp
         L6FLPF8EasXsEyORysZYAMULB575pPXaayY086qOJ5LXfPWWsBMXs4Wkln9Gj/pHyg8I
         mv3S4AxENHkDUdUxBgLh48r6tkmVYZlYG/6tQA0Wz6ZCmN1Hsqj4qcso9i7+gH+Paazl
         9rNu1e5eaWMqxJve9LCtjGBqqYYNf1ER9R26AxjEwfFQgjPyGAL8BXSEdPN6R7YNDeEE
         8GGw==
X-Forwarded-Encrypted: i=1; AJvYcCV+7VYMoOkTMQi2SBhQi1B6/mBmTSLbA2Su2OX/Bxfnd55jThKy/0CmffkPyCVraI3vIWzVMnnG2lePp+y5ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBNUF61gsATuoqFl1TPho65o4CFkjVBtQCqJH/efCRENoFcdY/
	pKFdJF6DiP63eqs7HlKfnVazl2UlLTk4GFHLISP6JC3oGugE3kYqphvx+gSbCJ/Z
X-Gm-Gg: ATEYQzwXD+MHdKdN83ZPhl6L+R43azF+3hhbkqn6sFCN4op6FObHg53l2FfNI8I2tGm
	I78+gpMnLMDxuPB+4Dt1rtmojsmYRgRE2bF2Ac0KPhydr4AXqtjHaTxfQxodfq1dKRL5ndq+H6q
	iZvTm5AceOoQP+ZERbiM1qrmNU6mLwTjOB9TmVoC3o/R+VekSxTHLXKS5I9AN/TGlbu07i/kOY2
	LfnnabccjTjC32Z4sikXnClSN/jYITppfJp+ny1Mck+Q5dA+4rPMOpl6d7eepfkFtJbnHvK/jDq
	XWNAJ4bm8aAkzu9bI067ZdRbJQEdXJ7ZMjNWmbddb00WO4QG0bcmklXXrwyCKOFuszvk8yKIFwD
	W9guZIjw45nc/fTPvy7ZH7pdZa2LFcTIkxsj7bZ4X4TGhVjqKV8Necdj2KCAL1WGRpTPQ7VCEED
	6ddS1rJy+I/XdsYcgdQlCPru9kqH+zcFlqqQBZ
X-Received: by 2002:a05:7022:6898:b0:11b:9386:7ecd with SMTP id a92af1059eb24-1278fd398a2mr2443833c88.42.1772243468058;
        Fri, 27 Feb 2026 17:51:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43c12sm6591851c88.14.2026.02.27.17.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:51:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Feb 2026 17:51:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/5] docs: watchdog: mlx-wdt: small fixes
Message-ID: <5b334b6a-2712-490c-a88c-46d2239b45f4@roeck-us.net>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-2-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228010402.2389343-2-rdunlap@infradead.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-5013-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,infradead.org:email,lwn.net:email,roeck-us.net:mid,roeck-us.net:email]
X-Rspamd-Queue-Id: A17DA1BFC88
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:03:58PM -0800, Randy Dunlap wrote:
> Correct some grammar and spelling mistakes in mlx-wdt.rst.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> 
>  Documentation/watchdog/mlx-wdt.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20260226.orig/Documentation/watchdog/mlx-wdt.rst
> +++ linux-next-20260226/Documentation/watchdog/mlx-wdt.rst
> @@ -28,7 +28,7 @@ Type 3:
>    Same as Type 2 with extended maximum timeout period.
>    Maximum timeout is 65535 sec.
>  
> -Type 1 HW watchdog implementation exist in old systems and
> +Type 1 HW watchdog implementation exists in old systems and
>  all new systems have type 2 HW watchdog.
>  Two types of HW implementation have also different register map.
>  
> @@ -48,7 +48,7 @@ which is optional.
>  Watchdog can be started during a probe, in this case it will be
>  pinged by watchdog core before watchdog device will be opened by
>  user space application.
> -Watchdog can be initialised in nowayout way, i.e. oncse started
> +Watchdog can be initialised in nowayout mode, i.e. once started
>  it can't be stopped.
>  
>  This mlx-wdt driver supports both HW watchdog implementations.

