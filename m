Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1CE20BBDE
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jun 2020 23:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgFZVvf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Jun 2020 17:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgFZVvf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Jun 2020 17:51:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41196C03E979;
        Fri, 26 Jun 2020 14:51:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id u8so5222328pje.4;
        Fri, 26 Jun 2020 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cqb3wk0hUma413lkpnxtyPqW03CAUoIBPP21b3/U7s4=;
        b=XvioqvgD+aew35FOBeGXJNltNZyBpH0u8SJEfqCEKL/TjOymGdZoUchFVYv4VnrqQG
         LLp41C3Hf1LwcSfwcH8bf2AxtmqPv54wsqi3iNQK1pRjRf5qtlprPtPPW0wux+WTCJc+
         xs3bsTPfEbl7UToVTJ8MDpPM9YMQ92vRDmnQpFwM8mafjuB+S8udpWrtPmbsOH4YRU41
         4zB3tZ8XUfMQeZM1adBUYtCQMVDl+FwfMO/1vp+RsB08BI0e0L8Hkae2wtP8XN3DSac3
         GrVwOxY9LlyLtqkbs/6qZ85yBZcTWztnZBmgW8zHJyUHL5lpfzfdDv3pS8RHyJ6u4t6c
         mGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cqb3wk0hUma413lkpnxtyPqW03CAUoIBPP21b3/U7s4=;
        b=cxMKpa4gcCbTFMkIeQvSGhHd+Vo1I6X6QywqfdIcLjhU/RIzLR6y+mY9PERBwhwYKN
         IPcFFlB0G6ADfOoaoBugclsChPG9yvXktQGyDRasdxHeZNxYcpIHCcUQd3qzZ1yFsW/P
         ZaIqyHu6g5zxuGUeFTY90iMrXQfuEKJMIbmTjtQmunv9qQIMTd7xMcVahE5voqWsVfa9
         nPQHtVa+cl8pLNvpc6khwzKePRuWQNHRRCxnGsMBJ3qyAMP2+Yi5dgBNDBSBADhrjYG9
         yt7/ZwHe4gXs1eKEfxZ9U04WdNURzWB5Dimqr4gqDcnA+yHlaEDBj94IioCUiE6Npk4J
         oLjQ==
X-Gm-Message-State: AOAM530lwXtCGOdtSOiJ7yJZeRWYHKFxovxrC8//AzDBcUA8lv2nObwo
        K93TI5y/QJ6BAyfGISLSj66AHYuR
X-Google-Smtp-Source: ABdhPJzNJTgLL2d14HOeuVE2qg2Mwn93jZdK3mlmy/7vdBiwrfJlqpT6etOWvNaDZePsrZmMCavNyg==
X-Received: by 2002:a17:90a:f206:: with SMTP id bs6mr5689392pjb.48.1593208294806;
        Fri, 26 Jun 2020 14:51:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 140sm26539226pfz.154.2020.06.26.14.51.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 14:51:34 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:51:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Timothy Myers <timothy.myers@adtran.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Boike <david.boike@adtran.com>
Subject: Re: [PATCH 1/1] watchdog: Add common nowayout parameter to booke_wdt
 driver
Message-ID: <20200626215133.GB254814@roeck-us.net>
References: <CH2PR19MB35903F8A6A46864C47A720029D930@CH2PR19MB3590.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH2PR19MB35903F8A6A46864C47A720029D930@CH2PR19MB3590.namprd19.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 26, 2020 at 01:39:43PM +0000, Timothy Myers wrote:
> Add the common "nowayout" parameter to booke_wdt to make this behavior
> selectable at runtime and to make the implementation more consistent with
> many other watchdog drivers.
> 
> Signed-off-by: Timothy Myers <timothy.myers@adtran.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/booke_wdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/booke_wdt.c b/drivers/watchdog/booke_wdt.c
> index 9d09bbfdef20..7817fb976f9c 100644
> --- a/drivers/watchdog/booke_wdt.c
> +++ b/drivers/watchdog/booke_wdt.c
> @@ -39,6 +39,11 @@ static bool booke_wdt_enabled;
>  module_param(booke_wdt_enabled, bool, 0);
>  static int  booke_wdt_period = CONFIG_BOOKE_WDT_DEFAULT_TIMEOUT;
>  module_param(booke_wdt_period, int, 0);
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout,
> +               "Watchdog cannot be stopped once started (default="
> +                               __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> 
>  #ifdef CONFIG_PPC_FSL_BOOK3E
> 
> @@ -215,7 +220,6 @@ static void __exit booke_wdt_exit(void)
>  static int __init booke_wdt_init(void)
>  {
>         int ret = 0;
> -       bool nowayout = WATCHDOG_NOWAYOUT;
> 
>         pr_info("powerpc book-e watchdog driver loaded\n");
>         booke_wdt_info.firmware_version = cur_cpu_spec->pvr_value;
> 
> base-commit: dd0d718152e4c65b173070d48ea9dfc06894c3e5
> --
> 2.20.1
> 
> 
> 
> Timothy Myers
> Software Design Engineer
> 
> Office: 256.963.8844
> Email: timothy.myers@adtran.com<https://owa.adtran.com/owa/redir.aspx?C=LNINRERj1VQgAKE9UNiu-b2J50yb_mKuK9OX8J4spjQqMzmAKlzUCA..&URL=mailto%3atom.patterson%40adtran.com>
> Web: www.adtran.com<https://owa.adtran.com/owa/redir.aspx?C=AO4_0fpgN4Gmyy4bPe0sTxLKfRJry5Qrse3aJSw01zEqMzmAKlzUCA..&URL=http%3a%2f%2fs.bl-1.com%2fh%2fCoY1mz9%3furl%3dhttp%3a%2f%2fwww.adtran.com>
> 
> ADTRAN
> 901 Explorer Boulevard
> Huntsville, AL 35806 - USA
