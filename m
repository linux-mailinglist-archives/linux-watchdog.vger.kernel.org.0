Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B030623F2F9
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Aug 2020 21:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgHGTIt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 15:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgHGTIs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 15:08:48 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DA5C061756;
        Fri,  7 Aug 2020 12:08:48 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id r4so1533160pls.2;
        Fri, 07 Aug 2020 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rnGb9sOppjE3N1Nli9X1x3L4VMPPhFl52eNOc7JQXfM=;
        b=kvmd69ndOASREggmVhOQqM9JjjV9E88s8xw8Y+qdPH7OD4q/Mry5EjZBck2vgapqjf
         A0S6N0tXTd9rBQ1sL1HyD/nPDaNJLn54U3J0ZdEaQ0Zh4OFstXNDzB/spAjOQwMA6Ie9
         BdjGMIBiqULyUqpDiCkCCvpwsUpQXc4wijoePuiqv1c1P0WFM36itIz9v/Ug2t+9QJ8w
         L5fzYGlylZp48l//HL8ryEVDK/O4RWLEH6mOXXXaQ0wWOzJQNLlfu3RVPgK8K/mR5Q7C
         +PLF1v5uNNiPNzUKYyNU4L+lcATLD1U+k2Ip7cpGUQ80wCDW4pP3zcAx0APmI1/uTRh5
         PwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rnGb9sOppjE3N1Nli9X1x3L4VMPPhFl52eNOc7JQXfM=;
        b=dCGLJqQGfeSXjRfbximP7Dineyb6RmeTGHPt7GTgHXdIVIzlkrUU2gSrAkP3reaEIz
         L1DudJIh7Ur+HaDUi7ftMievrHVzjxxL+hkrDHQKexBiCHACiDb5lhTHhA/lbnWKeYNb
         MVnc2rDYWtlb4eGmQ5G7PdAuyOwyaQO/XtpnB7Mm4UO5liSizYPkSnHr3gQFa1BO4++M
         Q1e2Bwe2N6DEhx+ncVlvt9/dnY3lllWsijYrTP/JDi6PGMFCfqfA9hAByXGfXToyq9OO
         thwQuprgKqMUgYHgVpcGlFhwL7zbRKXzgGpwfGE/Jno+Ac/GUcMEucsi8PslQ0u+X8+M
         4u8Q==
X-Gm-Message-State: AOAM531AcH49Zedv0ikvggSOdLqPuxHPPYg6n2uHAJT/TDz2v/MR+W9j
        cMqBOMrINz2aI3wxJc5Edsc=
X-Google-Smtp-Source: ABdhPJzZKuHLjA60DqQPRCt6LmfbZT1/rUOlw18GY9vliaiL5JVG7p4dOy9DPwM/brM7UctMjkqk/w==
X-Received: by 2002:a17:90b:18b:: with SMTP id t11mr14971480pjs.105.1596827327997;
        Fri, 07 Aug 2020 12:08:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x9sm11436307pjt.9.2020.08.07.12.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 12:08:47 -0700 (PDT)
Subject: Re: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
To:     Florian Fainelli <f.fainelli@gmail.com>,
        madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
 <20200807162141.GA41980@roeck-us.net>
 <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bc8c5d7d-91a4-e955-854f-eef88812ac1a@roeck-us.net>
Date:   Fri, 7 Aug 2020 12:08:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/7/20 11:08 AM, Florian Fainelli wrote:
> 
> 
> On 8/7/2020 9:21 AM, Guenter Roeck wrote:
>> On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
>>> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>
>>> In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
>>> after misc_register(), hence if ioctl is called before its
>>> initialization which can call rdc321x_wdt_start() function,
>>> it will see an uninitialized value of rdc321x_wdt_device.queue,
>>> hence initialize it before misc_register().
>>> Also, rdc321x_wdt_device.default_ticks is accessed in reset()
>>> function called from write callback, thus initialize it before
>>> misc_register().
>>>
>>> Found by Linux Driver Verification project (linuxtesting.org).
>>>
>>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Having said that ... this is yet another potentially obsolete driver.
>> You are really wasting your (and, fwiw, my) time.
>>
>> Florian, any thoughts if support for this chip can/should be deprecated
>> or even removed ?
> 
> I am still using my rdc321x-based SoC, so no, this is not obsolete as
> far as I am concerned, time permitting, modernizing the driver is on my
> TODO after checking/fixing the Ethernet driver first.
> 

Do you have a manual ? I'd give it a try if you can test it - conversion
should be simple enough (I have a coccinelle script which partially
automates it), but this chip seems to have a fast timeout, and the
comments in the code ("set the timeout to 81.92 us") seem to be quite
obviously wrong.

Guenter
