Return-Path: <linux-watchdog+bounces-3755-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7BAAEBF0F
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 20:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DB6B168648
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 18:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E4A2EAB8A;
	Fri, 27 Jun 2025 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VtwgYHH6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08291E0E00;
	Fri, 27 Jun 2025 18:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049099; cv=none; b=RRN+TzRcBnTl8WlReWWO8u3JSMFpJ+Rh81PgYAex9YGqNJxCRea0H6d4v05eqiCyG80DPdrv1S/03OVeAOj9w1CtYnYSnZ1EI71LdTDZB+ju8ylAPAuKVR84xKSq+9EkaVCutlyW0XHuLwhgI0AhlD8LfWA9OlVog4sxIAonTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049099; c=relaxed/simple;
	bh=96qoqGEGVdnAX8QpuygeTA1TC0XltmIypgFTfajk9nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D41v5A2U2qdrJX9w8QArNfCyk3qtjuGZqNP7m6D4cHvudzmuQCJL9SQpGJ8VmCVLeICiV+0lMwtDDLmhUNQ9YJp1y5Gry9mrygJEK7zfWJBdOrZfae9MvRI2D6xvOCVWMjvZqqJwpxnO+vmEu92R7EHR59Wxmy3UNYofTNN58jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VtwgYHH6; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RIV8u82813254;
	Fri, 27 Jun 2025 13:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751049068;
	bh=JRbaxnkTkZMDCwScqng54pu0iNXDXjKP0blla/5kMUw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VtwgYHH6Ua0w8FnfvQHjTy6h2vYlAFkdEjyx7ml0oxEckoBNc+TJvKsc/Al5XsKtU
	 MHFKc6KUtvOGYel4PjVIS59uULMlT+BD73TCujxcaWOsHg41qvGGgBIuZLCK9hBYQ0
	 JlBzscJ2PX3GOvZEA3ZC8NvZSICbElmu2LVuJ/V4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RIV8Vk696729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 13:31:08 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 13:31:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 13:31:08 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RIV7DN3525813;
	Fri, 27 Jun 2025 13:31:07 -0500
Message-ID: <8fbe03d0-ee45-4b1f-92ec-bebf6d7b9041@ti.com>
Date: Fri, 27 Jun 2025 13:31:07 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: rti_wdt: Add reaction control
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250625143338.2381726-1-jm@ti.com>
 <20250625143338.2381726-3-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250625143338.2381726-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/25/25 9:33 AM, Judith Mendez wrote:
> This allows to configure reaction between NMI and reset for WWD.
> 
> On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
> to the ESM module which can subsequently route the signal to safety
> master or SoC reset. On AM62L, the watchdog reset output is routed
> to the SoC HW reset block. So, add a new compatible for AM62l to add
> SoC data and configure reaction to reset instead of NMI.

Should this be something we configure, not selected based on device,
do we know if all user of AM62L want the device reset on WDT?

> 
> [0] https://www.ti.com/product/AM62L
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v1-resend:
> - no change
> ---
>   drivers/watchdog/rti_wdt.c | 31 +++++++++++++++++++++++++++----
>   1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index d1f9ce4100a8..d419884c86c4 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -35,7 +35,8 @@
>   #define RTIWWDRXCTRL	0xa4
>   #define RTIWWDSIZECTRL	0xa8
>   
> -#define RTIWWDRX_NMI	0xa
> +#define RTIWWDRXN_RST	0x5
> +#define RTIWWDRXN_NMI	0xa
>   
>   #define RTIWWDSIZE_50P		0x50
>   #define RTIWWDSIZE_25P		0x500
> @@ -63,22 +64,29 @@
>   
>   static int heartbeat;
>   
> +struct rti_wdt_data {
> +	bool reset;
> +};
> +
>   /*
>    * struct to hold data for each WDT device
>    * @base - base io address of WD device
>    * @freq - source clock frequency of WDT
>    * @wdd  - hold watchdog device as is in WDT core
> + * @data - hold configuration data
>    */
>   struct rti_wdt_device {
>   	void __iomem		*base;
>   	unsigned long		freq;
>   	struct watchdog_device	wdd;
> +	const struct rti_wdt_data *data;
>   };
>   
>   static int rti_wdt_start(struct watchdog_device *wdd)
>   {
>   	u32 timer_margin;
>   	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
> +	u8 reaction;
>   	int ret;
>   
>   	ret = pm_runtime_resume_and_get(wdd->parent);
> @@ -101,8 +109,12 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>   	 */
>   	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
>   
> -	/* Generate NMI when wdt expires */
> -	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
> +	/* Generate reset or NMI when timer expires/serviced outside of window */
> +	reaction = RTIWWDRXN_NMI;
> +	if (wdt->data->reset)
> +		reaction = RTIWWDRXN_RST;
> +

Suggest:

/* Reset device if wdt serviced outside of window or generate NMI if available */
if (wdt->data->reset)
	reaction = RTIWWDRXN_RST;
else
	reaction = RTIWWDRXN_NMI;

> +	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
>   
>   	/* Open window size 50%; this is the largest window size available */
>   	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
> @@ -255,6 +267,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>   	wdd->timeout = DEFAULT_HEARTBEAT;
>   	wdd->parent = dev;
>   
> +	wdt->data = of_device_get_match_data(dev);

You can use device_get_match_data() here.

Andrew

> +
>   	watchdog_set_drvdata(wdd, wdt);
>   	watchdog_set_nowayout(wdd, 1);
>   	watchdog_set_restart_priority(wdd, 128);
> @@ -369,8 +383,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
>   	pm_runtime_disable(&pdev->dev);
>   }
>   
> +static struct rti_wdt_data j7_wdt = {
> +	.reset = false,
> +};
> +
> +static struct rti_wdt_data am62l_wdt = {
> +	.reset = true,
> +};
> +
>   static const struct of_device_id rti_wdt_of_match[] = {
> -	{ .compatible = "ti,j7-rti-wdt", },
> +	{ .compatible = "ti,j7-rti-wdt", .data = &j7_wdt },
> +	{ .compatible = "ti,am62l-rti-wdt", .data = &am62l_wdt },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, rti_wdt_of_match);

