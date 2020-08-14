Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB6E244B9C
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Aug 2020 17:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgHNPHn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Aug 2020 11:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgHNPHn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Aug 2020 11:07:43 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8D7C061384;
        Fri, 14 Aug 2020 08:07:42 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so4532329pjb.4;
        Fri, 14 Aug 2020 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2WJZmb/9j/lJrYy6XUlCDvRD3jn20ajzn+B7UCjANxM=;
        b=Qop568MyWRB5QTovtH7OrJYXTCmm6Qj4e+13BqR/UKZOMzCMCiVnjq0d+gDv0cZWpX
         wTOH8Sg4KcXScYvhCcmPZKSZi1rSC0SNo36a1TmTiFwA7tB2kVBuUMYI4RTVoAOuAprz
         kIu+ZV7jvt4KJRGNo6/InNGXZYUwi4eKTQioKa9MK5VX60DiExplvsMNahexNj2MVYAH
         puM6l1SlM2SGgLMe9S6B0LnX6UPS7Rz7APj40q/cyVUC65sI1DG2Ki0kIxHa17TJCk6D
         Nx+bKMMXvja0hZEnu4CZ3mq4dHs8tCRSzChlg+rChJfPmKQEQyLEDpzKfWbepIqoSLoD
         MI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=2WJZmb/9j/lJrYy6XUlCDvRD3jn20ajzn+B7UCjANxM=;
        b=DDPbklnHdTTAZa2gn7Gup+DyG4cLDz9ut4UN7n+vYYNegnaxnvXMckBoDxJyfaB5K+
         Z6Bba4ARFmxNGM62tQ36SQGd8oh2LNS+P8euH/DFevalOhAm6fyUzZ4FOG1XCmEbonYe
         kQKKmEp6hsYWJIV+VExWClTK3byEqpiol/wHIty+YOBBYYufUawcevLqo5r/xUOlmzGW
         zjA82+pDO7GJb4Ddc//zpgSid7dNPEGMEYbd3vHXYx4RrKCwCUm+FCjw3DUBmbSb7sjc
         c8Hpx/IsbyYwb8VxOSIvZdpEC66eLuLMqAceT3mCx8NOQ7kU0geL7+65RfXcaf5vN6Yh
         PQNw==
X-Gm-Message-State: AOAM5306sp2GgT69W9dda83XAW3jgRwraQEC7wLTw//DpqFajBzzqOhi
        exHGndSRoly7d3cNe5PllF8=
X-Google-Smtp-Source: ABdhPJzlzLWOXtIs1V7663bJTcD63HqfEjrZ/ghq+Np2jwvKZAcrugJaaveQhtLGEQXSnx1qiE3pyA==
X-Received: by 2002:a17:902:9787:: with SMTP id q7mr2446876plp.0.1597417662360;
        Fri, 14 Aug 2020 08:07:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 193sm9665437pfu.169.2020.08.14.08.07.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 08:07:41 -0700 (PDT)
Date:   Fri, 14 Aug 2020 08:07:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org
Subject: Re: [PATCH] drivers: watchdog: pc87413_wdt: Fix Race condition bug
Message-ID: <20200814150740.GA254327@roeck-us.net>
References: <20200813125451.19118-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813125451.19118-1-madhuparnabhowmik10@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Aug 13, 2020 at 06:24:51PM +0530, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> After misc_register the open() callback can be called.
> However the base address (swc_base_addr) is set after misc_register()
> in init.
> As a result, if open callback is called before pc87413_get_swc_base_addr()
> then in the following call chain: pc87413_open() -> pc87413_refresh() ->
> pc87413_swc_bank3() : The value of swc_base_addr will be -1.
> Therefore, do misc_register() after pc87413_get_swc_base_addr().
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Another candidate for removal. The entire driver is at the very least
questionable: It hard enables the watchdog after registering it, making it
mandatory to open it within one minute or the system will reboot. Also,
the driver doesn't even check if the hardware even exists; it just assumes
that it does. And then it reconfigures that potentially non-existing
hardware to use a specific chip pin as wdt output, as if that would be
useful if that pin is not wired up. Worst case that driver may actually
break something if it is loaded on an arbitrary system.

I really don't see the point of trying to patch it up unless there are users
left who can confirm that it even works on existing hardware, and then I'd
prefer to have it fixed for good and not just patched up.

Thanks,
Guenter

> ---
>  drivers/watchdog/pc87413_wdt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
> index 73fbfc99083b..ad8b8af2bdc0 100644
> --- a/drivers/watchdog/pc87413_wdt.c
> +++ b/drivers/watchdog/pc87413_wdt.c
> @@ -512,6 +512,10 @@ static int __init pc87413_init(void)
>  	if (ret != 0)
>  		pr_err("cannot register reboot notifier (err=%d)\n", ret);
>  
> +	pc87413_select_wdt_out();
> +	pc87413_enable_swc();
> +	pc87413_get_swc_base_addr();
> +
>  	ret = misc_register(&pc87413_miscdev);
>  	if (ret != 0) {
>  		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
> @@ -520,10 +524,6 @@ static int __init pc87413_init(void)
>  	}
>  	pr_info("initialized. timeout=%d min\n", timeout);
>  
> -	pc87413_select_wdt_out();
> -	pc87413_enable_swc();
> -	pc87413_get_swc_base_addr();
> -
>  	if (!request_region(swc_base_addr, 0x20, MODNAME)) {
>  		pr_err("cannot request SWC region at 0x%x\n", swc_base_addr);
>  		ret = -EBUSY;
