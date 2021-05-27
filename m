Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46901392DA7
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 14:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbhE0ML3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 08:11:29 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:4462 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234823AbhE0ML2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 08:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1622117395; x=1653653395;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=GWvEg4IV6zL4Fh2MbxpUdkFg5SRh5H07fK90blYJjA8=;
  b=J0UAsP+OAapXvIrygQahNXGtuLByc2m4+eRwq5dIbWOLiqDzHBVf5pSO
   RNFRIRCjKSwtZx0f8J+hqzl0rSkYTyd5XaneVW8yxOKOmp8t1/NZr+zLp
   pcHp7ogEQNEC75KFHbvxxeHEKc9KMeV01aa2RaYsEBbgn5Cy9oj73sMB1
   XAAfe6xfR/QFb/enpIOR9wNt4knckXra1Nux6qUn92dL41MKZASAojQEw
   rcZr9A+a4LsjvZ/Dx0AifI0DRDXBvOUD40BgbHAG2OvOqTvvoHRORlROm
   kiutlWtq2iI/jPdSco5bIQXyBCUemGua8pWrtY6zQRE36FGJHwqxFOMUF
   g==;
IronPort-SDR: E484UwaJBZ8Uqr3xegsAk3THrANGz4bycYOfin35Fs+wOmx1B0o6p3cI7gd9uQIVn1KviKBnDI
 y90bf9clhfH1Yv6zxc4K3pRGAP5/IPljdzmGVf/pEScMPK6KoQ50fVGMQFzNy6OhkVTdEfGIp6
 3gAw94d1vyS44BVOSfuifJHNgi7WFTbhoSflkHuJpVVh4H72b8UAKD1gwn1z1Autr8ZoWW4Igg
 X+7YeO3jjHMW1bHN/ibZ8OoIjKd67KzNq8JG/W1Hr7p3c7etxA8U/Sn88O0yYjwOg7VQz6JzFm
 fqE=
X-IronPort-AV: E=Sophos;i="5.82,334,1613458800"; 
   d="scan'208";a="57032799"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2021 05:09:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 05:09:53 -0700
Received: from [10.12.73.99] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 27 May 2021 05:09:51 -0700
Subject: Re: [PATCH 2/3] watchdog: sama5d4_wdt: add support for sama7g5-wdt
To:     Eugen Hristev <eugen.hristev@microchip.com>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>
CC:     <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
 <20210527100120.266796-2-eugen.hristev@microchip.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <f9b29938-c9a0-4cb0-cc0f-e9c83c5c0c27@microchip.com>
Date:   Thu, 27 May 2021 14:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527100120.266796-2-eugen.hristev@microchip.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 27/05/2021 at 12:01, Eugen Hristev wrote:
> Add support for compatible sama7g5-wdt.
> The sama7g5 wdt is the same hardware block as on sam9x60.
> Adapt the driver to use the sam9x60/sama7g5 variant if either
> of the two compatibles are selected (sam9x60-wdt/sama7g5-wdt).
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

> ---
>   drivers/watchdog/sama5d4_wdt.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index e5d11d6a2600..ec20ad4e534f 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -268,8 +268,10 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>   	wdd->min_timeout = MIN_WDT_TIMEOUT;
>   	wdd->max_timeout = MAX_WDT_TIMEOUT;
>   	wdt->last_ping = jiffies;
> -	wdt->sam9x60_support = of_device_is_compatible(dev->of_node,
> -						       "microchip,sam9x60-wdt");
> +
> +	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
> +	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
> +		wdt->sam9x60_support = true;
>   
>   	watchdog_set_drvdata(wdd, wdt);
>   
> @@ -329,6 +331,10 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
>   	{
>   		.compatible = "microchip,sam9x60-wdt",
>   	},
> +	{
> +		.compatible = "microchip,sama7g5-wdt",
> +	},
> +
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
> 


-- 
Nicolas Ferre
