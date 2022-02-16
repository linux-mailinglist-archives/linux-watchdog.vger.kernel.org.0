Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA51B4B9038
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Feb 2022 19:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiBPSag (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Feb 2022 13:30:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbiBPSae (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Feb 2022 13:30:34 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E4E295FFE
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Feb 2022 10:30:19 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id e19-20020a4ab993000000b0031a98fe3a9dso2869458oop.6
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Feb 2022 10:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y0GJuntoqSVUEDvZrlgVoz04fBw6kaXCpGL04Udmi08=;
        b=gr6N5zZgDhRZjrRWjpvCra3xKPXaZ5NYXp1uVSt4gggPxsywkabkHUNBdNr+qF/MS2
         vJ1ZJiIMCNdncsQojU+LDIhJYPQzJ83cbhTVy6jlKyoRRZIGuwJHNLHEUGJ7gxhXEpsL
         Xx5ir7mXuYAfH6ooAHLAmplmIuewqX9qnnfEY74KT7tif+YMcOM0BywXLLRXGMjRFQdF
         IIFkr0ugQBJAuxGXDWEGe9NHGfzPwBj39L7GRatkUUcQZuA5VaYi8LIq/vuF+9RAg0e+
         JV+NYMVWlJ3tzJ1/gqgGbBm+pfZfzBTELL033jetEgXcuWz0QZ8tks/jq3LYCBi2PggO
         oM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y0GJuntoqSVUEDvZrlgVoz04fBw6kaXCpGL04Udmi08=;
        b=j9b1b1mjn0yXYdKVLOQBbM4P/ZeDAfvN0lUMocEIqt2eT+fF7MRsJkVmNUA5UgeKnD
         Dw3USqPB2cgpma+n1HF6g4w/9rRyH9BsiflTCN/9+sb6m6ydO/XDZpjRRIGt5oS1tQN2
         EqCYxJdfm82J2n2sxSiVrPlyaRnkg2gSkvvUh1k+BvZkgRloEUgASmcDAoC5np+tgeEZ
         qjvL8JTibzxCmwdQBfF2VLr8BX/mfoy5DpLcwp1aOThXH8kSBH5dfIGbbidCIJmNH7oS
         tAuOcMXIBe49y665WQTGvMwU/w0whMSKNYTOAJfg5AWjVe6/CTYef0Ubvv/h2Z3l1eRd
         zQrQ==
X-Gm-Message-State: AOAM533mk8CuiwIJkct4NSkHriucKiKp3qTNs83jUuemXZO1vSvzqCEb
        6GUHaapkAer6ICpgvJWPTFE=
X-Google-Smtp-Source: ABdhPJwta9CoE+LWXGHs59qqqKfw3qXwcr4DYOK/tweA740yRftD9bxhDs1aaJ0e4FKJIhjlHKS7hw==
X-Received: by 2002:a05:6870:6691:b0:ce:c0c9:5c0 with SMTP id ge17-20020a056870669100b000cec0c905c0mr983138oab.18.1645036219211;
        Wed, 16 Feb 2022 10:30:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bq16sm11461720oib.33.2022.02.16.10.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 10:30:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b5dfc149-e43f-66d7-26fe-4f3b1f0beee3@roeck-us.net>
Date:   Wed, 16 Feb 2022 10:30:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] watchdog: bcm7038_wdt: Support BCM6345 compatible string
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220216063408.23168-1-zajec5@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220216063408.23168-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2/15/22 22:34, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> A new "compatible" value has been added in the commit 17fffe91ba36
> ("dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding").
> It's meant to be used for BCM63xx SoCs family but hardware block can be
> programmed just like the 7038 one.
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/bcm7038_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
> index 8656a137e9a4..1ffcf6aca6ae 100644
> --- a/drivers/watchdog/bcm7038_wdt.c
> +++ b/drivers/watchdog/bcm7038_wdt.c
> @@ -218,6 +218,7 @@ static SIMPLE_DEV_PM_OPS(bcm7038_wdt_pm_ops, bcm7038_wdt_suspend,
>   			 bcm7038_wdt_resume);
>   
>   static const struct of_device_id bcm7038_wdt_match[] = {
> +	{ .compatible = "brcm,bcm6345-wdt" },
>   	{ .compatible = "brcm,bcm7038-wdt" },
>   	{},
>   };

