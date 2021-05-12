Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A862B37BF3A
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 16:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhELOGG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbhELOGF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:06:05 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EAAC061574;
        Wed, 12 May 2021 07:04:56 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u16so22351268oiu.7;
        Wed, 12 May 2021 07:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7U7Vj3u3+jmJ7XTJT/Tmha/cXkrI0W3LQNMGkjUddUg=;
        b=gcyko5TGA/SpF+r8RDT1u0JR0TIbg1nc/3BO1ZIGsDH2C6z8DU6SLPfuX1W6QtoO8v
         9NdQLIpcmm0KwEywu+uhmdZVG2ltfPRjadCUXm/Cay3XjKsLGHNsGByeoNoFgdMbb1NG
         k24GJMpesCp35h87kR7yQbAz3IKqQ6U6IPAvYli7KSdhDZs+Y640hyH6aUCY5GWPH0U6
         bztQqBs6NrwT+qDCH/REPNA+MMAOhyE6Ww75jdI6lQwtxUi+rJC1tNrYY7TaDcK7I78H
         cL4xin2a7jWhGmsezZS9nwJVVsZ6trTkZZ1ze9dDCIwHzMpxEC7G9w+iY54bE2QTN+fa
         0lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7U7Vj3u3+jmJ7XTJT/Tmha/cXkrI0W3LQNMGkjUddUg=;
        b=ONyxhDLeUiSnfsm8bZtnUj8tf/x/RC8pAww+XjStpl71Tqx4/YKZPn0Bo6jWFpFqXu
         gBVQC3GRYZpCOsfZmwc0CXyz0Kq4qCwUgnketdgCKqbkh4wDUfIQ8R7tsfuBxco3YEGe
         C7q9MF6Io/H+BIN8I/Jh1M6sc8JubqlI4xypaRkn2hx54VAEBlWZIAbfQ9yanJ5FRa4B
         WCVgkZJ6NE2mdb9KIOdz1kVHi43s5nPCiNx+fq1nKsnUia23RYdtBrxoqVbhUTJ8rbH7
         XPWzNA67HukQ3eUzXmoRrIXjNCdsSsRhSKX+OIU0Joeqaguzxa/te8SOYDz0ttnv0kME
         BFPg==
X-Gm-Message-State: AOAM5301rZcyzXf0JUlu4Dht7CEJZxbXiiN8TnGXQaBbhVCpLAHafAw9
        wHO4vEIA2JbIjdrScZICd+U=
X-Google-Smtp-Source: ABdhPJyRYKPeFbUTIsKnnAvdBzk5ZwsBv1z9XFlrTnB+k0qLB7NSmRfjWs0yAa4/v9hHbg+0hqnd5w==
X-Received: by 2002:aca:a9c2:: with SMTP id s185mr7933000oie.109.1620828295819;
        Wed, 12 May 2021 07:04:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j18sm4487718ota.7.2021.05.12.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:04:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 07:04:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 09/10] watchdog: keembay: WDT SMC handler MACRO name
 update
Message-ID: <20210512140454.GI1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-10-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-10-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:23PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> Updated the WDT SMC handler MACRO name to make it clear that its
> a ARM SMC handler that helps in clearing the WDT interrupt bit.
> 
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index 63a7c5d719a3..0a8cf5b35699 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -25,7 +25,7 @@
>  
>  #define WDT_TH_INT_MASK		BIT(8)
>  #define WDT_TO_INT_MASK		BIT(9)
> -#define WDT_ISR_CLEAR		0x8200ff18
> +#define WDT_INT_CLEAR_SMC	0x8200ff18
>  #define WDT_UNLOCK		0xf1d0dead
>  #define WDT_DISABLE		0x0
>  #define WDT_ENABLE		0x1
> @@ -143,7 +143,7 @@ static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
>  	struct keembay_wdt *wdt = dev_id;
>  	struct arm_smccc_res res;
>  
> -	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
> +	arm_smccc_smc(WDT_INT_CLEAR_SMC, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
>  	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
>  	emergency_restart();
>  
> @@ -157,7 +157,7 @@ static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
>  
>  	keembay_wdt_set_pretimeout(&wdt->wdd, 0x0);
>  
> -	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TH_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
> +	arm_smccc_smc(WDT_INT_CLEAR_SMC, WDT_TH_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
>  	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
>  	watchdog_notify_pretimeout(&wdt->wdd);
>  
> -- 
> 2.17.1
> 
