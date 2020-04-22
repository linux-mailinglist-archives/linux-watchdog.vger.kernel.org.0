Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845701B3713
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Apr 2020 08:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgDVGBd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 22 Apr 2020 02:01:33 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:29025 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgDVGBd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 22 Apr 2020 02:01:33 -0400
Received: from [10.28.39.241] (10.28.39.241) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 22 Apr 2020
 14:02:22 +0800
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>,
        Julius Werner <jwerner@chromium.org>
CC:     LKML <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
 <CAKz_xw3-tvYoCDs07xEUBBMf024aezGMoZ35LsTN+_dXT9nC2Q@mail.gmail.com>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <bbd8f97b-8479-c38e-011f-b52e2cf34403@amlogic.com>
Date:   Wed, 22 Apr 2020 14:02:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKz_xw3-tvYoCDs07xEUBBMf024aezGMoZ35LsTN+_dXT9nC2Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.39.241]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,Evan

On 2020/4/22 9:39, Evan Benn wrote:
> On Wed, Apr 22, 2020 at 6:31 AM Julius Werner <jwerner@chromium.org> wrote:
>>
>>> +static int smcwd_call(unsigned long smc_func_id, enum smcwd_call call,
>>> +                     unsigned long arg, struct arm_smccc_res *res)
>>
>> I think you should just take a struct watchdog_device* here and do the
>> drvdata unpacking inside the function.
> 
> That makes sense, I avoided it because smcwd_call's are made during
> 'probe', ~while
> we are 'constructing' the wdd. But this is C, so I think I have
> permission to do this!
> 
>>> +static int smcwd_probe(struct platform_device *pdev)
>>> +{
>>> +       struct watchdog_device *wdd;
>>> +       int err;
>>> +       struct arm_smccc_res res;
>>> +       u32 *smc_func_id;
>>> +
>>> +       smc_func_id =
>>> +               devm_kzalloc(&pdev->dev, sizeof(*smc_func_id), GFP_KERNEL);
>>> +       if (!smc_func_id)
>>> +               return -ENOMEM;
>>
>> nit: Could save the allocation by just casting the value itself to a
>> pointer? Or is that considered too hacky?
> 
> I am not yet used to what hacks are allowed in the kernel.
> Where I learned C that would not be allowed.
> I assumed the kernel allocator has fast paths for tiny sizes though.
> 
>>> +static const struct of_device_id smcwd_dt_ids[] = {
>>> +       { .compatible = "mediatek,mt8173-smc-wdt" },
>>> +       {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, smcwd_dt_ids);
>>
>> So I'm a bit confused about this... I thought the plan was to either
>> use arm,smc-id and then there'll be no reason to put platform-specific
>> quirks into the driver, so we can just use a generic "arm,smc-wdt"
>> compatible string on all platforms; or we put individual compatible
>> strings for each platform and use them to hardcode platform-specific
>> differences (like the SMC ID) in the driver. But now you're kinda
>> doing both by making the driver code platform-independent but still
>> using a platform-specific compatible string, that doesn't seem to fit
>> together. (If the driver can be platform independent, I think it's
>> nicer to have a generic compatible string so that future platforms
>> which support the same interface don't have to land code changes in
>> order to just use the driver.)
> 
> Yes I think you are correct. I got some reviews about the compatible name,
> but I think I misinterpreted those, and arm,smc-wdt would work. I did wonder
> if Xingyu from amlogic needed to modify the driver more, EG with different
> SMCWD_enum values for the amlogic chip, he could then just add an
> amlogic compatible
> and keep our devices running with the other compatible. Although of
> course it would be nicer if
> the amlogic firmware could copy the values here.
Using DTS property(arm,smc-id) or vendor's compatible to specify the 
Function ID is available for the meson-A1.The generic "arm, smc-wdt" 
looks nicer for MTK and Amlogic sec wdt, but the driver may not cover 
the other vendor's platform-specific differences in the future, so the 
platform-specific compatible string may be introduced eventually.

But again, I can accept the two methods above.

Thanks
> 
> Thanks
> 
> Evan
> 
> .
> 
