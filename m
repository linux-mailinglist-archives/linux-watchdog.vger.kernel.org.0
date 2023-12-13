Return-Path: <linux-watchdog+bounces-306-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0081154C
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 15:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B21828229C
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 14:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0ED22EB09;
	Wed, 13 Dec 2023 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPHCy75v"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444FEEA
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 06:54:26 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d9d84019c5so5310979a34.3
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702479265; x=1703084065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpW7uTgDJ0LVzftDFAxIJxM7dfaXHy9jBTf1KJqghHw=;
        b=nPHCy75v0ft/M/v98w9zIfqGG0iDqOeiuBPFSD1bEAlC9M5lVK06hoV2a1WOtDmAyp
         aRCkcXv2iOmMvqM8gPRL7MXdMwBvdUWtyDtBOl9kLhEMkTLSEQN9BybazvXSvXFHoJLg
         W3nnBcwo0A1uC88anag9uSfrBbZ8/YsUyRc8NGZWV2pFPVLJs0zftcrHEhFe1ZGgXb3K
         Tl8dthdlO1apWcRHA726SEbX03ngEnVoY1todCDyYg0CQ+eF1lZ5Zl60XiKcZFNU/Not
         aSytnjLIIswNfop7kq85jiuJznmloI0BmBopIVF9/Je7k9Hf2DMQD7BDQXfEquB9VSw8
         J3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479265; x=1703084065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpW7uTgDJ0LVzftDFAxIJxM7dfaXHy9jBTf1KJqghHw=;
        b=i+32IfWI/QZsCOx+SxEl72d597k0XDlVls9noXYl7sliTCB1+1lIRkIIrdXzBO+CrS
         2EqiTrpJQcJPQPWxQ9y9ckNioBHmy8kKWkWp8xauMSy2Y4rpuXWPwRdBu1521HZqz1W5
         v5JSgNDfg+Wn2Cehhfli9Ba/dnEV8pLCX/roe/qeUnn5ZQ6cQ8iyqytBJwB2155cvkkT
         3xsjbDOcq4CZiJNUXVcNwZph9rRpdMKj+HIUvMYtraVfP0bqF2dQtD+b7+9XfXDAECmu
         qYlAUKk3rOMVLvgSbpu7ZMu/2H44SIGjTruYOV4pcwfNCl3bsyZZvsy7mW7sfmcvb62L
         iSKw==
X-Gm-Message-State: AOJu0Yxjn2QyUYNNWMyP2+Bz0PDyb/ymD0cy7xW6RsGYB09h3QnDNj+5
	6pCktlNVqy4tEcnBCOFN8Xc=
X-Google-Smtp-Source: AGHT+IGqyYz4DsANW2JUl4w6wYVLTHqjGYuaVqoCpqzy2+GU7F4EKttcfPJeSrZrVp1qxWfscCFRng==
X-Received: by 2002:a05:6871:80b:b0:203:20da:4a62 with SMTP id q11-20020a056871080b00b0020320da4a62mr1508755oap.87.1702479265571;
        Wed, 13 Dec 2023 06:54:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id lh10-20020a0568700b0a00b002032bb7895fsm198024oab.55.2023.12.13.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:54:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 Dec 2023 06:54:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Werner Fischer <devlists@wefi.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 3/4] watchdog: it87_wdt: Add IT8659 ID
Message-ID: <12e63e5f-22a3-4627-a806-8c2998b9c196@roeck-us.net>
References: <20231213094525.11849-1-devlists@wefi.net>
 <20231213094525.11849-3-devlists@wefi.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213094525.11849-3-devlists@wefi.net>

On Wed, Dec 13, 2023 at 10:45:24AM +0100, Werner Fischer wrote:
> This patch adds watchdog support for the ITE IT8659 watchdog.
> IT8659 watchdog works in the same way as the other watchdogs supported
> by it87_wdt.
> 
> Before this patch, IT8659 watchdog is not supported. After a modprobe,
> dmesg reports:
>   it87_wdt: Unknown Chip found, Chip 8659 Revision 0007
> 
> With this patch, modprobe it87_wdt recognizes the watchdog as the dmesg
> output shows:
>   it87_wdt: Chip IT8659 revision 7 initialized. timeout=60 sec (nowayout=0
>   testmode=0)
> 
> Watchdog tests on a YANLING YL-ALP3L2C-1235U system have been successful,
> the watchdog works as expected with this patch.
> 
> Signed-off-by: Werner Fischer <devlists@wefi.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/it87_wdt.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index ca377096bdd7..f6a344c002af 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -13,9 +13,9 @@
>   *		    http://www.ite.com.tw/
>   *
>   *	Support of the watchdog timers, which are available on
> - *	IT8607, IT8613, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665,
> - *	IT8686, IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726,
> - *	IT8728, IT8772, IT8783 and IT8784.
> + *	IT8607, IT8613, IT8620, IT8622, IT8625, IT8628, IT8655, IT8659,
> + *	IT8665, IT8686, IT8702, IT8712, IT8716, IT8718, IT8720, IT8721,
> + *	IT8726,	IT8728, IT8772, IT8783, IT8784 and IT8786.
>   */
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> @@ -56,6 +56,7 @@
>  #define IT8625_ID	0x8625
>  #define IT8628_ID	0x8628
>  #define IT8655_ID	0x8655
> +#define IT8659_ID	0x8659
>  #define IT8665_ID	0x8665
>  #define IT8686_ID	0x8686
>  #define IT8702_ID	0x8702
> @@ -281,6 +282,7 @@ static int __init it87_wdt_init(void)
>  	case IT8625_ID:
>  	case IT8628_ID:
>  	case IT8655_ID:
> +	case IT8659_ID:
>  	case IT8665_ID:
>  	case IT8686_ID:
>  	case IT8716_ID:
> -- 
> 2.39.2
> 
> 

