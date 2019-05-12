Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53D01AC63
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 May 2019 15:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfELN2T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 May 2019 09:28:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34545 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfELN2S (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 May 2019 09:28:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id n19so5706851pfa.1;
        Sun, 12 May 2019 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9iYSr35LjsO+433vGXia3esy4nWZCsmPULrEXsBAJzw=;
        b=CeyfySyrOmPphPqLRUEGrd/qZVZgYg0MASuRTv4Z5j8/VwW5zFl2IW1LyKSxfTVRF4
         W1hBhUlo1wXDuta7vYT4M8e0NetY7I8ucPKM51WV361WgDKl3wEnszsG8QyU8AAHbMl0
         QkO/1OluyfHxhvHRbxGozh3HeJAvun2hOv1H4kE2AsjG4C7J5g9qyTLCmkjZNu7ls11V
         GAfPdyWzV8kAseWjkqr9UXBOz97PRTiLCWwr1M0UL2phQB1VFbYr6RlIf1tdmwKcuMXI
         Ha1rmQYz6lkm7M3Rq/rEIoRXKjJCfP+SkTUeA4xmtBR3N0uBWGU7rTWtp6zGYJhI9tQw
         yYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9iYSr35LjsO+433vGXia3esy4nWZCsmPULrEXsBAJzw=;
        b=VhJw1xUgT1TRJEHoGyw0YD93JuTp5sAircE1uq666tEX+/yUOVrU6AJKe5WXb7AGgg
         ylo5lmz8l6D574pRXS60mp3JC0RDbcanGdcfntC9+y6D7aXWN4sbPcUpy5C8ZEq0qSfk
         /9AFgS0vAacY40fI2703ILLpXdTQtZh0K2uq2LwlmcLYiX1Co/cAwq8imvlEHlXXG9G4
         n0NXqcuA0JUlrXJDv8kXmZBDaIBYL7mUFcdqvBs+eQW/1rfkEBX8ItwMVsEyy/wOAcuA
         MmM1BisnOw+CIgQNdBGNaRHOSP8sWEEGxIXotdBm0syTlQ91d0mYplcU9fsFlLzsthP6
         u0Rg==
X-Gm-Message-State: APjAAAXZiBg3S5NDs15QOePTqFfHvuofWfMMor/L6LEdILci7Dz9S7lk
        3ofDKZpNv39/i9qz98woT3I=
X-Google-Smtp-Source: APXvYqycIDg2AXzlbXvbal4yxV5hWYnJG4Yl6TuDt8zkcMxPKxhstBZ3mnGJRbP7LxGEWcliwIwceQ==
X-Received: by 2002:a62:38d3:: with SMTP id f202mr23405366pfa.41.1557667697212;
        Sun, 12 May 2019 06:28:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 15sm15785312pfo.117.2019.05.12.06.28.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 06:28:16 -0700 (PDT)
Subject: Re: [PATCH RESEND V4 3/3] watchdog: imx_sc: Add pretimeout support
To:     Anson Huang <anson.huang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-3-git-send-email-Anson.Huang@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e49148ed-82ba-0878-e5ab-933f78f161d6@roeck-us.net>
Date:   Sun, 12 May 2019 06:28:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557655528-12816-3-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/12/19 3:10 AM, Anson Huang wrote:
> i.MX system controller watchdog can support pretimeout IRQ
> via general SCU MU IRQ, it depends on IMX_SCU and driver MUST
> be probed after SCU IPC ready, then enable corresponding SCU
> IRQ group and register SCU IRQ notifier, when watchdog pretimeout
> IRQ fires, SCU MU IRQ will be handled and watchdog pretimeout
> notifier will be called to handle the event.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Revviewed-by: Guenter Roeck <linux@roeck-us.net>

Other patches waiting for DT review. IMX API feedback below.

Side note: This patch depends on 'firmware: imx: enable
imx scu general irq function' which is not yet in mainline.

> ---
> No change, just resend patch with correct encoding.
> ---
>   drivers/watchdog/Kconfig      |   1 +
>   drivers/watchdog/imx_sc_wdt.c | 116 +++++++++++++++++++++++++++++++++++-------
>   2 files changed, 98 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7ea6037..e08238c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -716,6 +716,7 @@ config IMX2_WDT
>   config IMX_SC_WDT
>   	tristate "IMX SC Watchdog"
>   	depends on HAVE_ARM_SMCCC
> +	depends on IMX_SCU
>   	select WATCHDOG_CORE
>   	help
>   	  This is the driver for the system controller watchdog
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index 49848b6..6ecc03f 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/arm-smccc.h>
> +#include <linux/firmware/imx/sci.h>
>   #include <linux/io.h>
>   #include <linux/init.h>
>   #include <linux/kernel.h>
> @@ -33,11 +34,19 @@
>   
>   #define SC_TIMER_WDOG_ACTION_PARTITION	0
>   
> +#define SC_IRQ_WDOG			1
> +#define SC_IRQ_GROUP_WDOG		1
> +
>   static bool nowayout = WATCHDOG_NOWAYOUT;
>   module_param(nowayout, bool, 0000);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> +struct imx_sc_wdt_device {
> +	struct watchdog_device wdd;
> +	struct notifier_block wdt_notifier;
> +};
> +
>   static int imx_sc_wdt_ping(struct watchdog_device *wdog)
>   {
>   	struct arm_smccc_res res;
> @@ -85,24 +94,66 @@ static int imx_sc_wdt_set_timeout(struct watchdog_device *wdog,
>   	return res.a0 ? -EACCES : 0;
>   }
>   
> +static int imx_sc_wdt_set_pretimeout(struct watchdog_device *wdog,
> +				     unsigned int pretimeout)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_PRETIME_WDOG,
> +		      pretimeout * 1000, 0, 0, 0, 0, 0, &res);
> +	if (res.a0)
> +		return -EACCES;
> +
> +	wdog->pretimeout = pretimeout;
> +
> +	return 0;
> +}
> +
> +static int imx_sc_wdt_notify(struct notifier_block *nb,
> +			     unsigned long event, void *group)
> +{
> +	struct imx_sc_wdt_device *imx_sc_wdd =
> +				 container_of(nb,
> +					      struct imx_sc_wdt_device,
> +					      wdt_notifier);
> +
> +	if (event & SC_IRQ_WDOG &&
> +	    *(u8 *)group == SC_IRQ_GROUP_WDOG)
> +		watchdog_notify_pretimeout(&imx_sc_wdd->wdd);

This should really not be necessary. Event mask and target group
(if needed with a wildcard for the group) should be parameters of
imx_scu_irq_register_notifier(), and be handled in the imx code.

Also, passing 'group' as pointed seems excessive. Might as well
pass it directly.

Guenter

> +
> +	return 0;
> +}
> +
> +static void imx_sc_wdt_action(void *data)
> +{
> +	struct notifier_block *wdt_notifier = data;
> +
> +	imx_scu_irq_unregister_notifier(wdt_notifier);
> +	imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> +				 SC_IRQ_WDOG,
> +				 false);
> +}
> +
>   static const struct watchdog_ops imx_sc_wdt_ops = {
>   	.owner = THIS_MODULE,
>   	.start = imx_sc_wdt_start,
>   	.stop  = imx_sc_wdt_stop,
>   	.ping  = imx_sc_wdt_ping,
>   	.set_timeout = imx_sc_wdt_set_timeout,
> +	.set_pretimeout = imx_sc_wdt_set_pretimeout,
>   };
>   
> -static const struct watchdog_info imx_sc_wdt_info = {
> +static struct watchdog_info imx_sc_wdt_info = {
>   	.identity	= "i.MX SC watchdog timer",
>   	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> -			  WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
> +			  WDIOF_MAGICCLOSE,
>   };
>   
>   static int imx_sc_wdt_probe(struct platform_device *pdev)
>   {
> +	struct imx_sc_wdt_device *imx_sc_wdd;
> +	struct watchdog_device *wdog;
>   	struct device *dev = &pdev->dev;
> -	struct watchdog_device *imx_sc_wdd;
>   	int ret;
>   
>   	imx_sc_wdd = devm_kzalloc(dev, sizeof(*imx_sc_wdd), GFP_KERNEL);
> @@ -111,42 +162,69 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, imx_sc_wdd);
>   
> -	imx_sc_wdd->info = &imx_sc_wdt_info;
> -	imx_sc_wdd->ops = &imx_sc_wdt_ops;
> -	imx_sc_wdd->min_timeout = 1;
> -	imx_sc_wdd->max_timeout = MAX_TIMEOUT;
> -	imx_sc_wdd->parent = dev;
> -	imx_sc_wdd->timeout = DEFAULT_TIMEOUT;
> +	wdog = &imx_sc_wdd->wdd;
> +	wdog->info = &imx_sc_wdt_info;
> +	wdog->ops = &imx_sc_wdt_ops;
> +	wdog->min_timeout = 1;
> +	wdog->max_timeout = MAX_TIMEOUT;
> +	wdog->parent = dev;
> +	wdog->timeout = DEFAULT_TIMEOUT;
>   
> -	watchdog_init_timeout(imx_sc_wdd, 0, dev);
> -	watchdog_stop_on_reboot(imx_sc_wdd);
> -	watchdog_stop_on_unregister(imx_sc_wdd);
> +	watchdog_init_timeout(wdog, 0, dev);
> +	watchdog_stop_on_reboot(wdog);
> +	watchdog_stop_on_unregister(wdog);
>   
> -	ret = devm_watchdog_register_device(dev, imx_sc_wdd);
> +	ret = devm_watchdog_register_device(dev, wdog);
>   	if (ret) {
>   		dev_err(dev, "Failed to register watchdog device\n");
>   		return ret;
>   	}
>   
> +	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> +				       SC_IRQ_WDOG,
> +				       true);
> +	if (ret) {
> +		dev_warn(dev, "Enable irq failed, pretimeout NOT supported\n");
> +		return 0;
> +	}
> +
> +	imx_sc_wdd->wdt_notifier.notifier_call = imx_sc_wdt_notify;
> +	ret = imx_scu_irq_register_notifier(&imx_sc_wdd->wdt_notifier);
> +	if (ret) {
> +		imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> +					 SC_IRQ_WDOG,
> +					 false);
> +		dev_warn(dev,
> +			 "Register irq notifier failed, pretimeout NOT supported\n");
> +		return 0;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, imx_sc_wdt_action,
> +				       &imx_sc_wdd->wdt_notifier);
> +	if (!ret)
> +		imx_sc_wdt_info.options |= WDIOF_PRETIMEOUT;
> +	else
> +		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
> +
>   	return 0;
>   }
>   
>   static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
>   {
> -	struct watchdog_device *imx_sc_wdd = dev_get_drvdata(dev);
> +	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
>   
> -	if (watchdog_active(imx_sc_wdd))
> -		imx_sc_wdt_stop(imx_sc_wdd);
> +	if (watchdog_active(&imx_sc_wdd->wdd))
> +		imx_sc_wdt_stop(&imx_sc_wdd->wdd);
>   
>   	return 0;
>   }
>   
>   static int __maybe_unused imx_sc_wdt_resume(struct device *dev)
>   {
> -	struct watchdog_device *imx_sc_wdd = dev_get_drvdata(dev);
> +	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
>   
> -	if (watchdog_active(imx_sc_wdd))
> -		imx_sc_wdt_start(imx_sc_wdd);
> +	if (watchdog_active(&imx_sc_wdd->wdd))
> +		imx_sc_wdt_start(&imx_sc_wdd->wdd);
>   
>   	return 0;
>   }
> 

