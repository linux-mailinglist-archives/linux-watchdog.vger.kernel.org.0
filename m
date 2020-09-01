Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC485259FE4
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 22:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgIAUTS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 16:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728960AbgIAUTM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 16:19:12 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1122CC061244;
        Tue,  1 Sep 2020 13:19:12 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id np15so1100468pjb.0;
        Tue, 01 Sep 2020 13:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HeGBPCmtRrSwxguF1t/lDmn0Piwm4iwKIT8Cjmy4NkE=;
        b=kBW3U1THs1fa90r0brxh02oRvIPfub/IrYHeuuQ1hKS8XXpInjLpSIxHg7LYYgK9Fy
         FITi96bmv7XokvD8mroyIaRLyzMuwk4DTTw1XyE4a42y5szllTxlwtpsehS73DP/j1rn
         ZG+MAOwIdg2vdXj09in+HagEwNKR+JYfqQhrhleqXgQg/H2Km4x/eaMiaDyMNusAKbGZ
         V7rIkrVX8FvlcW2jO6qZzzKF6V0EyiASNLF9Hy7kK6mmoZKN30PKQzhpVHHNI5vJ1Iuz
         wSEp3xaCHj1Iw3P4gRTPTCryKTjm/A/uUtnrN+vQjuOOlzy8y7z5LOYAwciBr325ex6T
         uY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HeGBPCmtRrSwxguF1t/lDmn0Piwm4iwKIT8Cjmy4NkE=;
        b=pIcP5H4mlkRxd47okxcxkiRJLi0J7s4xqRTB5i6XFLpJ+zHO+divYO2aFkJ/3K0jl0
         txtKgPxOZgoik1L8i7ApU3rp7N5kG4NEXqZs40rGvSvWJGTPJNPC/i+t+IbJ/s9esbKK
         +0hbcBb0BO6ALBNvOU5ITOm10BlVOcBGJ+PIzE0WyIYzweScey5kMPzD8SFclWBECLVi
         WXVOY18R96t+8+2qFiJC0+FwKGQCU+9gvpkuA59xLrnHMK/2L+uSVaTvVxos9Cp353Fw
         tE+RVlA8Eg7ZpG0WmItS6PJ7+jDjqV38NV7Sm3OHqEAh5KX2Oe0BeSToJRhP1Pjzvem5
         cxTQ==
X-Gm-Message-State: AOAM5318gxgADWUIXg/tCNxQK8oCnVv66o9qc/qojDvzyDTVS87nB0LK
        T377te0hPZOqkmrpl9qkKYo=
X-Google-Smtp-Source: ABdhPJzWLNUjkq7zn9ue1dBJupaB/kBwXaRx2ZOMEBn6fRLLqBBgZ6QdA33yIAEy/766lMSR621nuw==
X-Received: by 2002:a17:90b:4b89:: with SMTP id lr9mr3355895pjb.190.1598991551495;
        Tue, 01 Sep 2020 13:19:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s24sm2309078pjp.1.2020.09.01.13.19.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 13:19:11 -0700 (PDT)
Date:   Tue, 1 Sep 2020 13:19:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog: rti: Simplify with dev_err_probe()
Message-ID: <20200901201910.GC143133@roeck-us.net>
References: <20200901153141.18960-1-krzk@kernel.org>
 <20200901153141.18960-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901153141.18960-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 01, 2020 at 05:31:41PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> 
> It is unusual to expect deferred probe from pm_runtime_get()...
> ---
>  drivers/watchdog/rti_wdt.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 705e8f7523e8..836319cbaca9 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -205,11 +205,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	clk = clk_get(dev, NULL);
> -	if (IS_ERR(clk)) {
> -		if (PTR_ERR(clk) != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get clock\n");
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
>  
>  	wdt->freq = clk_get_rate(clk);
>  
> @@ -230,11 +227,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "runtime pm failed\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "runtime pm failed\n");
>  
>  	platform_set_drvdata(pdev, wdt);
>  
> -- 
> 2.17.1
> 
