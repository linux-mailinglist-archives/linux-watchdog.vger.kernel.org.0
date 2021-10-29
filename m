Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B1543F3EC
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 02:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhJ2AdZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 20:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbhJ2AdY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 20:33:24 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CD4C061570;
        Thu, 28 Oct 2021 17:30:57 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id x27-20020a9d459b000000b0055303520cc4so11116002ote.13;
        Thu, 28 Oct 2021 17:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bvmi8DsyrWipthpn0ItITFLCLn9V8U2XeLVX9tq1EWI=;
        b=UdhoI8+i5oUFI2wil6UpdvMWaICsJYyJ9oyQXmxsLos4lvVwRweK1YbKtGoyXHy/eK
         Y0xcRdpJ0JSx1Q0waYIC924kb17fWxsyzTQSsWsBvzk+cpLn/rLw7sr87+7azqaZe+XT
         Hb8C33JdEQf3DH5W6cit2sigGnayLge0WWxH/V/oFA6NmoKBWBlpZGPg88GOZW+ZDHOa
         0Z1jXxOc0W5cyu+F1ZXYMrYcZcE26OV9olC6TG//XhNEh2kQrmi9hM9E3URs/FhARUtd
         fXiXnDQnK9LiqBgMdDb8uRAtqBuH2q3CjKwj8NxbUNcBD4FDVBNypzbsDr/vSP9iqvll
         E2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bvmi8DsyrWipthpn0ItITFLCLn9V8U2XeLVX9tq1EWI=;
        b=WB6USDvTgi+R0cr7rHTI/4YCiQ3nDd7O4Vbtl/rAYqd7ASEVgdxGldIk0Lk89wbWkb
         3jbo6OH/rjQ4QEIs7SgKX8tMh3V3kmIZ0YAad3ndDCiqeUnlg7PcZ+xiTIiw25R9P2mL
         D30lki1AzhKglY8UhvWjhazbZS0aVoV3ZX2mS8NMZlRVDVOmr+b2cliFMEihUAnaFUoa
         re0PEonGv4bIJ6fCvY1eDJ6sFRjnwDybFc/rBYDaDWRNdJt2BoGOrJKb25xVTZBiNSGq
         aHRT05cI3k1sD3jtSQy0YkbLAuHHn9Fzjr+E6khSzQA6R4uhntMTHBpzaT1q4jbb522r
         2KLQ==
X-Gm-Message-State: AOAM530yFujMvkT+kxwLLL8EJejsvLXvQDoyCBbdvRUGIwFJfEoyJEOL
        iGLynNkPFVNfgEYH35DSOqZzla0BpVI=
X-Google-Smtp-Source: ABdhPJwMWsxKBhaxoxjCqeI93dO9gfkpiTRMtByD/pm5SiVR8iDKiAHnAw7GnFd3+ltydMOt687HHQ==
X-Received: by 2002:a05:6830:1af0:: with SMTP id c16mr5905034otd.16.1635467456422;
        Thu, 28 Oct 2021 17:30:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w12sm1350126oop.19.2021.10.28.17.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 17:30:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-8-semen.protsenko@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 7/7] watchdog: s3c2410: Let kernel kick watchdog
Message-ID: <1ad6b625-4388-bc78-e258-eae0b9357b96@roeck-us.net>
Date:   Thu, 28 Oct 2021 17:30:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/28/21 11:35 AM, Sam Protsenko wrote:
> When "tmr_atboot" module param is set, the watchdog is started in
> driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
> watchdog core driver know it's running. This way wathcdog core can kick
> the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
> enabled), until user space takes control.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index ca082b1226e3..9af014ff1468 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -732,6 +732,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>   	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>   	wdt->wdt_device.parent = dev;
>   
> +	/*
> +	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
> +	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> +	 *
> +	 * If we're not enabling the watchdog, then ensure it is disabled if it
> +	 * has been left running from the bootloader or other source.
> +	 */
> +	if (tmr_atboot && started == 0) {
> +		dev_info(dev, "starting watchdog timer\n");
> +		s3c2410wdt_start(&wdt->wdt_device);
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
> +	} else if (!tmr_atboot) {
> +		s3c2410wdt_stop(&wdt->wdt_device);
> +	}
> +

This doesn't cover the case where the watchdog is already enabled by the BIOS.
In that case, WDOG_HW_RUNNING won't be set, and the watchdog will time out
if the userspace handler is not loaded fast enough. The code should consistently
set WDOG_HW_RUNNING if the watchdog is running.

Guenter

>   	ret = watchdog_register_device(&wdt->wdt_device);
>   	if (ret)
>   		goto err_cpufreq;
> @@ -740,17 +755,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_unregister;
>   
> -	if (tmr_atboot && started == 0) {
> -		dev_info(dev, "starting watchdog timer\n");
> -		s3c2410wdt_start(&wdt->wdt_device);
> -	} else if (!tmr_atboot) {
> -		/* if we're not enabling the watchdog, then ensure it is
> -		 * disabled if it has been left running from the bootloader
> -		 * or other source */
> -
> -		s3c2410wdt_stop(&wdt->wdt_device);
> -	}
> -
>   	platform_set_drvdata(pdev, wdt);
>   
>   	/* print out a statement of readiness */
> 

