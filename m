Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C74FE39471
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 20:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731930AbfFGSis (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 14:38:48 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44271 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731882AbfFGSia (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 14:38:30 -0400
Received: by mail-pl1-f196.google.com with SMTP id c5so1135066pll.11;
        Fri, 07 Jun 2019 11:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=smqIezHVRd7kEI3m36ux9yMwz7BuscuDTK7XuCHo/dU=;
        b=WS5b+10Cd3QJGj/XPVx7KtuIVoIcmLeOh0vV19LlG6G8bF+47Px2I+Z+iEG9/CSs5K
         wjIqEPcIV6eHxee0a3yh5hwfu64yh/y0flZ3aGDIAMhzK5IXzbXBF2jyczzUcN3RYhha
         Em0aPZte+JSc847kL345RBDVfhwGLvWVMHSTb7UltebQhAUj/+5d4Lh2g3ODIMcRO+wM
         JMiK8BCSX/p/ie1AT1EePrqZw+T15PKTbwDlC1rog1j709x25YMzSmjk9CRPEVzO6Gzl
         ThEUI3Q3AEm2XvfkBFRj91s7Q9BzTWjQhIDrd7Vwqh5UaPBZIeOQ5JyEy+jNCnTZOYyP
         ZlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=smqIezHVRd7kEI3m36ux9yMwz7BuscuDTK7XuCHo/dU=;
        b=AuJUS3t3Aq9yBW18Twkn9iY+IWawUhf0m4e7W4fuXzsmFg481WRG+r6ztbQn6/a6WJ
         xqnQNqp9L7kktFTE9NVKB27mxGXezYoWjpnuETPY6iL370czz88RPfzvQtjuMwwxcROJ
         Yri4+qlilM00daM5FRS3vXISeYZB3ppPIdG9G+Y5QKFSqjIiMnDot1+a53YHkw+8LAGt
         yY1/VMKh40Fsa8l5Xp0NXIJw17IAT1lEHSG3qTT+2z2AMMgzgxNTeR5fArXXOp4JSj/a
         nx4YPZjlrDz/45LObvCeni89nn0wMx8zmZHGQOxhDo4sMiPHjGVReNjIvK5sqaDXmTPo
         lEcA==
X-Gm-Message-State: APjAAAV0FX89LVqgMgNsOlCULU5OwUENr7qK/+nSiFrDpaBsKO1hnks4
        arGkni6Oj1cWvGPmZYpEUrc=
X-Google-Smtp-Source: APXvYqyW7HBscCoIeGySmLbZWFy2qsFZp7KEZQ5VtLx8s3dNzmnqaLYM7bHW/YrxlyliL2dWSp/+YQ==
X-Received: by 2002:a17:902:9b85:: with SMTP id y5mr56768955plp.313.1559932709648;
        Fri, 07 Jun 2019 11:38:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s4sm2765916pgg.55.2019.06.07.11.38.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 11:38:28 -0700 (PDT)
Date:   Fri, 7 Jun 2019 11:38:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: Re: [PATCH v10 3/3] watchdog: make the device time out at
 open_deadline when open_timeout is used
Message-ID: <20190607183827.GA32475@roeck-us.net>
References: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
 <20190605140628.618-4-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605140628.618-4-rasmus.villemoes@prevas.dk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 05, 2019 at 02:06:44PM +0000, Rasmus Villemoes wrote:
> When the watchdog device is not open by userspace, the kernel takes
> care of pinging it. When the open_timeout feature is in use, we should
> ensure that the hardware fires close to open_timeout seconds after the
> kernel has assumed responsibility for the device.
> 
> To do this, simply reuse the logic that is already in place for
> ensuring the same thing when userspace is responsible for regularly
> pinging the device:
> 
> - When watchdog_active(wdd), this patch doesn't change anything.
> 
> - When !watchdoc_active(wdd), the "virtual timeout" should be taken to

s/watchdoc_active/watchdog_active/

otherwise

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> be ->open_deadline". When the open_timeout feature is not used or the
> device has been opened at least once, ->open_deadline is KTIME_MAX,
> and the arithmetic ends up returning keepalive_interval as we used to.
> 
> This has been tested on a Wandboard with various combinations of
> open_timeout and timeout-sec properties for the on-board watchdog by
> booting with 'init=/bin/sh', timestamping the lines on the serial
> console, and comparing the timestamp of the 'imx2-wdt 20bc000.wdog:
> timeout nnn sec' line with the timestamp of the 'U-Boot SPL ...'
> line (which appears just after reset).
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  drivers/watchdog/watchdog_dev.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 334b810db2cf..edfb884044e0 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -133,14 +133,15 @@ static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
>  	ktime_t virt_timeout;
>  	unsigned int hw_heartbeat_ms;
>  
> -	virt_timeout = ktime_add(wd_data->last_keepalive,
> -				 ms_to_ktime(timeout_ms));
> +	if (watchdog_active(wdd))
> +		virt_timeout = ktime_add(wd_data->last_keepalive,
> +					 ms_to_ktime(timeout_ms));
> +	else
> +		virt_timeout = wd_data->open_deadline;
> +
>  	hw_heartbeat_ms = min_not_zero(timeout_ms, wdd->max_hw_heartbeat_ms);
>  	keepalive_interval = ms_to_ktime(hw_heartbeat_ms / 2);
>  
> -	if (!watchdog_active(wdd))
> -		return keepalive_interval;
> -
>  	/*
>  	 * To ensure that the watchdog times out wdd->timeout seconds
>  	 * after the most recent ping from userspace, the last
