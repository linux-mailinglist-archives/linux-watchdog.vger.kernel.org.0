Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329F54C4B87
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Feb 2022 17:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239850AbiBYQ6c (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Feb 2022 11:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240859AbiBYQ6b (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Feb 2022 11:58:31 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE301C912;
        Fri, 25 Feb 2022 08:57:58 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id s5so8030229oic.10;
        Fri, 25 Feb 2022 08:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=1ELBaJBdixa5rbWePvlE13cfBAqcaAUoLyB1QkqbJRc=;
        b=jxw7sZdyIhrwzIwKfg1LN4j/7GzxDhT1Gc7d3VBAXvoh7lkjAIi4PMq7WXW0+oaztF
         CMteu6j3FkwdOtZkIk4OWhC/aFUsTXbjHeuqjJqAHqglqE9t5SuumoJsxa+NMCrzrTMy
         rdCdfit2UDiPw6DtYcB2f94gzCpS8QYXnzJtum0IjHFHel9VCcoBFaXRMHsmsBZFOfpM
         WYt8pwWogPpbrJ+NqLXIjHu6vA6MLzNObvLb6nwr3aXvGC3zAmXib517vd5zzqoYS5aB
         EtS4SR90MMDM8TZAo4VEYCFr7Z+aFNtOyxNm7AzeINeHSIQCa8//CEcWN2SVmq3/Z9YB
         16tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=1ELBaJBdixa5rbWePvlE13cfBAqcaAUoLyB1QkqbJRc=;
        b=ZXATWu8k8IHItczE2NU+XzCmY0RCDuc0XK4Rw/HEGm0u7V8t5iIJ8kH4KhhBLFFyAI
         CItpYgNVIQvYGfumgtG5+a6JV7bm3PAW5PnoqyMSsqPqEO4oRmIT91lQIdqeBwZgwpeI
         JleylI9wjiMjkoXJjfOE7LOINgS+ZUBLFG0PRGCv8aqtvvqkv/gci3wFfXBJBVx0z0uU
         An4BM0/4NYtVVS5BNbbOzelaVbr/neEcBhZQJpO+TqHLOwJwssTSqV4F+HQRPpuCORGI
         m77ddbXpPUIbQe70o5cWjlsZocYA90WbXCcawWO5r7+E3XNsYb49fuzVvP10ZjQ6CdRz
         DY3g==
X-Gm-Message-State: AOAM5339+m87b6r+G8dD5xnWA27IR46VKbWNAgdOhbRxicaZrK62hdGJ
        kPh4i6DKTopc+216zNq3lI0=
X-Google-Smtp-Source: ABdhPJwsrWb7mEU4iBKdCdVNcY+8rldH6+t4NkdSbBGkH53T5lDWIzRItoXYD+bD0yFxtVnvcBLNmA==
X-Received: by 2002:a05:6808:bcd:b0:2d5:1cb2:3c with SMTP id o13-20020a0568080bcd00b002d51cb2003cmr127515oik.85.1645808277361;
        Fri, 25 Feb 2022 08:57:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x60-20020a9d20c2000000b005acf97a030csm1319126ota.9.2022.02.25.08.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 08:57:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6620b35b-5475-fe6d-5149-d8cb4fb834d5@roeck-us.net>
Date:   Fri, 25 Feb 2022 08:57:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Xiantao Hu <xt.hu@cqplus1.com>, wim@linux-watchdog.org,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     wells.lu@sunplus.com, qinjian@cqplus1.com
References: <20220224074242.6944-1-xt.hu@cqplus1.com>
 <20220224074242.6944-3-xt.hu@cqplus1.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v6 2/2] watchdog: Add watchdog driver for Sunplus SP7021
In-Reply-To: <20220224074242.6944-3-xt.hu@cqplus1.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/23/22 23:42, Xiantao Hu wrote:
> Sunplus SP7021 requires watchdog timer support.
> Add watchdog driver to enable this.
> 
> Signed-off-by: Xiantao Hu <xt.hu@cqplus1.com>
> ---
> Changes in v6:
>   - Addressed all comments from Mr. Guenter Roeck.
>     Drop the sp_wdt_set_timeout().
>     Fix devm_add_action_or_reset() called.
>   - Remove the SIMPLE_DEV_PM_OPS.
>   - Simplify code.
>   - Change GPL version.
> 
>   MAINTAINERS                    |   1 +
>   drivers/watchdog/Kconfig       |  11 ++
>   drivers/watchdog/Makefile      |   1 +
>   drivers/watchdog/sunplus_wdt.c | 218 +++++++++++++++++++++++++++++++++
>   4 files changed, 231 insertions(+)
>   create mode 100644 drivers/watchdog/sunplus_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe6cc971c..a1b3d76e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18247,6 +18247,7 @@ M:	Xiantao Hu <xt.hu@cqplus1.com>
>   L:	linux-watchdog@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/watchdog/sunplus,sp7021-wdt.yaml
> +F:	drivers/watchdog/sunplus_wdt.c
>   
>   SUPERH
>   M:	Yoshinori Sato <ysato@users.sourceforge.jp>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 9d222ba17..d3dbe8695 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -976,6 +976,17 @@ config MSC313E_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called msc313e_wdt.
>   
> +config SUNPLUS_WATCHDOG
> +	tristate "Sunplus watchdog support"
> +	depends on ARCH_SUNPLUS || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for the watchdog timer
> +	  in Sunplus SoCs.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called sunplus_wdt.
> +
>   # X86 (i386 + ia64 + x86_64) Architecture
>   
>   config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee970641..0fa548ee6 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
>   obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>   obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
>   obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
> +obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>   
>   # X86 (i386 + ia64 + x86_64) Architecture
>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/sunplus_wdt.c b/drivers/watchdog/sunplus_wdt.c
> new file mode 100644
> index 000000000..19604b4fc
> --- /dev/null
> +++ b/drivers/watchdog/sunplus_wdt.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * sunplus Watchdog Driver
> + *
> + * Copyright (C) 2021 Sunplus Technology Co., Ltd.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/watchdog.h>
> +
> +#define WDT_CTRL		0x00
> +#define WDT_CNT			0x04
> +
> +#define WDT_STOP		0x3877
> +#define WDT_RESUME		0x4A4B
> +#define WDT_CLRIRQ		0x7482
> +#define WDT_UNLOCK		0xAB00
> +#define WDT_LOCK		0xAB01
> +#define WDT_CONMAX		0xDEAF
> +
> +#define SP_WDT_MAX_TIMEOUT	11U
> +#define SP_WDT_DEFAULT_TIMEOUT	10
> +
> +#define STC_CLK			90000
> +
> +#define DEVICE_NAME		"sunplus-wdt"
> +
> +static unsigned int timeout;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct sp_wdt_priv {
> +	struct watchdog_device wdev;
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct reset_control *rstc;
> +};
> +
> +static int sp_wdt_restart(struct watchdog_device *wdev,
> +			  unsigned long action, void *data)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +
> +	writel(WDT_STOP, base + WDT_CTRL);
> +	writel(WDT_UNLOCK, base + WDT_CTRL);
> +	writel(0x0001, base + WDT_CNT);
> +	writel(WDT_LOCK, base + WDT_CTRL);
> +	writel(WDT_RESUME, base + WDT_CTRL);
> +
> +	return 0;
> +}
> +
> +/* TIMEOUT_MAX = ffff0/90kHz =11.65,so longer than 11 seconds will time out */
> +static int sp_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +	u32 count;
> +	u32 actual;
> +
> +	actual = min(wdev->timeout, SP_WDT_MAX_TIMEOUT);
> +
> +	if (actual > SP_WDT_MAX_TIMEOUT) {

This is never true. because actual is set to the minimum of wdev->timeout
and SP_WDT_MAX_TIMEOUT. It is also not clear to me what this code path
is supposed to be doing, compared to the code below. Please fix and add
a comment explaining the code (ie what does writing WDT_CONMAX into
the control register do ?)

> +		writel(WDT_CONMAX, base + WDT_CTRL);
> +	} else {
> +		writel(WDT_UNLOCK, base + WDT_CTRL);
> +		/* tiemrw_cnt[3:0]can't be write,only [19:4] can be write. */

timerw_cnd ?, space before can't, and s/write/written/g.

> +		count = (actual * STC_CLK) >> 4;

so this is (actual * 90000) >> 4 and does set bit 0..3. Is that intentional
or is it supposed to be << 4 ? The comment above does not really explain
the calculation; if anything, it just creates confusion.

> +		writel(count, base + WDT_CNT);
> +		writel(WDT_LOCK, base + WDT_CTRL);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sp_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +
> +	writel(WDT_STOP, base + WDT_CTRL);
> +
> +	return 0;
> +}
> +
> +static int sp_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +
> +	writel(WDT_RESUME, base + WDT_CTRL);
> +
> +	return 0;
> +}
> +
> +static unsigned int sp_wdt_get_timeleft(struct watchdog_device *wdev)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +	u32 val;
> +
> +	val = readl(base + WDT_CNT);
> +	val &= 0xffff;
> +	val = val << 4;
> +
> +	return val;
> +}
> +
> +static const struct watchdog_info sp_wdt_info = {
> +	.identity	= DEVICE_NAME,
> +	.options	= WDIOF_SETTIMEOUT |
> +			  WDIOF_MAGICCLOSE |
> +			  WDIOF_KEEPALIVEPING,
> +};
> +
> +static const struct watchdog_ops sp_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= sp_wdt_start,
> +	.stop		= sp_wdt_stop,
> +	.ping		= sp_wdt_ping,
> +	.get_timeleft	= sp_wdt_get_timeleft,
> +	.restart	= sp_wdt_restart,
> +};
> +
> +static void sp_clk_disable_unprepare(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}
> +
> +static void sp_reset_control_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +
> +static int sp_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sp_wdt_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get clock\n");
> +
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable clock\n");
> +
> +	ret = devm_add_action_or_reset(dev, sp_clk_disable_unprepare, priv->clk);
> +	if (ret)
> +		return ret;
> +
> +	/* The timer and watchdog shared the STC reset */
> +	priv->rstc = devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(dev, PTR_ERR(priv->rstc), "Failed to get reset\n");
> +
> +	reset_control_deassert(priv->rstc);
> +
> +	ret = devm_add_action_or_reset(dev, sp_reset_control_assert, priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->wdev.info = &sp_wdt_info;
> +	priv->wdev.ops = &sp_wdt_ops;
> +	priv->wdev.timeout = SP_WDT_DEFAULT_TIMEOUT;
> +	priv->wdev.max_hw_heartbeat_ms = SP_WDT_MAX_TIMEOUT * 1000;
> +	priv->wdev.min_timeout = 1;
> +	priv->wdev.parent = dev;
> +
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	watchdog_init_timeout(&priv->wdev, timeout, dev);
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_stop_on_reboot(&priv->wdev);
> +	watchdog_set_restart_priority(&priv->wdev, 128);
> +
> +	return devm_watchdog_register_device(dev, &priv->wdev);
> +}
> +
> +static const struct of_device_id sp_wdt_of_match[] = {
> +	{.compatible = "sunplus,sp7021-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sp_wdt_of_match);
> +
> +static struct platform_driver sp_wdt_driver = {
> +	.probe = sp_wdt_probe,
> +	.driver = {
> +		   .name = DEVICE_NAME,
> +		   .of_match_table = sp_wdt_of_match,
> +	},
> +};
> +
> +module_platform_driver(sp_wdt_driver);
> +
> +MODULE_AUTHOR("Xiantao Hu <xt.hu@cqplus1.com>");
> +MODULE_DESCRIPTION("Sunplus Watchdog Timer Driver");
> +MODULE_LICENSE("GPL");

