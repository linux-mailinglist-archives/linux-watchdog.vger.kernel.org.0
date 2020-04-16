Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495E21AB627
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Apr 2020 05:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389851AbgDPDXD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Apr 2020 23:23:03 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:16356 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388679AbgDPDXA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Apr 2020 23:23:00 -0400
Received: from [10.28.39.241] (10.28.39.241) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 16 Apr 2020
 11:23:40 +0800
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To:     Julius Werner <jwerner@chromium.org>
CC:     Evan Benn <evanbenn@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
 <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <ea5ae44f-8b63-d34d-b313-c8deeafd86e1@amlogic.com>
Date:   Thu, 16 Apr 2020 11:23:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.39.241]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,Julius

On 2020/4/16 6:29, Julius Werner wrote:
>> In addition, It looks more reasonable to use the "msec" as the unit of
>> timeout parameter for the ATF fw interface with SMCWD_SET_TIMEOUT:
>>
>> - The fw interface will compatible with the uboot generic watchdog
>> interface at [0], and there is no need to convert timeout from msec
>> to sec.
> 
> I think we're trying hard to keep this compatible to a Trusted
> Firmware counterpart that we have already shipped, so we would prefer
> to keep it at seconds if possible. That's what the Linux watchdog core
> uses as well after all, so it just seems natural. I don't really see
> how what U-Boot does would have anything to do with this.

If the uboot introduces a smcwd driver, and it maybe work like this:

static const struct wdt_ops XXX_wdt_ops = {
	.start = XXX_wdt_start,
	...
}

static int XXX_wdt_start(struct udevice *dev, u64 ms, ulong flags) {
	timeout =  ms / 1000;  //convert timeout from msec to sec.
	smcwd_call(SMCWD_SET_TIMEOUT, timeout, NULL);
	smcwd_call(SMCWD_ENABLE, 0, NULL);
}

Best Regards
> 
>> - Some vendor's watchdog may be not support the "wdt_trigger_reset"
>> reset operation, but they can use the method below to reset the system
>> by the watchdog right now.
>>
>> watchdog_set_time(1);  //1ms
>> watchdog_enable();
> 
> They can still do that but they should do that on the Trusted Firmware
> side. Emulating a missing reset functionality should be handled by the
> hardware abstraction layer (in this case Trusted Firmware), not at the
> Linux API level. So Linux would still send a PSCI_SYSTEM_RESET SMC,
> but then Trusted Firmware can choose to implement that by setting the
> watchdog to the smallest possible timeout (which it can because it's
> accessing it directly, not through this SMC interface) and letting it
> expire.
> 
> .
> 
