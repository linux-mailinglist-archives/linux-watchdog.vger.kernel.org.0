Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0523A41E9
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 14:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhFKM0T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 08:26:19 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:57378 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhFKM0T (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 08:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1623414261; x=1654950261;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=MRM4l51Ino6yP6mGjYKe+DtOK499+ebU0rnznE4746E=;
  b=2CfNiHNqn2i+huP0qua6ESrV1l9Cih8V0ZLA3V0NcWBajublBxoldvlq
   MiI7sHUbCNhG0Z19OcZwfVGlrxEOfCLwmwqM3bKOboLqhp4HxuaH/K6mB
   2/kdWXgym/vmJlyX6Xoy3ZxAWj2g2ru+giK3Sy4t1015R/aY0QD3goYfy
   GLShXZfUGuSwCxQV1PHEIkMXwTCAh607rCrCnlzeom1EoCc5bEaHnI+iU
   p6Ltmi6MPFQ55ejc+Q/fqEcR0cNQn4dhHMxiXZmdCnfiVxlGybu/aqTUF
   sIUuugY4qeewncJO2BwSGJn90FiMYGlK7zBns7xLbKGR6U4a4WTT17sxt
   A==;
IronPort-SDR: 0YJsOBMkt0x4l/+bvRXgLcLi6g6vK6yX/5ani4b23gsOEQjegd/SQt7qUqzbTMsB5X2+0NWK9/
 4B8d+V4PH8+chp1Mk91cEC+21WC9roduUmDF0DK0F9cXZusqhK5E6I+9PJ/+/mn5pP/t0fA7Zm
 4bIoPOlt1zQKGnDe4ICYXnAnHquc3OE2vNRITgNAAcleutNBuDkfXeEH1xnWoAoCppjsmxfhHL
 CKxSmxglc33MTmMz/Q5Y3BfsDs1AQs74dEfJBjKkY89arJhrwZF1hFcXhnU10TGwnKfUVVNLEx
 LKw=
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="131628648"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jun 2021 05:24:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 05:24:21 -0700
Received: from [10.12.73.132] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 11 Jun 2021 05:24:19 -0700
Subject: Re: [PATCH 2/3] watchdog: sama5d4_wdt: add support for sama7g5-wdt
To:     Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <wim@linux-watchdog.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
 <20210527100120.266796-2-eugen.hristev@microchip.com>
 <20210527165506.GA1294623@roeck-us.net>
 <94d409ba-2073-a84e-5c8e-580f6e12191c@microchip.com>
 <20210611103541.GA3189041@roeck-us.net>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <07e576a9-e068-e1ec-124a-e993d7cf9a30@microchip.com>
Date:   Fri, 11 Jun 2021 14:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611103541.GA3189041@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/06/2021 at 12:35, Guenter Roeck wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Jun 11, 2021 at 09:19:56AM +0200, Nicolas Ferre wrote:
>> On 27/05/2021 at 18:55, Guenter Roeck wrote:
>>> On Thu, May 27, 2021 at 01:01:19PM +0300, Eugen Hristev wrote:
>>>> Add support for compatible sama7g5-wdt.
>>>> The sama7g5 wdt is the same hardware block as on sam9x60.
>>>> Adapt the driver to use the sam9x60/sama7g5 variant if either
>>>> of the two compatibles are selected (sam9x60-wdt/sama7g5-wdt).
>>>>
>>>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Guenter, Wim,
>>
>> How do we proceed? Do I take this "driver" patch through my tree which goes
>> to arm-soc or do you take it with the watchdog tree?

Forget what I said above...

> I applied the series to my watchdog-next branch. That is all I can do
> from my side.

Guenter,

Sorry but I was confused and Eugen helped me realize that there was only 
watchdog related contents and associated DT binding documentation in the 
series. So all should go through Wim and your tree.

>> I'm planning to send my pull-requests before the end of this week.

Without "watchdog" material in it... so basically you don't care ;-)

Best regards,
   Nicolas

>>>> ---
>>>>    drivers/watchdog/sama5d4_wdt.c | 10 ++++++++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
>>>> index e5d11d6a2600..ec20ad4e534f 100644
>>>> --- a/drivers/watchdog/sama5d4_wdt.c
>>>> +++ b/drivers/watchdog/sama5d4_wdt.c
>>>> @@ -268,8 +268,10 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>>>>         wdd->min_timeout = MIN_WDT_TIMEOUT;
>>>>         wdd->max_timeout = MAX_WDT_TIMEOUT;
>>>>         wdt->last_ping = jiffies;
>>>> -     wdt->sam9x60_support = of_device_is_compatible(dev->of_node,
>>>> -                                                    "microchip,sam9x60-wdt");
>>>> +
>>>> +     if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
>>>> +         of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
>>>> +             wdt->sam9x60_support = true;
>>>>
>>>>         watchdog_set_drvdata(wdd, wdt);
>>>>
>>>> @@ -329,6 +331,10 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
>>>>         {
>>>>                 .compatible = "microchip,sam9x60-wdt",
>>>>         },
>>>> +     {
>>>> +             .compatible = "microchip,sama7g5-wdt",
>>>> +     },
>>>> +
>>>>         { }
>>>>    };
>>>>    MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
>>>> --
>>>> 2.25.1
>>>>
>>
>>
>> --
>> Nicolas Ferre


-- 
Nicolas Ferre
