Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FAC3FA6AB
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Aug 2021 18:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234504AbhH1QH4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 28 Aug 2021 12:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234494AbhH1QH4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 28 Aug 2021 12:07:56 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821B1C0613D9;
        Sat, 28 Aug 2021 09:07:05 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id w19so13932705oik.10;
        Sat, 28 Aug 2021 09:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2N4hXKjAGAGxHdHjCs7o/+MoEQA/CXytYWZZ2Rbz+8c=;
        b=dkrU86+tSFsSlGnz3N1bri/bBm4GtsENNqkRTvSkSS/6gcg9bNguZR1YC4BGNg1bdA
         Bzcwqj19tcmCwYGknWuG2/5warweQF+KViO53IeSA3/SnZIGIRZ6Vgg3yeczeYCFy/1o
         IOx09YDj+C64Dtc1L7+8kML+5GkiF+LIkG7hKa8eFxHhDkIGvz9FQTrV/f0aefcF4g8O
         6FQJvRaQowVX3ys9BCL96fQKUE2+JPTTXZLH0Z2PKaAbz/h9G7H5kTgOWL2OJbrNjqOw
         U32DTd7Gk7h0Yl/8mxPkCDGCyJZ0OdEIx5ovWdz7skQ6zdsmULARiRJzXhU5N7orgej0
         2elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=2N4hXKjAGAGxHdHjCs7o/+MoEQA/CXytYWZZ2Rbz+8c=;
        b=WMAFoHWm1JObTSWcrdWZNCpQk5pQDKc5q9NGVGiLjTOVJbtZ7pEKZQKTpHISDtobEs
         Xt8/Qyes70R7bBL85Ohi7cskJuzD2W3eTNSggPGfhIXJ+H0eEaAZgABJQjel45B4mo5Y
         8gGKiza1ntoY3nELANWJkQWxPvC/k/GLze2XKFgauXNT9/ttFQY5WtRwYB3LEXkPxTFV
         iV9leknSX9FPdQZzE2oNzNWtjgrHy0InHRicotpoFk95NHykxZsbrox8iTAGklmIJ4jT
         2BmqVvSVwG/6q0ET7E/B9ExRQLMikmN5tmTrlV8ncvkl/rCUjR+LiTt18d18lQTaoW/R
         Y8Bw==
X-Gm-Message-State: AOAM531p9JorHxUGz7lrzIQ+zSS0TZbs+iGBfPilcVQXM1F0z7sohVHE
        Ute065/bLkK/g7bOdq/IxpM=
X-Google-Smtp-Source: ABdhPJz+N1t9wv12duSVrVefN3Rtc7EZiHwK1wUTVm/OCni5laro3n/ttAiOKcZOUkDzi9ohKSkhcQ==
X-Received: by 2002:a05:6808:181a:: with SMTP id bh26mr19693569oib.166.1630166824889;
        Sat, 28 Aug 2021 09:07:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b2sm1840736ook.46.2021.08.28.09.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 09:07:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 28 Aug 2021 09:07:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 2/7] watchdog: f71808e_wdt: remove superfluous global
Message-ID: <20210828160703.GA821909@roeck-us.net>
References: <cover.3654d10d79751f1b01adc9403f9840543df4bcc4.1628525954.git-series.a.fatoum@pengutronix.de>
 <d1f8cda90283855633537adee0af2c6b00a9ec25.1628525954.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1f8cda90283855633537adee0af2c6b00a9ec25.1628525954.git-series.a.fatoum@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 09, 2021 at 06:20:32PM +0200, Ahmad Fatoum wrote:
> max_timeout never served any purpose over WATCHDOG_MAX_TIMEOUT, which it
> was initialized with. Drop it.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index f7d82d261913..3a0b29cb5854 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -81,7 +81,6 @@ static unsigned short force_id;
>  module_param(force_id, ushort, 0);
>  MODULE_PARM_DESC(force_id, "Override the detected device ID");
>  
> -static const int max_timeout = WATCHDOG_MAX_TIMEOUT;
>  static int timeout = WATCHDOG_TIMEOUT;	/* default timeout in seconds */
>  module_param(timeout, int, 0);
>  MODULE_PARM_DESC(timeout,
> @@ -221,7 +220,7 @@ static inline void superio_exit(int base)
>  static int watchdog_set_timeout(int timeout)
>  {
>  	if (timeout <= 0
> -	 || timeout >  max_timeout) {
> +	 || timeout >  WATCHDOG_MAX_TIMEOUT) {
>  		pr_err("watchdog timeout out of range\n");
>  		return -EINVAL;
>  	}
> @@ -720,7 +719,7 @@ static int __init watchdog_init(int sioaddr)
>  
>  	if (start_withtimeout) {
>  		if (start_withtimeout <= 0
> -		 || start_withtimeout >  max_timeout) {
> +		 || start_withtimeout >  WATCHDOG_MAX_TIMEOUT) {
>  			pr_err("starting timeout out of range\n");
>  			err = -EINVAL;
>  			goto exit_miscdev;
