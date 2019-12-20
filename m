Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 532C3128274
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Dec 2019 19:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfLTSwr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Dec 2019 13:52:47 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45522 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbfLTSwr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Dec 2019 13:52:47 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so5355847pgk.12;
        Fri, 20 Dec 2019 10:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=viSDKHeCFOSvx9dSLRqIUBIoY3RXWubdy5kL+SpzoFg=;
        b=Wi41QjtYcdhEKQ/mMOm3062dR8QpHuAqf+3mpXRmCf2vnUX/8jb7PaJvOz0rZyDNiu
         B8GM7GTnFaAijSsVb1homQ1nDaXi29ULAzHa9ENhiljYgXhJh1BhMgPrGPOz7DuaxFOM
         nAn/hl0wT2EvBtEh1JbcR8/6/WCFarReFkmq8ixoTOrqw8EKbhPakgBu60U7U/bYGSW5
         U9We0WMuDUtGzM1iQibBADkbhQiutSe4Pi1Q7/3Vv2/e72/hZKBEZrII3wnjW8miWUSV
         0X4S/2TCtkDcPddJEYkSMGY5HEJM4hJrRnhrPL0XCIc1QCiTrILFZbeNKHr76wxflvG0
         Gs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=viSDKHeCFOSvx9dSLRqIUBIoY3RXWubdy5kL+SpzoFg=;
        b=ZGXcAC1ZqSSc+eSBa7Cl6mROoG/W2rEcJm0soAgsIyDKxqFY2vZbfgQWOTwLLgpbCx
         Cfyij8qwPFWMCMeKX33SvKMHs3qDQpIcbBQWzBmD45AtY/xMfxeC0imdFKBIvJIcaJZK
         wOJ/q3yX2t8q8p0M4JL+MOcRD5BNJYuIVU85Ujl9fvcjvTdBV4nDP9AAYRHklp1LelRp
         88PFSvEyPwHjIh1kYt89bRKx0Bm79APJYmod+I0CEziwn+9ZYju2lTHLyKrykH2XDKYt
         wJ3cQI9KdnLcsKvrsIx4YzyoGRLLAjf4f5xkWCaYj/tszHaVwrm1ASK9qs8hrtyV86Hy
         h6iA==
X-Gm-Message-State: APjAAAX85XSUtsgBhWfZLUeTjbiEpyF1xt0hMqLzKki759faGqubnTEd
        cwaDwl4UexhNzxBvxuJgQJU=
X-Google-Smtp-Source: APXvYqw3+FkouZXlvsj+BIhI08Ng8f6cpe/jOcktRzeTK9Fth/TX0QGc4OD8Q3UWX0r/L796ujadMQ==
X-Received: by 2002:a62:d407:: with SMTP id a7mr15445832pfh.242.1576867966770;
        Fri, 20 Dec 2019 10:52:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g7sm14388582pfq.33.2019.12.20.10.52.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 10:52:46 -0800 (PST)
Date:   Fri, 20 Dec 2019 10:52:40 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     shubhraj@xilinx.com, sgoud@xilinx.com, michal.simek@xilinx.com,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: Re: [PATCH] watchdog: cadence: Skip printing pointer value
Message-ID: <20191220185240.GF26293@roeck-us.net>
References: <1576825096-26605-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576825096-26605-1-git-send-email-srinivas.neeli@xilinx.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Dec 20, 2019 at 12:28:16PM +0530, Srinivas Neeli wrote:
> "%p" is not printing the pointer value.
> In driver, printing pointer value is not useful so avoiding print.
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/cadence_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index 06bd4e1a5923..672b184da875 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -369,9 +369,8 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  		return ret;
>  	platform_set_drvdata(pdev, wdt);
>  
> -	dev_info(dev, "Xilinx Watchdog Timer at %p with timeout %ds%s\n",
> -		 wdt->regs, cdns_wdt_device->timeout,
> -		 nowayout ? ", nowayout" : "");
> +	dev_info(dev, "Xilinx Watchdog Timer with timeout %ds%s\n",
> +		 cdns_wdt_device->timeout, nowayout ? ", nowayout" : "");
>  
>  	return 0;
>  }
> -- 
> 2.7.4
> 
