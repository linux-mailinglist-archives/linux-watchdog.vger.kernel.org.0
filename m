Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 455BE643C8
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2019 10:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbfGJIss (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Jul 2019 04:48:48 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:34471 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbfGJIss (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Jul 2019 04:48:48 -0400
Received: from sapphire.tkos.co.il (unknown [192.168.100.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 0A8684400C6;
        Wed, 10 Jul 2019 11:48:45 +0300 (IDT)
Date:   Wed, 10 Jul 2019 11:48:43 +0300
From:   Baruch Siach <baruch@tkos.co.il>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: digicolor_wdt: drop unused variable
Message-ID: <20190710084843.53e36lykqpzenatk@sapphire.tkos.co.il>
References: <20190710080904.317599-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710080904.317599-1-arnd@arndb.de>
User-Agent: NeoMutt/20180716
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Arnd,

On Wed, Jul 10, 2019 at 10:08:57AM +0200, Arnd Bergmann wrote:
> The last cleanup patch left behind an unused variable
> that should have been removed as well:
> 
> drivers/watchdog/digicolor_wdt.c:121:6: error: unused variable 'ret' [-Werror,-Wunused-variable]
> 
> Fixes: cdad26977e3f ("watchdog: digicolor_wdt: drop warning after registering device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

>  drivers/watchdog/digicolor_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
> index 33cda95bd238..073d37867f47 100644
> --- a/drivers/watchdog/digicolor_wdt.c
> +++ b/drivers/watchdog/digicolor_wdt.c
> @@ -118,7 +118,6 @@ static int dc_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct dc_wdt *wdt;
> -	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(struct dc_wdt), GFP_KERNEL);
>  	if (!wdt)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
