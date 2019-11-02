Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F988ECF89
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Nov 2019 16:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfKBPlK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 Nov 2019 11:41:10 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33664 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfKBPlK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 Nov 2019 11:41:10 -0400
Received: by mail-pf1-f195.google.com with SMTP id c184so9049692pfb.0
        for <linux-watchdog@vger.kernel.org>; Sat, 02 Nov 2019 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XZAZpKoQn3+iSD250j3yIINsji2QuHyQbAMk1tcS3zg=;
        b=JMwF18iQ1Cj7EXOya72VLDJ5qWoDVwLZtDeF4tNrdhafiXxK/Lmz/RHg1zd/fMXTUJ
         sk3nkiSdfxhYSGobx+7hY5G89PXMb3n4qeYuyqqEe8nQ9hXGRaW43MI9ZlKi5LIFm0jV
         D7oqM8I3l/P4kBgIcuYsUr8NWXDp/eW9gOKAQ/UKY+deVksHmD6HKH+mZJUU2vTJuT4L
         eceu8uJ232z0flU2sm2bAQvrOk/OsE58gwGqlfILJ1D3uG5SGWGESXuY1tZ43Qa4vatT
         WnAQrZe/L+/v22mJ9wHJ16XPuLcVBxFz2lQJCmZ+4SrwSPyEJPJ68FWgn+9N5Iobr8zi
         Z5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XZAZpKoQn3+iSD250j3yIINsji2QuHyQbAMk1tcS3zg=;
        b=CHMuCIb5VJ+qHdniQ7FQWBAOA5tzXnynbw0g00Wyx6dEm0gotQ5KkF7BcvOs/DI4qE
         kti5m3DZ19zdnFia+Da//7XrwH18k3b48FlGJXXFbabjnjJZDWaPPM6QEsVxCt9W97I0
         ufYqA/F1/x0/N6zelgxOWvChDeGOoffrKEX2IkM+9l1AVJJSmJqQmcAIZ5F/LVNq9LCW
         sYu6SaA/DsP5ZHdlbPxgth2bq5riAE6W394tGGJ5nx7t0iBdIJdEwwj3c0ThA0gava06
         pf4J1qTSfdqLkcWHjqXUv+z+K04vPDEf1k7dAUhMO4DaCATvgPW8whcG3jKbZxIpXuFk
         FLbg==
X-Gm-Message-State: APjAAAUUxYo+e/kGbG1skgpBR35lAvXYiLlQDP+2lL8g0s0vOMlqRkQ3
        PCisEriXuT8qQzHG/DC3fxY=
X-Google-Smtp-Source: APXvYqyZeHnh+Ocyt6b1VZgxM88UyiSvUpptcVp5G5gkweqLlGjZKd2LCZL3NG6oBkI7c/wR1A64kg==
X-Received: by 2002:a63:bc11:: with SMTP id q17mr20551784pge.223.1572709266916;
        Sat, 02 Nov 2019 08:41:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 6sm11212711pfy.43.2019.11.02.08.41.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2019 08:41:06 -0700 (PDT)
Date:   Sat, 2 Nov 2019 08:41:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Anson.Huang@nxp.com, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 5/5] watchdog: imx7ulp: Use definitions instead of magic
 values
Message-ID: <20191102154105.GA17459@roeck-us.net>
References: <20191029174037.25381-1-festevam@gmail.com>
 <20191029174037.25381-5-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029174037.25381-5-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 29, 2019 at 02:40:37PM -0300, Fabio Estevam wrote:
> Use definitions instead of magic values in order to improve readability.
> 
> Since the CLK field of the WDOG CS register is composed of two bits
> to select the watchdog clock source, use a shift representation
> instead of BIT().
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx7ulp_wdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index bcef3b6a9782..e3c1382dac52 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -17,6 +17,9 @@
>  #define WDOG_CS_CMD32EN		BIT(13)
>  #define WDOG_CS_ULK		BIT(11)
>  #define WDOG_CS_RCS		BIT(10)
> +#define LPO_CLK			0x1
> +#define LPO_CLK_SHIFT		8
> +#define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
>  #define WDOG_CS_EN		BIT(7)
>  #define WDOG_CS_UPDATE		BIT(5)
>  
> @@ -143,7 +146,7 @@ static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
>  	/* set an initial timeout value in TOVAL */
>  	writel(timeout, base + WDOG_TOVAL);
>  	/* enable 32bit command sequence and reconfigure */
> -	val = BIT(13) | BIT(8) | BIT(5);
> +	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
>  	writel(val, base + WDOG_CS);
>  }
>  
