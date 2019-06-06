Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94FC037F6A
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 23:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfFFVT1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jun 2019 17:19:27 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33558 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfFFVT1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jun 2019 17:19:27 -0400
Received: by mail-pg1-f193.google.com with SMTP id h17so2069006pgv.0;
        Thu, 06 Jun 2019 14:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hfZAdBE3k2/ADylfkLAgPJ6OT4ZxvmQkYV/g7J84j0I=;
        b=N7Uf3Y69HNBwqAe0z/khtYdG+ISOR5MdvbXrYlG9M5DDG7xnpesK1054wTJRgMt4Mv
         yaheoA7lzB6TkoexneY0Kwqa7wCNw5TQqY/4httbOhTPQdUV/GnKdyH++H92xs1jB7yT
         4tF8Fn0+v9w+O/Iyfs27PJdYXKNrJs3o8MjhmT8damPM0DM9Kk+571d0xyx819MH2IHL
         H4DCgVY5g1jOgHe+/ysl0YiLtfgiiPQYiiR/5Jj/QFR2d6Ysap7krxES3mVXQoJ36SKn
         7gtP2tTvHnCzJ3SmVG5sIF7RQp+MmZwvuOSPJGsajxIa+PvotGTi70YX9qtTHDFBDwew
         ni4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hfZAdBE3k2/ADylfkLAgPJ6OT4ZxvmQkYV/g7J84j0I=;
        b=hDU7YHX8oEY9cNTTvUF30/9VzLelgDu8teMIt+ozRvazO7rSQcYq2DNPthIEkivlhn
         /DJSZMs+VmCbXnlGB9EahGWYwtxNz3znN+ol6G8ytUiBoZiCLJ1AnG/iQXlvV1ocZz9L
         JyDqnYZ4xfLSt+YzeonLt3XEirWGt3GmMGqMhTjFy05Qc6ksmufKRo475503OBpPrdu9
         n/49y/mJfPnnPozo/Vurvv8fNuLXyMh8XTuXW5qZ8jaUUahFO0go/rVeZ4FjhJ1qkGwz
         +F84IIcpCz1A87ypbu/pYtTun7/7sDWhPgKaI0cyJTyq9y4clo1IlzuzhDVO1pG9g/sq
         6qfA==
X-Gm-Message-State: APjAAAUU3XR6RECrqdieLKHPcAYTrzQzu/z0hm0tt4SVO+3iw6uZlLpv
        kaSxCj6bl+gOI3l/WulfIG0=
X-Google-Smtp-Source: APXvYqy4Sd68ZM5XBvSech+lcV4IEPhX+RiIVIh3vx4M9PfZKVmPqrA40LZLl46oJs6VBlSnhSXjPg==
X-Received: by 2002:a17:90a:bb8a:: with SMTP id v10mr1934526pjr.78.1559855966636;
        Thu, 06 Jun 2019 14:19:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b16sm86668pfd.12.2019.06.06.14.19.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 14:19:26 -0700 (PDT)
Date:   Thu, 6 Jun 2019 14:19:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk
Subject: Re: [PATCH 4/6] watchdog/hpwdt: Add module parameter kdumptimeout.
Message-ID: <20190606211925.GC1299@roeck-us.net>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
 <1558126783-4877-5-git-send-email-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558126783-4877-5-git-send-email-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 17, 2019 at 02:59:41PM -0600, Jerry Hoemann wrote:
> Instead of unconditionally stopping the watchdog timer after receipt of
> a pretimeout NMI, reprogram the timeout based upon module parameter
> kdumptimeout.
> 
> The provides a more flexible override than the depricated allow_kdump.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index aa4101c..dc65006 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -29,7 +29,8 @@
>  #define HPWDT_VERSION			"2.0.2"
>  #define SECS_TO_TICKS(secs)		((secs) * 1000 / 128)
>  #define TICKS_TO_SECS(ticks)		((ticks) * 128 / 1000)
> -#define HPWDT_MAX_TIMER			TICKS_TO_SECS(65535)
> +#define HPWDT_MAX_TICKS			65535
> +#define HPWDT_MAX_TIMER			TICKS_TO_SECS(HPWDT_MAX_TICKS)
>  #define DEFAULT_MARGIN			30
>  #define PRETIMEOUT_SEC			9
>  
> @@ -37,6 +38,7 @@
>  static unsigned int soft_margin = DEFAULT_MARGIN;	/* in seconds */
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  static bool pretimeout = IS_ENABLED(CONFIG_HPWDT_NMI_DECODING);
> +static int kdumptimeout = -1;
>  
>  static void __iomem *pci_mem_addr;		/* the PCI-memory address */
>  static unsigned long __iomem *hpwdt_nmistat;
> @@ -56,6 +58,7 @@
>  	{0},			/* terminate list */
>  };
>  
> +static struct watchdog_device hpwdt_dev;
>  /*
>   *	Watchdog operations
>   */
> @@ -94,12 +97,18 @@ static int hpwdt_stop_core(struct watchdog_device *wdd)
>  	return 0;
>  }
>  
> +static void hpwdt_ping_ticks(int val)
> +{
> +	val = min(val, HPWDT_MAX_TICKS);
> +	iowrite16(val, hpwdt_timer_reg);
> +}
> +
>  static int hpwdt_ping(struct watchdog_device *wdd)
>  {
>  	int reload = SECS_TO_TICKS(min(wdd->timeout, wdd->max_hw_heartbeat_ms/1000));
>  
>  	dev_dbg(wdd->parent, "ping  watchdog 0x%08x:0x%08x\n", wdd->timeout, reload);
> -	iowrite16(reload, hpwdt_timer_reg);
> +	hpwdt_ping_ticks(reload);
>  
>  	return 0;
>  }
> @@ -175,7 +184,14 @@ static int hpwdt_pretimeout(unsigned int ulReason, struct pt_regs *regs)
>  	if (ilo5 && !pretimeout && !mynmi)
>  		return NMI_DONE;
>  
> -	hpwdt_stop();
> +	if (kdumptimeout < 0)
> +		hpwdt_stop();
> +	else if (kdumptimeout == 0)
> +		;
> +	else {
> +		unsigned int val = max((unsigned int)kdumptimeout, hpwdt_dev.timeout);
> +		hpwdt_ping_ticks(SECS_TO_TICKS(val));
> +	}
>  
>  	hex_byte_pack(panic_msg, mynmi);
>  	nmi_panic(regs, panic_msg);
> @@ -328,6 +344,7 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  		pretimeout = 0;
>  	}
>  	hpwdt_dev.pretimeout = pretimeout ? PRETIMEOUT_SEC : 0;
> +	kdumptimeout = min(kdumptimeout, HPWDT_MAX_TIMER);
>  
>  	hpwdt_dev.parent = &dev->dev;
>  	retval = watchdog_register_device(&hpwdt_dev);
> @@ -342,6 +359,7 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  				hpwdt_dev.timeout, nowayout);
>  	dev_info(&dev->dev, "pretimeout: %s.\n",
>  				pretimeout ? "on" : "off");
> +	dev_info(&dev->dev, "kdumptimeout: %d.\n", kdumptimeout);
>  
>  	if (dev->subsystem_vendor == PCI_VENDOR_ID_HP_3PAR)
>  		ilo5 = true;
> @@ -387,6 +405,9 @@ static void hpwdt_exit(struct pci_dev *dev)
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  		__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +module_param(kdumptimeout, int, 0444);
> +MODULE_PARM_DESC(kdumptimeout, "Timeout applied for crash kernel transition in seconds");
> +
>  #ifdef CONFIG_HPWDT_NMI_DECODING
>  module_param(pretimeout, bool, 0);
>  MODULE_PARM_DESC(pretimeout, "Watchdog pretimeout enabled");
