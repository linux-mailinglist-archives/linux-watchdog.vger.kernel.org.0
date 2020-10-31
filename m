Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6812A1810
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Oct 2020 15:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgJaOIs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 31 Oct 2020 10:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbgJaOIr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 31 Oct 2020 10:08:47 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACA7C0617A6;
        Sat, 31 Oct 2020 07:08:47 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id g43so545048otg.13;
        Sat, 31 Oct 2020 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PUP50lDEru7fyi0Z0avojm2dKzYp2C2Xo21IUxdozrw=;
        b=nRbMVW5eyAqR2WQUoy8VuqTMwYx+puMvoJmUyzh3hZuBJIhA4y8MNliBT71j6z4OMh
         3680lOiJUbnmiygXh7sYcR7vhuo7GD91PtlxzU70oAz4YcaLLd+7GLllqYHgwdrYtgqb
         0DKD8A/rc83pSkQeh4uhOZN77m1738TI629PTujV1hr99Vu/+bYYXezMF5reqCx8r+5q
         ObquIPeX1usgupp9pyOs4ccJJ/YKK4vEYNQctJUn2GStHISUQY5kvlSOVsyeF95lfPeV
         oz3rE3FRimlFJlz4zzyLh2KZaK/6P/gmdHzP0Pd8P8xiIlz5FCdT7XH/48sNK3DDJSlD
         aGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PUP50lDEru7fyi0Z0avojm2dKzYp2C2Xo21IUxdozrw=;
        b=a/Pjgd8z/LbsQz4RlR8CrtiluE51gY9NFvCuNB7eL7SUtTqntPzC4dzRWLyIQHa0Cz
         saj9k9tlI+Wczo0AgbJcRQqpI48mHZgtsQp6EbSp48Lt4LIZnt1hMD48q3G0IyK6nu7h
         Y7I2X6eec/ar6StejhAAjbC3sCun4BePkS6xy8CD4bVZBltYUXHes7wNiY0y7nBTAdoE
         6eRIw1gzlO+nwDjgTvATyhzELs848rN9v84zGi0OrmqaGIJslzD4C74UNgQ8o7KZHwD3
         RNUDECxGFWPmTX6nXXANCgy7oaY3VnQLHyj/ux7YoyT/C/GU9HGGP8Ob/7Ro4I121BXo
         TraA==
X-Gm-Message-State: AOAM532CbhQ2vMKXbaELhQCXIwDUpfgOoiQZkzJ9+WzUMN1XRbKqGK6s
        Fz/G0yUOEzAtrTOdXLTz0wAfCNfxw8M=
X-Google-Smtp-Source: ABdhPJy4kjylI2g6C26gCEfniFL5EQJdIsU7FMS9yBMPtmxVxUmQnFyIxi9WD7jjegFZRodp2zwY/A==
X-Received: by 2002:a9d:65c2:: with SMTP id z2mr5327493oth.80.1604153326731;
        Sat, 31 Oct 2020 07:08:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m27sm2141898otr.32.2020.10.31.07.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2020 07:08:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when
 appropriate
To:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        bjorn.andersson@linaro.org, wim@linux-watchdog.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20201031121115.542752-1-robert.marko@sartura.hr>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a71307f5-22b4-0d38-2880-96084bb07275@roeck-us.net>
Date:   Sat, 31 Oct 2020 07:08:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201031121115.542752-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/31/20 5:11 AM, Robert Marko wrote:
> If the watchdog hardware is enabled/running during boot, e.g.
> due to a boot loader configuring it, we must tell the
> watchdog framework about this fact so that it can ping the
> watchdog until userspace opens the device and takes over
> control.
> 
> Do so using the WDOG_HW_RUNNING flag that exists for exactly
> that use-case.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
> Changes in v4:
> * Use QCOM_WDT_ENABLE macro
> 
> Changes in v3:
> * Drop call to stop as start already does it
> * Update commit message
> 
> Changes in v2:
> * Correct authorship
> 
>  drivers/watchdog/qcom-wdt.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index ab7465d186fd..07d399c4edc4 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -152,6 +152,13 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  	return 0;
>  }
>  
> +static int qcom_wdt_is_running(struct watchdog_device *wdd)
> +{
> +	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
> +
> +	return (readl(wdt_addr(wdt, WDT_EN)) & QCOM_WDT_ENABLE);
> +}
> +
>  static const struct watchdog_ops qcom_wdt_ops = {
>  	.start		= qcom_wdt_start,
>  	.stop		= qcom_wdt_stop,
> @@ -294,6 +301,17 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.timeout = min(wdt->wdd.max_timeout, 30U);
>  	watchdog_init_timeout(&wdt->wdd, 0, dev);
>  
> +	/*
> +	 * If WDT is already running, call WDT start which
> +	 * will stop the WDT, set timeouts as bootloader
> +	 * might use different ones and set running bit
> +	 * to inform the WDT subsystem to ping the WDT
> +	 */
> +	if (qcom_wdt_is_running(&wdt->wdd)) {
> +		qcom_wdt_start(&wdt->wdd);
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> +	}
> +
>  	ret = devm_watchdog_register_device(dev, &wdt->wdd);
>  	if (ret)
>  		return ret;
> 

