Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D460A39475
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 20:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731948AbfFGSiz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 14:38:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42043 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731882AbfFGSiw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 14:38:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id e6so1585502pgd.9;
        Fri, 07 Jun 2019 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=634Wbw6XEbqz8DXTEGEpZ++9nfqwrkbPo8X9M+SYD5U=;
        b=P66dgPY9Fsn6tiAUlUM1CKjZGh1EjGBDoj1AEyQi4jjNVPsF9Mh+HcpXyvSoNdpoat
         SduFBIuuY3XV1lD9iHXsPoyLOvNhzA4npkaK5Ptfqq6CStBOfepTPuquOW9WV/UrR6P3
         /udf4h1Px713wbDMNMTrRaB42wsy4hqk0rIgTaWC0TG6tiZutiG2/jfPDow0c77yarlf
         sYepn+ACw0RPTA/g8YN2Ldc1a7nL79U9LCDWcWR2UdygyCb7Vw76M4dzhRIUU9fXYE4K
         sAipu/dyDi2RiYbG9Sge0iKi/PCYwmTMyTdibyiydrFPMJLkNInn02kHNqzDqTTbRZz0
         3KrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=634Wbw6XEbqz8DXTEGEpZ++9nfqwrkbPo8X9M+SYD5U=;
        b=DLN5XZji5SzSQby10MDCgqKIdJm2Hhw8FUsW8ZZBIbRYcgcSTgg7EFO632n8qxAopm
         khbnO/WkFMqS8LRZQU/0MQ06/iiUmqmxukUQCNhJ1n9Vflv0ro8V1eltigPYcibnTX7v
         Jr7+ihxs5VJB+EIfozujPx0LJ/ldFyLer/rzXhbnpqwhwXp+hHvUSxizk8MpwM+mqgZh
         Ng5dgOSeZweh1WeeibiRc2sr27tk1vt6utIdaJOPBDrn8fgLNuO2qbbyz+9e96b+7+pz
         5p+ACOdO6+mkQpBHi+uvlzBMeYCo5+0Ad5XbI5jrOaOEgnJe6WvLcNRvq8tMRm96/v23
         V1aA==
X-Gm-Message-State: APjAAAUUaUF6MSZKmsTNhFliWg9RIl4mBIlmBYaIbeX7rYgFxKLQAbvt
        3NRP7BFhi6vASrkQQpePmNo=
X-Google-Smtp-Source: APXvYqy9yrRlapDGwWJDRlvFTdA4VOdUiyAfxLLhxeni8Ahzn9XwACGPvonlNmknivjsCqakwuzi7Q==
X-Received: by 2002:a63:2ad2:: with SMTP id q201mr4189183pgq.94.1559932731164;
        Fri, 07 Jun 2019 11:38:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d5sm3425339pfn.25.2019.06.07.11.38.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 11:38:50 -0700 (PDT)
Date:   Fri, 7 Jun 2019 11:38:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: Re: [PATCH v10 1/3] watchdog: introduce watchdog.open_timeout
 commandline parameter
Message-ID: <20190607183849.GB32475@roeck-us.net>
References: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
 <20190605140628.618-2-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605140628.618-2-rasmus.villemoes@prevas.dk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 05, 2019 at 02:06:41PM +0000, Rasmus Villemoes wrote:
> The watchdog framework takes care of feeding a hardware watchdog until
> userspace opens /dev/watchdogN. If that never happens for some reason
> (buggy init script, corrupt root filesystem or whatnot) but the kernel
> itself is fine, the machine stays up indefinitely. This patch allows
> setting an upper limit for how long the kernel will take care of the
> watchdog, thus ensuring that the watchdog will eventually reset the
> machine.
> 
> A value of 0 (the default) means infinite timeout, preserving the
> current behaviour.
> 
> This is particularly useful for embedded devices where some fallback
> logic is implemented in the bootloader (e.g., use a different root
> partition, boot from network, ...).
> 
> There is already handle_boot_enabled serving a similar purpose. However,
> such a binary choice is unsuitable if the hardware watchdog cannot be
> programmed by the bootloader to provide a timeout long enough for
> userspace to get up and running. Many of the embedded devices we see use
> external (gpio-triggered) watchdogs with a fixed timeout of the order of
> 1-2 seconds.
> 
> The open timeout only applies for the first open from
> userspace. Should userspace need to close the watchdog device, with
> the intention of re-opening it shortly, the application can emulate
> the open timeout feature by combining the nowayout feature with an
> appropriate WDIOC_SETTIMEOUT immediately prior to closing the device.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/watchdog-parameters.txt          |  8 +++++
>  drivers/watchdog/watchdog_dev.c               | 36 ++++++++++++++++++-
>  2 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.txt b/Documentation/watchdog/watchdog-parameters.txt
> index 0b88e333f9e1..32d3606caa65 100644
> --- a/Documentation/watchdog/watchdog-parameters.txt
> +++ b/Documentation/watchdog/watchdog-parameters.txt
> @@ -8,6 +8,14 @@ See Documentation/admin-guide/kernel-parameters.rst for information on
>  providing kernel parameters for builtin drivers versus loadable
>  modules.
>  
> +The watchdog core parameter watchdog.open_timeout is the maximum time,
> +in seconds, for which the watchdog framework will take care of pinging
> +a running hardware watchdog until userspace opens the corresponding
> +/dev/watchdogN device. A value of 0 (the default) means an infinite
> +timeout. Setting this to a non-zero value can be useful to ensure that
> +either userspace comes up properly, or the board gets reset and allows
> +fallback logic in the bootloader to try something else.
> +
>  
>  -------------------------------------------------
>  acquirewdt:
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 252a7c7b6592..e4b51db48f0e 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -69,6 +69,7 @@ struct watchdog_core_data {
>  	struct mutex lock;
>  	ktime_t last_keepalive;
>  	ktime_t last_hw_keepalive;
> +	ktime_t open_deadline;
>  	struct hrtimer timer;
>  	struct kthread_work work;
>  	unsigned long status;		/* Internal status bits */
> @@ -87,6 +88,19 @@ static struct kthread_worker *watchdog_kworker;
>  static bool handle_boot_enabled =
>  	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
>  
> +static unsigned open_timeout;
> +
> +static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
> +{
> +	return ktime_after(ktime_get(), data->open_deadline);
> +}
> +
> +static void watchdog_set_open_deadline(struct watchdog_core_data *data)
> +{
> +	data->open_deadline = open_timeout ?
> +		ktime_get() + ktime_set(open_timeout, 0) : KTIME_MAX;
> +}
> +
>  static inline bool watchdog_need_worker(struct watchdog_device *wdd)
>  {
>  	/* All variables in milli-seconds */
> @@ -211,7 +225,13 @@ static bool watchdog_worker_should_ping(struct watchdog_core_data *wd_data)
>  {
>  	struct watchdog_device *wdd = wd_data->wdd;
>  
> -	return wdd && (watchdog_active(wdd) || watchdog_hw_running(wdd));
> +	if (!wdd)
> +		return false;
> +
> +	if (watchdog_active(wdd))
> +		return true;
> +
> +	return watchdog_hw_running(wdd) && !watchdog_past_open_deadline(wd_data);
>  }
>  
>  static void watchdog_ping_work(struct kthread_work *work)
> @@ -824,6 +844,15 @@ static int watchdog_open(struct inode *inode, struct file *file)
>  	if (!hw_running)
>  		kref_get(&wd_data->kref);
>  
> +	/*
> +	 * open_timeout only applies for the first open from
> +	 * userspace. Set open_deadline to infinity so that the kernel
> +	 * will take care of an always-running hardware watchdog in
> +	 * case the device gets magic-closed or WDIOS_DISABLECARD is
> +	 * applied.
> +	 */
> +	wd_data->open_deadline = KTIME_MAX;
> +
>  	/* dev/watchdog is a virtual (and thus non-seekable) filesystem */
>  	return stream_open(inode, file);
>  
> @@ -983,6 +1012,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
>  
>  	/* Record time of most recent heartbeat as 'just before now'. */
>  	wd_data->last_hw_keepalive = ktime_sub(ktime_get(), 1);
> +	watchdog_set_open_deadline(wd_data);
>  
>  	/*
>  	 * If the watchdog is running, prevent its driver from being unloaded,
> @@ -1181,3 +1211,7 @@ module_param(handle_boot_enabled, bool, 0444);
>  MODULE_PARM_DESC(handle_boot_enabled,
>  	"Watchdog core auto-updates boot enabled watchdogs before userspace takes over (default="
>  	__MODULE_STRING(IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) ")");
> +
> +module_param(open_timeout, uint, 0644);
> +MODULE_PARM_DESC(open_timeout,
> +	"Maximum time (in seconds, 0 means infinity) for userspace to take over a running watchdog (default=0)");
