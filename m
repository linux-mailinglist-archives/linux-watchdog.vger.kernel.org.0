Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A284E3AA8D7
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jun 2021 04:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhFQCEL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Jun 2021 22:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbhFQCEK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Jun 2021 22:04:10 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F602C061574;
        Wed, 16 Jun 2021 19:02:03 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so4632375otl.0;
        Wed, 16 Jun 2021 19:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yIbg81wAoQ5hR4s9vM2buCmpTMZ97ZZ4K19Br71xyb8=;
        b=k82TGA5sSPPxVHmXCPcqNnX1MlQQssUE8mOiuFBNWm4ALfcuaYhZWD4IdPP+TFaRmF
         SHzVtZISE/mCJQQYpDXZIt78fyS+FWbJd4Ykq++I7gO50ImiUKhmokwXLH7n2E/qwjv9
         eDzEcyohN5J/hbtRuV1UA/nHdnTySZFH6r9EocrAD/Q9NF5TlrUnimSykHC/Dri1Gv5k
         qVv5jEtQiXSdQkEhCu7MmWST8mfxYsgdAygumrbGJLdoywrKVsKEYvrH9zU3l0BBa/ce
         FPU8ATVjSWWyXPeZRFGVtpHT0Jgje0+sxk5P6pTmqbOdRdcxyCvnWVMk5NuF86ra1XP6
         MPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=yIbg81wAoQ5hR4s9vM2buCmpTMZ97ZZ4K19Br71xyb8=;
        b=WCmy9odCcY8HSGCAm7R8FRYYlh0lgW9hs0tRm6+oHzVnTDjRzQJVSqRB6oInkKMCPs
         mj526a0OKctrzjVdGIsrKSwpb0o8FRzMroxVQwFKz3vf+Re9GawfTdK0wCqyruDrOpj8
         Oq7PZd7jN8U6KaZ80UONOZGqqGC0BWaAOBgfk10BMSxIKjFSWkY5DVvX7GzpYNlj4B3T
         X6bPqCjN4DTj5vmpA+H3pPB+EsCU3szrlvjcwiKWcaJRaq5KpKUN6BFsGKQgPLg4nryx
         KcgqzUxTN16wesu0ZkyG55AlGZEh9hzDvRZdajdPqY4ruGhc6cOeS+2wNQxPYRuG0Vz8
         jfdQ==
X-Gm-Message-State: AOAM531t4bH/LyCK/jiZlx9Kd71BITk8tAagcVz5V325iWfye3peJs01
        cCU7r46cUxTa1x1kbqRbGZv8PVJ63FY=
X-Google-Smtp-Source: ABdhPJyIEXp3MSeBVJdR9I2oyFY66qhColXpF8DcKIBQylBk6uXVlxhdkMvulRgBZYRjdLzpBhtpuA==
X-Received: by 2002:a05:6830:1686:: with SMTP id k6mr2206487otr.291.1623895322489;
        Wed, 16 Jun 2021 19:02:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x7sm909628ooc.23.2021.06.16.19.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 19:02:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 16 Jun 2021 19:02:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: iTCO_wdt: use pm_ptr()
Message-ID: <20210617020200.GA3214397@roeck-us.net>
References: <20210616181708.19530-1-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616181708.19530-1-info@metux.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 16, 2021 at 08:17:07PM +0200, Enrico Weigelt, metux IT consult wrote:
> Reduce a little bit of boilerplate by using pm_ptr().
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/iTCO_wdt.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index bf31d7b67a69..6ba2b2f60737 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -636,16 +636,13 @@ static const struct dev_pm_ops iTCO_wdt_pm = {
>  	.resume_noirq = iTCO_wdt_resume_noirq,
>  };
>  
> -#define ITCO_WDT_PM_OPS	(&iTCO_wdt_pm)
> -#else
> -#define ITCO_WDT_PM_OPS	NULL
>  #endif /* CONFIG_PM_SLEEP */
>  
>  static struct platform_driver iTCO_wdt_driver = {
>  	.probe          = iTCO_wdt_probe,
>  	.driver         = {
>  		.name   = DRV_NAME,
> -		.pm     = ITCO_WDT_PM_OPS,
> +		.pm     = pm_ptr(&iTCO_wdt_pm),
>  	},
>  };
>  
> -- 
> 2.20.1
> 
