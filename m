Return-Path: <linux-watchdog+bounces-305-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5BF811549
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 15:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40DE4B21180
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5412EB09;
	Wed, 13 Dec 2023 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSRnbInp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DE993
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 06:54:15 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b9f727d94cso1548122b6e.1
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 06:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702479255; x=1703084055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osSYcT04uaq4C87YvJ7sdABDMGDH8lVQE2vjizUMP4Q=;
        b=MSRnbInpCHwiZ8Kw5YyypxRXPiSkqubhK2CxPA887Nl1n4SVHqORJsMMSL220Iutq0
         2rvm2j0zgplZ4YijuqUW6MmQHDvPhkszAqpyh8I5sCRRQFo6khtGOreqPy4o6O5XvBE9
         /zTJ2ZJU7Iyn1Wu+pjb8R1sig484gTCW7ShP8MhcpGsy6XchDy4cUkX6WL/+ZKtcFxxB
         cAh/gzDTn0ftN7Pdpz9/3VREDhmBf1Eq1G+ZuVb3hTF9Dhm8maisAaZ110ivMkwqQX37
         JiGB/bqtn876E2bKpgoFFXsvdxtxZ5yxC9QaVLQqTT+V+icRIstF5AMkn9atFbKXD70b
         S2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479255; x=1703084055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osSYcT04uaq4C87YvJ7sdABDMGDH8lVQE2vjizUMP4Q=;
        b=JK5Ywi9oImzXJdwQlNL6j5xKKalF9s2YRTAr+simlMwskLJI/fcSth6hdosmm0ubzV
         lSaijSRYhFc8+gNsfBw8aLHOo2B6RwavFmaZm+yB7wcjg23ezxsonbA5x2c1qZM1enl+
         XIfQO/bhgyccXV+puxHV8bSWzvV9V+BORtZKicK/6349LKTqfLvgSU/VPuzWJmZAhCPL
         Ak8miSGexAJKHwilufLgN9tsWvZ2L20tiFHZ0lU2r4e5ySQ32PAjVJLanv24cujA98q0
         qM5nV2uzBG6AoZ2i2BHduPoCTieH32YsW2FKS5RUW46IQwlqiRtBQZP6GUbac68lRdcP
         ge0Q==
X-Gm-Message-State: AOJu0Yyz8sKCtFhzdzZLSTfBasJOUDyhzLT7FYz7LfG2ved7qSXSFkDr
	7KkP2p+Z0kIRQUuyec3D7I05qW7r22wgHA==
X-Google-Smtp-Source: AGHT+IFoFeUPPHEyT0oOa2FsPeVIq+jFnSUOa2oRx+TODCYTKblzrDqN15qrGgTzpAGU2Brhi8YOfg==
X-Received: by 2002:a05:6870:7251:b0:1fb:75b:2bb7 with SMTP id y17-20020a056870725100b001fb075b2bb7mr5095026oaf.115.1702479254672;
        Wed, 13 Dec 2023 06:54:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id pf11-20020a0568717b0b00b001faebb7ff77sm3975184oac.56.2023.12.13.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:54:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 Dec 2023 06:54:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Werner Fischer <devlists@wefi.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/4] watchdog: it87_wdt: Remove redundant max_units
 setting
Message-ID: <726241dd-ed73-48b5-8132-d34545ec6ede@roeck-us.net>
References: <20231213094525.11849-1-devlists@wefi.net>
 <20231213094525.11849-2-devlists@wefi.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213094525.11849-2-devlists@wefi.net>

On Wed, Dec 13, 2023 at 10:45:23AM +0100, Werner Fischer wrote:
> Commit 893dc8b5c978 ("watchdog: it87: Drop support for resetting watchdog
> though CIR and Game port") removed the try_gameport variable, and left
> max_units setting redundant.
> 
> To clean up the code, this patch removes this redundant setting.
> 
> Signed-off-by: Werner Fischer <devlists@wefi.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/it87_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index 6b7f7ec03633..ca377096bdd7 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -274,10 +274,6 @@ static int __init it87_wdt_init(void)
>  	case IT8712_ID:
>  		max_units = (chip_rev < 8) ? 255 : 65535;
>  		break;
> -	case IT8716_ID:
> -	case IT8726_ID:
> -		max_units = 65535;
> -		break;
>  	case IT8607_ID:
>  	case IT8613_ID:
>  	case IT8620_ID:
> @@ -287,9 +283,11 @@ static int __init it87_wdt_init(void)
>  	case IT8655_ID:
>  	case IT8665_ID:
>  	case IT8686_ID:
> +	case IT8716_ID:
>  	case IT8718_ID:
>  	case IT8720_ID:
>  	case IT8721_ID:
> +	case IT8726_ID:
>  	case IT8728_ID:
>  	case IT8772_ID:
>  	case IT8783_ID:
> -- 
> 2.39.2
> 
> 

