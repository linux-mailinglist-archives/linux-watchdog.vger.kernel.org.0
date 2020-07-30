Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6014233732
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 18:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgG3QxU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 12:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG3QxT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 12:53:19 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BCFC061574;
        Thu, 30 Jul 2020 09:53:19 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w17so14676977ply.11;
        Thu, 30 Jul 2020 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FsoEV1cyBnFRsNl5V+1d07ITk7Hh7UvpRiA1Dhd44vo=;
        b=Gmfjbc9fahkE1mEOHQFRjjBVr5fJXmmkmHl+gW96pxG+MdFJTRtfFUpP2XkGJoTV4F
         88LOWNKrCKR0ENts3EsXT01cKqZL1MELs8VNzxriSbPMiSwcN/WpSur2MXbdJB5ebHx9
         3HUbnaikyq0+whPTW6xZ1zL7CF2LgYYDp8gN5izNMW4FobBaN1GS7pb31LPilYh8fvTK
         mPSDZq6pbmuFdAGftqa5CMycfn/ijwd0PoPFxHuPiUkbPhNKZvdGurw8HBb07tjwrNlE
         yFZQ5v5yaYvkPdgRqcGg9CjRfa9ECUnrt27+An9AHD2H5s5Rx2hDlDB2rrDk6Vm0CKD5
         qm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=FsoEV1cyBnFRsNl5V+1d07ITk7Hh7UvpRiA1Dhd44vo=;
        b=FBTBGnNVxgi922VuW9VnVFX2FVwd3J0dGrw2qXIwMbIwjdCIQRAkmHyGXQuu2zb8Q5
         F95fJgF0Y/AzMs26OSPqmfUTsrFTzR2lTQBxGlofwixlr7kICn9HrmSuHGDtngrYaTY6
         H9JzVf/CUbWJv1wRnSXtnpHj3XOvfAvzYoK4OV8kXYd6tdlYnbObtOy2leaMwtySqqIr
         dTgERUDol5fzVjvNn9OK8ouDvQNGZuYZ7FbOo8bT+Xlddx4HjfQhvy0dn/BnZEUM/wKA
         7se4uyNrBBhHzxYZW076ByURHPzsJh2dLCKmhfSuwMx/1YT3WopCrXK4ti1IH9GXl3qK
         MR6w==
X-Gm-Message-State: AOAM533gIz6iGc7/ZFKI4ERYURcj2H7rdwCx7nQuK6UKF3eVWV2mgQEI
        cQlucp1POksH7zyQd1rLYXAaIR2E
X-Google-Smtp-Source: ABdhPJyBiRUmuNgQqQaeaWAnB8CarCpvLAuViJ+cPF4A4NhrJ08cFe1eTl3idbKDBuPjqkgZAVhmWQ==
X-Received: by 2002:aa7:83c9:: with SMTP id j9mr4029996pfn.151.1596127999129;
        Thu, 30 Jul 2020 09:53:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z3sm6117403pjn.32.2020.07.30.09.53.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 09:53:18 -0700 (PDT)
Date:   Thu, 30 Jul 2020 09:53:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V3 2/2] watchdog: imx7ulp: Watchdog should continue
 running for wait/stop mode
Message-ID: <20200730165317.GB178323@roeck-us.net>
References: <1596074591-4207-1-git-send-email-Anson.Huang@nxp.com>
 <1596074591-4207-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596074591-4207-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 30, 2020 at 10:03:11AM +0800, Anson Huang wrote:
> When kernel idle, system will enter wait/stop mode, wdog should continue
> running in this scenario, and the refresh thread can wake up system from
> wait/stop mode.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> no change.
> ---
>  drivers/watchdog/imx7ulp_wdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 010ddd1..77773b0 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -22,6 +22,8 @@
>  #define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
>  #define WDOG_CS_EN		BIT(7)
>  #define WDOG_CS_UPDATE		BIT(5)
> +#define WDOG_CS_WAIT		BIT(1)
> +#define WDOG_CS_STOP		BIT(0)
>  
>  #define WDOG_CNT	0x4
>  #define WDOG_TOVAL	0x8
> @@ -187,7 +189,8 @@ static int imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
>  	/* set an initial timeout value in TOVAL */
>  	writel(timeout, base + WDOG_TOVAL);
>  	/* enable 32bit command sequence and reconfigure */
> -	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
> +	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE |
> +	      WDOG_CS_WAIT | WDOG_CS_STOP;
>  	writel(val, base + WDOG_CS);
>  	imx7ulp_wdt_wait(base, WDOG_CS_RCS);
>  
> -- 
> 2.7.4
> 
