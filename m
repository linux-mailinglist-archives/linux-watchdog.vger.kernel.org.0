Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2BF3B5410
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 17:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhF0Pjg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Jun 2021 11:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhF0Pjg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Jun 2021 11:39:36 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF792C061574;
        Sun, 27 Jun 2021 08:37:10 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so15680456otl.3;
        Sun, 27 Jun 2021 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lMhRlO1Xkh8gfckvHOGgFo9jg3Vn08GwQISseZ644bQ=;
        b=kVxSs3rDEIY4IoeHD1OwLDA4DzO0TPRJo/PnBA8j2iHHsvsj26rfq3aR6V1aROpWyD
         m0ULNbCauErLUUyTKvLqNXnyqCb8iiXWsNQJesH4zQaM1Pr8ZCun+aDiyPBc2tOjS2Y8
         fz4r5E7fx4dcEr7mQwSuh5ZasyYf1fRiHAK6hcptJMyOHHvV/JgM2ZltcxPF3zC85h3Q
         K3tx44j/djjxd+kHwU/U9cm6TaIgQ37RKOpg9yd5WbSen0yKCp4Sd646ac7uh/wKQ2PU
         SKJ6gccrYBPk25xDNTCuqeM485gz7Rxm6RSD9ElF5slOxqHgZm/NF9aRJtpUs8mrPVn5
         W+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lMhRlO1Xkh8gfckvHOGgFo9jg3Vn08GwQISseZ644bQ=;
        b=iT7X7xUUcIhl+igT3gIoWNqYtX4qP+PHuXxWRaf3Fh+UWa2H/fy4M404qdsOPN6wsa
         H+MNg0psfgNfV9mSEdQDNHsAS1dw5r4KbQ5NixQqEc6J41DBsLCU52S+54/JeoPRuf7P
         mwIIb2fIdCT8Zc9Ih6vcF2TfRcq4cW0IoqyLunKNh98Wen/61ytfc+eAzjcf3PkTtDjT
         pTiJu41tyrhEzj1b7gZlmNrlH8xYA52xNoklXg+VtkxS9BdpldbnQsAgvat6Z+TP3jM0
         7BUsOtFKgdD6Py0WgyTiJZO05d3iAryMGGsPKcE4jKaoY7+qQSzdx5bDOCuaaZZzKJd+
         32SA==
X-Gm-Message-State: AOAM533APqjFwhBSYPcOVFa+AyNzI5esU5Zmv33qK0pD8Ajr0V6mVMcw
        iBIUYcwX/iDSduIt2wd6aKY=
X-Google-Smtp-Source: ABdhPJwQKc0UelUXUyRAC8U7ItqvSjkrlD1Mxlh5OGIWJN9uNLdvRYLgDukmfrAmcTgM2L+Qt1ZkTQ==
X-Received: by 2002:a05:6830:270b:: with SMTP id j11mr17422450otu.161.1624808230297;
        Sun, 27 Jun 2021 08:37:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j7sm2621507oij.25.2021.06.27.08.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 08:37:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/5] watchdog: meson_gxbb_wdt: add nowayout module param
To:     Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-4-art@khadas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <69f72ce6-dd62-3ffe-b620-50ceb6b318e0@roeck-us.net>
Date:   Sun, 27 Jun 2021 08:37:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-4-art@khadas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/22/21 7:44 PM, Artem Lapkin wrote:
> Added nowayout module param same as in other moduels

Please use complete sentences and words, check your spelling (modules),
and refrain from irrelevant statements such as "same as in other moduels".

"Add nowayout module parameter" is sufficient here.

> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index ecd1fc6f48ba..0bf5dccf70b1 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -34,6 +34,11 @@ module_param(timeout, uint, 0);
>   MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
>   		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
>   
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="

'(' missing before 'default'

> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
>   struct meson_gxbb_wdt {
>   	void __iomem *reg_base;
>   	struct watchdog_device wdt_dev;
> @@ -190,6 +195,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   		data->reg_base + GXBB_WDT_CTRL_REG);
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> +	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>   
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }
> 

