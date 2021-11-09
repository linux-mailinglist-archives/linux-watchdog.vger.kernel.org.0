Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF1A44B05D
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 16:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236974AbhKIPdB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 10:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236981AbhKIPc6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 10:32:58 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979BEC061766;
        Tue,  9 Nov 2021 07:30:12 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id q33-20020a056830442100b0055abeab1e9aso31408386otv.7;
        Tue, 09 Nov 2021 07:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0WsRLZzA+8WjebZk6MQ2yQcE7NyK/cID66AG50nvoVc=;
        b=A3ZlGo23Y03n58pNlCX3VHiJ9bXqoKSn3wUaTr67d7afWz8UbNpvScGMEqMCV7Jrc3
         ok3KIcMo7mXQa1KYm88SQyBLo0JasHLfF3gsxxPQzzGiFMQNeMcepBY/b1+ABOWJccMZ
         yEwJARs6Iw9+PC8vu3aYoO+PDoqfy4XmCnc+lQ8PxgEw3H1hTiS/eJkab3JtQ+Ge3okZ
         dxe8K3sEr4J/uAUbu89GY4vZmdJOM+d1QBM1CaGyNIUQTpx8XLeV/yGVbXj7gGLELnon
         w3CNPvIQ9gEWjQ823XGQR7SbNZ35FdiaGj3qk5jRITqIIFEcdRUPOnmr6Ee5UVVT296X
         Af2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0WsRLZzA+8WjebZk6MQ2yQcE7NyK/cID66AG50nvoVc=;
        b=MEhWEEc8u+AVbLf3g2RHCFZ8wAwYh4IlrvZnotBipHNvit9bKUhFBwcsgFRb9kbYjJ
         BnJXPPLintfvXtH0fALWJryEag8URjTDoF07hQXdQENMLy5S4m3jXLPzl304BX59q67c
         vPLBLaqh90I/AWLmJbLZE/HfumrATzevPM/m9xgtMR/b0L8KsI+s7V2Dzs0QWMkZLFqd
         fHUUeB41RqBVKbux70VUAvr+Dpce9DrC6kRhVV4yqZHaUdgqC4kCAhJO8zrWTA+6wg7p
         zimPziYnmqYHEP3alrck2c94DYV5k81/rmzcVerroLhqjQXdCrHmmAqthkNtB8Z3T/fV
         VZ+g==
X-Gm-Message-State: AOAM533RnKJ+qWeUDLac2fJLd2knYtVI8eXG2wligJq9K1lQqo/mkzM9
        dZHOE+goSMeNd3naZ96sCqV+tQ8TJ6g=
X-Google-Smtp-Source: ABdhPJxpyLpi4skiHMAK0ayI3zl7zHHQ5Xt5N5DUoX1F1aZAsG4RL86djvldh6Ns7Zr1Ru4loTZMow==
X-Received: by 2002:a9d:2ab:: with SMTP id 40mr6894622otl.208.1636471811989;
        Tue, 09 Nov 2021 07:30:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f12sm3292856ote.75.2021.11.09.07.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 07:30:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
To:     Art Nikpal <email2tema@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     wim@linux-watchdog.org, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
        Gouwa Wang <gouwa@khadas.com>
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
 <CAKaHn9KxZDAHdKGZg3-Pi3jZO5E3knESHCFjgaV09u5QYe074A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <24363743-48fb-c01f-eb5d-0cd486d099f7@roeck-us.net>
Date:   Tue, 9 Nov 2021 07:30:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKaHn9KxZDAHdKGZg3-Pi3jZO5E3knESHCFjgaV09u5QYe074A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/8/21 11:59 PM, Art Nikpal wrote:
> hi Guenter Roeck
> why still not merged to upstream ?
> 

I had asked you to provide an updated description, without the "personal
opinion" part which does not belong into a commit log. The other two
patches wait for Wim to send them upstream.

Guenter


> On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
>>
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
>> Signed-off-by: Artem Lapkin <art@khadas.com>
>> ---
>>   drivers/watchdog/meson_gxbb_wdt.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
>> index 945f5e65db57..d3c9e2f6e63b 100644
>> --- a/drivers/watchdog/meson_gxbb_wdt.c
>> +++ b/drivers/watchdog/meson_gxbb_wdt.c
>> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>
>>          meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>>
>> -       watchdog_stop_on_reboot(&data->wdt_dev);
>>          return devm_watchdog_register_device(dev, &data->wdt_dev);
>>   }
>>
>> --
>> 2.25.1
>>

