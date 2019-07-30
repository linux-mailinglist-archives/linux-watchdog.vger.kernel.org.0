Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0207AE7F
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 18:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbfG3Q5t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 12:57:49 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36134 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfG3Q5s (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 12:57:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so30157051pfl.3
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jul 2019 09:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ix9OKDjxXPyx1f5taSuIkM3gnuH/NmRqMA6DOLybtl0=;
        b=AWVJPYpg7cmlGHotrArS9WfeqnVwUAjou9+7Dkkgt4LR8AAFjW0ooQaPy60h9U1WHf
         l7q5zVJ0reaqH64g9rq2FzLRPRnwX70XhAYmKdsBzel9BLBIVQe4wA99QbXIBcYVdS5+
         y3MVEOs51cSd03F/OoGUwwYjPZkGIjrBlX3P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ix9OKDjxXPyx1f5taSuIkM3gnuH/NmRqMA6DOLybtl0=;
        b=T5piKTQQGruDGY6LssrixmyHdek9jdQ260kEG8qW7oFWCfwR8J+okXaAqTnhgQZiL/
         RynRq3QXxu8sIanhf7ttwqQ0mhsd9hz1x/qdLev15i7R/y0i0ECOrgSdeEcIVPRvwMVA
         Jo2B30o3dX+zEQrBFuMZQ7IruaIKNkcB6sG7gFZCxEFITyQHOksao0cT0AYsFyzmr6E8
         qh5lrkyXXDximseSQlBYU5zYMnyQbT9+H7uiA0DoLeT40A+LrW2dNNon5pSjTNyYWslw
         h8BK7I9S9FVyfCfwVSq428ulxPHmGpYPUFfGfQmNXRZgc88bFBhRjxD1c9eRsHbh6X2H
         F8gQ==
X-Gm-Message-State: APjAAAVdjmgkIHEnyyT2HAUVnaU/vgLnZt3YicMzrK9AdRjPM4BhYMCY
        tMZeGkBjon5H7ZuosBhCHJ27Rg==
X-Google-Smtp-Source: APXvYqzE9AgceJOtUfpQp9NAmVB2r9LsPVCK8iyMvE9ch6UgwEPO2kl8NKoc88W4qqOgZlVTDO2I+Q==
X-Received: by 2002:a65:6495:: with SMTP id e21mr110932536pgv.359.1564505868296;
        Tue, 30 Jul 2019 09:57:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p67sm75555573pfg.124.2019.07.30.09.57.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 09:57:47 -0700 (PDT)
Date:   Tue, 30 Jul 2019 09:57:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: wdt977: Mark expected switch fall-through
Message-ID: <201907300957.D6F173D@keescook>
References: <20190729223159.GA20878@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729223159.GA20878@embeddedor>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 05:31:59PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: arm):
> 
> drivers/watchdog/wdt977.c: In function ‘wdt977_ioctl’:
>   LD [M]  drivers/media/platform/vicodec/vicodec.o
> drivers/watchdog/wdt977.c:400:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    wdt977_keepalive();
>    ^~~~~~~~~~~~~~~~~~
> drivers/watchdog/wdt977.c:403:2: note: here
>   case WDIOC_GETTIMEOUT:
>   ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/watchdog/wdt977.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/wdt977.c b/drivers/watchdog/wdt977.c
> index 567005d7598e..5c52c73e1839 100644
> --- a/drivers/watchdog/wdt977.c
> +++ b/drivers/watchdog/wdt977.c
> @@ -398,7 +398,7 @@ static long wdt977_ioctl(struct file *file, unsigned int cmd,
>  			return -EINVAL;
>  
>  		wdt977_keepalive();
> -		/* Fall */
> +		/* Fall through */
>  
>  	case WDIOC_GETTIMEOUT:
>  		return put_user(timeout, uarg.i);
> -- 
> 2.22.0
> 

-- 
Kees Cook
