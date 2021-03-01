Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9783280A2
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Mar 2021 15:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhCAOW6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 1 Mar 2021 09:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbhCAOWh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 1 Mar 2021 09:22:37 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D20C061756;
        Mon,  1 Mar 2021 06:21:55 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id m25so5152625oie.12;
        Mon, 01 Mar 2021 06:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z2MXdF87W+gBlm6EkvRzuYzA3kpfq/mx6XL8vWarJ7Y=;
        b=sX7to8qJpQWK9Wj7fFotclSU1TvOych85olX1RvxjHQCGHiBsLqnTIrI9ifgq2WznZ
         ZtZ1vskPXntVMqptWqHnG3lYL+P+Q8xb+A+q7Ey7IAmfFPyA9lpxCMxzPmqWHCbg6jro
         rPwEpr5v0swYw/5vIOVfmiEp1yUhemC2D+1GLglMyv3rcyy6QKK9IRxL9hBKnrlEqfuv
         EtDDaISuWx0RF/UWDc/v1XhScY9Yn+SYKdA5jZnCKJu9u0u/LBToahOchUw20x1OeD6e
         wkjeCt2qzWBlzhBG7TMdHRCf4eHTr3v2bwXDNrNBEyrX1xtGaHUGRjmvieA1BKx3QCH3
         biqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Z2MXdF87W+gBlm6EkvRzuYzA3kpfq/mx6XL8vWarJ7Y=;
        b=nKJEYCbqC/XKrQp2dZVM3cI8IatpTnZ5ZHwypwKjSZKc0WFsTjHcW91vhcuPQpvXYm
         eM2qJv7WC3vF+hvVecZRfj3u/z5CfSSqlURlbM6E/mxT/ub4bV+zxl6Y7bH0N+CORvcw
         gyPLlhqxifmXMrN7+9pV6uwhQ9Ry0ChPRnfRMquWyc6jk7/LSeQ2zzUpqkpG3VGFhj50
         88ci+CBDQoHR9FDCKdE8P0wGTj7ENBZBZq9FvVkrPbFxWWojig3OVKD3WbOzglp8EWgi
         boSOiM+/PYTtdX8PO/DErk2taXd1qMhz41wq/qgYfXsiXhch8TRs+pHZbtUlmXdAMmno
         4mTA==
X-Gm-Message-State: AOAM532VmumwQyg/5Q2PQ0xAB+G0ld7onM58gHm4UXC2EfEDDdQe18/Z
        rFuyOKmgRP1mv9IyvuXTxU/AcJHksmU=
X-Google-Smtp-Source: ABdhPJxnUOBP1Q9DHswy/8rstMvt5mslHyPTlKUltytvQYQESDtWBWxu5u5AdFqX6PVrFa6rxs1FtA==
X-Received: by 2002:aca:3906:: with SMTP id g6mr11798712oia.169.1614608514850;
        Mon, 01 Mar 2021 06:21:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t13sm3848609otp.42.2021.03.01.06.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 06:21:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 0/2] add ripple counter dt binding and driver
To:     Arnd Bergmann <arnd@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <CAK8P3a2=nZ3bbeguXjbFrhz0nWeUOcLM7mRudhPDrcb+jZ4VvQ@mail.gmail.com>
 <e5fd7ce3-3ba6-e5de-1cbc-fa31bd46942c@rasmusvillemoes.dk>
 <2208f466-e509-6bbe-0358-34effb965610@roeck-us.net>
 <285d739a-b343-c411-5461-0fe1f44177a5@rasmusvillemoes.dk>
 <CAK8P3a0tTQKZ6=55yCQx=60iBt1L6RZzzSvSJMmfKYUkgiWjrQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <f9f480b1-7b71-ee6d-a018-507b327d8d84@roeck-us.net>
Date:   Mon, 1 Mar 2021 06:21:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0tTQKZ6=55yCQx=60iBt1L6RZzzSvSJMmfKYUkgiWjrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/1/21 1:44 AM, Arnd Bergmann wrote:
> On Mon, Mar 1, 2021 at 9:34 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>> On 26/02/2021 20.53, Guenter Roeck wrote:
>>>
>>> Sorry, I am missing something. If the watchdog is controlled by the clock,
>>> it is a consumer of that clock.
>>
>> But that's just it, the watchdog chip is _not_ a consumer of the clock -
>> I don't think I've ever seen a gpio_wdt that is not internally clocked,
>> but even if they exist, that's not the case for this board.
>>
>>  What else does "consumer" mean ? And why
>>> not just add optional clock support to the gpio_wdt driver ?
>>
>> Because, the consumer is a piece of electronics sitting _between_ the
>> watchdog chip's reset output and the SOCs reset pin, namely the ripple
>> counter that implements a 64 ms delay from the watchdog fires till the
>> actual reset. (The watchdog's reset is also routed directly to an
>> interrupt; so software gets a 64 ms warning that a hard reset is imminent).
> 
> I think it's  a question of how you look at what the gpio_wdt device is.
> While physical gpio chip is not a consumer of the clock, I agree with
> Guenter that the conceptual device is: The functionality of the watchdog
> in this case is provided by the combination of the external chip with the
> ripple counter. I think it is therefore appropriate to have the gpio_wdt
> and the driver refer to the clock as part of the watchdog.
> 

I agree. All electronics needed for the watchdog to operate is part of the
watchdog, and for me that includes the circuitry that connects it to the
reset pin. The clock is needed for proper watchdog operation, so I would
consider the watchdog to be a consumer.

Guenter
