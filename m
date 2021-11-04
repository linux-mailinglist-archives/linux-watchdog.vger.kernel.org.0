Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DEA444CA0
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Nov 2021 01:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbhKDAgv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Nov 2021 20:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbhKDAgs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Nov 2021 20:36:48 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D470AC0432CC;
        Wed,  3 Nov 2021 17:33:41 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id bg25so5767515oib.1;
        Wed, 03 Nov 2021 17:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V213yynwIxju7l3q8g0MgtsXu2d7h87vyCf36TZFlqs=;
        b=PrpMHkrvenNfhrdEz1KKjNM/RFbi0sE9kHYHEJcEmZwLPeIIH9P5xBhYaQAv0iSawk
         8BW76pRAjUq17KgEWmUKi8rxcHwNlhrOkmCCU0cpXwHAvgNa6v2Zy526L3v5ImeXEuTi
         YGATS4n5LFSXiV0ELBgR0JIoO4JCfOJFQi/qmvYu9IQORP5OSu6dCFj+F4UfDnsjvvwL
         H0E0ChuYBwCqnH53fYRFofgNe+GQ3FNpSjFiQu6UL4vCL8TsQK6mZFic4glCDgB0iBZr
         GBOhPydpD0hOmd0mkcU1fIQPl9kwzhEOU9mXE07TKKjMdPPdkn/NWPkp3RONweqvHXNu
         gojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V213yynwIxju7l3q8g0MgtsXu2d7h87vyCf36TZFlqs=;
        b=CIccKOdF5LDa8jABNJdDp1L5U2a5/IYQoV8YBdId4vw9/jh+kgmz+66SPoccbRC7Do
         iKMlrY9N2T7CXJ9z6Zys9/QRll9TmzvjTfj6IDoLtOwM6xX4qg+ys5Bol3Fwz5p+E3mY
         YuViFAn5kgtnrO5EsJT1c/3yYzHqWSoq98WxwfUCiOh4+6yrRLfEaraqwWMCdCbFpEGg
         CZL65wKAA1ADFqXD/NUaaSqRYGTyBQ69OxmgTCFE1vIZrSoaAwhNENl0pCOUoIPXyqcG
         ntEg5NUrHQ2BOgmAmndHyVBT+CyltBAxFOkX9RYaG7arxp9GBREz/W0mCwEQ5+gcmBoy
         xGLg==
X-Gm-Message-State: AOAM533pRuG/IeDzVjnDwM20nXDNpP30jhK0UrRbUfg/ZWFqANn1q5mq
        DiLbDxQ1Mxp1xOhkl6GFz0MMn1g5fq4=
X-Google-Smtp-Source: ABdhPJzdgacPXftu/R6dwrdkM/3Ju3cAtk67FoEaiVAG22wqfWUC8GRXLT16+yld4B3HfQGKHGBEqQ==
X-Received: by 2002:a05:6808:f92:: with SMTP id o18mr11594807oiw.46.1635986019434;
        Wed, 03 Nov 2021 17:33:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q33sm935221ooh.16.2021.11.03.17.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 17:33:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: Kconfig: enable MTK watchdog
To:     Kevin Hilman <khilman@baylibre.com>,
        linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc:     Fabien Parent <fparent@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20211103230354.915658-1-khilman@baylibre.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <fa77f716-a7c4-5926-3f21-418dc4c37fc5@roeck-us.net>
Date:   Wed, 3 Nov 2021 17:33:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103230354.915658-1-khilman@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/3/21 4:03 PM, Kevin Hilman wrote:
> Enable CONFIG_MEDIATEK_WATCHDOG when ARCH_MEDIATEK is enabled.
> 
> On some platforms (e.g. mt8183-pumpkin), watchdog is enabled by
> bootloader, so kernel driver needs to be enabled to avoid watchdog
> firing and causing reboot part way through kernel boot.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..00bebbb8f877 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -836,6 +836,7 @@ config MESON_WATCHDOG
>   config MEDIATEK_WATCHDOG
>   	tristate "Mediatek SoCs watchdog support"
>   	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	default ARCH_MEDIATEK
>   	select WATCHDOG_CORE
>   	select RESET_CONTROLLER
>   	help
> 

