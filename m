Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B8737F116
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 04:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhEMCCt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 22:02:49 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2718 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhEMCCs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 22:02:48 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FgZZn1jbDz1BHsb;
        Thu, 13 May 2021 09:58:57 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 10:01:36 +0800
Subject: Re: [PATCH -next] watchdog: Fix possible use-after-free by calling
 del_timer_sync()
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <wim@linux-watchdog.org>, <vz@mleia.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <1620802676-19701-1-git-send-email-zou_wei@huawei.com>
 <20210512140636.GK1333995@roeck-us.net>
From:   Samuel Zou <zou_wei@huawei.com>
Message-ID: <a7e5baa5-519f-cc55-42aa-affa6c72c530@huawei.com>
Date:   Thu, 13 May 2021 10:01:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210512140636.GK1333995@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.208]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

Thanks for your review. If there are similar issues in the future, I 
will collect them together and submit as one patch.

On 2021/5/12 22:06, Guenter Roeck wrote:
> On Wed, May 12, 2021 at 02:57:56PM +0800, Zou Wei wrote:
>> This driver's remove path calls del_timer(). However, that function
>> does not wait until the timer handler finishes. This means that the
>> timer handler may still be running after the driver's remove function
>> has finished, which would result in a use-after-free.
>>
>> Fix by calling del_timer_sync(), which makes sure the timer handler
>> has finished, and unable to re-schedule itself.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> 
> If you have more of those, _please_ submit them together to save review time.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter
> >> ---
>>   drivers/watchdog/lpc18xx_wdt.c | 2 +-
>>   drivers/watchdog/w83877f_wdt.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
>> index 78cf11c..60b6d74 100644
>> --- a/drivers/watchdog/lpc18xx_wdt.c
>> +++ b/drivers/watchdog/lpc18xx_wdt.c
>> @@ -292,7 +292,7 @@ static int lpc18xx_wdt_remove(struct platform_device *pdev)
>>   	struct lpc18xx_wdt_dev *lpc18xx_wdt = platform_get_drvdata(pdev);
>>   
>>   	dev_warn(&pdev->dev, "I quit now, hardware will probably reboot!\n");
>> -	del_timer(&lpc18xx_wdt->timer);
>> +	del_timer_sync(&lpc18xx_wdt->timer);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/watchdog/w83877f_wdt.c b/drivers/watchdog/w83877f_wdt.c
>> index 5772cc5..f265086 100644
>> --- a/drivers/watchdog/w83877f_wdt.c
>> +++ b/drivers/watchdog/w83877f_wdt.c
>> @@ -166,7 +166,7 @@ static void wdt_startup(void)
>>   static void wdt_turnoff(void)
>>   {
>>   	/* Stop the timer */
>> -	del_timer(&timer);
>> +	del_timer_sync(&timer);
>>   
>>   	wdt_change(WDT_DISABLE);
>>   
>> -- 
>> 2.6.2
>>
> .
> 
