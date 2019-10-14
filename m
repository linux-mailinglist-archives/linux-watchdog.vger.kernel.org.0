Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A50D618B
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2019 13:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730561AbfJNLmm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Oct 2019 07:42:42 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:27752 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730403AbfJNLml (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Oct 2019 07:42:41 -0400
Received: from [10.28.19.63] (10.28.19.63) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 14 Oct
 2019 19:42:44 +0800
Subject: Re: [PATCH 3/4] watchdog: add meson secure watchdog driver
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
References: <1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com>
 <1570874721-36077-4-git-send-email-xingyu.chen@amlogic.com>
 <07e8aef0-c991-f212-d500-c5ce77b3dea3@roeck-us.net>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <51912003-658e-d290-d4db-130808caf6cd@amlogic.com>
Date:   Mon, 14 Oct 2019 19:42:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <07e8aef0-c991-f212-d500-c5ce77b3dea3@roeck-us.net>
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
Thanks for your review.

On 2019/10/12 22:29, Guenter Roeck wrote:
> On 10/12/19 3:05 AM, Xingyu Chen wrote:
>> The watchdog controller on the Meson-A/C series SoCs is moved to secure
>> world, watchdog operation needs to be done in secure EL3 mode via ATF,
>> Non-secure world can call SMC instruction to trap to AFT for watchdog
>> operation.
>>
>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>> ---
>>   drivers/watchdog/Kconfig         |  16 +++
>>   drivers/watchdog/Makefile        |   1 +
>>   drivers/watchdog/meson_sec_wdt.c | 205 
>> +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 222 insertions(+)
>>   create mode 100644 drivers/watchdog/meson_sec_wdt.c
>>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 58e7c10..e6b0707 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -826,6 +826,22 @@ config MESON_GXBB_WATCHDOG
>>         To compile this driver as a module, choose M here: the
>>         module will be called meson_gxbb_wdt.
>> +config MESON_SEC_WATCHDOG
>> +    tristate "Amlogic Meson Secure watchdog support"
>> +    depends on ARCH_MESON || COMPILE_TEST
> 
> Did you try COMPILE_TEST (eg allmodconfig) on, say x86_64 ?
> AFAICS the meson sm calls are only available if MESON_SM is
> enabled, and that depends on both ARCH_MESON and ARM64_4K_PAGES.
> This dependency is not expressed here, and neither is enabled
> with COMPILE_TEST.Sorry, I have't done this kind of test before for this patchset. There
is a kernel build error which related to the current driver when i try 
to use allmodconfig with x86. I will fix it by adding "depends on 
MESON_SM" in next version.
> 
>> +    select WATCHDOG_CORE
>> +    help
>> +      The watchdog controller on the Meson-A/C series SoCs is moved to
>> +      secure world, watchdog operation needs to be done in secure EL3
>> +      mode via ATF, non-secure world can call SMC instruction to trap
>> +      to ATF for the watchdog operation.
>> +
>> +      Say Y here if watchdog controller on Meson SoCs is located in
>> +      secure world.
>> +
>> +      To compile this driver as a module, choose M here: the
>> +      module will be called meson_sec_wdt.
>> +
>>   config MESON_WATCHDOG
>>       tristate "Amlogic Meson SoCs watchdog support"
>>       depends on ARCH_MESON || COMPILE_TEST
>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>> index 2ee352b..5e6b73d 100644
>> --- a/drivers/watchdog/Makefile
>> +++ b/drivers/watchdog/Makefile
>> @@ -78,6 +78,7 @@ obj-$(CONFIG_QCOM_WDT) += qcom-wdt.o
>>   obj-$(CONFIG_BCM_KONA_WDT) += bcm_kona_wdt.o
>>   obj-$(CONFIG_TEGRA_WATCHDOG) += tegra_wdt.o
>>   obj-$(CONFIG_MESON_GXBB_WATCHDOG) += meson_gxbb_wdt.o
>> +obj-$(CONFIG_MESON_SEC_WATCHDOG) += meson_sec_wdt.o
>>   obj-$(CONFIG_MESON_WATCHDOG) += meson_wdt.o
>>   obj-$(CONFIG_MEDIATEK_WATCHDOG) += mtk_wdt.o
>>   obj-$(CONFIG_DIGICOLOR_WATCHDOG) += digicolor_wdt.o
>> diff --git a/drivers/watchdog/meson_sec_wdt.c 
>> b/drivers/watchdog/meson_sec_wdt.c
>> new file mode 100644
>> index 00000000..2b5357c
>> --- /dev/null
>> +++ b/drivers/watchdog/meson_sec_wdt.c
>> @@ -0,0 +1,205 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>> + * Author: Xingyu Chen <xingyu.chen@amlogic.com>
>> + *
>> + */
>> +#include <linux/err.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
>> +#include <linux/watchdog.h>
>> +#include <linux/firmware/meson/meson_sm.h>
>> +
>> +#define MESON_SIP_WDT_DISABLE        0x1
>> +#define MESON_SIP_WDT_ENABLE        0x2
>> +#define MESON_SIP_WDT_PING        0x3
>> +#define MESON_SIP_WDT_INIT        0x4
>> +#define MESON_SIP_WDT_RESETNOW        0x5
>> +#define MESON_SIP_WDT_SETTIMEOUT    0x6
>> +#define MESON_SIP_WDT_GETTIMELEFT    0x7
>> +
>> +#define DEFAULT_TIMEOUT            30 /* seconds */
>> +
>> +/*
>> + * Watchdog timer tick is set to 1ms in secfw side, and tick count is
>> + * stored in the bit[16-31] of WATCHDOG_CNT register, so the maximum
>> + * timeout value is 0xffff ms.
>> + */
>> +#define MAX_TIMEOUT_MS            0xFFFF
>> +
>> +struct meson_sec_wdt {
>> +    struct watchdog_device wdt_dev;
>> +    struct meson_sm_firmware *fw;
>> +};
>> +
>> +static int meson_sec_wdt_start(struct watchdog_device *wdt_dev)
>> +{
>> +    int ret;
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
>> +                MESON_SIP_WDT_ENABLE, 0, 0, 0, 0); > +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
> 
> This is equivalent to
>      return ret;
> or even
>      return meson_sm_call(...);
>I will fix it in next version.
>> +}
>> +
>> +static int meson_sec_wdt_stop(struct watchdog_device *wdt_dev)
>> +{
>> +    int ret;
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
>> +                MESON_SIP_WDT_DISABLE, 0, 0, 0, 0);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
> 
> Same as above.
I will fix it in next version.
> 
>> +}
>> +
>> +static int meson_sec_wdt_ping(struct watchdog_device *wdt_dev)
>> +{
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
>> +              MESON_SIP_WDT_PING, 0, 0, 0, 0);
>> +
>> +    return 0;
> 
> Why ignore errors ?
I will fix it as above.
> 
>> +}
>> +
>> +static int meson_sec_wdt_set_timeout(struct watchdog_device *wdt_dev,
>> +                     unsigned int timeout)
>> +{
>> +    int ret;
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    wdt_dev->timeout = timeout;
>> +    meson_sec_wdt_ping(wdt_dev);
>> +
> 
> Unconditionally ? Also, the core does that after setting the timeoutIt is used to avoid watchdog timer expire once the timeout is updated, 
and that the watchdog_ping from core not been invoked. If it is 
considered useless, i will remove it.

> 
>> +    ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
>> +                MESON_SIP_WDT_SETTIMEOUT,
>> +                wdt_dev->timeout, 0, 0, 0);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
> 
> same as above.
I will fix it in next version.
> 
>> +}
>> +
>> +static unsigned int meson_sec_wdt_get_timeleft(struct watchdog_device 
>> *wdt_dev)
>> +{
>> +    int ret;
>> +    int timeleft;
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, &timeleft,
>> +                MESON_SIP_WDT_GETTIMELEFT, 0, 0, 0, 0);
>> +
>> +    if (ret)
>> +        return 0;
> 
> Really ? Why ? 0 is most definitely incorrect here.
I just want to return a invalid value after I failed to get valid 
timeleft. Could you tell me what is corrent value ?
> 
>> +
>> +    return timeleft;
>> +}
>> +
>> +static const struct watchdog_ops meson_sec_wdt_ops = {
>> +    .start = meson_sec_wdt_start,
>> +    .stop = meson_sec_wdt_stop,
>> +    .ping = meson_sec_wdt_ping,
>> +    .set_timeout = meson_sec_wdt_set_timeout,
>> +    .get_timeleft = meson_sec_wdt_get_timeleft,
>> +};
>> +
>> +static const struct watchdog_info meson_sec_wdt_info = {
>> +    .identity = "Meson Secure Watchdog Timer",
>> +    .options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | 
>> WDIOF_MAGICCLOSE,
>> +};
>> +
>> +static int __maybe_unused meson_sec_wdt_resume(struct device *dev)
>> +{
>> +    struct meson_sec_wdt *data = dev_get_drvdata(dev);
>> +
>> +    if (watchdog_active(&data->wdt_dev))
>> +        meson_sec_wdt_start(&data->wdt_dev);
> 
> No error return ?
I will fix it in next version
> 
>> +
>> +    return 0;
>> +}
>> +
>> +static int __maybe_unused meson_sec_wdt_suspend(struct device *dev)
>> +{
>> +    struct meson_sec_wdt *data = dev_get_drvdata(dev);
>> +
>> +    if (watchdog_active(&data->wdt_dev))
>> +        meson_sec_wdt_stop(&data->wdt_dev);
> 
> No error return ?
same as above
> 
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dev_pm_ops meson_sec_wdt_pm_ops = {
>> +    SET_SYSTEM_SLEEP_PM_OPS(meson_sec_wdt_suspend, meson_sec_wdt_resume)
>> +};
>> +
>> +static const struct of_device_id meson_sec_wdt_dt_ids[] = {
>> +     { .compatible = "amlogic,meson-sec-wdt", },
>> +     { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, meson_sec_wdt_dt_ids);
>> +
>> +static int meson_sec_wdt_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct meson_sec_wdt *data;
>> +    struct device_node *sm_np;
>> +    int ret;
>> +
>> +    data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
>> +    if (!sm_np) {
>> +        dev_err(&pdev->dev, "no secure-monitor node\n");
>> +        return -ENODEV;
> 
> ENODEV is wrong here.
I found some drivers use the ENODEV in this case, Eg:
- ./watchdog/ts4800_wdt.c -122
- ./nvmem/meson-efuse.c   -55
...

Could you tell me which error code is more suitable in this case ?

> 
>> +    }
>> +
>> +    data->fw = meson_sm_get(sm_np);
>> +    of_node_put(sm_np);
>> +    if (!data->fw)
>> +        return -EPROBE_DEFER;
> 
> How do you know ?
The fw pointer is static variable which is initialized to NULL. if it is 
equal to NULL, and indicate the meson_sm driver is not registered, then 
wdt driver use EPROBE_DEFER to defer probe.
> 
>> +
>> +    platform_set_drvdata(pdev, data);
>> +
>> +    data->wdt_dev.parent = dev;
>> +    data->wdt_dev.info = &meson_sec_wdt_info;
>> +    data->wdt_dev.ops = &meson_sec_wdt_ops;
>> +    data->wdt_dev.max_hw_heartbeat_ms = MAX_TIMEOUT_MS;
>> +    data->wdt_dev.min_timeout = 1;
>> +    data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>> +    watchdog_set_drvdata(&data->wdt_dev, data);
>> +
> No watchdog_init_timeout() ? Any special reason for not supporting
> to set the timeout with a devicetree property ?
I want to keep consistency with previous meson watchdog driver.
as follows:
- meson_gxbb_wdt.c
- meson_wdt.c

> 
>> +    ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
>> +                MESON_SIP_WDT_INIT,
>> +                data->wdt_dev.timeout, 0, 0, 0);
>> +    if (ret)
>> +        return ret;
>> +
>> +    watchdog_stop_on_reboot(&data->wdt_dev);
>> +
>> +    return devm_watchdog_register_device(dev, &data->wdt_dev);
>> +}
>> +
>> +static struct platform_driver meson_sec_wdt_driver = {
>> +    .probe    = meson_sec_wdt_probe,
>> +    .driver = {
>> +        .name = "meson-sec-wdt",
>> +        .pm = &meson_sec_wdt_pm_ops,
>> +        .of_match_table    = meson_sec_wdt_dt_ids,
>> +    },
>> +};
>> +
>> +module_platform_driver(meson_sec_wdt_driver);
>> +
>> +MODULE_AUTHOR("Xingyu Chen <xingyu.chen@amlogic.com>");
>> +MODULE_DESCRIPTION("Amlogic Secure Watchdog Timer Driver");
>> +MODULE_LICENSE("Dual BSD/GPL");
>>
> BSD or MIT ? This should match the license identifier.
MIT, I will fix it in next verson.
> 
> .
> 
