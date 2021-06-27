Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25DC23B53FE
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 17:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhF0Pbm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Jun 2021 11:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhF0Pbm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Jun 2021 11:31:42 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0BFC061574;
        Sun, 27 Jun 2021 08:29:16 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so15667451oti.2;
        Sun, 27 Jun 2021 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5gFqnS/CoYLNlikXZlkgnwqo+7RmKH3b1Jf1rQbqAcs=;
        b=czXaaYQlf6ff5fpTB7PrT/Q86P0SWfMniizjxTLZmaSWtQhUoaQoDlBkc1Q1qNKCjL
         4BaaMGzno8CRjXE8AXURgq/j8qhtxBclOzYMMlYwYMhqrGnUDfUTXycfPPhXY7hi1dCi
         ojoGjm0CPn6coxOjqWhN7BwrriQy+pDUkjb2xDvqQH1wNpnozZFWnboQwBGbN42pB+T0
         QlHhYg4jjAgDZe4ffX/6qtGYXCrIHrqUHFiCclyu5Dm6ftOhxA9rV616jT7cSz02EsBt
         stEqMMBWBMTCYCKU+hLyZ93UE02q/0NUEdED/wi5f2QAOIQZuWIB1UOxrlP5kCOHo8ZD
         e9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5gFqnS/CoYLNlikXZlkgnwqo+7RmKH3b1Jf1rQbqAcs=;
        b=Er4xXMpgZwwqnPtnI5RQxXzPRu0OA1Y/KUpLm3+wAKl7Zhyx0THr8++d44a0ac7U23
         fovsUSpX39n42mzQbrG9h0R1DsdlZdUsI6P/K5v17JIKsBp4V0Ua5iSu0dNlyNk1JjGO
         Ugh2qaHT9gZjggdDTzkN9GUhBlqnwX01MWNEEPu7evYGoMM5viu0Zprx6LegBfvRXrcN
         3PSX1f9qT/Xo58Gfk1EsprsuTj8VV75RwDex1UMdpwDntxiyP6yuE6/ZhZzBQL3qHGq3
         JE5KQDTRGrYpB83OeZyQ4A/9nxJ14foq/QNSPyTtzElYj+3jjz1oAJ9sZ+M57FDiU7hR
         kxuw==
X-Gm-Message-State: AOAM533MR+YTprugicfAiZBpgisjUUHVaCxRXCz3xLWMXEiswu45m2cV
        +YVDK4wa7qGx9zrFHDAWNkk=
X-Google-Smtp-Source: ABdhPJyTo3B/5vnfM/5AaVmSpxZJ3xyn8xFTPpxA9Kfu2fxbMwY1kUWKm02TFV7syL5ywgeZrHE2aw==
X-Received: by 2002:a05:6830:4a2:: with SMTP id l2mr1514306otd.267.1624807756137;
        Sun, 27 Jun 2021 08:29:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t25sm2308002oij.47.2021.06.27.08.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 08:29:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/5] watchdog: meson_gxbb_wdt: remove
 watchdog_stop_on_reboot
To:     Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-2-art@khadas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f8605141-348e-dcc2-1457-021c0c0ff7bf@roeck-us.net>
Date:   Sun, 27 Jun 2021 08:29:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-2-art@khadas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/22/21 7:44 PM, Artem Lapkin wrote:
> Remove watchdog_stop_on_reboot (still can be activated by
> watchdog.stop_on_reboot=1) i think this driver configuration more useful
> becouse we can get reboot waranty for abnormal situations on shutdown stage
> 

This is personal opinion. Driver authors would have to agree.

Guenter

> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..3f86530c33b0 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -186,7 +186,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>   
> -	watchdog_stop_on_reboot(&data->wdt_dev);
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }
>   
> 

