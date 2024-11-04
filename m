Return-Path: <linux-watchdog+bounces-2411-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED79BB7DF
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Nov 2024 15:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAC211F22AD3
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Nov 2024 14:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AD9178CDE;
	Mon,  4 Nov 2024 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="j62Xb6nC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD72AD2F;
	Mon,  4 Nov 2024 14:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730858; cv=none; b=VGgkBoLvys1suJTnGQvFal6o8VasUse4NEehzFP5Nk82JTweI526ugWuW1vV/BKPxOihHutrJx/AvjW6yNe0mCFCr4fhHp5A4RSuFPc2RKglLa4lVJh1lMU8f63Bfu9PpM/XQLlpfaAz6qBjm7nqpVCqfOclu3eyYHFMXyHNs3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730858; c=relaxed/simple;
	bh=FJw58ULJOurnzlnZmXkynETgmoxyQgWRBJKewA829jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg4Xam0JT38gAfe0yuKdRh9aMxmLTUECmWZdCavfgxpuU0yk1Dz9yVO6bPtE7aB91JljhyYGm7P53P+KlBePZoSk07J/VAe8dmZH2zvVC27Oy7svVTE8WJomJy00Yh2EkQNqEG84/YVkpZD8byUlmbtqkPPMpj9eoK9xnjuo9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=j62Xb6nC; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id DFF51409F8; Mon,  4 Nov 2024 14:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org DFF51409F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730728743;
	bh=FJw58ULJOurnzlnZmXkynETgmoxyQgWRBJKewA829jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j62Xb6nCR9c3nkgJUQG2BFmiD5L31/0cTANF33GCu0bAD4Gn9i76EVN383I8SkLLH
	 8yBH1K94CQvM+DA0nAS+kO5oHX8Qfs+yigHlAWYVkK8RQQQD7eLChk32aZhyAOOF3K
	 UsewnW5RDMiPPRo4xL6CZSrsSfhjN8+F1zK4j2j8=
Date: Mon, 4 Nov 2024 14:59:02 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/pcwd_pci:Fix the wrong format specifier
Message-ID: <20241104135902.GA2225@www.linux-watchdog.org>
References: <20241008084844.13751-1-zhujun2@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008084844.13751-1-zhujun2@cmss.chinamobile.com>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Zhu,

> The format specifier of "int" in printf() should be "%d", not
> "%u".
> 
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/watchdog/pcwd_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/pcwd_pci.c b/drivers/watchdog/pcwd_pci.c
> index a489b426f2ba..3672e7f23b39 100644
> --- a/drivers/watchdog/pcwd_pci.c
> +++ b/drivers/watchdog/pcwd_pci.c
> @@ -230,7 +230,7 @@ static void pcipcwd_show_card_info(void)
>  	got_fw_rev = send_command(CMD_GET_FIRMWARE_VERSION, &fw_rev_major,
>  								&fw_rev_minor);
>  	if (got_fw_rev)
> -		sprintf(fw_ver_str, "%u.%02u", fw_rev_major, fw_rev_minor);
> +		sprintf(fw_ver_str, "%d.%02d", fw_rev_major, fw_rev_minor);
>  	else
>  		sprintf(fw_ver_str, "<card no answer>");
>  
> -- 
> 2.17.1

%d = The argument is treated as an integer and presented as a (signed) decimal number. 
%u = The argument is treated as an integer and presented as an unsigned decimal number.

I do hope that version number are unsigned...

Kind regards,
Wim.


