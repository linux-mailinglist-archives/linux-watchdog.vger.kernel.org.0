Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFDB3A3CE5
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 09:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhFKHWB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 03:22:01 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:14459 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhFKHV7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 03:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1623396001; x=1654932001;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=VuntOYFblOsaIoBZ6uyizEORNG4jLITdRN8r3KDkKcE=;
  b=fjOEgr4g5qSThJjLlvIbvatjppVpS2L8kX3+3hX4XDqPx65sdm/vsAk/
   6On9xdKlKcBQgbdIl8K5M5ubN2SyFBIL4PphW0AEgxBiZjRus9txrH0iT
   s2Bsx38xgqt0/Hn8jCKGDmyxgWEmAaAdk7L9dfS7V9Ta3blmRC0DDUx1z
   2mplqFGWk7pZNgMGQ/poOCaHlSbOvcTH1lK2ftztZ+7uUyaxZoyhdC3tP
   z843ERj2ExEc2ySjOtrqYOZABWRX37AAQVBECt91E4ez3UIa+HdufGWC/
   yDkjNn6q0CM2/+FNpXgJ/hVrvP0JWPjTifmY04HpKGTu9cE3OrkqfESxF
   g==;
IronPort-SDR: 3FiYsELW/6Y09rWaYTAgDf5nnRYApAgrQQTrpB2VW9U2PZ+niEY9r9707jHE6K2i9/dm4bZj6H
 ottneviqllwPujrTucI2tvqgFKD6M/oFo56i+vWGKP3/WGjH/nXZesnnQgM/B8xTNLTpS0xyoJ
 6J+qfMVOAcCooIrlL+7xYz2+7PXceXVRup9HAF9BJ+fopvyXTU/diPmf7R2t3xh0UKuff9ahHy
 h+P+zPEIlgsIxX1+w+e/TWBmlUXqb/PAx9+aHisB9rzauiFi5392PxYINb6tFFvhfCjq3klquL
 kNY=
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="58589737"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jun 2021 00:19:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 00:19:59 -0700
Received: from [10.12.73.132] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 11 Jun 2021 00:19:57 -0700
Subject: Re: [PATCH 2/3] watchdog: sama5d4_wdt: add support for sama7g5-wdt
To:     <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
CC:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
 <20210527100120.266796-2-eugen.hristev@microchip.com>
 <20210527165506.GA1294623@roeck-us.net>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <94d409ba-2073-a84e-5c8e-580f6e12191c@microchip.com>
Date:   Fri, 11 Jun 2021 09:19:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527165506.GA1294623@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 27/05/2021 at 18:55, Guenter Roeck wrote:
> On Thu, May 27, 2021 at 01:01:19PM +0300, Eugen Hristev wrote:
>> Add support for compatible sama7g5-wdt.
>> The sama7g5 wdt is the same hardware block as on sam9x60.
>> Adapt the driver to use the sam9x60/sama7g5 variant if either
>> of the two compatibles are selected (sam9x60-wdt/sama7g5-wdt).
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter, Wim,

How do we proceed? Do I take this "driver" patch through my tree which 
goes to arm-soc or do you take it with the watchdog tree?

I'm planning to send my pull-requests before the end of this week.

Best regards,
   Nicolas

>> ---
>>   drivers/watchdog/sama5d4_wdt.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
>> index e5d11d6a2600..ec20ad4e534f 100644
>> --- a/drivers/watchdog/sama5d4_wdt.c
>> +++ b/drivers/watchdog/sama5d4_wdt.c
>> @@ -268,8 +268,10 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>>        wdd->min_timeout = MIN_WDT_TIMEOUT;
>>        wdd->max_timeout = MAX_WDT_TIMEOUT;
>>        wdt->last_ping = jiffies;
>> -     wdt->sam9x60_support = of_device_is_compatible(dev->of_node,
>> -                                                    "microchip,sam9x60-wdt");
>> +
>> +     if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
>> +         of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
>> +             wdt->sam9x60_support = true;
>>
>>        watchdog_set_drvdata(wdd, wdt);
>>
>> @@ -329,6 +331,10 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
>>        {
>>                .compatible = "microchip,sam9x60-wdt",
>>        },
>> +     {
>> +             .compatible = "microchip,sama7g5-wdt",
>> +     },
>> +
>>        { }
>>   };
>>   MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
>> --
>> 2.25.1
>>


-- 
Nicolas Ferre
