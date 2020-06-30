Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0345920FE83
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 23:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgF3VJ2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 17:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgF3VJ0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 17:09:26 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B89C061755;
        Tue, 30 Jun 2020 14:09:25 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i4so10049527pjd.0;
        Tue, 30 Jun 2020 14:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nle9q/I2WmcTDWkIeGImpTE6kZySiYcgCMt9ErxKHI4=;
        b=cMiUua/XFHImUyztomKWI7ea2hGXdpjfuJLS3T23wHQNDkQLF7VJxb6uk/7SFy0nCg
         B1SgCzfyTfP+8QyDXl1vbBuA3z+gdolIf3eg5KzKCiy5dXHn1zPkmI1bIkQhPTpPMmmu
         x8ckFlT4LD0mUIxIBYkGJMVyiQxFCoUvs6G+AxxBv7DAayW8AwR4w5Y+aSxeVN1fzmgp
         y0fzgjVGSwq8Lo9QyTdZ1GVFdUBY5JhqEc9SsiE8kgWLscMvBz+f1a6Qhg4h7OVu7h6t
         y275h94JgI94SaWAiINRNUZDIpy1XcJr6ZfFDiB/5nVvQmvtDuyx0dlgAssNzQS28UYO
         6O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nle9q/I2WmcTDWkIeGImpTE6kZySiYcgCMt9ErxKHI4=;
        b=fgHxzCa0x/9Lm0sAVcQlYMJO7M8G2QrAX/aaFjvGhRnUTeJSd47h0k9XujG1f0IA/m
         55KqF8ucjH5gHJXRf9akQIyhRXxJ5I7iALtWrHUfOQ8LhaBZszSOdElwIRIBCtlLPAge
         1RN4GDAlOgtXISS2aUlNXEtWIy+8ZrtZY85WLpZf9Xa36ir2U3uDj7fEHiAuJviGD7s5
         j536RRmgdGhAC0qcBjf7PDHKpPVe3k2tKf+SPA/yeczZlz+dnaWxTW8WoASgBHJKPClP
         qLWcah1Hs7GtfW7RsBNTuTqdGvwqFmXaJIIlXeO8a8KrVOLzw+/ODRadpotiRcHwSXwQ
         xJwA==
X-Gm-Message-State: AOAM532Jt7r6gvCFiDBH9asW2tW79hAdA0x3m5n+K7BSEeOZwBIuy+7C
        f2f2R6S9oJoc6TigKOFIfgZT/E1P
X-Google-Smtp-Source: ABdhPJxl65sBJusxgfBadBXFrk0DdHIJwcvtrhIyKndfZF7j2YY/vgcvL1CTNMXzeamhZhcubVypiw==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id na15mr24152405pjb.33.1593551365340;
        Tue, 30 Jun 2020 14:09:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e8sm3655841pff.185.2020.06.30.14.09.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 14:09:24 -0700 (PDT)
Date:   Tue, 30 Jun 2020 14:09:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Knud Poulsen <knpo@ieee.org>, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/8] watchdog: f71808e_wdt: clear watchdog timeout
 occurred flag
Message-ID: <20200630210924.GA23191@roeck-us.net>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
 <20200611191750.28096-5-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611191750.28096-5-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 11, 2020 at 09:17:45PM +0200, Ahmad Fatoum wrote:
> The flag indicating a watchdog timeout having occurred normally persists
> till Power-On Reset of the Fintek Super I/O chip. The user can clear it
> by writing a `1' to the bit.
> 
> The driver doesn't offer a restart method, so regular system reboot
> might not reset the Super I/O and if the watchdog isn't enabled, we
> won't touch the register containing the bit on the next boot.
> In this case all subsequent regular reboots will be wrongly flagged
> by the driver as being caused by the watchdog.
> 
> Fix this by having the flag cleared after read. This is also done by
> other drivers like those for the i6300esb and mpc8xxx_wdt.
> 
> Fixes: b97cb21a4634 ("watchdog: f71808e_wdt: Fix WDTMOUT_STS register read")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index 8e5584c54423..26bf366aebc2 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -706,6 +706,13 @@ static int __init watchdog_init(int sioaddr)
>  	wdt_conf = superio_inb(sioaddr, F71808FG_REG_WDT_CONF);
>  	watchdog.caused_reboot = wdt_conf & BIT(F71808FG_FLAG_WDTMOUT_STS);
>  
> +	/*
> +	 * We don't want WDTMOUT_STS to stick around till regular reboot.
> +	 * Write 1 to the bit to clear it to zero.
> +	 */
> +	superio_outb(sioaddr, F71808FG_REG_WDT_CONF,
> +		     wdt_conf | BIT(F71808FG_FLAG_WDTMOUT_STS));
> +
>  	superio_exit(sioaddr);
>  
>  	err = watchdog_set_timeout(timeout);
