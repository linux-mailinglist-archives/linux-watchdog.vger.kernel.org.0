Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDBBD2E78
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2019 18:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbfJJQUC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Oct 2019 12:20:02 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44476 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfJJQUC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Oct 2019 12:20:02 -0400
Received: by mail-pg1-f193.google.com with SMTP id u12so3971599pgb.11;
        Thu, 10 Oct 2019 09:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WOI17RVGbI/w51ir7nAk3XroLrQM2mN4WZvCvlZ8MNU=;
        b=e0DCp3yNn0FtATTxbmW5vF8GxiAtc+QPlcqLOWf+CGuY9BNBNpMCpjx8z/sh3CA/Km
         g5Fp7m8mhwvJt9S2DaLOlkHRSy8LIawmIQ888gUHOKmdlwo0yTdzJjo/pCyxVUCQ2VW+
         qvsBoyVdUZbRMDKI806TJc4pv8h1LqWfhUocaLCxCv04h7Kr1/kCv+sxv3hOzANnXWj9
         OGr7khGQhkIUNNm8zSPo8aC0ox2R+1PxpzP3T0CWkB94M2GQ/uVYwMxvHp+RpvE1s0pq
         Is3RiXDMFUSnOxjUGgFdx4bUnS8xgWCNhHhuV6oikNbgH/CxqutSOueFNREdKT42890X
         jDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WOI17RVGbI/w51ir7nAk3XroLrQM2mN4WZvCvlZ8MNU=;
        b=jhauw9psoZXgKJTWV0KKSOpmbj7ubAKOeRE+Rs9+BhN4gIY/gxxy36qrxeBtoW5CKY
         SeL7fmhR9mTswWgERKGoZvvgYrJKQxzLghNPWY1IVGPPH/YtsBnQ+yRtLpomPcZMqvln
         h2oi+gEdCg7OEZpbxbs4lD6dd14izEBUjqyOVUbuVUONt98tWRWznDTYiP7RumQHsIlV
         6OV+NdI+laUt5S4gfYsbWA+kPbNUT/9j879s/JGYOfTbm4B+UKj2X0tvxz4U2iHGEdcG
         nVRvKwpYP7EUz/v0kThL3vooBvbRfrGOhNj+/2yxHXKen1AjvHZEVFns/Bb2MmRABpag
         w3iw==
X-Gm-Message-State: APjAAAU7ovspD56KucTEUx5R92AwO/UOht4fb8LDlLOfo1A5bILGRnS2
        8hCJ1zuJMzSe1ehzhqo8avIYECbc
X-Google-Smtp-Source: APXvYqzepYAA7e2pZPdfvzZSVSsHjXDmo+jiyyY3NneGZ8E3oU70oI0UQBisr7KutWK4BlZxXm24eQ==
X-Received: by 2002:a17:90a:9a92:: with SMTP id e18mr12506055pjp.87.1570724401424;
        Thu, 10 Oct 2019 09:20:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j128sm6653385pfg.51.2019.10.10.09.19.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 09:19:59 -0700 (PDT)
Date:   Thu, 10 Oct 2019 09:19:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jiri Kosina <trivial@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wdt: bd70528: Trivial function documentation fix
Message-ID: <20191010161958.GA22086@roeck-us.net>
References: <20191010060733.GA9979@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010060733.GA9979@localhost.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 10, 2019 at 09:07:33AM +0300, Matti Vaittinen wrote:
> The function documentation for the exported  ROHM BD70528 WDG control
> functions used old argument names. Fix the names.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bd70528_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/bd70528_wdt.c b/drivers/watchdog/bd70528_wdt.c
> index b0152fef4fc7..439f9920978a 100644
> --- a/drivers/watchdog/bd70528_wdt.c
> +++ b/drivers/watchdog/bd70528_wdt.c
> @@ -97,7 +97,7 @@ EXPORT_SYMBOL(bd70528_wdt_set);
>  /**
>   * bd70528_wdt_lock - take WDT lock
>   *
> - * @bd70528:	device data for the PMIC instance we want to operate on
> + * @data:	device data for the PMIC instance we want to operate on
>   *
>   * Lock WDT for arming/disarming in order to avoid race condition caused
>   * by WDT state changes initiated by WDT and RTC drivers.
> @@ -114,7 +114,7 @@ EXPORT_SYMBOL(bd70528_wdt_lock);
>  /**
>   * bd70528_wdt_unlock - unlock WDT lock
>   *
> - * @bd70528:	device data for the PMIC instance we want to operate on
> + * @data:	device data for the PMIC instance we want to operate on
>   *
>   * Unlock WDT lock which has previously been taken by call to
>   * bd70528_wdt_lock.
> -- 
> 2.21.0
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
