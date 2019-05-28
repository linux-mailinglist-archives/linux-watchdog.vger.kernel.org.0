Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A49F2CF70
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2019 21:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfE1T1F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 May 2019 15:27:05 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35247 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbfE1T1F (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 May 2019 15:27:05 -0400
Received: by mail-pg1-f193.google.com with SMTP id t1so11581106pgc.2;
        Tue, 28 May 2019 12:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xe88rAERhIcClUtIYYLdUcTXLi7UODZokIaGblwAr7s=;
        b=CoUGc1riuI5y7RU6MLiZ4kGMYmyME4qYlStwlZfualUUcgGd6Vmrm0jvToE9vzKTke
         ej8UwnRgUxxbsw2Vj3bbYkrIzfeP1PbgJmUvqIldgsPusgD5gQfOf+mVLU/4fqWueDcw
         RqhteZ6ZzWuLJw0mYLV4Cr2gAxKkhCy4OKx/ay9v9eb0Mh3FZuz12501mgQnInOTSQGo
         4tpr2/MK6B4d2cjwgZ5JlwO0iIwsVf2RasJHHVDndAvVPA+ftH9rBjCezfWg+i59J7Tn
         V5o/i3Ec6I2OvpegKRc1jDPwSncc9KMvv+nRvYci/5Lctl9FEQNB02M6C1hDZb4caYNR
         ePDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xe88rAERhIcClUtIYYLdUcTXLi7UODZokIaGblwAr7s=;
        b=LavCMdxinMh60CmaNMxjBM+x3RYnGyfglO6lVSzLlFSQN9Rfwe5Ykpm0u3E5jIM7+X
         5q5Nrypmt+oMJ0r+hUjrEsu0IqAu263HlF2CIK7r9LtRzdoEXMzuMgvO3qR/1hVxdSbv
         JGJwA9fRC6aG9ye9qxsX0btErpanuXRtuIxKT3Usj3bQHxCsin4VTlXHN5zKzKh+9p/E
         RBLa4QomzGV2SzO9GvfNqXUCv/EhqpjyjVjE9B5bXdQoWYquGM3uItA5u2FOgLupbE7M
         NO1RJZUnXHzMJOe26LMOp5/qRiAMCgpCEV/lWUadPQuj0ZYIlcqS4tdzbpwiTDEfa64O
         wMZg==
X-Gm-Message-State: APjAAAXO7lkrLtimxiz9xoUNimJNn/+qk7LovhZm/b3R2eV6VQ0WtAV+
        Mn92DCKPxCt043cRG2IeWdBC/0tT
X-Google-Smtp-Source: APXvYqx8tCWj7JEqV7YpDaDKH+lUnilfA4UH8oEOmJynC2Hy4jABa6MkhlAIj4La3KLQqQGw8XEL8g==
X-Received: by 2002:a62:386:: with SMTP id 128mr121183450pfd.10.1559071624383;
        Tue, 28 May 2019 12:27:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l1sm16345613pgi.91.2019.05.28.12.27.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 12:27:03 -0700 (PDT)
Date:   Tue, 28 May 2019 12:27:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] watchdog: jz4740: Avoid starting watchdog in
 set_timeout
Message-ID: <20190528192702.GB24853@roeck-us.net>
References: <20190521155313.19326-1-paul@crapouillou.net>
 <20190521155313.19326-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521155313.19326-2-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, May 21, 2019 at 05:53:11PM +0200, Paul Cercueil wrote:
> Previously the jz4740_wdt_set_timeout() function was starting the timer
> unconditionally, even if it was stopped when that function was entered.
> 
> Now, the timer will be restarted only if it was already running before
> this function is called.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Comment inline, but not worth a respin (and I don't have a good idea how to
improve it).

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/jz4740_wdt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index 51be321c775a..f970a7a53084 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -77,6 +77,7 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  	unsigned int rtc_clk_rate;
>  	unsigned int timeout_value;
>  	unsigned short clock_div = JZ_WDT_CLOCK_DIV_1;
> +	u8 tcer;
>  
>  	rtc_clk_rate = clk_get_rate(drvdata->rtc_clk);
>  
> @@ -92,6 +93,7 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  		clock_div += (1 << TCU_TCSR_PRESCALE_LSB);
>  	}
>  
> +	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
>  	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
>  	writew(clock_div, drvdata->base + TCU_REG_WDT_TCSR);
>  
> @@ -99,7 +101,7 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
>  	writew(clock_div | JZ_WDT_CLOCK_RTC, drvdata->base + TCU_REG_WDT_TCSR);
>  
> -	writeb(0x1, drvdata->base + TCU_REG_WDT_TCER);
> +	writeb(tcer & TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);

This unnecessarily writes 0 if the timer is not running.

>  
>  	wdt_dev->timeout = new_timeout;
>  	return 0;
> @@ -107,8 +109,11 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  
>  static int jz4740_wdt_start(struct watchdog_device *wdt_dev)
>  {
> +	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
> +
>  	jz4740_timer_enable_watchdog();
>  	jz4740_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> +	writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);

This unnecessarily enables the timer even if it is already enabled (that should not
happen, but does if the watchdog is already running at boot).

>  
>  	return 0;
>  }
> -- 
> 2.21.0.593.g511ec345e18
> 
