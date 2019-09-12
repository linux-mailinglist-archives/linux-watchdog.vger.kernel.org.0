Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67750B1491
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2019 20:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfILSuk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Sep 2019 14:50:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43669 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfILSuk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Sep 2019 14:50:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id d15so16517529pfo.10;
        Thu, 12 Sep 2019 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=htLtsK6nBTlaXlGTe6WHh7tD8KMF4N4z9AXI9Nb4w84=;
        b=veltQHCrk7SGKczN6/t8n4TQWnXDlNiZS39OI6Clkn2PH2svxu3wvWAQ3nYlZ9vR1z
         EFfyya1AkDM1eKzkDMKYtJa9iUuWuUAVTDkVzkpo3qfBbEOagOawi5SxlqBxO4Cy0P9h
         9womSns+nvw7jYqsL3aVHzKJSCJh/38/0x9r+eQ7m/dntILECSqhyZJ3K+lD9hR3v3oK
         +ueghPBHct6vZLpUiRp6owkZHlx/v320HG4iwqcYfRXIhqC2ZGe8jJGWc5FZoCeSDJ0h
         Povw5gU00IMuNNBy6FmY1TvTeZMXSguwZZYXtJ9tcHXUby0+KP7MulE2AdoZ5wr+GYjH
         r2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=htLtsK6nBTlaXlGTe6WHh7tD8KMF4N4z9AXI9Nb4w84=;
        b=HUI2W2slqPj70q4kZaXnRskujmQ86kk5f8JHHhIhAHvmsvKReXZgsnptOOSllq2dLh
         RrbSHaSZD21oR34ukauqEmj4i4YpngCStttKen7OH5IGziiZIc1ihUFNgXBszsAcKNYK
         /QhiwsaHgt02CxhYU9+tf7RjmXaAe6IJW8Q009ONDyJ5pBw/6h7T8jrKYf5/QxFj2l2h
         ozOJ5ppeRg+H+auVvkqoR6kVQBwxj3NsDlDc+oQ2gFvOAq2Q2e0PJB6cg+JWSO0W3SFe
         rly60UlbhXwL+TEzomzfIQTeDUhkXyzXVdQKeM6RFn+A5DpFe767kjTCo/Owt0ePY77D
         P2jQ==
X-Gm-Message-State: APjAAAWM7aGe7T6kv8xAFwhfe8Pu/AMf3qYL6aZVIr39Re5EQrHsv/oo
        2uKWlCeZ1mfTryOSh+pDtg4=
X-Google-Smtp-Source: APXvYqzGxGK1zJI5SvQcuBqCnn0o/pfvW16jU2hstOLcGKKV6vW1pU7XR3dHBZCwOXm9WiLa7KJzjQ==
X-Received: by 2002:a17:90b:948:: with SMTP id dw8mr132953pjb.48.1568314239559;
        Thu, 12 Sep 2019 11:50:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b20sm31188690pff.158.2019.09.12.11.50.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 11:50:39 -0700 (PDT)
Date:   Thu, 12 Sep 2019 11:50:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jaret Cantu <jaret.cantu@timesys.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: f71808e_wdt: Add F81803 support
Message-ID: <20190912185037.GC5065@roeck-us.net>
References: <20190912175550.9340-1-jaret.cantu@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912175550.9340-1-jaret.cantu@timesys.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 12, 2019 at 01:55:50PM -0400, Jaret Cantu wrote:
> This adds watchdog support for the Fintek F81803 Super I/O chip.
> 
> Testing was done on the Seneca XK-QUAD.
> 
> Signed-off-by: Jaret Cantu <jaret.cantu@timesys.com>

Since there is no datasheet, we can only hope that this works
for other platforms using the same chip. Nothing we can do
about that, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig       |  4 ++--
>  drivers/watchdog/f71808e_wdt.c | 17 ++++++++++++++++-
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 8188963a405b..781ff835f2a4 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1046,8 +1046,8 @@ config F71808E_WDT
>  	depends on X86
>  	help
>  	  This is the driver for the hardware watchdog on the Fintek F71808E,
> -	  F71862FG, F71868, F71869, F71882FG, F71889FG, F81865 and F81866
> -	  Super I/O controllers.
> +	  F71862FG, F71868, F71869, F71882FG, F71889FG, F81803, F81865, and
> +	  F81866 Super I/O controllers.
>  
>  	  You can compile this driver directly into the kernel, or use
>  	  it as a module.  The module will be called f71808e_wdt.
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index ff5cf1b48a4d..e46104c2fd94 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -31,8 +31,10 @@
>  #define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
>  #define SIO_REG_DEVREV		0x22	/* Device revision */
>  #define SIO_REG_MANID		0x23	/* Fintek ID (2 bytes) */
> +#define SIO_REG_CLOCK_SEL	0x26	/* Clock select */
>  #define SIO_REG_ROM_ADDR_SEL	0x27	/* ROM address select */
>  #define SIO_F81866_REG_PORT_SEL	0x27	/* F81866 Multi-Function Register */
> +#define SIO_REG_TSI_LEVEL_SEL	0x28	/* TSI Level select */
>  #define SIO_REG_MFUNCT1		0x29	/* Multi function select 1 */
>  #define SIO_REG_MFUNCT2		0x2a	/* Multi function select 2 */
>  #define SIO_REG_MFUNCT3		0x2b	/* Multi function select 3 */
> @@ -49,6 +51,7 @@
>  #define SIO_F71869A_ID		0x1007	/* Chipset ID */
>  #define SIO_F71882_ID		0x0541	/* Chipset ID */
>  #define SIO_F71889_ID		0x0723	/* Chipset ID */
> +#define SIO_F81803_ID		0x1210	/* Chipset ID */
>  #define SIO_F81865_ID		0x0704	/* Chipset ID */
>  #define SIO_F81866_ID		0x1010	/* Chipset ID */
>  
> @@ -108,7 +111,7 @@ MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
>  	" given initial timeout. Zero (default) disables this feature.");
>  
>  enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
> -	     f81865, f81866};
> +	     f81803, f81865, f81866};
>  
>  static const char *f71808e_names[] = {
>  	"f71808fg",
> @@ -118,6 +121,7 @@ static const char *f71808e_names[] = {
>  	"f71869",
>  	"f71882fg",
>  	"f71889fg",
> +	"f81803",
>  	"f81865",
>  	"f81866",
>  };
> @@ -370,6 +374,14 @@ static int watchdog_start(void)
>  			superio_inb(watchdog.sioaddr, SIO_REG_MFUNCT3) & 0xcf);
>  		break;
>  
> +	case f81803:
> +		/* Enable TSI Level register bank */
> +		superio_clear_bit(watchdog.sioaddr, SIO_REG_CLOCK_SEL, 3);
> +		/* Set pin 27 to WDTRST# */
> +		superio_outb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
> +			superio_inb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL));
> +		break;
> +
>  	case f81865:
>  		/* Set pin 70 to WDTRST# */
>  		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 5);
> @@ -809,6 +821,9 @@ static int __init f71808e_find(int sioaddr)
>  		/* Confirmed (by datasheet) not to have a watchdog. */
>  		err = -ENODEV;
>  		goto exit;
> +	case SIO_F81803_ID:
> +		watchdog.type = f81803;
> +		break;
>  	case SIO_F81865_ID:
>  		watchdog.type = f81865;
>  		break;
> -- 
> 2.11.0
> 
