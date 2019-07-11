Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2094B65296
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2019 09:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfGKHnn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jul 2019 03:43:43 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:34542 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbfGKHnn (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jul 2019 03:43:43 -0400
Received: from tarshish (unknown [10.0.8.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 834F344039B;
        Thu, 11 Jul 2019 10:43:39 +0300 (IDT)
References: <20190711064019.60916-1-yuehaibing@huawei.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        wsa+renesas@sang-engineering.com, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] watchdog: digicolor_wdt: remove unused variable 'ret'
In-reply-to: <20190711064019.60916-1-yuehaibing@huawei.com>
Date:   Thu, 11 Jul 2019 10:43:39 +0300
Message-ID: <874l3tow2c.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi YueHaibing,

On Thu, Jul 11 2019, YueHaibing wrote:
> commit cdad26977e3f ("watchdog: digicolor_wdt: drop
> warning after registering device") left this unused
> variable, it can be removed.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Third time's a charm:

https://patchwork.kernel.org/patch/11037487/
https://patchwork.kernel.org/patch/11038317/

baruch

>  drivers/watchdog/digicolor_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
> index 33cda95..073d378 100644
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
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
