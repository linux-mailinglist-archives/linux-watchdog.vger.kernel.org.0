Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C444C985
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2019 10:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfFTIdQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Jun 2019 04:33:16 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:48089 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfFTIdQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Jun 2019 04:33:16 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 05CC440011;
        Thu, 20 Jun 2019 08:33:10 +0000 (UTC)
Date:   Thu, 20 Jun 2019 10:33:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ken Sloat <KSloat@aampglobal.com>
Cc:     "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Message-ID: <20190620083309.GU23549@piout.net>
References: <20190614125310.29458-1-ksloat@aampglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614125310.29458-1-ksloat@aampglobal.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 14/06/2019 12:53:22+0000, Ken Sloat wrote:
> From: Ken Sloat <ksloat@aampglobal.com>
> 
> Currently, the atmel-sama5d4-wdt continues to run after system suspend.
> Unless the system resumes within the watchdog timeout period so the
> userspace can kick it, the system will be reset. This change disables
> the watchdog on suspend if it is active and re-enables on resume. These
> actions occur during the late and early phases of suspend and resume
> respectively to minimize chances where a lock could occur while the
> watchdog is disabled.
> 
> Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Changes in v2:
>  -Consolidate resume and resume early statements.
> 
>  drivers/watchdog/sama5d4_wdt.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 111695223aae..0d123f8cbcc6 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -280,7 +280,17 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
>  MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
>  
>  #ifdef CONFIG_PM_SLEEP
> -static int sama5d4_wdt_resume(struct device *dev)
> +static int sama5d4_wdt_suspend_late(struct device *dev)
> +{
> +	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd))
> +		sama5d4_wdt_stop(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static int sama5d4_wdt_resume_early(struct device *dev)
>  {
>  	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
>  
> @@ -291,12 +301,17 @@ static int sama5d4_wdt_resume(struct device *dev)
>  	 */
>  	sama5d4_wdt_init(wdt);
>  
> +	if (watchdog_active(&wdt->wdd))
> +		sama5d4_wdt_start(&wdt->wdd);
> +
>  	return 0;
>  }
>  #endif
>  
> -static SIMPLE_DEV_PM_OPS(sama5d4_wdt_pm_ops, NULL,
> -			 sama5d4_wdt_resume);
> +static const struct dev_pm_ops sama5d4_wdt_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(sama5d4_wdt_suspend_late,
> +			sama5d4_wdt_resume_early)
> +};
>  
>  static struct platform_driver sama5d4_wdt_driver = {
>  	.probe		= sama5d4_wdt_probe,
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
