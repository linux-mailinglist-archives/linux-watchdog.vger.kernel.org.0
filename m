Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0CAECF82
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Nov 2019 16:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKBPh4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 Nov 2019 11:37:56 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38093 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfKBPhz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 Nov 2019 11:37:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id j30so4841816pgn.5
        for <linux-watchdog@vger.kernel.org>; Sat, 02 Nov 2019 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0Ke6nR1UXXyMi95LasliTCEMnAURFFFQouAit3aJfKQ=;
        b=Pb4tumMJTiTQ3v2Yx1rdioSh2BTPJzhQ/NGGH5LW3e28wpIO7WCDoI8yUF+/FTw+DV
         ZUA5tIbAPBajSZOf+cgfQpAmqqJebvNMeGMDqTY60snUCCnYhSjbCslhDtv0V4bHfdff
         +DE+DQQ9B3zyuOte1oS4C7ZfCllcl5mOYRPCzOjlNZszMvbDty5TolspZD3pIWcSW98B
         lmMyMwAO2zV5mzPwlVDcUJnRFUjxtV+/pMapDfbCKV4RKnpQQDXEqFz9FeNRHcefyT74
         ljVDd1R3M4HT4LpFFSqLsjtJQOJcwEegVvOgBZ9wyW1my43BZVxFXYG/HKF+oWeTIaQD
         A28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0Ke6nR1UXXyMi95LasliTCEMnAURFFFQouAit3aJfKQ=;
        b=ZmQuspnBd+0Uzd6yge4H5jj5gLqvyixZHKmMVphD052CvhRsy89R5wj2jRHercEB5V
         eI4AcTl4BcovEo0xSG2fnWka5e338X9LXyD9j+JarzinOnjlwjVlwD/tyOJpjCmfP6RB
         +5sjUAzbLzIvl8OHkr1KW84fLwCQqDnNuwXsxf1TzeUdN2P123rSkHs1U3dcxQISgH9n
         4/9AJ++JIpVEk0pzskJ/D9bwjxqoqKqZZhZ1O4CnS9wzORMuAavFgyWyaN3oPRXb4IEd
         IiRCBRrJlz7ae0bfZsyAxVAh2CBS40ubfJqpVjfwjoLEFD19JtmQ0dzxprzV78W33cyS
         1XJg==
X-Gm-Message-State: APjAAAWsmWXuHregECqYGkHN8OFPfmAqeU7xfhtWB1USOReC2oXPQhQX
        Jg/YiqL1RY8jgajypfNQvu4=
X-Google-Smtp-Source: APXvYqxyCdjog4ANUXTCRHl8btS7KckXID+ZlWvPn3+eFH1ui7RpoUhhNKtvBRkGmLJfr7dJ7zhxtw==
X-Received: by 2002:a63:5a12:: with SMTP id o18mr698506pgb.195.1572709075042;
        Sat, 02 Nov 2019 08:37:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w26sm17486366pfj.123.2019.11.02.08.37.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2019 08:37:54 -0700 (PDT)
Date:   Sat, 2 Nov 2019 08:37:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Anson.Huang@nxp.com, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/5] watchdog: imx7ulp: Pass the wdog instance
 inimx7ulp_wdt_enable()
Message-ID: <20191102153753.GA5880@roeck-us.net>
References: <20191029174037.25381-1-festevam@gmail.com>
 <20191029174037.25381-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029174037.25381-2-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 29, 2019 at 02:40:34PM -0300, Fabio Estevam wrote:
> It is more natural to pass the watchdog instance inside
> imx7ulp_wdt_enable() instead of the base address.
> 
> This also has the benefit to reduce the code a bit.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx7ulp_wdt.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index ba5d535a6db2..eea415609d44 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -47,15 +47,17 @@ struct imx7ulp_wdt_device {
>  	struct clk *clk;
>  };
>  
> -static inline void imx7ulp_wdt_enable(void __iomem *base, bool enable)
> +static inline void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
>  {
> -	u32 val = readl(base + WDOG_CS);
> +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> +
> +	u32 val = readl(wdt->base + WDOG_CS);
>  
> -	writel(UNLOCK, base + WDOG_CNT);
> +	writel(UNLOCK, wdt->base + WDOG_CNT);
>  	if (enable)
> -		writel(val | WDOG_CS_EN, base + WDOG_CS);
> +		writel(val | WDOG_CS_EN, wdt->base + WDOG_CS);
>  	else
> -		writel(val & ~WDOG_CS_EN, base + WDOG_CS);
> +		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
>  }
>  
>  static inline bool imx7ulp_wdt_is_enabled(void __iomem *base)
> @@ -76,18 +78,15 @@ static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
>  
>  static int imx7ulp_wdt_start(struct watchdog_device *wdog)
>  {
> -	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>  
> -	imx7ulp_wdt_enable(wdt->base, true);
> +	imx7ulp_wdt_enable(wdog, true);
>  
>  	return 0;
>  }
>  
>  static int imx7ulp_wdt_stop(struct watchdog_device *wdog)
>  {
> -	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> -
> -	imx7ulp_wdt_enable(wdt->base, false);
> +	imx7ulp_wdt_enable(wdog, false);
>  
>  	return 0;
>  }
> @@ -109,10 +108,8 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
>  static int imx7ulp_wdt_restart(struct watchdog_device *wdog,
>  			       unsigned long action, void *data)
>  {
> -	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> -
> -	imx7ulp_wdt_enable(wdt->base, true);
> -	imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
> +	imx7ulp_wdt_enable(wdog, true);
> +	imx7ulp_wdt_set_timeout(wdog, 1);
>  
>  	/* wait for wdog to fire */
>  	while (true)
