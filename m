Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A229259554
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 17:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbgIAPuH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 11:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732167AbgIAPuG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 11:50:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F50EC061244;
        Tue,  1 Sep 2020 08:50:06 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id m5so885692pgj.9;
        Tue, 01 Sep 2020 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tvCRLYAyQWKkqKGKttpKhLQlN/6T9uJa0Fn4mM13fKc=;
        b=sqYq5WtIm/TLWTlkZEO/dSBzKmYZH++45u7iU5u4C2tbERPBHIhxiaP7OkTywsLpNe
         /zpuQlsrd4FJEVD95xDPTbRJlmnpOI18tvokDp7JgJyTCGli9EGg1wU/7LcGWW4RuB3L
         i3JipCEnQo+JjYoJmR/9QPthSRVoYiyGSXQO2o4JxfzRlZ0RHAB+2FKyl6ZfuZI5On0L
         lvqMNTf8NgV/dZHPZS7ZRc+K1+mfq7uNvo5uP4tRE3qTsmnLzfekHEXkOwTlikZyRxyR
         Pypq3yijEotlP36SB2yncox6G9JfwDSd5+0nALPx9jLRcx76lKPrpbP/ZYAbcuNgerK6
         FXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=tvCRLYAyQWKkqKGKttpKhLQlN/6T9uJa0Fn4mM13fKc=;
        b=Sv/SK3oh0tItKElH1OWmnmSs//AITtkBnNKNj7PNhP6jZEZ5a/Ka4COjadcRzw27kA
         k0+U5uEpK0rWWMIere0XOREiYtxtAB1f/YvjAcgBpVublOUibeoORlabv6rzOVkMkItX
         7+NMGmCLYps9Vg4ZEigvVEpzYSksQnPxBJnDmRm2IvUUF5NAPST7MIH39WJKHgFZ/Bl2
         NDQFUuNQae5/5OjxPCD295jCCHCnX3isnLfNyMbwlpXDjsVAM140AZ/h6UNhJmqc1jPx
         ULJEsFkg0cStpTi4dRunEayg+ULA9jaOSACzkcqjK0zeEELS3YHs/9kwT7ciSMYc+DQb
         ML/g==
X-Gm-Message-State: AOAM530tODMI5N+BeVoOaIEstnp/rPrRXdzFHMTlhcFAUC5RuqQDl/9X
        AWK4lLgdUizGTRaVOAbdg/FVdyBUQJQ=
X-Google-Smtp-Source: ABdhPJxwuWDznI85eI7yiwwdGg0TFwDFrVOkrOhk+JBqxxr1Obtsvh/cGYxkl9jid0GdM7yqRvWo/Q==
X-Received: by 2002:a63:4e10:: with SMTP id c16mr2033803pgb.54.1598975405984;
        Tue, 01 Sep 2020 08:50:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q71sm2059375pjq.7.2020.09.01.08.50.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 08:50:05 -0700 (PDT)
Date:   Tue, 1 Sep 2020 08:50:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: davinci: Simplify with dev_err_probe()
Message-ID: <20200901155004.GB106798@roeck-us.net>
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
