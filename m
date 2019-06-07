Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3159139376
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 19:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbfFGRk4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 13:40:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34949 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbfFGRk4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 13:40:56 -0400
Received: by mail-pg1-f195.google.com with SMTP id s27so1529762pgl.2;
        Fri, 07 Jun 2019 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0V/DIvCRbzkJddEXcA5wyYmclosO4j53pSlNS1OHge4=;
        b=P1hdLfqJ9bNPNS2TrvnTMlvTdY0CYkYcvVvjn9EH1gNmpz3Xa/8/ipOBmI/ibQYu8b
         9aHrN1RX7kcml2htDeoD6zZTagSN0Afy/oMXJ/ozRn7T7sj5FbeIkE9X4SfGJ2fhLhA9
         OpaQkJ94YOS/lwi6/xlstdO+Y0ibYrIweUuBkVu2zV24Xu+DAQUiV0AVq6fOeSOryWXF
         sbmSRirkH6Hp0OwyAjUQzp0y3y14sZ8QEWUCLWrlZb+xUyiKXc0FIMpfCl/durvD7I8r
         5lcR20ZGOk0s3xvrFDG7r1WDysG3k+XdctIa+lqdRrHrRcoeMgx7HRF1+OayrlNeAG8E
         kgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0V/DIvCRbzkJddEXcA5wyYmclosO4j53pSlNS1OHge4=;
        b=jvfvzBNOk9ptGXcJu5L8AonBvQ9klbkoorSwWUkRt5GCmGa0blmt1eR5gWcd1Mn/wg
         H0EgcBSk7lPilVOSIbvxRS4b0JUEYjH8Gjzzbh83ixXMnhKGpo79fmwoBIDwtFEdSF/X
         QrAaZ/GQ2tOJN3zsjFdwfBewU9nKwpK8Vcf6ojRjQCFtp5U4r0jM3Z2LNDeF+xi6v5Y7
         CsRuQBe+3moNdKa4NjsAlZUTRNbqecdWYhwgrsKKbR2uovLGbkT8Nr2wx0t7WFwd/JgF
         TydyximO/gSzzD2J0f+PjW4gJW8gwOjhVvVRtNetGzQXVnRtwfMZVhEHY8KugdlYs68W
         FBfg==
X-Gm-Message-State: APjAAAXI9TWMpDj4hTR2Bp2PQr50x76mIBdukbKhJploubA493xyr9xf
        N4yemPjQKRWMvqzcgvtS/z0=
X-Google-Smtp-Source: APXvYqzcYtPwU3T8i78qheKrh7jr7ml3uzLreQGCaARqeK3wSzTdGjgOvhMxncF1eigqwFt1dkOd9A==
X-Received: by 2002:a17:90a:bb94:: with SMTP id v20mr7143639pjr.88.1559929255290;
        Fri, 07 Jun 2019 10:40:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ds13sm2436877pjb.5.2019.06.07.10.40.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:40:54 -0700 (PDT)
Date:   Fri, 7 Jun 2019 10:40:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
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
Subject: Re: [PATCH RESEND V4 3/3] watchdog: imx_sc: Add pretimeout support
Message-ID: <20190607174053.GA15184@roeck-us.net>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-3-git-send-email-Anson.Huang@nxp.com>
 <e49148ed-82ba-0878-e5ab-933f78f161d6@roeck-us.net>
 <DB3PR0402MB3916B5E657800C92566047A0F5160@DB3PR0402MB3916.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB3916B5E657800C92566047A0F5160@DB3PR0402MB3916.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 05, 2019 at 06:24:33AM +0000, Anson Huang wrote:
> Hi, Guenter
> 
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: Sunday, May 12, 2019 9:28 PM
> > To: Anson Huang <anson.huang@nxp.com>; robh+dt@kernel.org;
> > mark.rutland@arm.com; wim@linux-watchdog.org; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > Aisheng Dong <aisheng.dong@nxp.com>; ulf.hansson@linaro.org; Daniel
> > Baluta <daniel.baluta@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > watchdog@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Cc: dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH RESEND V4 3/3] watchdog: imx_sc: Add pretimeout
> > support
> > 
> > On 5/12/19 3:10 AM, Anson Huang wrote:
> > > i.MX system controller watchdog can support pretimeout IRQ via general
> > > SCU MU IRQ, it depends on IMX_SCU and driver MUST be probed after SCU
> > > IPC ready, then enable corresponding SCU IRQ group and register SCU
> > > IRQ notifier, when watchdog pretimeout IRQ fires, SCU MU IRQ will be
> > > handled and watchdog pretimeout notifier will be called to handle the
> > > event.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > 
> > Revviewed-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > Other patches waiting for DT review. IMX API feedback below.
> 
> Shaw just picked up the DT patch. Would you please pick up this driver and dt-binding patch
> to you git repo?
> 
I'll pick up patch 3/3, but I can not pick up patches into arch/arm64/boot/;
that is the responsibility of arm64 maintainers. I can only do that
if I get an explicit Ack and permission to do so from an arm64 maintainer,
and I don't recall getting that.

Guenter

> Thanks,
> Anson
> 
> > 
> > Side note: This patch depends on 'firmware: imx: enable imx scu general irq
> > function' which is not yet in mainline.
> > 
> > > ---
> > > No change, just resend patch with correct encoding.
> > > ---
> > >   drivers/watchdog/Kconfig      |   1 +
> > >   drivers/watchdog/imx_sc_wdt.c | 116
> > +++++++++++++++++++++++++++++++++++-------
> > >   2 files changed, 98 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig index
> > > 7ea6037..e08238c 100644
> > > --- a/drivers/watchdog/Kconfig
> > > +++ b/drivers/watchdog/Kconfig
> > > @@ -716,6 +716,7 @@ config IMX2_WDT
> > >   config IMX_SC_WDT
> > >   	tristate "IMX SC Watchdog"
> > >   	depends on HAVE_ARM_SMCCC
> > > +	depends on IMX_SCU
> > >   	select WATCHDOG_CORE
> > >   	help
> > >   	  This is the driver for the system controller watchdog diff --git
> > > a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c index
> > > 49848b6..6ecc03f 100644
> > > --- a/drivers/watchdog/imx_sc_wdt.c
> > > +++ b/drivers/watchdog/imx_sc_wdt.c
> > > @@ -4,6 +4,7 @@
> > >    */
> > >
> > >   #include <linux/arm-smccc.h>
> > > +#include <linux/firmware/imx/sci.h>
> > >   #include <linux/io.h>
> > >   #include <linux/init.h>
> > >   #include <linux/kernel.h>
> > > @@ -33,11 +34,19 @@
> > >
> > >   #define SC_TIMER_WDOG_ACTION_PARTITION	0
> > >
> > > +#define SC_IRQ_WDOG			1
> > > +#define SC_IRQ_GROUP_WDOG		1
> > > +
> > >   static bool nowayout = WATCHDOG_NOWAYOUT;
> > >   module_param(nowayout, bool, 0000);
> > >   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once
> > started (default="
> > >   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > >
> > > +struct imx_sc_wdt_device {
> > > +	struct watchdog_device wdd;
> > > +	struct notifier_block wdt_notifier;
> > > +};
> > > +
> > >   static int imx_sc_wdt_ping(struct watchdog_device *wdog)
> > >   {
> > >   	struct arm_smccc_res res;
> > > @@ -85,24 +94,66 @@ static int imx_sc_wdt_set_timeout(struct
> > watchdog_device *wdog,
> > >   	return res.a0 ? -EACCES : 0;
> > >   }
> > >
> > > +static int imx_sc_wdt_set_pretimeout(struct watchdog_device *wdog,
> > > +				     unsigned int pretimeout)
> > > +{
> > > +	struct arm_smccc_res res;
> > > +
> > > +	arm_smccc_smc(IMX_SIP_TIMER,
> > IMX_SIP_TIMER_SET_PRETIME_WDOG,
> > > +		      pretimeout * 1000, 0, 0, 0, 0, 0, &res);
> > > +	if (res.a0)
> > > +		return -EACCES;
> > > +
> > > +	wdog->pretimeout = pretimeout;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int imx_sc_wdt_notify(struct notifier_block *nb,
> > > +			     unsigned long event, void *group) {
> > > +	struct imx_sc_wdt_device *imx_sc_wdd =
> > > +				 container_of(nb,
> > > +					      struct imx_sc_wdt_device,
> > > +					      wdt_notifier);
> > > +
> > > +	if (event & SC_IRQ_WDOG &&
> > > +	    *(u8 *)group == SC_IRQ_GROUP_WDOG)
> > > +		watchdog_notify_pretimeout(&imx_sc_wdd->wdd);
> > 
> > This should really not be necessary. Event mask and target group (if needed
> > with a wildcard for the group) should be parameters of
> > imx_scu_irq_register_notifier(), and be handled in the imx code.
> > 
> > Also, passing 'group' as pointed seems excessive. Might as well pass it
> > directly.
> > 
> > Guenter
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void imx_sc_wdt_action(void *data) {
> > > +	struct notifier_block *wdt_notifier = data;
> > > +
> > > +	imx_scu_irq_unregister_notifier(wdt_notifier);
> > > +	imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> > > +				 SC_IRQ_WDOG,
> > > +				 false);
> > > +}
> > > +
> > >   static const struct watchdog_ops imx_sc_wdt_ops = {
> > >   	.owner = THIS_MODULE,
> > >   	.start = imx_sc_wdt_start,
> > >   	.stop  = imx_sc_wdt_stop,
> > >   	.ping  = imx_sc_wdt_ping,
> > >   	.set_timeout = imx_sc_wdt_set_timeout,
> > > +	.set_pretimeout = imx_sc_wdt_set_pretimeout,
> > >   };
> > >
> > > -static const struct watchdog_info imx_sc_wdt_info = {
> > > +static struct watchdog_info imx_sc_wdt_info = {
> > >   	.identity	= "i.MX SC watchdog timer",
> > >   	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> > > -			  WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
> > > +			  WDIOF_MAGICCLOSE,
> > >   };
> > >
> > >   static int imx_sc_wdt_probe(struct platform_device *pdev)
> > >   {
> > > +	struct imx_sc_wdt_device *imx_sc_wdd;
> > > +	struct watchdog_device *wdog;
> > >   	struct device *dev = &pdev->dev;
> > > -	struct watchdog_device *imx_sc_wdd;
> > >   	int ret;
> > >
> > >   	imx_sc_wdd = devm_kzalloc(dev, sizeof(*imx_sc_wdd), GFP_KERNEL);
> > @@
> > > -111,42 +162,69 @@ static int imx_sc_wdt_probe(struct platform_device
> > > *pdev)
> > >
> > >   	platform_set_drvdata(pdev, imx_sc_wdd);
> > >
> > > -	imx_sc_wdd->info = &imx_sc_wdt_info;
> > > -	imx_sc_wdd->ops = &imx_sc_wdt_ops;
> > > -	imx_sc_wdd->min_timeout = 1;
> > > -	imx_sc_wdd->max_timeout = MAX_TIMEOUT;
> > > -	imx_sc_wdd->parent = dev;
> > > -	imx_sc_wdd->timeout = DEFAULT_TIMEOUT;
> > > +	wdog = &imx_sc_wdd->wdd;
> > > +	wdog->info = &imx_sc_wdt_info;
> > > +	wdog->ops = &imx_sc_wdt_ops;
> > > +	wdog->min_timeout = 1;
> > > +	wdog->max_timeout = MAX_TIMEOUT;
> > > +	wdog->parent = dev;
> > > +	wdog->timeout = DEFAULT_TIMEOUT;
> > >
> > > -	watchdog_init_timeout(imx_sc_wdd, 0, dev);
> > > -	watchdog_stop_on_reboot(imx_sc_wdd);
> > > -	watchdog_stop_on_unregister(imx_sc_wdd);
> > > +	watchdog_init_timeout(wdog, 0, dev);
> > > +	watchdog_stop_on_reboot(wdog);
> > > +	watchdog_stop_on_unregister(wdog);
> > >
> > > -	ret = devm_watchdog_register_device(dev, imx_sc_wdd);
> > > +	ret = devm_watchdog_register_device(dev, wdog);
> > >   	if (ret) {
> > >   		dev_err(dev, "Failed to register watchdog device\n");
> > >   		return ret;
> > >   	}
> > >
> > > +	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> > > +				       SC_IRQ_WDOG,
> > > +				       true);
> > > +	if (ret) {
> > > +		dev_warn(dev, "Enable irq failed, pretimeout NOT
> > supported\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	imx_sc_wdd->wdt_notifier.notifier_call = imx_sc_wdt_notify;
> > > +	ret = imx_scu_irq_register_notifier(&imx_sc_wdd->wdt_notifier);
> > > +	if (ret) {
> > > +		imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> > > +					 SC_IRQ_WDOG,
> > > +					 false);
> > > +		dev_warn(dev,
> > > +			 "Register irq notifier failed, pretimeout NOT
> > supported\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	ret = devm_add_action_or_reset(dev, imx_sc_wdt_action,
> > > +				       &imx_sc_wdd->wdt_notifier);
> > > +	if (!ret)
> > > +		imx_sc_wdt_info.options |= WDIOF_PRETIMEOUT;
> > > +	else
> > > +		dev_warn(dev, "Add action failed, pretimeout NOT
> > supported\n");
> > > +
> > >   	return 0;
> > >   }
> > >
> > >   static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
> > >   {
> > > -	struct watchdog_device *imx_sc_wdd = dev_get_drvdata(dev);
> > > +	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
> > >
> > > -	if (watchdog_active(imx_sc_wdd))
> > > -		imx_sc_wdt_stop(imx_sc_wdd);
> > > +	if (watchdog_active(&imx_sc_wdd->wdd))
> > > +		imx_sc_wdt_stop(&imx_sc_wdd->wdd);
> > >
> > >   	return 0;
> > >   }
> > >
> > >   static int __maybe_unused imx_sc_wdt_resume(struct device *dev)
> > >   {
> > > -	struct watchdog_device *imx_sc_wdd = dev_get_drvdata(dev);
> > > +	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
> > >
> > > -	if (watchdog_active(imx_sc_wdd))
> > > -		imx_sc_wdt_start(imx_sc_wdd);
> > > +	if (watchdog_active(&imx_sc_wdd->wdd))
> > > +		imx_sc_wdt_start(&imx_sc_wdd->wdd);
> > >
> > >   	return 0;
> > >   }
> > >
> 
