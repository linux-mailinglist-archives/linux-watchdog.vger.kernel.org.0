Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C33A655C386
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jun 2022 14:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236767AbiF0OKI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 Jun 2022 10:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236778AbiF0OKH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 Jun 2022 10:10:07 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E9313D57;
        Mon, 27 Jun 2022 07:10:02 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id c205so9134149pfc.7;
        Mon, 27 Jun 2022 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=ST6/uI8tXZH7pQ+ernx/OpLdl4iQTKy4m9qi3OodjQ4=;
        b=kIw8mhUiKbPeLo0As7uG2MNu5ap8qTeY/RACkMNYn8LsaVMPzOu/OJtP44qHEBcAkH
         sYGcmzEWrS2vCmL0B88d5G5CvdLkqmU77kwt2LnIOsqYaXUAk0De06YlREObw7UPOH2T
         NAPabwtB6pzztaY7esa3xh1SpwjTyxaK+5/TXIb/f2raXilEFSnH8Ycmbso/Wx6GaCbx
         g0MwqdfXJTur9rvTRBdrybxRyRD4stI6otaX7/kwQwQ1Ln9voIFM3Yba9wdxtnvkxFF2
         8GjtA210HW7ONZ9rU2KHEp8MVN17q5qhJ08UNJ1/Qv1efRsCrod7IWDleV0IIbAgAH/R
         ZIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=ST6/uI8tXZH7pQ+ernx/OpLdl4iQTKy4m9qi3OodjQ4=;
        b=VcirpalS5CsHei2aaEuw1bk/Wo1RjfFD0dG0NOmQ03s8HHmPue8uP+vAo562Z9+uPn
         vynJTrTP2oAlVq2fm4eLYdIS90wEe+y2FHLtU5Hn9jTsf0Hjc5ZTQDPwBn4ShsrAv8mU
         nGiIU9mrnbc2rBZL6thG+060hMvp6kiCfYcv/Cn3kk1c2VDg7QIzDG7jDfoY6flZuSWU
         Ynch1FidGVMh+O8R//M00Zf3cEs1OWn+jMMjEJtEn8Hp2dSjyQIejsV9Xv8nYrkJ48mW
         fNPg3fCJpXvG9YvA6rSVzIIdL5eopuaTRtKxyFxPF5d+gpzRKjpwoUnEGpSqv2rUSFqm
         TUkQ==
X-Gm-Message-State: AJIora+8mBe3ILTDXZ2ONE6T4kJb+46LW7QIKGpjTD9E5YV8Z4mpcG+5
        R6Jqg2oo1Cz89zY5LW7EeEA=
X-Google-Smtp-Source: AGRyM1tBQeXN7XNGVt3OnoOjUNRnLyC6rpMTRKosrRaZA7d2TM4t51FfNE/Aa2S1l/R/utkVhVvSKg==
X-Received: by 2002:a63:6e08:0:b0:40c:7557:c4aa with SMTP id j8-20020a636e08000000b0040c7557c4aamr13192976pgc.356.1656339001070;
        Mon, 27 Jun 2022 07:10:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id em20-20020a17090b015400b001eae86cf683sm7390569pjb.42.2022.06.27.07.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:10:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a0c31814-43e9-bbe4-57d3-d97724e8ae60@roeck-us.net>
Date:   Mon, 27 Jun 2022 07:09:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220627111432.2625168-1-stephan.gerhold@kernkonzept.com>
 <20220627111432.2625168-3-stephan.gerhold@kernkonzept.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/3] watchdog: pm8916_wdt: Report reboot reason
In-Reply-To: <20220627111432.2625168-3-stephan.gerhold@kernkonzept.com>
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
> ---
>   drivers/watchdog/pm8916_wdt.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 670cd79f4cf9..3fc03fdae466 100644
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
> @@ -175,6 +184,20 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>   		wdt->wdev.info = &pm8916_wdt_ident;
>   	}
>   
> +	err = regmap_bulk_read(wdt->regmap, wdt->baseaddr + PON_POFF_REASON1,
> +			       &poff, ARRAY_SIZE(poff));
> +	if (err == 0) {
> +		dev_dbg(dev, "POFF reason: %#x %#x\n", poff[0], poff[1]);
> +		if (poff[0] & PON_POFF_REASON1_PMIC_WD)
> +			wdt->wdev.bootstatus |= WDIOF_CARDRESET;
> +		if (poff[1] & PON_POFF_REASON2_UVLO)
> +			wdt->wdev.bootstatus |= WDIOF_POWERUNDER;
> +		if (poff[1] & PON_POFF_REASON2_OTST3)
> +			wdt->wdev.bootstatus |= WDIOF_OVERHEAT;
> +	} else {
> +		dev_err(dev, "failed to read POFF reason: %d\n", err);
> +	}

Error handling first, please:

	if (err) {
	} else {
	}

Also, decide if this is indeed an error or not. If it is an error, abort
probe. Otherwise use dev_warn() and explain why the problem is ignored /
not fatal.

Thanks,
Guenter

> +
>   	/* Configure watchdog to hard-reset mode */
>   	err = regmap_write(wdt->regmap,
>   			   wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL,

