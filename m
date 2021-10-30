Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A130E4409DF
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Oct 2021 17:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhJ3PRX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 30 Oct 2021 11:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhJ3PRV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 30 Oct 2021 11:17:21 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76296C061570;
        Sat, 30 Oct 2021 08:14:51 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so18186973otg.0;
        Sat, 30 Oct 2021 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X6RCTCYwm3/SXNaShlhmKrezJJSOLuibckOFv7EdMtA=;
        b=GBQfmLB9rK8QO11H3/iiL5c3NXlce6ytKdtnTYRjAGMeEILcBUw8SHYm325uGz3yfM
         Q8biLvfEPreqXrinW8G5Ke/ZGqdXT7WUXa0SvU6JW7I0lHhn6KLFjwGcUITjhEbgcifs
         rppzEttoU/5sVvVCdvLxCzOJOHxfH6gK7l6Ptu2zy6YseUPAGBOTly/i/nRofn7Ld6bm
         w1Zqr/2NOXvz8ZFG0wm7Ui1+GHWz2D9zsvXj01cb/hyl55KWfTnyYFMH3cxJgnlPwIj0
         5yWV6fdOrRZnPJsCFhGguqLOKY4EJs3LnmGf7bKC9TbSaA0/j3m7ozi+gfe3WhsQPBhH
         52/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X6RCTCYwm3/SXNaShlhmKrezJJSOLuibckOFv7EdMtA=;
        b=lcuQiw+HILgv3YMuXvkmwM58Wwx+wJuyTVAORImj6HsR+DcyjVAL9c8m1xVUcQyqRd
         bN8FQXxFQGKW8nGs02zC5+Edhw6NpjGsAZ+ulzW5wbsoE7HCPa0dXUt13ujJoP1j2c/R
         XU9FUaXXq4EGgSnDY79sxqeP0AUXZhPMBCMhsztjpKkLyGpmM21r0xwJu6PdIQFCXKwe
         eLkwwJV5NB1PYOCO9vBVyz1R563/U/YwQVvfpprrXZGDAIIh2mh7msZfq23kbxNSsBl4
         x9xBY1L84w/jpE/hDgq6VB5pb6U22TazxpNvk+iseIzp0OX3/12JuYR2tUTbj+1vgPE3
         Quqw==
X-Gm-Message-State: AOAM531KJL7dIco8Qis9XHz0cA6GrS1gr+uq0rXI3dAixUP8lPZ2shsB
        6f43LfP/yP2ilWHXQ7LCgAeaeCAoL5Q=
X-Google-Smtp-Source: ABdhPJziGSHtvRnQ2S6aCq4nTdDzXH4tcMmFr143ujhayW55vTUS4MDiK2VJPaqNmW3abpoa3dvuZg==
X-Received: by 2002:a05:6830:237a:: with SMTP id r26mr13897513oth.310.1635606890150;
        Sat, 30 Oct 2021 08:14:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j3sm1806576oig.15.2021.10.30.08.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Oct 2021 08:14:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 7/7] watchdog: s3c2410: Let kernel kick watchdog
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-8-semen.protsenko@linaro.org>
 <1ad6b625-4388-bc78-e258-eae0b9357b96@roeck-us.net>
 <CAPLW+4kphtac24fcpVUENAMUAdHp2fkzJ0N_r_63Soq6R2VZBg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7c9a8dd4-7607-55a2-3d65-a445fa246667@roeck-us.net>
Date:   Sat, 30 Oct 2021 08:14:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4kphtac24fcpVUENAMUAdHp2fkzJ0N_r_63Soq6R2VZBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/30/21 7:29 AM, Sam Protsenko wrote:
> On Fri, 29 Oct 2021 at 03:30, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 10/28/21 11:35 AM, Sam Protsenko wrote:
>>> When "tmr_atboot" module param is set, the watchdog is started in
>>> driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
>>> watchdog core driver know it's running. This way wathcdog core can kick
>>> the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
>>> enabled), until user space takes control.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>    drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
>>>    1 file changed, 15 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>> index ca082b1226e3..9af014ff1468 100644
>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>> @@ -732,6 +732,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>>>        wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>>>        wdt->wdt_device.parent = dev;
>>>
>>> +     /*
>>> +      * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
>>> +      * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
>>> +      *
>>> +      * If we're not enabling the watchdog, then ensure it is disabled if it
>>> +      * has been left running from the bootloader or other source.
>>> +      */
>>> +     if (tmr_atboot && started == 0) {
>>> +             dev_info(dev, "starting watchdog timer\n");
>>> +             s3c2410wdt_start(&wdt->wdt_device);
>>> +             set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
>>> +     } else if (!tmr_atboot) {
>>> +             s3c2410wdt_stop(&wdt->wdt_device);
>>> +     }
>>> +
>>
>> This doesn't cover the case where the watchdog is already enabled by the BIOS.
>> In that case, WDOG_HW_RUNNING won't be set, and the watchdog will time out
>> if the userspace handler is not loaded fast enough. The code should consistently
>> set WDOG_HW_RUNNING if the watchdog is running.
>>
> 
> As I understand, in the case when bootloader started the watchdog, the
> driver just stops it. You can see it in the code you replied to.
> 
>      } else if (!tmr_atboot) {
>              s3c2410wdt_stop(&wdt->wdt_device);
> 
> In other words, having "tmr_atboot" module param makes it irrelevant
> whether bootloader enabled WDT or no.
> 

Sure, but I am concerned about "if (tmr_atboot && started)", which doesn't
set WDOG_HW_RUNNING with your current code, and I was looking for something
like

	if (tmr_atboot) {
		if (!started) {
			dev_info(dev, "starting watchdog timer\n");
			s3c2410wdt_start(&wdt->wdt_device);
		}
		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
	} else {
		s3c2410wdt_stop(&wdt->wdt_device);
	}

Guenter
