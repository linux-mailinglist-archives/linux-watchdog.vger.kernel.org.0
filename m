Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF1F799CA
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 22:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbfG2UUj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 16:20:39 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41685 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728915AbfG2UUj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 16:20:39 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so18460208pgg.8;
        Mon, 29 Jul 2019 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PWm3A+XATen1N/7FPolvwWJxlL26QMTEguhryVQhPuI=;
        b=VjRurpAsHCDE5NXUiuJSYOxZdiKBv4PWD9C6S2bajkziBpFDkaZRMkLftU/Z86M03e
         r8Z9HP0OErQtyov6PDhO4AzNHOi7tod6ZGXiA5gW8/Mm7YM8mFRsXWFFx2iMvEVAqP5C
         yjL18bJQUP/QRtbNSrUZu/asr/tD+tBGzuSrqb84CxR24KwYQUQfbTM/tdlggwLrkxBs
         IhjwbueTmzw/lcZyoVsRu3GSwyTjkPpAYDJWS4VsZdzZewAGygjTz3OY3I38ffYMrT+q
         O5yt7R8Vv5SecoNrXdolOA//7LU6UlnaArmQCHE6d+KQ8qDdMV/kz2u/Wr2IKIdZtWTA
         AB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=PWm3A+XATen1N/7FPolvwWJxlL26QMTEguhryVQhPuI=;
        b=Nz+SxOpJ4S2lW/lj4zhfNHkQ3gWrZU6wsKWyio4n7IeSvJc+rnzYptPEVCt6D3/DMU
         kbgzRY/89Z1KPY4C6u/AgYRNODOs8TrWRO84erEPzJ/+KCIJs5pzqhi4XZf46Uj+qVLw
         CdPev3KB33jE1txXsL0BXvDMS9ISqk5iAhc9pcyyahRR0TO0SpDVXqcCxlnvkK0z/yUg
         swaBKE0nDxSX9At9v7nEtJs1X0Z5EbFswRvul1UXCcIMW5y0Ig0WYOkt0LTWbHTmYluU
         vyUUhNKgLvhPf2Dd01Yzk3tW9UL3zAB45cwn7fMVqBywr+umWUe1u2rYWIQ2jXF4VfB9
         z7bg==
X-Gm-Message-State: APjAAAXMDTS8j7R4yF5Q8Me4qchChxRYOFNuzMLcXVGfc61SojkELXBI
        osSs9hQZBzaPE9hDn9Vl20d+5QMO
X-Google-Smtp-Source: APXvYqxTyxzwpklfOv/L6SZWr47ce7Ix96k5jNaaPPpvUYY7ExbD6737RmCU5PhxUlrIFNj2NMtRmQ==
X-Received: by 2002:a63:2ec9:: with SMTP id u192mr103509615pgu.16.1564431638563;
        Mon, 29 Jul 2019 13:20:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r2sm80705716pfl.67.2019.07.29.13.20.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:20:37 -0700 (PDT)
Date:   Mon, 29 Jul 2019 13:20:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Jim Cromie <jim.cromie@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] watchdog: scx200_wdt: Mark expected switch fall-through
Message-ID: <20190729202036.GA31986@roeck-us.net>
References: <20190729200602.GA6854@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729200602.GA6854@embeddedor>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
