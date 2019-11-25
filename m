Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7AA108866
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Nov 2019 06:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbfKYFfQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Nov 2019 00:35:16 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35321 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfKYFfQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Nov 2019 00:35:16 -0500
Received: by mail-ot1-f65.google.com with SMTP id 23so9749300otf.2;
        Sun, 24 Nov 2019 21:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wXFe5IRkpmYw35jezCOFXYaWV3iTtdk0uF/bLAb2KN8=;
        b=OGTycsadouQJuXYb24/RO8prEiQyQtwqh6DAC5aCfAwdv914oShVGMkOrPoEgLQe2+
         KoZCnNlVh95l1bojLoxUDPJEVSqQgYj69W9UUvdQKh1LkOKVCD/yP7qDM+eXxGMQ87Wr
         hPBI9S1kOwLSjZ6J1nLb4CAhjzy2X/Q/RSckk1oeeVtzhq1sRecaazofHmef5DVYAyV9
         NrwdpfOgSrNae72KucHXjKtz7W1x9oLQOdkdlfYpzEs0idJYAUVYZTsWzi5wJMNzt11W
         VSfPN+mi/o8/+fLnDJGwQhxFrrCMgEuZjX/iWvD9s0WqbGENHzsQmNYxGVKxWM9JTBzZ
         bspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wXFe5IRkpmYw35jezCOFXYaWV3iTtdk0uF/bLAb2KN8=;
        b=lBptrgb0QABxEj/MhryFUgFE3X58SxE2Wo6c247tNQ955pnyRde8qW+XiTgGfz8Nni
         n51kD03w7G5gJn48wHE+Jhhpa044ioLkOKDK5K2SjxEVVnCtF7KCHePTkQKLahT5e/yg
         I/fPpLuG0U2kHJbV13oaDKR9VtaXoQz9+BPhZFm86sNPweze/+6GM6rBoXaLnzJ1Khuh
         0RNsa/zGwJ4Qt6LkuWc5ZAnYwaEqn0GmYZzAdMaq71LJJDYmAdVeoELoKgjYFhNZyFZ9
         0Uc0Po1UF3Vywur7TkJuGuSzHI+AaXOtGUeLRWdLjdY05EhzO/bwyJLaGqcZP1M63C54
         G7rg==
X-Gm-Message-State: APjAAAXlJNTmtCpFtPBi8a6RXDTuzJdB7zhuDVuTznEEhz+JrJ8L3Lwe
        HEYHUvtImLA9f3EUs5tv0qvT1cGW
X-Google-Smtp-Source: APXvYqzBrCNoQTiHjhXVFLrZggDIlVl4nuUoZBvB5aUHTzhXw8r0nZq4mlLgFV5h0Ax4vZr464IU9A==
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr1052382oto.264.1574660115047;
        Sun, 24 Nov 2019 21:35:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u1sm2233860oie.37.2019.11.24.21.35.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Nov 2019 21:35:14 -0800 (PST)
Date:   Sun, 24 Nov 2019 21:35:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
Cc:     Guenter Roeck <guenter@roeck-us.net>,
        Guenter Roeck <groeck7@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2.1] watchdog: make DesignWare watchdog allow users to
 set bigger timeout value
Message-ID: <20191125053512.GA5636@roeck-us.net>
References: <8fa54e92c6cd4544a7a3eb60a373ac43@nokia-sbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fa54e92c6cd4544a7a3eb60a373ac43@nokia-sbell.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 25, 2019 at 02:04:13AM +0000, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
> From aabaa4b709bd451e566c906e8d1dca48f92f9b12 Mon Sep 17 00:00:00 2001
> From: Peng Wang <peng.1.wang@nokia-sbell.com>
> Date: Wed, 20 Nov 2019 15:12:59 +0800
> Subject: [PATCH v2.1] watchdog: make DesignWare watchdog allow users to set bigger
>  timeout value
> 
> watchdog_dev.c provides means to allow users to set bigger timeout value
> than HW can support, make DesignWare watchdog align with this.
> 
> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> v2 -> v2.1:
>     - move Signed-off-by to be ahead of section separator
> 
> v1 -> v2:
>     - use top_s to compare with wdd->max_hw_heartbeat_ms
>     - update wdd->timeout in case it's greater than HW supports
>     - fix comments error
> 
> v1: initial version
> 
> ---
>  drivers/watchdog/dw_wdt.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index fef7c61..12c116e 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -114,7 +114,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>  	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>  
> -	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	/*
> +	 * In case users set bigger timeout value than HW can support,
> +	 * kernel(watchdog_dev.c) helps to feed watchdog before
> +	 * wdd->max_hw_heartbeat_ms
> +	 */
> +	if (top_s * 1000 <= wdd->max_hw_heartbeat_ms)
> +		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	else
> +		wdd->timeout = top_s;
>  
>  	return 0;
>  }
> -- 
> 1.8.3.1
> 
