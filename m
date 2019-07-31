Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04BD77D032
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 23:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfGaVm4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 17:42:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38451 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729746AbfGaVm4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 17:42:56 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so32601947pfn.5;
        Wed, 31 Jul 2019 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CTPwqyaaGxomVcJeMP8V/HAhfNIcob1VXgD8LJ5qiwc=;
        b=NQrdHj4POycD3IPlIj2C3r7vs4jT4JEXCFAEgGy7pucqoxQGyLaWKr+XI9cXlzqyNr
         vWc+YzTE91xdwBpvQ6UxIV+a+g+yXTV89rq1zERfFFu4tjV6LENi+5a14dPHhYjPDMnU
         BGGPH2bI5wlbXyhgsHkekAnzc8HgMgq+RX4pVOSbJHVBqvyb6ilKscAATeZGtky7BtE5
         WY8zGs5UkhfKPqfjWN30t2IhsqjDPuWaiCYnHS3pMNm6k+Iv9Sv+UcPTZ3OA76hPxXGg
         jGvf+/EhLLWKIg116bbHsNAIPnOy6egFzpBfuiiV3alyI+l69pEpKKiXPv3WsKlxzeFZ
         FqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=CTPwqyaaGxomVcJeMP8V/HAhfNIcob1VXgD8LJ5qiwc=;
        b=JtdRkDZtZ+Jbu/OfwvmB26z1L7eXU5N1aVvFzFW1Pl/AmB/Qy4HGzKTvAgwU8H7TEy
         T3owmDzqNSyAMbDvPJLWal9CSDGnf/R73rY0rztd4Wl+aprpkySPG3/xo3WztO5jkGal
         Kgvnx+wUF8SVxAa7LKEfNiQI50B3vfOT1PyLhY/UOLF+r3JgXreo+H3qqWrLrdDDp3SH
         ed0IvAtZm6Vlfu8hpx0PpLwncBq8HXadPf3b2qPrU0HhHy9nXtD53T6BuH71fNCw8dAr
         0EBf5MQwn8npek28oS0sKnHa70cP5ZxZui8lxghgU/sUrtXR75BII4TH/L7ZekwxSkTp
         bVcA==
X-Gm-Message-State: APjAAAVYfiyVZFATjIH+oSbb1dTzNXCWHITs1e/UkC9RiCNk8DO5x86q
        0XKPYU1zXsOPmh27BYG1Qf4=
X-Google-Smtp-Source: APXvYqwfO29RlmUYflBu2yfTGav0j34Xhc5ZW+I9KHAope4nemrogA0U+fT7NdaCDXloE8TLnk4aMw==
X-Received: by 2002:a63:3281:: with SMTP id y123mr112890501pgy.72.1564609375361;
        Wed, 31 Jul 2019 14:42:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t11sm80952854pgb.33.2019.07.31.14.42.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 14:42:54 -0700 (PDT)
Date:   Wed, 31 Jul 2019 14:42:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] watchdog: ziirave_wdt: Be verbose about errors in
 probe()
Message-ID: <20190731214254.GB17277@roeck-us.net>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
 <20190731174252.18041-3-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731174252.18041-3-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 31, 2019 at 10:42:49AM -0700, Andrey Smirnov wrote:
> The driver is quite silent in case of probe failure, which makes it
> more difficult to diagnose problem from the kernel log. Add logging to
> all of the silent error paths ziirave_wdt_probe() to improve that.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ziirave_wdt.c | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 6ec028fb2635..8c71341a9c1c 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -658,8 +658,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  	 */
>  	if (w_priv->wdd.timeout == 0) {
>  		val = i2c_smbus_read_byte_data(client, ZIIRAVE_WDT_TIMEOUT);
> -		if (val < 0)
> +		if (val < 0) {
> +			dev_err(&client->dev, "Failed to read timeout\n");
>  			return val;
> +		}
>  
>  		if (val < ZIIRAVE_TIMEOUT_MIN)
>  			return -ENODEV;
> @@ -668,8 +670,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  	} else {
>  		ret = ziirave_wdt_set_timeout(&w_priv->wdd,
>  					      w_priv->wdd.timeout);
> -		if (ret)
> +		if (ret) {
> +			dev_err(&client->dev, "Failed to set timeout\n");
>  			return ret;
> +		}
>  
>  		dev_info(&client->dev, "Timeout set to %ds\n",
>  			 w_priv->wdd.timeout);
> @@ -681,34 +685,46 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  
>  	/* If in unconfigured state, set to stopped */
>  	val = i2c_smbus_read_byte_data(client, ZIIRAVE_WDT_STATE);
> -	if (val < 0)
> +	if (val < 0) {
> +		dev_err(&client->dev, "Failed to read state\n");
>  		return val;
> +	}
>  
>  	if (val == ZIIRAVE_STATE_INITIAL)
>  		ziirave_wdt_stop(&w_priv->wdd);
>  
>  	ret = ziirave_wdt_init_duration(client);
> -	if (ret)
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to init duration\n");
>  		return ret;
> +	}
>  
>  	ret = ziirave_wdt_revision(client, &w_priv->firmware_rev,
>  				   ZIIRAVE_WDT_FIRM_VER_MAJOR);
> -	if (ret)
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to read firmware version\n");
>  		return ret;
> +	}
>  
>  	ret = ziirave_wdt_revision(client, &w_priv->bootloader_rev,
>  				   ZIIRAVE_WDT_BOOT_VER_MAJOR);
> -	if (ret)
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to read bootloader version\n");
>  		return ret;
> +	}
>  
>  	w_priv->reset_reason = i2c_smbus_read_byte_data(client,
>  						ZIIRAVE_WDT_RESET_REASON);
> -	if (w_priv->reset_reason < 0)
> +	if (w_priv->reset_reason < 0) {
> +		dev_err(&client->dev, "Failed to read reset reason\n");
>  		return w_priv->reset_reason;
> +	}
>  
>  	if (w_priv->reset_reason >= ARRAY_SIZE(ziirave_reasons) ||
> -	    !ziirave_reasons[w_priv->reset_reason])
> +	    !ziirave_reasons[w_priv->reset_reason]) {
> +		dev_err(&client->dev, "Invalid reset reason\n");
>  		return -ENODEV;
> +	}
>  
>  	ret = watchdog_register_device(&w_priv->wdd);
>  
> -- 
> 2.21.0
> 
