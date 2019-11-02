Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9B2ECF81
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Nov 2019 16:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfKBPge (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 Nov 2019 11:36:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37191 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfKBPgd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 Nov 2019 11:36:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id p13so5638411pll.4
        for <linux-watchdog@vger.kernel.org>; Sat, 02 Nov 2019 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZgY3dCBjgoDeJommxNEmx9MrWp4TsyxKDIRi1N0CYMQ=;
        b=oWUnkrZhQ6Sd6GEAvaC/rCaKVq6COwQf0/GHDcLxS2ZNt6wvx8psJYF39XG+3N18pY
         y5QEFHbKnf5BLOnsZ+vhl1b/mUB+tQVIuuAvVQ+z9wAvecacLo2EkmQXKw322N1Z6i2D
         eQvaRUc6+dUCJS78IqFTqQ7deYYq9xncU+VNGnxzmTEC527YUswA8JLmCRtwA7aBSHMK
         trBGOMbAzbub62txYohbYBaTG7vH5Yya1VavRUmvJv8Jky69oGKsyBshGQcjz0VEsWo2
         b22zvWn9UUSrQsSaQjq668vgeSS9IXNO2kFFiWA1kfoqBG4i8tJRvRiGYsNV9LUj1yWx
         rezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZgY3dCBjgoDeJommxNEmx9MrWp4TsyxKDIRi1N0CYMQ=;
        b=VlozLxqxbKk+ZCvEy3TEpUrgRVQIt1zbLLITh1czaoR/RyYKrIULaFqQAr+B3TmHp2
         YNZeEwndCQDeakLM6QEREPsIsGOzfIDqUYdJjYMD05XPvF687AArH78D65srTsiMKECq
         DVAE8/Qd1gn12FeRdyTFB11gCH0kGztRtPWILYu7Ol6rshSfXUB8y/oU7FTHOyGdKtQG
         8WgXcjuAUXQTxbmPaxHk6NRYefHXUrKnWDf8UsMI6CQpZlPXqg4KDZGFvxZtby/+ygbZ
         hZiLXVMOLHvEDCM+Dh3RUr2teIlyPhbMnc8NgSyEPQaFaavyR+hhQ3rUyIFbkEWx1vbr
         XhgA==
X-Gm-Message-State: APjAAAWy5axshqmHNscj9c+wq0M2uI6rfaZ3Ex2RXV/w4Rwx3ashpLWU
        +QVVxDWALeEpeHaABj4jV5pjKB09
X-Google-Smtp-Source: APXvYqwaSikKD571PcAKk7YC54Mz84EUTBlBEbul1A2aMo92SBBxTZlkQXTuafNMkCiyVXN1XEauNA==
X-Received: by 2002:a17:902:7783:: with SMTP id o3mr18625924pll.313.1572708993246;
        Sat, 02 Nov 2019 08:36:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s12sm14771417pgf.36.2019.11.02.08.36.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2019 08:36:32 -0700 (PDT)
Date:   Sat, 2 Nov 2019 08:36:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Anson.Huang@nxp.com, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/5] watchdog: imx7ulp: Fix reboot hang
Message-ID: <20191102153631.GA5514@roeck-us.net>
References: <20191029174037.25381-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029174037.25381-1-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 29, 2019 at 02:40:33PM -0300, Fabio Estevam wrote:
> The following hang is observed when a 'reboot' command is issued:
> 
> # reboot
> # Stopping network: OK
> Stopping klogd: OK
> Stopping syslogd: OK
> umount: devtmpfs busy - remounted read-only
> [    8.612079] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
> The system is going down NOW!
> Sent SIGTERM to all processes
> Sent SIGKILL to all processes
> Requesting system reboot
> [   10.694753] reboot: Restarting system
> [   11.699008] Reboot failed -- System halted
> 
> Fix this problem by adding a .restart ops member.
> 
> Fixes: 41b630f41bf7 ("watchdog: Add i.MX7ULP watchdog support")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

However, just to be sure: This registers the watchdog based restart handler
as restart handler of last resort. I assume this on purpose, I just want
to make sure it is intentional since it is not explicitly mentioned in
the commit message.

Thanks,
Guenter

> ---
>  drivers/watchdog/imx7ulp_wdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 5ce51026989a..ba5d535a6db2 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -106,12 +106,28 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
>  	return 0;
>  }
>  
> +static int imx7ulp_wdt_restart(struct watchdog_device *wdog,
> +			       unsigned long action, void *data)
> +{
> +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> +
> +	imx7ulp_wdt_enable(wdt->base, true);
> +	imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
> +
> +	/* wait for wdog to fire */
> +	while (true)
> +		;
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static const struct watchdog_ops imx7ulp_wdt_ops = {
>  	.owner = THIS_MODULE,
>  	.start = imx7ulp_wdt_start,
>  	.stop  = imx7ulp_wdt_stop,
>  	.ping  = imx7ulp_wdt_ping,
>  	.set_timeout = imx7ulp_wdt_set_timeout,
> +	.restart = imx7ulp_wdt_restart,
>  };
>  
>  static const struct watchdog_info imx7ulp_wdt_info = {
