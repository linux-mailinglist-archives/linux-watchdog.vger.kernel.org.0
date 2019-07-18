Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A07CD6D20F
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Jul 2019 18:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbfGRQfB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Jul 2019 12:35:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38796 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfGRQfB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Jul 2019 12:35:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id f5so4308692pgu.5;
        Thu, 18 Jul 2019 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lt60PMLaU+8wzROOy95zC3m71GZZRlpEmV8HCiHmNcc=;
        b=pkiXMmVNN1eRxc4wIKruOzUVS8t6JWGwLJF2tr93Etri93LWBBBEw6VNHF0aLScgJA
         u9tHotpsEsU/CJsEhM01jIrDI5GhQxguJQAdneVaGBAnWjH4Fn+TmbTk9WfouTUiHfM5
         kCpwm2Zwc/XgWkhWeF87BVf7g3sq4aL5tArpL0dAyjLfGwN0CETONNSb42JgzQ91T00A
         PKb2lhpZyGu/vl+BXgvoWTklG9It1tZlmpt/MrTzzo5cIMZ5lUVsz/K6O9OHEtPyeJt/
         ihJDRmbzdwefIUaDxmQoUGm0olLhGigTlW/uCVF2Wuv7VufLWopLaKnZTYjx0rjuvk6+
         hfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lt60PMLaU+8wzROOy95zC3m71GZZRlpEmV8HCiHmNcc=;
        b=bedzs6MNZlUqonBa4XGNoG2gkmn9OIBJxaz/fGkDOsoJeOc2UroEcC8cAtvI6cBi3x
         bzUzSJ0RxhPjUz9LIltn0IFQKcg8alFryrm3dbB2gQa0FDEonHFhpDs3m3bmge06hlyI
         4y7K1uDgf0DBjv6qNdIvty7ek+Kg38FzgUBCVWSuSyHQV18IeqyN6eeKbzZqidkcfBZM
         DaoYqGPRxWaOYgHIeBpQM/ukfqyEJh7wSuDHt9rKYW2O6i1llJJ5fdCqCtutEMegVJhU
         Ft85eLLRXJ8gsoJFpDNwslhG6wj+TFR5NRSacqe1+YJ6F6f8/0+NEaGT4FtXDFjnmqkG
         OYgw==
X-Gm-Message-State: APjAAAUUC0zOAELO/ltJNl5aMCmIpOloo4fVdQZUbkojSRtdg2eLSIIU
        Ccht3VcuZaLam0j40WptSNAr5b63
X-Google-Smtp-Source: APXvYqzllWPyaN8qN7BWj2JhBlgqc3l8QiT+iW6NoqEbeSjh4/SEyN/WHuQvNwkWKqmsVbHNS3n29w==
X-Received: by 2002:a17:90a:cf8f:: with SMTP id i15mr2242020pju.110.1563467700928;
        Thu, 18 Jul 2019 09:35:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f64sm30543640pfa.115.2019.07.18.09.34.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 09:34:59 -0700 (PDT)
Date:   Thu, 18 Jul 2019 09:34:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Andrianov <andrianov@ispras.ru>
Subject: Re: [PATCH] watchdog:alim1535_wdt: Fix data race in ali_settimer()
 concerning ali_timeout_bits variable.  variable.
Message-ID: <20190718163458.GA18125@roeck-us.net>
References: <20190718155238.3066-1-mbalant3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718155238.3066-1-mbalant3@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 18, 2019 at 08:52:38AM -0700, Mark Balantzyan wrote:
> ---

Subject and description are all messed up.

>  drivers/watchdog/alim1535_wdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/alim1535_wdt.c b/drivers/watchdog/alim1535_wdt.c
> index 60f0c2eb..4ba2b860 100644
> --- a/drivers/watchdog/alim1535_wdt.c
> +++ b/drivers/watchdog/alim1535_wdt.c
> @@ -107,6 +107,7 @@ static void ali_keepalive(void)
>  
>  static int ali_settimer(int t)
>  {
> +    spin_lock(&ali_lock);
>      if (t < 0)
>          return -EINVAL;
>      else if (t < 60)
> @@ -117,7 +118,7 @@ static int ali_settimer(int t)
>          ali_timeout_bits = (t / 300)|(1 << 6)|(1 << 7);
>      else
>          return -EINVAL;

This return and the return above will exit the function with the
spinlock still active, which will guarantee a hangup if/when the
function is re-entered.

> -
> +    spin_unlock(&ali_lock);
>      timeout = t;

timeout is still unprotected and may have no relation to the
stored value of ali_timeout_bits.

Overall your patch would introduce much more severe problems
than the problem it tries to fix, and it doesn't even completely
fix that problem either.

I would suggest to leave the driver alone, unless you have the hardware
to test your changes. And, if you do, it would be much more valuable
to convert the driver to use the watchdog subsystem.

Thanks,
Guenter
