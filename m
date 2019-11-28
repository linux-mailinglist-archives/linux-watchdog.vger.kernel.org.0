Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E62E210CE03
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Nov 2019 18:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfK1RmA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Nov 2019 12:42:00 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39126 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfK1RmA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Nov 2019 12:42:00 -0500
Received: by mail-ot1-f68.google.com with SMTP id 77so1570643oty.6
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Nov 2019 09:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xu/9Hp9YE79V3gEOl+iOuZxTKMv0URI3ITMz34Tl5nQ=;
        b=X4Y0WJAjvRH/eGd5CdIZW+PFeJccSU4UGI9NNKoBZFTGrDcekjwt80wbKoJsIE1ebe
         o+j582DQs2mkhx+vTTrW8bP6d2WknT9HDpY3uJW2oR4fSNdXu4XUe5EPToVAsOef7j1/
         h+qbdULl2XUV+8E3PRnDs4h0k1qtZnIH6ETgEo3eJ1UD16Ood7I2xzSWU9eN+UMJ4VdV
         Yc03mbpiNDF7aqL1vhnEJnB/IQFRGa0+A5hZ6w0ukH0auqusRVOL+EMlSzz3OQCp8kgk
         ANzMAsJTo1ZdT7sThKhAaMz4r3ChlD9U3d7QFBdLI0Jk+2kWqNVC2Eooq5hNj9f4MIuO
         6VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xu/9Hp9YE79V3gEOl+iOuZxTKMv0URI3ITMz34Tl5nQ=;
        b=kKafhcTCzhN/TL49HoJukqbWEnkRkEOD11LN7XbYYqkwRQXVQH/t12SWSpvAXFAfHY
         wHq68LGt5a5fVFQHpjT2jCAkaw8JmlRulXHrD9kF39BjnNM6HugleJ+CapSTjsj5ptdd
         r//BAgBFQTrnXVF8+rlt4p3QF7dkrStDALWaaFLBhgvPOfTaD/Yc09cyMWGuo+Oj8oec
         WqLCaJUZTAgu/u2b8V3euMsZmQyNaLjCMpgKzHs8m+pIJSEyY405E96J4ZLbJk4xRAzJ
         rYokA2zs7s0M/wpR6Y47W8vPpSNPyG1e764pqt6gyBYuuVP+KjKALqQX9wAwCgmjQ9iY
         rwPA==
X-Gm-Message-State: APjAAAWuF1lfzl4zQlJ2++rS9jTzXChoC2HKj6YVDMJXYoC+8DPssswa
        nu2/VSifvPVcUwLISkhFDOazKKOf
X-Google-Smtp-Source: APXvYqyds+2OpV/xx9YQJlUjgY1C38Aremt6pszL0ofZCPpKa9yKP1RwL4x/owfGMGt3sSAkODGyJw==
X-Received: by 2002:a9d:22a8:: with SMTP id y37mr8063409ota.359.1574962919649;
        Thu, 28 Nov 2019 09:41:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n5sm6271236otl.15.2019.11.28.09.41.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Nov 2019 09:41:59 -0800 (PST)
Subject: Re: [PATCH] watchdog: da9062: add power management ops
To:     Marco Felsch <m.felsch@pengutronix.de>,
        support.opensource@diasemi.com, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f8f7721e-5ad3-ee3d-55e6-69544438884b@roeck-us.net>
Date:   Thu, 28 Nov 2019 09:41:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191128171931.22563-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/28/19 9:19 AM, Marco Felsch wrote:
> Disable the watchdog during suspend if it is enabled and re-enable it on
> resume. So we can sleep without the interruptions.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/da9062_wdt.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index e149e66a6ea9..2a1e7de25b71 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -212,6 +212,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>   	watchdog_set_restart_priority(&wdt->wdtdev, 128);
>   
>   	watchdog_set_drvdata(&wdt->wdtdev, wdt);
> +	dev_set_drvdata(dev, &wdt->wdtdev);
>   
>   	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
>   	if (ret < 0)
> @@ -220,10 +221,34 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>   	return da9062_wdt_ping(&wdt->wdtdev);
>   }
>   
> +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(wdd))
> +		return da9062_wdt_stop(wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused da9062_wdt_resume(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(wdd))
> +		return da9062_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
> +			 da9062_wdt_suspend, da9062_wdt_resume);
> +
>   static struct platform_driver da9062_wdt_driver = {
>   	.probe = da9062_wdt_probe,
>   	.driver = {
>   		.name = "da9062-watchdog",
> +		.pm = &da9062_wdt_pm_ops,
>   		.of_match_table = da9062_compatible_id_table,
>   	},
>   };
> 

