Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B45144F815
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Nov 2021 14:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhKNN3D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 14 Nov 2021 08:29:03 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57485 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230169AbhKNN2j (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 14 Nov 2021 08:28:39 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 0F7BB5C0150;
        Sun, 14 Nov 2021 08:25:34 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Sun, 14 Nov 2021 08:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=RNSF97d8Pq5DrOKz2w5/asQ/IXEV
        HQsVsmfl9mOb7CM=; b=isI9tnUTOFVNd9ui2ZBilYD+A0SEza3wwOl14QldCos8
        OO50mlftNUylWdywAibCFY8XlAHjNHCybRunAvnqkxoPRABWTWvMb4hUFLklL03E
        jW6X/wMWBvXTvYA00IqMGdpgEyrcpUm2cSardkVz5mONpTkOhqKzvuga9Nd+M7S0
        2K9CaTe5093t9pXEeYO7kxnXPYwcNJT1byZipICcusG8KG8yQu9NYbKqEKCbVJwC
        2Xlnbm7LW0FbEF+bQ+oSUv1EvgoHvPnomqRHaEy+7+0nC5UDpL2C2fzZjZD0KCxN
        LjvPll/h7KkTQHwDfL4azVgxxJxWATvTClivu04GyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RNSF97
        d8Pq5DrOKz2w5/asQ/IXEVHQsVsmfl9mOb7CM=; b=hi9/3XkLCzSyfLf0chwwaC
        W6Pt3JMFay2qMfDeX8nF5CdO8mEJTFp8zPkSGadpRRnBMOt8/4N8xRzEJ5gkncEW
        m9tjmutfH04IoG07BRp7gB3/4S2+8kcodgKhtz40GpqOZn+2zCJtFiR32Qg6WHA/
        qhF0+8pG/jHmaD/XxupZXG6KFsZwuqANpOnGjdCU4ybTwwM9v0Sqogyy2z7uj+sb
        RI6mvBAHFNc3q/cfRc2BmeKLvXbQnfn7HTnaw2rsBqtz4X6W/4al365WAhIXqdGO
        5yOfE/TZzS+YkbZIkj5vlFHX2aW2kCfNu28rd1iWrNorj2ybmh9Rqr0OiSNXg2uA
        ==
X-ME-Sender: <xms:TQ6RYXhQcFDkXcCVbCpy0JDJPylkgMW-IcDyGDjgYxYFh8wtv2Saqw>
    <xme:TQ6RYUAvtK4zKTQ69CFeRulRUMu2Su1QG2TMOOlG6ioDNHqnYO4JSmhrAK4sRBFfB
    wCRZ3jhwXhF2hE72LU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdejgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhvvghn
    ucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
    htvghrnhepgfeigeeiffeuhfettdejgfetjeetfeelfefgfefgvddvtdfghfffudehvdef
    keffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    hvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:TQ6RYXH2i0sCkgrXvWCKKcNw0_F18-T9cq1yU8fPLnzHlbkiuP8Jww>
    <xmx:TQ6RYUTgEF0yef7LJEiB8r-CGz3niVNS1hteOVlCKwm72u5ZYeZSqA>
    <xmx:TQ6RYUxZoLz1Eas_30rxicdCSub44nHWI57FIWzsd2nQJYYI0mQSfw>
    <xmx:Tg6RYXwJiB8g3BNCMmsKP4iv4_i00G3i5YVD4iXniyBBsOLYVaFi5A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 70CCC2740149; Sun, 14 Nov 2021 08:25:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <35654ca0-565a-4d2a-bf4b-7580b97b998f@www.fastmail.com>
In-Reply-To: <01ed3bdf-307d-b51d-7739-d2e5c6cb4e42@roeck-us.net>
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <20211113094732.73889-2-sven@svenpeter.dev>
 <01ed3bdf-307d-b51d-7739-d2e5c6cb4e42@roeck-us.net>
Date:   Sun, 14 Nov 2021 14:25:11 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Guenter Roeck" <linux@roeck-us.net>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>
Cc:     "Hector Martin" <marcan@marcan.st>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Kettenis" <mark.kettenis@xs4all.nl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] watchdog: Add Apple SoC watchdog driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Thanks a lot for the quick review!

On Sun, Nov 14, 2021, at 13:42, Guenter Roeck wrote:
> On 11/13/21 1:47 AM, Sven Peter wrote:
>> Add support for the watchdog timer found in Apple SoCs. This driver is
>> also required to reboot these machines.
>> 
>> Signed-off-by: Sven Peter <sven@svenpeter.dev>
>> ---
>>   MAINTAINERS                  |   1 +
>>   drivers/watchdog/Kconfig     |  12 ++
>>   drivers/watchdog/Makefile    |   1 +
>>   drivers/watchdog/apple_wdt.c | 223 +++++++++++++++++++++++++++++++++++
>>   4 files changed, 237 insertions(+)
>>   create mode 100644 drivers/watchdog/apple_wdt.c
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ba480837724d..30a1444297a1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1756,6 +1756,7 @@ F:	drivers/i2c/busses/i2c-pasemi-platform.c
>>   F:	drivers/irqchip/irq-apple-aic.c
>>   F:	drivers/mailbox/apple-mailbox.c
>>   F:	drivers/pinctrl/pinctrl-apple-gpio.c
>> +F:	drivers/watchdog/apple_wdt.c
>>   F:	include/dt-bindings/interrupt-controller/apple-aic.h
>>   F:	include/dt-bindings/pinctrl/apple.h
>>   F:	include/linux/apple-mailbox.h
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 9d222ba17ec6..170dec880c8f 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -976,6 +976,18 @@ config MSC313E_WATCHDOG
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called msc313e_wdt.
>>   
>> +config APPLE_WATCHDOG
>> +	tristate "Apple SoC watchdog"
>> +	depends on ARCH_APPLE || COMPILE_TEST
>> +	select WATCHDOG_CORE
>> +	help
>> +	  Say Y here to include support for the Watchdog found in Apple
>> +	  SoCs such as the M1. Next to the common watchdog features this
>> +	  driver is also required in order to reboot these SoCs.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called apple_wdt.
>> +
>>   # X86 (i386 + ia64 + x86_64) Architecture
>>   
>>   config ACQUIRE_WDT
>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>> index 2ee97064145b..270a518bd8f3 100644
>> --- a/drivers/watchdog/Makefile
>> +++ b/drivers/watchdog/Makefile
>> @@ -93,6 +93,7 @@ obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
>>   obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>>   obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
>>   obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>> +obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>>   
>>   # X86 (i386 + ia64 + x86_64) Architecture
>>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
>> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
>> new file mode 100644
>> index 000000000000..ff6d98aadffc
>> --- /dev/null
>> +++ b/drivers/watchdog/apple_wdt.c
>> @@ -0,0 +1,223 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Apple SoC Watchdog driver
>> + *
>> + * Copyright (C) The Asahi Linux Contributors
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/limits.h>
>> +#include <linux/math64.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/watchdog.h>
>> +
>> +/*
>> + * Apple Watchdog MMIO registers
>> + *
>> + * This HW block has three separate watchdogs. WD0 resets the machine
>> + * to recovery mode and is not very useful for us. WD1 and WD2 trigger a normal
>> + * machine reset. WD0 additionally supports a configurable interrupt.
>> + *
>> + * APPLE_WDT_WDx_CUR_TIME is a simple counter incremented for each tick of the
>> + * reference clock. It can also be overwritten to any value.
>> + * Whenever APPLE_WDT_CTRL_RESET_EN is set in APPLE_WDT_WDx_CTRL and
>> + * APPLE_WDTx_WD1_CUR_TIME >= APPLE_WDTx_WD1_BITE_TIME the entire machine is
>> + * reset.
>> + * Whenever APPLE_WDT_CTRL_IRQ_EN is set and APPLE_WDTx_WD1_CUR_TIME >=
>> + * APPLE_WDTx_WD1_BARK_TIME an interrupt is triggered and
>> + * APPLE_WDT_CTRL_IRQ_STATUS is set. The interrupt can be cleared by writing
>> + * 1 to APPLE_WDT_CTRL_IRQ_STATUS.
>
> This information is useless since it is not used. It might make sense 
> to add a note
> along the line of "This information can be used to implement pretimeout 
> support
> at a later time".

Sure, I'll add that line.

>
>> + */
>> +#define APPLE_WDT_WD0_CUR_TIME		0x00
>> +#define APPLE_WDT_WD0_BITE_TIME		0x04
>> +#define APPLE_WDT_WD0_BARK_TIME		0x08
>> +#define APPLE_WDT_WD0_CTRL		0x0c
>> +
>> +#define APPLE_WDT_WD1_CUR_TIME		0x10
>> +#define APPLE_WDT_WD1_BITE_TIME		0x14
>> +#define APPLE_WDT_WD1_CTRL		0x1c
>> +
>> +#define APPLE_WDT_WD2_CUR_TIME		0x20
>> +#define APPLE_WDT_WD2_BITE_TIME		0x24
>> +#define APPLE_WDT_WD2_CTRL		0x2c
>> +
>> +#define APPLE_WDT_CTRL_IRQ_EN		BIT(0)
>> +#define APPLE_WDT_CTRL_IRQ_STATUS	BIT(1)
>> +#define APPLE_WDT_CTRL_RESET_EN		BIT(2)
>
> Include linux/bits.h

Done.

>
>> +
>> +struct apple_wdt {
>> +	struct watchdog_device wdd;
>> +	void __iomem *regs;
>> +	struct clk *clk;
>> +	u32 clk_rate;
>
> clk_get_rate returns unsigned long. Any reason to use u32 ?

No, just a (bad) habit. I'll switch it to unsigned long.

>
>> +};
>> +
>> +static struct apple_wdt *to_apple_wdt(struct watchdog_device *wdd)
>> +{
>> +	return container_of(wdd, struct apple_wdt, wdd);
>> +}
>> +
>> +static int apple_wdt_start(struct watchdog_device *wdd)
>> +{
>> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
>> +
>> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
>> +	writel_relaxed(APPLE_WDT_CTRL_RESET_EN, wdt->regs + APPLE_WDT_WD1_CTRL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int apple_wdt_stop(struct watchdog_device *wdd)
>> +{
>> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
>> +
>> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CTRL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int apple_wdt_ping(struct watchdog_device *wdd)
>> +{
>> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
>> +
>> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
>> +
>> +	return 0;
>> +}
>> +
>> +static int apple_wdt_set_timeout(struct watchdog_device *wdd, unsigned int s)
>> +{
>> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
>> +	u64 timeout;
>> +
>> +	timeout = mul_u32_u32(wdt->clk_rate, s);
>> +	if (timeout > U32_MAX)
>> +		return -EINVAL;
>> +
>
> With
> 	max_timeout = U32_MAX / wdt->clk_rate;
>
> the result of the above multiply operation is never larger than U32_MAX,
> and both the error check and the use of mul_u32_u32() are unnecessary.
>
> Just use
> 	u32 timeout = s * wdt->clk_rate;

Good point, will do that.

>
>
>> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
>> +	writel_relaxed(timeout, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
>> +
>> +	wdd->timeout = s;
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned int apple_wdt_get_timeleft(struct watchdog_device *wdd)
>> +{
>> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
>> +	u32 cur_time, reset_time;
>> +
>> +	cur_time = readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
>> +	reset_time = readl_relaxed(wdt->regs + APPLE_WDT_WD1_BITE_TIME);
>> +
>> +	return (reset_time - cur_time) / wdt->clk_rate;
>> +}
>> +
>> +static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
>> +			     void *cmd)
>> +{
>> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
>> +
>> +	writel_relaxed(APPLE_WDT_CTRL_RESET_EN, wdt->regs + APPLE_WDT_WD1_CTRL);
>> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
>> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
>> +
>> +	/* flush writes and wait for the reset to be triggered */
>> +	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
>> +	mdelay(150);
>
> Can this magic number be explained ?

I actually should just need to wait for a single tick of the watchdog
clock here before it resets the SoC so something like

    while (readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME) == 0);

should work without requiring any magic number.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static struct watchdog_ops apple_wdt_ops = {
>> +	.owner = THIS_MODULE,
>> +	.start = apple_wdt_start,
>> +	.stop = apple_wdt_stop,
>> +	.ping = apple_wdt_ping,
>> +	.set_timeout = apple_wdt_set_timeout,
>> +	.get_timeleft = apple_wdt_get_timeleft,
>> +	.restart = apple_wdt_restart,
>> +};
>> +
>> +static struct watchdog_info apple_wdt_info = {
>> +	.identity = "Apple SoC Watchdog",
>> +	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
>> +};
>> +
>> +static int apple_wdt_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct apple_wdt *wdt;
>> +	int ret;
>> +
>> +	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>> +	if (!wdt)
>> +		return -ENOMEM;
>> +	platform_set_drvdata(pdev, wdt);
>> +
>> +	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(wdt->regs))
>> +		return PTR_ERR(wdt->regs);
>> +
>> +	/* reset watchdog to safe defaults */
>> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CTRL);
>> +	writel_relaxed(U32_MAX, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
>> +
>> +	wdt->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(wdt->clk))
>> +		return PTR_ERR(wdt->clk);
>> +
>> +	ret = clk_prepare_enable(wdt->clk);
>> +	if (ret)
>> +		return ret;
>> +
>> +	wdt->clk_rate = clk_get_rate(wdt->clk);
>
> clk_get_rate() can, at least in theory, return 0.

Good catch, will add a check for that.

>
>> +	wdt->wdd.ops = &apple_wdt_ops;
>> +	wdt->wdd.info = &apple_wdt_info;
>> +	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
>> +	wdt->wdd.timeout = wdt->wdd.max_timeout;
>
> It is is quite unusual to set the default timeout to the maximum.
> Normally drivers configure 30 or 60 seconds. Are you sure
> this is what you want ?

Didn't really think about this at all. I'll setup a default timeout of 30s
by calling apple_wdt_set_timeout here.

>
>> +
>> +	watchdog_stop_on_unregister(&wdt->wdd);
>> +	watchdog_set_restart_priority(&wdt->wdd, 128);
>> +
>> +	ret = devm_watchdog_register_device(dev, &wdt->wdd); > +	if (ret < 0) {
>> +		clk_disable_unprepare(wdt->clk);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int apple_wdt_remove(struct platform_device *pdev)
>> +{
>> +	struct apple_wdt *wdt = platform_get_drvdata(pdev);
>> +
>> +	clk_disable_unprepare(wdt->clk);
>
> clk_disable_unprepare() must be called after unregistering the watchdog.
> Please use devm_add_action_or_reset() in the probe function to handle
> clk_disable_unprepare() - see many other watchdog drivers for examples.

Sure, will do that.

>
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id apple_wdt_of_match[] = {
>> +	{ .compatible = "apple,wdt" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, apple_wdt_of_match);
>> +
>> +static struct platform_driver apple_wdt_driver = {
>> +	.driver = {
>> +		.name = "apple-watchdog",
>> +		.of_match_table = apple_wdt_of_match,
>> +	},
>> +	.probe = apple_wdt_probe,
>> +	.remove = apple_wdt_remove,
>> +};
>> +module_platform_driver(apple_wdt_driver);
>> +
>> +MODULE_DESCRIPTION("Apple SoC watchdog driver");
>> +MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
>> +MODULE_LICENSE("Dual MIT/GPL");
>>


Thanks,

Sven
