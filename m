Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B24F63D02
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 23:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfGIVAt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 17:00:49 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39184 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfGIVAt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 17:00:49 -0400
Received: by mail-pl1-f193.google.com with SMTP id b7so10731219pls.6;
        Tue, 09 Jul 2019 14:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x2Bcw/rTxWN3I7l61nbaS1B3WTwQIXQKmNTQbqrpoNY=;
        b=b2KzOFqm0b+b+c04ThHIK14DWQ4J8qC1nIjPW7WY+XDguWPwO1oxzS8aYcify1/9NV
         ahmZVNCsUOVXqeizTHObUQ6cJ3uxru7hJNjQhlQ9fjq4p9KcS8vRqMpWVp8V37aZrMNH
         ucOFVRNw3XxNKDH5QMyAYlt/SikNkK6NTdfN/mHtJM/l4NAp/3A41IP0z48XLgw7N0Zz
         am9YygGje81eMNOAG041Lechx/HJDBMahQfc5ErSbO9jq2R/ZeMv7wMuiwfGQf8M0/II
         sX0riM1eWGmM85Rf75qcz3dyKP+/YY4x0tm3TlIqcOriP8VOV4aEdlcQnY5eD1mlIEuk
         ATvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=x2Bcw/rTxWN3I7l61nbaS1B3WTwQIXQKmNTQbqrpoNY=;
        b=lyM71HsIz1AwBnUz0AK10plC9aPlujGjHDHqI05/i/OKMEc/6OQRKqQlCqYHQqvEAj
         dKI8u8s65WGwSzHnDwgy/mZNKGCpZCXA9Pmkx75wQsuZM3OoHKHog/sCCFBzdUakQ18/
         hdY6dTKeEq+CXhvbJ1qVLTkCGaP6jTUsw8aC4JHtGexGbiSckIIjMQmuwd8/xYUuZBk3
         NMMj31p68jeFhDQjuRkT4fUoLxKxMBfKn4jn5dABa0jcietSKUaNQeimAWnCVYAlz8nP
         ZUNJLYyFJUQOZqFgpZsT1vR1l7B79195aZzGORO6dCiF2YytD39IzRIQjBuYQSSlbrTo
         /M8Q==
X-Gm-Message-State: APjAAAUmtrLJdzKerUdyFkbHKI2AC4DGTOED4VCN2BY+zmOVyHf4bXrX
        B4LnEN6BJeZbozBp6FWO2jc=
X-Google-Smtp-Source: APXvYqxwG6k3YiXXLhXlJpHv5+27ARhcB/DDN6Y8ujlcr45JV9C9hZvEhpg5UsddMCtrNnQwLHciKw==
X-Received: by 2002:a17:902:8490:: with SMTP id c16mr35144897plo.1.1562706048792;
        Tue, 09 Jul 2019 14:00:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r9sm1408051pjq.3.2019.07.09.14.00.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 14:00:47 -0700 (PDT)
Date:   Tue, 9 Jul 2019 14:00:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        "kernelci . org bot" <bot@kernelci.org>
Subject: Re: [PATCH] watchdog: digicolor_wdt: Remove unused variable in
 dc_wdt_probe
Message-ID: <20190709210046.GA29377@roeck-us.net>
References: <20190709203409.117123-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709203409.117123-1-natechancellor@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 09, 2019 at 01:34:09PM -0700, Nathan Chancellor wrote:
> clang warns:
> 
> drivers/watchdog/digicolor_wdt.c:121:6: warning: unused variable 'ret'
> [-Wunused-variable]
>         int ret;
>             ^
> 1 warning generated.
> 
> It's unused now, remove it.
> 
> Fixes: cdad26977e3f ("watchdog: digicolor_wdt: drop warning after registering device")
> Link: https://github.com/ClangBuiltLinux/linux/issues/591
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/digicolor_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
> index 33cda95bd238..073d37867f47 100644
> --- a/drivers/watchdog/digicolor_wdt.c
> +++ b/drivers/watchdog/digicolor_wdt.c
> @@ -118,7 +118,6 @@ static int dc_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct dc_wdt *wdt;
> -	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(struct dc_wdt), GFP_KERNEL);
>  	if (!wdt)
> -- 
> 2.22.0
> 
