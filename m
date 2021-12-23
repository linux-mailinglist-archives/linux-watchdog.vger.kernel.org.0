Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA4647E6DD
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Dec 2021 18:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349496AbhLWRVU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Dec 2021 12:21:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58732 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349499AbhLWRVP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Dec 2021 12:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640280074;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lJwESBfXdLlRTQjVnn/8aRYzO0Ti75Ie9JZOs6s+vV4=;
        b=UALuU9ofRq9UiAnh3tTtN2N6X4coaojwF7Gb+ba6eWYNI5u9fmdgIJc80oEPIPVIKMwEB9
        RvPaOJ6T1NpybeQNvtpH6vThc6YVSE44IQ+4E/bGzZ+TFEDeJ+Yvnxb+ZfgjpLhlF/GbdW
        xWhDT1RLkXa7vDxCxsl7AG76Y1jmNxw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-5RaAB-w_P_aihmopoe-XPA-1; Thu, 23 Dec 2021 12:21:13 -0500
X-MC-Unique: 5RaAB-w_P_aihmopoe-XPA-1
Received: by mail-ed1-f69.google.com with SMTP id z8-20020a056402274800b003f8580bfb99so4981707edd.11
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Dec 2021 09:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lJwESBfXdLlRTQjVnn/8aRYzO0Ti75Ie9JZOs6s+vV4=;
        b=TJeb9wV6F2QYD9cak66HnQuLyq0JnB/4W8UUfc3DV02W+LMqW1eMWtYR6hc2HrxI0L
         pgD+1g0iRoJqvrPW3vPAiE0tjYVn6wcmueWpowb4tv5MWKzTAJ+jpsczPm8Bsxo/Y3WW
         8FJdSvYW7xXFpAhhuofhtq188ncbQ2AYUQoUaqlHNmpQYWKRD3DUIDxU80YvFyyS+ToY
         JAsm1Ouu3eJDROz3nhsfra7T1tOUunQnM13ZhFapOut219BUqviYtOZRbWf9AsUGfibU
         4qjnbA+gqWSKqRF6iobOls4IhkVUSt9wHEoPp78EpO9CIcToIoLMMYQrFt8x63GGisU/
         BgAw==
X-Gm-Message-State: AOAM531BFJx4dNr81e0gEnRw9h7CBhKP6/7y37Ezu/P1YKzl6WKJBsld
        qdjARVBc2diN2eaZJ/Ss0tdLi8zbWjWqRBNcsZRraQgsg7QRMaylJlUyBfNLaLrJYgV/2lp8K/v
        HTF0anR/ZrT6XAMYovc3m9UMFQ/k=
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr2655141ejc.450.1640280072431;
        Thu, 23 Dec 2021 09:21:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvNU4yKsznSEc81cyS1hgx9aufJ9uYEg6EMe6Mdn+BVvceyCYvgQqJKD2ZsvULoMRudmj/Uw==
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr2655118ejc.450.1640280072230;
        Thu, 23 Dec 2021 09:21:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id f26sm1915536ejf.131.2021.12.23.09.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 09:21:11 -0800 (PST)
Message-ID: <cb2915c5-831a-f2cf-55be-633ea21fa048@redhat.com>
Date:   Thu, 23 Dec 2021 18:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
References: <20211213120502.20661-1-henning.schild@siemens.com>
 <20211213120502.20661-3-henning.schild@siemens.com>
 <20211215201800.GA28336@duo.ucw.cz>
 <61983e62-bc3d-a711-c197-7436a2e33531@redhat.com>
 <20211219164903.GB28481@duo.ucw.cz>
 <20211220085220.23753298@md1za8fc.ad001.siemens.net>
 <20211220091434.2f696d76@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211220091434.2f696d76@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 12/20/21 09:14, Henning Schild wrote:
> Am Mon, 20 Dec 2021 08:53:55 +0100
> schrieb Henning Schild <henning.schild@siemens.com>:
> 
>> Am Sun, 19 Dec 2021 17:49:03 +0100
>> schrieb Pavel Machek <pavel@ucw.cz>:
>>
>>> On Wed 2021-12-15 21:53:56, Hans de Goede wrote:  
>>>> Hi,
>>>>
>>>> On 12/15/21 21:18, Pavel Machek wrote:    
>>>>> On Mon 2021-12-13 13:05:00, Henning Schild wrote:    
>>>>>> This driver adds initial support for several devices from
>>>>>> Siemens. It is based on a platform driver introduced in an
>>>>>> earlier commit.
>>>>>>
>>>>>> One of the supported machines has GPIO connected LEDs, here we
>>>>>> poke GPIO memory directly because pinctrl does not come up.
>>>>>>
>>>>>> Signed-off-by: Henning Schild <henning.schild@siemens.com>    
>>>>>
>>>>> Acked-by: Pavel Machek <pavel@ucw.cz>    
>>>>
>>>> I see that this patch #includes
>>>> linux/platform_data/x86/simatic-ipc-base.h which gets added by
>>>> patch 1/4.
>>>>
>>>> Pavel, can I take this patch upstream through the pdx86 tree (with
>>>> you Ack added)? Or shall I prepare an immutable branch with patch
>>>> 1 for you to merge ?    
>>>
>>> Yes, you can.
>>>
>>>   
>>>>>> +
>>>>>> +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
>>>>>> +	{1 << 15, "green:" LED_FUNCTION_STATUS "-1" },
>>>>>> +	{1 << 7,  "yellow:" LED_FUNCTION_STATUS "-1" },
>>>>>> +	{1 << 14, "red:" LED_FUNCTION_STATUS "-2" },
>>>>>> +	{1 << 6,  "yellow:" LED_FUNCTION_STATUS "-2" },
>>>>>> +	{1 << 13, "red:" LED_FUNCTION_STATUS "-3" },
>>>>>> +	{1 << 5,  "yellow:" LED_FUNCTION_STATUS "-3" },
>>>>>> +	{ }
>>>>>> +};    
>>>
>>> But I'd still like better naming than red:status-2.  
>>
>> We had the name discussion already several times, and i have to admit
>> i am not too happy either.
>>
>> But my impression was that this is an acceptable compromise. I am not
>> happy because the names lack scope, which i had in the first round
>> with "simatic-ipc:red:...".
>>
>> Function is also a bit unclear, but with the numbers and the user
>> manual, or looking at the chassis it kind of adds up and should be
>> clear to users which is which.
>>
>> But i agree with Hans that we should sort this out before merge. So
>> please say what makes you unhappy, maybe that can be fixed ... might
>> even make me happier about the names i feel i had to choose.
>>
>> The LEDs are per definition of the manuals meant for
>> users/applications to signal whatever the use-case might want to
>> signal. There are 3 of them numbered 1-3 on the chassis, and next to
>> the number can often (not always) be found a string like "error",
>> "maint", "run-stop" So a function suggestion i would say.
>>
>> I could envision to use "fault" or "alarm" instead of "status" for the
>> one labeled "error". And maybe "standby" for the one called "maint"
>> but i would really like to keep the numbers.
>>
>> Which would look like
>>
>> status-1
>> alarm-2
>> standby-3
>>
>> But still i have to clue what those names stand for and choosing
>> and of those "undefined" names could just suggest things and break
>> expectations. Calling them all "status" is neutral ... 
>>
>> Or can you explain the difference between "fault", "panic" and
>> "alarm". Ask 5 people and get at least 3 different expectations ... i
>> guess.
> 
> Long story short, i am also not happy but the current suggestion is the
> most generic and least "expectation-creating" i could come up with.
> While keeping a mapping between the name and the chassis/manual.
> 
> So i will stick with it, unless i get concrete suggestions on how to
> improve.

Ok, given the above I've gone ahead and merged this series.

I too believe the current status names are fine, but if someone disagrees,
they still have the entire 5.17 cycle to come up with something better.

Regards,

Hans

