Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1541F428498
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Oct 2021 03:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhJKB2E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 10 Oct 2021 21:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbhJKB2D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 10 Oct 2021 21:28:03 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A68C061570;
        Sun, 10 Oct 2021 18:26:04 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id g125so15777872oif.9;
        Sun, 10 Oct 2021 18:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D8eerABnlOzPqYuDEBcprrvu0qgvcR5NgBjdlZCpcdM=;
        b=dZfhGo9DUD7GoSSSUjxDfopaylA9QV9e73trzHGwAKvOB4O3N//alfLD778lEtgbPQ
         y6AGYTyRs1LZRV6qS96VmXNYlptBO33A1i4pangrLgGqChn18VguCWZ9dg3Ya+BlLYe/
         tt1FOVM6ATWqgfLe0CbtsNGJmkXbffRnNygslJIqIznfdBBn4Z31uZXh+6mWPIjwKcjK
         YK1uL2ouI/H2y+wIBwkvUoWzbxPTw5vahRaSi6v/78946vIw6OBqeflR7FA7X4O4VmMl
         r+A1y6XLhIdc4kLFCMZynZ7Y+ozRo73I8Ecc81aaOTzv15SH0u+ABdy3B4wUdvddj3C3
         NQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=D8eerABnlOzPqYuDEBcprrvu0qgvcR5NgBjdlZCpcdM=;
        b=UGD9T5jlfFwVeulVdGzvFW6l8SnsPQ9rZhLopOeTxbcji1PTGsvE73M3BZS/ORX6tH
         onJqv6JjBbiN8U6gGvaVC9qFDV+crhIm/kVPibyXa4T/uQ1yzr/JXAWPIadSqIc8lHOi
         SDmeo0resw5f8CLjKs6kFJZaZfe/9jeeaRiKtkUNHzUxg+J3Bc7fFEcADNwV6ywxBnse
         hDcBPM50UlX0uCd+xRJpGf65qOcTgLRiekdEI820vdkNwgpm5rygAmwAhi/KbFg4WSip
         22HGGTmC7YJm7w8Pyn+zK9nle7oWuIlBuYVrqXEGQowuxpkbJkD7/hPtBwziTFLY+Vol
         uIcQ==
X-Gm-Message-State: AOAM530isYrdluyD0O7TnhRvYe8dbFUnD4FDr7fYC1e6X9WmnOhH6qPo
        YhzptsdurrXzNxDO00QItsSmWqKZgm0=
X-Google-Smtp-Source: ABdhPJxMdBCNqusg3UmpRnYYznyvXKs5i78hqESupLDKgpfE2EWMYZL/oY+MgIfbwZjuIpim5xSv5A==
X-Received: by 2002:a05:6808:1709:: with SMTP id bc9mr15171415oib.18.1633915563905;
        Sun, 10 Oct 2021 18:26:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r184sm1388380oia.38.2021.10.10.18.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 18:26:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 10 Oct 2021 18:26:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: add new parameter to start the watchdog on
 module insertion
Message-ID: <20211011012601.GA3296185@roeck-us.net>
References: <20210924133509.3454834-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924133509.3454834-1-f.suligoi@asem.it>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 24, 2021 at 03:35:09PM +0200, Flavio Suligoi wrote:
> The new parameter "start_enabled" starts the watchdog at the same time
> of the module insertion.
> This feature is very useful in embedded systems, to avoid cases where
> the system hangs before reaching userspace.
> 
> This feature can be enabled in the kernel config, so it can be also
> used when the watchdog driver is build as "built-in".
> 
> This parameter involves the "core" section of the watchdog driver;
> in this way it is common for all the watchdog hardware implementations.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
> 
> v4: - improve code legibility in returned error checking
>     - stop the watchdog if driver registration fails
> v3: - add check for the returned error of wdog start function
> v2: - check WDOG_HW_RUNNING before starting watchdog;
>     - remove useless comments in commit text, watchdog-parameters.rst and
>       Kconfig;
> v1: - first version;
> 
>  Documentation/watchdog/watchdog-parameters.rst |  3 +++
>  drivers/watchdog/Kconfig                       |  9 +++++++++
>  drivers/watchdog/watchdog_core.c               | 17 +++++++++++++++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 223c99361a30..7780d0c1fb4a 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -21,6 +21,9 @@ watchdog core:
>  	timeout. Setting this to a non-zero value can be useful to ensure that
>  	either userspace comes up properly, or the board gets reset and allows
>  	fallback logic in the bootloader to try something else.
> +    start_enabled:
> +	Watchdog is started on module insertion. This option can be also
> +	selected by kernel config (default=kernel config parameter).
>  
>  -------------------------------------------------
>  
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index b81fe4f7d434..19be709e01ac 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -47,6 +47,15 @@ config WATCHDOG_NOWAYOUT
>  	  get killed. If you say Y here, the watchdog cannot be stopped once
>  	  it has been started.
>  
> +config WATCHDOG_START_ENABLED
> +	bool "Start watchdog on module insertion"
> +	help
> +	  Say Y if you want to start the watchdog at the same time when the
> +	  driver is loaded.
> +	  This feature is very useful in embedded systems, to avoid cases where
> +	  the system could hang before reaching userspace.
> +	  This parameter applies to all watchdog drivers.
> +
>  config WATCHDOG_HANDLE_BOOT_ENABLED
>  	bool "Update boot-enabled watchdog until userspace takes over"
>  	default y
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 3fe8a7edc252..d9211fea45d7 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -44,6 +44,11 @@ static int stop_on_reboot = -1;
>  module_param(stop_on_reboot, int, 0444);
>  MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
>  
> +static bool start_enabled = IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED);
> +module_param(start_enabled, bool, 0444);
> +MODULE_PARM_DESC(start_enabled, "Start watchdog on module insertion (default="
> +	__MODULE_STRING(IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED)) ")");
> +
>  /*
>   * Deferred Registration infrastructure.
>   *
> @@ -252,6 +257,15 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  	 * corrupted in a later stage then we expect a kernel panic!
>  	 */
>  
> +	/* If required, start the watchdog immediately */
> +	if (start_enabled && !watchdog_hw_running(wdd)) {
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		ret = wdd->ops->start(wdd);
> +		if (ret)
> +			return ret;
> +		pr_info("Watchdog enabled\n");
> +	}
> +
I am not convinced that this is the best location to start the watchdog.
Maybe that should be done in watchdog_cdev_register().

>  	/* Use alias for watchdog id if possible */
>  	if (wdd->parent) {
>  		ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
> @@ -356,6 +370,9 @@ int watchdog_register_device(struct watchdog_device *wdd)
>  	mutex_unlock(&wtd_deferred_reg_mutex);
>  
>  	if (ret) {
> +		if (start_enabled && watchdog_hw_running(wdd) &&
> +		    wdd->ops->stop)
> +			wdd->ops->stop(wdd);

This code stops the watchdog if watchdog registration failed even and
especially if it was already running when the module was inserted.
This changes semantics and is thus not aceptable.

>  		dev_str = wdd->parent ? dev_name(wdd->parent) :
>  			  (const char *)wdd->info->identity;
>  		pr_err("%s: failed to register watchdog device (err = %d)\n",
