Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022C316543D
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2020 02:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgBTB2d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Feb 2020 20:28:33 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52137 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbgBTB2d (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Feb 2020 20:28:33 -0500
Received: by mail-pj1-f65.google.com with SMTP id fa20so169928pjb.1;
        Wed, 19 Feb 2020 17:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KQJr9FsdBlQhWcMpCvEb58Famu41gPCGLlDefm3Amvg=;
        b=Z3yTuDo98QkJ5PT27E90wftyVJkraCPzOzHZ+IpTAIsv9MLZ7wBb5r31AvvfLMCBD6
         ODLquRyu62e6Bk2NACxnxSfqrfLHiWqrmp+vQih0ovt1gfMRcbPcTXux3UU3xx/1g9W2
         pVGVUvgU7vMEAJZeZpt/jWi0ZjcGzcgmdf4f60FvyWLxeD/VOBog8sSc2psASg3FYEWi
         1ALF04+WEJwYxIpO3SAw//vIOjw5dtThEts7SmRF8Ja8K8p8tINOvSxOwTho4no0ZAze
         /gU8avnv7EkIqGWRXlRRaE4DUzHaNnlh3F4/waNb4O3Y49xWQK+lwbY3oTeJtiU+KiqO
         1BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KQJr9FsdBlQhWcMpCvEb58Famu41gPCGLlDefm3Amvg=;
        b=dMMfqBh5u32CBKyzpnuQgal26NzUldlVikqiBY6+u/F9wEolzYCB8NS0bUZ/Ci0Mu6
         5C0d8twenRqEBFOmbApXrcyRjNQTubeTExf8VHeDV+u7+JczStiCDi1d+ND+x2ARgt/o
         gXOKURojROr8rkCIKVEfeIGWsvKKIIMrnWwhGd+/uCacUhIrmyoSYKMQQy92Toikqc59
         5kjL5kxI7OGgMqosgHq6h2KtY8Q9g5euNBsVw+CfwKM8u9Ttcuyen1KoFVX+Rxpy1YbG
         LXYWUlBlhfLqjJV6neD8fNtP6xTI/oFanyzASMAltPsaf/Gs5EfU+6EkuEkF4KsxM+D4
         HidQ==
X-Gm-Message-State: APjAAAXckdD5ifK2ZQf8eUFT70ETTMnUeKP1acuco3cjseRg3MUQt/60
        3d3wwTn/7IBYkzrEQD8o5n4=
X-Google-Smtp-Source: APXvYqzzuo+e09JvR8rGinhnuQoinMX49bI1tdyUvp9y9WFfHp1ffXwDGph3vRBMhj6f7Ale6vngmg==
X-Received: by 2002:a17:902:a608:: with SMTP id u8mr27583841plq.76.1582162112840;
        Wed, 19 Feb 2020 17:28:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c3sm847251pfj.159.2020.02.19.17.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 17:28:32 -0800 (PST)
Subject: Re: [PATCH] watchdog: qcom: Use irq flags from firmware
To:     Stephen Boyd <swboyd@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <20200220002047.115000-1-swboyd@chromium.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a0756043-04b4-800d-52cc-0b53381f66e6@roeck-us.net>
Date:   Wed, 19 Feb 2020 17:28:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220002047.115000-1-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/19/20 4:20 PM, Stephen Boyd wrote:
> The DT or ACPI tables should tell the driver what the irq flags are.
> Given that this driver probes only on DT based platforms and those DT
> platforms specify the irq flags we can safely drop the forced irq flag
> setting here.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/qcom-wdt.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index eb47fe5ed280..c70e89013101 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -248,8 +248,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>   	/* check if there is pretimeout support */
>   	irq = platform_get_irq_optional(pdev, 0);
>   	if (irq > 0) {
> -		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
> -				       IRQF_TRIGGER_RISING,
> +		ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>   				       "wdt_bark", &wdt->wdd);
>   		if (ret)
>   			return ret;
> 

