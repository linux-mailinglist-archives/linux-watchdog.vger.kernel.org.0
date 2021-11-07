Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BFC4473A2
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 17:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235694AbhKGQMk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 11:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbhKGQMj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 11:12:39 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4D5C061570;
        Sun,  7 Nov 2021 08:09:56 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id s139so6562681oie.13;
        Sun, 07 Nov 2021 08:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KDLjnlktmexqUEt5dNLcp/MCOErrAKYGUs0jenGFmuc=;
        b=T35rBulk22pSjFzukrEFzn14mLpkEaGoHHWgb5gEvWK+cLYIgxOtFFsnO0hMCnQrq3
         9Pks5gw6s2NRaEpl66UPjxNz96U0CpEgEN1AKiKKmZJgGMu702jzCvR+zseFHV9AELym
         KXNlVL5IMPUg0/Ob+KNOAOI6gT059zKTqVJZfPByCxE/lEioCYFvfnAexwkRQamVIwWJ
         hSlnH/MMC6gYyYniK9x4XJbVsMXEDhUwXlRqWX/fKU5tvrivkk1XWDUtSbDV3lvQzPit
         ximE+f3/vSxcIoT5P6fVIhScnMSRT3ZSvRzQIfh4iFXv5KAyOO27SFr2yL9oPyyKf6iI
         XMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KDLjnlktmexqUEt5dNLcp/MCOErrAKYGUs0jenGFmuc=;
        b=AkhJZlCKi43IwVIfcIkZHt/iqH8wCENZhK8Kfyz/QRShr0wenNYcsBarUHunBPH0ce
         MMsVt4SjSvKkhbzDTawxS+SIrQhS0Bqqwgq8+YbaknJVrbtUxs98dREtplG/8yhr6JzF
         kZ4nyxS9lAW5EftRzd1x1Rd9YvmEnV3PSLT9gb5K2b/UC/ghiFBRlem0F2ZMVFubxQ0W
         rTBcwBCPx9gcVIKO6CJ/a0eCXwj6KN5al9CxLsJ8LdXyOVm1ns5S1zdWN6NlOk15p9Zy
         itB0uJ3uG6gc7pxvPoVTbubYclANouSee/+YR8X9RoApPthdH5hxuZkAclW4mGUd1c85
         Am9w==
X-Gm-Message-State: AOAM532pwRDll0dTk5e697pC2kUrDwSJCXHkk2tIxIXEE19Rdq2F6aEh
        B/DOK+5t+5z3uyhvlombFW63V26mEH0=
X-Google-Smtp-Source: ABdhPJwdIqHJKieBU9oR/cj2OVgSnddDJWo+5wLVDmxGpMDoYCI29CKE/5/NFL6BHa6aUMcmQovNxw==
X-Received: by 2002:aca:3903:: with SMTP id g3mr32256325oia.12.1636301395624;
        Sun, 07 Nov 2021 08:09:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o2sm5086208oiv.32.2021.11.07.08.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 08:09:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 10/12] watchdog: s3c2410: Support separate source clock
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-11-semen.protsenko@linaro.org>
 <a63f37a9-ea04-2606-e4f5-1170c4e59db2@canonical.com>
 <CAPLW+4mhD+k03S1cR-AdNk4etPiK=wsCoR4+o39gDe==XdoY8w@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b65c74f3-0735-7b8b-888a-3b14aee55a4f@roeck-us.net>
Date:   Sun, 7 Nov 2021 08:09:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4mhD+k03S1cR-AdNk4etPiK=wsCoR4+o39gDe==XdoY8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/7/21 7:55 AM, Sam Protsenko wrote:
> On Tue, 2 Nov 2021 at 12:15, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 31/10/2021 13:22, Sam Protsenko wrote:
>>> Right now all devices supported in the driver have the single clock: it
>>> acts simultaneously as a bus clock (providing register interface
>>> clocking) and source clock (driving watchdog counter). Some newer Exynos
>>> chips, like Exynos850, have two separate clocks for that. In that case
>>> two clocks will be passed to the driver from the resource provider, e.g.
>>> Device Tree. Provide necessary infrastructure to support that case:
>>>    - use source clock's rate for all timer related calculations
>>>    - use bus clock to gate/ungate the register interface
>>>
>>> All devices that use the single clock are kept intact: if only one clock
>>> is passed from Device Tree, it will be used for both purposes as before.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>> Changes in v2:
>>>    - Reworded commit message to be more formal
>>>    - Used separate "has_src_clk" trait to tell if source clock is present
>>>    - Renamed clock variables to match their purpose
>>>    - Removed caching source clock rate, obtaining it in place each time instead
>>>    - Renamed err labels for more consistency
>>>
>>>   drivers/watchdog/s3c2410_wdt.c | 52 +++++++++++++++++++++++++---------
>>>   1 file changed, 39 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>> index fdb1a1e9bd04..c733917c5470 100644
>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>> @@ -118,7 +118,9 @@ struct s3c2410_wdt_variant {
>>>
>>>   struct s3c2410_wdt {
>>>        struct device           *dev;
>>> -     struct clk              *clock;
>>> +     struct clk              *bus_clk; /* for register interface (PCLK) */
>>> +     struct clk              *src_clk; /* for WDT counter */
>>> +     bool                    has_src_clk;
>>
>> Why do you need the has_src_clk value? If clk_get() fails, just store
>> there NULL and clk API will handle it.
>>
> 
> I've added that 'has_src_clk' field for somewhat different reason.
> 
> 1. As we discussed earlier, in case when src_clk is not present, I do
> 'src_clk = bus_clk' in v2. This way I don't have to check if src_clk
> is NULL every time and use bus_clk to get rate. If I set src_clk =
> NULL, I'll have to add selector code, which wouldn't be so elegant,
> and contradicts what we've discussed.
> 2. On the other hand, I don't want to enable bus_clk twice in case
> when src_clk is not present, that just doesn't feel right (user would
> see incorrect refcount value in DebugFS, etc). And if "clk_src =
> bus_clk', and I haven't enabled it second time, then I shouldn't try
> to disable it second time, right?
> 
> The only way I can see to accomplish (1) and (2) together, is to use
> that 'has_src_clk' flag. For me it still looks better than enabling
> bus_clk twice, or checking if clk_src is NULL every time we need to
> get clock rate. Please let me know if you still have a strong opinion
> on this one.
> 

This is odd. Why do you need to get the clock rate more than once,
instead of getting it once and storing it locally ? If the clock rate
can change, the watchdog timeout would be unpredictable.

Guenter
