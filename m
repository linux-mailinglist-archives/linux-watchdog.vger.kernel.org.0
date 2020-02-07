Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56BF4155A26
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Feb 2020 15:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgBGO4E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Feb 2020 09:56:04 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40120 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGO4E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Feb 2020 09:56:04 -0500
Received: by mail-pf1-f194.google.com with SMTP id q8so1398531pfh.7
        for <linux-watchdog@vger.kernel.org>; Fri, 07 Feb 2020 06:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ayNLLHZ/41PB8hUezppgt9M0f3GTvitzaur+YPrwKSM=;
        b=Ej9v+eAXTbIof6iQFtDP0pLD47hDZdGHdOxgtz30uhPrSUY00v86ka9pQWWb83d7hE
         LPeiOaBweyFSwbBmdjaQdu5WeYwQeJmuoe22UeuFkIWy2JF2xbazrQZUSD0l9xNhRN+T
         gLBQhWJ5PLf3J5kqpRc5Tomz5nzSnx+W5dH/U5mW3NojviOW/iebz4VO0MJRASec22q+
         a0XLfDLptMVs6/FEjprwNG3Xt98Ut1AI1OoivqECaYsrOlje0X1+cfHC0rORWdxvavuC
         RfXp/OQDrMZJ8lYPz7BJBdnDk8FD0YmT58ykyC8vhlr0E5zOJfa/p3Kcrj+GICCMkFl4
         UC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ayNLLHZ/41PB8hUezppgt9M0f3GTvitzaur+YPrwKSM=;
        b=hn5wGSVEEGQYXWjfnT5ytlKrWHkmF6JK/tCL/cEWsnru8EAWYiQJnsuLPrQQCf3WQ+
         gkUYN26luqvoiHBUqli5FqL93gbYeSMIFCWYBX5vr6qpODFtL8/KblwnZcoYweJrtnUR
         QIzZ5fSe5KXF9rstr+8waRZKlCHjP/vDw4mMxarAuQd5ExJYM3mkbsqo2UZOUgjAkKcU
         ++Uybkn4lpqeYKv830qdVJB/QtApZ4KVzUoj3pCXFFV1VqtaJ980C2D+UcDGYjnMh1DU
         tIS0OS0NJJ7HXzXf4aqBJDPtd/iiuXzFgxyi1wwALXwVuOEUyC57rn8sLDJV5uKyrVV8
         3/ig==
X-Gm-Message-State: APjAAAUvA2PemMzoKUHzm5+lz7Nh+QuiucFu8wPK5iAUGbOhvBwFsNX+
        etdag7tOL8sgsHKSAOUF9jJon/jt
X-Google-Smtp-Source: APXvYqz140UbqTFGn2Xvd7z2wovDP1oyYVY6nfTDJLFs65yn3qy1ubXlLmfaBtHzgre0CRx+Tjl5ZA==
X-Received: by 2002:aa7:9d87:: with SMTP id f7mr10278027pfq.138.1581087363401;
        Fri, 07 Feb 2020 06:56:03 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q8sm3008493pje.2.2020.02.07.06.56.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 06:56:02 -0800 (PST)
Date:   Fri, 7 Feb 2020 06:56:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: da9062: fix power management ops
Message-ID: <20200207145601.GA14662@roeck-us.net>
References: <20200207071518.5559-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207071518.5559-1-m.felsch@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 07, 2020 at 08:15:18AM +0100, Marco Felsch wrote:
> This fixes commit f6c98b08381c ("watchdog: da9062: add power management
> ops"). During discussion [1] we agreed that this should be configurable
> because it is a device quirk if we can't use the hw watchdog auto
> suspend function.
> 
> [1] https://lore.kernel.org/linux-watchdog/20191128171931.22563-1-m.felsch@pengutronix.de/
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Hi,
> 
> unfortunately I forgot to add an v2 tag [2] and Guenter took the
> wrong patch version. It is completely my fault anyway this should be
> part of the next rc tag for 5.6. The device property should be applied
> already so this patch adds only the usage and therefore don't include
> the dt-folks in the to: and cc:.
> 
> Regards,
>   Marco
> 
> [2] https://lkml.org/lkml/2020/1/8/210
> 
>  drivers/watchdog/da9062_wdt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 47eefe072b40..77b6b5336067 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -16,6 +16,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/mfd/da9062/registers.h>
>  #include <linux/mfd/da9062/core.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
>  
> @@ -31,6 +32,7 @@ static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
>  struct da9062_watchdog {
>  	struct da9062 *hw;
>  	struct watchdog_device wdtdev;
> +	bool use_sw_pm;
>  };
>  
>  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
> @@ -200,6 +202,8 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  	if (!wdt)
>  		return -ENOMEM;
>  
> +	wdt->use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
> +
>  	wdt->hw = chip;
>  
>  	wdt->wdtdev.info = &da9062_watchdog_info;
> @@ -226,6 +230,10 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  static int __maybe_unused da9062_wdt_suspend(struct device *dev)
>  {
>  	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> +
> +	if (!wdt->use_sw_pm)
> +		return 0;
>  
>  	if (watchdog_active(wdd))
>  		return da9062_wdt_stop(wdd);
> @@ -236,6 +244,10 @@ static int __maybe_unused da9062_wdt_suspend(struct device *dev)
>  static int __maybe_unused da9062_wdt_resume(struct device *dev)
>  {
>  	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> +
> +	if (!wdt->use_sw_pm)
> +		return 0;
>  
>  	if (watchdog_active(wdd))
>  		return da9062_wdt_start(wdd);
> -- 
> 2.20.1
> 
