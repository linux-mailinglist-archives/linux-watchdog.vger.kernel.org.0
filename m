Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6571D1A9E59
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Apr 2020 13:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897869AbgDOLy2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Apr 2020 07:54:28 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:23884 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897860AbgDOLyT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Apr 2020 07:54:19 -0400
Received: from [10.28.39.241] (10.28.39.241) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 15 Apr 2020
 19:54:57 +0800
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
From:   Xingyu Chen <xingyu.chen@amlogic.com>
To:     Evan Benn <evanbenn@google.com>,
        LKML <linux-kernel@vger.kernel.org>
CC:     Julius Werner <jwerner@chromium.org>,
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
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
Message-ID: <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
Date:   Wed, 15 Apr 2020 19:54:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.28.39.241]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,Evan

On 2020/4/11 23:06, Xingyu Chen wrote:
> Hi, Evan
> 
> On 2020/4/3 14:04, Evan Benn wrote:
>> Apologies I forgot to add this note to my cover letter.
>>
>> Xingyu do you mind seeing if you can modify your ATF firmware to match 
>> this driver?
>> We can add a compatible or make other changes to suit you.
> Thanks for your patch [0],  I will test this patch on the meson-A1 
> platform, but It looks more
> convenient to be compatible with other platforms if using the compatible 
> strings to correlate
> platform differences include function ID and wdt_ops.
> 
> [0]: https://patchwork.kernel.org/patch/11471829/

I have tested your patch on the meson-A1, but I use the compatible 
strings to correlate the following platform differences，it works normally.

static const struct smcwd_data smcwd_mtk_data = {
	.func_id = 0x82003d06,
	.ops     = &smcwd_ops,
}

static const struct smcwd_data smcwd_meson_data = {
	.func_id = 0x82000086,
	.ops     = &smcwd_timeleft_ops,
}

In addition, It looks more reasonable to use the "msec" as the unit of 
timeout parameter for the ATF fw interface with SMCWD_SET_TIMEOUT:

- The fw interface will compatible with the uboot generic watchdog 
interface at [0], and there is no need to convert timeout from msec
to sec.

- Some vendor's watchdog may be not support the "wdt_trigger_reset" 
reset operation, but they can use the method below to reset the system
by the watchdog right now.

watchdog_set_time(1);  //1ms
watchdog_enable();

[0]: 
https://gitlab.denx.de/u-boot/u-boot/-/blob/master/drivers/watchdog/wdt-uclass.c

Best Regards
>> Thanks
>>
>> On Fri, Apr 3, 2020 at 4:29 PM Evan Benn <evanbenn@chromium.org 
>> <mailto:evanbenn@chromium.org>> wrote:
>>
>>     This is currently supported in firmware deployed on oak, hana and
>>     elm mt8173
>>     chromebook devices. The kernel driver is written to be a generic SMC
>>     watchdog driver.
>>
>>     Arm Trusted Firmware upstreaming review:
>>     https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405
>>
>>     Patch to add oak, hana, elm device tree:
>>     https://lore.kernel.org/linux-arm-kernel/20200110073730.213789-1-hsinyi@chromium.org/
>>     I would like to add the device tree support after the above patch is
>>     accepted.
>>
>>     Changes in v3:
>>     - Change name back to arm
>>     - Add optional get_timeleft op
>>     - change name to arm_smc_wdt
>>
>>     Changes in v2:
>>     - Change name arm > mt8173
>>     - use watchdog_stop_on_reboot
>>     - use watchdog_stop_on_unregister
>>     - use devm_watchdog_register_device
>>     - remove smcwd_shutdown, smcwd_remove
>>     - change error codes
>>
>>     Evan Benn (1):
>>       dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog
>>
>>     Julius Werner (1):
>>       watchdog: Add new arm_smd_wdt watchdog driver
>>
>>      .../bindings/watchdog/arm-smc-wdt.yaml        |  30 +++
>>      MAINTAINERS                                   |   7 +
>>      arch/arm64/configs/defconfig                  |   1 +
>>      drivers/watchdog/Kconfig                      |  13 ++
>>      drivers/watchdog/Makefile                     |   1 +
>>      drivers/watchdog/arm_smc_wdt.c                | 181
>>     ++++++++++++++++++
>>      6 files changed, 233 insertions(+)
>>      create mode 100644
>>     Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
>>      create mode 100644 drivers/watchdog/arm_smc_wdt.c
>>
>>     -- 
>>     2.26.0.292.g33ef6b2f38-goog
>>
