Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB99316901A
	for <lists+linux-watchdog@lfdr.de>; Sat, 22 Feb 2020 17:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgBVQCW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 22 Feb 2020 11:02:22 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:33576 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbgBVQCV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 22 Feb 2020 11:02:21 -0500
Received: by mail-pj1-f66.google.com with SMTP id m7so2988143pjs.0;
        Sat, 22 Feb 2020 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xcfWc07VJgwKZWSeCtj3dYfSkWoqRHSEjLvzNesnjm8=;
        b=e4W4iJzwkVD5G8ryoMxoC3o2gWbdwIv9HJtioaVLJ7r/aeVIXyg7ksO3Y+tiCeVfgk
         +p6CZizrNgdd+J+pFWQJW4dVn2MO5KGHhReEfjK3ZqtjG02RsHwVOt4LDX5SNiI25D/f
         8XKNUzx889WR5FX93+ydAxbkqOuot7q4Y5TNZ5aJ7tpUqnV4oSEwWDglgi/dhYeNT/XI
         JlldbMY5iRlj04KnA6LYgsOm3iMR0pM0PP4V9G0bBL4mP1OKz9Ol8NiZFPtXRpCoVRX4
         QrTv8I6iSu07vNSkj2kH3/AG4CZSFh1CZxIaWCf0pcVAQAmKA/TwhAKJbdCcCqCBWl+L
         fbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xcfWc07VJgwKZWSeCtj3dYfSkWoqRHSEjLvzNesnjm8=;
        b=Jf177G6zGwI+wjXxEK1oKI8qVBW7cXxdr8mFpfG+Y85vSNU6mu7w/NUxo5h4IA5dPe
         6AIUPxeFVsg4opjy8qSggwew7MX8EnxqZztqf/Y3JGP8IPO3Ai0nh/yODxolqzDGWOCR
         IskUsTYwCzG7v6x9Do44UeIrVNvxaac5NEShjOoQBeR/pAtqUKc4sY3uAMYFEUJwEx67
         fuFmW4O/l7bfiM/VclTNtqydCnduPKGSrAg857GxOHHTurNJfTm1J3imZrehbP/zyfK/
         +/tC/WAYZalXDbnV5SZkISvWGwHfjcGo0euc2TSmPHRenp9/l2xD6Qa5tLO1QG8BlHn2
         yMfA==
X-Gm-Message-State: APjAAAVV3zn40zQjYRx64d0bf/J2W1RNHE/f3gRmaQHpP68D4TnGyT92
        GI0Htf+MN5wlQ2rhi/kzPLc=
X-Google-Smtp-Source: APXvYqyUxZTcZApAopyQ3ulF1Kav/0gLlUvfK+oVe/98iwN5Xsh9EpL6rdRREX1moN7GmZOsUIiAEg==
X-Received: by 2002:a17:902:82c5:: with SMTP id u5mr41030877plz.219.1582387339765;
        Sat, 22 Feb 2020 08:02:19 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e7sm6909915pfj.114.2020.02.22.08.02.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Feb 2020 08:02:18 -0800 (PST)
Date:   Sat, 22 Feb 2020 08:02:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 3/3] watchdog: imx2_wdt: Remove unused include of init.h
Message-ID: <20200222160218.GA12740@roeck-us.net>
References: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
 <1582250430-8872-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582250430-8872-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 21, 2020 at 10:00:30AM +0800, Anson Huang wrote:
> There is nothing in use from init.h, remove it.
> 

NACK, sorry; this driver uses __init and __exit_p.

Guenter

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/watchdog/imx2_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index f8d58bf..ce28e40 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -20,7 +20,6 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
