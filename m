Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F173D5031
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Jul 2021 23:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhGYVBD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Jul 2021 17:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbhGYVBC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Jul 2021 17:01:02 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1979C061760;
        Sun, 25 Jul 2021 14:41:32 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id b20so7092787qkj.3;
        Sun, 25 Jul 2021 14:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QxOlTszS9lefFPg4lTNiOlnATXYl/0WWxviXpQoITfQ=;
        b=XATwLMymbsZV4PttlajF382i8P33q7mjVRhHUwdZziBZ371iOVR6UMOxGRyNu6niD1
         aqn/ehfG8TwvzFEfrksecuhftSl6sm20sfV1tjoHPc/w4eUhstJBqTdbcdbOt77DuW8A
         Sn7/3WT5XAkHfPRGpa2gB9rTD1q6bWvZzG8kIFSQnm+cAk8iOpQyZeo0XW5DxOxhws0k
         ZP4jD0Pae1cdtAS5X4E+FnDKRnvsbs+G6eUzXkWl4PKQrlnlrlziWsIzthovdIQPSDtr
         q+vhgd20f5uWbiFSFKgEhuCl4syoiJNaK9/t+OWQqSpqQO66rNjBs42IYxHMJz2uv8l+
         grVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=QxOlTszS9lefFPg4lTNiOlnATXYl/0WWxviXpQoITfQ=;
        b=ZglPVHFepuHXBuXqLoodiMsjqNevGuH1n++GJdqPduvdOeTQY8+2MRW2zrJkKA5grG
         hF22QOtGYBQ4/Yx/1TH78TRp4YHlWlgsjNU3V9lc7NzHF8J7k6QioSnBNYv16VZUqZoI
         qzi8SiW8k/fRAJJ7xT9v/lJPUblhaW54qvVfDtTUk7OnYZ18JHgNyNofjApxOSinkuCY
         A1E4nx7oZ0F3b0qvNCuF8A6I5rft34+mUcCDhgJrCpAU28tqkywhC4cPZR2b09XHUH/y
         LEJReNuOBWTUfonJuNkRmISbNzSeeFY9mUoQaMS0geCXsqGKGmrPF0uT5DcijU/uFnWy
         sCkA==
X-Gm-Message-State: AOAM531ZVPASnK4Fg4vM5B3ElX4tsuuSk99diy9v6xb19Wd2Q2/h/Spb
        mH685EcwVrMEnSYtIl+LmizkwETxezM=
X-Google-Smtp-Source: ABdhPJwJC09YTmDe39x8u72YD0k3ayM8qwR9qmQHb4KYMJZffmAoCvE0f1XCJfr4hRfZ1Gejm15zpg==
X-Received: by 2002:a37:af45:: with SMTP id y66mr15073588qke.466.1627249291476;
        Sun, 25 Jul 2021 14:41:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c197sm17801136qke.33.2021.07.25.14.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 14:41:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Jul 2021 14:41:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] watchdog: f71808e_wdt: fix inaccurate report in
 WDIOC_GETTIMEOUT
Message-ID: <20210725214129.GA3578169@roeck-us.net>
References: <cover.c711be1db54f4e07c0153266dd1a831e92e3d49d.1626948810.git-series.a.fatoum@pengutronix.de>
 <7f2a07eaa7dbd7c3f8162a89d364c3eef45883ea.1626948810.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f2a07eaa7dbd7c3f8162a89d364c3eef45883ea.1626948810.git-series.a.fatoum@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 22, 2021 at 12:14:40PM +0200, Ahmad Fatoum wrote:
> The fintek watchdog timer can configure timeouts of second granularity
> only up to 255 seconds. Beyond that, the timeout needs to be configured
> with minute granularity. WDIOC_GETTIMEOUT should report the actual
> timeout configured, not just echo back the timeout configured by the
> user. Do so.
> 
> Fixes: 96cb4eb019ce ("watchdog: f71808e_wdt: new watchdog driver for Fintek F71808E and F71882FG")
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index f60beec1bbae..f7d82d261913 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -228,15 +228,17 @@ static int watchdog_set_timeout(int timeout)
>  
>  	mutex_lock(&watchdog.lock);
>  
> -	watchdog.timeout = timeout;
>  	if (timeout > 0xff) {
>  		watchdog.timer_val = DIV_ROUND_UP(timeout, 60);
>  		watchdog.minutes_mode = true;
> +		timeout = watchdog.timer_val * 60;
>  	} else {
>  		watchdog.timer_val = timeout;
>  		watchdog.minutes_mode = false;
>  	}
>  
> +	watchdog.timeout = timeout;
> +
>  	mutex_unlock(&watchdog.lock);
>  
>  	return 0;
> -- 
> git-series 0.9.1
