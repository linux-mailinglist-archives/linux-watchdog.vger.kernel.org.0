Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB46933CB7B
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Mar 2021 03:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbhCPCeB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 22:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234643AbhCPCdh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 22:33:37 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A417C06174A;
        Mon, 15 Mar 2021 19:33:37 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u198so31673753oia.4;
        Mon, 15 Mar 2021 19:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bHiXBx5FMHWhnwZaDu8l5lXWjPd4lX8DhqR1Tqz9rMQ=;
        b=oGUnuN6zA+/mlOtfBaZQWHhFm5r+7muFXsGjYHTaE1W+mOJHLyNj88nB90tba6qMgm
         2MXgFbu1FjrK0zrP7dNTjzgtPtF/6IZCsGRhVWtu4cUrT3tfGljHaxyL8smZ7CGq+N74
         GjjLOUoeBjIEo95ym7Jjm3Gi5e2jwAdIDxPwYRIy5RIYNsGUP4L2b1xUAtAQV38WQ2rZ
         8N7bvTIS3GwqkV6yQuHXWJ+rqb7aJXVBS3IZeyoX5MZRQPTxbS/VYakgp+e0Mbm/sJ+6
         g6x3N1t+TlHDEhBbUdE+aCQ2VnYt8hgC8T5PLRmeedQTnEetRI/hpvf10uSxXDiQwDYu
         c+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bHiXBx5FMHWhnwZaDu8l5lXWjPd4lX8DhqR1Tqz9rMQ=;
        b=de6lnWrZlgItD9TJcSAA5VYM9dXw/eMVTEvNk1Au57AOz/HrMr0k36s5y8iUOaBLYA
         lxT/TySEz12ROgNj5nkQXd/+G9gqkTEv15rTHFGhZSqDp5K6CB8Frka+oEEJ+ddEkVMs
         gBxf8xNKi2X9NcMsuuHoeqUDioXnHrqKl/L2JKRu8OQ1qe7c4mYE8ZaR+D7aggDYXTy4
         0ZCtsNcc8lillakc8Xu3TjPD0lg66LDPjfuBnZ9Tluszy3qzZOSkyWdZpFTtpwpZOgGg
         nNrtZNiPKnpReOGEUYYCJ9SCqlsPbJ6sjaWlkYKQIjGObUwBCwn1VyCxjGR5DMANEgOb
         2QRA==
X-Gm-Message-State: AOAM531JaHMGV857JHcVGAFP6yFO7T2nAfKh0MVFnKWk+mgxNE7TPJT5
        7Zt6yI3jxYGM/YDMpP/P47Dtz3OljTE=
X-Google-Smtp-Source: ABdhPJzVO3e2EWmEnPCPZT5mWZILyjfcBrBah7bh9wt4QgJiWKBOdYFDiVfLziC5OJX3fPcmJ9lVVQ==
X-Received: by 2002:aca:aa96:: with SMTP id t144mr1694030oie.131.1615862017032;
        Mon, 15 Mar 2021 19:33:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x18sm6882278otr.73.2021.03.15.19.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 19:33:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 8/9] watchdog: of_xilinx_wdt: Remove passing null pointer
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
 <1615805214-24857-9-git-send-email-srinivas.neeli@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <fdb88aa1-35a5-d971-23b1-457354f4c3f1@roeck-us.net>
Date:   Mon, 15 Mar 2021 19:33:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615805214-24857-9-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/15/21 3:46 AM, Srinivas Neeli wrote:
> clk is an optional property, if clock not defined,
> calling clk_prepare_enable() and devm_add_action_or_reset()
> are not useful.
> so calling these two apis only when clock is present.
> 
> Addresses-Coverity:"FORWARD_NULL"
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/of_xilinx_wdt.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 3656e716b4f7..ad35c93b7684 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -520,6 +520,16 @@ static int xwdt_probe(struct platform_device *pdev)
>  				 "The watchdog clock freq cannot be obtained\n");
>  	} else {
>  		pfreq = clk_get_rate(xdev->clk);
> +		rc = clk_prepare_enable(xdev->clk);
> +
> +		if (rc) {
> +			dev_err(dev, "unable to enable clock\n");
> +			return rc;
> +		}
> +		rc = devm_add_action_or_reset(dev, xwdt_clk_disable_unprepare,
> +					      xdev->clk);
> +		if (rc)
> +			return rc;
>  	}
>  
>  	if (wdttype == XWDT_WDT) {
> @@ -554,16 +564,6 @@ static int xwdt_probe(struct platform_device *pdev)
>  	spin_lock_init(&xdev->spinlock);
>  	watchdog_set_drvdata(xilinx_wdt_wdd, xdev);
>  
> -	rc = clk_prepare_enable(xdev->clk);
> -	if (rc) {
> -		dev_err(dev, "unable to enable clock\n");
> -		return rc;
> -	}
> -	rc = devm_add_action_or_reset(dev, xwdt_clk_disable_unprepare,
> -				      xdev->clk);
> -	if (rc)
> -		return rc;
> -
>  	if (wdttype == XWDT_WDT) {
>  		rc = xwdt_selftest(xdev);
>  		if (rc == XWT_TIMER_FAILED) {
> 

