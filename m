Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB21B1DDF
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2019 14:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbfIMMwe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Sep 2019 08:52:34 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33474 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729558AbfIMMwe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Sep 2019 08:52:34 -0400
Received: by mail-pl1-f196.google.com with SMTP id t11so13206987plo.0;
        Fri, 13 Sep 2019 05:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BlZu7IMkJJ2x30qqdls5PsoF2ZWD58HPtmFSp7MDs2k=;
        b=kFdb5zkOXd5y0cnDElxLxkNkj3H/77rTt5mQnZ3elYPwnT8P8Hrd1EjosCLZtj4tP4
         2xNHXUfkpFJ3ZcDloXG2fql3zkhJSdqI0QymoBDm7N2p1o6VM4L/NHT0CtpKSOHbe573
         pB7oc5a3csyZjGfckA5BXuo6BN1eAVtpQCWzMiiZIYncpPAUJ1wvtJlNTcJQh5gNt1n7
         QuqR5wgtG8iqQv+kmkyvn9NrDb8FbGlHopTaBS5OYaUzKLd5RT/G2RWPkQqhFr14Q/el
         hDwqsH2o4FltSZyafQcpRDOn/fksXbmOQERM6uUWDg6tfyHMpvFsEWLCgceYS/eENozt
         SNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=BlZu7IMkJJ2x30qqdls5PsoF2ZWD58HPtmFSp7MDs2k=;
        b=fTca09TUuq9+AYfu1bG9yOKuxDxje1PLlvEcgTkwxVNd8EdOU3kVvO6NeWYO5K5PtG
         euhakeY5fX8FYmEhyHujYeC4bSPAoZX0NNgo3yTfOH10lIJd33vJeUmwPlWjwxxgJWri
         yO6y9d3rGSOEMScogz9q+qX2XpyuScEJHySnnY3w1rLJqLlex3Pd0kWWDpGBhfStPRnb
         qinazLwoPOW3pEhO/3ao+BIIIRx8VIaqEVl2nhT6Ek6gckpMRB5aWnuOB0n1u7rExMxx
         Ab1mKG6nwjkmi3imHRcQezK6zgBdOqfCEHi3szS/c4QR3cecGQM3y9hvBwLDMy9mgm5W
         39HQ==
X-Gm-Message-State: APjAAAXw0dvlRQ5ah0OJiUJ+1s2DEgMkop7fQuDH+GxVe8h5BZXh1hqK
        i6r4A3eypoTng5Hb6CGsFzppKtCw
X-Google-Smtp-Source: APXvYqwjmvmY8Afq7+jugXxpufBl19WoXMLG/Ft2zLNI/Q6l3LDqBmerh51C6Xa3uhKbuQixlLkMSg==
X-Received: by 2002:a17:902:aa48:: with SMTP id c8mr49143964plr.330.1568379152495;
        Fri, 13 Sep 2019 05:52:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g12sm6707212pfb.97.2019.09.13.05.52.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2019 05:52:31 -0700 (PDT)
Date:   Fri, 13 Sep 2019 05:52:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH 1/2] watchdog: pm8916_wdt: fix pretimeout registration
 flow
Message-ID: <20190913125230.GA18629@roeck-us.net>
References: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 06, 2019 at 10:30:53PM +0200, Jorge Ramirez-Ortiz wrote:
> When an IRQ is present in the dts, the probe function shall fail if
> the interrupt can not be registered.
> 
> The probe function shall also be retried if getting the irq is being
> deferred.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

with nitpick below.

> ---
>  drivers/watchdog/pm8916_wdt.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 2d3652004e39..cb5304c26ac3 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -163,9 +163,18 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq > 0) {
> -		if (devm_request_irq(dev, irq, pm8916_wdt_isr, 0, "pm8916_wdt",
> -				     wdt))
> -			irq = 0;
> +		err = devm_request_irq(dev, irq, pm8916_wdt_isr, 0,
> +				       "pm8916_wdt", wdt);
> +		if (err)
> +			return err;
> +
> +		wdt->wdev.info = &pm8916_wdt_pt_ident;
> +

Unnecessary empty line.

> +	} else {
> +		if (irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		wdt->wdev.info = &pm8916_wdt_ident;
>  	}
>  
>  	/* Configure watchdog to hard-reset mode */
> @@ -177,7 +186,6 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	wdt->wdev.info = (irq > 0) ? &pm8916_wdt_pt_ident : &pm8916_wdt_ident,
>  	wdt->wdev.ops = &pm8916_wdt_ops,
>  	wdt->wdev.parent = dev;
>  	wdt->wdev.min_timeout = PM8916_WDT_MIN_TIMEOUT;
