Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C1837BF15
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 16:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhELOBN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbhELOBM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:01:12 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60035C06175F;
        Wed, 12 May 2021 07:00:04 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id b25so17101316oic.0;
        Wed, 12 May 2021 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6MgRAIilyDwvR2x4fMsEKaxfvKfB98RNBG4crUuGQyk=;
        b=OjmG72NMkPuaH40C5eLmoKZpwGj6RakM0tgwW+QuvgRWGlgTrFQpbA/9uZIoLosx1N
         RZZFRIs2Qjnij4c/jaZAqI5TjJwrpyTnJVyLe9LyMuUYLTDgfQKncU7/N2URSnVHvCCB
         FSbuAaoy70CKFGT38Y1yeLGv77wNNWd5VMKuiCCbof9gyPKlng1EkRAr5BeV3RZXbAJl
         MX/Y7K19eGhc5uwIkEzZF/fya6ZtSPFgzaIZqQpnRm6ujnvzu0YMe2zma0+yDfqbw3rQ
         fZz27CNkpJPntP3CHB2B043At33vhpD2l++v/mEpXygUnIKG+PEJFZXte2/Mm1PL7oIj
         thCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=6MgRAIilyDwvR2x4fMsEKaxfvKfB98RNBG4crUuGQyk=;
        b=L26Z8ndepXoQvff0//4jmccqScL13E5DnL9AaJ2A5vTNpGVowem7ESxhG/OrX4kILG
         r6Vynuja7ZlYZibvYfk2TVCg+3HnCWwKp9H+IrZ9hRRj6I8r0w03D3pe+mC+3TnbHs7j
         jrdmKxbfX3gJUeg8c+o8fQv4sggUCudm0ZzNY1czYFtyc9TtVY+8pkmVVG+92irf90q3
         yCI6QD5EtJLOPvuIr7Gn4P1AA2RQmcaCCNBPFik3Ns6kOnrkp3efVzkju5QyNYSzekRb
         c7SRPTGqbrAsIwIAvI/DySDWx879YIFzcyLU1sNb8dW6rL3LY/yNj/TeNPzRbAuNq5/Y
         j1YA==
X-Gm-Message-State: AOAM5335+zD8Ujh3KPh0gpGTNFHPIF0XvuddCaHVzzSqJ1cli7k4sJWr
        2DD6hy2rFr2bDZhkYP3+5po=
X-Google-Smtp-Source: ABdhPJzIN6Zs0+2BZ7s0gX2HFvPVaA9CoEmWYa+ERUb3TXw8+83ij4fkrc+EMwZFSNKNtUaI/RMRLA==
X-Received: by 2002:aca:f0c:: with SMTP id 12mr23232504oip.131.1620828003684;
        Wed, 12 May 2021 07:00:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c19sm2536oiw.7.2021.05.12.07.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:00:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 07:00:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 06/10] watchdog: keembay: Removed timeout update in the
 TO ISR
Message-ID: <20210512140002.GF1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-7-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-7-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:20PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> In the TO ISR removed updating the Timeout value because
> its not serving any purpose as the timer would have already expired
> and the system would be rebooting.
> 
> Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index 039753b9932b..dd192b8dff55 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -141,7 +141,6 @@ static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
>  	struct keembay_wdt *wdt = dev_id;
>  	struct arm_smccc_res res;
>  
> -	keembay_wdt_writel(wdt, TIM_WATCHDOG, 1);
>  	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
>  	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
>  	emergency_restart();
> -- 
> 2.17.1
> 
