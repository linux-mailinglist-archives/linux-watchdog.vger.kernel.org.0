Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9CEF258C7
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 22:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfEUUWU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 16:22:20 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50135 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbfEUUWU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 16:22:20 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 77831FF80A;
        Tue, 21 May 2019 20:22:17 +0000 (UTC)
Date:   Tue, 21 May 2019 22:22:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 36/46] watchdog: sama5d4_wdt: drop warning after
 registering device
Message-ID: <20190521202217.GK3274@piout.net>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
 <20190518212801.31010-37-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518212801.31010-37-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 18/05/2019 23:27:51+0200, Wolfram Sang wrote:
> The core will print out details now.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/watchdog/sama5d4_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 111695223aae..5adcb047cb94 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -260,10 +260,8 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_stop_on_unregister(wdd);
>  	ret = devm_watchdog_register_device(dev, wdd);
> -	if (ret) {
> -		dev_err(dev, "failed to register watchdog device\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	platform_set_drvdata(pdev, wdt);
>  
> -- 
> 2.19.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
