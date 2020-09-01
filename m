Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5BC259FDE
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 22:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgIAUTH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 16:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIAUTD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 16:19:03 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412C4C061244;
        Tue,  1 Sep 2020 13:19:03 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x18so1109745pll.6;
        Tue, 01 Sep 2020 13:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tvCRLYAyQWKkqKGKttpKhLQlN/6T9uJa0Fn4mM13fKc=;
        b=mwB4bzPmjq4EVGqY9ItEn7BS4+clrQgkPOz4F/DjGYXSMefGH7ofam35yp1C5W+4mh
         MgFxokY0b5a+6aczHgjpgBx7/TVSSVey346dwzXuIw9fOMmXgliO2xmmzIbgGwNXnCZm
         DTeZFcMqLXBA8snhC3UIT/cG/kWrkLWzTcllyDpUihiWKvwzbboXdS/aHoBE9gDexgu6
         +dVqD9jiAB+AoZpyaR9EPCzU1LCkkf8cLFGJZIN5HSWl+cuhtqOpDh5DERez/uZAkjFh
         4TRjU3ZOmmsVeaWlel1b+uL6kyIoZl06hZPQfjy3UCaXIACAtDMo21DFUOySo+1WLmml
         ySRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=tvCRLYAyQWKkqKGKttpKhLQlN/6T9uJa0Fn4mM13fKc=;
        b=PIdsIwdeo0ZmUh5+8s4ZZ4TwyNwIigdt9Xhw5LIOZ57DwZY4ClBPwJWklZFSoLhVgw
         x3e86zbA6NCrg2694Cdf4qO/XAOeRmT+6fKQFqTGEmcKQSfzt0SUwSlQ9JeCIE7r7QnP
         90wvhGoxgWj46eEq6PGbZKwM9tCkh05ipSnX0FpXFqvomQGDt8k1SYI5Vcy6pvDSG/W3
         +gtmMpzPAeV32SdxO1RHOStQg4+CKUcCAW4epLQdlld7CGW/UE/VDgFX1UlK5bis2BK8
         Xs+RMNgumL1WHTj+lqvKvw+0MBOfpeo9VGU0tcFdjCWur4k0hPH9gaOLmFDK8if0sl58
         4U5A==
X-Gm-Message-State: AOAM530V9jF7BesVDd85EFqVRBG7+bM/IGSPtkKKqW1YWm83z4RN9qi8
        wQhyv2076xfCyXHFY8kP6PQlnMprvBk=
X-Google-Smtp-Source: ABdhPJxkzOay4MjNfJxRhMnT0btgNhNGsHcX1+Wrl+MN7g/EKitVLaQhyOaeFvNF2XBwS46+cJBnEA==
X-Received: by 2002:a17:90b:f0b:: with SMTP id br11mr249734pjb.191.1598991542814;
        Tue, 01 Sep 2020 13:19:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e142sm3085841pfh.108.2020.09.01.13.19.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 13:19:01 -0700 (PDT)
Date:   Tue, 1 Sep 2020 13:19:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: davinci: Simplify with dev_err_probe()
Message-ID: <20200901201901.GB143133@roeck-us.net>
References: <20200901153141.18960-1-krzk@kernel.org>
 <20200901153141.18960-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901153141.18960-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 01, 2020 at 05:31:40PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/davinci_wdt.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
> index 2b3f3cd382ef..e6eaba6bae5b 100644
> --- a/drivers/watchdog/davinci_wdt.c
> +++ b/drivers/watchdog/davinci_wdt.c
> @@ -206,12 +206,9 @@ static int davinci_wdt_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	davinci_wdt->clk = devm_clk_get(dev, NULL);
> -
> -	if (IS_ERR(davinci_wdt->clk)) {
> -		if (PTR_ERR(davinci_wdt->clk) != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get clock node\n");
> -		return PTR_ERR(davinci_wdt->clk);
> -	}
> +	if (IS_ERR(davinci_wdt->clk))
> +		return dev_err_probe(dev, PTR_ERR(davinci_wdt->clk),
> +				     "failed to get clock node\n");
>  
>  	ret = clk_prepare_enable(davinci_wdt->clk);
>  	if (ret) {
> -- 
> 2.17.1
> 
