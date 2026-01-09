Return-Path: <linux-watchdog+bounces-4780-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA1D0B914
	for <lists+linux-watchdog@lfdr.de>; Fri, 09 Jan 2026 18:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D6F3305A2E6
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Jan 2026 17:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224B835CB85;
	Fri,  9 Jan 2026 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXyugClR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0E23ABA1
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Jan 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978522; cv=none; b=mlVoztKx+uKonE8reFMUnoKYgF3YPdG6uJNR3U3ued2gPPGYKLvCUhAAfC89I5mHHwMqiAzrr+Z6q2bz1QQ0DkdVvoNZOfkLPXG8l4uy+8VhjiQnMKR7s49YutU0Am+/pA739bd7JibqTAvHcq4ODaJnht/EEZnYEbfRXdH+Cn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978522; c=relaxed/simple;
	bh=Oj5XT7gzz6V+mgFqjrRZNuY8ClDDS/vylEH+eVJ2xkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9f+6EUmjJk8kXTtgu6+BgL5VjXYEtTTMzzwMtRiNgV/5d2fdhuyLWAHP+TMQm0mKuyGR9kijPXYx7TA347gQ94SRxv5UNxy9XC2gxcCFFVNu9XtWAVsvafhIf2E+WPgZamdYWC5Nc8/P3p2UbBGWbdzUlHlBNdbS23bVLFHoUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXyugClR; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1205a8718afso4783200c88.0
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Jan 2026 09:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767978520; x=1768583320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhwhqtJUa1G9Nx32o/FtP8XZe5o3pLenUR9s9//PqGM=;
        b=JXyugClRzPxv+gINuTmXSJQ8EcE0P/Gvpr64+kGOVYQyzasJOJYZ1hhkDqyhQIvGUS
         61VvHcyt3YwNnVz2QbdF+HTR68Z+n5jQo5ZPWFJUn9P5IKM2imFCmGfSRKqLngwxR1hM
         BqSHKCbnSC0JGsT9kfhti+l3+si6R5aQ+Y4lhyaXu8SzBCyoTnDjsczU3LTNjGCmwvYh
         AyMnsjgwLWPah8+t7jBdV4weWPcUMlTr/fxUNUAr6Mtwn1MLa4CVErbdDUaUs+S2R9YN
         p36naihle0z+xsWPak+Hu232/Hg9nmNQCGInGqRf7JUNd79GSGdeFQKtLz5tY3tyEx3p
         FXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978520; x=1768583320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhwhqtJUa1G9Nx32o/FtP8XZe5o3pLenUR9s9//PqGM=;
        b=urzH6Ty8mwx1iMEk8//jWDUdxN135OSWJhMga7RHWB9C7mxMfBRtUe5zc6iogorKqQ
         7+chPWgoMaDAGXqjxdLXIRcH7V6qdfs8Fh//+2SXirrbPvp5KKCVRZtU9PgfAfzeTmdK
         tqM84SAv1mkIg637Th7yG+vVy+33KKMTF+YG4rYBX6+L4aZcuWJYAl5XMZs+wTQnj5Vm
         99R8F2gHlLI7VyVKVU6UAzpY0CW1yYoLMbDkRH6CoGZD5oXk3sK4o4fOo61UTjb5MSHC
         RwCRj9i0TPIiC//KWsnxKdTfAaCKO4LNTIWuB841msh/gQMZ4HkrXCXmQ4e2GtqWmFXD
         ZokQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYA7C8gJ8zepbMCRmVXK1qa+z2Ag8vEln8YJUMUx4RxqIq6RL8K5jS8WH+JPe4lqCCI+HsBA82VAHPDp87Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZdcY+xwsveTPDY0wpiuFtYz8pYLdKDsRnVZMGz/cA7arelmD
	IShx8HKDntfIJch+aB6Uw5ER3V/XU48QCHRDo8UPJWHzFoctZQUKRdcN
X-Gm-Gg: AY/fxX4W2xTVXhxafww1XlVFCso8+4j8RjPvaM6R4ZxuD0RVkQnt4knb6SFxYNZQs5H
	Oo0RxrpAjQVOP+GX8c4Z6b8XsNvTk/hpuy4saVjAFE2gYz7pI7Ao13cuh1c7aZipQUP2lNmbK5R
	R9MG+txijnFM0PkfrOWG94vWXLRyHiblcLhTE1VKhpiAFhw+65MfMZYC59O5UCpHwCDLIbsrqDf
	ZDacaSAdZvvletqYaqktCxCjpkI2tO0BDXijTvlyQ3KeDexouperyuNQmajb6hOctNU/xOAWHvS
	+GHrzvZ61kLO72tHdNtsWrIyuoxn30dJ5JWPJYcs794sIb2Mzsg9hDqgkYJnnnmjXGB6S5Jfd69
	weBQ1ZKKM5WIwM33kLug+8fzrPETV0IGjQ8jhpTAuZvxdGDfbnE/b+zPP0l2oL2wBefQ5HNQb5T
	BqPwQt7K8NwlMAM1wnIgispImlu7KXlhCt0lA=
X-Google-Smtp-Source: AGHT+IF0XYbVCtQZkYft+0Wps7/tAcEc9PTYImYZJiepdGfxjC1QwtTJOXR0bcfPsOOi+CQ4RicAtA==
X-Received: by 2002:a05:7022:927:b0:119:e55a:9c04 with SMTP id a92af1059eb24-121f8b7b3e4mr9012115c88.32.1767978519349;
        Fri, 09 Jan 2026 09:08:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b16e4sm11246399eec.26.2026.01.09.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:08:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 9 Jan 2026 09:08:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Masney <bmasney@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 10/13] watchdog: pic32-dmt: update include to use pic32.h
 from platform_data
Message-ID: <76129cc9-345b-4866-8cb9-b36e4374cf8b@roeck-us.net>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-10-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-10-99859c55783d@redhat.com>

On Fri, Jan 09, 2026 at 11:41:23AM -0500, Brian Masney wrote:
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 

linux/platform_data/pic32.h doesn't exist upstream, and I was not
copied on the patch introducing it, so I'll just blindly asume that
this works.

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
> ---
> To: Wim Van Sebroeck <wim@linux-watchdog.org>
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/watchdog/pic32-dmt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/pic32-dmt.c b/drivers/watchdog/pic32-dmt.c
> index ab0682492c85ad63160bb7da61cc74336698a4e9..12e3a8f63589862e3ed674ffb71ee4798755e56f 100644
> --- a/drivers/watchdog/pic32-dmt.c
> +++ b/drivers/watchdog/pic32-dmt.c
> @@ -12,12 +12,11 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/pic32.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/watchdog.h>
>  
> -#include <asm/mach-pic32/pic32.h>
> -
>  /* Deadman Timer Regs */
>  #define DMTCON_REG	0x00
>  #define DMTPRECLR_REG	0x10
> 
> -- 
> 2.52.0
> 
> 

