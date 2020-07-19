Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6A522521E
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jul 2020 16:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgGSOBC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 Jul 2020 10:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSOBB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 Jul 2020 10:01:01 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9CBC0619D2;
        Sun, 19 Jul 2020 07:01:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ls15so8838302pjb.1;
        Sun, 19 Jul 2020 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gqKal9373FvAYcv1PeqwirbprYDX5FwkbikzLeDdPn4=;
        b=Eh6/SxTVvoW8ldt7WR1pVyXiYf+7TOSAaV/rZ6dhugfSyHNonyQg/o4u3FDFF+vgLT
         TZ/JPR8Z8UmI8+7ZVZhDHAszdSm0wyHxVG02s4CUUQy1ZVmIafs3G6jUt+EKnt/pVr0N
         KtbJOYfHaE65ofnZmYYO/SfEMvxky6UycWUW5HCekfmZ0e0dKe8qw0GJX+EsHxEa9lXf
         I4tqBrSQpDYO9grhrll4OayiYQhj51VIcAhUaM9bD6a2ZA4aHr6wFWv1izjMFF/5GcXU
         x8B1dlZlt3l9bOwGyPZijA/aC+EfW2RjJwb5Z9jpF08yyqDk8X7V5FhX9Asui95yNPvo
         cenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=gqKal9373FvAYcv1PeqwirbprYDX5FwkbikzLeDdPn4=;
        b=QqPvqN89NKeHwmlncxTYoTs9IGxCOQiGCgPZ6D+TMaLOG8/hzlXfQbrCSrryYQU1Q7
         6ZJwDCGli4KybraQ7o12qJZ2QLZv/1QSj7EHfMv+hO6GPBeU7/JrIejYbbsPMRZWaLGg
         KfSkO31KfDkjbvZEv2+y50NhO3X/stS6n4Me5x2IHvYgGZ8n215kJ/oTFpVsvRxit0ZU
         qrLCZ7xYOea42HHJrWWVNs3dd1Cmw3KaztOh7vmdymWXxH9s32Iu9++fQLH40SohxkH0
         GbBF53P5RRruNeC1kQf2Fy22706Xg8PJZP8hMTGoRw8xQPd2aXhNIrSoUd28I0zNXNJ3
         Kt/A==
X-Gm-Message-State: AOAM533bYfPgnIRWCzibbLQJ6B+ty5m0OSanNklcA7r89Dee9rCoj3Ug
        vJ5sfs4Ilfy3iPK/Dy00UFOqi03E
X-Google-Smtp-Source: ABdhPJwH2Ujy/XK8fbYBCF+cqLgtL65SLK/zdUIuVlxOXUDLe7liojR5CQRGGuevA7f/INxbbKRyKw==
X-Received: by 2002:a17:90a:348d:: with SMTP id p13mr18657364pjb.108.1595167261103;
        Sun, 19 Jul 2020 07:01:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e20sm13249851pfl.212.2020.07.19.07.01.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jul 2020 07:01:00 -0700 (PDT)
Date:   Sun, 19 Jul 2020 07:00:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Replace HTTP links with HTTPS ones
Message-ID: <20200719140059.GA37522@roeck-us.net>
References: <20200713205821.38223-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713205821.38223-1-grandmaster@al2klimov.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 13, 2020 at 10:58:21PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not just HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  Documentation/devicetree/bindings/watchdog/davinci-wdt.txt | 4 ++--
>  drivers/watchdog/Kconfig                                   | 2 +-
>  drivers/watchdog/dw_wdt.c                                  | 2 +-
>  drivers/watchdog/nv_tco.c                                  | 2 +-
>  drivers/watchdog/nv_tco.h                                  | 2 +-
>  drivers/watchdog/sp5100_tco.c                              | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
> index e60b9a13bdcb..aa10b8ec36e2 100644
> --- a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
> @@ -11,8 +11,8 @@ Optional properties:
>  	   See clock-bindings.txt
>  
>  Documentation:
> -Davinci DM646x - http://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
> -Keystone - http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
> +Davinci DM646x - https://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
> +Keystone - https://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
>  
>  Examples:
>  
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 4f4687c46d38..ab7aad5a1e69 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1027,7 +1027,7 @@ config ADVANTECH_WDT
>  	  If you are configuring a Linux kernel for the Advantech single-board
>  	  computer, say `Y' here to support its built-in watchdog timer
>  	  feature. More information can be found at
> -	  <http://www.advantech.com.tw/products/>
> +	  <https://www.advantech.com.tw/products/>
>  
>  config ALIM1535_WDT
>  	tristate "ALi M1535 PMU Watchdog Timer"
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index fba21de2bbad..57bbc1434341 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright 2010-2011 Picochip Ltd., Jamie Iles
> - * http://www.picochip.com
> + * https://www.picochip.com
>   *
>   * This file implements a driver for the Synopsys DesignWare watchdog device
>   * in the many subsystems. The watchdog has 16 different timeout periods
> diff --git a/drivers/watchdog/nv_tco.c b/drivers/watchdog/nv_tco.c
> index d7a560e348d5..179fb9aa3cf4 100644
> --- a/drivers/watchdog/nv_tco.c
> +++ b/drivers/watchdog/nv_tco.c
> @@ -7,7 +7,7 @@
>   *	Based off i8xx_tco.c:
>   *	(c) Copyright 2000 kernel concepts <nils@kernelconcepts.de>, All Rights
>   *	Reserved.
> - *				http://www.kernelconcepts.de
> + *				https://www.kernelconcepts.de
>   *
>   *	TCO timer driver for NV chipsets
>   *	based on softdog.c by Alan Cox <alan@redhat.com>
> diff --git a/drivers/watchdog/nv_tco.h b/drivers/watchdog/nv_tco.h
> index d325e528010f..c65f82588386 100644
> --- a/drivers/watchdog/nv_tco.h
> +++ b/drivers/watchdog/nv_tco.h
> @@ -9,7 +9,7 @@
>   *
>   *	(c) Copyright 2000 kernel concepts <nils@kernelconcepts.de>, All Rights
>   *	Reserved.
> - *				http://www.kernelconcepts.de
> + *				https://www.kernelconcepts.de
>   *
>   *	Neither kernel concepts nor Nils Faerber admit liability nor provide
>   *	warranty for any of this software. This material is provided
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index 93bd302ae7c5..85e9664318c9 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -7,7 +7,7 @@
>   *	Based on i8xx_tco.c:
>   *	(c) Copyright 2000 kernel concepts <nils@kernelconcepts.de>, All Rights
>   *	Reserved.
> - *				http://www.kernelconcepts.de
> + *				https://www.kernelconcepts.de
>   *
>   *	See AMD Publication 43009 "AMD SB700/710/750 Register Reference Guide",
>   *	    AMD Publication 45482 "AMD SB800-Series Southbridges Register
