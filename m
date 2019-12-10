Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0982F117FED
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2019 06:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfLJFtU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Dec 2019 00:49:20 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:50171 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfLJFtU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Dec 2019 00:49:20 -0500
Received: from [10.28.19.135] (10.28.19.135) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 10 Dec
 2019 13:49:42 +0800
Subject: Re: [PATCH v4 2/2] watchdog: add meson secure watchdog driver
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Qianggui Song <qianggui.song@amlogic.com>,
        <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        <linux-kernel@vger.kernel.org>, Jian Hu <jian.hu@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <1574685218-31164-1-git-send-email-xingyu.chen@amlogic.com>
 <1574685218-31164-3-git-send-email-xingyu.chen@amlogic.com>
 <53661e11-b5b2-b2e8-47b6-9b357beff375@roeck-us.net>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <05503ac6-c43b-0dcd-03b6-6fc8d1545f52@amlogic.com>
Date:   Tue, 10 Dec 2019 13:49:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <53661e11-b5b2-b2e8-47b6-9b357beff375@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [10.28.19.135]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Guenter

On 2019/12/9 22:44, Guenter Roeck wrote:
> On 11/25/19 4:33 AM, Xingyu Chen wrote:
>> The watchdog controller on the Meson-A/C series SoCs is moved to secure
>> world, watchdog operation needs to be done in secure EL3 mode via ATF,
>> Non-secure world can call SMC instruction to trap to AFT for watchdog
>> operation.
>>
>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>> ---
>>   drivers/watchdog/Kconfig         |  16 +++
>>   drivers/watchdog/Makefile        |   1 +
>>   drivers/watchdog/meson_sec_wdt.c | 207 
>> +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 224 insertions(+)
>>   create mode 100644 drivers/watchdog/meson_sec_wdt.c
>>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 58e7c10..e305fba 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -826,6 +826,22 @@ config MESON_GXBB_WATCHDOG
>>         To compile this driver as a module, choose M here: the
>>         module will be called meson_gxbb_wdt.
>>   +config MESON_SEC_WATCHDOG
>> +    tristate "Amlogic Meson Secure watchdog support"
>> +    depends on MESON_SM
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
>> index 00000000..c022d6d
>> --- /dev/null
>> +++ b/drivers/watchdog/meson_sec_wdt.c
>> @@ -0,0 +1,207 @@
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
>> +#define DRV_NAME            "meson-sec-wdt"
>> +
>> +static struct platform_device *platform_device;
>> +struct meson_sec_wdt {
>> +    struct watchdog_device wdt_dev;
>> +    struct meson_sm_firmware *fw;
>> +};
>> +
>> +static int meson_sec_wdt_start(struct watchdog_device *wdt_dev)
>> +{
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    return meson_sm_call(data->fw, SM_A1_WATCHDOG_OPS, NULL,
>> +                 MESON_SIP_WDT_ENABLE, 0, 0, 0, 0);
>> +}
>> +
>> +static int meson_sec_wdt_stop(struct watchdog_device *wdt_dev)
>> +{
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    return meson_sm_call(data->fw, SM_A1_WATCHDOG_OPS, NULL,
>> +                 MESON_SIP_WDT_DISABLE, 0, 0, 0, 0);
>> +}
>> +
>> +static int meson_sec_wdt_ping(struct watchdog_device *wdt_dev)
>> +{
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    return meson_sm_call(data->fw, SM_A1_WATCHDOG_OPS, NULL,
>> +                 MESON_SIP_WDT_PING, 0, 0, 0, 0);
>> +}
>> +
>> +static int meson_sec_wdt_set_timeout(struct watchdog_device *wdt_dev,
>> +                     unsigned int timeout)
>> +{
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    wdt_dev->timeout = timeout;
>> +
>> +    return meson_sm_call(data->fw, SM_A1_WATCHDOG_OPS, NULL,
>> +                 MESON_SIP_WDT_SETTIMEOUT,
>> +                 wdt_dev->timeout * 1000, 0, 0, 0);
>> +}
>> +
>> +static unsigned int meson_sec_wdt_get_timeleft(struct 
>> watchdog_device *wdt_dev)
>> +{
>> +    int ret;
>> +    unsigned int timeleft;
>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>> +
>> +    ret = meson_sm_call(data->fw, SM_A1_WATCHDOG_OPS, &timeleft,
>> +                MESON_SIP_WDT_GETTIMELEFT, 0, 0, 0, 0);
>> +
>> +    if (ret)
>> +        return 0;
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
>> +        return meson_sec_wdt_start(&data->wdt_dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static int __maybe_unused meson_sec_wdt_suspend(struct device *dev)
>> +{
>> +    struct meson_sec_wdt *data = dev_get_drvdata(dev);
>> +
>> +    if (watchdog_active(&data->wdt_dev))
>> +        return meson_sec_wdt_stop(&data->wdt_dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dev_pm_ops meson_sec_wdt_pm_ops = {
>> +    SET_SYSTEM_SLEEP_PM_OPS(meson_sec_wdt_suspend, 
>> meson_sec_wdt_resume)
>> +};
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
>> +    sm_np = of_find_compatible_node(NULL, NULL, 
>> "amlogic,meson-gxbb-sm");
>> +    if (!sm_np) {
>> +        dev_err(&pdev->dev, "no secure-monitor node\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    data->fw = meson_sm_get(sm_np);
>> +    of_node_put(sm_np);
>> +    if (!data->fw)
>> +        return -EPROBE_DEFER;
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
>> +    ret = meson_sm_call(data->fw, SM_A1_WATCHDOG_OPS, NULL,
>> +                MESON_SIP_WDT_INIT,
>> +                data->wdt_dev.timeout * 1000, 0, 0, 0);
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
>> +        .name = DRV_NAME,
>> +        .pm = &meson_sec_wdt_pm_ops,
>> +    },
>> +};
>> +
>> +static int __init meson_sec_wdt_init(void)
>> +{
>> +    int ret;
>> +
>> +    ret = platform_driver_register(&meson_sec_wdt_driver);
>> +    if (ret)
>> +        return ret;
>> +
>> +    platform_device = platform_device_register_simple(DRV_NAME,
>> +                              -1, NULL, 0);
>> +    if (IS_ERR(platform_device)) {
>> +        ret = PTR_ERR(platform_device);
>> +        platform_driver_unregister(&meson_sec_wdt_driver);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void __exit meson_sec_wdt_exit(void)
>> +{
>> +    platform_device_unregister(platform_device);
>> +    platform_driver_unregister(&meson_sec_wdt_driver);
>> +}
>> +
>> +module_init(meson_sec_wdt_init);
>> +module_exit(meson_sec_wdt_exit);
>> +
>
> Driver instantiation is wrong. It tries to instantiate itself as soon
> as the module is loaded and then it bails out in the probe funmction.
> It should be instantiated either through a devicetree node or through
> some platform code, but it should not instantiate itself. If there
> is no watchdog node, the driver needs to be instantiated from
> drivers/firmware/meson/meson_sm.c.
>
> Guenter
>
Thanks for your suggestion.

In next version, I will instantiated device and introduce "timeout-sec" 
property through a dts node.

>> +MODULE_AUTHOR("Xingyu Chen <xingyu.chen@amlogic.com>");
>> +MODULE_DESCRIPTION("Amlogic Secure Watchdog Timer Driver");
>> +MODULE_LICENSE("Dual MIT/GPL");
>>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>
> .
>
