Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2213402914
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 14:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344183AbhIGMl1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 08:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234142AbhIGMl1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 08:41:27 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F95C061575
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Sep 2021 05:40:21 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id y47-20020a4a9832000000b00290fb9f6d3fso2860879ooi.3
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Sep 2021 05:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KFTyQucb6iJXQO4aR+mjT50P6aeccMuonrHw4lUM/4I=;
        b=T2rqDW4Lh5WvM9yQSEQbqPKnWCwbmzT80nXsl2sPGP8jpo47+sACrTJFfI5DCZqfiW
         yzr4Hlh+Iaq387vywQiiivYGPvP0rfXP8YoBIsAWxcW/qppHxvjyYBQO+FdM+++y4t1B
         uzU1QfW8HNVlJrgFw10h2aVacAZ67Q7EID2WNdUsEpWRGlr/oK8t9I+O6PejYLb4vkz1
         jvmscFrBAx5RmDTu+ooWr35hGPoaDVYuJGc/7G7Xi6nUUS6jGVqZHk8/2XcaPlAT9Xdd
         SvtFrK5lXhpc4DLmCxk2lBkuYn58wCK3uYqKXrdLaWID7AGucahlpOz0uHUy1SpFCVJ/
         ce1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KFTyQucb6iJXQO4aR+mjT50P6aeccMuonrHw4lUM/4I=;
        b=A0UYcPH7rZ3zOzLPTYoI3xuEN7X1aCiHGxItBmeI8OpaM7uDd/DEvqI+e1CoHduT4A
         vthAquySq0qZKa8p8DYuAkJjSmxXku2YrReHI2Mx4MLMPKdcz3CtWyw5PZWp5LaoZrQs
         qnXbt/IqwEN+qYk2jriMvvMZ58ZyA8JVqBHGYh63ToJp5gTXcysnWRkMzHUcoFnCwM6o
         R6C0kbq7BKXr4OF8SRQKyKraehZmultWlXzrNWP4qEodRuFBA/2IgvGl/q7fmSP7BEN9
         CUiCly2zCi0jOnyXPhBFLLCR+40y+pT42dInzmSqKQ/rkO6H/jNhqKHpJ6EUDM0MhlKF
         +2Hw==
X-Gm-Message-State: AOAM533zgqadQlbOAJ2pDtLL0Dc5fX2HpKSxVkDZKzVV+pIb1NO9UNPL
        kAVjm70cHmYjN1pPNm2gWf9nRRqDav8=
X-Google-Smtp-Source: ABdhPJwsnnZ6r4sV/Lq9shD63ETEE7v4fXHCN27JQHIpwqZCvzA1hK+WVyroyHLYdT5Lyy6phTp0+w==
X-Received: by 2002:a4a:dfac:: with SMTP id k12mr17452106ook.41.1631018420436;
        Tue, 07 Sep 2021 05:40:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c75sm2180870oob.47.2021.09.07.05.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:40:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Sep 2021 05:40:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: mlx-wdt: Use regmap_write_bits()
Message-ID: <20210907124018.GD4989@roeck-us.net>
References: <20210907092732.31815-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907092732.31815-1-p.zabel@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 07, 2021 at 11:27:32AM +0200, Philipp Zabel wrote:
> Use the regmap_write_bits() macro instead of regmap_update_bits_base().
> No functional change.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mlx_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
> index 54193369e85c..9c5b6616fc87 100644
> --- a/drivers/watchdog/mlx_wdt.c
> +++ b/drivers/watchdog/mlx_wdt.c
> @@ -100,9 +100,8 @@ static int mlxreg_wdt_ping(struct watchdog_device *wdd)
>  	struct mlxreg_wdt *wdt = watchdog_get_drvdata(wdd);
>  	struct mlxreg_core_data *reg_data = &wdt->pdata->data[wdt->ping_idx];
>  
> -	return regmap_update_bits_base(wdt->regmap, reg_data->reg,
> -				       ~reg_data->mask, BIT(reg_data->bit),
> -				       NULL, false, true);
> +	return regmap_write_bits(wdt->regmap, reg_data->reg, ~reg_data->mask,
> +				 BIT(reg_data->bit));
>  }
>  
>  static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
> -- 
> 2.30.2
> 
