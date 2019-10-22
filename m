Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3EDDFD2C
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Oct 2019 07:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfJVFtL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Oct 2019 01:49:11 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:9380 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfJVFtL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Oct 2019 01:49:11 -0400
Received: from [10.28.19.63] (10.28.19.63) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 22 Oct
 2019 13:49:20 +0800
Subject: Re: [PATCH v2 3/4] watchdog: add meson secure watchdog driver
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com>
 <1571387622-35132-4-git-send-email-xingyu.chen@amlogic.com>
 <7397f6db-1dc8-3abd-41ff-2e47323c7ffa@roeck-us.net>
 <bfc892af-1cd3-1437-75b2-5ba2b7913284@amlogic.com>
 <bd5ed275-4ae4-4163-b585-23fbead9833f@roeck-us.net>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <1b841195-cf76-7128-9569-5c2b0d39c1c1@amlogic.com>
Date:   Tue, 22 Oct 2019 13:49:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bd5ed275-4ae4-4163-b585-23fbead9833f@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.28.19.63]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Guenter

On 2019/10/21 21:38, Guenter Roeck wrote:
> On 10/21/19 1:03 AM, Xingyu Chen wrote:
>> Hi, Guenter
>>
>> On 2019/10/21 0:56, Guenter Roeck wrote:
>>> On 10/18/19 1:33 AM, Xingyu Chen wrote:
>>>> The watchdog controller on the Meson-A/C series SoCs is moved to secure
>>>> world, watchdog operation needs to be done in secure EL3 mode via ATF,
>>>> Non-secure world can call SMC instruction to trap to AFT for watchdog
>>>> operation.
>>>>
>>>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>>>> ---
>>>>   drivers/watchdog/Kconfig         |  17 ++++
>>>>   drivers/watchdog/Makefile        |   1 +
>>>>   drivers/watchdog/meson_sec_wdt.c | 187 
>>>> +++++++++++++++++++++++++++++++++++++++
>>>>   3 files changed, 205 insertions(+)
>>>>   create mode 100644 drivers/watchdog/meson_sec_wdt.c
>>>>
>>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>>> index 58e7c10..e84be42 100644
>>>> --- a/drivers/watchdog/Kconfig
>>>> +++ b/drivers/watchdog/Kconfig
>>>> @@ -826,6 +826,23 @@ config MESON_GXBB_WATCHDOG
>>>>         To compile this driver as a module, choose M here: the
>>>>         module will be called meson_gxbb_wdt.
>>>> +config MESON_SEC_WATCHDOG
>>>> +    tristate "Amlogic Meson Secure watchdog support"
>>>> +    depends on MESON_SM
>>>> +    depends on ARCH_MESON || COMPILE_TEST
>>>
>>> This dependency is pointless. MESON_SM already depends on ARCH_MESON,
>>> thus specifying "COMPILE_TEST" here adds no value but only
>>> creates confusion.
>> Thanks for your analysis, perhaps i should remove the line below.
>> - depends on ARCH_MESON || COMPILE_TEST
>>
>> Is it ok to modify code above like this ?
> 
> Yes.
Thanks, fix it in next version.

> [ ... ]
> 
>>>> +static unsigned int meson_sec_wdt_get_timeleft(struct 
>>>> watchdog_device *wdt_dev)
>>>> +{
>>>> +    int ret;
>>>> +    unsigned int timeleft;
>>>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>>>> +
>>>> +    ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, Thanks&timeleft,
>>>> +                MESON_SIP_WDT_GETTIMELEFT, 0, 0, 0, 0);
>>>> +
>>>> +    if (ret)
>>>> +        return ret;
>>>
>>> Meh, that doesn't work. I just realized that the return type is 
>>> unsigned,
>>> so returning a negative error code is pointless. Guess we'll have to
>>> live with returning 0 in this case after all. I wonder if we should
>>> fix the API and return an integer (with negative error code), but that
>>> is a different question.
>> Thanks for your review.
>>
>> IMO, if returning an integer, and the value which copy to user buf 
>> should be formatted with %d instead of %u (see timeleft_show), it will 
>> cause the max value of timeleft is reduced from 4294967295 to 
>> 2147483647. but i'am not sure whether it will bring risk.
> 
> Not that it matters right now, but I don't think that limiting 'timeleft'
> reporting to 2147483647 seconds, or ~68 years, would cause any risk.
> It would just be a large patch changing several drivers all at once,
> that is all.
> 
>>
>> So i also think returning 0 may be better in this case.
> 
> Yes, please do that.
Thanks, fix it in next version.
> 
> Thanks,
> Guenter
> 
> .
> 
