Return-Path: <linux-watchdog+bounces-333-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC91812142
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 23:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ECA41C20EAC
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 22:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0557FBDA;
	Wed, 13 Dec 2023 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNdirChu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644ABAC;
	Wed, 13 Dec 2023 14:14:11 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d9dadc3dc0so5760104a34.1;
        Wed, 13 Dec 2023 14:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702505650; x=1703110450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUOnuYPNNImTr05uNyh+XqTTfSm5CyCumIyly8xyq6A=;
        b=SNdirChuLu8QJ8oubJL7Uzg18dHyT+gupDes1MJ2PjkvwkCjfPM8u3KXHKfIjsIOUZ
         zQmk0JXYv+9Km/zsBIE4V4Rew60l3KNSwu8NGPCsWjnHYFg5rfoJwIfPUuL6XYyztJkv
         iDkexcRAUxtRBz92h/j6JxAfLOir9NPjx3F223osoQv2cJtobfl6kW1rwR686QkJ1C2T
         klCMO/Jkg0r3y7u+pKcvGmTrcDXzeVc/ayxK+GjvbBWClDhRW5kT6OWpG0IZLfiOsTlX
         RNCJYXp2JofSO6QasWWnstbaAN+aH3FV7dHxHTtdBot6TjReiVf8QOTaZUEanMBQ6z0K
         +Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702505650; x=1703110450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUOnuYPNNImTr05uNyh+XqTTfSm5CyCumIyly8xyq6A=;
        b=E4OmmJ2buWrSCV6R9SXXbHRdUmYislda3hZeXf3MOQ9k3bcUJO2gfhRue9kMyyBwXj
         2j6O+J/xrLF2tuvJlXrnooKX9iymtUueWdnjlz5SpQBimhLKRYJI7lolA1CJ4rp9duFJ
         f0AC61C35KbXlHMalGAz2DWF2cAIFyrBcbbqaeFsLwmZbTI0wvyLBGKJguLefh+EzDiw
         AjY5UBLS/1LZlRg+D5VdM7K8Ic0DitAPBdpCDcBl9Orv+fDRLOJv2xoARKXSw4MNlV6O
         kX8+FzT9B1zB5sZBMjLTPO0dniEjg5IV0NmLkgHGknZLAKqXZXKbqiszT2OwVec3TMUb
         jrlw==
X-Gm-Message-State: AOJu0YzEvUPpmJGhECZZeGaD5jcYV9pi31+X9S5Lyr+WjiGEjJkgpaZI
	QoONluCRiEVEvxJ94xbl+KCdcJFx/6M=
X-Google-Smtp-Source: AGHT+IGzeWMpPCS0h2eAUQFLsaql0jYjbgEVxLLgH+tJTNK0dUXnWNocmWmBASPdYKv+VBy8CXQ13w==
X-Received: by 2002:a9d:7f8c:0:b0:6d9:f4a3:aece with SMTP id t12-20020a9d7f8c000000b006d9f4a3aecemr8913972otp.49.1702505650512;
        Wed, 13 Dec 2023 14:14:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c11-20020a630d0b000000b005c2185be2basm10368437pgl.54.2023.12.13.14.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:14:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 Dec 2023 14:14:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerry Hoemann <jerry.hoemann@hpe.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO
Message-ID: <9c7c6ba4-2140-4d1c-b2de-705b9f6b9e2e@roeck-us.net>
References: <20231213215340.495734-1-jerry.hoemann@hpe.com>
 <20231213215340.495734-2-jerry.hoemann@hpe.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213215340.495734-2-jerry.hoemann@hpe.com>

On Wed, Dec 13, 2023 at 02:53:38PM -0700, Jerry Hoemann wrote:
> Avoid unnecessary crashes by claiming only NMIs that are due to
> ERROR signalling or generated by the hpwdt hardware device.
> 
> The code does this, but only for iLO5.
> 
> The intent was to preserve legacy, Gen9 and earlier, semantics of
> using hpwdt for error containtment as hardware/firmware would signal
> fatal IO errors as an NMI with the expectation of hpwdt crashing
> the system.  Howerver, these IO errors should be received by hpwdt
> as an NMI_IO_CHECK.  So the test is overly permissive and should
> not be limited to only ilo5.
> 
> We need to enable this protection for future iLOs not matching the
> current PCI IDs.
> 
> Fixes: 62290a5c194b ("watchdog: hpwdt: Claim NMIs generated by iLO5")
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index f79f932bca14..79ed1626d8ea 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -178,7 +178,7 @@ static int hpwdt_pretimeout(unsigned int ulReason, struct pt_regs *regs)
>  		"3. OA Forward Progress Log\n"
>  		"4. iLO Event Log";
>  
> -	if (ilo5 && ulReason == NMI_UNKNOWN && !mynmi)
> +	if (ulReason == NMI_UNKNOWN && !mynmi)
>  		return NMI_DONE;
>  
>  	if (ilo5 && !pretimeout && !mynmi)
> -- 
> 2.41.0
> 

