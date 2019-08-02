Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED67801F7
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Aug 2019 22:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731010AbfHBUtz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Aug 2019 16:49:55 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44058 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbfHBUtz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Aug 2019 16:49:55 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so34048105plr.11;
        Fri, 02 Aug 2019 13:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ENSyot+GNdqEsPMj6QXt84UJj5q21aiWLv73xl8tKs0=;
        b=CNUGS0o/7n6moxYJjoULWtyJ+iM+UwBiq475Ssij85TCMqybZiB1CyjE/um4r/+HvN
         crlqP1utunGT7etIKLdpxGytiHEVw+DufD9RvGjvAImVSPAQdq8sIPzwmfbSatkmk40y
         SJrOsKohoLVYqXJJF+fe5pQ/M2HmWmbyC3tcYGJA7HMERERf1PWB6smd0qakgNLUp4mA
         Z4dNwEbEVV93+GfZJC9Oo26hUQHHTo9iOegGYJ16wdFCzRyMTgrY7jU7vovwT92imhXt
         wH3+B212dAb1lZbe0vRfLa/7iwyrqs2lKYHmeZUJ5o5rsCfWfbqFYjN7aOU3OUf1wpbg
         +WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ENSyot+GNdqEsPMj6QXt84UJj5q21aiWLv73xl8tKs0=;
        b=lrSr0ivIUOdxtPwg95+dDJKtlxewQLO4FuJzmWtDAmc6lLVimW8ltwOW+VOgOK3Aer
         Q8K1eRL3B0kQKb0mZ89LdHAu5rDJCY5IUmWRH3NQNEDqnGdM/ELJ11Ij0OX96ILv4lG6
         wNYkWxMaWSl7c2LQJuPAIJnx0Xr1seWvKkYjQYRQ8dcB24gB54RkUDLLuKR/DTvk8EPu
         3S763Biae/D7InSxa664p+yPdbK0eCO8R6x0oFRJvXeh40Pab5gqeqqae8ZU9WTACz4n
         pk7KZbsa0tGFCHXDNa9aRGIIIU6eqp9IGdhgsCoOlSPTFUnZFQi5AEXZCV65gzsj0qVa
         KEmg==
X-Gm-Message-State: APjAAAXVotFNqeQqZ52rokN2Y5xOb2xw4gOjTGA9y54ErnjkpIWggp6y
        gAOkbokJEOCQVxRO1SKIeN0=
X-Google-Smtp-Source: APXvYqyZdXKq7maDW6xH3Vf3d4ciK+RxU3q3LMnSZKsp8dTn+hEWqB17yBBex/+y7896AM0TfCMylA==
X-Received: by 2002:a17:902:9a49:: with SMTP id x9mr134370035plv.282.1564778994625;
        Fri, 02 Aug 2019 13:49:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n128sm31732153pfn.46.2019.08.02.13.49.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 13:49:53 -0700 (PDT)
Date:   Fri, 2 Aug 2019 13:49:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] watchdog: ziirave_wdt: Don't bail out on unexpected
 timeout value
Message-ID: <20190802204952.GA6292@roeck-us.net>
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

I have not heard back on the question I had about selecting the minimum
timeout and not a more reasonable default. Since the code itself
is technically correct, marking the patch as

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

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
