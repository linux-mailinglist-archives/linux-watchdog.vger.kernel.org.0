Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E42839479
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 20:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731652AbfFGSj3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 14:39:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35898 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731537AbfFGSj3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 14:39:29 -0400
Received: by mail-pg1-f195.google.com with SMTP id a3so1599331pgb.3;
        Fri, 07 Jun 2019 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JbalNf71xDP2Vajkb3fOdGewExTTQMZgzOLkaA1msfw=;
        b=cwiJjKBwmZhXgm2bXeff6YplRv8jbTi2t8ZcdtNQLplfx94ThLXnsrulDUDLcCzWnF
         mz9jC50KaxosD2/5SsqdgDAk2PfLackvbSYVO7goOJMCp3VqlXKYzS0ps2bIQKb0RYDs
         yEzBxa9aKDUjnP1ccP1MdIoKMRByRNCMgP/q/gk1OKNuqyCj1LFpt/QQ9UYVqpiRTxF6
         4tjT0UcmAPDwuXnY4IiNRJ7GEunlBBcC+B2eei6NwoHWraegiS6WkhjRSwei7a32c4Ud
         psPFAtSClAIpps3RvGFqsEt/IPp+oORRpTILqjDDMEmZNPF8h87IZDJuq6k1NBiiy2cV
         s2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JbalNf71xDP2Vajkb3fOdGewExTTQMZgzOLkaA1msfw=;
        b=FaiYDh2awyBQPTeJJH9ukFPBTIO6CX7LdfvkPb4i2FFtXv1t0Xtdqfo/WQywQNpT4S
         eTEq/Y8vJ4QoiMreBhxZOjOPsEzhN4Ce2RqvwXQo+N8s14yZ+sQz7wLziik53KtYfzqQ
         JuaqdepnDkTKAzLPxVDA8q2oNpI+8S1iCh/h3Ypl/ykr0Fb8Tct6IJJhM68kZfHYWhgD
         FQ0L6KavwxwA36m9vvEBkkyohMz5cw6q97do2+KLJBWEyp9TK9qWZYtY6S/T+kpWkqPx
         LvNN57VQ9ac1BKmXV2aJpwL25fifMPbTy+tCBvSL9fPcNecM4/Y907Movtrdb/q8dncT
         vUxQ==
X-Gm-Message-State: APjAAAXMiTqEdSx+zFNnYOJyVNdxyNmEbHYfqDgM/vO+SoZBZk/HfwtP
        XTlDLSGTkcoYXb7GfgEeSLw=
X-Google-Smtp-Source: APXvYqx+paVFyqGNPvaMn5cBSnsM91qEGclwUWeNHKtVSvHG7CdSPrHZeraEZX3V6XfaGy3gHqJwDg==
X-Received: by 2002:a17:90a:2008:: with SMTP id n8mr7280526pjc.4.1559932768138;
        Fri, 07 Jun 2019 11:39:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z18sm2856958pfa.101.2019.06.07.11.39.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 11:39:27 -0700 (PDT)
Date:   Fri, 7 Jun 2019 11:39:26 -0700
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
Subject: Re: [PATCH v10 2/3] watchdog: introduce CONFIG_WATCHDOG_OPEN_TIMEOUT
Message-ID: <20190607183926.GC32475@roeck-us.net>
References: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
 <20190605140628.618-3-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605140628.618-3-rasmus.villemoes@prevas.dk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 05, 2019 at 02:06:43PM +0000, Rasmus Villemoes wrote:
> This allows setting a default value for the watchdog.open_timeout
> commandline parameter via Kconfig.
> 
> Some BSPs allow remote updating of the kernel image and root file
> system, but updating the bootloader requires physical access. Hence, if
> one has a firmware update that requires relaxing the
> watchdog.open_timeout a little, the value used must be baked into the
> kernel image itself and cannot come from the u-boot environment via the
> kernel command line.
> 
> Being able to set the initial value in .config doesn't change the fact
> that the value on the command line, if present, takes precedence, and is
> of course immensely useful for development purposes while one has
> console acccess, as well as usable in the cases where one can make a
> permanent update of the kernel command line.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/watchdog/watchdog-parameters.txt | 8 ++++----
>  drivers/watchdog/Kconfig                       | 9 +++++++++
>  drivers/watchdog/watchdog_dev.c                | 5 +++--
>  3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.txt b/Documentation/watchdog/watchdog-parameters.txt
> index 32d3606caa65..ec919dc895ff 100644
> --- a/Documentation/watchdog/watchdog-parameters.txt
> +++ b/Documentation/watchdog/watchdog-parameters.txt
> @@ -11,10 +11,10 @@ modules.
>  The watchdog core parameter watchdog.open_timeout is the maximum time,
>  in seconds, for which the watchdog framework will take care of pinging
>  a running hardware watchdog until userspace opens the corresponding
> -/dev/watchdogN device. A value of 0 (the default) means an infinite
> -timeout. Setting this to a non-zero value can be useful to ensure that
> -either userspace comes up properly, or the board gets reset and allows
> -fallback logic in the bootloader to try something else.
> +/dev/watchdogN device. A value of 0 means an infinite timeout. Setting
> +this to a non-zero value can be useful to ensure that either userspace
> +comes up properly, or the board gets reset and allows fallback logic
> +in the bootloader to try something else.
>  
>  
>  -------------------------------------------------
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index ffe754539f5a..a8bd621e12f8 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -58,6 +58,15 @@ config WATCHDOG_HANDLE_BOOT_ENABLED
>  	  the watchdog on its own. Thus if your userspace does not start fast
>  	  enough your device will reboot.
>  
> +config WATCHDOG_OPEN_TIMEOUT
> +	int "Timeout value for opening watchdog device"
> +	default 0
> +	help
> +	  The maximum time, in seconds, for which the watchdog framework takes
> +	  care of pinging a hardware watchdog.  A value of 0 means infinite. The
> +	  value set here can be overridden by the commandline parameter
> +	  "watchdog.open_timeout".
> +
>  config WATCHDOG_SYSFS
>  	bool "Read different watchdog information through sysfs"
>  	help
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index e4b51db48f0e..334b810db2cf 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -88,7 +88,7 @@ static struct kthread_worker *watchdog_kworker;
>  static bool handle_boot_enabled =
>  	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
>  
> -static unsigned open_timeout;
> +static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
>  
>  static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
>  {
> @@ -1214,4 +1214,5 @@ MODULE_PARM_DESC(handle_boot_enabled,
>  
>  module_param(open_timeout, uint, 0644);
>  MODULE_PARM_DESC(open_timeout,
> -	"Maximum time (in seconds, 0 means infinity) for userspace to take over a running watchdog (default=0)");
> +	"Maximum time (in seconds, 0 means infinity) for userspace to take over a running watchdog (default="
> +	__MODULE_STRING(CONFIG_WATCHDOG_OPEN_TIMEOUT) ")");
