Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA3E0AD114
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2019 00:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731096AbfIHWuE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Sep 2019 18:50:04 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43264 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfIHWuD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Sep 2019 18:50:03 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so5685875pld.10;
        Sun, 08 Sep 2019 15:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zc4prSozmeKbnSZHIJYYrGC0uThZMJbf0rfXZs2gRuc=;
        b=rx5BVXilh5x+kRjvZQh4DX2UbjJADGeTe+BbUZf3e/u7923mLTg6caRcqiN3UvOE2E
         fEuFrooLdkvU/ng5z/9pz4gCQUQNB1OM7GU2OJD9xx73TeFPEikdxK0wWsJJkpuUfd+X
         Ytwfb21T7dxFAmUnYpSA0Fihc3P4nfKtwECUh5vGW/jj8l95XFHP0BqQfNRiD0pTxtON
         N0moGlCrc9A3MwXO/12MTW9fLFBfLdp3kWJdhHAccu08L+37hzN4IJ4leXKxt9n6y3gq
         k3Hali75459nzgvRWstOIznk5jLyjwCR7cHPSI2zeSrd9CPtp0J8ohdlxgOqz9VlrbEM
         FQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zc4prSozmeKbnSZHIJYYrGC0uThZMJbf0rfXZs2gRuc=;
        b=cZwl0WEkRbYa2AFPyxWdBFPZjhPginoX9IrUOhgAOKDcH3FDMnVmYQuYNiMxnBOOQz
         +fC9RxOS1kDpNMmh+8rZ2DiBhBgGHpAkwjrhu7vBBobg/zV6mPeUoGzWLUVjKbTKsxaD
         tPsivvsbgopzgRiom4TfSdKjVbhYi6OqCrppef/+q7ERmxo7MVvBkKoAgyqHsb4VKzBP
         J2uMNK4AmWZIxHJoveWvRMAL4xulUyLv5iRA3NGWR0Vif91wdd9OdAx9narSo86ADZZ8
         QQH8rOPZXgG9bJcORMCrYBjCXFHE5F6U4g3xXNH44Ofo3ZPS3lsKFxNAmOga1T9p0KnJ
         EtRQ==
X-Gm-Message-State: APjAAAXV8jtf+8rFoA91qUNI29d7WFN9vwRDzJ9Z3QBiI9kI3UUPI0VG
        m1mKIrB/YTd5WvJ9YDTmsdo=
X-Google-Smtp-Source: APXvYqyZWgMeXD5bZSjMytAriy55BnkPYNQ96x2udTDsuxlkXo33O6MVK1Rx9/86s1TQ7FGSLD7ANw==
X-Received: by 2002:a17:902:8a81:: with SMTP id p1mr20477142plo.71.1567983002858;
        Sun, 08 Sep 2019 15:50:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l72sm24380246pjb.7.2019.09.08.15.50.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Sep 2019 15:50:01 -0700 (PDT)
Subject: Re: [PATCH 1/2] watchdog: pm8916_wdt: fix pretimeout registration
 flow
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, Loic Poulain <loic.poulain@linaro.org>
References: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4231aab1-c538-a14f-cea1-ceb28781c7bb@roeck-us.net>
Date:   Sun, 8 Sep 2019 15:50:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/6/19 1:30 PM, Jorge Ramirez-Ortiz wrote:
> When an IRQ is present in the dts, the probe function shall fail if
> the interrupt can not be registered.
> 

The author intended differently, and did not want registration to fail
in this situation, following the logic that it is better to have a
standard watchdog without pretimeout than no watchdog at all.

Copying the author; I am not inclined to accept such a change without
input from the driver author.

Similar, for the deferred probe, we'll need to know from the driver author
if this is a concern. In general it is, but there are cases where
-EPROBE_DEFFER is never returned in practice (eg for some SoC watchdog
drivers).

Guenter

> The probe function shall also be retried if getting the irq is being
> deferred.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>   drivers/watchdog/pm8916_wdt.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 2d3652004e39..cb5304c26ac3 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -163,9 +163,18 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq > 0) {
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
> +	} else {
> +		if (irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		wdt->wdev.info = &pm8916_wdt_ident;
>   	}
>   
>   	/* Configure watchdog to hard-reset mode */
> @@ -177,7 +186,6 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>   		return err;
>   	}
>   
> -	wdt->wdev.info = (irq > 0) ? &pm8916_wdt_pt_ident : &pm8916_wdt_ident,
>   	wdt->wdev.ops = &pm8916_wdt_ops,
>   	wdt->wdev.parent = dev;
>   	wdt->wdev.min_timeout = PM8916_WDT_MIN_TIMEOUT;
> 

