Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC1E1041D7
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2019 18:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbfKTRPP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 12:15:15 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36027 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfKTRPP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 12:15:15 -0500
Received: by mail-pf1-f193.google.com with SMTP id b19so46951pfd.3;
        Wed, 20 Nov 2019 09:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lq42ZizosFkbH9g1Rr07jdIDqzA1gE/ZC1lOYQz/biM=;
        b=diKGlggZJDKsPlLr50LlIeJobu1j5qlTIPd+wy2fkgwibmd4c4EF8QsTtCKI5YDa+P
         rEQQkIsYjrmHB3T6hA3Tz4WpxPhU6ycjJzP2xGk5BD7EazLXpQayif86GINl+xWE+nJL
         u8s/NvkH6ia2fPzDEhUpDQKNAVoISZQW5EZ5hVs2Pja4UwAAYstQda5wr7APS4P61kLe
         bd7yZEJjwneS8LQlPvYj7wKy2VX0NVC2YQ1oTFPYdNnj7GjssmqSacCIov8K94VHMKue
         9Vr3MYYUEDodfZUaC7ilO91sPP2u0/GqbFvdwer3ga1rNTISJquABE4r94HSkN9Ku/Ba
         p5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lq42ZizosFkbH9g1Rr07jdIDqzA1gE/ZC1lOYQz/biM=;
        b=difG6HiR1poZDlogARhR85oe2CdT4YULC6F7+K4gaN+PZzDSReynNL0hv52Lqhh2sy
         hQEtBBlBcDIu7RXw7vmMN15Oavoe1LKN/pFebpSZCss+Uf+AIPBnqvvOss/mY0COWxRV
         swMdxj1eUWCfrxErVszYBnzZAwaNgjGqMRZ65z79pGi1Ugn0aKRHpPNOiQCD0fnOiIS0
         MVSaj2TOED5nyGasSayiU28FT7ebr+RVmcaIgbani5Px4IqghRNoheOx/azYeBw9KvNI
         tsQ+tA/YVGvg2+dIjHJLQMLy2ytJ9V2tJGQN7f+BWrmrpuQmUUN6I1vkSqUmVMYC5exx
         CX6A==
X-Gm-Message-State: APjAAAVFrKVmevk7uDkuJU55I3909C3ZRUnEXYxovVI/qvvdEmaEJzNV
        oi+VwlDFPY+vbOTtr7mV0jvPNPnn
X-Google-Smtp-Source: APXvYqzqZgo33feZu9MWoEbJBu0NKZiD7xomzt88q5WNOveVMDbKGm9Y7HVIGwS3AWK636g06NPZKw==
X-Received: by 2002:a63:a34d:: with SMTP id v13mr4482571pgn.343.1574270114888;
        Wed, 20 Nov 2019 09:15:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a34sm29504785pgl.56.2019.11.20.09.15.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 09:15:14 -0800 (PST)
Date:   Wed, 20 Nov 2019 09:15:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Message-ID: <20191120171512.GA28255@roeck-us.net>
References: <13477f08400047c1b32030b2680a4241@nokia-sbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13477f08400047c1b32030b2680a4241@nokia-sbell.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 20, 2019 at 10:07:57AM +0000, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
> From 1d051b7c081083751dc0bab97d3ab9efbba0f4a7 Mon Sep 17 00:00:00 2001
> From: Peng Wang <peng.1.wang@nokia-sbell.com>
> Date: Wed, 20 Nov 2019 15:12:59 +0800
> Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger
>  timeout value
> 
> watchdog_dev.c provides means to allow users to set bigger timeout value
> than HW can support, make DesignWare watchdog align with this.
> 
> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>
> ---
>  drivers/watchdog/dw_wdt.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index fef7c61..8911e5e 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -113,8 +113,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>  	 */
>  	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> -
> -	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +    
> +    /*
> +     * In case users set bigger timeout value than HW can support,
> +     * kernel(watchdog_dev.c) helps to feed watchdog before 
> +     * wdd->timeout
> +     */
> +    if ( wdd->timeout * 1000 <= wdd->max_hw_heartbeat_ms ) {
> +	    wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +    }

{ } is unnecessary here. Also, the above code compares the _old_
timeout againt the maximum supported timeout, which doesn't look
correct.

Thanks,
Guenter

>  
>  	return 0;
>  }
> -- 
> 1.8.3.1
> 
