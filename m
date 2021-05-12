Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393DC37BF11
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 15:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhELOAr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhELOAq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:00:46 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B12C061574;
        Wed, 12 May 2021 06:59:38 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w22so8450673oiw.9;
        Wed, 12 May 2021 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RFFD8cfevkBZekM1PrJV0pRt9nerLYYNCjuX5+LRCtA=;
        b=SV3YUwoblnA0MVMNV7hjXDEhhJixOeiR5r9Qc1zRR/e6zXCK5TWNcphTV7zpeQGKxs
         LsvTSn9RDs81pBl2RvrN9kzf3Qg5OA7iUHcNTYoZFakGEJrOL05ARU9hXpepXeJnSFOU
         RW9nVId9+JMwEljrHdk0KgrbATVMrUF4umTwLyq9NKmnX7uZMoW6BfjfT4EwOdMvMDNy
         mejCcWOjB9yippVmV15epoJxJyVJx/B0VCXQwzE0sJxCTMMAEYVbk0h0nkZAobPrESWJ
         JfI4U5gO+eZ0wzPF3SBYpHRDtERERO62xGxByHI8aZ14hXdu8Bv6HkiC1GJ9nhoF6zvY
         r0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=RFFD8cfevkBZekM1PrJV0pRt9nerLYYNCjuX5+LRCtA=;
        b=X3y346TGwSL1mRFdqBRCefkYQgQBp9V2UyEnmxCobUEz/9iXFcrV0HFABaqOawdmH9
         jxkO7Xlv0sSduuDxzr+R00uD8DGzGwAx54jVN7d3IxIciYyHc751lrwLwZoapV24fIuR
         QJkyk/LFQ/nSq2wZeUx80Ssvhbrf5uDGkATYt7Cnz0qfFw2ZbqK8yCgqpfaKFD1NpRGn
         r5iJJvomQnTiXkrerBiZRu6DTDsF9U78ngMP0i/Pqhdi7WeAV2AqMV/ya7r5TvdVslxc
         16MY6XM7z5lzm3KUbHkjZozD3517YZapdX78yL9Aw/nlvjGyP6RRvFgjm0v1zL6r+0iU
         1+TQ==
X-Gm-Message-State: AOAM530c+cJZLcRPQYJMvufx4bWQwB4yj1m9hLOLtb9HF+rN+dJ5xnoJ
        7/BHLG3tOqetA86USOR9VoUj+BfxP30=
X-Google-Smtp-Source: ABdhPJyZS2CI67K2syUYYDwWLU2woOzwTj7su7ESs8mwNTdWRYQlZCOiNWoIGHuiCrYaDe7s6oY9kw==
X-Received: by 2002:aca:f413:: with SMTP id s19mr7514298oih.127.1620827978447;
        Wed, 12 May 2021 06:59:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c13sm2758839oto.18.2021.05.12.06.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:59:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 06:59:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 05/10] watchdog: keembay: Remove timeout update in the
 WDT start function
Message-ID: <20210512135936.GE1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-6-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-6-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:19PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> Removed set timeout from the start WDT function. There is a function
> defined to set the timeout. Hence no need to set the timeout again in
> start function as the timeout would have been already updated
> before calling the start/enable.
> 
> Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index f2a16c9933c3..039753b9932b 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -84,7 +84,6 @@ static int keembay_wdt_start(struct watchdog_device *wdog)
>  {
>  	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
>  
> -	keembay_wdt_set_timeout_reg(wdog);
>  	keembay_wdt_writel(wdt, TIM_WDOG_EN, 1);
>  
>  	return 0;
> -- 
> 2.17.1
> 
