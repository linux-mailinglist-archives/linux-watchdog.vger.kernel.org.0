Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 938C816BB2A
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2020 08:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbgBYHn5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 Feb 2020 02:43:57 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:28838 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgBYHn5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 Feb 2020 02:43:57 -0500
Received: from [10.28.90.149] (10.28.90.149) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Tue, 25 Feb 2020
 15:44:21 +0800
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To:     Julius Werner <jwerner@chromium.org>
CC:     Evan Benn <evanbenn@chromium.org>,
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
        Yonghui Yu <yonghui.yu@amlogic.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
 <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
 <1326f594-3cfd-c03d-4f2c-50eeb75724b2@amlogic.com>
 <CAODwPW8WwntWb_=dg2J3AMy-gHw2QvNj_g98SufN13+AuGnUSg@mail.gmail.com>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <b4ba821a-eef6-4aea-1eba-897171b92c41@amlogic.com>
Date:   Tue, 25 Feb 2020 15:44:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAODwPW8WwntWb_=dg2J3AMy-gHw2QvNj_g98SufN13+AuGnUSg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [10.28.90.149]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Julius

On 2020/2/25 9:23, Julius Werner wrote:
>> The SMC function ID may be solved by the DTS, but the wdt indexs(Eg:
>> SMCWD_INFO) are also different
>> for each vendor. The imx_sc_wdt.c is also use the SMC to operate the
>> WDT, but the wdt indexs(Eg: IMX_SIP_TIMER_START_WDOG)
>> are different from ours. IMO, If the ATF can implement a common hal
>> interface and index for watchdog, then writing a
>> common smc wdt driver will be easier to compatible with all vendors.
> The MediaTek driver is still in flux (e.g. still being reviewed in
> Trusted Firmware here:
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405),
> we can still change it. So if we can now decide on making this a
> "standard" driver, we can change the MediaTek interface to match IMX
> and standardize on that. (There are existing Chromebooks shipped with
> a different interface, but we could handle those separately with
> downstream patches. I think having a unified interface that will
> prevent this problem in the future would be worth some extra
> complication right now.)
If the ATF provides a common watchdog hal interface and index, I am 
happy to match
the generic sec wdt driver. Compared to the current MTK wdt index [0], 
the following
indexes need to be supported for meson wdt [1].
- *_INIT.
- *_GETTIMEOUT.
- *_RESETNOW.  It is used to reset the system right now, similar to your 
SOFT RESET.

For another platform-specific parameter "SMC function ID", the generic 
sec wdt driver can get it from the dts, but if
the driver want to compatible with more vendors in the future, maybe we 
should consider Guenter's suggestion at [2]

[0]: https://patchwork.kernel.org/patch/11395579/
[1]: https://patchwork.kernel.org/patch/11331271/
[2]: 
https://lore.kernel.org/linux-watchdog/20200220155159.GB29658@roeck-us.net/T/#md00328548222965054cd19ec7dda074f8fc09fe2

Best Regards
> .
