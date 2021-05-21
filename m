Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4D138C9EE
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 May 2021 17:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237388AbhEUPUI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 May 2021 11:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237398AbhEUPUD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 May 2021 11:20:03 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAB6C0613ED
        for <linux-watchdog@vger.kernel.org>; Fri, 21 May 2021 08:18:39 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so18326505otg.2
        for <linux-watchdog@vger.kernel.org>; Fri, 21 May 2021 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HRC/VpVFfONaN+FQbhJssDDo5ZPp8/zGgIYy53PbjWo=;
        b=aRtpDHtfp1Oq0T4XeydsnQCEYeSMoFkNpABItJeB/cfuOPCU9ImO3GfMxpjLmVcdXM
         i2N7vQNL25r0pZnvEjHYvx7X1iWrJXzqqJnh9tCwAIP/5iyxihs9D5Lx2d2or80EQ1EL
         sCncYM2HCHUU0A+lgXeeTB+GOSkWBDStunnrUTXy+3Ez3VZJFwk4WttyviMicUWmL+CR
         NIhqsxnTrZvFgDj8exPSaoQQ2lw4Jkg6HPKqb3HN/t8KWCOko8lvxNgxQeRgzKwrghjr
         SJ6DHpWgyNM7OG1fiuCBbt3Ttb01XaZhqyHpYNAro3x2b8Zhqz2EDTm7waqdTK+Qrj9N
         sjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=HRC/VpVFfONaN+FQbhJssDDo5ZPp8/zGgIYy53PbjWo=;
        b=HVHvzPNExUKzQxjQqiT8cO1PaiDw38Kn+LlTe++90a9aNegLdGynfOg23v9zBUvGLm
         xDARy+uWYT+bYODCPIC2Q+lzjV2e5Qba0+gqtwdVV1Yxr1fZaRyfJg206fZcySuPjPCl
         JdrIpT/n34S4W6VZQrV+ZvSSzhNA69N/Gdjr2IdXsvgRao7gbCnMv6xmLmkxFEkvuyaV
         0andL6PZypxdfK30CBes3GbFM1q5GB7h+6DC8qbnUKkSaqqqv87rZjupNlFC2JCYm+Ha
         y6fVhuNkBqKXmiiO+4QVmpZmzI5nC8/A4nJMiFSb49vSp81oyG053wO8OM/fLqWc5m4L
         vXTw==
X-Gm-Message-State: AOAM533jBto6eCVUzK6qXkBUZhP1Jbf8wchL5VyXRq9GKwS21RkSWnsf
        PxdxCPK3UewuNmzP4/a1R/0=
X-Google-Smtp-Source: ABdhPJxbqu4tYYzo9X7w2byyzKFiB7b+to6hkE0G2bD3xZQ3Dh2ku5IWQzN+yN8NAFRXCFg4RpKnZQ==
X-Received: by 2002:a9d:6153:: with SMTP id c19mr8644673otk.341.1621610318407;
        Fri, 21 May 2021 08:18:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s4sm1370351otr.80.2021.05.21.08.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 08:18:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 21 May 2021 08:18:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     JP Ertola <jp.ertola@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5] Extend watchdog timeout during kernel panic.
Message-ID: <20210521151836.GA2077758@roeck-us.net>
References: <20210205184620.56103-1-jp.ertola@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210205184620.56103-1-jp.ertola@hpe.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 05, 2021 at 10:46:20AM -0800, JP Ertola wrote:
> If the watchdog timeout is set such that the crash kernel does not
> have time to collect a coredump and the crash kernel is not equipped to
> ping the watchdog timer itself, then a kernel coredump will not be collected
> before the watchdog fires. This change registers a panic notifier and
> callback so the watchdog timeout can be extended if a kernel panic occurs.
> This timeout extension would give the crash kernel enough time to collect
> a coredump before the CPU resets. The watchdog timeout is extended if and only
> if a crash kernel image is loaded in memory, the watchdog is active at the
> time of the panic, and the kconfig setting is set.
> 
> A Kconfig option has been added to configure the timeout duration at
> compile-time. Default is zero seconds.
> 
> Signed-off-by: JP Ertola <jp.ertola@hpe.com>
> ---
> v5: Clean up variable names and spacing. Call __watchdog_ping() instead of 
> wdd->ops->ping(). Remove notifier_from_errno() as it could cause unintended
> behavior in the future if this watchdog extension notifier has its priority
> elevated above minimum.
> v4: Remove optional callback mechanism alltogether. I agree with Guenter,
> not widely used.
> v3: Fix logic so timeout extension is not longer than wdd->max_timeout
> v2: Remove dead code and comments.
> 
>  drivers/watchdog/Kconfig        | 13 ++++++
>  drivers/watchdog/watchdog_dev.c | 73 ++++++++++++++++++++++++++++++++-
>  include/linux/watchdog.h        |  1 +
>  3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index fd7968635e6d..f1055985e100 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -141,6 +141,19 @@ comment "Watchdog Device Drivers"
>  
>  # Architecture Independent
>  
> +config DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT
> +	int "Default timeout for watchdog timer before crash kernel starts (seconds)"
> +	default 0
> +	help
> +	  This option allows an extended timeout to be used for the watchdog when
> +	  the kernel panics and a crash kernel is about to start. This is helpful
> +	  when the existing WDT timeout value is less than the time required for
> +	  crash kernel to run and the crash kernel is unable to handle the
> +	  the watchdog itself. The timeout extension happens last in chain of
> +	  kernel panic handler callbacks just in case another panic handler
> +	  hangs unexpectedly. When this value is set to 0, the watchdog timeout
> +	  will not be changed.
> +
>  config SOFT_WATCHDOG
>  	tristate "Software watchdog"
>  	select WATCHDOG_CORE
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a63110..92d11ef9fbb4 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -34,6 +34,7 @@
>  #include <linux/init.h>		/* For __init/__exit/... */
>  #include <linux/hrtimer.h>	/* For hrtimers */
>  #include <linux/kernel.h>	/* For printk/panic/... */
> +#include <linux/kexec.h>	/* For checking if crash kernel is loaded */
>  #include <linux/kthread.h>	/* For kthread_work */
>  #include <linux/miscdevice.h>	/* For handling misc devices */
>  #include <linux/module.h>	/* For module stuff/... */
> @@ -82,6 +83,8 @@ static bool handle_boot_enabled =
>  
>  static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
>  
> +static unsigned int wdt_panic_timeout = CONFIG_DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT;
> +
>  static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
>  {
>  	return ktime_after(ktime_get(), data->open_deadline);
> @@ -658,6 +661,50 @@ static int watchdog_ioctl_op(struct watchdog_device *wdd, unsigned int cmd,
>   *	off the watchdog (if 'nowayout' is not set).
>   */
>  
> +static int watchdog_panic_notifier(struct notifier_block *nb,
> +	unsigned long code, void *data)
> +{
> +	struct watchdog_device *wdd;
> +	int ret;
> +	unsigned int timeout = wdt_panic_timeout;
> +
> +	if (wdt_panic_timeout == 0)
> +		return NOTIFY_DONE;
> +
> +	wdd = container_of(nb, struct watchdog_device, panic_nb);
> +
> +	if (watchdog_timeout_invalid(wdd, wdt_panic_timeout)) {
> +		timeout = min(wdt_panic_timeout, wdd->max_timeout);

This won't work if  wdd->min_timeout is set to a value larger than the
requested value. It also won't work if max_timeout is not set at all
(as is the case for drivers using max_hw_heartbeat_ms instead).

Guenter
