Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 300533934C
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 19:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731506AbfFGRb7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 13:31:59 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40583 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729355AbfFGRbz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 13:31:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id d30so1504829pgm.7;
        Fri, 07 Jun 2019 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tDBgBtQ4Suh8pBvnPYDqoICoAhg7eosA6o2kUfLfqv4=;
        b=TI+oNtKIdSE8rwUEM0CCXfs5gLGdzaNAnPLaFustbBvT4ilCBa96jgrtdGIYZuuz0+
         LPzFh2xIpjZUhz9pXnXoJVmj8lkLlb+GbEZA6ukcuqqfB6CGpwOtNdaZTsLyx8ubjwPu
         7ZP/0b7PHwaZJCTwgiGWMjIOcivjXOETg8Bsx8fygqX7e/2ARQ9H46czUZ7FHKlkja8x
         ryQ0ez5JyoBCAzK+9VH5ZPyVZEZiXzqEekKoFp+G3qZaWQ6ktrreTI2MifsX70qHfd/X
         22iFCyK6Byc5EI/kZqKX0ABP/9hAMVloqma7+fRdqFP6CbCRKvdAEjWyfsYQ5RqR3UN0
         QdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=tDBgBtQ4Suh8pBvnPYDqoICoAhg7eosA6o2kUfLfqv4=;
        b=HEewuxaPQy+uE/mrklwuoOiGiCxrmTYM0keZeiQLtYUEs3+PL6kutZwwwz468WPKvT
         aNBpDiqmLzfOZle0OZ7NNqzbuBkWc50f/nEeRIbBTUVk13NayrUCVDMwl2x1jysHaNwr
         ZfgD9yfrJrJgx7BA2PYr/sKMtMv3BJgJcdui6OLAqxpsvHlDJA3QjYae1He3dJo0HZs4
         AARYqgFPPxZXnofg08bt1jtUXwLERqOCMAWuwyYGK376tiVGydpdnXgtvZblwLQ7NRTR
         rOtaCj9i2qgtFv1zlPXxFbNxd2kZQP8yxCgow2EufcsfCTT3VWm5fAgSDjhwuYhjtfM6
         gSjQ==
X-Gm-Message-State: APjAAAUelxumGnL0LKdNnlCYGtLFTAGCKNd8eJrsvmNrOn5/cW0vVSe8
        NIt9AaRn5tMCCkz1q5j6WtE=
X-Google-Smtp-Source: APXvYqxZI3DPByuRqS2swPfUz1CU04kh1J35cwrGO+GrmUlQwTo0qReuqcI0HRNfBx5JfLyTuAOR3A==
X-Received: by 2002:a17:90a:8d86:: with SMTP id d6mr6607271pjo.127.1559928714404;
        Fri, 07 Jun 2019 10:31:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e20sm2622549pfi.35.2019.06.07.10.31.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:31:53 -0700 (PDT)
Date:   Fri, 7 Jun 2019 10:31:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        wsa+renesas@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: Re: [PATCH] watchdog: renesas_wdt: Use 'dev' instead of
 dereferencing it repeatedly
Message-ID: <20190607173152.GA14638@roeck-us.net>
References: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp>
 <1558603778-20848-2-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558603778-20848-2-git-send-email-na-hoan@jinso.co.jp>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 23, 2019 at 06:29:38PM +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Add helper variable dev = &pdev->dev
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/renesas_wdt.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 565dbc1..d8ac229 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -175,15 +175,16 @@ static inline bool rwdt_blacklisted(struct device *dev) { return false; }
>  
>  static int rwdt_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct rwdt_priv *priv;
>  	struct clk *clk;
>  	unsigned long clks_per_sec;
>  	int ret, i;
>  
> -	if (rwdt_blacklisted(&pdev->dev))
> +	if (rwdt_blacklisted(dev))
>  		return -ENODEV;
>  
> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> @@ -191,16 +192,16 @@ static int rwdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> -	clk = devm_clk_get(&pdev->dev, NULL);
> +	clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>  
> -	pm_runtime_enable(&pdev->dev);
> -	pm_runtime_get_sync(&pdev->dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
>  	priv->clk_rate = clk_get_rate(clk);
>  	priv->wdev.bootstatus = (readb_relaxed(priv->base + RWTCSRA) &
>  				RWTCSRA_WOVF) ? WDIOF_CARDRESET : 0;
> -	pm_runtime_put(&pdev->dev);
> +	pm_runtime_put(dev);
>  
>  	if (!priv->clk_rate) {
>  		ret = -ENOENT;
> @@ -216,14 +217,14 @@ static int rwdt_probe(struct platform_device *pdev)
>  	}
>  
>  	if (i < 0) {
> -		dev_err(&pdev->dev, "Can't find suitable clock divider\n");
> +		dev_err(dev, "Can't find suitable clock divider\n");
>  		ret = -ERANGE;
>  		goto out_pm_disable;
>  	}
>  
>  	priv->wdev.info = &rwdt_ident;
>  	priv->wdev.ops = &rwdt_ops;
> -	priv->wdev.parent = &pdev->dev;
> +	priv->wdev.parent = dev;
>  	priv->wdev.min_timeout = 1;
>  	priv->wdev.max_timeout = DIV_BY_CLKS_PER_SEC(priv, 65536);
>  	priv->wdev.timeout = min(priv->wdev.max_timeout, RWDT_DEFAULT_TIMEOUT);
> @@ -235,7 +236,7 @@ static int rwdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_unregister(&priv->wdev);
>  
>  	/* This overrides the default timeout only if DT configuration was found */
> -	watchdog_init_timeout(&priv->wdev, 0, &pdev->dev);
> +	watchdog_init_timeout(&priv->wdev, 0, dev);
>  
>  	ret = watchdog_register_device(&priv->wdev);
>  	if (ret < 0)
> @@ -244,7 +245,7 @@ static int rwdt_probe(struct platform_device *pdev)
>  	return 0;
>  
>   out_pm_disable:
> -	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_disable(dev);
>  	return ret;
>  }
>  
