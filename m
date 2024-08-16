Return-Path: <linux-watchdog+bounces-1499-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55295535D
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 Aug 2024 00:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 684B3B2221F
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Aug 2024 22:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0879813FD8C;
	Fri, 16 Aug 2024 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cagOpNgc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA7BA33;
	Fri, 16 Aug 2024 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723847709; cv=none; b=j9lmkJnniafSCQn3Napa/uh5EhEgzB71S/Mxh95WdxMVGPZSkiyBT4Qi+yi+obWNm2JfuR4Q2bGk35Z8xQFOatGJirY6Pc0NsXUueypJuYB7CR01RqeP/Ot924/YWdor/SHZba6t3tuY2C/hG/8TjUbCHXY6dlApr1D2RCHIKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723847709; c=relaxed/simple;
	bh=ehLTjwjDdh9blb3CqGfEr+2DDQvrpcXGzOlnOBLI5ec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P96GR+JpBqERjtsnDWD1A4iArJdHrjuQHf76TtMUrewLMNwrIkV/XVLrArBYL1OHVjTqBjj8jeWq0ze9tLtmmkm4V22tHlInYm3/x7f+rVi1gTWcOhI5gtXF1KpxskU6Oj1/LHAfdJHJN8BeJ1P8reGv1Cso4MJSFRyou0MsxqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cagOpNgc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0C938418AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1723847708; bh=kSkA2qMealWsON4N+tqutzsgMm8VvYqfVjBrQ4vneoo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cagOpNgcuEcNSIOt8oidoDU33zfM15DxR6dv4HdK+JVSpaLIC8gxAT/537Lrx6oBP
	 EaUWEU5qNvh+scDUb+xW00OyqOEbvas/xznEyFB243PPEWX+pjDEyYfPDt8ZsTVZja
	 R9raz7WpC0PWW4mws6l5azkysDJv4QLNSYlZiMN/I5g8HVQ4zzlksr70U2BFStOAlz
	 m0c4ZyljxGFbGUZmaA05vZ3VZnfK2dkiRNzXqtR4TiY6Gfu8ucid/H3SOTuckOWYLd
	 JV9gWlNpTW+abb5CiCBWxH/14ME0OohbDH4dPY9ajRj+s/kONHKUiQmsjIkiEE8U+H
	 6pKrpXEN3ZFIg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0C938418AB;
	Fri, 16 Aug 2024 22:35:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: David Hunter <david.hunter.linux@gmail.com>, david.hunter.linux@gmail.com
Cc: javier.carrasco.cruz@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux@roeck-us.net, skhan@linuxfoundation.org, wim@linux-watchdog.org
Subject: Re: [PATCH v3] Documentation: Capitalize Fahrenheit in
 watchdog-api.rst
In-Reply-To: <20240807185332.61624-1-david.hunter.linux@gmail.com>
References: <20240723131849.264939-1-david.hunter.linux@gmail.com>
 <20240807185332.61624-1-david.hunter.linux@gmail.com>
Date: Fri, 16 Aug 2024 16:35:07 -0600
Message-ID: <87ikw0hzac.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

David Hunter <david.hunter.linux@gmail.com> writes:

> Capitalize "fahrenheit," a spelling mistake.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
> V2 -> V3:
>  - Fixed misspelling of "Capitalize" in commit message. 
>  - Put Tags and Kernel Subsystem in subject
>  - Put changelog after commit message
>
> V1 -> V2: 
>  - Fixed imperative mood 
>  - Fixed misspelling of "Fahrenheit" in Subject
>
> V2: https://lore.kernel.org/lkml/7b7ca7e0-6bd2-45ab-bd9b-40331a8e6fdd@roeck-us.net/
>
> V1: https://lore.kernel.org/lkml/20240723131849.264939-1-david.hunter.linux@gmail.com/
>
>  Documentation/watchdog/watchdog-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> ---
> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
> index 800dcd7586f2..78e228c272cf 100644
> --- a/Documentation/watchdog/watchdog-api.rst
> +++ b/Documentation/watchdog/watchdog-api.rst
> @@ -249,7 +249,7 @@ Note that not all devices support these two calls, and some only
>  support the GETBOOTSTATUS call.
>  
>  Some drivers can measure the temperature using the GETTEMP ioctl.  The
> -returned value is the temperature in degrees fahrenheit::
> +returned value is the temperature in degrees Fahrenheit::

Applied, thanks.

jon

