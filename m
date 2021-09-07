Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74AA240290F
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 14:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343631AbhIGMkp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 08:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344291AbhIGMko (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 08:40:44 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93DCC0613C1;
        Tue,  7 Sep 2021 05:39:38 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i3-20020a056830210300b0051af5666070so12557797otc.4;
        Tue, 07 Sep 2021 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xPEKixN/nvgUidDDeSkCTpE4c46H36ozG7ws744JHzM=;
        b=b/eATPRlDeXqS1h6jxlf7nwhN6Zw/ClMb/qxpqOHQuNks3oHa9SeXgjBmJ+xdORniD
         etxlA2XKHLBs5ldwND8q8xuI8bDeCYBW2txU733gw8466aMmPldVB7RchjNCZhXBzfuM
         +N4FFACpFTN5z1lvGrukrad6iXR2RtH/LFI7Rg70NqoYgZG3RyBp0TmrcS4uqlv9KdrU
         Q9G1svSuUyNeYBHyXOCuW9o7jnjIgONIvXE1lfSnhZDX+NuR8IBwVhpknnaoyEj2iBNx
         nJn6GMIAhAOm81fyF2d72ggKvLx12hUKdhRkl8ldwjz0GO0mWqR9tmyF6KWkrRZTR8gP
         G27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=xPEKixN/nvgUidDDeSkCTpE4c46H36ozG7ws744JHzM=;
        b=eeu81Yb5UrHgOqHEhl+dFyI9Z9GL4EpqlvMEceAAVTyUZwWxqZV06dW/ecjQNzrLV1
         RS9v/BOZa1XTmQHEcZb1uVGUFDjTWCm4J45oMBFbd9I7foRoX2l0z2yF9p0lRNtDPvoM
         URA95sHi5cMjBCsanRj4jW4P/y8IkrOk42PBD9FnFAE08d153MeGeOw6IppF0fAKx4Jr
         LIyqPOgxPlcHVRnpZrdGzieHioi4zUepzupglLkXFo2v15X9idzx8ZVhhqIQHxFP0Baw
         ozzC0/FyVhAf9bQR+Fk5Je8MfxYxMaJhn7C/x9/JGAba0CZ0ePK09AhXE43KbVfGPGIY
         zANw==
X-Gm-Message-State: AOAM532OzYfd8x+DYzjOcrb3lp0VgT8ldk4Eszy4oVQUmR0cNl/S4Cg5
        7aNAOP8gzFncFfdhGSN963k=
X-Google-Smtp-Source: ABdhPJzn6qiOjjzhEsb6RuO1Q7Z9f7P4argXskPxug7CJiUt8kEz5ywMb9oF8h1QZPDmmajM4vsoIQ==
X-Received: by 2002:a05:6830:3145:: with SMTP id c5mr15319647ots.211.1631018378282;
        Tue, 07 Sep 2021 05:39:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o24sm2058506oie.17.2021.09.07.05.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:39:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Sep 2021 05:39:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: iTCO_wdt: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210907123936.GB4989@roeck-us.net>
References: <20210907074230.2757-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907074230.2757-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 07, 2021 at 03:42:29PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/iTCO_wdt.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 643c6c2d0b72..ebf7e5bc1199 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -96,7 +96,6 @@ struct iTCO_wdt_private {
>  	 * NO_REBOOT flag is Memory-Mapped GCS register bit 5 (TCO version 2),
>  	 * or memory-mapped PMC register bit 4 (TCO version 3).
>  	 */
> -	struct resource *gcs_pmc_res;
>  	unsigned long __iomem *gcs_pmc;
>  	/* the lock for io operations */
>  	spinlock_t io_lock;
> @@ -503,10 +502,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	 */
>  	if (p->iTCO_version >= 2 && p->iTCO_version < 6 &&
>  	    !pdata->no_reboot_use_pmc) {
> -		p->gcs_pmc_res = platform_get_resource(pdev,
> -						       IORESOURCE_MEM,
> -						       ICH_RES_MEM_GCS_PMC);
> -		p->gcs_pmc = devm_ioremap_resource(dev, p->gcs_pmc_res);
> +		p->gcs_pmc = devm_platform_ioremap_resource(pdev, ICH_RES_MEM_GCS_PMC);
>  		if (IS_ERR(p->gcs_pmc))
>  			return PTR_ERR(p->gcs_pmc);
>  	}
> -- 
> 2.25.1
> 
