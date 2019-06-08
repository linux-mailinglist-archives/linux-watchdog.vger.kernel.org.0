Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889D639FE2
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Jun 2019 15:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfFHNWV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 8 Jun 2019 09:22:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42164 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfFHNWU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 8 Jun 2019 09:22:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id l19so12541pgh.9;
        Sat, 08 Jun 2019 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gdlDSxgmJygh9iGXS45/TRQelC+MaFWRJsOZb3U80IM=;
        b=uV4sROfYJm9Zj7JdglhyLpg6DdGGl15TAesNl7fNxK3v6DFxnQtdHz2hMXi3ZTYcNl
         VKL2Eks9xaOkyuN2duhWlz658QH2/TiKfVeY6SJu1E7CfI7n3RdLebwaQXZO5uOGDPNt
         NIycH+RV4ndKWu9sPw1swOPgXEpP2FMYAXGKc9WbFZlxbyf2YLI0xtIdVPqiS2OT6E+5
         4li2ItB9pf+ElWhGx5+fAwtrPIwoBgV2jUKYqTGRBHouTFmBWrz88K0WPdbZeCe3MqPk
         jTtHb8XiNJyhTmcEHV36OA38ZdBk6hsf96EX0W3MWxUqiDrFxAhYZFQebCnoKSZBGx0f
         eTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gdlDSxgmJygh9iGXS45/TRQelC+MaFWRJsOZb3U80IM=;
        b=LzlNZLBb4FUI8OPpZLUo6KrmOruyL9x7+edY//5Jfcc2PLN6uKYJp4SI9A5qOr5M20
         Ar7iDi15ZNxQQBoqTUMqgmUrIjQbttymLHT/YRoOs4CNzgumo17WsiON4axJ0C+LDYZt
         LfUFa3dHyDdp++iSnFKi53KX0YMGxKSi1/jfq+QjF4YH0/cnNw80PwxoTWyZDlPP4yqb
         rs9nmCzU0UFD7/+I+F0d1AIo0tyF70ZiRw4ixxHksYuxlBf/V7BrZG5Bkhl5B3K/73mw
         R3IBxRGCGHt6GpsraEUILV8N4+AdlwRuV9q7RIgZ6bUyDGuwo0JE62WDjlno3TSb65my
         rf8A==
X-Gm-Message-State: APjAAAU9MpvmkIz31ruEqQFs667y8TCvJTGHPfdBVP8ND7ab+JhapU81
        K8LvTT4p9dP/qqGigP6OI7c=
X-Google-Smtp-Source: APXvYqy3vY/5aBoS+z8cKFu4woyGYgiCzKjpeM8lfraiFk0ck7N3zsb0HiDwAJAGCTG6gBW4Bib3ow==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr7353407pgb.353.1560000139594;
        Sat, 08 Jun 2019 06:22:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u20sm5329021pga.82.2019.06.08.06.22.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jun 2019 06:22:18 -0700 (PDT)
Subject: Re: [PATCH RESEND V4 3/3] watchdog: imx_sc: Add pretimeout support
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-3-git-send-email-Anson.Huang@nxp.com>
 <e49148ed-82ba-0878-e5ab-933f78f161d6@roeck-us.net>
 <DB3PR0402MB3916B5E657800C92566047A0F5160@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190607174053.GA15184@roeck-us.net>
 <DB3PR0402MB39166C5D43B1BF39998123C4F5110@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ba94ade3-fadb-6822-3db5-802ed7a0736b@roeck-us.net>
Date:   Sat, 8 Jun 2019 06:22:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB39166C5D43B1BF39998123C4F5110@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/8/19 2:32 AM, Anson Huang wrote:
> Hi, Guenter
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Saturday, June 8, 2019 1:41 AM
>> To: Anson Huang <anson.huang@nxp.com>
>> Cc: robh+dt@kernel.org; mark.rutland@arm.com; wim@linux-watchdog.org;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; Aisheng Dong <aisheng.dong@nxp.com>;
>> ulf.hansson@linaro.org; Daniel Baluta <daniel.baluta@nxp.com>; Peng Fan
>> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>
>> Subject: Re: [PATCH RESEND V4 3/3] watchdog: imx_sc: Add pretimeout
>> support
>>
>> On Wed, Jun 05, 2019 at 06:24:33AM +0000, Anson Huang wrote:
>>> Hi, Guenter
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>> Sent: Sunday, May 12, 2019 9:28 PM
>>>> To: Anson Huang <anson.huang@nxp.com>; robh+dt@kernel.org;
>>>> mark.rutland@arm.com; wim@linux-watchdog.org;
>> shawnguo@kernel.org;
>>>> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
>>>> Aisheng Dong <aisheng.dong@nxp.com>; ulf.hansson@linaro.org; Daniel
>>>> Baluta <daniel.baluta@nxp.com>; Peng Fan <peng.fan@nxp.com>;
>>>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>>>> watchdog@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>>>> Cc: dl-linux-imx <linux-imx@nxp.com>
>>>> Subject: Re: [PATCH RESEND V4 3/3] watchdog: imx_sc: Add pretimeout
>>>> support
>>>>
>>>> On 5/12/19 3:10 AM, Anson Huang wrote:
>>>>> i.MX system controller watchdog can support pretimeout IRQ via
>>>>> general SCU MU IRQ, it depends on IMX_SCU and driver MUST be
>>>>> probed after SCU IPC ready, then enable corresponding SCU IRQ
>>>>> group and register SCU IRQ notifier, when watchdog pretimeout IRQ
>>>>> fires, SCU MU IRQ will be handled and watchdog pretimeout notifier
>>>>> will be called to handle the event.
>>>>>
>>>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>>>
>>>> Revviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> Other patches waiting for DT review. IMX API feedback below.
>>>
>>> Shaw just picked up the DT patch. Would you please pick up this driver
>>> and dt-binding patch to you git repo?
>>>
>> I'll pick up patch 3/3, but I can not pick up patches into arch/arm64/boot/;
>> that is the responsibility of arm64 maintainers. I can only do that if I get an
>> explicit Ack and permission to do so from an arm64 maintainer, and I don't
>> recall getting that.
> 
> Will you also pick up 1/3, the DT binding patch, as DT binding normally go with
> driver, if NOT, please advise who should pick up this patch.
> 

Makes sense. Will do.

Guenter

> Thanks,
> Anson.
> 
>>
>> Guenter
>>
>>> Thanks,
>>> Anson
>>>
>>>>
>>>> Side note: This patch depends on 'firmware: imx: enable imx scu
>>>> general irq function' which is not yet in mainline.
>>>>
>>>>> ---
>>>>> No change, just resend patch with correct encoding.
>>>>> ---
>>>>>    drivers/watchdog/Kconfig      |   1 +
>>>>>    drivers/watchdog/imx_sc_wdt.c | 116
>>>> +++++++++++++++++++++++++++++++++++-------
>>>>>    2 files changed, 98 insertions(+), 19 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>>>> index 7ea6037..e08238c 100644
>>>>> --- a/drivers/watchdog/Kconfig
>>>>> +++ b/drivers/watchdog/Kconfig
>>>>> @@ -716,6 +716,7 @@ config IMX2_WDT
>>>>>    config IMX_SC_WDT
>>>>>    	tristate "IMX SC Watchdog"
>>>>>    	depends on HAVE_ARM_SMCCC
>>>>> +	depends on IMX_SCU
>>>>>    	select WATCHDOG_CORE
>>>>>    	help
>>>>>    	  This is the driver for the system controller watchdog diff
>>>>> --git a/drivers/watchdog/imx_sc_wdt.c
>>>>> b/drivers/watchdog/imx_sc_wdt.c index 49848b6..6ecc03f 100644
>>>>> --- a/drivers/watchdog/imx_sc_wdt.c
>>>>> +++ b/drivers/watchdog/imx_sc_wdt.c
>>>>> @@ -4,6 +4,7 @@
>>>>>     */
>>>>>
>>>>>    #include <linux/arm-smccc.h>
>>>>> +#include <linux/firmware/imx/sci.h>
>>>>>    #include <linux/io.h>
>>>>>    #include <linux/init.h>
>>>>>    #include <linux/kernel.h>
>>>>> @@ -33,11 +34,19 @@
>>>>>
>>>>>    #define SC_TIMER_WDOG_ACTION_PARTITION	0
>>>>>
>>>>> +#define SC_IRQ_WDOG			1
>>>>> +#define SC_IRQ_GROUP_WDOG		1
>>>>> +
>>>>>    static bool nowayout = WATCHDOG_NOWAYOUT;
>>>>>    module_param(nowayout, bool, 0000);
>>>>>    MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once
>>>> started (default="
>>>>>    		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>>>>
>>>>> +struct imx_sc_wdt_device {
>>>>> +	struct watchdog_device wdd;
>>>>> +	struct notifier_block wdt_notifier; };
>>>>> +
>>>>>    static int imx_sc_wdt_ping(struct watchdog_device *wdog)
>>>>>    {
>>>>>    	struct arm_smccc_res res;
>>>>> @@ -85,24 +94,66 @@ static int imx_sc_wdt_set_timeout(struct
>>>> watchdog_device *wdog,
>>>>>    	return res.a0 ? -EACCES : 0;
>>>>>    }
>>>>>
>>>>> +static int imx_sc_wdt_set_pretimeout(struct watchdog_device *wdog,
>>>>> +				     unsigned int pretimeout) {
>>>>> +	struct arm_smccc_res res;
>>>>> +
>>>>> +	arm_smccc_smc(IMX_SIP_TIMER,
>>>> IMX_SIP_TIMER_SET_PRETIME_WDOG,
>>>>> +		      pretimeout * 1000, 0, 0, 0, 0, 0, &res);
>>>>> +	if (res.a0)
>>>>> +		return -EACCES;
>>>>> +
>>>>> +	wdog->pretimeout = pretimeout;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int imx_sc_wdt_notify(struct notifier_block *nb,
>>>>> +			     unsigned long event, void *group) {
>>>>> +	struct imx_sc_wdt_device *imx_sc_wdd =
>>>>> +				 container_of(nb,
>>>>> +					      struct imx_sc_wdt_device,
>>>>> +					      wdt_notifier);
>>>>> +
>>>>> +	if (event & SC_IRQ_WDOG &&
>>>>> +	    *(u8 *)group == SC_IRQ_GROUP_WDOG)
>>>>> +		watchdog_notify_pretimeout(&imx_sc_wdd->wdd);
>>>>
>>>> This should really not be necessary. Event mask and target group (if
>>>> needed with a wildcard for the group) should be parameters of
>>>> imx_scu_irq_register_notifier(), and be handled in the imx code.
>>>>
>>>> Also, passing 'group' as pointed seems excessive. Might as well pass
>>>> it directly.
>>>>
>>>> Guenter
>>>>
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static void imx_sc_wdt_action(void *data) {
>>>>> +	struct notifier_block *wdt_notifier = data;
>>>>> +
>>>>> +	imx_scu_irq_unregister_notifier(wdt_notifier);
>>>>> +	imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>>>>> +				 SC_IRQ_WDOG,
>>>>> +				 false);
>>>>> +}
>>>>> +
>>>>>    static const struct watchdog_ops imx_sc_wdt_ops = {
>>>>>    	.owner = THIS_MODULE,
>>>>>    	.start = imx_sc_wdt_start,
>>>>>    	.stop  = imx_sc_wdt_stop,
>>>>>    	.ping  = imx_sc_wdt_ping,
>>>>>    	.set_timeout = imx_sc_wdt_set_timeout,
>>>>> +	.set_pretimeout = imx_sc_wdt_set_pretimeout,
>>>>>    };
>>>>>
>>>>> -static const struct watchdog_info imx_sc_wdt_info = {
>>>>> +static struct watchdog_info imx_sc_wdt_info = {
>>>>>    	.identity	= "i.MX SC watchdog timer",
>>>>>    	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
>>>>> -			  WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
>>>>> +			  WDIOF_MAGICCLOSE,
>>>>>    };
>>>>>
>>>>>    static int imx_sc_wdt_probe(struct platform_device *pdev)
>>>>>    {
>>>>> +	struct imx_sc_wdt_device *imx_sc_wdd;
>>>>> +	struct watchdog_device *wdog;
>>>>>    	struct device *dev = &pdev->dev;
>>>>> -	struct watchdog_device *imx_sc_wdd;
>>>>>    	int ret;
>>>>>
>>>>>    	imx_sc_wdd = devm_kzalloc(dev, sizeof(*imx_sc_wdd),
>>>>> GFP_KERNEL);
>>>> @@
>>>>> -111,42 +162,69 @@ static int imx_sc_wdt_probe(struct
>>>>> platform_device
>>>>> *pdev)
>>>>>
>>>>>    	platform_set_drvdata(pdev, imx_sc_wdd);
>>>>>
>>>>> -	imx_sc_wdd->info = &imx_sc_wdt_info;
>>>>> -	imx_sc_wdd->ops = &imx_sc_wdt_ops;
>>>>> -	imx_sc_wdd->min_timeout = 1;
>>>>> -	imx_sc_wdd->max_timeout = MAX_TIMEOUT;
>>>>> -	imx_sc_wdd->parent = dev;
>>>>> -	imx_sc_wdd->timeout = DEFAULT_TIMEOUT;
>>>>> +	wdog = &imx_sc_wdd->wdd;
>>>>> +	wdog->info = &imx_sc_wdt_info;
>>>>> +	wdog->ops = &imx_sc_wdt_ops;
>>>>> +	wdog->min_timeout = 1;
>>>>> +	wdog->max_timeout = MAX_TIMEOUT;
>>>>> +	wdog->parent = dev;
>>>>> +	wdog->timeout = DEFAULT_TIMEOUT;
>>>>>
>>>>> -	watchdog_init_timeout(imx_sc_wdd, 0, dev);
>>>>> -	watchdog_stop_on_reboot(imx_sc_wdd);
>>>>> -	watchdog_stop_on_unregister(imx_sc_wdd);
>>>>> +	watchdog_init_timeout(wdog, 0, dev);
>>>>> +	watchdog_stop_on_reboot(wdog);
>>>>> +	watchdog_stop_on_unregister(wdog);
>>>>>
>>>>> -	ret = devm_watchdog_register_device(dev, imx_sc_wdd);
>>>>> +	ret = devm_watchdog_register_device(dev, wdog);
>>>>>    	if (ret) {
>>>>>    		dev_err(dev, "Failed to register watchdog device\n");
>>>>>    		return ret;
>>>>>    	}
>>>>>
>>>>> +	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>>>>> +				       SC_IRQ_WDOG,
>>>>> +				       true);
>>>>> +	if (ret) {
>>>>> +		dev_warn(dev, "Enable irq failed, pretimeout NOT
>>>> supported\n");
>>>>> +		return 0;
>>>>> +	}
>>>>> +
>>>>> +	imx_sc_wdd->wdt_notifier.notifier_call = imx_sc_wdt_notify;
>>>>> +	ret = imx_scu_irq_register_notifier(&imx_sc_wdd->wdt_notifier);
>>>>> +	if (ret) {
>>>>> +		imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>>>>> +					 SC_IRQ_WDOG,
>>>>> +					 false);
>>>>> +		dev_warn(dev,
>>>>> +			 "Register irq notifier failed, pretimeout NOT
>>>> supported\n");
>>>>> +		return 0;
>>>>> +	}
>>>>> +
>>>>> +	ret = devm_add_action_or_reset(dev, imx_sc_wdt_action,
>>>>> +				       &imx_sc_wdd->wdt_notifier);
>>>>> +	if (!ret)
>>>>> +		imx_sc_wdt_info.options |= WDIOF_PRETIMEOUT;
>>>>> +	else
>>>>> +		dev_warn(dev, "Add action failed, pretimeout NOT
>>>> supported\n");
>>>>> +
>>>>>    	return 0;
>>>>>    }
>>>>>
>>>>>    static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
>>>>>    {
>>>>> -	struct watchdog_device *imx_sc_wdd = dev_get_drvdata(dev);
>>>>> +	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
>>>>>
>>>>> -	if (watchdog_active(imx_sc_wdd))
>>>>> -		imx_sc_wdt_stop(imx_sc_wdd);
>>>>> +	if (watchdog_active(&imx_sc_wdd->wdd))
>>>>> +		imx_sc_wdt_stop(&imx_sc_wdd->wdd);
>>>>>
>>>>>    	return 0;
>>>>>    }
>>>>>
>>>>>    static int __maybe_unused imx_sc_wdt_resume(struct device *dev)
>>>>>    {
>>>>> -	struct watchdog_device *imx_sc_wdd = dev_get_drvdata(dev);
>>>>> +	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
>>>>>
>>>>> -	if (watchdog_active(imx_sc_wdd))
>>>>> -		imx_sc_wdt_start(imx_sc_wdd);
>>>>> +	if (watchdog_active(&imx_sc_wdd->wdd))
>>>>> +		imx_sc_wdt_start(&imx_sc_wdd->wdd);
>>>>>
>>>>>    	return 0;
>>>>>    }
>>>>>
>>>

