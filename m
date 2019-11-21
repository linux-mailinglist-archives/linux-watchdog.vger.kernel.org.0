Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1877210541C
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 15:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKUOPM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 09:15:12 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42697 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUOPM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 09:15:12 -0500
Received: by mail-pg1-f193.google.com with SMTP id q17so1649094pgt.9;
        Thu, 21 Nov 2019 06:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FqgYYI4bcEoit8CYNauCHCwFYsnmkzgBLdUXonL9abM=;
        b=FtbXmjW66RNJxUoEVyBTH8kXFGoaf8lIBBVGKQvCiPAl7EkVGHKN04k0xc1fXNymKZ
         RfLFG5s6PO3fbn47RrR2utXvJiZZVBZetYwH9UPDINdKd7C9QrHxVw94YC7bFI0uvbe0
         kiQnb1ucAh9gJqfG4W0uhuf4n/ruAmih/kym5dOkVDMrd2Iiw3HENqw8XIojZtaKalPi
         TCCClePTqf18BKWfm+IyFjNK0NAhOVh9FyuVrQmrvqW8s4ZR7w7FZ67MhW43gA+azKnS
         l8ykQZ/96i12tiBxIU+laQYjIl61tJo4wS7APNqvqjldom7SyPSQeStNiB0gzyzvom0R
         E4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=FqgYYI4bcEoit8CYNauCHCwFYsnmkzgBLdUXonL9abM=;
        b=Lg+p9m5k13VUe5TLwoRKU20ji8H+LPWcQVOd18iI0bAEoJoPVxU3lxvINZc1PlT4vK
         Uqs8NdiDL2YXEzzzMlzt5a2zBlH8g7Va1kQJQYHwhb1KATm7+nMwQmrOSRtrJ10zyXNX
         v7CVewoU6IDEqIXm+745lyBy/EjJCIftsbS8rlZnF7L6c+1WKCMPtFP4125xiTP0NzK1
         u5UZoWekKA3MRvnKKBxYcyzbe6IsvMurELqqNdnxDd9iqUJ81+UhEMEKifOvVGc/1qlD
         apV0j5R6usf9EvfvefXzaAitnNU0yLe3OB2CPmxHAB8N9JqbuzPaVPdQ3DcgE7cDAstW
         zEjA==
X-Gm-Message-State: APjAAAWHbFtgfVq66jyCOjH4Eln9XObrlE+DC0JNs6g9SgTLomxsowyU
        9aJa1/yCyOTHsWXfrlEaths=
X-Google-Smtp-Source: APXvYqyc3NhaVtpxkUNyyoZx7XyR89fbjiW+yYm30xhCqkP6WvsE5ZOZY6mNkUC2XtbNQufxfkE/Zw==
X-Received: by 2002:a63:c04f:: with SMTP id z15mr10118422pgi.52.1574345711464;
        Thu, 21 Nov 2019 06:15:11 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y4sm3614735pfn.97.2019.11.21.06.15.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 06:15:10 -0800 (PST)
Date:   Thu, 21 Nov 2019 06:15:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
Cc:     Guenter Roeck <groeck7@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Message-ID: <20191121141508.GA13249@roeck-us.net>
References: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 21, 2019 at 10:35:12AM +0000, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
> From aabaa4b709bd451e566c906e8d1dca48f92f9b12 Mon Sep 17 00:00:00 2001
> From: Peng Wang <peng.1.wang@nokia-sbell.com>
> Date: Wed, 20 Nov 2019 15:12:59 +0800
> Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger
>  timeout value
> 
> watchdog_dev.c provides means to allow users to set bigger timeout value
> than HW can support, make DesignWare watchdog align with this.
> 
> ---
> 
> v2 -> v1:
>        - use top_s to compare with wdd->max_hw_heartbeat_ms
>        - update wdd->timeout in case it's greater than HW supports
>        - fix comments error
> 
> v1: initial version
> 
> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
> +	if ( top_s * 1000 <= wdd->max_hw_heartbeat_ms )
> +		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	else
> +		wdd->timeout = top_s;
>  
>  	return 0;
>  }
> -- 
> 1.8.3.1
> 
