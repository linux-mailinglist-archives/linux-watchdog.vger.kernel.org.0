Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8362ECF84
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Nov 2019 16:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfKBPkA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 Nov 2019 11:40:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46600 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfKBPkA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 Nov 2019 11:40:00 -0400
Received: by mail-pf1-f196.google.com with SMTP id 193so7732142pfc.13
        for <linux-watchdog@vger.kernel.org>; Sat, 02 Nov 2019 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EYG4Sgi9Cwrtm712zCxrEbI96dSzcm46QgJ058+MtFQ=;
        b=CoSr2YRoqJysUDCASTnWmD7ZM4+FxEL14mYkWxwRyoAibLetiohq85TCw+Rb+S02rv
         oO/s5WOpDj4yL94MKP2n4kPqcm2FpTsvhxYK4kK/cSeGj7D4A/X/Lu5e/Y3hQiv+VSLy
         5SCDAHa4e+JvPTwqZjXu5JgufvuZjeEKJaFV3eH6vKHQjfRAaH/dvudQELGe4yxzMD8/
         JI0ynyA75R+SfsMJqZxg9+2e3Heri/+bOkheCQA1KF9cT9Wl7d5iRXxt3hVzpOCM42gE
         50KlF4ksKaZ2zOit2YE4CEj5OV1V8o0XZ54jLsP5plz+aN0afxOotuWv45M1Ymud6AAW
         Yg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=EYG4Sgi9Cwrtm712zCxrEbI96dSzcm46QgJ058+MtFQ=;
        b=jAiJrxOK8DhRZdEboof6qIiEwQ9uVCUftoVXV1lMyCDuZHTcIAzYPyOL6stMT/6eB/
         Z57TLkEMOsTc5d4a7cnT5eCTvAl4voBm6oCdBSgeQviwIpM+INJINsZt01IJ8ysS9yYS
         Qfjto1N6I2OpO6WfthGgOFQpEqXbvLrj+bw10Sz8JJM0vS5Id6rV11XOmVTd/cL0DBEd
         6GBIjx+dOaYJMKn/B+GF2Lbb9nHzC9ENOgufO8oJW7w5VJd9LOPkWzfNfCV/BP90gIh1
         sW/uGWfB70T9B9XQd38kFHKwuHOFPl/HrWu5G3XweIbjffs4ZIdblhid281Yh/5eJwpY
         aruQ==
X-Gm-Message-State: APjAAAXqwawekbzsCyWep9BgO+PqeASkq91DInI0+qqMZbWZ48t3Qny9
        RHXlchgl0+ELEiZiIv4IZxI=
X-Google-Smtp-Source: APXvYqzj0iePlPOToZ5W5DpcdxbOmhRJQvOf3P0eI4SBaYduof7e3HtV7WWx6k/2sxxne2rcPv8HsA==
X-Received: by 2002:a17:90a:b78d:: with SMTP id m13mr24115307pjr.70.1572709199214;
        Sat, 02 Nov 2019 08:39:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b6sm12125135pga.12.2019.11.02.08.39.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2019 08:39:58 -0700 (PDT)
Date:   Sat, 2 Nov 2019 08:39:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Anson.Huang@nxp.com, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 4/5] watchdog: imx7ulp: Remove inline annotations
Message-ID: <20191102153957.GA17285@roeck-us.net>
References: <20191029174037.25381-1-festevam@gmail.com>
 <20191029174037.25381-4-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029174037.25381-4-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 29, 2019 at 02:40:36PM -0300, Fabio Estevam wrote:
> Compiler is smart enough and knows when to inline, so there
> is no need to mark some of these functions as 'inline'.
> 
> Remove such annotations.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx7ulp_wdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index ed4f7d439f2e..bcef3b6a9782 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -46,7 +46,7 @@ struct imx7ulp_wdt_device {
>  	struct clk *clk;
>  };
>  
> -static inline void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
> +static void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
>  {
>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>  
> @@ -59,7 +59,7 @@ static inline void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
>  		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
>  }
>  
> -static inline bool imx7ulp_wdt_is_enabled(void __iomem *base)
> +static bool imx7ulp_wdt_is_enabled(void __iomem *base)
>  {
>  	u32 val = readl(base + WDOG_CS);
>  
> @@ -132,7 +132,7 @@ static const struct watchdog_info imx7ulp_wdt_info = {
>  		    WDIOF_MAGICCLOSE,
>  };
>  
> -static inline void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
> +static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
>  {
>  	u32 val;
>  
