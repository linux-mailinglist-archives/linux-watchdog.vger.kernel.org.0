Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A034F46C1A4
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Dec 2021 18:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhLGRZY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Dec 2021 12:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhLGRZX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Dec 2021 12:25:23 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A968C061574;
        Tue,  7 Dec 2021 09:21:52 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id w5-20020a4a2745000000b002c2649b8d5fso5591389oow.10;
        Tue, 07 Dec 2021 09:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wcvqGk84EZ35PlZnCOG85oW3RjIk0x8a8jSTbQt+xZQ=;
        b=Xs6mZUdK2kV+Cg3jGc26ags7g3oKqXCZLLXLadNeobZG1KsKsl+5Dp9PcDVrb0r8GL
         GLQykT5xwpTvgtHl9p349jTfqsD+L6E1PNizxxylMIJRUaQnPQpWnMbmWm+J4kvU/Mhc
         9eGeNUC5qOzzlSFJ78O+cHTKItP9rY6WmA/arrZ5CDR4ev0SceJMODjUkJFLOdqIl7Vb
         Ah66jBAph9vVX4wTMZTeVvLXSxK1y439tPnddGEkYmRW7RcAymn/T//iOFKHuWLMjj0A
         UXCq2PG9BmgWACpCAvgDSBLNCoAZ8RffC16tM9FDERA7JCSIo50o2EyJHTm4wnxjsX5a
         Vj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wcvqGk84EZ35PlZnCOG85oW3RjIk0x8a8jSTbQt+xZQ=;
        b=BZuRNZ0rB7AfLPC73NUxEBwcDkhiHLi9sWe6YXD504cISQSj+OERMeawDbBrAw3crm
         +YnoB+eDNQcFNWbXjngvXnLhw2lrT8kW8py2vJAaEK9RwvhVQVpxYDGA9OCXh5CDFXKY
         Iom0lfWH7ZBr0Xii0RcN6VgMCA3NRpYlMa8iF/J1zIDYdDb8iLrlL41Ho8CBZBmvoa35
         EunijusfFBDwfhEUhZm523XSxrBW3CGi56PFxUVsoc+M0vijZm7JUWDidiZrDJR6sFUJ
         9d624xD/2nk1dG9wiwYFRsEBjpDUATI4iHyg9Hi0hqMxm0z3RzWQx3/RFoovw+Jpmpg7
         yM9A==
X-Gm-Message-State: AOAM531XpE971r7epNlN0izxAOGZfTDkgSag+w/QuHiL9aFTIpBFtA9r
        RNZfsq8ZtbO1ZAm2p9gB4Q7WLCd8VUk=
X-Google-Smtp-Source: ABdhPJzzrwfZsAZrp0U7K2cvXWTtkpwdoReJvu46U4rGr2IYYloOpfhTlYj1oiiLo3bPjIAg8sME/A==
X-Received: by 2002:a05:6820:1609:: with SMTP id bb9mr27706490oob.37.1638897711606;
        Tue, 07 Dec 2021 09:21:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t14sm30723oth.81.2021.12.07.09.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 09:21:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v5 0/2] Add WDT driver for RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20211130195357.18626-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922D81A09F4B51C771FE6D5866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cea6840b-31a8-d02c-19fc-9964f4d0be5b@roeck-us.net>
Date:   Tue, 7 Dec 2021 09:21:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922D81A09F4B51C771FE6D5866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/7/21 8:07 AM, Biju Das wrote:
> Hi All,
> 
> Gentle ping.
> 
> Are we happy with this patch series? Please let me know.
> 

I think so. You retained my Reviewed-by: tag, so I did not see
a need to reply (again).

Guenter

> Regards,
> Biju
> 
> 
>> Subject: [PATCH v5 0/2] Add WDT driver for RZ/G2L
>>
>> This patch series aims to add WDT driver support for RZ/G2L SoC's.
>>
>> WDT has 3 channels
>> 1) CH0 to check the operation of Cortex-A55-CPU Core0
>> 2) CH1 to check the operation of Cortex-A55-CPU Core1
>> 3) CH2 to check the operation of Cortex-M33 CPU
>>
>> WDT IP supports
>> 1) Normal Watchdog Timer Function
>> 2) Reset Request Function due to CPU Parity Error
>>
>> Once the software activates the watchdog timer, the watchdog timer does
>> not stop until it is reset.
>>
>> Current driver supports Normal Watchdog Timer basic functionality.
>>
>> Tested WDT driver with selftests tool and reboot command
>>
>> All 3 channels tested with below command.
>>
>> cat /dev/watchdog  & for i in {1..60}; do sleep 1; echo $i; devmem2
>> 0x12800808; done cat /dev/watchdog1  & for i in {1..60}; do sleep 1; echo
>> $i; devmem2 0x12800c08; done cat /dev/watchdog2 & for i in {1..60}; do
>> sleep 1; echo $i; devmem2 0x12800408; done
>>
>> v4->v5:
>>   * Started using the macros MICRO and USEC_PER_SEC
>>   * Renamed rzg2l_wdt_get_cycle_msec() to rzg2l_wdt_get_cycle_usec()
>>   * Fixed the value of priv->wdev.max_timeout in seconds.
>> V3->V4:
>>   * Fixed the build issue reported by kernel test robot
>> V2->V3:
>>   * Added Rb tag from Guenter Roeck
>>   * Removed Removed patch#1, as the clock changes related to WDT reset
>> selection
>>     will be handled in TF-A.
>> V1->V2:
>>   * started using clk_get/put instead of devm_clk_get/put
>>   * Moved devm_add_action_or_reset after set_drvdata() and
>>   * removed redundant action on devm_add_action_or_reset() failure.
>> RFC->V1
>>   * Removed patch#3, the clk patch is queued for 5.17
>>   * Added clock-names and interrupt-names as required properties for RZ/G2L
>>   * Re-order clocknames with internal module clock first
>>   * Removed pclk_rate from priv.
>>   * rzg2l_wdt_write() returns void and Removed tiemout related to register
>> update
>>   * rzg2l_wdt_init_timeout() returns void and removed delays.
>>   * removed set_bit(WDOG_HW_RUNNING,..) as we can stop watchdog
>>   * renamed reset_assert_clock_disable->reset_assert_pm_disable_put
>>   * started using devm_reset_control_get_exclusive()
>>   * removed platform_set_drvdata(pdev, priv) as there is no user
>>   * removed watchdog_set_restart_priority(&priv->wdev, 0) as 0 is the
>> default.
>>   * removed remove callback as it is empty.
>>
>> Biju Das (2):
>>    dt-bindings: watchdog: renesas,wdt: Add support for RZ/G2L
>>    watchdog: Add Watchdog Timer driver for RZ/G2L
>>
>>   .../bindings/watchdog/renesas,wdt.yaml        |  75 +++--
>>   drivers/watchdog/Kconfig                      |   8 +
>>   drivers/watchdog/Makefile                     |   1 +
>>   drivers/watchdog/rzg2l_wdt.c                  | 263 ++++++++++++++++++
>>   4 files changed, 329 insertions(+), 18 deletions(-)  create mode 100644
>> drivers/watchdog/rzg2l_wdt.c
>>
>> --
>> 2.17.1
> 

