Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F933616D3
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Apr 2021 02:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235057AbhDPAgp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Apr 2021 20:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234865AbhDPAgo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Apr 2021 20:36:44 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D64C061574;
        Thu, 15 Apr 2021 17:36:19 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id ef17so7012713qvb.0;
        Thu, 15 Apr 2021 17:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eLTCOMBoG9G5S0rXZgVkqicXPZkU4FpglORZGdEuM7k=;
        b=mVMp7KJ/dQ9aRRQKge8lo8tx7/WB11OnQJJ0EROpsbIrQ1fl21AspBNhSxGRNZesOz
         buZOd/sbSIniCAoeR6+vwTT99bzq8lq/6pGO0u83vpRBw+D1KcRT+BMR5JYMy3z04uoE
         C3X6LTONu7HGmhAclPAH5CikO1GdxAK9OD5OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eLTCOMBoG9G5S0rXZgVkqicXPZkU4FpglORZGdEuM7k=;
        b=C0mj2kHI8VMttFQpAAGuqjXABiymXGb5a5cpWumjhZX+O/52yNO0Hy+GnQCAKJink8
         2Y7chJg4Hmk7Mi4b0W2qXeJx26ujLhZqQVZ1XMardigZVUmrKVuefbwEyhMvt7UiblS0
         r4jyvCQgooQqjvqf9jEQqTCsmk0UiFg2d8hK9hyShiviRruhyru8D7GZgiDFM1+IeijL
         8b45JH5Ok/wtWcOuR2XRAyFhPxs7cuFkLwvEEhTt9wO3yGKtxIz+P9iRiBKqmg2rX6nl
         8c0mIADmjlZlgVse5f7aChYmUTo1IOmhc/i+D14CNqHtl7aGzNg7JqdnY5cUqaMPiBkm
         /vmg==
X-Gm-Message-State: AOAM532dim/4hzL122vlWT8h6C6C0T7iKfshgofNZ5EovgjRKkIle+uL
        3j4Um6kbPiAR712GHR1opnwxSQaQJdiFpOy4zdQ=
X-Google-Smtp-Source: ABdhPJw+9SWz1t5hHnAz8Jpi6OzWFA1+137rOgUx5zzy/u1FOhsGRDFr4WNFWX2GN7lqDEgw0s2aTA49+1EzROcdsZ4=
X-Received: by 2002:a0c:e950:: with SMTP id n16mr5882756qvo.43.1618533378768;
 Thu, 15 Apr 2021 17:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210416001208.16788-1-rentao.bupt@gmail.com>
In-Reply-To: <20210416001208.16788-1-rentao.bupt@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 16 Apr 2021 00:36:06 +0000
Message-ID: <CACPK8Xdmm-LL+xvbG6bBe0Yd9ZQbPuvwBKhszhjvbOc3pPoH3w@mail.gmail.com>
Subject: Re: [PATCH] watchdog: aspeed: fix integer overflow in set_timeout handler
To:     Tao Ren <rentao.bupt@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Jeffery <andrew@aj.id.au>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Tao Ren <taoren@fb.com>, Amithash Prasad <amithash@fb.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 16 Apr 2021 at 00:12, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
> handler to avoid potential integer overflow when the supplied timeout is
> greater than aspeed's maximum allowed timeout (4294 seconds).
>
> Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> Reported-by: Amithash Prasad <amithash@fb.com>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 7e00960651fa..9f77272dc906 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -145,9 +145,8 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
>         struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
>         u32 actual;
>
> -       wdd->timeout = timeout;
> -
> -       actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> +       actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);

The unit of timeout is seconds. You're comparing to ms/1000, which are
microseconds. I think the existing test is correct?

As far as integer overflow is concerned, max_hw_heartbeat_ms is an
unsigned int. We set it to 4294967, which *1000 = 0xfffffed8. This
should be fine.

> +       wdd->timeout = actual;

This might be the correct thing to do though. I'll defer to the
watchdog maintainers for their input.

Cheers,

Joel

>
>         writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
>         writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> --
> 2.17.1
>
