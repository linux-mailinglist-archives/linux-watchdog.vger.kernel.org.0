Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7729AC056
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Sep 2019 21:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389602AbfIFTP1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Sep 2019 15:15:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39178 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbfIFTP1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Sep 2019 15:15:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id q12so8247823wmj.4
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Sep 2019 12:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uAbo/PuP1oAvgMz0HNGoK4Dcz3lR/udWe9hb5pb4G5o=;
        b=BZ9ZPQFEefPbylzzSILZNdRGuE9/xtKCM7ZKqsaygt5wgxFB+yN4jlw3m4wmBHs4rl
         FCFanrQZE49Fdz/MM1GzW4V2L4owtoZss8o3JNCuw2+CX8BL2DMhiwngBVPSO/vZLuCN
         6QP6lwtJQpLCPDzYgIBF9+UaRWp8awChKXQMBJ5jS3T/aXV69SIW5xDwBczI0w5rRjnC
         s91kekaIyp6L1zxwjhmIJwYahdRLweo2vkwDJbeF5WX1GIEa2mv4iEYRcVCGEetFp7hJ
         Cxlj+5jnovYVC87bVZQ48vu5pQdRwil9yleuuUZX7Sk6Kly/cVxWKft2BZo4SEGvex4p
         uw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uAbo/PuP1oAvgMz0HNGoK4Dcz3lR/udWe9hb5pb4G5o=;
        b=hQpR8TE7G7egumDDwG1qVne8VVTsZygq7L/6i4cuniYUjoYdOARqqsJH4pXbkAWqSv
         dUeTA1ZcG9awi5kTXTntJOZYpdOwLHQdetpAVNxliGk7cswlXGxzpH+9ur4GhzOll7Pw
         kP1EfpSaFb8mX/tzy2gYXEYhybqHMdMD1SFJG/QuORbu+ZBL83veghE1TC5mLyBU12JY
         nNwg2dgdJ0bofqD+k2l16wKIvY1aeJh7n2bx43Fz8USr3zRfxPlueiWb0wMKo5PuiJsp
         quhWacbTRJmy3fRb/Auy4JSqvYH2Cjqcszk0FMbihBewC+9LUrEryRtvBsuHU5xYErPz
         gLvw==
X-Gm-Message-State: APjAAAVOzFZXSLGIlQpmXmHGM7PRLljZEQyO7ve8sk2/WHNlP372/6mG
        zRbdeLX8m3UynfS/jWKLkBZ0Gw==
X-Google-Smtp-Source: APXvYqyuqP9MJIJIboiOnmCmvPz7aUfzfQv49+NA/ObuQRrAvHy9eneaAQKFKiRvleXT4nAZSTIZ1w==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr8162819wmj.73.1567797325881;
        Fri, 06 Sep 2019 12:15:25 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id q124sm10814089wma.5.2019.09.06.12.15.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 12:15:25 -0700 (PDT)
Subject: Re: [PATCH v4] watchdog: qcom: support pre-timeout when the bark irq
 is available
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux@roeck-us.net, wim@linux-watchdog.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
 <20190906174009.GC11938@tuxbook-pro>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <f06d0e52-11f4-c1e9-6e3b-30790dfec534@linaro.org>
Date:   Fri, 6 Sep 2019 21:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906174009.GC11938@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/6/19 19:40, Bjorn Andersson wrote:
> On Thu 05 Sep 14:00 PDT 2019, Jorge Ramirez-Ortiz wrote:
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> [..]
>> +static inline int qcom_get_enable(struct watchdog_device *wdd)
>> +{
>> +	int enable = QCOM_WDT_ENABLE;
>> +
>> +	if (wdd->info->options & WDIOF_PRETIMEOUT)
>> +		enable |= QCOM_WDT_ENABLE_IRQ;
> 
> Looking at downstream they conditionally write 3 to WDT_EN during
> initialization, but during suspend/resume they just set it to back to 1.
> 
> So I don't think you should touch BIT(1) (which name doesn't match
> downstream or the register documentation)

writing BIT(1) on the enable register is necessary to get the interrupt
and therefore to be notified of the bark event. this can not be avoided.

> 
>> +
>> +	return enable;
>> +}
>> +
>> +static irqreturn_t qcom_wdt_isr(int irq, void *arg)
>> +{
>> +	struct watchdog_device *wdd = arg;
>> +
>> +	watchdog_notify_pretimeout(wdd);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>  static int qcom_wdt_start(struct watchdog_device *wdd)
>>  {
>>  	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
>> +	unsigned int bark = wdd->timeout;
>> +
>> +	if (wdd->pretimeout)
>> +		bark = bark - wdd->pretimeout;
> 
> As Guenter points out, writing wdd->timeout - wdt->pretimeout to
> WDT_BARK_TIME unconditionally should do the trick.

yes

> 
>>  
>>  	writel(0, wdt_addr(wdt, WDT_EN));
>>  	writel(1, wdt_addr(wdt, WDT_RST));
>> -	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
>> +	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
>>  	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
>> -	writel(1, wdt_addr(wdt, WDT_EN));
>> +	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
>>  	return 0;
>>  }
> [..]
>> @@ -204,7 +248,17 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>  		return -EINVAL;
>>  	}
>>  
>> -	wdt->wdd.info = &qcom_wdt_info;
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq > 0) {
>> +		if (devm_request_irq(dev, irq, qcom_wdt_isr,
>> +				     IRQF_TRIGGER_RISING, "wdt_bark",
>> +				     &wdt->wdd))
> 
> A failure here means that a irq was specified in DT (platform_get_irq()
> returned > 0) but you failed to acquire request it, you should fail your
> probe() when this happens.

yeah that is what I thought but since pm8916-wdt.c has recently been
merged exactly like I copied above I chose to follow to avoid arguing
about this.

anyway I'll send a patch to fix pm8916-wdt.c and then will do it that
same way on this driver.

> 
>> +			irq = 0;
>> +	} else if (irq == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
> 
> Some {} around this block please.

um, checkpatch didnt complain. anyway sure, will do

> 
> Regards,
> Bjorn
> 
>> +
>> +	wdt->wdd.info = irq > 0 ? &qcom_wdt_pt_info : &qcom_wdt_info;
>> +	wdt->wdd.pretimeout = irq > 0 ? 1 : 0;
>>  	wdt->wdd.ops = &qcom_wdt_ops;
>>  	wdt->wdd.min_timeout = 1;
>>  	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
>> -- 
>> 2.23.0
>>
> 

