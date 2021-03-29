Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3807934D9C4
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 23:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhC2VzU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 17:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhC2Vy7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 17:54:59 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81318C061574;
        Mon, 29 Mar 2021 14:54:59 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id i81so14502222oif.6;
        Mon, 29 Mar 2021 14:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BjkcwKEqNjJgM0t3MJhPMzYXQdDwGVDT7/k2oMawxgc=;
        b=mJDF3boChOWtqd1vtfjX2c4/hJpf3zpYe/ZgCgDCy/Z4gqnsdaEcYCKLlSRb5x5k9T
         WMszl2GmEPNTAxGTzrJVAvtFOKDa12IFJEEsi42WQo19bVUycVVqZ/EllTyTBsGBKmp7
         S0RhuYDH/gl+/mafuVvWAb7ijoCbtmj66h2kyu82wxfaX9wA7DeWE0Hj/60i/6mWtv5d
         AWm05vm1pSxmn769Dj/l2X3lNfnmFcKALV1pqJXdA7W+a3zoY8FWiZFRPjK4/sV+bDIw
         y9hxQuHYpTRweKzB7cha/NfZuFKUl2uEYaq2ti8arC1xP+ydEaNUPmQedRlGHoVePIex
         I0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=BjkcwKEqNjJgM0t3MJhPMzYXQdDwGVDT7/k2oMawxgc=;
        b=q/nMDkw5L0pYkTUU7fvR/h6xsm3Bvp+gEC6MvrpKwHirRIuFk3kfJ37UExC32yXVW3
         0Y2NqqKhbzB3fh38ZPbH7CF+4HXPnfmPGntuDu3yFOAsOKAGRdQHBW2oWiAaxy3NCv5c
         TkdGhoNfrUuclQloHysehzGsmDodSL85FrRDlpbYXP6Hp4HryL1NsFbjiNgw6/j34RxL
         H20ZPUZkYXr938TIIvq/qKcyHqBgd3ufg+Zx0r2E0ihobnVFJeS/l+s6MusUrEVJqWR0
         hIk/l47Q+5ajX5KK606okp5K3xu+J1+o5Wb1aTF6OHSYC43CaO8XpXiPcFMPnqAqHjye
         y0Ug==
X-Gm-Message-State: AOAM533gqGPrNPyXz5N7eAutqwZxoJoDFnSGO0ktvOpg3p/1JCqKg16B
        yv6ciUMrsUFbZdI5I+c0PLatoml0HUs=
X-Google-Smtp-Source: ABdhPJyxPQZqv7XRV5egRp7Sw7VKfcZL8dGPZQtHn8DOIQHU78TuZ7Ot2oQe1egwryo4UamgXosq/Q==
X-Received: by 2002:a05:6808:1482:: with SMTP id e2mr873849oiw.138.1617054898919;
        Mon, 29 Mar 2021 14:54:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h12sm4846106ote.75.2021.03.29.14.54.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Mar 2021 14:54:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 29 Mar 2021 14:54:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     shubhraj@xilinx.com, sgoud@xilinx.com, michal.simek@xilinx.com,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@xilinx.com,
        Srinivas Goud <srinivas.goud@xilinx.com>
Subject: Re: [PATCH V2 3/5] watchdog: of_xilinx_wdt: Used dev_dbg()
Message-ID: <20210329215457.GJ220164@roeck-us.net>
References: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
 <20210329161939.37680-4-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329161939.37680-4-srinivas.neeli@xilinx.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 29, 2021 at 09:49:37PM +0530, Srinivas Neeli wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> This patch removes pr_info in stop function and adds dev_dbg()
> in start/stop function to display device specific debug info.
> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in V2:
> -Updated minor review comments.
> ---
>  drivers/watchdog/of_xilinx_wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index f76ec56859a4..5f31fdea517a 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -71,6 +71,8 @@ static int xilinx_wdt_start(struct watchdog_device *wdd)
>  
>  	spin_unlock(&xdev->spinlock);
>  
> +	dev_dbg(wdd->parent, "Watchdog Started!\n");
> +
>  	return 0;
>  }
>  
> @@ -92,7 +94,7 @@ static int xilinx_wdt_stop(struct watchdog_device *wdd)
>  
>  	clk_disable(xdev->clk);
>  
> -	pr_info("Stopped!\n");
> +	dev_dbg(wdd->parent, "Watchdog Stopped!\n");
>  
>  	return 0;
>  }
> -- 
> 2.9.1
> 
