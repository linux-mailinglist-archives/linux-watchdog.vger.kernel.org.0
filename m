Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F1990593
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Aug 2019 18:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfHPQPZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 16 Aug 2019 12:15:25 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40540 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfHPQPZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 16 Aug 2019 12:15:25 -0400
Received: by mail-pl1-f194.google.com with SMTP id a93so2640550pla.7;
        Fri, 16 Aug 2019 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hCoByiGuId6oRoUOKH9JltqEdAI/w+EDZR7ajwPu6Eg=;
        b=cEY+U4e9trgXyTjSEt9vrxrwlEj6etSwe8plNjb5q28w+Wxur+kCTmIF226UIgzk75
         dvPoTVJMRci3+YUoOFEBhnmPFKJWKXWQYi78uuYCC4gO3XWUoBq8L8m3OJF0iSy0z/0b
         fOrNu1ZIeDNAgu/++i71X8rIk6UWS7hrAmik3Fb1VfxRK6qRFS8/LBHOcLADPdHqmDBf
         nUSpPGyXinAFNpx+NMt59xxGH/sP9TBP+3a0nrez4KxiHw0nv8OGC3gcSBL63R41w7M0
         j4yynVIgTUUGsAl3YjT0hVhsXLDfXJ+9hX3K5lKIL7hCg4CvT94Ujts5O2T+YVPMdLqk
         ZyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hCoByiGuId6oRoUOKH9JltqEdAI/w+EDZR7ajwPu6Eg=;
        b=R3YVYA7QKc8e7IVugRxhHj3Kp2JrKdQBWdYjTUikYI3EkLmcOus2Q0AV49PPtPf9I7
         KBQSxX6AQno1dUyJWaDmTS6/21T/IEsvToYsJVxS3oMwXEi9nuUHAxEo5z50FhrgfK1s
         VoeFZwy+b7tU++QfqwsRDBTVUPbzsT8rgl7VwWVLPXoM34dFyzqKGE59s3wfWXn2sHqP
         0VEzKdK9aweAQRA9CuO2oJ7OFJCLonLOyhT/f48Bfsey5tAK8ROb2O3r7gB08xxq+qMO
         tJwkLGcn1FHBgXDVSg/LSNvSM88LtPUuErie2dopYrpgKgiukQHxJPcybe3yeyMnJweB
         cYwA==
X-Gm-Message-State: APjAAAW6kdvAu5hosXVZoGkQp+RYSpLn2iwxeF5wXrrhSdV3xcVFcFRw
        YWD9X/+l5vqVSkPkAl2kTIU=
X-Google-Smtp-Source: APXvYqw+LolKRAdIcj6iyMrq3orXbq1VOEpKjI2WhIQf3CZL5CeFaTHUCj2rnQbX09fALyYKmfk+xg==
X-Received: by 2002:a17:902:b110:: with SMTP id q16mr155147plr.273.1565972124591;
        Fri, 16 Aug 2019 09:15:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u69sm5262143pgu.77.2019.08.16.09.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Aug 2019 09:15:24 -0700 (PDT)
Date:   Fri, 16 Aug 2019 09:15:23 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 2/2] watchdog: aspeed: Add support for AST2600
Message-ID: <20190816161523.GB5396@roeck-us.net>
References: <20190816160347.23393-1-joel@jms.id.au>
 <20190816160347.23393-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816160347.23393-3-joel@jms.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Aug 17, 2019 at 01:33:47AM +0930, Joel Stanley wrote:
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> The ast2600 can be supported by the same code as the ast2500.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/watchdog/aspeed_wdt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..94f73796ba9d 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -31,9 +31,14 @@ static const struct aspeed_wdt_config ast2500_config = {
>  	.ext_pulse_width_mask = 0xfffff,
>  };
>  
> +static const struct aspeed_wdt_config ast2600_config = {
> +	.ext_pulse_width_mask = 0xfffff,
> +};
> +

Why not just reuse ast2500_config ?

Guenter

>  static const struct of_device_id aspeed_wdt_of_table[] = {
>  	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
>  	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
> +	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
> @@ -259,7 +264,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>  	}
>  
> -	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> +	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
> +		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
>  		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>  
>  		reg &= config->ext_pulse_width_mask;
> -- 
> 2.23.0.rc1
> 
