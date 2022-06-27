Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD12355C7A2
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jun 2022 14:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236822AbiF0OMv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 Jun 2022 10:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236825AbiF0OMu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 Jun 2022 10:12:50 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D0913EB2;
        Mon, 27 Jun 2022 07:12:48 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id c4so8275278plc.8;
        Mon, 27 Jun 2022 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JCrNrmWLI9mv6/lfKgqHI7xJaEF9dIIvN4qEK/VNBW4=;
        b=JhP7JNI/JXV6Qw5iRIWZJMALUxNRFDRd8PbYocBBY8tyBe0LhNRsksOuuTnsU1dMWi
         q9cx5DG1ZdCNDib50TVYPxVef2JZiFMSPXJsYYa6rP+1umG4zPJNjIvZvCpCCQCZZanN
         2eo170xteujxrjebHl47kpLLzmZ2IOLsxUS3ew7/HvfxVWZpxxYTW5d0h7sTllHH8lV+
         zN0PvPH/Ca1KJGexNljTMX6CWF2xUSizuXFYiplv1a4Rg4t+7hrnIU9V+/t9uJkNNWys
         No0gMDC/ns7Z0NpJbF8INvD9UPLYkygg3DDiuYJ9fiNgGY9zkTXF/pdDy2IZhyJw1/bs
         fXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JCrNrmWLI9mv6/lfKgqHI7xJaEF9dIIvN4qEK/VNBW4=;
        b=dBUK+aNX+XLMVbXBrb+49UeRhSgz4WpYx2SLDl1h3+HEuCbBWQVSejvIQHj7HmAQqN
         dOby/8RnBYY96SUfbqpeWKzrL904lqh7A7EoqkDDSCIY1MF0EhJIuJOxSn3GmUe6FdeL
         67FjqDJcaKXH3NBpebWE5pQP07WPgr4uL0b6gRy/FBSeEfyZ0GLNVVvceORkbD6yCdI2
         wRrEeHfiGRWGoWGB0sBoBkWSa2SdrDYMV+SO8OixEPoTW3KWXymBhl9kdPAoruDyVBL3
         fVIHkIH4aRaYY8Q7rrU09JTEvvG/v3oMEMUXKpscLcG0cxDuYtgw/VTc0rkM+OO4mgdk
         Oyvw==
X-Gm-Message-State: AJIora9Qhn+OtRUp3Jz24hzOlw5HLZoWmQiauNnDyzwxRRW8XkYwEtn5
        e5zDS1XmJJVqayAHHoG7s3zm4iPMhYg=
X-Google-Smtp-Source: AGRyM1vG11+zkmMM27Hdh7QDSOlSIDhkThiqJsPv8azSjU7FpyMf3dx36oOkQlUM7ChrT7Qn/IOe1g==
X-Received: by 2002:a17:902:e810:b0:16a:4a57:a27f with SMTP id u16-20020a170902e81000b0016a4a57a27fmr14869795plg.144.1656339167882;
        Mon, 27 Jun 2022 07:12:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b0015e8d4eb2easm7258763pli.308.2022.06.27.07.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:12:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6dca5bf1-11cd-c079-f97a-3d11a8b519e7@roeck-us.net>
Date:   Mon, 27 Jun 2022 07:12:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] watchdog: pm8916_wdt: Handle watchdog enabled by
 bootloader
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220627111432.2625168-1-stephan.gerhold@kernkonzept.com>
 <20220627111432.2625168-4-stephan.gerhold@kernkonzept.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220627111432.2625168-4-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/27/22 04:14, Stephan Gerhold wrote:
> The bootloader might already enable the watchdog to catch hangs
> during the boot process. In that case the kernel needs to ping
> the watchdog temporarily until userspace is fully started.
> 
> Add a check for this in the probe() function and set the WDOG_HW_RUNNING
> flag to make the watchdog core handle this automatically.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>   drivers/watchdog/pm8916_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 3fc03fdae466..4ebd1d0cab85 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -142,6 +142,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct pm8916_wdt *wdt;
>   	struct device *parent;
> +	unsigned int val;
>   	int err, irq;
>   	u8 poff[2];
>   
> @@ -198,6 +199,11 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>   		dev_err(dev, "failed to read POFF reason: %d\n", err);
>   	}
>   
> +	err = regmap_read(wdt->regmap, wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL2,
> +			  &val);
> +	if (err == 0 && val & S2_RESET_EN_BIT)
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdev.status);
> +

If reading the status returns an error, I'd assume that something is seriously
wrong. If it is ok to ignore such errors, explain why this is the case.

Thanks,
Guenter

>   	/* Configure watchdog to hard-reset mode */
>   	err = regmap_write(wdt->regmap,
>   			   wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL,

