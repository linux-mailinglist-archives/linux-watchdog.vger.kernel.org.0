Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B881681CA
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2020 16:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgBUPfo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Feb 2020 10:35:44 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:26487 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgBUPfn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Feb 2020 10:35:43 -0500
Received: from [10.28.90.153] (10.28.90.153) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 21 Feb 2020
 23:36:03 +0800
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To:     Evan Benn <evanbenn@chromium.org>
CC:     Julius Werner <jwerner@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
Date:   Fri, 21 Feb 2020 23:36:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.28.90.153]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Evan

Because the ATF does not define standard wdt index, each vendor defines 
its own index.
So I don't think that the current driver[0] can fully cover my usecases. 
As discussed in your
previous email, the meson wdt driver [1] can use the arm_smccc instead 
of meson_sm_call.

[0]: https://patchwork.kernel.org/patch/11395579/
[1]: https://patchwork.kernel.org/patch/11331271/

Best Regards

On 2020/2/20 14:41, Evan Benn wrote:
> Dear Xingyu,
>
> Could this driver also cover your usecase? I am not familiar with
> meson, but it seems like the meson calls could
> be replaced with arm_smccc calls. Then this driver will cover both
> chips. I am not sure if your firmware is upstream
> somewhere, but this might be adapted;
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405
>
> Thanks
>
>
> On Thu, Feb 20, 2020 at 10:20 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> On Wed, Feb 19, 2020 at 03:04:54PM -0800, Julius Werner wrote:
>>>> You are not the first 'watchdog in firmware accessed via an SMC call'.
>>>> Is there some more detail about what implementation this is? Part of
>>>> TF-A? Defined by some spec (I can dream)?
>>> This is just some random implementation written by me because we
>>> needed one. I would like it to be the new generic implementation, but
>>> it sounds like people here prefer the naming to be MediaTek specific
>>> (at least for now). The other SMC watchdog we're aware of is
>>> imx_sc_wdt but unfortunately that seems to hardcode platform-specific
>> There is one more pending, for Meson SMC.
>>
>> https://patchwork.kernel.org/project/linux-watchdog/list/?series=227733
>>
>> Unfortunately it uses Meson firmware API functions, though it has pretty
>> much the same functionality since those ultimately end up calling
>> arm_smccc_smc().
>>
>> Guenter
>>
>>> details in the interface (at least in the pretimeout SMC) so we can't
>>> just expand that. With this driver I tried to directly wrap the kernel
>>> watchdog interface so it should be platform-agnostic and possible to
>>> expand this driver to other platforms later if desired. The SMC
>>> function ID would still always have to be platform-specific,
>>> unfortunately (but we could pass it in through the device tree), since
>>> the Arm SMC spec doesn't really leave any room for OS-generic SMCs
>>> like this.
> .
