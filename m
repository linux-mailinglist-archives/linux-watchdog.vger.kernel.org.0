Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73041A7145
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Apr 2020 04:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404281AbgDNCzv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Apr 2020 22:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404275AbgDNCzr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Apr 2020 22:55:47 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1666C0A3BDC;
        Mon, 13 Apr 2020 19:55:45 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k18so4136282pll.6;
        Mon, 13 Apr 2020 19:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oChXZjMNJ+0QgLgr8xCyIX/bVzIoUPynDN3f81EEKO4=;
        b=i2tC+Ya2EYxYy7l5JhnUIw4jE+PL/B2sizq3BmO7KjznNtuAc4ObN/j0SrcLuVvZlK
         W5MC1tBF0x6kC7Tj079lae438mkyqoSatahZdHRKeHmTisdUNXL0nb8XCAK/1hZtpGGg
         kzK3jQgxC6kY9BmmvA3kxpLXiOywLNloM6ZaS6kJumhIRzF8hHeYQ+tclIwg4WTsl6eM
         q7jP+YgSuvRWZ1NQelcXs1z9sDvqPaOXvbb7QkfheipRXhRPHqIY4PRQfMNM/9WDWvL5
         lH6bZAb0Z/pLSTO8KoJFYEleP7Mj5Nd0aTFk8fPZmrXoOAr4GuFeRkXwHI/XQ/hhKr9J
         iSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oChXZjMNJ+0QgLgr8xCyIX/bVzIoUPynDN3f81EEKO4=;
        b=Wdlp70NN4QfZEoSooZLPocALg5VOJtdNn5aUm22ptX8hXceDw2tFVTDsE5AZXIE2GA
         PYZTXyQWHH0ezLJidcHqwCD6RLz3wBzpwFa7/NmUDkFhQFxstYoQlAhCVGfPnGqLqmqr
         If0i9Pa/fXWb56TFur6g6ysCCKbD1eHmgEeyDLc269miu+Pdk4Vzk9gEUoIVvx/LrcwH
         qvbgk4Mz92Ny7LjW3CL+JhtsJARH2yPCfa6sNp7zv4nFaQpO8fU4du/RjydLVblPsdTE
         OTDv/B9zgvIVZWzyit+XlROa2P8PCnRcI6/ayugnO+Ttpvs5B6YzDe8t7mhetFnZQjl3
         5cDg==
X-Gm-Message-State: AGi0PuYuJ0X2KX2LnJJBne5mq15E3w5q51zvZWrmFFzhvq5OZQYdE42O
        30GfHJ8l2Z2ojEyuoM+EGS3M0EM6
X-Google-Smtp-Source: APiQypJXZOg6GtPodvvmX5OQ7pmPQ7rox3evgXwYjLUzBO4Kyo29L4zTTOwDS8Yj36ucWTfKx+5QPw==
X-Received: by 2002:a17:90a:46cf:: with SMTP id x15mr25042461pjg.77.1586832945030;
        Mon, 13 Apr 2020 19:55:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l1sm9123650pga.69.2020.04.13.19.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 19:55:43 -0700 (PDT)
Subject: Re: [PATCH 5/7] watchdog: dw_wdt: Support devices with asynch clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132831.89B658030706@mail.baikalelectronics.ru>
 <20200315142207.GA8424@roeck-us.net>
 <20200410185934.o4aucef2xhbradlp@ubsrv2.baikal.int>
 <158681117129.84447.14839907555361565766@swboyd.mtv.corp.google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <b7671f21-8f10-710b-88bc-bc7ead684c12@roeck-us.net>
Date:   Mon, 13 Apr 2020 19:55:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158681117129.84447.14839907555361565766@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/13/20 1:52 PM, Stephen Boyd wrote:
> Quoting Sergey Semin (2020-04-10 11:59:34)
>> Michael, Stephen, could you take a look at the issue we've got here?
>>
>> Guenter, my comment is below.
>>
>> On Sun, Mar 15, 2020 at 07:22:07AM -0700, Guenter Roeck wrote:
>>> On Fri, Mar 06, 2020 at 04:27:45PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
>>>> @@ -358,10 +375,27 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>>>>             goto out_disable_clk;
>>>>     }
>>>>  
>>>> +   /*
>>>> +    * Request APB clocks if device is configured with async clocks mode.
>>>> +    * In this case both tclk and pclk clocks are supposed to be specified.
>>>> +    * Alas we can't know for sure whether async mode was really activated,
>>>> +    * so the pclk reference is left optional. If it it's failed to be
>>>> +    * found we consider the device configured in synchronous clocks mode.
>>>> +    */
>>>> +   dw_wdt->pclk = devm_clk_get_optional(dev, "pclk");
>>>> +   if (IS_ERR(dw_wdt->pclk)) {
>>>> +           ret = PTR_ERR(dw_wdt->pclk);
>>>> +           goto out_disable_clk;
>>>> +   }
>>>> +
>>>> +   ret = clk_prepare_enable(dw_wdt->pclk);
>>>
>>> Not every implementation of clk_enable() checks for a NULL parameter.
>>> Some return an error. This can not be trusted to work on all platforms /
>>> architectures.
>>
>> Hm, this was unexpected twist. I've submitted not a single patch with optional
>> clock API usage. It was first time I've got a comment like this, that the
>> API isn't cross-platform. As I see it this isn't the patch problem, but the
>> platforms/common clock bug. The platforms code must have been submitted before
>> the optional clock API was introduced or the API hasn't been properly
>> implemented or we don't understand something.
>>
>> Stephen, Michael could you clarify the situation with the
>> cross-platformness of the optional clock API.
>>
> 
> NULL is a valid clk to return from clk_get(). And the documentation of
> clk_enable() says that "If the clock can not be enabled/disabled, this
> should return success". Given that a NULL pointer can't do much of
> anything I think any platform that returns an error in this situation is
> deviating from the documentation of the clk API.
> 

This is not about returning an error; some platforms don't check for NULL.

> Does any platform that uses this driver use one of these non-common clk
> framework implementations? All of this may not matter if they all use
> the CCF.
> 

Currently the driver is only used on arm and arm64. Maybe those are safe ?

Also, it looks like clk_enable() exists in the non-standard implementations,
but clk_prepare (and thus clk_prepare_enable) only exist in the standard
implementation. With that, maybe it is always safe to call
clk_prepare_enable() with a NULL parameter ?

Thanks,
Guenter
