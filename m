Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35FB27CB85
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 20:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfGaSJl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 14:09:41 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36686 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfGaSJl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 14:09:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so32437364pgm.3;
        Wed, 31 Jul 2019 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KKXrcjq5aKywCjPq+oMoki6xU2F/WPYtQ8SZIYkDkr8=;
        b=fFcZHoKChnx7sEYX7xmn9Zpu1zg08dZAFMzIxgCNf7DRQFUmoOrySjKb+3BT3V9RxI
         +YEdwTnFeMg0T8RmfOR20dK5hPBjb3BW1qwKRe84INXXGKPW+GR8c14+YYh7UfGQ86TN
         Ia85W+y28aOzPTLVOqlcfzH9miK4beobT55qUVw3S1MjXTVLZrdgPftPDU/JG98v2DYD
         JgdzrFIYO7ty7cF18VeYaxUDzo6HPHVKgHmz8gfNYnh0gh51QbBqDU5zv8ukgl8ePVvZ
         HlY3Fj5fvgZXK3vZJVjzJFaWx05HHSJx3h4q7rLq5Q3aef37Vr3HZ8EVWQP7XdtDsXav
         6cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KKXrcjq5aKywCjPq+oMoki6xU2F/WPYtQ8SZIYkDkr8=;
        b=pWgp13CFIfJ8UknZYez2Sw2XU7lCczXdq8Xvr/ojfi6hu+wEDZdd9jhblcXpCHv0J7
         D4obVwScBSRGVNwW/vt/lE/MVDcEch82fYwkXvcSOUjNiSQVSOSm66GD14AbzBxLC7sv
         OdaNspfj/jzyHmZ9d+YAf51auO65EGsWo4UdlKTrtb6mHqbMTq4XeVynB+0DKs+dy/TV
         1cUQSydT3pCN6LsXjGe63Y73st4ZYffTysARNuyyJmfy8axDzElIHLFBTtmaHk3j1bcb
         X2SXbYJ+DTiv6/zLEr5IcizuBW9XdNamVWBj3pjUxosiw+FWK+PEbIo1h8H3forDCE7K
         Sbfg==
X-Gm-Message-State: APjAAAXWsq1bh5JXZ+MgvEl7l9bjXZ+giVMbAlD+2ovbMSQUxRtniJhR
        wiypy6nu2+RpFz6G4mlBBJ3daiS7
X-Google-Smtp-Source: APXvYqzDj5id5ZL3LNA7XmAXyi3YxrX1t4G5MF+rqSp4G2xF7vmxaRDeJK1xl/eTbveModMchLaMpg==
X-Received: by 2002:a62:64d4:: with SMTP id y203mr48384136pfb.91.1564596580586;
        Wed, 31 Jul 2019 11:09:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q22sm63180246pgh.49.2019.07.31.11.09.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 11:09:39 -0700 (PDT)
Date:   Wed, 31 Jul 2019 11:09:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] watchdog: ziirave_wdt: Don't bail out on unexpected
 timeout value
Message-ID: <20190731180938.GA3885@roeck-us.net>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
 <20190731174252.18041-5-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731174252.18041-5-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 31, 2019 at 10:42:51AM -0700, Andrey Smirnov wrote:
> Reprogramming bootloader on watchdog MCU will result in reported
> default timeout value of "0". That in turn will be unnecesarily

unnecessarily

> rejected by the driver as invalid device (-ENODEV). Simplify probe to
> just read stored timeout value, clamp it to an acceptable range and
> program the value unconditionally to fix the above.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/watchdog/ziirave_wdt.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 89ce6982ba53..33c8d2eadada 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -667,22 +667,18 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  			return val;
>  		}
>  
> -		if (val < ZIIRAVE_TIMEOUT_MIN)
> -			return -ENODEV;
> -
> -		w_priv->wdd.timeout = val;
> -	} else {
> -		ret = ziirave_wdt_set_timeout(&w_priv->wdd,
> -					      w_priv->wdd.timeout);
> -		if (ret) {
> -			dev_err(&client->dev, "Failed to set timeout\n");
> -			return ret;
> -		}
> +		w_priv->wdd.timeout = clamp(val, ZIIRAVE_TIMEOUT_MIN,
> +					    ZIIRAVE_TIMEOUT_MAX);

Are you sure ? Effectively that will set the timeout to the minimum,
ie three seconds. It might be better to define and set some default.
Your call, of course.

Thanks,
Guenter

> +	}
>  
> -		dev_info(&client->dev, "Timeout set to %ds\n",
> -			 w_priv->wdd.timeout);
> +	ret = ziirave_wdt_set_timeout(&w_priv->wdd, w_priv->wdd.timeout);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to set timeout\n");
> +		return ret;
>  	}
>  
> +	dev_info(&client->dev, "Timeout set to %ds\n", w_priv->wdd.timeout);
> +
>  	watchdog_set_nowayout(&w_priv->wdd, nowayout);
>  
>  	i2c_set_clientdata(client, w_priv);
> -- 
> 2.21.0
> 
