Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7202C39333
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 19:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730338AbfFGR3w (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 13:29:52 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40626 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbfFGR3w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 13:29:52 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so1080098pla.7;
        Fri, 07 Jun 2019 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e/I0EA9bRZBZp0sLteEkqD4J5yGXS38cP8BPrE0GoWE=;
        b=GpxDO1vrwlcOpY6Za2KUWxwRYJ/3Vbk/f9XacCoEw1qEyNIrUOa06P/rQzUFjHa1ZU
         xF4H4t+TgAbAWtNQTBgq72kNr65rP8gGF7p57jddF63N/xj+LiIpObwnOh1UoYFz69Wk
         j3wgZkRsx4jii1Me1XJiZsWkizOqlQ7jEXK2iyK64Ii2OVlLdBw4Nma0Hl8KHFFOW5dR
         fX3z6qQYKUOE3M2aZlmg527SSVYl3vyXbnnyBx6b1lZvxzC+Vr/BWqTsgc2lKoOqZsMY
         m57ebXIHXQGptVchb9XglmxbZ6NFXUnmT7BBCToT64QlvHvnaBD7kUV9a6g+9H71GxhG
         e5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=e/I0EA9bRZBZp0sLteEkqD4J5yGXS38cP8BPrE0GoWE=;
        b=tWgGa3lfCm3X1pWAK9Jc7RftM1m/QM2CyHsjW+wYFnBSZJzmK9TyfgijLWi6+iqSVj
         Nd8CW+UpvIKbeeoywHPcaIHqmOopk1u+/iCR8kL220v/owXFl9j+Iksx7TbPWIgoFj9M
         sjmwlqjo/l9lVPoAUqRQYXpC9oBtpxbOJMXTc7PTsoM27KWUErzPIv7S3XTXhCe9jtyq
         0UrECHz7YEeMHuMXpE1YXVEqftGaG6E2/cPEgY3i0BYeAAAulk+PfAvzzJBJCAb5pc3T
         JMTipvrTxmIZnpdpoisLQ93VMjMxj9PTMAaI4EsJ9rKKpGyG8dc784NnS9mCScHqgzsl
         +4Zw==
X-Gm-Message-State: APjAAAXX/NA4Xg/EHrmCJffoJwvRTivUH6/ZFJFIE1nC1Zoe3uPVSGGK
        3xo9pLrRs20H688uv8EHZrs=
X-Google-Smtp-Source: APXvYqz8LAYDnRs8RwH4zYwrv2mXyqRqnu7lUzt89OxpVF1bisXncK+7pGaQ6s5lnmrNtpZ/4d9G/Q==
X-Received: by 2002:a17:902:2a26:: with SMTP id i35mr18666993plb.315.1559928591167;
        Fri, 07 Jun 2019 10:29:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j4sm681810pfi.136.2019.06.07.10.29.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:29:50 -0700 (PDT)
Date:   Fri, 7 Jun 2019 10:29:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] watchdog: jz4740: Make probe function
 __init_or_module
Message-ID: <20190607172949.GA14550@roeck-us.net>
References: <20190607162429.17915-1-paul@crapouillou.net>
 <20190607162429.17915-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607162429.17915-5-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 07, 2019 at 06:24:29PM +0200, Paul Cercueil wrote:
> This allows the probe function to be dropped after the kernel finished
> its initialization, in the case where the driver was not compiled as a
> module.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Notes:
>     v2: New patch
> 
>  drivers/watchdog/jz4740_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index 7519d80c5d05..2061788c1939 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -157,7 +157,7 @@ static const struct of_device_id jz4740_wdt_of_matches[] = {
>  MODULE_DEVICE_TABLE(of, jz4740_wdt_of_matches);
>  #endif
>  
> -static int jz4740_wdt_probe(struct platform_device *pdev)
> +static int __init_or_module jz4740_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct jz4740_wdt_drvdata *drvdata;
