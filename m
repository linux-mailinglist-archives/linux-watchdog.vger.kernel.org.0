Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C826141FC37
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Oct 2021 15:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbhJBNWp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 Oct 2021 09:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbhJBNWo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 Oct 2021 09:22:44 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEFDC0613EC;
        Sat,  2 Oct 2021 06:20:58 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s69so15162395oie.13;
        Sat, 02 Oct 2021 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AvliCJIc2kXc9rCZcDMuJsQ1OOymjbvJDawg6aDGvpU=;
        b=ct0PY0BJOqq6ibgSoWa6uZPp8iNPbFlIHqHICjo4CJppBNBniLJTKqxLMI3MNdheCY
         FQ3ARQ9uWe3L9Jn3I3CWc6pf+qDm6FweD9iwEWz7KUf/sa7LXVRrQ+Mn7l9OmvFxZkrg
         WYc/SUNorKfh4t0CcEprS+t4IJvijUZIsCxHIzC32gvVUuUhJy+x4nQXrZA+DLJ4cW1N
         dsJbAl4Waanoj5QhjUjGNwexm/3BNvBB3Qp0/0jPQNOVRmRVudKK/SMpJDnMT5B4haGI
         ZoN2hXxj08UuuC0PZ7BsNiU+TGYNandqZYAn+bOB6gqJb+OZtTIKfCZYMekXzaY7sJxt
         JzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=AvliCJIc2kXc9rCZcDMuJsQ1OOymjbvJDawg6aDGvpU=;
        b=a+aS09hq9emoME623gBLhNrgcNuF+cm0Gd0YSJ2q6LWNq9xFcxQzzhYDlNyZLhfbhG
         N/UjTEmmfxODYS4jltkTt+rMXTB/Jhi5tLADmoDum9nupFEwB730hF/JzY/9BjCKkozE
         vzXYKIq3Ez19nVoGVvPmPFdQfY+fhWa+v0PvnidVnZxYcT86BoCs8O1EZ+pAdwsGi5/i
         ECEwsyutQiWblYOsxmkx1EyKeZXdDBIWFp/jn3c9zz9jQAD4aaWkuLDbiEir2B+0OgKn
         mPwRfKgfKrzFwUcKVKyuf89ER/toBkI8Rr2usKeYZrQADjKCYkhv29bkBtUIB10xaZxn
         xpfw==
X-Gm-Message-State: AOAM5304obXdzziZdIpHHO2SNTItXV8xVZKLbIE0txSK1fr/YH5/bCzv
        HFSqJmOcgGMDxYdG6PNdULGMwjb7M6M=
X-Google-Smtp-Source: ABdhPJzERXIQWlvfIJHURvszwAFFRI4KUdMaVHhvNAY0ZpT6q9Th4JXBNEkt5yt/Q4k59ZIjW5dBnw==
X-Received: by 2002:a05:6808:f03:: with SMTP id m3mr7767972oiw.23.1633180858028;
        Sat, 02 Oct 2021 06:20:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h5sm1706619oti.58.2021.10.02.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 06:20:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 2 Oct 2021 06:20:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: sp5100_tco: Add support for get_timeleft
Message-ID: <20211002132055.GA4023280@roeck-us.net>
References: <20210928065735.548966-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210928065735.548966-1-linux@weissschuh.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 28, 2021 at 08:57:35AM +0200, Thomas Weißschuh wrote:
> Tested on a Gigabyte X570 I AORUS PRO WIFI.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp5100_tco.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index a730ecbf78cd..dd9a744f82f8 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -10,6 +10,7 @@
>   *				https://www.kernelconcepts.de
>   *
>   *	See AMD Publication 43009 "AMD SB700/710/750 Register Reference Guide",
> + *	    AMD Publication 44413 "AMD SP5100 Register Reference Guide"
>   *	    AMD Publication 45482 "AMD SB800-Series Southbridges Register
>   *	                                                      Reference Guide"
>   *	    AMD Publication 48751 "BIOS and Kernel Developer’s Guide (BKDG)
> @@ -144,6 +145,13 @@ static int tco_timer_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static unsigned int tco_timer_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
> +
> +	return readl(SP5100_WDT_COUNT(tco->tcobase));
> +}
> +
>  static u8 sp5100_tco_read_pm_reg8(u8 index)
>  {
>  	outb(index, SP5100_IO_PM_INDEX_REG);
> @@ -386,6 +394,7 @@ static const struct watchdog_ops sp5100_tco_wdt_ops = {
>  	.stop = tco_timer_stop,
>  	.ping = tco_timer_ping,
>  	.set_timeout = tco_timer_set_timeout,
> +	.get_timeleft = tco_timer_get_timeleft,
>  };
>  
>  static int sp5100_tco_probe(struct platform_device *pdev)
> 
> base-commit: 41e73feb1024929e75eaf2f7cd93f35a3feb331b
> -- 
> 2.33.0
> 
