Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289A63DA626
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 16:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237363AbhG2OPL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 10:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237987AbhG2OPI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 10:15:08 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB34C061370;
        Thu, 29 Jul 2021 07:14:39 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id o2-20020a9d22020000b0290462f0ab0800so5976446ota.11;
        Thu, 29 Jul 2021 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QDLjPZN8ZUez+18AHDdRnCP4XJMffoaOJtiTB2SHTCI=;
        b=otThYwEsPlAaugJoVzvywiMf8KME+8FYj0brlZtsYJ66ELMdDgEfrnznqSYJcUNpz2
         uR2IzF9iyYQ7w7gO4KrS2ueA/mcVzMY89P9R0zW1UpBBT/eWB/ql4L2Dq/rFjepyzolv
         1zjxJNSS/z5Lwxsu340dt9wYApRtUPQXEE5Y2WS8cPLt8RsPmP0izyz3/rkCsHX1cRg2
         AJCTCkzT3e6Z5PqH1AhPDebmFUQT8S30myOdINTJWiiNRpdpRNb0EcpiVJ7Asow2QGcq
         raTXNnPCHUQ/ukOVepAjP1GlRs5bTjffMRETCXOnIiqxZqv+0rQi+2x9ODeAkxPU3gIJ
         gbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QDLjPZN8ZUez+18AHDdRnCP4XJMffoaOJtiTB2SHTCI=;
        b=QjW8Cffx50ErNar55hpU0IsRg/coyKggwlu7N4ll8lTXVUnh9TeFAu8kDRzAlFYIVG
         1+WeVqQKPAWRcI/JgLUFHEuzvWBF5lk+wsF37pqxJtBeaAtk/ImB2PiyTODqVYsIOhB2
         sxecVct2zCCRpVWBVvbVeExVN9QVV3vYdluSJeEMRuzHbDY5BAgAsDUCsHon2Z82QVDw
         x3gbCQV6VlAD9EGXp2P6DFahqVngdubgnfMooDJfkh6fMQLGkKbenthwWA8KIsXucQlB
         3BFdk2aM58rpnaJ+2v1c0Ucsj71F/y/nDLZBuejxwJTuXym/Aq1ebX2IsHdXb8M1/CYq
         osQQ==
X-Gm-Message-State: AOAM530VAhJWTcIsl8ctMdYbTobE27Kr5wRzk19xMeDWc9a6liQqMeFc
        3Pb3xAyc3I1XeREpXEuGLY0=
X-Google-Smtp-Source: ABdhPJwPmNU2yxHwvQAda+MoQNIG1Z/7IFYXidLj/URXoQIWClCZj1xCTsyMw48FrNSbwFET4AR2Tw==
X-Received: by 2002:a9d:3a08:: with SMTP id j8mr3526915otc.247.1627568079002;
        Thu, 29 Jul 2021 07:14:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z14sm538315otm.66.2021.07.29.07.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 07:14:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: add timeout parameter
To:     Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210729072308.1908904-1-art@khadas.com>
 <20210729072308.1908904-3-art@khadas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <33af8802-1a24-27af-0c21-08741707be83@roeck-us.net>
Date:   Thu, 29 Jul 2021 07:14:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729072308.1908904-3-art@khadas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/29/21 12:23 AM, Artem Lapkin wrote:
> Add timeout module parameter
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5aebc3a09..3f3866878 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> +static unsigned int timeout = DEFAULT_TIMEOUT;

DEFAULT_TIMEOUT is already set below. The default for the module parameter
should be 0. This way the watchdog core takes the value from devicetree
unless a module parameter is provided.

Guenter

> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>   struct meson_gxbb_wdt {
>   	void __iomem *reg_base;
>   	struct watchdog_device wdt_dev;
> @@ -180,6 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>   	data->wdt_dev.min_timeout = 1;
>   	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	watchdog_init_timeout(&data->wdt_dev, timeout, dev);
>   	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>   	watchdog_set_drvdata(&data->wdt_dev, data);
>   
> 

