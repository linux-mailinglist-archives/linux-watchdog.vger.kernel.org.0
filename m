Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF1920FE2F
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgF3Uvd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgF3Uvc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:51:32 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7532BC061755;
        Tue, 30 Jun 2020 13:51:32 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id q17so9927094pfu.8;
        Tue, 30 Jun 2020 13:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k/n92nNe83tZwUXGZP93dxugUjMurXa9lQlgKrPw4u0=;
        b=XAbc0UaBfOap0VdeCTuIJzSsWAvtK6eKynP+8YLTU9lax8vE15V9TkpFzMGl0yJ0WF
         djJc0LEz/MFp72+Z9xHNHplJ7IujLtCt7DQhgVqhhomsLTbjQkoH7NjXxX4XE/f6Jx5M
         9t4MN6czTmWs1reeFs5wrtvR4Oceo46dL1m2B8hI1PbSBkAoXKHygEeBOwgOAZCaqeEi
         aYnSz4vYYXjsBtbzI9yF/j3bPcsuud+qYR03nrtWSP3sVKdgVpze99sxJkJDc9ESFDJw
         0Ixy72S6LWSuBUL2YSQTaN3dg5BlkD3ayn9knzXepPXiJGSwoBfh3hP/voESaJe9Q/9j
         JTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=k/n92nNe83tZwUXGZP93dxugUjMurXa9lQlgKrPw4u0=;
        b=XOo6hRqC+uEHSNjr+pOYXDj8PAL4t+o/1x3GBbHDE94I45Vv+xfgV1OcRztSR07/36
         X0y+44Szd5oy6iUQPwVfU4diFIyi8OILlNTcUnl00dj4PZw43ZQHP9+icP5Fqs4MUJQ6
         cAbPC2xnWRe6uTMjBRXgajREabtiAdnYrnKYZBsIv/13zY2buNCltmLZR9ig70z3aiPL
         QPjXVK7jjhdlxfiqNJMbPh80yUeqb4CPdEWYujnFIzOR/PEdzMVn9/V/p31OU0oaRrfD
         WQyEH7CPzWG4Y4QZI0ojEfkrO80D3NIzzKWkuNgQW6Cql6yolqsimLq6jiMi11saI8KT
         3kqg==
X-Gm-Message-State: AOAM532WPSCC8ynRnTEfMLQjVYJvW/RQby5N3kJ7Wz8WUIhXnGSwKlXo
        unC7DHy6HgrBpuhkyc8atZk=
X-Google-Smtp-Source: ABdhPJxceCc08nliYrPiKRxjvKyZCOHMjlVsl1TGkhmHDCLGJBAjfi3oGzYWscCAi6IofwMOQEk/Lg==
X-Received: by 2002:a63:b90a:: with SMTP id z10mr15852318pge.277.1593550292052;
        Tue, 30 Jun 2020 13:51:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d22sm3571885pfd.105.2020.06.30.13.51.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 13:51:31 -0700 (PDT)
Date:   Tue, 30 Jun 2020 13:51:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Knud Poulsen <knpo@ieee.org>, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/8] watchdog: f71808e_wdt: indicate WDIOF_CARDRESET
 support in watchdog_info.options
Message-ID: <20200630205130.GA21689@roeck-us.net>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
 <20200611191750.28096-3-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611191750.28096-3-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 11, 2020 at 09:17:43PM +0200, Ahmad Fatoum wrote:
> The driver supports populating bootstatus with WDIOF_CARDRESET, but so
> far userspace couldn't portably determine whether absence of this flag
> meant no watchdog reset or no driver support. Or-in the bit to fix this.
> 
> Fixes: b97cb21a4634 ("watchdog: f71808e_wdt: Fix WDTMOUT_STS register read")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index a3c44d75d80e..c8ce80c13403 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -692,7 +692,8 @@ static int __init watchdog_init(int sioaddr)
>  	watchdog.sioaddr = sioaddr;
>  	watchdog.ident.options = WDIOC_SETTIMEOUT
>  				| WDIOF_MAGICCLOSE
> -				| WDIOF_KEEPALIVEPING;
> +				| WDIOF_KEEPALIVEPING
> +				| WDIOF_CARDRESET;
>  
>  	snprintf(watchdog.ident.identity,
>  		sizeof(watchdog.ident.identity), "%s watchdog",
