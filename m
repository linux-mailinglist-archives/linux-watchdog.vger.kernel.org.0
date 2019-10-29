Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E873FE8ECC
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2019 18:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfJ2R6a (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 13:58:30 -0400
Received: from mailfilter04-out31.webhostingserver.nl ([141.138.168.145]:58265
        "EHLO mailfilter04-out31.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726635AbfJ2R6a (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 13:58:30 -0400
X-Greylist: delayed 964 seconds by postgrey-1.27 at vger.kernel.org; Tue, 29 Oct 2019 13:58:28 EDT
X-Halon-ID: 75933a1d-fa73-11e9-9119-001a4a4cb95f
Received: from s198.webhostingserver.nl (unknown [195.211.72.171])
        by mailfilter04.webhostingserver.nl (Halon) with ESMTPSA
        id 75933a1d-fa73-11e9-9119-001a4a4cb95f;
        Tue, 29 Oct 2019 18:42:21 +0100 (CET)
Received: from cust-178-250-146-69.breedbanddelft.nl ([178.250.146.69] helo=[10.8.0.6])
        by s198.webhostingserver.nl with esmtpa (Exim 4.92.3)
        (envelope-from <fntoth@gmail.com>)
        id 1iPVVd-00BRay-3I; Tue, 29 Oct 2019 18:42:21 +0100
Subject: Re: [PATCH v1] watchdog: intel-mid_wdt: Add WATCHDOG_NOWAYOUT support
To:     Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Razvan Becheriu <razvan.becheriu@qualitance.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20190924143116.69823-1-andriy.shevchenko@linux.intel.com>
 <643ee5fc-a682-38bc-b92c-aee47913152e@roeck-us.net>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <980eb3ec-ab3e-5aa6-e4ae-4cbecf29f778@gmail.com>
Date:   Tue, 29 Oct 2019 18:42:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <643ee5fc-a682-38bc-b92c-aee47913152e@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SendingUser: hidden
X-SendingServer: hidden
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
X-Authenticated-Id: hidden
X-SendingUser: hidden
X-SendingServer: hidden
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Op 30-09-2019 om 15:15 schreef Guenter Roeck:
> On 9/24/19 7:31 AM, Andy Shevchenko wrote:
>> Normally, the watchdog is disabled when /dev/watchdog is closed, but if
>> CONFIG_WATCHDOG_NOWAYOUT is defined, then it means that the watchdog 
>> should
>> remain enabled. So we should keep it enabled if CONFIG_WATCHDOG_NOWAYOUT
>> is defined.
>>
>> Reported-by: Razvan Becheriu <razvan.becheriu@qualitance.com>
>> Cc: Ferry Toth <fntoth@gmail.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Any chance of this going in v5.4?

>> ---
>>   drivers/watchdog/intel-mid_wdt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/watchdog/intel-mid_wdt.c 
>> b/drivers/watchdog/intel-mid_wdt.c
>> index 2cdbd37c700c..470213abfd3d 100644
>> --- a/drivers/watchdog/intel-mid_wdt.c
>> +++ b/drivers/watchdog/intel-mid_wdt.c
>> @@ -134,6 +134,7 @@ static int mid_wdt_probe(struct platform_device 
>> *pdev)
>>       wdt_dev->timeout = MID_WDT_DEFAULT_TIMEOUT;
>>       wdt_dev->parent = dev;
>> +    watchdog_set_nowayout(wdt_dev, WATCHDOG_NOWAYOUT);
>>       watchdog_set_drvdata(wdt_dev, dev);
>>       ret = devm_request_irq(dev, pdata->irq, mid_wdt_irq,
>>
> 

