Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 973547BFE52
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Oct 2023 15:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjJJNrU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Oct 2023 09:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbjJJNrG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Oct 2023 09:47:06 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E731BE
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Oct 2023 06:46:58 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-692c02adeefso4126515b3a.3
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Oct 2023 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696945618; x=1697550418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYmGcipAhHUMHsqzlD4tfPIdzeoL/sOS8/eVu4ybFDg=;
        b=jtnsITXrORYoeo3XPbdcKnO2Em5O//w48mH0JJyfaN5F2kbt3gRs7icSyJZ5M88j7e
         9QWrvbzmI2FDsWDpzzKwwkz36LMhlEWfmKGP9UKD3JjYQoUckVPTBnDkp1Jd6daVmHXM
         JOYs/mYpQw76OK4zSY1s9Ld0UB1in21L4ucNNokTZixdAnhLrzzs3CFLZPmQcFWr0Udz
         /buqPcHATBoPGvTRBwkVCKmBAgLRpsRu8eJVlMmxOrzsbAM7E/Rltf9V3uMVEoHxwr7l
         y1eC3g+cWzSbgc5KTWbiRSg6jQiPPsgeeLuA/XuQITw4+XkrHH1GIoPWELs8hV6E2xb4
         PowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945618; x=1697550418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYmGcipAhHUMHsqzlD4tfPIdzeoL/sOS8/eVu4ybFDg=;
        b=EmvFuQZTFvVLqrZ0HV882XiZtubI2kLzmh2ZRU/lWeVOuMznEgbf6IWo+rAOXedPs+
         2bjeJV8tJkOIxo1SIZkrLyBXcutgvURwO32JBxGXmxXW18rzo+sIqMIyji1R2sCmvVxd
         LzrtZCD9A8wSUbsbjwQ4dfPSuDWjfjAw6P5Iyyydi5+3F98wvBsZKFAi0rO2AIlBni+U
         R8dsZ4tWjFTU/XvRJmkpiDK9Z8uZX022QZiLNpQGNNyIbRmG5QawWV1jltnWhEb+74hI
         CLAxajaHok0EOURiphB/dYAwsUgu44kq0f2Fejr9Z4ZXnUXMwmkPo/lNmvySjdb2znVP
         mvcw==
X-Gm-Message-State: AOJu0YxDLWTrl5mkcOLCjRdzew15DSLXGfEjJdjJHEcIjruvRSJPwbEd
        Fqg3/viKKpNSuAzsZJjF6mM=
X-Google-Smtp-Source: AGHT+IHqg8Iw3GN1eMmoP82XpvrS4Rz0/QLrAlJVCu/Jasid5VOnviz3vok9mXUYa+/+LHNBVwx+4A==
X-Received: by 2002:a05:6a20:a11f:b0:16b:b0ea:b0a1 with SMTP id q31-20020a056a20a11f00b0016bb0eab0a1mr11745530pzk.34.1696945617633;
        Tue, 10 Oct 2023 06:46:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x20-20020a62fb14000000b00682d79199e7sm8212935pfm.200.2023.10.10.06.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:46:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 10 Oct 2023 06:46:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: imx_sc_wdt: continue if the wdog already
 enabled
Message-ID: <cab39dae-cd1a-4ec0-9ed5-19a71344b488@roeck-us.net>
References: <20231010074626.2787383-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010074626.2787383-1-ping.bai@nxp.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 10, 2023 at 03:46:26PM +0800, Jacky Bai wrote:
> if the wdog is already enabled, and try to enabled it again,
> we should ignore the error and continue, rather than return
> error.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx_sc_wdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index 8ac021748d16..e51fe1b78518 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -34,6 +34,7 @@
>  
>  #define SC_IRQ_WDOG			1
>  #define SC_IRQ_GROUP_WDOG		1
> +#define SC_TIMER_ERR_BUSY		10
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  module_param(nowayout, bool, 0000);
> @@ -61,7 +62,9 @@ static int imx_sc_wdt_start(struct watchdog_device *wdog)
>  
>  	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_START_WDOG,
>  		      0, 0, 0, 0, 0, 0, &res);
> -	if (res.a0)
> +
> +	/* Ignore if already enabled(SC_TIMER_ERR_BUSY) */
> +	if (res.a0 && res.a0 != SC_TIMER_ERR_BUSY)
>  		return -EACCES;
>  
>  	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_WDOG_ACT,
> -- 
> 2.34.1
> 
