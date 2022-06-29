Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE9655FFCD
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 14:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbiF2MWo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 08:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233225AbiF2MWn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 08:22:43 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777653152B;
        Wed, 29 Jun 2022 05:22:42 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id a15so14913673pfv.13;
        Wed, 29 Jun 2022 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yA8x1JTm/j36FA8xueDB35dzz1WZm+y+6CUcKYSgzFs=;
        b=Pm/4l8l2W3ufh2l4MIvnJ8B6lqYcVmVAYECNwtvPyQ9BvyO3+fpL626ao1/rYd24KP
         8+6kdxD9jRBF3NAeXrXnj7HMz9e6MyBYrAxC/JKAM6MCncr8OxIcaT9fqjmmXPS9vvNf
         ER4b/ZF5SbMiQg80hZ5W9CR5ymGHy4/0NOlhOuzg9cb289AnFAU91Z0qG5MbGkXJ46jK
         oW3oGiivy+V9WTKnM1o+xRDkecLVN8hySfb7UyhHSTLJIv8g6MATCHEQhSQVxESu7Wtj
         sqfjsIr92DHizw+ojy65o00ZLHzQvgeQAKPt8B+Z9pQDdc0xcOWKBceCvAFnYfSe/Hl9
         fWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yA8x1JTm/j36FA8xueDB35dzz1WZm+y+6CUcKYSgzFs=;
        b=hRbOclWs+1jas4ClI4ssVGp0Dev8RFmtD11MAWG1azd9rbwfEokJlBpOcJyhkr2DxF
         aZCL+SJeaAo42RqD+S0Z0l7C1HJmTVlp6PwP5gP9dFggcR2akAl5IkhUe6aqGJhE3d1A
         IpJTmbN/7ZMQk1LUWwhxcabxSc/91/Mqg3B07C/ukEpeucmaxjZdEj/H5bFM0VSjVUuC
         3hNXMPAe1oslw5KH53VHcwqbYe0PcZcDE+IqJEI33qldEyJu0nJMsm4L9FhVIfcnvKdu
         mLzdU+2L3vaI5w3P+yVYXlS3OiPF2kUaTiruaz9seRpUrs/4xAN4uGaOQHxODgparYSs
         mIyg==
X-Gm-Message-State: AJIora8qz1GnIMby8zEyGRfyAWiRwjUoQmOELpitUjN714cpfS934XXh
        o8JLLYx0yhANe+4N68cEoikipSIKxcI=
X-Google-Smtp-Source: AGRyM1uGpc2L5M+FBFvrIyDcx/RNC53Io9wKYdmG+PfpXyfZDc1iLuDD/0Afvl8nAv4oSn5fsjWOpw==
X-Received: by 2002:a05:6a00:138b:b0:525:1f0b:3121 with SMTP id t11-20020a056a00138b00b005251f0b3121mr9001262pfg.8.1656505361715;
        Wed, 29 Jun 2022 05:22:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902d2c300b0016796cdd802sm11455748plc.19.2022.06.29.05.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 05:22:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <75a452ad-7df7-e3c7-0ac5-9563dce2278c@roeck-us.net>
Date:   Wed, 29 Jun 2022 05:22:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/3] watchdog: pm8916_wdt: Report reboot reason
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com>
 <20220629084816.125515-3-stephan.gerhold@kernkonzept.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220629084816.125515-3-stephan.gerhold@kernkonzept.com>
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

On 6/29/22 01:48, Stephan Gerhold wrote:
> The PM8916 PMIC provides "power-off reason" (POFF_REASON) registers
> to allow detecting why the board was powered off or rebooted. This
> can be used to expose if a reset happened due to a watchdog timeout.
> The watchdog API also provides status bits for overtemperature and
> undervoltage which happen to be reported in the same PMIC register.
> 
> Make this information available as part of the watchdog device
> so userspace can decide to handle the situation accordingly.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2: Improve error handling (suggested by Guenter)
> ---
>   drivers/watchdog/pm8916_wdt.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 670cd79f4cf9..49f1a5204526 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -9,6 +9,12 @@
>   #include <linux/regmap.h>
>   #include <linux/watchdog.h>
>   
> +#define PON_POFF_REASON1		0x0c
> +#define PON_POFF_REASON1_PMIC_WD	BIT(2)
> +#define PON_POFF_REASON2		0x0d
> +#define PON_POFF_REASON2_UVLO		BIT(5)
> +#define PON_POFF_REASON2_OTST3		BIT(6)
> +
>   #define PON_INT_RT_STS			0x10
>   #define PMIC_WD_BARK_STS_BIT		BIT(6)
>   
> @@ -110,12 +116,14 @@ static irqreturn_t pm8916_wdt_isr(int irq, void *arg)
>   }
>   
>   static const struct watchdog_info pm8916_wdt_ident = {
> -	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
> +		   WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER,
>   	.identity = "QCOM PM8916 PON WDT",
>   };
>   
>   static const struct watchdog_info pm8916_wdt_pt_ident = {
>   	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
> +		   WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER |
>   		   WDIOF_PRETIMEOUT,
>   	.identity = "QCOM PM8916 PON WDT",
>   };
> @@ -135,6 +143,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>   	struct pm8916_wdt *wdt;
>   	struct device *parent;
>   	int err, irq;
> +	u8 poff[2];
>   
>   	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>   	if (!wdt)
> @@ -175,6 +184,21 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>   		wdt->wdev.info = &pm8916_wdt_ident;
>   	}
>   
> +	err = regmap_bulk_read(wdt->regmap, wdt->baseaddr + PON_POFF_REASON1,
> +			       &poff, ARRAY_SIZE(poff));
> +	if (err) {
> +		dev_err(dev, "failed to read POFF reason: %d\n", err);
> +		return err;
> +	}
> +
> +	dev_dbg(dev, "POFF reason: %#x %#x\n", poff[0], poff[1]);
> +	if (poff[0] & PON_POFF_REASON1_PMIC_WD)
> +		wdt->wdev.bootstatus |= WDIOF_CARDRESET;
> +	if (poff[1] & PON_POFF_REASON2_UVLO)
> +		wdt->wdev.bootstatus |= WDIOF_POWERUNDER;
> +	if (poff[1] & PON_POFF_REASON2_OTST3)
> +		wdt->wdev.bootstatus |= WDIOF_OVERHEAT;
> +
>   	/* Configure watchdog to hard-reset mode */
>   	err = regmap_write(wdt->regmap,
>   			   wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL,

