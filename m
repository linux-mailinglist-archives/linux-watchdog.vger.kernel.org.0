Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5312A9B00
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 18:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKFRlM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 12:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgKFRlM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 12:41:12 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33281C0613CF;
        Fri,  6 Nov 2020 09:41:12 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id i18so1985109ots.0;
        Fri, 06 Nov 2020 09:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uLhEdPzLKPN9y0Y1FvDCW1msQK/rmAeoz0yPSS7CP/s=;
        b=jqRks1dh3gjGCUabb2ufNQxlNGI8bjL4On2wkLX9Ph8+OqEoK6yCVqP3PSAQrxYePZ
         OvlbZdByOacc3+0thZjFFoJm5sywILYb9ecoghyIdSRyo4SksjTqKEKwrv0eMEvFrDOH
         8OeowFAovGAqDBPuc4PLswmyAHnzXKiTZzXvGce0fwYP1UM5Yl3dBudxTkPFCVe1S/7J
         HAOzPav18RCtb6VZLoE0ko9LqVCeZKOK/Wi1L+TMXcb9bf/CF+M8dfnVO41tpnENV2ly
         MAYEG4gwCPHWmHxXyrhyEG6xUqX8bAIUtALTw5Z+uyC7qKHjxcabmD2CZVoimVwI0eQf
         yZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=uLhEdPzLKPN9y0Y1FvDCW1msQK/rmAeoz0yPSS7CP/s=;
        b=EqNe9g6StmY1jZTLC3jxERX7ROPRbwN5Oy4gd8JRfGVBgUJgAqj3EPjdndKKUCdpi/
         PjKOItYSBztuF/skVQq34puIVS3mKwJZQ4MWxmAeQ9J/H06YtLowRKcGhJ3DAp+zx3mL
         FGL2E0EvxnWZFIZMUx7iblYbaOBrRql4kFNaWQcURFob729Fs8XPA6VXgcv9+yTS6Lza
         hasgVTDkV0pz4dNVUxHT822I3qre/8weR7HnA0MIQ/eQxtXtJuTlR4cKKqVlQxP3QFYQ
         Q1VltveFTRbOxCOXfYbh7rn4tmOFU5JvYGDVpn4SiREpcpYbPsQDtr//bbjUPwYcul5F
         0SDg==
X-Gm-Message-State: AOAM531sXP4uKjk9z8QVlb9yauwZHq5DhiYfDe8Gool8q8R8pYP6Fl6B
        Fejou1PlsLFCdMsjtMQUpf8zZb0RPGo=
X-Google-Smtp-Source: ABdhPJxSjaZ0nuVUyMqzhEbLb4XE4zzKDOr9zqrn8ee4fvTdWOQ00WwQQvU2vC4TLwd24DGXXkbhCQ==
X-Received: by 2002:a9d:720e:: with SMTP id u14mr1893659otj.65.1604684471589;
        Fri, 06 Nov 2020 09:41:11 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e3sm464230ooq.0.2020.11.06.09.41.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Nov 2020 09:41:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 6 Nov 2020 09:41:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe Roullier <christophe.roullier@st.com>
Cc:     wim@linux-watchdog.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Etienne Carriere <etienne.carriere@st.com>
Subject: Re: [PATCH V2 1/1] watchdog: stm32_iwdg: don't print an error on
 probe deferral
Message-ID: <20201106174109.GF14837@roeck-us.net>
References: <20201106142327.3129-1-christophe.roullier@st.com>
 <20201106142327.3129-2-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106142327.3129-2-christophe.roullier@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 06, 2020 at 03:23:27PM +0100, Christophe Roullier wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Do not print an error trace when deferring probe for clock resources.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/stm32_iwdg.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 25188d6bbe15..a3436c296c97 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -162,18 +162,15 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  	u32 ret;
>  
>  	wdt->clk_lsi = devm_clk_get(dev, "lsi");
> -	if (IS_ERR(wdt->clk_lsi)) {
> -		dev_err(dev, "Unable to get lsi clock\n");
> -		return PTR_ERR(wdt->clk_lsi);
> -	}
> +	if (IS_ERR(wdt->clk_lsi))
> +		return dev_err_probe(dev, PTR_ERR(wdt->clk_lsi), "Unable to get lsi clock\n");
>  
>  	/* optional peripheral clock */
>  	if (wdt->data->has_pclk) {
>  		wdt->clk_pclk = devm_clk_get(dev, "pclk");
> -		if (IS_ERR(wdt->clk_pclk)) {
> -			dev_err(dev, "Unable to get pclk clock\n");
> -			return PTR_ERR(wdt->clk_pclk);
> -		}
> +		if (IS_ERR(wdt->clk_pclk))
> +			return dev_err_probe(dev, PTR_ERR(wdt->clk_pclk),
> +					     "Unable to get pclk clock\n");
>  
>  		ret = clk_prepare_enable(wdt->clk_pclk);
>  		if (ret) {
> -- 
> 2.17.1
> 
