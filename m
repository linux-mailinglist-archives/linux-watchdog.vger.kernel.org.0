Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF8C1593C3
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Feb 2020 16:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgBKPvH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Feb 2020 10:51:07 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45656 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgBKPvG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Feb 2020 10:51:06 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so5908138pgk.12
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Feb 2020 07:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JGY+Xjd4EXoDa97/QsLmSKkYhY5UoFsFQPgGJfB4PAc=;
        b=jBwfPK/MiefMaZtJ1QgjTQrXoWqahfXigmfcek/Eq0QBe0bgr+rDXwLTFOuDiw/lF+
         JaOu221oXLjdK/fe9mRWcVOjGhd6Ci0kv3qpb87j8A7xdqcQg0N4gZ6vnl66kZfWjabH
         RpXsj4QwipALOTXs7Km12cBVxjccZq9VhUKjcV1/YsJw7njxRopoCuihFBpEEoUVZ1E2
         q+XjutwgTlIl9WeQZCpTfUhaGs/pPd3K2+sWv6Y/uCOUiIt/VxxXP3X8Q3gXfWk7SFTx
         Y3yUja9R/4WnO0fv91fyLnZ7KvGPDG4b9BJqzYv+VkZPmSox3aWGBU+DfGS3X6uap2gB
         EnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JGY+Xjd4EXoDa97/QsLmSKkYhY5UoFsFQPgGJfB4PAc=;
        b=KxbSWW9KkETz3fBZRbUSU4BEJmz70V7NpsRKS8XW+vp6tHnua19pYkgLAKHvbUS+SH
         OJMc4BcGMRAZuY7GiPj6iOJkCd/Ono9fpvbiHhoVIIRhqpKsfcFNdBJg4YtdOMNzniRl
         dPM2l5/Zk7kg4D8zuQvWLlQIwJxnQb8ugB6mo8bDRoZCK5qiZecc6qgEXrTkqIwrQ7nD
         G0I2+I9C6UbrHcxIUwTLoUIuBsDuI5kvz+hgLPFMuY6OL7aPvY9X6s9FIkj/3Z8fYe7u
         UxUqjtEYcEHhmBMZ1Rla51JeX7ug/lwXvWfUvJTfUQKGk7Wm2kC1RhVwNWZ9MFtdUbP6
         TzOw==
X-Gm-Message-State: APjAAAVpwOJYktVav69qWsUcKNfc+O77bMHYdgmSvFz5tKOuNxcfvANT
        0vJt6+fA7rabfha0Qdj8Svw=
X-Google-Smtp-Source: APXvYqwe7g/jieIaQZMI9AWqJxzsApBLc1cOVMrZOgUzmZa790ncrouiI50JbmSLQozSiCwXy+Kg6g==
X-Received: by 2002:a63:514b:: with SMTP id r11mr7566419pgl.329.1581436266292;
        Tue, 11 Feb 2020 07:51:06 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j17sm4753099pfa.16.2020.02.11.07.51.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 07:51:05 -0800 (PST)
Date:   Tue, 11 Feb 2020 07:51:04 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: pm8916_wdt: Add system sleep callbacks
Message-ID: <20200211155104.GA824@roeck-us.net>
References: <1581435483-6796-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581435483-6796-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 11, 2020 at 04:38:03PM +0100, Loic Poulain wrote:
> Add suspend and resume pm operations.
> Tested on dragonboard-410c.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/pm8916_wdt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 1213179..0937b8d3 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -192,6 +192,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>  	wdt->wdev.timeout = PM8916_WDT_DEFAULT_TIMEOUT;
>  	wdt->wdev.pretimeout = 0;
>  	watchdog_set_drvdata(&wdt->wdev, wdt);
> +	platform_set_drvdata(pdev, wdt);
>  
>  	watchdog_init_timeout(&wdt->wdev, 0, dev);
>  	pm8916_wdt_configure_timers(&wdt->wdev);
> @@ -199,6 +200,29 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>  	return devm_watchdog_register_device(dev, &wdt->wdev);
>  }
>  
> +static int __maybe_unused pm8916_wdt_suspend(struct device *dev)
> +{
> +	struct pm8916_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdev))
> +		return pm8916_wdt_stop(&wdt->wdev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused pm8916_wdt_resume(struct device *dev)
> +{
> +	struct pm8916_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdev))
> +		return pm8916_wdt_start(&wdt->wdev);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(pm8916_wdt_pm_ops, pm8916_wdt_suspend,
> +			 pm8916_wdt_resume);
> +
>  static const struct of_device_id pm8916_wdt_id_table[] = {
>  	{ .compatible = "qcom,pm8916-wdt" },
>  	{ }
> @@ -210,6 +234,7 @@ static struct platform_driver pm8916_wdt_driver = {
>  	.driver = {
>  		.name = "pm8916-wdt",
>  		.of_match_table = of_match_ptr(pm8916_wdt_id_table),
> +		.pm = &pm8916_wdt_pm_ops,
>  	},
>  };
>  module_platform_driver(pm8916_wdt_driver);
> -- 
> 2.7.4
> 
