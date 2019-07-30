Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46717B22A
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 20:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbfG3SlZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 14:41:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40845 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfG3SlY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 14:41:24 -0400
Received: by mail-pg1-f194.google.com with SMTP id w10so30516900pgj.7;
        Tue, 30 Jul 2019 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PVgHHfw8283w1UDYfT80DWnZOItPSgOPx68g/r5d7hQ=;
        b=UXb1XEzwQ4FhS7roeMM8Wx/ECYXxRVmaXou0vbqI/o/pifDl6IfTG8Y6vFJ225b2i6
         f6Wlizk14eGiE7TQSYxqk5WuFrEGVXZVfWaJX4am2gWLxTpCq7BsYPFt/5LW12ZIGm3c
         FvsEZbYBKNFuwh3zAJA38tslp1lajzKddbZl8g7cs2JL1ERCtJRv8MebhY6SZJkNpxdu
         U40Ib5WYNBSJB+D79Rzj/i9xpMKItghTR2nG1fIeLy9Ruwios0URvQNvOflz9kfSTqNT
         2ZogTW52qmeO4A+m+y91msP76RF0/TbICGWUVWiXYALyBwvsGjOzBeeAQ1+r6jyAcHWA
         ETEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PVgHHfw8283w1UDYfT80DWnZOItPSgOPx68g/r5d7hQ=;
        b=SRhL+n6AAxtJuLlYukiM5RJLPXzZO03mLlVIuxPDtxJFug2TG13/ka1J95GGpnR778
         ab0sZK4Z5VUcMalE+KZYh+cq94XCUaW3uK2Ef03lPh4AVDWzKRE2LllH/MvWnRV1LyFg
         886RF0caDol/QggV2dkj34+v8ypbYAGXey30/47luBIKmh1W4+xx+xCUe3QKSZrNV+ws
         vkeFYFIfyRiMOkqjLB/PRDeSrBrEIMIEhUxxxPb5qjdyHL0ru6TjJVgYb5umQ53OmoKI
         i5DpdRF+DWEz28ATJBxoy57NIDq3DFKSNAZpZXrohl1p8giN5hC9NihUFeWu2F5ydW+C
         TwEw==
X-Gm-Message-State: APjAAAWswsORfaMs2GY86D20023yjdptLLJSeqkF0zFg3FT+DpeJsJof
        J5vzNG2C5JMl+LmEKvsoiTE=
X-Google-Smtp-Source: APXvYqzBk2/TjQ2t871qrxhbKFunvN7/VGZ75ZVMjl2UbEEJaEYS44nmRG20XxYi5+wtSmfYiTuUlw==
X-Received: by 2002:a65:5c4b:: with SMTP id v11mr67619457pgr.62.1564512084206;
        Tue, 30 Jul 2019 11:41:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z6sm36592223pgk.18.2019.07.30.11.41.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 11:41:23 -0700 (PDT)
Date:   Tue, 30 Jul 2019 11:41:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 48/57] watchdog: Remove dev_err() usage after
 platform_get_irq()
Message-ID: <20190730184121.GA32293@roeck-us.net>
References: <20190730181557.90391-1-swboyd@chromium.org>
 <20190730181557.90391-49-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730181557.90391-49-swboyd@chromium.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 30, 2019 at 11:15:48AM -0700, Stephen Boyd wrote:
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
> 
> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
> 
> ret =
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
> 
> if ( \( ret < 0 \| ret <= 0 \) )
> {
> (
> -if (ret != -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
> 
> While we're here, remove braces on if statements that only have one
> statement (manually).
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Please apply directly to subsystem trees
> 
>  drivers/watchdog/sprd_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> index edba4e278685..0bb17b046140 100644
> --- a/drivers/watchdog/sprd_wdt.c
> +++ b/drivers/watchdog/sprd_wdt.c
> @@ -284,10 +284,8 @@ static int sprd_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	wdt->irq = platform_get_irq(pdev, 0);
> -	if (wdt->irq < 0) {
> -		dev_err(dev, "failed to get IRQ resource\n");
> +	if (wdt->irq < 0)
>  		return wdt->irq;
> -	}
>  
>  	ret = devm_request_irq(dev, wdt->irq, sprd_wdt_isr, IRQF_NO_SUSPEND,
>  			       "sprd-wdt", (void *)wdt);
> -- 
> Sent by a computer through tubes
> 
