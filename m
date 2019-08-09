Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A39B6881D6
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 19:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437146AbfHIR7G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 13:59:06 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33510 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437142AbfHIR7G (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 13:59:06 -0400
Received: by mail-pg1-f194.google.com with SMTP id n190so5407742pgn.0;
        Fri, 09 Aug 2019 10:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6ZOYLgLxe0FIulrXADqga51uZnO5ECMetjmyqpebTTI=;
        b=lTfmM9hn6ApmQ6evDadzAILwyYnWKKvJAtpiOzE3V6AQd84gYG9rq1P1RkDBWPtONv
         KRjjxXgcEmSvEx6kc5XVWrWosSY2d5sY/mjc2pjHe2eMdkLKqykvNFQ8icScVJT33Zqf
         mal1E/eWvj2/N31KFBIqiD0/cL4P/tJiQDVx2nS9c/SmRm4Z1O3VvIXl1SmDYln27s8O
         Crnoua/N61iyyuOOlyIDrZOP+0xboukUYW2MDWVHJhBpw2b/Gg6VbGrWA3E6yRPECL52
         ugoVLHyhHy6eC8keN+kLASUWlw5PyWLqhmN/SgcHu1f6jLI57WdEup95nCXqv18bpsQG
         kYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6ZOYLgLxe0FIulrXADqga51uZnO5ECMetjmyqpebTTI=;
        b=EAeAIQNtOdsnBtSjM4FX+Jdt51wwfn9sV8cEJmtWA0zN5/k1vKqyGkrm+Pn/aSq4O+
         6xIDSZ7D2Khdij8Qt9ER6mT2polZrtqYOrvwUMKgCMIOd990XPOy70Q8PUd6UhGWFVCn
         qid6VA6a3VCPPKiJyTRsk4+zPC+UCcYYaa4woOGTmQa0iSRcbvVUiKF3N6s9VsA1LrfF
         vd/PMHi0vEZLuxi57pFnFZpAUpIE4PZ0HxgrwwJ6Y/WgUKHeIszgzsEP7ym9pFaYC4w6
         I+q+0Ae7kiCSIRxl3zgDGwmOeAtPiCOAdKxJW7/emShH1yuc3BvB8amnqD4GaFHIeRF6
         /vdA==
X-Gm-Message-State: APjAAAV0ft7yqLHDAMXmzomKORGxGYEkxPjFWfk8HDpLkWtyC2g7aeOu
        IgSAnXgeZZoZgtN1tyd7JOg=
X-Google-Smtp-Source: APXvYqyQkRJPuNteeUcXivF74JkR23UVMDQKryWSYrQzo2KzZsXhj8J4rRS03F55upKD3TZvLuWohQ==
X-Received: by 2002:a65:6709:: with SMTP id u9mr18547000pgf.58.1565373545780;
        Fri, 09 Aug 2019 10:59:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v184sm96800912pfb.82.2019.08.09.10.59.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 10:59:05 -0700 (PDT)
Date:   Fri, 9 Aug 2019 10:59:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog: jz4740: Drop dependency on MACH_JZ47xx
Message-ID: <20190809175904.GC23562@roeck-us.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
 <20190809115930.6050-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809115930.6050-4-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 01:59:30PM +0200, Paul Cercueil wrote:
> Depending on MACH_JZ47xx prevent us from creating a generic kernel that
> works on more than one MIPS board. Instead, we just depend on MIPS being
> set.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Guenter Roeck <linux@roeck-us.net>

[ with the assumption that the series will be applied through the mips tree. ]

> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 78411609048b..90e689cbeed3 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1644,7 +1644,7 @@ config INDYDOG
>  
>  config JZ4740_WDT
>  	tristate "Ingenic jz4740 SoC hardware watchdog"
> -	depends on MACH_JZ4740 || MACH_JZ4780
> +	depends on MIPS
>  	depends on COMMON_CLK
>  	select WATCHDOG_CORE
>  	select MFD_SYSCON
