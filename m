Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32A62ED350
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Jan 2021 16:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbhAGPM4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Jan 2021 10:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbhAGPMz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Jan 2021 10:12:55 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4442BC0612F5;
        Thu,  7 Jan 2021 07:12:15 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id q6so1634883ooo.8;
        Thu, 07 Jan 2021 07:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oS6XTzxTGJynF/v+3oQRJMAaz6k+ys04IiLQqnxFN1Q=;
        b=fzEwgL1st6Mf4afnR79dA+JA4m41foeuxy8zJ9pdLFnTAyuBA+EG4QiC/8/f6G2HF5
         BAOgcsArSfR80+V63bd11/RYYkJF33ZIlr1UbSEh/VIqaPFZLZ5yc9R2foCuVqpB0yHd
         htCDX4lP/8rVgG7qgbTrfeCgS8bK+GsjjRF8SjAiG6tb036z6fkqk6gh5f1k5EHvjxzj
         +rLVKLWvpx9UJ/4DitY91j/sGrjoJKLpfv39EKb/b/16LovbP7PkpiD71+b1PlGOxB4p
         srAw3gQpB+9zGJn3HdtMhFLbdihPgbb1ezIw0SiJ/UC1bjmHYZZWwh1kNqVOGuUKaT3r
         EsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=oS6XTzxTGJynF/v+3oQRJMAaz6k+ys04IiLQqnxFN1Q=;
        b=hoExi/ndiGS8kzJCl7b1lL3sc1d7b/4mT509Qzno1Lwl4/qv9dZKRMm4kSpQy9eDl3
         a5Bt9TldC/JZqbndcPGettdeau8Pimi02db3PeBHSJUSq/nYXrwwhJV5A90dGk2+uNwr
         PdOD7EQaP4G+rxnGyxASmjQsKvfuciqdIQFR5yIRdnrUCex3Nj74umq0mB4SliEHIN5q
         zxEaLQy172WCX9PNJ7HOTQOhS2y1q9NanLntfK3m9Jc9hVBM+qyCq/3UEa9MaxFOhBYf
         kMs+F7dmN6hAiZjHiwxYp2U5++gsrq/9aadXPcO/LtCAPvAmZYAFrDKg7ukR6XwKDQIU
         R6sg==
X-Gm-Message-State: AOAM532ySiKGruVACOEIQ6pUylzgPBKJdbaNu1mRksTYOfI+u8IZmu6y
        +WFtgg2wFKMXM1uQzcGt0rtmoG1iaTI=
X-Google-Smtp-Source: ABdhPJxCFjsGieAl1wh4RxFwUXrXhpf2i5K1U1XrPn522li91vPhwPQq4dukDJV6Fik8Tw8Hlzev1w==
X-Received: by 2002:a4a:901a:: with SMTP id i26mr1416333oog.42.1610032334378;
        Thu, 07 Jan 2021 07:12:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r8sm1176479oth.20.2021.01.07.07.12.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 07:12:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 7 Jan 2021 07:12:11 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: bd70528: don't crash if WDG is confiured
 with BD71828
Message-ID: <20210107151211.GA13040@roeck-us.net>
References: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jan 07, 2021 at 08:37:03AM +0200, Matti Vaittinen wrote:
> If config for BD70528 watchdog is enabled when BD71828 or BD71815
> are used the RTC module will issue call to BD70528 watchdog with
> NULL data. Ignore this call and don't crash.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

I really think this should be handled in the calling code.
Also, I am curious how this is supposed to work.

The code is called with

	ret = bd70528_wdt_set(r->parent, new_state & BD70528_WDT_STATE_BIT,
                              old_state);

from bd70528_set_rtc_based_timers(). That same function subsequently
calls bd70528_set_elapsed_tmr() with the same parameter, and that
parameter is dereferenced in bd70528_set_elapsed_tmr() without checking.

Conceptually, it should not be necessary to determine at compile-time
which of the chips is in the system. It should be posible to compile
a single kernel which supports all chips.

Guenter

> ---
>  drivers/watchdog/bd70528_wdt.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/watchdog/bd70528_wdt.c b/drivers/watchdog/bd70528_wdt.c
> index 0170b37e6674..fde242b8a4a6 100644
> --- a/drivers/watchdog/bd70528_wdt.c
> +++ b/drivers/watchdog/bd70528_wdt.c
> @@ -49,6 +49,21 @@ int bd70528_wdt_set(struct rohm_regmap_dev *data, int enable, int *old_state)
>  	u8 wd_ctrl_arr[3] = { WD_CTRL_MAGIC1, WD_CTRL_MAGIC2, 0 };
>  	u8 *wd_ctrl = &wd_ctrl_arr[2];
>  
> +	/*
> +	 * BD71828 and BD71815 use same RTC driver as BD70528.
> +	 * BD71815 and BD71828 do not need MFD data as they do not share
> +	 * RTC counter with watchdog. The BD70528 watchdog should not be
> +	 * compiled in with BD71815 or BD71828 and the stub implementation
> +	 * for the bd70528_wdt_set should be provided instead.
> +	 *
> +	 * If one compiles this watchdog with BD71828 or BD71815 - the call
> +	 * from RTC may get here and the data pointer is NULL. In that case,
> +	 * warn and go out.
> +	 */
> +	if (!data) {
> +		pr_warn("BD70528_WATCHDOG misconfigured\n");
> +		return 0;
> +	}
>  	ret = regmap_read(bd70528->chip.regmap, BD70528_REG_WDT_CTRL, &tmp);
>  	if (ret)
>  		return ret;
> 
> base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
> -- 
> 2.25.4
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
