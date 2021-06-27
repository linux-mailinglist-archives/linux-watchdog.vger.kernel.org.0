Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B5E3B5416
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 17:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhF0PpT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Jun 2021 11:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhF0PpS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Jun 2021 11:45:18 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFE4C061574;
        Sun, 27 Jun 2021 08:42:54 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id c19-20020a9d6c930000b0290464c2cdfe2bso4372538otr.9;
        Sun, 27 Jun 2021 08:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3thVEfEpc7oBCh/Z27+kIvV0g7/BSf4GHimjNmLAI/8=;
        b=rfsm1MHy91CuXvQVQQij4cW7Zsel9ybXCQ4Bg/zbKngnjahskh1NOnTqelKWDLzoH6
         MVjUAgGz86qXRsghK7UD8EUcM4dCNgpIUMkehuyaeUaFnkRn8GRDOWPsjV1dNvU/1Duh
         2xuMGAHr6s8ItFCcy67OKsgJPeezbfx0KDRCb1wEH1KbxjkUhxsZQEqLNMyS/X/WSTSo
         cNH0xXzKtkizwhqgkCLChNXghdcg8U6vRtW9IDyb8Hnpk/Tpn8cWJpLb9f3xMZdEZMbo
         bJuTlID+QmpJkSzV0LsdJyhmJjvIUKk38IMH5Dvu7+1/fyx2u9yxV3Gxv2NP1ebkXjiT
         JX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3thVEfEpc7oBCh/Z27+kIvV0g7/BSf4GHimjNmLAI/8=;
        b=fAWhiond+Vi/BoOQKoSGZQYK146GOWs8W4JvQ19r9RPnCl67KM4I1/8o0zdAPJ6f0H
         I6bR8EVjsatLcOAGgqDupVYX+fXXQj2bhRlIAhHURqaevSsmHQyZYXFuC6VVKXx0bIdy
         hltt9hlwXu6dRv1hXHEhSgaZAtGDpUQ78XhDiD0Lm43S1Ldy4bvLDi3swmE1f1n9wyiU
         cRX1YLBlmEYaoSg6/Wov3mukAsBUcmaCZaarRq5bIMVpYMaRQzb8uPnLAmk9YHvoEtF/
         OeP35Jsxcz1Ing+6aK/fFDimfHLpBSWE4sfJuF5KGfgUWa+4rLRBFEvwSPtcY69BG/w8
         cFWA==
X-Gm-Message-State: AOAM530WbXET4XnYleqsoMV77gvyJ8EfuWVUYDWUnWMHAoiDjIze+RTj
        osW3352yyZDtujnxFUaO6XQ=
X-Google-Smtp-Source: ABdhPJy4+D9Td70nq0/Ra304FJwRaeQ44Jesy5d+gYrZz3MGsnReGMgyHMry5n5m2z9CRD4GS62+pQ==
X-Received: by 2002:a9d:4d8d:: with SMTP id u13mr16983789otk.367.1624808573453;
        Sun, 27 Jun 2021 08:42:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 26sm2534781ooy.46.2021.06.27.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 08:42:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/5] watchdog: meson_gxbb_wdt: add stop_on_unregister
To:     Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-5-art@khadas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5229d62c-b327-254f-800f-1524f27491b3@roeck-us.net>
Date:   Sun, 27 Jun 2021 08:42:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-5-art@khadas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/22/21 7:44 PM, Artem Lapkin wrote:
> Added missed watchdog_stop_on_unregister call
> 

This is again personal opinion and needs an acknowledgement
by driver authors. It is only necessary if one wants to support
that the watchdog is force-stopped by killing the watchdog daemon
(which leaves the watchdog running) and subsequently unloading
the driver. The call is not 'missing'; otherwise the core could
just do it. For that reason it should not be added with the argument
that it would be 'missing'. This will require a better argument.
Why is that call needed ? What is the use case ?

Guenter

> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 0bf5dccf70b1..2dbe254e5122 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -196,6 +196,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>   	watchdog_set_nowayout(&data->wdt_dev, nowayout);
> +	watchdog_stop_on_unregister(&data->wdt_dev);
>   
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }
> 

