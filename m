Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56513B5418
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 17:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhF0Pr4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Jun 2021 11:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhF0Pry (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Jun 2021 11:47:54 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A92C061574;
        Sun, 27 Jun 2021 08:45:29 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so15696779oti.2;
        Sun, 27 Jun 2021 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iIEswyTeFsaVzMVOhrH0b0aZFx1DUf1Zvxz83hF4BEw=;
        b=SsRlx/2s9XCeCd74HUMT3QpSr9C3SOpIFMWVuNjLKJXR8BjdG3zmFPQAJYrF8qOZvG
         vWPM2j4/nmb9WFsHXEUi/ND132AXK/h434A5TWt135y/1OhS05hzK0eULzzfYdneax5f
         XXCkBYvX/pA4m1Gk6OItabi3xzTO3JKICW0fReo0uZB2W+ZkmsnfpoI1r9qFCDNjPLWW
         N+nDjTsf60cBgWSC7tKxK4A/TTo3HZV66t9XlRfzFU/fn9APNH7yAhUq9P+KDIu3LW11
         Het6RSQfc6NbqSJ+Hah/Q4VSBP+Kg9jmr6BWdc+eEGaqVdvo5SB0V2qoH/B48RR1cET3
         RtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iIEswyTeFsaVzMVOhrH0b0aZFx1DUf1Zvxz83hF4BEw=;
        b=X8id2d8+IXF+u/h9perIS/Z9O5uX16KfifKzSUIGCV68zlnjWT3kYxDCptx4OWR+fd
         0x+udMCvqmDynVhgwB6d5kZy+R+E1VgKZNmvxE71pktymHdA1XAE1fOLGL9Pzyiy6uIB
         lVmd8Es9GhsDJIyaTAyLL5tcyx0/GsiUQ7YCxB/IDsa2/uyasuZVdpDrl7vmWZPsOAAU
         RGwITyjjrfJze/erUyjqhTI3RTbVnmtecIr1C2Ozu57h6EaGU9ryo6Jd1lClRtO+Pcf5
         4AJ7zPiglccSes60YDNbaBFynYBSOE7mllZn2Zz39ZvBNrqH+qD+BDx7bWn3/DhXyJ0k
         C8xQ==
X-Gm-Message-State: AOAM533dXW+3IqprXF+mmpBcMWtqZ/J6Q8i/jqiAJxMzGoLqLrct9eUP
        +wBPkmJSXKDcSHPopGUOFCk=
X-Google-Smtp-Source: ABdhPJwe21S0j7KPZnAfbinwtBdvM9auuN/8Hf5ReRnIyUyC4v+C+fbhiSnsh90BrieYCsPuS2J71Q==
X-Received: by 2002:a9d:2f0:: with SMTP id 103mr17593622otl.174.1624808728839;
        Sun, 27 Jun 2021 08:45:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m3sm1805484otf.12.2021.06.27.08.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 08:45:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 5/5] watchdog: meson_gxbb_wdt: add register device status
 notification
To:     Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-6-art@khadas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cd3a7822-2a17-84b0-7e14-c132ce69ab14@roeck-us.net>
Date:   Sun, 27 Jun 2021 08:45:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-6-art@khadas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/22/21 7:44 PM, Artem Lapkin wrote:
> Print watchdog success driver start status notification
> 

Another personal opinion: The driver author decided that the message is
not needed (which matches my personal opinion). I'd rather see all those
messages either go away or moved to the core. Either case, this one is
misleading: The watchdog is _not_ enabled. The watchdog driver is loaded,
which is different.

Guenter

> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 2dbe254e5122..750b304b460d 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -198,7 +198,14 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>   	watchdog_stop_on_unregister(&data->wdt_dev);
>   
> -	return devm_watchdog_register_device(dev, &data->wdt_dev);
> +	ret = devm_watchdog_register_device(dev, &data->wdt_dev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
> +		 data->wdt_dev.timeout, nowayout);
> +
> +	return ret;
>   }
>   
>   static struct platform_driver meson_gxbb_wdt_driver = {
> 

