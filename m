Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB6E14982D
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2020 00:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbgAYXL3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 25 Jan 2020 18:11:29 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:43501 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbgAYXL3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 25 Jan 2020 18:11:29 -0500
Received: by mail-yw1-f68.google.com with SMTP id v126so2884989ywc.10;
        Sat, 25 Jan 2020 15:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q6ZcuyUU+doit7kPbsOnRYJCyiBS+m30mXZlkpyEj44=;
        b=fQB14srlFUsvbsthSTN425EVpuNWWWzyduWo5AlYxx2lEoL9J//Q5ycxbL/A6e7UgT
         61y4gig+4dTOZCDZsohGst7k1/6JpnDk4t/QYeeB1Shr7mpwyL25rE82WgC9S53po4Uv
         h9N4aTxFTBU8QAFqdW9GLyVgfZ41KlL3Xp7jhCMlzpgxpU2BD9eXd5a0WdmJRkN+XF2t
         k+A6tla3JE/kNUo5aHP9tUetwCvzkjatHOYgZrHLZME2FtK892JbrCO+kwpT7pZi3aJz
         B7Q2+2JGTraJ8BDjVNkbkO8Wgheal79YREK1s5UocneY26wTJ4UI+lL2X2nabopcJlXs
         mqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=q6ZcuyUU+doit7kPbsOnRYJCyiBS+m30mXZlkpyEj44=;
        b=V+3nQLS2g57FxnFx9XPg4zj+ZiYi4Rpf+U7jZx5fRXMsllT91Nwyq/nbcaBzuk+0G6
         CnEHumDG7fUuEMMAjU8ZTaJM7VKXSay1qtMkDUQWDsvbOllxAxrMGZMvxgToZlgv+dc7
         mlagWywKeWP8wmsnWX72GVQ8WKdGtW34wx8r/K7H573RJSNH8Mv5UsRXwiFCIRpMrIUK
         LXpkYWyzBLZuauayOPmSB6WwwQqGLj3gpR+OZgmykOofRcn6B/dwi2bmHS4hSVthgokJ
         uQIVDiLwaM3o9gzm+XHMDEPl6ZGwl03vnZl5/gTJGgFC8qAzo4gZ7sdMrnLk/NjK5QLg
         l+5g==
X-Gm-Message-State: APjAAAXycL05vRkwxuzpKC6U3kMPRZNEA6SXOZMfY2/ESPqMK3Zbn/Mr
        jQ9zov+VUQpalx86F+5wt4YFclxL
X-Google-Smtp-Source: APXvYqzfnm4WtAQkAQIkeWXOx8omohb9x0BX8o4ZaN1RQtvM8kw7meqUZXELPvvC2GY+4w8prG5emg==
X-Received: by 2002:a0d:f5c1:: with SMTP id e184mr7802889ywf.245.1579993888343;
        Sat, 25 Jan 2020 15:11:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9sm4493140ywh.55.2020.01.25.15.11.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Jan 2020 15:11:27 -0800 (PST)
Date:   Sat, 25 Jan 2020 15:11:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: da9062: do not ping the hw during stop()
Message-ID: <20200125231126.GA25513@roeck-us.net>
References: <20200120091729.16256-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120091729.16256-1-m.felsch@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jan 20, 2020 at 10:17:29AM +0100, Marco Felsch wrote:
> The da9062 hw has a minimum ping cool down phase of at least 200ms. The
> driver takes that into account by setting the min_hw_heartbeat_ms to
> 300ms and the core guarantees that the hw limit is observed for the
> ping() calls. But the core can't guarantees the required minimum ping

guarantee

> cool down phase if a stop() command is send immediately after the ping()
> command. So it is not allowed to ping the watchdog within the stop()
> command as the driver do. Remove the ping can be done without doubts

does

> because the watchdog gets disabled anyway and a (re)start reset the

resets

> watchdog counter too.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/da9062_wdt.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 77b6b5336067..0ad15d55071c 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -97,13 +97,6 @@ static int da9062_wdt_stop(struct watchdog_device *wdd)
>  	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
>  	int ret;
>  
> -	ret = da9062_reset_watchdog_timer(wdt);
> -	if (ret) {
> -		dev_err(wdt->hw->dev, "Failed to ping the watchdog (err = %d)\n",
> -			ret);
> -		return ret;
> -	}
> -
>  	ret = regmap_update_bits(wdt->hw->regmap,
>  				 DA9062AA_CONTROL_D,
>  				 DA9062AA_TWDSCALE_MASK,
