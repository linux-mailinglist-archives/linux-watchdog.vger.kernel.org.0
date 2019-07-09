Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4825163C9E
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbfGIUQZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:16:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44556 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbfGIUQY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:16:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so7576018plr.11
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Jul 2019 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DzPH/ocOC99djQtOLl28byRkWGiTGk++LPWQ7/uAzvc=;
        b=jwId8KXEI2qMa8LYrITp0kCQhFEM6tqrhY/nq+LtVPp8q1jD7vebjBY1QeUY1qwFmQ
         eML4EawOPIVDUZux6tORy9PrfhqWHU29jAEj9tf9ioz/zrP4POw4yi9O9Abp5IuQOBU8
         6Sym1r9NehZl4H54H5PPdhn02JiPIcinyrGwg09a57OUASjyEaMfXmVF1h46/PLt9qKj
         FSOUMIjttOtcPLMQog+SVYr1Gk8ItBHF+hZOXO1aHyIc6aM0GFmKFZQDrNlnb6KvcwDB
         ZplBvZErqnwOm1+CV9zIxSL+IJaPi7dSo2Jfh3edzOImKuHUDVga8CP2y10xbJS9aPLo
         cvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=DzPH/ocOC99djQtOLl28byRkWGiTGk++LPWQ7/uAzvc=;
        b=mJ3LVbxXp7zwmzLx+qcb3jVPSrDanh1H2Mn+A0zvxNyqklZJimnRSrnn5FyQ0zudyy
         Fu5APsMnnIjrLXT1aq7cmAiH48FCKlOEAMRtqYcgQW0YVOaylXBdeEmJPcKf83fQ/pau
         /xnz7uvNnX1OSZfJMtNA88y1PTLZfHYD9MikEJYsNh5jICDEwaeAScSSc3eRQsdPS6kc
         zGNN7ddSH69Ngvzev6tSnLLc67tvT6Wu5f7vkgZkI75pC/cLsk4Oh63NN//TKbdTR6D0
         OH9tFTxvgVn8rtS4MsSuWnYAPZP2snZ+WVyzwB/WZxgt2xtkN8cScRWAMGslQbpdIEHw
         11GA==
X-Gm-Message-State: APjAAAXWUIbfvv3BQi4NUHq4WiPANOCxpWOLDwpFovtp9zIW6Of5SBRV
        9pd0833GIbF9ykL6s8HVXe0=
X-Google-Smtp-Source: APXvYqyTDAj9T3UghwfCpzXZMkhrM0IUa45MVY1/ATEmeWI8utPow7Nx99xgNZPjG7Ba2CtBeUdU3A==
X-Received: by 2002:a17:902:724c:: with SMTP id c12mr31919062pll.219.1562703384275;
        Tue, 09 Jul 2019 13:16:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k8sm27497887pgm.14.2019.07.09.13.16.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 13:16:23 -0700 (PDT)
Date:   Tue, 9 Jul 2019 13:16:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] watchdog: cadence_wdt: Group struct member init
 statements
Message-ID: <20190709201622.GC27937@roeck-us.net>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-4-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709200801.42313-4-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 09, 2019 at 08:09:06PM +0000, Melin Tomas wrote:
> Move init statement and remove stray comment.
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/cadence_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index a0d7666e7d20..0bdb275d904a 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -330,6 +330,7 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	cdns_wdt_device = &wdt->cdns_wdt_device;
> +	cdns_wdt_device->parent = dev;
>  	cdns_wdt_device->info = &cdns_wdt_info;
>  	cdns_wdt_device->ops = &cdns_wdt_ops;
>  	cdns_wdt_device->timeout = CDNS_WDT_DEFAULT_TIMEOUT;
> @@ -356,9 +357,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/* Initialize the members of cdns_wdt structure */
> -	cdns_wdt_device->parent = dev;
> -
>  	watchdog_init_timeout(cdns_wdt_device, wdt_timeout, dev);
>  	watchdog_set_nowayout(cdns_wdt_device, nowayout);
>  	watchdog_stop_on_reboot(cdns_wdt_device);
> -- 
> 2.17.2
> 
