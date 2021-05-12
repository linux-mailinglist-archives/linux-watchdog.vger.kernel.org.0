Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A87137BF0E
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 15:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhELOAZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhELOAY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:00:24 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D6DC061574;
        Wed, 12 May 2021 06:59:16 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id i81so22343702oif.6;
        Wed, 12 May 2021 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cNyqWXBDqY3Yot/MUhcq4xaTG74KC3oTpehCttBMsAk=;
        b=Cvjs0x2JTjjraI33mbwsawDVMZCfsNl8Re91IIoL7O4GGTiZM4MiqZ2U/VvG8PS3oD
         tQbA2bAfUgzUk4hnAc1xYdlfeOlxvMkuj0RhNcXVYDEaiYdE6wNkZGrjXjRjmK7DmrO0
         3fM4PNbwmfJ9DDVGc7XfuWvQPnfKIAQ5boGrbs989LaTncc+1dPHVuXMbQ9v+ORVXN0O
         wQ5CsV8fPwzel0u4JaAS/EBeh26y1v9wZBaHKp8SXvUEEwT4J023kYzXVZz6nputS6+n
         /9XXBNVvKBmD+ANNsDjsutGyD8ZHOOCxb7W1rqtNyd+/uUYjGGfM0KXZKpVEBt/+NUbM
         gRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=cNyqWXBDqY3Yot/MUhcq4xaTG74KC3oTpehCttBMsAk=;
        b=OP8w3yMuVVsEZqXwet6KmczPxSWFw+Zs4+TXLAGe64kXhwXWJ9LZcF3Hfk0KTF87Vv
         lxG7Jq95fbClOFcjTvUo4bAbYt3+HKlj/UIlc8fxd+4glBald7MaY83ciinaRiH+XUAT
         HuJBqaQ+/+aqHajK9FecBeXjG01bAhgr99NQQ38Q6rj5f1rPwqhEf09JJcSoPFhpkusy
         m9WnsV7n/NwHaQxFwYBQYXnODvt7GYpVVFX4mc5vFXC3aoCjCWL+wQkksxhPYJQUjSGJ
         +AoGNfLQrkFjnUnMggJ00Ran+6yCR19XxL2Tf8MrgPb0CkW25TK4QMmu4b9U6DVI3T5x
         /MUA==
X-Gm-Message-State: AOAM530nuEOnZmZis/bTinQ5upDBdD9LuZTTvZlODE4Cd8buUSR7nkxS
        cDXiNcyGb2dp7AjKpLc9QWg=
X-Google-Smtp-Source: ABdhPJwPKYVlI5h9PkRkGumeX4entWlFfPeyyKpJK3zWbGmpkIRh0DGcdyhUuwGGHb4hBTNAiUvkSQ==
X-Received: by 2002:aca:654d:: with SMTP id j13mr7669123oiw.125.1620827956385;
        Wed, 12 May 2021 06:59:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g11sm528oif.27.2021.05.12.06.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:59:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 06:59:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 04/10] watchdog: keembay: Clear either the TO or TH
 interrupt bit
Message-ID: <20210512135914.GD1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-5-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-5-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:18PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> During the interrupt service routine of the TimeOut interrupt and
> the ThresHold interrupt, the respective interrupt clear bit
> have to be cleared and not both.
> 
> Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index 6053416b8d3d..f2a16c9933c3 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -23,7 +23,8 @@
>  #define TIM_WDOG_EN		0x8
>  #define TIM_SAFE		0xc
>  
> -#define WDT_ISR_MASK		GENMASK(9, 8)
> +#define WDT_TH_INT_MASK		BIT(8)
> +#define WDT_TO_INT_MASK		BIT(9)
>  #define WDT_ISR_CLEAR		0x8200ff18
>  #define WDT_UNLOCK		0xf1d0dead
>  #define WDT_LOAD_MAX		U32_MAX
> @@ -142,7 +143,7 @@ static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
>  	struct arm_smccc_res res;
>  
>  	keembay_wdt_writel(wdt, TIM_WATCHDOG, 1);
> -	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
> +	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
>  	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
>  	emergency_restart();
>  
> @@ -156,7 +157,7 @@ static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
>  
>  	keembay_wdt_set_pretimeout(&wdt->wdd, 0x0);
>  
> -	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
> +	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TH_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
>  	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
>  	watchdog_notify_pretimeout(&wdt->wdd);
>  
> -- 
> 2.17.1
> 
