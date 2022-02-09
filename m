Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B3D4B00F2
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Feb 2022 00:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237036AbiBIXIO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Feb 2022 18:08:14 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237033AbiBIXIN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Feb 2022 18:08:13 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072E3C1038D3
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Feb 2022 15:08:16 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso4298763oon.5
        for <linux-watchdog@vger.kernel.org>; Wed, 09 Feb 2022 15:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IxTs4h/FRUFbzW6czo+aoWDvjC71EGWWMx0uUtQqUlQ=;
        b=a4c8Ug9ueeylLtnwbPEfNpw+sqA8+8AoX6MDG8CxVgBHx2F4klICkLgr8evEcLXno5
         a0zrQYD1hMjbHw+l/AqXJLUSgKU5cE4ns4o8Yi6TxpdbPUJUszAVe1YHnGwOu97Y2aT3
         BzGL2JLxBNQLRHhAwiNfjZrkun/aNoPI5d9sWS9Sn/li6n7DWP9vtD6iQtwyOvBSaC8g
         oTE8kCzgJ8Hwi3M1Ef7zzGyYeBExqIgRoPv6MTIfctrqVadxBmyk2rplBzDqLL1scoRz
         X7O8VDYjfrROJyWRWsf6bhBYwXnIpGdUoyEAFn5TXwL/lCQlHpLU7bPNN7hnEE5BnnMI
         7sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IxTs4h/FRUFbzW6czo+aoWDvjC71EGWWMx0uUtQqUlQ=;
        b=iPikIt21cReAfcmuBIjgOA1DC9QGcgiMhNNI+7cj33co3A7UVO3Psuw4QsIDl12d1M
         JJs7aZcdo0+gKshf0CgUgrzzyJHEB2Qltz8DKmlm9sL5pV+JrsywdwrgYrKEVk/nq2Z4
         pCIs7I5b5sUBkvHQPXBR979HeBXaRnLqbR+cxcMOCxl9oAgzOXLj7RInJzhwji9VtRSg
         jYTQbydVj/1SS+Y/ASImVAHSUR1XnWERy4+SKzo6YZE2+Vmnh9Tv2YQeDxleoaf/4WXD
         Xy+KOoFybbRJNm6IWTVuTLHGet9FmpuSx/I+ro5r5RwgaofbB8Qe72MrHFPOsJps+DrX
         SuEw==
X-Gm-Message-State: AOAM531bE+7yVAUhlfY28nKwdVvkBN6VYLoJOwJ4RS1Nys5z1Cg28Nqe
        7hkX/HAAuTiZtE62ywI87HSlkUKzkOfXoQ==
X-Google-Smtp-Source: ABdhPJzNPjukAo1dNx5Fa9xfaR2xxVlZ5Hg2YVCLRKQn3oB47Jl4KfOomHDSkFhhfmTayzhCOi0Bow==
X-Received: by 2002:a05:6870:b143:: with SMTP id a3mr1757971oal.255.1644448095207;
        Wed, 09 Feb 2022 15:08:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f14sm1985603oiw.22.2022.02.09.15.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 15:08:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3f3426bc-974e-1864-a68f-463e627cbc7a@roeck-us.net>
Date:   Wed, 9 Feb 2022 15:08:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] watchdog: allow building BCM7038_WDT for BCM4908
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220209203202.26395-1-zajec5@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220209203202.26395-1-zajec5@gmail.com>
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

On 2/9/22 12:32, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> BCM4908 is a SoCs family that shares a lot of hardware with BCM63xx
> including the watchdog block. Allow building this driver for it.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index c8fa79da23b3..ee9c57a5fafa 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1779,7 +1779,7 @@ config BCM7038_WDT
>   	tristate "BCM63xx/BCM7038 Watchdog"
>   	select WATCHDOG_CORE
>   	depends on HAS_IOMEM
> -	depends on ARCH_BRCMSTB || BMIPS_GENERIC || BCM63XX || COMPILE_TEST
> +	depends on ARCH_BCM4908 || ARCH_BRCMSTB || BMIPS_GENERIC || BCM63XX || COMPILE_TEST
>   	help
>   	  Watchdog driver for the built-in hardware in Broadcom 7038 and
>   	  later SoCs used in set-top boxes.  BCM7038 was made public

