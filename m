Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0E2377E1B
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 10:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhEJI1Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 04:27:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2671 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhEJI1N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 04:27:13 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FdvFb5GJwz1BKl2;
        Mon, 10 May 2021 16:23:15 +0800 (CST)
Received: from [10.67.77.175] (10.67.77.175) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Mon, 10 May 2021
 16:25:48 +0800
Subject: Re: [PATCH] watchdog: sbsa: Support architecture version 1
To:     Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Al Stone <al.stone@linaro.org>,
        Jianchao Hu <hujianchao@hisilicon.com>,
        Huiqiang Wang <wanghuiqiang@huawei.com>
References: <1620618117-20135-1-git-send-email-zhangshaokun@hisilicon.com>
 <87833e5a-978a-aac5-fc4b-1a922864066b@roeck-us.net>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <bf9e1b65-119b-d027-fc3d-8491cbc38cde@hisilicon.com>
Date:   Mon, 10 May 2021 16:25:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87833e5a-978a-aac5-fc4b-1a922864066b@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.77.175]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On 2021/5/10 12:25, Guenter Roeck wrote:
> On 5/9/21 8:41 PM, Shaokun Zhang wrote:
>> Arm Base System Architecture 1.0[1] has introduced watchdog
>> revision 1 that increases the length the watchdog offset
> 
> Is that how they call the watchdog count register ?
> 

I think yes.

> Also, doesn't that mean that the maximum timeout supported
> by the hardware is now larger ?

No, maximum timeout is the same. But the clock can be higher than
before. For Armv8.6, The frequency of CNTFRQ_EL0 is standardized to
a frequency of 1GHz which will set gwdt->clk. If the timeout is
greater than 4(second), the 32-bit counter(WOR) is not enough.

> 
>> regiter to 48 bit, while other operation of the watchdog remains
> 
> register

Ok, will fix it.

> 
>> the same.
>> Let's support the feature infered it from the architecture version
> 
> I can't parse this sentence.
> 

Apologies for sentence, I mean that we can read or write the WOR using
readl/writel or readq/writeq depending on the architecture version. If
architecture version is 0, readl/writel are used. Otherwise, we use
readq/writeq.

>> of watchdog in W_IID register. If the version is 0x1, the watchdog
> 
> W_IIDR ?
> 

Yes

>> offset register will be 48 bit, otherwise it will be 32 bit.
> 
> 48 or 64 ? The code says 64.
> 

The whole WOR is 64-bits: WOR_L and WOR_H. WOR_L[31:0] contains the
lower 32 bits;
WOR_H[63:32] comprises two parts, Bits[15:0] of WOR_H contains the
upper 16 bits; Bits[31:16] of WOR_H is reserved that Read all zero
and write has no effect. So the real use is 48-bit.

>>
>> [1] https://developer.arm.com/documentation/den0094/latest
>>
> 
> There is no download link at that location. Someone with access
> to the documentation will have to confirm this.

Can you access this link? If yes, there is a 'Download' label and
you can upload the document and check page 47 of 96.

> 
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Fu Wei <fu.wei@linaro.org>
>> Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
>> Cc: Al Stone <al.stone@linaro.org>
>> Cc: Timur Tabi <timur@codeaurora.org>
>> Cc: Jianchao Hu <hujianchao@hisilicon.com>
>> Cc: Huiqiang Wang <wanghuiqiang@huawei.com>
>> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
>> ---
>>   drivers/watchdog/sbsa_gwdt.c | 46 +++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
>> index f0f1e3b2e463..ca4f7c416f1e 100644
>> --- a/drivers/watchdog/sbsa_gwdt.c
>> +++ b/drivers/watchdog/sbsa_gwdt.c
>> @@ -73,16 +73,21 @@
>>   #define SBSA_GWDT_WCS_WS0    BIT(1)
>>   #define SBSA_GWDT_WCS_WS1    BIT(2)
>>   +#define SBSA_GWDT_VERSION_MASK  0xF
>> +#define SBSA_GWDT_VERSION_SHIFT 16
>> +
>>   /**
>>    * struct sbsa_gwdt - Internal representation of the SBSA GWDT
>>    * @wdd:        kernel watchdog_device structure
>>    * @clk:        store the System Counter clock frequency, in Hz.
>> + * @version:            store the architecture version
>>    * @refresh_base:    Virtual address of the watchdog refresh frame
>>    * @control_base:    Virtual address of the watchdog control frame
>>    */
>>   struct sbsa_gwdt {
>>       struct watchdog_device    wdd;
>>       u32            clk;
>> +    int            version;
>>       void __iomem        *refresh_base;
>>       void __iomem        *control_base;
>>   };
>> @@ -113,6 +118,27 @@ MODULE_PARM_DESC(nowayout,
>>            __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>     /*
>> + * Read and write are 32 or 64 bits depending on watchdog architecture
>> + * version: if version is equal 0, its 32-bits operation; otherwise 64-bits
>> + * operation is chosen.
>> + */
>> +static u64 sbsa_gwdt_reg_read(struct sbsa_gwdt *gwdt)
>> +{
>> +    if (gwdt->version == 0)
>> +        return (u64)readl(gwdt->control_base + SBSA_GWDT_WOR);
> 
> Unnecessary typecast.
> 

Ok.

>> +    else
>> +        return readq(gwdt->control_base + SBSA_GWDT_WOR);
>> +}
>> +
>> +static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
> 
> What is the point of making val an u64 variable ? Without changing

Oops, unsigned int is enough.

> the maximum timeout it will never be larger than 0xffffffff.
> 

No, the reason that I have explained that the clock can be 1GHz now.

Thanks,
Shaokun

>> +{
>> +    if (gwdt->version == 0)
>> +        writel((u32)val, gwdt->control_base + SBSA_GWDT_WOR);
>> +    else
>> +        writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
>> +}
>> +
>> +/*
>>    * watchdog operation functions
>>    */
>>   static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
>> @@ -123,16 +149,14 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
>>       wdd->timeout = timeout;
>>         if (action)
>> -        writel(gwdt->clk * timeout,
>> -               gwdt->control_base + SBSA_GWDT_WOR);
>> +        sbsa_gwdt_reg_write(gwdt->clk * timeout, gwdt);
>>       else
>>           /*
>>            * In the single stage mode, The first signal (WS0) is ignored,
>>            * the timeout is (WOR * 2), so the WOR should be configured
>>            * to half value of timeout.
>>            */
>> -        writel(gwdt->clk / 2 * timeout,
>> -               gwdt->control_base + SBSA_GWDT_WOR);
>> +        sbsa_gwdt_reg_write(gwdt->clk / 2 * timeout, gwdt);
>>         return 0;
>>   }
>> @@ -149,7 +173,7 @@ static unsigned int sbsa_gwdt_get_timeleft(struct watchdog_device *wdd)
>>        */
>>       if (!action &&
>>           !(readl(gwdt->control_base + SBSA_GWDT_WCS) & SBSA_GWDT_WCS_WS0))
>> -        timeleft += readl(gwdt->control_base + SBSA_GWDT_WOR);
>> +        timeleft += sbsa_gwdt_reg_read(gwdt);
>>         timeleft += lo_hi_readq(gwdt->control_base + SBSA_GWDT_WCV) -
>>               arch_timer_read_counter();
>> @@ -172,6 +196,17 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
>>       return 0;
>>   }
>>   +static void sbsa_gwdt_get_version(struct watchdog_device *wdd)
>> +{
>> +    struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
>> +    int ver;
>> +
>> +    ver = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
>> +    ver = (ver >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
>> +
>> +    gwdt->version = ver;
>> +}
>> +
>>   static int sbsa_gwdt_start(struct watchdog_device *wdd)
>>   {
>>       struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
>> @@ -300,6 +335,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>>        * it's also a ping, if watchdog is enabled.
>>        */
>>       sbsa_gwdt_set_timeout(wdd, wdd->timeout);
>> +    sbsa_gwdt_get_version(wdd);
>>         watchdog_stop_on_reboot(wdd);
>>       ret = devm_watchdog_register_device(dev, wdd);
>>
> 
> .
