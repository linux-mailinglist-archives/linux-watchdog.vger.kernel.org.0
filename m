Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F212400BE4
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Sep 2021 17:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236679AbhIDP2G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Sep 2021 11:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbhIDP2F (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Sep 2021 11:28:05 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E870C061575;
        Sat,  4 Sep 2021 08:27:03 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id v2so3042524oie.6;
        Sat, 04 Sep 2021 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QaGnlGfIhoAmUkdSbEJuTC6CWayt42RuLqvUUBshBGc=;
        b=fi7TsHZcfMQ1N8Dr5DeuHNSp8Iy61+LbXQChH3YM4FCmMlD/sWoQdzAj5Y9Kro4WhT
         n+ltpJU30ZIG1+22qq8UwWT3/EiVmWjuWiY2xoMyPvQqDGRYhl4FTcfLz9V4Ke7vx1R3
         ppmfYyjlH8e+f1E+djOCOWOZfvrUJeAlhOiUZHBdRb+iQ6dOIWKx1C0hMU5Mn+2IwOOQ
         JpNcQ73w3QhyVG3NfQpJ8qOBmA9UDvY05317PFUevrggBlxZoAwHxJagsARIkirepWqp
         EE+PN4wKRTOlyza3Iu62H2V3CQpnDotKPRwPuCrRKU+c1s9rPE3ccO9aSVjzYApFqNOn
         E1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=QaGnlGfIhoAmUkdSbEJuTC6CWayt42RuLqvUUBshBGc=;
        b=HfFeHNqcu900nLnCgIRW1XypfRnudP/zbabKVPc8OPOYXHGKbqEddDqHD9JVP+Dmfg
         PoS38waWHoUsPYHxp534mgYfyDmxe3qhzRIofV2swDM4OcD2ooh3oQ4qp3WFwZK7PfFh
         bO5zvH9BfehWo6JfrAf6bdWVmFyeDI+6UE/+P0+qbkTL+70vUQJ2pQUJKmH98pectSIO
         Nun72Bppaj5335o5iyPfKZPgGZbs1I4RFPO8Eux72luMuJ402OfNCqYQvD67IgqhQzTV
         FCDFyuQXxR766giUOna2Op+lHkbuQwVBoPjZMzwB9LcmTT0dBOJY5KCOk7vuZA5IrG1I
         tSXw==
X-Gm-Message-State: AOAM532Kz+ncqvkOJJQmFPyFehVqApJdKlJ+AtcwM581uOkyMlXB3zdu
        vOWOh2brZ1AtoJnu8X2f2WA=
X-Google-Smtp-Source: ABdhPJxULJRG63A5/XIqpdpOOj6iMRToCu5sYJdK9vbdZvewjuU0aSkFeh2pbs/p6eWqwv3wXKtwDg==
X-Received: by 2002:a05:6808:1449:: with SMTP id x9mr2948372oiv.14.1630769222698;
        Sat, 04 Sep 2021 08:27:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g8sm560322otk.34.2021.09.04.08.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:27:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Sep 2021 08:27:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: add new parameter to start the watchdog on
 module insertion
Message-ID: <20210904152700.GA3638986@roeck-us.net>
References: <20210413102030.3204571-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413102030.3204571-1-f.suligoi@asem.it>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Apr 13, 2021 at 12:20:30PM +0200, Flavio Suligoi wrote:
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
> v2: - check WDOG_HW_RUNNING before starting watchdog;
>     - remove useless comments in commit text, watchdog-parameters.rst and
>       Kconfig;
> v1: - first version;
> 
>  Documentation/watchdog/watchdog-parameters.rst |  3 +++
>  drivers/watchdog/Kconfig                       |  9 +++++++++
>  drivers/watchdog/watchdog_core.c               | 12 ++++++++++++
>  3 files changed, 24 insertions(+)
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
> index 0470dc15c085..1c480f4c7f94 100644
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
> index 5df0a22e2cb4..8a1e2e9331ee 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -43,6 +43,11 @@ static int stop_on_reboot = -1;
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
> @@ -224,6 +229,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  	 * corrupted in a later stage then we expect a kernel panic!
>  	 */
>  
> +	/* If required, start the watchdog immediately */
> +	if (start_enabled && !watchdog_hw_running(wdd)) {
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		wdd->ops->start(wdd);

The start function returns an error, which needs to be checked.

Guenter

> +		pr_info("Watchdog enabled\n");
> +	}
> +
>  	/* Use alias for watchdog id if possible */
>  	if (wdd->parent) {
>  		ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
