Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEF1334D7
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Jun 2019 18:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbfFCQXa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Jun 2019 12:23:30 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35670 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbfFCQXa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Jun 2019 12:23:30 -0400
Received: by mail-lj1-f193.google.com with SMTP id h11so16851413ljb.2
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Jun 2019 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n/cV/sVRlbUOo7FHenLjAJ9QBv6k5clmgCApf8xm7Pk=;
        b=TYUrm50t4FfyqocOab488anoZ/p22Pq8r1lSVO3LkeQCxVoymxN/DHITnK01ydQLPK
         UM4MpxiyIsKv6UplPMaBe8+BfY8U7oeptIzVOPt3hBAam1zfnXIKXbvcV/Sx7UtAgEbZ
         PMFJm+YLyRJ1tpaCEEmD/3/8vTzOL6K8O4Ceji5wzctve+670ra0dPBzL+kp2+QTllsy
         oEUAlgOBvkDFfAlXwcVnJaJJwt9BKL6hGBCgTbtkZSp+gxiOywtMxytMG1YjyL+94+Tg
         WAu/1/Sgxi7PwV1I1ZSUk/wSY8SQx+e8B01n1DoFdW8kCIDEud/M+wOJ5zEcZq0ZFHzA
         /OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n/cV/sVRlbUOo7FHenLjAJ9QBv6k5clmgCApf8xm7Pk=;
        b=kQ2HI+Py7Sjuih/VzmeDoCwVgy5IuXKeD+FxLG+sZWyKp864oQ/+QCMqGLqpMx8rR6
         AYDOF8tdXUKtg+EXBMQ/543p13fjeGrmyrkti7YjDjkxOk3Q68VFeyD/kROMUn0V5P6q
         FcMK5uVeAMCmUS0P3PPp6qIiS90w9utDchHbbQtyRl61YGIYgUw0pb1KCh0CmPxii8eY
         np7jzrxlA/v2Y+BOMAED8tgMtYMatd/FjsWf/IwnUXULIpciChL+193CLFEL1liCJfeR
         BCBVceRrgnRG/J2n9fDDBFqx6b/g54ytHILVb8b8MmdQEWSEvLK5NPjbmMk8OdWWEipo
         svMA==
X-Gm-Message-State: APjAAAVZgU7VzXY/bRQ/E1GS7oDoETDse00sqEZupGaxDD3VFFgTDqjZ
        qO81Hv4NqP5rNLIsNb11NQ5kWg==
X-Google-Smtp-Source: APXvYqzJShOEiF2qfsDNhzKzUYClff2WG6xsLkpEzyCIUZzc89YV5zSludYA++2vD+Pw2E55IB8v1w==
X-Received: by 2002:a2e:8954:: with SMTP id b20mr14492777ljk.10.1559579008755;
        Mon, 03 Jun 2019 09:23:28 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id d2sm3183876ljc.84.2019.06.03.09.23.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 09:23:27 -0700 (PDT)
Date:   Mon, 3 Jun 2019 18:23:26 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: renesas_wdt: Add a few cycles delay
Message-ID: <20190603162326.GB2960@bigcity.dyn.berto.se>
References: <1559558161-31244-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1559558161-31244-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Shimoda-san,

Thanks for your work.

On 2019-06-03 19:36:01 +0900, Yoshihiro Shimoda wrote:
> According to the hardware manual of R-Car Gen2 and Gen3,
> software should wait a few RLCK cycles as following:
>  - Delay 2 cycles before setting watchdog counter.
>  - Delay 3 cycles before disabling module clock.
> 
> So, this patch adds such delays.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Small nit bellow, with or without that addressed.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Changes from v1 (https://patchwork.kernel.org/patch/10972641/):
>  - Change formula to improve accuracy.
>  - Add Geert-san's Reviewed-by.
> 
>  drivers/watchdog/renesas_wdt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 565dbc1..525a1fe 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -7,6 +7,7 @@
>   */
>  #include <linux/bitops.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -70,6 +71,15 @@ static int rwdt_init_timeout(struct watchdog_device *wdev)
>  	return 0;
>  }
>  
> +static void rwdt_wait(struct rwdt_priv *priv, unsigned int cycles)
> +{
> +	unsigned long delays;

Could this be unsigned int? It would still fit for a cycles number 
around 2000 and this change use 2 and 3 cycles.

> +
> +	delays = DIV_ROUND_UP(cycles * 1000000, priv->clk_rate);
> +
> +	usleep_range(delays, 2 * delays);
> +}
> +
>  static int rwdt_start(struct watchdog_device *wdev)
>  {
>  	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
> @@ -80,6 +90,8 @@ static int rwdt_start(struct watchdog_device *wdev)
>  	/* Stop the timer before we modify any register */
>  	val = readb_relaxed(priv->base + RWTCSRA) & ~RWTCSRA_TME;
>  	rwdt_write(priv, val, RWTCSRA);
> +	/* Delay 2 cycles before setting watchdog counter */
> +	rwdt_wait(priv, 2);
>  
>  	rwdt_init_timeout(wdev);
>  	rwdt_write(priv, priv->cks, RWTCSRA);
> @@ -98,6 +110,8 @@ static int rwdt_stop(struct watchdog_device *wdev)
>  	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
>  
>  	rwdt_write(priv, priv->cks, RWTCSRA);
> +	/* Delay 3 cycles before disabling module clock */
> +	rwdt_wait(priv, 3);
>  	pm_runtime_put(wdev->parent);
>  
>  	return 0;
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
