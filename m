Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D2C259571
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 17:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgIAPvP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 11:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732148AbgIAPtz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 11:49:55 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69CCC061244;
        Tue,  1 Sep 2020 08:49:55 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id g6so812017pjl.0;
        Tue, 01 Sep 2020 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NGBSU+CgLpSPsdC80u7iauksX1Sac24OXoCHOndJlzQ=;
        b=GtgpeBdNqm5lRLgGo6xrb0yDPoWjyEONbkVcVJWHSAH2a/OJ5fYndn88ybZaSRojH3
         hmo8XjgwKA8PFT30NIGlkak6hIHKA8yBUcmgWKBjcZHbI3CmuR0ftsIcYFpacDXcBWy2
         DDZE7ffgv+z9N9gFYdhIPlNOILq1nVJdijon2jGFMxqQSg7C4iEOF/rwtXHSoKqeq2LG
         i7IXDGwLGDuK7ZoTqL0fuz3Wk08UJ59pzR+NjxYcep9f1imQTdERtJ52Sv6Lsy2ylPbz
         jdW+ZsfymZSYdJaj8ksrXcDTrpPZxBHXdGy+r21IYy15Hsbo+l41I91LyDCN/B3tZiRd
         cfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NGBSU+CgLpSPsdC80u7iauksX1Sac24OXoCHOndJlzQ=;
        b=npZ0P/pAsxISFI4w//9nB5RhD+AeYGVPxTgTpRg/QuMQ3bZAYXbPQDfVHa0HBEx59g
         1cRjje85yhS8YscTXrTlMMkWKvOe+8EaAStJr7iSdvUA6FQNjIL+yHhqUIBNwi3bg6ks
         cLp3IHzwS3SwIVD45F4Eybou8IeNkL81KSx8EflFXICgzTmcYknI8Iae8HT6sLG1YaW6
         3VAkHqYe4I04yUm3doJlh7qw2Vyz7hnSeYB+Ofspc97dXW1SR7cWY7smApq1gzRFziHV
         pUKNQZpuD2QUNQHnFOiZ2B47XLCZ6oB4tFpQm/hUi3uDKbxGYpTcy8M4o7nL4sIqpYLL
         72Bw==
X-Gm-Message-State: AOAM531DmSCPnyXqwVjYUpY/T0yIukZuKs/F+2m3iq/mfd5bqk/HJh2V
        Maoy7ftpETJXCYIUObYgQAK8k35ENC0=
X-Google-Smtp-Source: ABdhPJyVvVkxeG1bRyYB6J4ng9wXy9QZQTOfz4+UAKVr6JMVhJXHXri/dn+mDxtt84mBPMpWr/02RQ==
X-Received: by 2002:a17:902:7790:: with SMTP id o16mr1992754pll.299.1598975395197;
        Tue, 01 Sep 2020 08:49:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c3sm2458634pfo.120.2020.09.01.08.49.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 08:49:53 -0700 (PDT)
Date:   Tue, 1 Sep 2020 08:49:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: cadence: Simplify with dev_err_probe()
Message-ID: <20200901154952.GA106798@roeck-us.net>
References: <20200901153141.18960-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901153141.18960-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 01, 2020 at 05:31:39PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/cadence_wdt.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index 672b184da875..bc99e9164930 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -334,12 +334,9 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_drvdata(cdns_wdt_device, wdt);
>  
>  	wdt->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(wdt->clk)) {
> -		ret = PTR_ERR(wdt->clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "input clock not found\n");
> -		return ret;
> -	}
> +	if (IS_ERR(wdt->clk))
> +		return dev_err_probe(dev, PTR_ERR(wdt->clk),
> +				     "input clock not found\n");
>  
>  	ret = clk_prepare_enable(wdt->clk);
>  	if (ret) {
> -- 
> 2.17.1
> 
