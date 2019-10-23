Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8189E1EC3
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Oct 2019 17:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390561AbfJWPCv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Oct 2019 11:02:51 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44993 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390541AbfJWPCu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Oct 2019 11:02:50 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so13092302pfn.11;
        Wed, 23 Oct 2019 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+CWAItAYmWIbjE19EtlFeNSpGXkB58kb+qP39bZy8Bs=;
        b=cHO2Z3KYDcZ6jRjBOOsAdswjJsCO6jmKU63I/rEGv5PiEh8iOVyQn6Y4+cuuRQfcaz
         Q9GjAXRWEUDQQIikmKGh9G/J7S2U/YTt/0M/1BemR8O+SoBihQthJicMMqU584lNiQI2
         i5uyFvk2MuRt1+ly4oop4VZ5RyHl1vrsCvERijBroBqXoxtmEQNvm7w4IdKve9/hCyd5
         rLyNKVqekuRF+Yd9VjARoWbQs35DUYjs3DVpgaUNGiZ8mKn9F+Hei9VfiyVoArfeeUu/
         FrHqOYXCqG6c/z6trRd7r1i/NGJc+258GqekbGmbnci3VmSGjUI/qKE3KlPBNkw1qjKy
         uC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+CWAItAYmWIbjE19EtlFeNSpGXkB58kb+qP39bZy8Bs=;
        b=ubOaBS7TG7GHqWjreMKgr8lrPIWA3E2yhveGVoNs036WPvY6Y/E3uwxTN+2svM1bOu
         YyrNfN7q1bkf2fGyBFDBU3GnDsUW4l1bB0N8NXztnmkzs0j8n1ZnoIqRj5bhv6rVCW/4
         tBrKBT17Asb7jaD7A9SO7MP3LiRhp+4b96MDnynhfaZHR3DJSIIKMp1wXjBujGFKtBjQ
         U/3tr08r5ppHJwi/lw1gu6EfOUkPi2ixe0j7WNKUCkRSu+wxh9bfg8FUis20ekFW1hX/
         ELRlT2qrI6XMfIQ+y2tRaFCTFHEaNyIsxkycmfzvfBEZjVnRuRMCurgvzJ7hDf+DInJ0
         daKQ==
X-Gm-Message-State: APjAAAUdrgwMakYvPjR+T5u+ALa//LH1a5s0I7ZeIc56z6jwjVZ/Gg+l
        tczC+nAeG9/PRLXfBWHvx/c=
X-Google-Smtp-Source: APXvYqw+Awo/GLWhReDYxPmFXdeJ11IFaR/cRmaKL8N3spZeTAhOx2dIIPJ9KGcQrzQ/Dy5XC4WKJw==
X-Received: by 2002:a63:28f:: with SMTP id 137mr9514675pgc.301.1571842969959;
        Wed, 23 Oct 2019 08:02:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p66sm25021811pfg.127.2019.10.23.08.02.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:02:49 -0700 (PDT)
Date:   Wed, 23 Oct 2019 08:02:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: bd70528: Add MODULE_ALIAS to allow module auto
 loading
Message-ID: <20191023150248.GB16612@roeck-us.net>
References: <20191023124159.GA3490@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023124159.GA3490@localhost.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 23, 2019 at 03:41:59PM +0300, Matti Vaittinen wrote:
> The bd70528 watchdog driver is probed by MFD driver. Add MODULE_ALIAS
> in order to allow udev to load the module when MFD sub-device cell for
> watchdog is added.
> 
> Fixes: bbc88a0ec9f37 ("watchdog: bd70528: Initial support for ROHM BD70528 watchdog block")
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> I'm not really sure if this is a bug-fix or feature but I guess the
> Fixes tag won't harm, right?
> 
>  drivers/watchdog/bd70528_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/bd70528_wdt.c b/drivers/watchdog/bd70528_wdt.c
> index b0152fef4fc7..bc60e036627a 100644
> --- a/drivers/watchdog/bd70528_wdt.c
> +++ b/drivers/watchdog/bd70528_wdt.c
> @@ -288,3 +288,4 @@ module_platform_driver(bd70528_wdt);
>  MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
>  MODULE_DESCRIPTION("BD70528 watchdog driver");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:bd70528-wdt");
> -- 
> 2.21.0
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
