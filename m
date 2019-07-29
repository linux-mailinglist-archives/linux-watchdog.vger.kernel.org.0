Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EACFC79B6E
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 23:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbfG2Vrz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 17:47:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43679 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbfG2Vry (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 17:47:54 -0400
Received: by mail-pg1-f195.google.com with SMTP id r22so1305823pgk.10
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jul 2019 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XLND97VJqxRGNRPkPJlee12ZiV4Pa0PqINHbyj3L9qI=;
        b=NuafK1iUNbvpkdCGy+I/VAbbNtK2QFUpJvgqoxHuOj60i9aitSiIaF8+fL1/P1C1W4
         2wE/9eqPhOw84SOnnNxOpCQfAEpNvU7pedpJyQcUVMCcKh0rJ88m8vw5x9CfoUp2Bap4
         IoZOWqat+V4QcxdoMlrVnJelk+ocqFxjhMWeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XLND97VJqxRGNRPkPJlee12ZiV4Pa0PqINHbyj3L9qI=;
        b=M5tCX7BNGRUqKF3p7KHgDv9JlhPcLVXvR2tIbTEdmMfRB/5ObpnUNSvRYJHLZV+SsT
         UEtmFGo5o7Yu1NOnJdmDY17Cajog5fd4jYXplY0koAcZ3Rbo3dDmAOMxO78nRuQ2dFF9
         px2UsBmjISzJevOdFBXrVpB93REYpukJ1RpMva6n/+knW6+hdvrAxr0TtEJmeJ17yiN9
         SHQl9Ln3Sv3bntjR6oOIJJN/ELhfJBq7S9BZlKzhizmklhVtWDc8ZIy1ndK5w4T4KAM4
         CGQClXfORpRIYgkjRJEx6gPXX6PCRZD0gTAB/FOtci7HpJRHwg32s8H38+1j3D0V3Eja
         OzWg==
X-Gm-Message-State: APjAAAUnifLPkTxhC0SBX5paWC+DUZmVq6xuptZ75PkHyGiQc17dMt0w
        ESEr67YoAvC+sDfAebwJEYaYgw==
X-Google-Smtp-Source: APXvYqzEODFFburSUpBiyJGkJcA1avidySxsHUY0dCaesN0aG++Mx9veA1Ui7EDkYXiCFCp8x/h3xw==
X-Received: by 2002:a62:764d:: with SMTP id r74mr40203960pfc.110.1564436874284;
        Mon, 29 Jul 2019 14:47:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id bg3sm61476695pjb.9.2019.07.29.14.47.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 14:47:53 -0700 (PDT)
Date:   Mon, 29 Jul 2019 14:47:52 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Jim Cromie <jim.cromie@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: scx200_wdt: Mark expected switch fall-through
Message-ID: <201907291447.7A0E3EF23A@keescook>
References: <20190729200602.GA6854@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729200602.GA6854@embeddedor>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 03:06:02PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: i386):
> 
> drivers/watchdog/scx200_wdt.c: In function ‘scx200_wdt_ioctl’:
> drivers/watchdog/scx200_wdt.c:188:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    scx200_wdt_ping();
>    ^~~~~~~~~~~~~~~~~
> drivers/watchdog/scx200_wdt.c:189:2: note: here
>   case WDIOC_GETTIMEOUT:
>   ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/watchdog/scx200_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/scx200_wdt.c b/drivers/watchdog/scx200_wdt.c
> index efd7996694de..46268309ee9b 100644
> --- a/drivers/watchdog/scx200_wdt.c
> +++ b/drivers/watchdog/scx200_wdt.c
> @@ -186,6 +186,7 @@ static long scx200_wdt_ioctl(struct file *file, unsigned int cmd,
>  		margin = new_margin;
>  		scx200_wdt_update_margin();
>  		scx200_wdt_ping();
> +		/* Fall through */
>  	case WDIOC_GETTIMEOUT:
>  		if (put_user(margin, p))
>  			return -EFAULT;
> -- 
> 2.22.0
> 

-- 
Kees Cook
