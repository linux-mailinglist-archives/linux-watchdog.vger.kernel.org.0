Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE79454687
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 13:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236752AbhKQMpW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 07:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbhKQMpV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 07:45:21 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDC6C061570;
        Wed, 17 Nov 2021 04:42:23 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so4442102otk.13;
        Wed, 17 Nov 2021 04:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m2tf/wEUOn6sFyyoKjCAiAyevf8V2IFHcjRJzEpw7fc=;
        b=LWV46l7/+8+iiS50S5V0RkgYTQa84nVH3EvRFird9SBuaIBYMM0M2oWhjT5v297Htw
         QhCeS59jCNIWB3VhHP6gAV6Zii+LlZnDPqiBKJsCN6ZQ3lankmrkOWfeT43IXDrgYuWI
         3/OnlNGEX2qy4gZRd7/7OXYGtW9ca2RdmlrbYldN93XTsWQj5LrlmO7Bgg9B9cJOd4ni
         dcpxMekoJ14pH5NKeFrETR6ATvywSIWvO/vvsyEpd/Ks+q+WBEl39hLN+8TqSguCCW23
         sbV+QlTu/iuIjGYTI8PdkljYaxl5fhZ8bQLOTYSF8n0bvr290BgWwPPMaGmNWcnXTxyM
         dgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m2tf/wEUOn6sFyyoKjCAiAyevf8V2IFHcjRJzEpw7fc=;
        b=4Vd4LXLgSJzm9G2dsapxc8+GIAamQRxpJfFUnYkoVYgXf+D+8RbgyXYZSp/fFbtdMz
         cpvTQsyw9M2qzVLFwJmjx6VeBp9pNj9aEVNucLfW7qwVXPWon8dof94NDlcLeGbpoVQi
         dw7yje/1tpiG0NIVMiIrC3ALCnRouEr+RzkMmD6Bq7RCCjvWkyGLyiOnRBh2VOq/aKUx
         JSHl84SPphXVrEvjvvEnRkAn86lV11+tyjGy0+6gCrskDmtIvb0fL01pPJTGV5HIrZdo
         nTXHK62YFr0g5PO5hvL5P/2jsOSNJhjFUzkB9T51uel0DYkC4K1wuEPRafVS9rGNDTEr
         EOVg==
X-Gm-Message-State: AOAM530n9AfFRDqeaVZ1fOUAz/KAqOm0hexuDEx3/zteokCFMjwUrmAd
        JzywNWkX6KLdnwU8beSyowr0PCkbLtI=
X-Google-Smtp-Source: ABdhPJzvXnidL1FpCHhzmP+aI6h1MUaur8/tvln7x/isL9g9Rm/FjG9XTX+xTWxFNrn+9Db+kwB+Wg==
X-Received: by 2002:a05:6830:2b14:: with SMTP id l20mr13452319otv.42.1637152942301;
        Wed, 17 Nov 2021 04:42:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a13sm4589150oiy.9.2021.11.17.04.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 04:42:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 2/2] watchdog: Add Realtek Otto watchdog timer
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1636018117.git.sander@svanheule.net>
 <2dbf0c6e0eebf523008c15794434d2d1a9b1260e.1636018117.git.sander@svanheule.net>
 <20211117052054.GA215087@roeck-us.net>
 <787cfd2ab58fb7f1d841f0ced261213f9c2050ae.camel@svanheule.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <62050743-bc11-cc21-c6ae-0be9d7b5633c@roeck-us.net>
Date:   Wed, 17 Nov 2021 04:42:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <787cfd2ab58fb7f1d841f0ced261213f9c2050ae.camel@svanheule.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/16/21 11:13 PM, Sander Vanheule wrote:
> Hi Guenter,
> 
> On Tue, 2021-11-16 at 21:20 -0800, Guenter Roeck wrote:
>> On Thu, Nov 04, 2021 at 10:32:13AM +0100, Sander Vanheule wrote:
>>> Realtek MIPS SoCs (platform name Otto) have a watchdog timer with
>>> pretimeout notifitication support. The WDT can (partially) hard reset,
>>> or soft reset the SoC.
>>>
>>> This driver implements all features as described in the devicetree
>>> binding, except the phase2 interrupt, and also functions as a restart
>>> handler. The cpu reset mode is considered to be a "warm" restart, since
>>> this mode does not reset all peripherals. Being an embedded system
>>> though, the "cpu" and "software" modes will still cause the bootloader
>>> to run on restart.
>>>
>>> It is not known how a forced system reset can be disabled on the
>>> supported platforms. This means that the phase2 interrupt will only fire
>>> at the same time as reset, so implementing phase2 is of little use.
>>>
>>> Signed-off-by: Sander Vanheule <sander@svanheule.net>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thank you for the review! In the meantime, I was preparing a v4 of this series with some
> small changes (see inline below). Could you let me know if I can keep your Reviewed-by
> with those changes?
> 

I think it would be better to re-review it.

Also, if the clock rate desn't change, you should really read the rate once in probe,
make sure it is sane, and store the result in struct otto_wdt_ctrl.

Thanks,
Guenter

>>
>>>
>>> --
>>
>> Note for the future: Change log should be after '---'.
> 
> Will do!
> 
>>
>>> v2 -> v3:
>>> - fix off-by-one error in PRESCALE assignment
>>>
>>> v1 -> v2:
>>> - drop raw_spinlock, locking is not required
>>> - replace devm_free_irq with disable_irq
>>> - use max_hw_heartbeat_ms instead of max_timeout
>>> - drop redundant timeout value checks
>>> - replace ROUND_CLOSEST by ROUND_UP for tick counts, and flooring
>>>    division for timeout values
>>> - change COMMON_CLK 'select' into 'depends on'
>>> - add MODULE_DEVICE_TABLE for OF ID table
>>> - add realtek,rtl9300 compatible
>>> - drop phase2 irq
>>> ---
>>>   MAINTAINERS                         |   7 +
>>>   drivers/watchdog/Kconfig            |  13 +
>>>   drivers/watchdog/Makefile           |   1 +
>>>   drivers/watchdog/realtek_otto_wdt.c | 361 ++++++++++++++++++++++++++++
>>>   4 files changed, 382 insertions(+)
>>>   create mode 100644 drivers/watchdog/realtek_otto_wdt.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 2c9070aeba2a..54c8f788d3e5 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -15991,6 +15991,13 @@ S:     Maintained
>>>   F:     include/sound/rt*.h
>>>   F:     sound/soc/codecs/rt*
>>>   
>>> +REALTEK OTTO WATCHDOG
>>> +M:     Sander Vanheule <sander@svanheule.net>
>>> +L:     linux-watchdog@vger.kernel.org
>>> +S:     Maintained
>>> +F:     Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
>>> +F:     driver/watchdog/realtek_otto_wdt.c
>>> +
>>>   REALTEK RTL83xx SMI DSA ROUTER CHIPS
>>>   M:     Linus Walleij <linus.walleij@linaro.org>
>>>   S:     Maintained
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index bf59faeb3de1..d308e13a9aa1 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -954,6 +954,19 @@ config RTD119X_WATCHDOG
>>>            Say Y here to include support for the watchdog timer in
>>>            Realtek RTD1295 SoCs.
>>>   
>>> +config REALTEK_OTTO_WDT
>>> +       tristate "Realtek Otto MIPS watchdog support"
>>> +       depends on MACH_REALTEK_RTL || COMPILE_TEST
>>> +       depends on COMMON_CLK
>>> +       select WATCHDOG_CORE
>>> +       default MACH_REALTEK_RTL
>>> +       help
>>> +         Say Y here to include support for the watchdog timer on Realtek
>>> +         RTL838x, RTL839x, RTL930x SoCs. This watchdog has pretimeout
>>> +         notifications and system reset on timeout.
>>> +
>>> +         When built as a module this will be called realtek_otto_wdt.
>>> +
>>>   config SPRD_WATCHDOG
>>>          tristate "Spreadtrum watchdog support"
>>>          depends on ARCH_SPRD || COMPILE_TEST
>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>> index 1bd2d6f37c53..a8dccf819163 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -171,6 +171,7 @@ obj-$(CONFIG_IMGPDC_WDT) += imgpdc_wdt.o
>>>   obj-$(CONFIG_MT7621_WDT) += mt7621_wdt.o
>>>   obj-$(CONFIG_PIC32_WDT) += pic32-wdt.o
>>>   obj-$(CONFIG_PIC32_DMT) += pic32-dmt.o
>>> +obj-$(CONFIG_REALTEK_OTTO_WDT) += realtek_otto_wdt.o
>>>   
>>>   # PARISC Architecture
>>>   
>>> diff --git a/drivers/watchdog/realtek_otto_wdt.c b/drivers/watchdog/realtek_otto_wdt.c
>>> new file mode 100644
>>> index 000000000000..48bc8dfefc25
>>> --- /dev/null
>>> +++ b/drivers/watchdog/realtek_otto_wdt.c
>>> @@ -0,0 +1,361 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +/*
>>> + * Realtek Otto MIPS platform watchdog
>>> + *
>>> + * Watchdog timer that will reset the system after timeout, using the selected
>>> + * reset mode.
>>> + *
>>> + * Counter scaling and timeouts:
>>> + * - Base prescale of (2 << 25), providing tick duration T_0: 168ms @ 200MHz
>>> + * - PRESCALE: logarithmic prescaler adding a factor of {1, 2, 4, 8}
>>> + * - Phase 1: Times out after (PHASE1 + 1) × PRESCALE × T_0
>>> + *   Generates an interrupt, WDT cannot be stopped after phase 1
>>> + * - Phase 2: starts after phase 1, times out after (PHASE2 + 1) × PRESCALE × T_0
>>> + *   Resets the system according to RST_MODE
>>> + */
>>> +
>>> +#include <linux/bits.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/math.h>
>>> +#include <linux/minmax.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/property.h>
>>> +#include <linux/reboot.h>
>>> +#include <linux/watchdog.h>
>>> +
>>> +#define OTTO_WDT_REG_CNTR              0x0
>>> +#define OTTO_WDT_CNTR_PING             BIT(31)
>>> +
>>> +#define OTTO_WDT_REG_INTR              0x4
>>> +#define OTTO_WDT_INTR_PHASE_1          BIT(31)
>>> +#define OTTO_WDT_INTR_PHASE_2          BIT(30)
>>> +
>>> +#define OTTO_WDT_REG_CTRL              0x8
>>> +#define OTTO_WDT_CTRL_ENABLE           BIT(31)
>>> +#define OTTO_WDT_CTRL_PRESCALE         GENMASK(30, 29)
>>> +#define OTTO_WDT_CTRL_PHASE1           GENMASK(26, 22)
>>> +#define OTTO_WDT_CTRL_PHASE2           GENMASK(19, 15)
>>> +#define OTTO_WDT_CTRL_RST_MODE         GENMASK(1, 0)
>>> +#define OTTO_WDT_MODE_SOC              0
>>> +#define OTTO_WDT_MODE_CPU              1
>>> +#define OTTO_WDT_MODE_SOFTWARE         2
>>> +#define OTTO_WDT_CTRL_DEFAULT          OTTO_WDT_MODE_CPU
>>> +
>>> +#define OTTO_WDT_PRESCALE_MAX          3
>>> +
>>> +/*
>>> + * One higher than the max values contained in PHASE{1,2}, since a value of 0
>>> + * corresponds to one tick.
>>> + */
>>> +#define OTTO_WDT_PHASE_TICKS_MAX       32
>>> +
>>> +/*
>>> + * The maximum reset delay is actually 2×32 ticks, but that would require large
>>> + * pretimeout values for timeouts longer than 32 ticks. Limit the maximum timeout
>>> + * to 32 + 1 to ensure small pretimeout values can be configured as expected.
>>> + */
>>> +#define OTTO_WDT_TIMEOUT_TICKS_MAX     (OTTO_WDT_PHASE_TICKS_MAX + 1)
>>> +
>>> +struct otto_wdt_ctrl {
>>> +       struct watchdog_device wdev;
>>> +       struct device *dev;
>>> +       void __iomem *base;
>>> +       struct clk *clk;
>>> +       int irq_phase1;
>>> +};
>>> +
>>> +static int otto_wdt_start(struct watchdog_device *wdev)
>>> +{
>>> +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
>>> +       u32 v;
>>> +
>>> +       v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
>>> +       v |= OTTO_WDT_CTRL_ENABLE;
>>> +       iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int otto_wdt_stop(struct watchdog_device *wdev)
>>> +{
>>> +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
>>> +       u32 v;
>>> +
>>> +       v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
>>> +       v &= ~OTTO_WDT_CTRL_ENABLE;
>>> +       iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int otto_wdt_ping(struct watchdog_device *wdev)
>>> +{
>>> +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
>>> +
>>> +       iowrite32(OTTO_WDT_CNTR_PING, ctrl->base + OTTO_WDT_REG_CNTR);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int otto_wdt_tick_ms(struct otto_wdt_ctrl *ctrl, int prescale)
>>> +{
>>> +       unsigned int rate_khz = clk_get_rate(ctrl->clk) / 1000;
>>> +
>>> +       if (!rate_khz)
>>> +               return 0;
>>> +
>>> +       return DIV_ROUND_CLOSEST(1 << (25 + prescale), rate_khz);
>>> +}
>>> +
>>> +/*
>>> + * The timer asserts the PHASE1/PHASE2 IRQs when the number of ticks exceeds
>>> + * the value stored in those fields. This means each phase will run for at least
>>> + * one tick, so small values need to be clamped to correctly reflect the timeout.
>>> + */
>>> +static inline unsigned int div_round_ticks(unsigned int val, unsigned int
>>> tick_duration,
>>> +               unsigned int min_ticks)
>>> +{
>>> +       return max(min_ticks, DIV_ROUND_UP(val, tick_duration));
>>> +}
>>> +
>>> +static int otto_wdt_determine_timeouts(struct watchdog_device *wdev, unsigned int
>>> timeout,
>>> +               unsigned int pretimeout)
>>> +{
>>> +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
>>> +       unsigned int pretimeout_ms = pretimeout * 1000;
>>> +       unsigned int timeout_ms = timeout * 1000;
>>> +       unsigned int prescale_next = 0;
>>> +       unsigned int phase1_ticks;
>>> +       unsigned int phase2_ticks;
>>> +       unsigned int total_ticks;
>>> +       unsigned int prescale;
>>> +       unsigned int tick_ms;
>>> +       u32 v;
>>> +
>>> +       do {
>>> +               prescale = prescale_next;
>>> +               if (prescale > OTTO_WDT_PRESCALE_MAX)
>>> +                       return -EINVAL;
>>> +
>>> +               tick_ms = otto_wdt_tick_ms(ctrl, prescale);
>>> +               total_ticks = div_round_ticks(timeout_ms, tick_ms, 2);
>>> +               phase1_ticks = div_round_ticks(timeout_ms - pretimeout_ms, tick_ms, 1);
>>> +               phase2_ticks = total_ticks - phase1_ticks;
>>> +
>>> +               prescale_next++;
>>> +       } while (phase1_ticks > OTTO_WDT_PHASE_TICKS_MAX
>>> +               || phase2_ticks > OTTO_WDT_PHASE_TICKS_MAX);
>>> +
>>> +       v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
>>> +
>>> +       v &= ~(OTTO_WDT_CTRL_PRESCALE | OTTO_WDT_CTRL_PHASE1 | OTTO_WDT_CTRL_PHASE2);
>>> +       v |= FIELD_PREP(OTTO_WDT_CTRL_PHASE1, phase1_ticks - 1);
>>> +       v |= FIELD_PREP(OTTO_WDT_CTRL_PHASE2, phase2_ticks - 1);
>>> +       v |= FIELD_PREP(OTTO_WDT_CTRL_PRESCALE, prescale);
>>> +
>>> +       iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
>>> +
>>> +       timeout_ms = total_ticks * tick_ms;
>>> +       ctrl->wdev.timeout = timeout_ms / 1000;
>>> +
>>> +       pretimeout_ms = phase2_ticks * tick_ms;
>>> +       ctrl->wdev.pretimeout = pretimeout_ms / 1000;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int otto_wdt_set_timeout(struct watchdog_device *wdev, unsigned int val)
>>> +{
>>> +       return otto_wdt_determine_timeouts(wdev, val, min(wdev->pretimeout, val - 1));
>>> +}
>>> +
>>> +static int otto_wdt_set_pretimeout(struct watchdog_device *wdev, unsigned int val)
>>> +{
>>> +       return otto_wdt_determine_timeouts(wdev, wdev->timeout, val);
>>> +}
>>> +
>>> +static int otto_wdt_restart(struct watchdog_device *wdev, unsigned long reboot_mode,
>>> +               void *data)
>>> +{
>>> +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
>>> +       u32 reset_mode;
>>> +       u32 v;
>>> +
>>> +       disable_irq(ctrl->irq_phase1);
>>> +
>>> +       switch (reboot_mode) {
>>> +       case REBOOT_SOFT:
>>> +               reset_mode = OTTO_WDT_MODE_SOFTWARE;
>>> +               break;
>>> +       case REBOOT_WARM:
>>> +               reset_mode = OTTO_WDT_MODE_CPU;
>>> +               break;
>>> +       default:
>>> +               reset_mode = OTTO_WDT_MODE_SOC;
>>> +               break;
>>> +       }
>>> +
>>> +       /* Configure for shortest timeout and wait for reset to occur */
>>> +       v = FIELD_PREP(OTTO_WDT_CTRL_RST_MODE, reset_mode) | OTTO_WDT_CTRL_ENABLE;
>>> +       iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
>>> +
>>> +       mdelay(3 * otto_wdt_tick_ms(ctrl, 0));
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static irqreturn_t otto_wdt_phase1_isr(int irq, void *dev_id)
>>> +{
>>> +       struct otto_wdt_ctrl *ctrl = dev_id;
>>> +
>>> +       iowrite32(OTTO_WDT_INTR_PHASE_1, ctrl->base + OTTO_WDT_REG_INTR);
>>> +       dev_crit(ctrl->dev, "phase 1 timeout\n");
>>> +       watchdog_notify_pretimeout(&ctrl->wdev);
>>> +
>>> +       return IRQ_HANDLED;
>>> +}
>>> +
>>> +static const struct watchdog_ops otto_wdt_ops = {
>>> +       .owner = THIS_MODULE,
>>> +       .start = otto_wdt_start,
>>> +       .stop = otto_wdt_stop,
>>> +       .ping = otto_wdt_ping,
>>> +       .set_timeout = otto_wdt_set_timeout,
>>> +       .set_pretimeout = otto_wdt_set_pretimeout,
>>> +       .restart = otto_wdt_restart,
>>> +};
>>> +
>>> +static const struct watchdog_info otto_wdt_info = {
>>> +       .identity = "Realtek Otto watchdog timer",
>>> +       .options = WDIOF_KEEPALIVEPING |
>>> +               WDIOF_MAGICCLOSE |
>>> +               WDIOF_SETTIMEOUT |
>>> +               WDIOF_PRETIMEOUT,
>>> +};
>>> +
>>> +static int otto_wdt_probe_reset_mode(struct otto_wdt_ctrl *ctrl)
>>> +{
>>> +       static const char *mode_property = "realtek,reset-mode";
>>> +       const struct fwnode_handle *node = ctrl->dev->fwnode;
>>> +       int mode_count;
>>> +       u32 mode;
>>> +       u32 v;
>>> +
>>> +       if (!node)
>>> +               return -ENXIO;
>>> +
>>> +       mode_count = fwnode_property_string_array_count(node, mode_property);
>>> +       if (mode_count < 0)
>>> +               return mode_count;
>>> +       else if (mode_count == 0)
>>> +               return 0;
>>> +       else if (mode_count != 1)
>>> +               return -EINVAL;
>>> +
>>> +       if (fwnode_property_match_string(node, mode_property, "soc") == 0)
>>> +               mode = OTTO_WDT_MODE_SOC;
>>> +       else if (fwnode_property_match_string(node, mode_property, "cpu") == 0)
>>> +               mode = OTTO_WDT_MODE_CPU;
>>> +       else if (fwnode_property_match_string(node, mode_property, "software") == 0)
>>> +               mode = OTTO_WDT_MODE_SOFTWARE;
>>> +       else
>>> +               return -EINVAL;
>>> +
>>> +       v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
>>> +       v &= ~OTTO_WDT_CTRL_RST_MODE;
>>> +       v |= FIELD_PREP(OTTO_WDT_CTRL_RST_MODE, mode);
>>> +       iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
>>> +
>>> +       return 0;
>>> +}
>>> +
> 
> This is the first time I'm using the clocks framework. Since I'm currently using a fixed-
> clock node in my DTS, I guess this clock is just 'always on'. As I understand, I should
> also use clock_{prepare_enable,disable_unprepare}.
> 
> I would add the following small function...
> 
> -- >8 --
> +static void otto_wdt_clock_action(void *data)
> +{
> +       clk_disable_unprepare(data);
> +}
> +
> -- 8< --
> 
>>> +static int otto_wdt_probe(struct platform_device *pdev)
>>> +{
>>> +       struct device *dev = &pdev->dev;
>>> +       struct otto_wdt_ctrl *ctrl;
>>> +       unsigned int max_tick_ms;
>>> +       int ret;
>>> +
>>> +       ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>>> +       if (!ctrl)
>>> +               return -ENOMEM;
>>> +
>>> +       ctrl->dev = dev;
>>> +       ctrl->base = devm_platform_ioremap_resource(pdev, 0);
>>> +       if (IS_ERR(ctrl->base))
>>> +               return PTR_ERR(ctrl->base);
>>> +
>>> +       /* Clear any old interrupts and reset initial state */
>>> +       iowrite32(OTTO_WDT_INTR_PHASE_1 | OTTO_WDT_INTR_PHASE_2,
>>> +                       ctrl->base + OTTO_WDT_REG_INTR);
>>> +       iowrite32(OTTO_WDT_CTRL_DEFAULT, ctrl->base + OTTO_WDT_REG_CTRL);
>>> +
>>> +       ctrl->clk = devm_clk_get(dev, NULL);
>>> +       if (IS_ERR(ctrl->clk))
>>> +               return dev_err_probe(dev, PTR_ERR(ctrl->clk), "Failed to get clock\n");
> 
> ... and these checks when probing:
> 
> -- >8 --
> +       ret = clk_prepare_enable(ctrl->clk);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to enable clock\n");
> +
> +       ret = devm_add_action_or_reset(dev, otto_wdt_clock_action, ctrl->clk);
> +       if (ret)
> +               return ret;
> -- 8< --
> 
> 
> Best,
> Sander
> 
>>> +
>>> +       ctrl->irq_phase1 = platform_get_irq_byname(pdev, "phase1");
>>> +       if (ctrl->irq_phase1 < 0)
>>> +               return dev_err_probe(dev, ctrl->irq_phase1, "phase1 IRQ not found\n");
>>> +
>>> +       ret = devm_request_irq(dev, ctrl->irq_phase1, otto_wdt_phase1_isr, 0,
>>> +                       "realtek-otto-wdt", ctrl);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Failed to get IRQ for phase1\n");
>>> +
>>> +       ret = otto_wdt_probe_reset_mode(ctrl);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Invalid reset mode specified\n");
>>> +
>>> +       ctrl->wdev.parent = dev;
>>> +       ctrl->wdev.info = &otto_wdt_info;
>>> +       ctrl->wdev.ops = &otto_wdt_ops;
>>> +
>>> +       /*
>>> +        * Since pretimeout cannot be disabled, min. timeout is twice the
>>> +        * subsystem resolution. max. timeout is ca. 43s at a bus clock of 200MHz.
>>> +        */
>>> +       ctrl->wdev.min_timeout = 2;
>>> +       max_tick_ms = otto_wdt_tick_ms(ctrl, OTTO_WDT_PRESCALE_MAX);
>>> +       ctrl->wdev.max_hw_heartbeat_ms = max_tick_ms * OTTO_WDT_TIMEOUT_TICKS_MAX;
>>> +       ctrl->wdev.timeout = min(30U, ctrl->wdev.max_hw_heartbeat_ms / 1000);
>>> +
>>> +       watchdog_set_drvdata(&ctrl->wdev, ctrl);
>>> +       watchdog_init_timeout(&ctrl->wdev, 0, dev);
>>> +       watchdog_stop_on_reboot(&ctrl->wdev);
>>> +       watchdog_set_restart_priority(&ctrl->wdev, 128);
>>> +
>>> +       ret = otto_wdt_determine_timeouts(&ctrl->wdev, ctrl->wdev.timeout, 1);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Failed to set timeout\n");
>>> +
>>> +       return devm_watchdog_register_device(dev, &ctrl->wdev);
>>> +}
>>> +
>>> +static const struct of_device_id otto_wdt_ids[] = {
>>> +       { .compatible = "realtek,rtl8380-wdt" },
>>> +       { .compatible = "realtek,rtl8390-wdt" },
>>> +       { .compatible = "realtek,rtl9300-wdt" },
>>> +       { }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, otto_wdt_ids);
>>> +
>>> +static struct platform_driver otto_wdt_driver = {
>>> +       .probe = otto_wdt_probe,
>>> +       .driver = {
>>> +               .name = "realtek-otto-watchdog",
>>> +               .of_match_table = otto_wdt_ids,
>>> +       },
>>> +};
>>> +module_platform_driver(otto_wdt_driver);
>>> +
>>> +MODULE_LICENSE("GPL v2");
>>> +MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
>>> +MODULE_DESCRIPTION("Realtek Otto watchdog timer driver");
>>> -- 
>>> 2.31.1
>>>
> 

