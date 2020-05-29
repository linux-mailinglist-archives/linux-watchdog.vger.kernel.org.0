Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03211E840F
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 May 2020 18:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgE2Qv5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 May 2020 12:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgE2Qv5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 May 2020 12:51:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0017DC03E969;
        Fri, 29 May 2020 09:51:56 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t16so1354492plo.7;
        Fri, 29 May 2020 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kfSoM50bsi50W+Hljgu8pBJiQuXE7V/1HKaCvRiBJRc=;
        b=OSgXKIrodlm5+jt03ufkUGcZy6oGxzcIqdCXbcHnu9KOMIQJB5IInxFXL4jRyZ7Jmu
         5Xc7IYEY7ot3T90+Dy6csIjLMqoGgBV6BqR4KYl27oApPlTmwPK7wzRd57LgcPjgNmMZ
         L+/3hN5jXD+eWTnrNCLmZMXr3IZlDec4zmx+SMK0M0Hpqx6BXebzukC91R0lhPghVhxa
         tX5iso1K6Q06yDhh/a4NC6WissDfCAcJJzanvC0HDEEH0/jHUzIU0mToybdmbd/5ifPU
         16f9thHZaFgasX6DgZPJpKKc0nAUm8ICTmciq6fDJ18YldDgRrxz7aO6/k+QJJ5SiuaR
         CZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=kfSoM50bsi50W+Hljgu8pBJiQuXE7V/1HKaCvRiBJRc=;
        b=i8puDwjO/dUd7NPakDhC/w2fOOq7DvO2NtHIT1RHCVyOf13arnkE/gx3lT0YNkl9Mf
         OT+eGc7iBGNqmLNsiVIQ2RnR/c8HmHCks5KHGTvNfA3K/cuJKppOXcC0+3c2bIFsRHqv
         +ZEtpHlkQ52KaOedepthA5PD00HiibMCRHLK5ees9F91EVtH74+gPwiVgQyHn8tY0vgi
         G6Xw7RHdFkiu+ju31QWywio2atHUXli2HW4nUB2wyinIH7T1FJ6oAxb7IAPawCQ0X1zh
         ytbS5pxfCF3mspf0na3td5WMaxCvaZOAX65AR2S+db/jl1FdA8ldNJmS6icgLX5tdHL0
         hmVw==
X-Gm-Message-State: AOAM531PsoAFO+Q2MusWGsCkkPhyP9jAjmt7scQC5bUSYeiOjeteTfu4
        h7zecwTHIfnUxwbFgecN8M4=
X-Google-Smtp-Source: ABdhPJxXElgnK8hmEudbTIucGJZtMnTDmD5Yl74J745kEl/J8MFngTs56nYPxqt37wZQkwshOsXs7g==
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr9034813pll.231.1590771116542;
        Fri, 29 May 2020 09:51:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id nl5sm13448pjb.36.2020.05.29.09.51.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 09:51:55 -0700 (PDT)
Date:   Fri, 29 May 2020 09:51:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     wim@linux-watchdog.org, mripard@kernel.org, wens@csie.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        wuyan@allwinnertech.com, tiny.windzz@gmail.com
Subject: Re: [PATCH] watchdog: sunxi_wdt: fix improper error exit code
Message-ID: <20200529165153.GA162777@roeck-us.net>
References: <20200529094514.26374-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529094514.26374-1-frank@allwinnertech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 29, 2020 at 05:45:14PM +0800, Frank Lee wrote:
> From: Martin Wu <wuyan@allwinnertech.com>
> 
> sunxi_wdt_probe() should return -ENOMEM when devm_kzalloc() fails.
> 
> Signed-off-by: Martin Wu <wuyan@allwinnertech.com>
> Signed-off-by: Frank Lee <frank@allwinnertech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sunxi_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index 5f05a45ac187..b50757882a98 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -235,7 +235,7 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
>  
>  	sunxi_wdt = devm_kzalloc(dev, sizeof(*sunxi_wdt), GFP_KERNEL);
>  	if (!sunxi_wdt)
> -		return -EINVAL;
> +		return -ENOMEM;
>  
>  	sunxi_wdt->wdt_regs = of_device_get_match_data(dev);
>  	if (!sunxi_wdt->wdt_regs)
> -- 
> 2.24.0
> 
