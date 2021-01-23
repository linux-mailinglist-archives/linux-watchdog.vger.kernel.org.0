Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB6F301722
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbhAWRUD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:20:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbhAWRUB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:20:01 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65AFDC06174A;
        Sat, 23 Jan 2021 09:19:21 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id h192so9916999oib.1;
        Sat, 23 Jan 2021 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eoXaediOkXdklGakOAPGeoS0a6EYsoWmC4XNPGLVnsQ=;
        b=iiLJsh9Vs+6i29YkylgpZ2a2nqeR6YtYZx5vzykhuJVpbIg+pXnWj+0tyaFztxsmxW
         CpOTzdZFgRhvnGbjPEANRd0TPNJtOw9lkxa35umyHhW4eIlFdV8Pvff6l88clcUgkhgs
         IJ1egs9gAxqNR3KJwdndCpgk9vIv3H3cOmB0lMfvHgPq1WBxUX6KyHzDTjmi8cj6MVwq
         oojiIckd4YUWnPkQ4NHT/6uGRwTlCIWoq6cE9d1RePjfizoVFIXGR/AMnLW7wlM9mDpj
         EQIvJh7JTlxVcGrtvxZA/GxXNxvCDL4HaEFhyM0vvtFc60Vh+RGV80Q6yLpbct7Q6EsR
         egvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=eoXaediOkXdklGakOAPGeoS0a6EYsoWmC4XNPGLVnsQ=;
        b=uJQS8YCzSV9etokCBBsL6Ib+Mq3oS0LzoYAJI6qVGKYvZ/L7D4CBQ8jC51MyMIh0ey
         aegSgBKah0Ui4KYntQ+t431niWE6HMRQtiY4utua/3X9wCt+rEMLlziOBm/Xqim3QzRB
         EVyzWRvU6WB6oTtm5+35D4zLMI8e6MRXGqGywWj+pme8oBM2gqYNOvxI6Rh5a2dLt2hZ
         g6oDS63lmlRtt2Euo8aIWGukXJOTre6ww8dyrVZY+REsUbPHtT/GDdpf7fWlyqM+6A0Z
         FAJbJPRa/cVbKW+D3wrE7tNg1Fkvg2s1xomgprMIw90Xfeq4QUy739H09yq+8kILwngQ
         PcGA==
X-Gm-Message-State: AOAM533Ou+6IbIB00uLyBNflTTtl37/Hujg3HZmsihQmHuBYfSK5egdc
        /MOMQG9tYxYdZpB3qatpyH4=
X-Google-Smtp-Source: ABdhPJyalZ3hy1ASEPtojtE5ejZDWaAKtp3JQx7AQWUbUSx3M08uIoU+AjRxbxKtfCKrQiL81Z3uhw==
X-Received: by 2002:aca:3306:: with SMTP id z6mr6479372oiz.141.1611422360902;
        Sat, 23 Jan 2021 09:19:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t2sm2446588otj.47.2021.01.23.09.19.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:19:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:19:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Cc:     jerry.hoemann@hpe.com, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog/hpwdt: Assign boolean values to a bool variable
Message-ID: <20210123171918.GA55938@roeck-us.net>
References: <1611128890-79204-1-git-send-email-abaci-bugfix@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611128890-79204-1-git-send-email-abaci-bugfix@linux.alibaba.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 20, 2021 at 03:48:10PM +0800, Jiapeng Zhong wrote:
> Fix the following coccicheck warnings:
> 
>  ./drivers/watchdog/hpwdt.c:345:2-12: WARNING: Assignment of
> 0/1 to bool variable.
> 
> ./drivers/watchdog/hpwdt.c:126:2-12: WARNING: Assignment of
> 0/1 to bool variable.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
> Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index cbd1498..22ddba3 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -123,7 +123,7 @@ static int hpwdt_settimeout(struct watchdog_device *wdd, unsigned int val)
>  	if (val <= wdd->pretimeout) {
>  		dev_dbg(wdd->parent, "pretimeout < timeout. Setting to zero\n");
>  		wdd->pretimeout = 0;
> -		pretimeout = 0;
> +		pretimeout = false;
>  		if (watchdog_active(wdd))
>  			hpwdt_start(wdd);
>  	}
> @@ -336,13 +336,13 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  	watchdog_init_timeout(&hpwdt_dev, soft_margin, NULL);
>  
>  	if (is_kdump_kernel()) {
> -		pretimeout = 0;
> +		pretimeout = false;
>  		kdumptimeout = 0;
>  	}
>  
>  	if (pretimeout && hpwdt_dev.timeout <= PRETIMEOUT_SEC) {
>  		dev_warn(&dev->dev, "timeout <= pretimeout. Setting pretimeout to zero\n");
> -		pretimeout = 0;
> +		pretimeout = false;
>  	}
>  	hpwdt_dev.pretimeout = pretimeout ? PRETIMEOUT_SEC : 0;
>  	kdumptimeout = min(kdumptimeout, HPWDT_MAX_TIMER);
