Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648F3355570
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Apr 2021 15:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhDFNlq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Apr 2021 09:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhDFNlm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Apr 2021 09:41:42 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E61C06174A
        for <linux-watchdog@vger.kernel.org>; Tue,  6 Apr 2021 06:41:31 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso14625244oti.11
        for <linux-watchdog@vger.kernel.org>; Tue, 06 Apr 2021 06:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4CWtimK4ZUEE79NDsNs4J9hl7M6HxsBzDDsyySs+MyM=;
        b=p1Ff7NuY8LF5tr1ZL/9yiAX/mmIEBnLqtEuu5a0U7FyD7jn2laHbtMRdiqTOyf1FTd
         48nxs2ExRv/6ovg1P18C/HeizfdIe+ev/aPc5SpYQb3iRszR8g4dtwuZtCATryKLUkZ2
         OSH+DR6SL3AxOircq0zLBnhbLH0wextefDvLkZwYvJkUP252hJpenFqLw5Xd/fuOdK7X
         /qJItN0p2L3tv2Ne0v/w8KVnwMqmwnDeeMn38DP+156COGWAjpE2M0mu6BcxZGPUb1TN
         ripCDcngT82aaUnpdh2w7gznGz/+PmVosOo3XYOjhq0X9wyqxrmkUaPaeg0RZK2a4gu4
         M44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4CWtimK4ZUEE79NDsNs4J9hl7M6HxsBzDDsyySs+MyM=;
        b=AFJHC1wFEoylFpP8StwHHYnVmXZ3L4gbJvGP0Q4HOaiIVm6vCgNLZq73LL4RsDHi+b
         DTnmb+yBgXTrFEdRvtEPm8o8czWaZLR9Q4kDp7NTJCNNlD4Eq5p9fFpKBk7FVm9K0NkE
         +LwXmJ6zMhYnmFL03a8/0VxcJCxidQ2/TVmT7hlloQ7BftkiS+bLeSwxK68NtfFQhSdy
         XToxj3dyoGy3gIxcAyeItI3+FZ1ER7Y8Th4UzWQ79e4PUB5VBuRka+izthtt9mJXjYiZ
         /sXjAWOC9BUeewP4ELKywRWJ+1DFbMKYR+d0dc8dX/M12kcYiepgkZYYANIY+Vsg1aCS
         stgg==
X-Gm-Message-State: AOAM53113ofyoKttolCpjnmx+PiK/N+Q1sK5qobsfH4f+B6UsGa1yuD4
        N0DLgCz4sUkhSEKwzt16by0=
X-Google-Smtp-Source: ABdhPJz2PIfX7IXpaaIU5t9ZdF65UEKuZYNK5/ko7/FclNWwC72EUrIaQUiaGd2ytpN4JAE5ATXEkg==
X-Received: by 2002:a9d:67c2:: with SMTP id c2mr27219188otn.343.1617716490927;
        Tue, 06 Apr 2021 06:41:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g9sm4170053otk.6.2021.04.06.06.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 06:41:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] watchdog: imx_sc_wdt: fix pretimeout
To:     eichest@gmail.com, linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20210406121246.49335-1-eichest@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <143a39d7-1c4b-e823-e677-a650d1a00443@roeck-us.net>
Date:   Tue, 6 Apr 2021 06:41:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406121246.49335-1-eichest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/6/21 5:12 AM, eichest@gmail.com wrote:
> From: Stefan Eichenberger <eichest@gmail.com>
> 
> If the WDIOF_PRETIMEOUT flag is not set when registering the device the
> driver will not show the sysfs entries or register the default governor.
> By moving the registering after the decision whether pretimeout is
> supported this gets fixed.
> 
> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx_sc_wdt.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index e9ee22a7cb45..8ac021748d16 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -183,16 +183,12 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_reboot(wdog);
>  	watchdog_stop_on_unregister(wdog);
>  
> -	ret = devm_watchdog_register_device(dev, wdog);
> -	if (ret)
> -		return ret;
> -
>  	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>  				       SC_IRQ_WDOG,
>  				       true);
>  	if (ret) {
>  		dev_warn(dev, "Enable irq failed, pretimeout NOT supported\n");
> -		return 0;
> +		goto register_device;
>  	}
>  
>  	imx_sc_wdd->wdt_notifier.notifier_call = imx_sc_wdt_notify;
> @@ -203,7 +199,7 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>  					 false);
>  		dev_warn(dev,
>  			 "Register irq notifier failed, pretimeout NOT supported\n");
> -		return 0;
> +		goto register_device;
>  	}
>  
>  	ret = devm_add_action_or_reset(dev, imx_sc_wdt_action,
> @@ -213,7 +209,8 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>  	else
>  		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
>  
> -	return 0;
> +register_device:
> +	return devm_watchdog_register_device(dev, wdog);
>  }
>  
>  static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
> 

