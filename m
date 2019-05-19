Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31DDD227EA
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 May 2019 19:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfESRn4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 May 2019 13:43:56 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:59238 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbfESRn4 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 May 2019 13:43:56 -0400
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 2F69844034A;
        Sun, 19 May 2019 08:55:14 +0300 (IDT)
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com> <20190518212801.31010-12-wsa+renesas@sang-engineering.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 11/46] watchdog: digicolor_wdt: drop warning after registering device
In-reply-to: <20190518212801.31010-12-wsa+renesas@sang-engineering.com>
Date:   Sun, 19 May 2019 08:55:13 +0300
Message-ID: <87y3332dku.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wolfram,

On Sun, May 19 2019, Wolfram Sang wrote:
> The core will print out details now.

devm_watchdog_register_device() might return -ENOMEM when devres_alloc()
fails without printing anything. You might consider that a non-issue
since small memory allocation never fail in practice[1].

But then __watchdog_unregister_device() does some sanity checks,
potentially returning -EINVAL without any print:

        if (wdd == NULL || wdd->info == NULL || wdd->ops == NULL)
                return -EINVAL;

        /* Mandatory operations need to be supported */
        if (!wdd->ops->start || (!wdd->ops->stop && !wdd->max_hw_heartbeat_ms))
                return -EINVAL;

Do you consider that not important/likely enough to be worth an error
message in the driver?

baruch

[1] https://lwn.net/Articles/627419/

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/watchdog/digicolor_wdt.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
> index 8af6e9a67d0d..33cda95bd238 100644
> --- a/drivers/watchdog/digicolor_wdt.c
> +++ b/drivers/watchdog/digicolor_wdt.c
> @@ -141,13 +141,7 @@ static int dc_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_restart_priority(&dc_wdt_wdd, 128);
>  	watchdog_init_timeout(&dc_wdt_wdd, timeout, dev);
>  	watchdog_stop_on_reboot(&dc_wdt_wdd);
> -	ret = devm_watchdog_register_device(dev, &dc_wdt_wdd);
> -	if (ret) {
> -		dev_err(dev, "Failed to register watchdog device");
> -		return ret;
> -	}
> -
> -	return 0;
> +	return devm_watchdog_register_device(dev, &dc_wdt_wdd);
>  }
>  
>  static const struct of_device_id dc_wdt_of_match[] = {


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
