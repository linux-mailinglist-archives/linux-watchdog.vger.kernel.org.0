Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C239316901F
	for <lists+linux-watchdog@lfdr.de>; Sat, 22 Feb 2020 17:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgBVQGl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 22 Feb 2020 11:06:41 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35905 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbgBVQGl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 22 Feb 2020 11:06:41 -0500
Received: by mail-pj1-f66.google.com with SMTP id gv17so2131312pjb.1;
        Sat, 22 Feb 2020 08:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OUyZReR6lz2dUNJN6kxLdQmelZWRTkU7hAYMvVYcy5E=;
        b=WRgCQOSRyjUBTk7HRsWsUBVgpLcLjeVagIK67ZsYqrcjK5tnQ8Rkp1Zpe9aJWnk11p
         vPgUTZcq4hBb3QQbbJuB0/oFeNm8kzcHSGH6YEg9FQFSDchYumVzIajtmCwC2izL1LK7
         wADBgfn5Gkxr297a2nZvRsqWc0hOxmytQxAVpOp0Rck64S2eKKWsXc0Vu3feZkzdcA9h
         dBVUxyWCUYhwIa0j9Bt4lxlQ47tMJc335cJroT83nnAIYm23gG35w4cl3OKGMZOlUgn7
         qk9fmmK+ybhxADKgIoUVt8R6zJjY4BydzzTSO/NoHrmnD1ShOGCqrhf1Vq4txGvUEm0S
         c2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=OUyZReR6lz2dUNJN6kxLdQmelZWRTkU7hAYMvVYcy5E=;
        b=Z+sHXVqS0gTLMVvhMR0HegOI3TrWVy32YVgF1D3yK7LHZsbLgIA0wFu+VaPxhpXgwS
         Uo0fRM2VumkqAKMDV+/diSRIyYsiZzGFIgCXMtdCqCMW8KzOESi//kUnjYwQKMNGiWd+
         Z1CwtZJOuhGOi+hXdhw5+ZEpO52btq31vV9oBBxnUJ4eXdBahkxj5qU3Sz4fI6/hM+qx
         baezgXJL5pykpypIu7GFXEuOtgW1Nhz9ryAf15HaKNAkUDKuBOc2/sgTosD9JBaftob2
         nm+CYCwnwI+/R6XaIHVA3f3kAbADAtSCwFNubS7dcoId0RvzCT14YqpRo0M29gHYsAng
         KngQ==
X-Gm-Message-State: APjAAAW/nJDJelnkxqs3e93L7WuKpTQfwyWwAm+iH+Cw0Sx3jCwqez5w
        pPWIchZBETQ9ktnjdivOVn0=
X-Google-Smtp-Source: APXvYqzJrPgKz0z46Fe5b5qaFRqNprnj5Ys0jSiZsS54mdlsKP/k9Ac7PPnMHuti8GJgwm1p9KG1Jg==
X-Received: by 2002:a17:90a:930f:: with SMTP id p15mr10316715pjo.0.1582387600564;
        Sat, 22 Feb 2020 08:06:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t66sm6348718pgb.91.2020.02.22.08.06.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Feb 2020 08:06:39 -0800 (PST)
Date:   Sat, 22 Feb 2020 08:06:39 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Safonov <dima@arista.com>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCHv2] watchdog: Add stop_on_reboot parameter to control
 reboot policy
Message-ID: <20200222160639.GA12925@roeck-us.net>
References: <20200214162209.129107-1-dima@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214162209.129107-1-dima@arista.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 14, 2020 at 04:22:09PM +0000, Dmitry Safonov wrote:
> Many watchdog drivers use watchdog_stop_on_reboot() helper in order
> to stop the watchdog on system reboot. Unfortunately, this logic is
> coded in driver's probe function and doesn't allows user to decide what
> to do during shutdown/reboot.
> 
> On the other side, Xen and Qemu watchdog drivers (xen_wdt and i6300esb)
> may be configured to either send NMI or turn off/reboot VM as
> the watchdog action. As the kernel may stuck at any state, sending NMIs
> can't reliably reboot the VM.
> 
> At Arista, we benefited from the following set-up: the emulated watchdogs
> trigger VM reset and softdog is set to catch less severe conditions to
> generate vmcore. Just before reboot watchdog's timeout is increased
> to some good-enough value (3 mins). That keeps watchdog always running
> and guarantees that VM doesn't stuck.
> 
> Provide new stop_on_reboot module parameter to let user control
> watchdog's reboot policy.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
> Changes v1 => v2: Add module parameter instead of ioctl()
> 
>  drivers/watchdog/watchdog_core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 861daf4f37b2..5ead96199a0b 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -39,6 +39,10 @@
>  
>  static DEFINE_IDA(watchdog_ida);
>  
> +static int stop_on_reboot = -1;
> +module_param(stop_on_reboot, int, 0644);
> +MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
> +

My major concern is that this is writeable at runtime.
Changing the value won't change the behavior of already loaded
drivers. Unloading and reloading the driver will change its behavior
after the value was changed. This would be confusing, and it is hard
to imagine for anyone to expect such a behavior. Does this have to be
writeable ?

Guenter

>  /*
>   * Deferred Registration infrastructure.
>   *
> @@ -254,6 +258,14 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  		}
>  	}
>  
> +	/* Module parameter to force watchdog policy on reboot. */
> +	if (stop_on_reboot != -1) {
> +		if (stop_on_reboot)
> +			set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> +		else
> +			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> +	}
> +
>  	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
>  		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
>  
