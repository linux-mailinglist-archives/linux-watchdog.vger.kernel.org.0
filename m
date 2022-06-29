Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B08955FFC3
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 14:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbiF2MX1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 08:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbiF2MXV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 08:23:21 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E957D54;
        Wed, 29 Jun 2022 05:23:21 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id n16-20020a17090ade9000b001ed15b37424so15853452pjv.3;
        Wed, 29 Jun 2022 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i5bt6Boum1pzyjuAkQL2BXJbYh3VbMQptS1AewIQ1qA=;
        b=Wu8AfLucIvGoPa5vtarMVaGQy6tTcoEcs6EKOrbxOtrswBrA8i1CyMqdYGGG5D5/uf
         vKpCaZR0/2gSQBkbRLdjFWjXZ207KRDLh4cQEtBtTEpraFFr35IjK/cW4JPeNmAlPpmd
         iXUkubf0rBVROEL7dFsLDTeroTIxWi6eMH44I8bEJc96bPhkblTvu1zg3OcmF3NrdW9D
         oqKEC8ddBRxUv37UcOSxcBELYVc0JeUFnqAUmTihhP0JdxmFeKIjNl0nUZ2eb043HOtp
         ziU5NisGqJORRAxMsZxS+OVCplwa/ib0Ust/nGzj96f1oDXRn9zvpw6P5rOdvSRRtqND
         FXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i5bt6Boum1pzyjuAkQL2BXJbYh3VbMQptS1AewIQ1qA=;
        b=m8cAxDA2GBO5YRF+caHg2aeUq4TkoyU/pGDHcyuH11J/nT4JXhvcQaIVDjCVCvoyC7
         jRzNWYKVsJF7EYebCJtEhDGyiQ1TsQ6hJaEbpJFqKMHLm0y3jhvnjND8y1ZZKnVRG3jx
         FP824ZO/UeXOY3vNTWEQLJ+mrCK6JFOYl9sXrEZMpgdky1shtpfNwNFPy1set+1bvDVe
         hrX4FyIS4sh9lHeppx+WxSA5jNtChKeXaC49FaDYsPEwnxAWq4Oi5ZbI9aRZJjJAhUDB
         hWH0fvCtnH3R5oAk5Amihe9FwyQ353yAzlZBJamKOUXIEh8deRCofqQg3AclwiVPbd5Q
         npXA==
X-Gm-Message-State: AJIora+PqZ8IblYuVnidPkG5X6VAcq2bdiYpOEOISZ86CgGIacOgND8/
        6kPfqkYn52Mhkx5e9sGBymWu6wfnL3Q=
X-Google-Smtp-Source: AGRyM1tN7Pv9d3qFHMvvhgcEwEQQipkCCh4HCZw5wTjQwLkMuDBMjmnT1U6VOQu7vIsBaPdde46/zw==
X-Received: by 2002:a17:903:18f:b0:16a:5c43:9a85 with SMTP id z15-20020a170903018f00b0016a5c439a85mr10094885plg.122.1656505400592;
        Wed, 29 Jun 2022 05:23:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r88-20020a17090a43e100b001ecd954f3b6sm2022630pjg.7.2022.06.29.05.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 05:23:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <111fb5c8-cbaa-f1bf-fdb1-192a992582f4@roeck-us.net>
Date:   Wed, 29 Jun 2022 05:23:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] watchdog: pm8916_wdt: Handle watchdog enabled by
 bootloader
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com>
 <20220629084816.125515-4-stephan.gerhold@kernkonzept.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220629084816.125515-4-stephan.gerhold@kernkonzept.com>
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
> The bootloader might already enable the watchdog to catch hangs
> during the boot process. In that case the kernel needs to ping
> the watchdog temporarily until userspace is fully started.
> 
> Add a check for this in the probe() function and set the WDOG_HW_RUNNING
> flag to make the watchdog core handle this automatically.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2: Improve error handling (suggested by Guenter)
> ---
>   drivers/watchdog/pm8916_wdt.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 49f1a5204526..f4bfbffaf49c 100644
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
> @@ -199,6 +200,15 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>   	if (poff[1] & PON_POFF_REASON2_OTST3)
>   		wdt->wdev.bootstatus |= WDIOF_OVERHEAT;
>   
> +	err = regmap_read(wdt->regmap, wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL2,
> +			  &val);
> +	if (err)  {
> +		dev_err(dev, "failed to check if watchdog is active: %d\n", err);
> +		return err;
> +	}
> +	if (val & S2_RESET_EN_BIT)
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdev.status);
> +
>   	/* Configure watchdog to hard-reset mode */
>   	err = regmap_write(wdt->regmap,
>   			   wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL,

