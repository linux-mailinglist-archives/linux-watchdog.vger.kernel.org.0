Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885A83DB4FA
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 10:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237922AbhG3IUU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 04:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237939AbhG3IUT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 04:20:19 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBF7C0613C1
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Jul 2021 01:20:10 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so3181432wms.2
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Jul 2021 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5zdWLUXNJU0I3jZZ3brzary8lrdEEnSpQU409joGD14=;
        b=JzWav/+UQ71FuwQ6UITAqfqrxp2ltUX7DgVNDt14RiOd46N2HR2jsHFvFah9+ZeeGB
         YSjrOTBFNpL1/OnS84wdFJfWATY79tOr3d8GDLMwAHddGerXsDur6CO3440ito/wC5RS
         OCxVVePArMHbKafvWRdtPySAYSgE6cdNBb7LBv4v8uUtB1FrN/s1baqVhwqvj5l6QIgE
         F9mlNDSbKvt3q7elNAmzVBduuqog7l7LgewwNnQQe/WO32J/wyREP3ZcmKNqwxY4Bz72
         mmSuYsNeprDL+dFqjgTZs2FLWWrZUPFwoOZEN1imHtqhNSTikxId9y0OJr/qVqZ4cy/T
         REZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5zdWLUXNJU0I3jZZ3brzary8lrdEEnSpQU409joGD14=;
        b=MJfc/GzcQBRl8QARFfRoidtUdqH1t4mKpAmXHO31a2aThkF7ETKArU3IyX7/q/XmgD
         dI5gzAxhoJrfWNniYgzM52h0MgEyDUarHA0hfAp+vveujSKcJ9RXkgKBDN1Ww3tnjJA4
         hH4Gy0901z0XcZy2lqa6TYQ2Yym7kNVrRlCX415KQ/1TYCO9ahUGODuzrgRs5YpRDFCg
         Y0SNJ9L2Md+Tzn2nboOl96c9HvWRPfuKmKppjKOYz7ugq8V+7cGuzRv3Ah6FQdij5Ej/
         pyQ0qkVmi6oton8pYGbaQqL00HPjU5ATrLru/VnaOYhEp2Hcx0pc5zxOLfT+WlW/MQ0R
         vDkQ==
X-Gm-Message-State: AOAM53107hr4bh+9/LSPXBtD+FLDGg3gpUnb1lcaoC2p0oifhR6ynDgb
        MRrvWVZ9/JJrT17KOi5ndrM5Fg==
X-Google-Smtp-Source: ABdhPJyQFiTfoBz82jRJQWZ8jvSNbntfvoFKpzoIrcUu4TMY1XG3H6knR3+eJ7RxifDA1xn4kKY6rQ==
X-Received: by 2002:a05:600c:88a:: with SMTP id l10mr1710089wmp.78.1627633208255;
        Fri, 30 Jul 2021 01:20:08 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0? ([2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0])
        by smtp.gmail.com with ESMTPSA id z6sm869484wmp.1.2021.07.30.01.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 01:20:07 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
To:     Guenter Roeck <linux@roeck-us.net>,
        Artem Lapkin <email2tema@gmail.com>
Cc:     wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
 <20210730045857.GC2110311@roeck-us.net>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7832d036-3811-544e-8007-fe719bb38ded@baylibre.com>
Date:   Fri, 30 Jul 2021 10:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730045857.GC2110311@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On 30/07/2021 06:58, Guenter Roeck wrote:
> On Fri, Jul 30, 2021 at 12:13:55PM +0800, Artem Lapkin wrote:
>> Remove watchdog_stop_on_reboot()
>>
>> Meson platform still have some hardware drivers problems for some
>> configurations which can freeze device on shutdown/reboot stage and i
>> think better to have reboot warranty by default.
>>
>> I feel that it is important to keep the watchdog running during the
>> reboot sequence, in the event that an abnormal driver freezes the reboot
>> process.
>>
>> This is my personal opinion and I hope the driver authors will agree
>> with my proposal, or just ignore this commit if not.
>>
>> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
>>
> 
> A much better description would be something like
> 
> "The Meson platform still has some hardware drivers problems for some
>  configurations which can freeze devices on shutdown/reboot.
>  Remove watchdog_stop_on_reboot() to catch this situation and ensure
>  that the reboot happens anyway.
>  Users who still want to stop the watchdog on reboot can still do so
>  using the watchdog.stop_on_reboot=1 module parameter.
>  "
> 
> That leaves the personal opinion out of the picture and provides both
> a rationale for the change and an alternative for people who want
> to stop the watchdog on reboot anyway.
> 
>> Signed-off-by: Artem Lapkin <art@khadas.com>
> 
> As mentioned, I'd still like to get an opinion from the driver
> author and/or some other users of this platform. However, I'll
> accept the patch with the above description change if I don't get
> additional feedback.

Sorry for the reply delay and thanks a lot for your review.

The rationale from Artem is OK for me.

Please add my Acked-by for the whole patchset.

Neil

> 
> Thanks,
> Guenter
> 
>> ---
>>  drivers/watchdog/meson_gxbb_wdt.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
>> index 945f5e65db57..d3c9e2f6e63b 100644
>> --- a/drivers/watchdog/meson_gxbb_wdt.c
>> +++ b/drivers/watchdog/meson_gxbb_wdt.c
>> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>  
>>  	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>>  
>> -	watchdog_stop_on_reboot(&data->wdt_dev);
>>  	return devm_watchdog_register_device(dev, &data->wdt_dev);
>>  }
>>  
>> -- 
>> 2.25.1
>>

