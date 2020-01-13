Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1E92139AB8
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2020 21:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgAMU2N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jan 2020 15:28:13 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39539 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgAMU2M (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jan 2020 15:28:12 -0500
Received: by mail-pf1-f193.google.com with SMTP id q10so5413929pfs.6;
        Mon, 13 Jan 2020 12:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RRhPxYtI12WE5buq2I+zvusZGT++RtYK4QcGcmE99jI=;
        b=WPcIaPi6hE90GSQqZ1OfQnwK3DNiEiNTF3Nv6MgLAm5epDAsMm9DKxVKjcruunecCU
         wPQZCf1w0P2qQIW1gXwQpbpEaWNjE1MoKP13aB94rzpPpWjQjxglIfzvHpW6Y7VpzTZ9
         17yvLWttMTPV/KZXBdmTn7bpbVJ0gOdGJBUI4xRUN+JI5cfSNCco6bAmESU0QEjRfNk/
         IP/AhGl/EJPssg4zCIus8KYQRlnp4HIEhvMtrDl44NjIAMd54QAUHSJmorbkVB6rlgaY
         6d1rYH1gKgGMU/yn3nw/6N76mwP7eHstrzr8fwD2DThSDvWLPJ3yypDVgCKIBIpU0J/v
         zx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RRhPxYtI12WE5buq2I+zvusZGT++RtYK4QcGcmE99jI=;
        b=sQlIDp+h/g+ahTX6seUTQ9Gywehf3tJo/LR7arwHFHmxljTcu6Dbp9Ho0NUWDwLbbC
         RwFV0kh1Mwr/MaqohR4xm06/m6h2BKtYEnMToB4pnmyYRGt5Bi+CRWrOhkC+eY7qEHbl
         IoxnkgN9U8AcSnc7GICjQHe92XhXWulyiBc27FQMxpfvJWJCdB7/Ru4WdqvSGZYFBMrb
         N7Z+/PGb11CgEgiuuvlN9bKeyX7C+1DUxftksInoTIb1MWp13LqBuR8r+bBiBBGXa+7S
         QBgV7lGK8++RbpkPQbxS6Z+QrhC9DBa2KYO8Bd73S+M+A7EfZVlLNFk6HlhQ5OCF/E79
         3T4g==
X-Gm-Message-State: APjAAAUt7lKQz/aN/2EUlTlOC9bq61FrpFWxpLdFOThELblr+mXGkGBY
        7wQNGmr4yFBn6IgQGfPX0hIBhu2C
X-Google-Smtp-Source: APXvYqxUixEYeLuRAI5UDbxecGt6gjWhPqKiZc26gUjE7oCDhz4EXXH1fKvuTON6xFeAPWg7kD3W6g==
X-Received: by 2002:a63:3cb:: with SMTP id 194mr23342069pgd.123.1578947292040;
        Mon, 13 Jan 2020 12:28:12 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c1sm15461800pfa.51.2020.01.13.12.28.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 12:28:10 -0800 (PST)
Date:   Mon, 13 Jan 2020 12:28:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, contact@stefanchrist.eu,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: da9062: make restart handler atomic safe
Message-ID: <20200113202809.GA21484@roeck-us.net>
References: <20200113091521.5754-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113091521.5754-1-m.felsch@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jan 13, 2020 at 10:15:21AM +0100, Marco Felsch wrote:
> The restart handler is executed during the shutdown phase which is
> atomic/irq-less. The i2c framework supports atomic transfers since
> commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
> transfers") but unfortunately the regmap framework doesn't support it
> yet. Hard coding the i2c stuff can be done without worries since the
> DA9062 is an i2c-only device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi,
> 
> This patch is based on Stefan Lengfeld's RFC Patch [1].
> 
> [1] https://patchwork.ozlabs.org/patch/1085942/
> ---
>  drivers/watchdog/da9062_wdt.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index c9b9d6394525..84c5a0a455b2 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
> +#include <linux/i2c.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
>  #include <linux/mfd/da9062/registers.h>
> @@ -149,12 +150,18 @@ static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  			      void *data)
>  {
>  	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> +	struct i2c_client *client = to_i2c_client(wdt->hw->dev);
> +	u8 buf[] = {DA9062AA_CONTROL_F, DA9062AA_SHUTDOWN_MASK};
> +	struct i2c_msg msg = {
> +		.addr = client->addr,
> +		.flags = 0,
> +		.len = sizeof(buf),
> +		.buf = buf,
> +	};
>  	int ret;
>  
> -	ret = regmap_write(wdt->hw->regmap,
> -			   DA9062AA_CONTROL_F,
> -			   DA9062AA_SHUTDOWN_MASK);
> -	if (ret)
> +	ret = i2c_transfer(client->adapter, &msg, 1);

Why not i2c_smbus_write_byte_data() ? I don't immediately see the difference.

Guenter

> +	if (ret < 0)
>  		dev_alert(wdt->hw->dev, "Failed to shutdown (err = %d)\n",
>  			  ret);
>  
> -- 
> 2.20.1
> 
