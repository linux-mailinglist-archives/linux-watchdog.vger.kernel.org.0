Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C176737BF09
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 15:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhELN74 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 09:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhELN74 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 09:59:56 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2CEC061574;
        Wed, 12 May 2021 06:58:48 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso19842643ots.10;
        Wed, 12 May 2021 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YL9EXXfXSr7hr2VM1Vvn7DYUKeXfwBg9KCxY3cEbcXE=;
        b=MrPAdzHRfm3xcbrq3rV8CzhH6Zpms3/EIk5fgtfVrU7hmklgxguCd7nkjX+0YUlbRf
         CpN5C81b+YI0My3IXMJMhDym8QNxRoI/uRbnePpupt8yV2WPsxT6THXEUU6T5CpIaVWW
         U0FGa0Jnt4zSJIPtLXqXSooVJ5sJuoYK7ymCeC+7hw5OC3hO99p9smOm2W51Lycvlqrw
         4WClvCKoJDNGWP0UkLn9f6Dr2GJa85jsoejH9jdzaUmn2FqnE8MLeEOSRur6ekrpNsP4
         5AEBAuMIVkNppDXi1x1HNxVN//Y1Mq7efz13dFT4oU87L6PkbxJFZJs2E6ieqa038l21
         Tkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=YL9EXXfXSr7hr2VM1Vvn7DYUKeXfwBg9KCxY3cEbcXE=;
        b=hlZViraA8XVIUwrPD1jzFzV/4qaib5cQr52qs6ToXzFcnmTky/Vll/CW+OH4mpe0sc
         ni1njFVQjBI6aGXMp83Fc+hIicjxoogitSmuktQYeCC73yE5MiYpGoYstI5mSu6Fe7pO
         DyH8rnLXmJJ903dxWYRIpbJSVO6QedLQESaaOXIEx3a186EwBFinKEPa9SW+pOxc8zlE
         MdnOo2VYHCCRKgQkfr+l1oljIvtphwpt2DDK+1MELmPiaWzxKh+U0uHIkHmw5/Sm5L3S
         DRICrls8u0gX78Z+a0DgH6XrsTOP8Oy8DA1brb+XDcFqiNoFgl+MW+JXF2k3o+atZUfX
         7aiQ==
X-Gm-Message-State: AOAM530L3pcs/WcGSvAfemCCrz4taMawPUn2F9WnAruXwVrGphpG1R7G
        gGVyJBN8RSJOo4wY28qn0Jk=
X-Google-Smtp-Source: ABdhPJxH0KFdHPrOMkTJLzvUqieoAI236fgmg8NKkRP6BBlQUux4Ujja6oI4Hh2WqYkD8JrAMv3tAA==
X-Received: by 2002:a05:6830:19e2:: with SMTP id t2mr31152597ott.190.1620827927539;
        Wed, 12 May 2021 06:58:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q24sm4701529otg.81.2021.05.12.06.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:58:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 06:58:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 03/10] watchdog: keembay: Update pretimeout to zero in
 the TH ISR
Message-ID: <20210512135845.GC1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-4-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-4-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:17PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> The pretimeout has to be updated to zero during the ISR of the
> ThresHold interrupt. Else the TH interrupt would be triggerred for
> every tick until the timeout.
> 
> Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index b2afeb4a60e3..6053416b8d3d 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -154,6 +154,8 @@ static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
>  	struct keembay_wdt *wdt = dev_id;
>  	struct arm_smccc_res res;
>  
> +	keembay_wdt_set_pretimeout(&wdt->wdd, 0x0);
> +
>  	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
>  	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
>  	watchdog_notify_pretimeout(&wdt->wdd);
> -- 
> 2.17.1
> 
