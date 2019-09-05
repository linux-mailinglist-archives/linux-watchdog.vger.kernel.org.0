Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64F02AA955
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 18:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389011AbfIEQsi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 12:48:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52072 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731943AbfIEQsi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 12:48:38 -0400
Received: by mail-wm1-f65.google.com with SMTP id k1so3613913wmi.1
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Sep 2019 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z2wf6O7vjYLDusEv/JaT0s6lS/A0Ds87W4noLxQv2uw=;
        b=kat12dfN2u0VwMap5lz9Utz7ioWOknWIL7oOMnvAGWMtOFc3z+lqPLIbKtVL3XGkO6
         TRK1ksVJnGysvt8NaTB4TaP82Uix6DuY01kFmoElX3fswMhVB2hZ3pj03SP/yyMoJ0HS
         NLQtoK2bVQjv5EaZ5BkknvDQs2s7tcHKCqTXj5OlsEI1mXRK1Ioc+GtyAB6zsgAwP/8B
         vApOMXiPGcCV/b1oT6I5jJovwkyqprjPkNGLbOOvLvEPztoakmi2lpVOWZnAnTRMqwdd
         IA9kVaX6i0fOgZ1YS2bgRMwspp5UizUvZ9w8cfmV4INU3y5AWyAwKL1ddlbAJiNoZIWD
         rHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z2wf6O7vjYLDusEv/JaT0s6lS/A0Ds87W4noLxQv2uw=;
        b=gjadzQWy2vFvts+qZdYCJWEqcsUllh4BRZAHT94zDc6hesYKB4wWc6YZ85mivUauT+
         aij25ISc3xGARWVor5pdyfvWgNoHvOqdWwiz3eOQtEHrGFbKGaU8TjHM17oOW9ud2/Tn
         sMtHH2shqXJUPiCd+qzyCYHEQi1F6v5zK3o3EKOEqWTVt40HcXcUcNyGQopqVNeOkHFi
         H9DUI8hWRfDYZvkSK9fHxIPkJ4QiUCHLtrYoywtdFtiseN9S62uIYN2Ddd1mnpAaTZrQ
         +lBfxZCDxJR4miaMekC8U87AxHy0WBINqt0XXqiNyasyGrtbKgXZFUPxKTNEWnzfxmQk
         /+Lg==
X-Gm-Message-State: APjAAAVe3YrzkJiWfuIuoHPH6NzzfKBUStcGwqN1MmJhAY2M+Vm7SptK
        kg+BrxohU5eWgBZKRFo4g+sqyJkuxek=
X-Google-Smtp-Source: APXvYqyF7XyRDXBGPyvRloL6Dkz64dhnuPdkNKp3xGLV87VXDMeIL/wIQB4PkbH5vAHJK0COwJxLbw==
X-Received: by 2002:a1c:f50c:: with SMTP id t12mr3834427wmh.49.1567702115985;
        Thu, 05 Sep 2019 09:48:35 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id o9sm3940414wrh.46.2019.09.05.09.48.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 09:48:35 -0700 (PDT)
Subject: Re: [PATCH] watchdog: qcom: add support for the bark interrupt
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, wim@linux-watchdog.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190905162135.2618-1-jorge.ramirez-ortiz@linaro.org>
 <20190905163919.GA1676@tuxbook-pro>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <eda57fef-5fd7-85d9-68e6-deec621a7360@linaro.org>
Date:   Thu, 5 Sep 2019 18:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905163919.GA1676@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/5/19 18:39, Bjorn Andersson wrote:
> On Thu 05 Sep 09:21 PDT 2019, Jorge Ramirez-Ortiz wrote:
> 
>> Use the bark interrupt to notify the bark event. Since the bark and bite
>> timeouts are identical, increase the bite timeout by one second so
>> that the bark event can be logged to the console.
>>
> 
> Afaict you should tie the bark to the "pretimeout" in the watchdog
> framework , which would allow the user to specify a pretimeout and
> configure what should happen at the bark (just a pr_alert() or panic()).

yes, you are right. will send v2 based on this.
thanks!

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>  drivers/watchdog/qcom-wdt.c | 42 ++++++++++++++++++++++++++++++++++---
>>  1 file changed, 39 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index 7be7f87be28f..5eaf92084b93 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/watchdog.h>
>>  #include <linux/of_device.h>
>> +#include <linux/interrupt.h>
>>  
>>  enum wdt_reg {
>>  	WDT_RST,
>> @@ -41,6 +42,8 @@ struct qcom_wdt {
>>  	unsigned long		rate;
>>  	void __iomem		*base;
>>  	const u32		*layout;
>> +	unsigned int		irq;
>> +	const struct device	*dev;
>>  };
>>  
>>  static void __iomem *wdt_addr(struct qcom_wdt *wdt, enum wdt_reg reg)
>> @@ -54,15 +57,37 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
>>  	return container_of(wdd, struct qcom_wdt, wdd);
>>  }
>>  
>> +static inline int qcom_wdt_enable(struct qcom_wdt *wdt)
>> +{
>> +	if (wdt->irq < 0)
>> +		return 1;
>> +
>> +	/* enable timeout with interrupt */
>> +	return 3;
>> +}
>> +
>> +static irqreturn_t qcom_wdt_irq(int irq, void *cookie)
>> +{
>> +	struct qcom_wdt *wdt =  (struct qcom_wdt *) cookie;
>> +
>> +	dev_warn(wdt->dev, "barking, one second countdown to reset\n");
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>  static int qcom_wdt_start(struct watchdog_device *wdd)
>>  {
>>  	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
>> +	unsigned int bark, bite;
>> +
>> +	bark = wdd->timeout;
>> +	bite = wdt->irq < 0 ? bark : bark + 1;
>>  
>>  	writel(0, wdt_addr(wdt, WDT_EN));
>>  	writel(1, wdt_addr(wdt, WDT_RST));
>> -	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
>> -	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
>> -	writel(1, wdt_addr(wdt, WDT_EN));
>> +	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
>> +	writel(bite * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
>> +	writel(qcom_wdt_enable(wdt), wdt_addr(wdt, WDT_EN));
>>  	return 0;
>>  }
>>  
>> @@ -210,10 +235,21 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>  	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
>>  	wdt->wdd.parent = dev;
>>  	wdt->layout = regs;
>> +	wdt->dev = &pdev->dev;
>>  
>>  	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>>  		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>>  
>> +	wdt->irq = platform_get_irq(pdev, 0);
>> +	if (wdt->irq >= 0) {
>> +		ret = devm_request_irq(&pdev->dev, wdt->irq, qcom_wdt_irq,
>> +				       IRQF_TRIGGER_RISING, "wdog_bark", wdt);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "failed to request irq\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>>  	/*
>>  	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
>>  	 * default, unless the max timeout is less than 30 seconds, then use
>> -- 
>> 2.23.0
>>
> 

