Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCD833CB62
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Mar 2021 03:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhCPC2I (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 22:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbhCPC1s (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 22:27:48 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EAAC06174A;
        Mon, 15 Mar 2021 19:27:48 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w195so29993640oif.11;
        Mon, 15 Mar 2021 19:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w94VrLl/y66bMYiTb+0p4BQ4LAxii2p2ztQYr6K7gO8=;
        b=WxQQVSUM3aIzehInYjYtZkNb+HPHb6NjDWXKjNLtAluN69NK7VyjLN7o8iR+INavep
         C0covz9KVOjcB7/YR5Lz7XGb6OGXEQxnMev8NXsKxqU1DmEYtBdSnLcq3AJQBBoBgKMA
         7EZWHPCECFHnUpdOVAxT6E1I9XuK+gs2iEl7WX0ce6Pbp4KZSaM+zYs+KQic1TpJ7F0k
         Dsyk0AmrhTAPykQZ/DrP4X2oYL4nkVycTlWiDwFsituHQvu6by4SuLyW2S+Jg9czzMI8
         vXlvYnorulzA0IznGA9RTIDdBuN39vnegM4MdzyugXts0cy0FDdnCz4Y3GzsZvD6XKrP
         +gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=w94VrLl/y66bMYiTb+0p4BQ4LAxii2p2ztQYr6K7gO8=;
        b=ucKjNv1HGpbxYMk1d40UA+Xhyz35nTHIkmCy0FmirjE/pL+d4BoBu9ETVnqr9JyHYm
         TQhs1bYhViBaPGDnjsfjLAMHiI9K5mJmcBfzvgR4BRcT08BL3dCZA5r5pegUnvXkZKUC
         rcDJhT4nx2eRlP2OOXRfpGLyOoaJmxZnawJXh7oOl3YMjQMC8yN+KAH78I18jSiCPUKZ
         eCnne2UL3fDPManm/PM96nYLGu655W6Hd+XwtiW3QvL1+RV2E9jo+bxYtHsNZdIt+U52
         UjFCA/V8SFOvZEPWEP+pXPgEIZdAOLe39z5rXFaPu01zz6cNwnAnddICamlTsYWqMk1m
         9Fag==
X-Gm-Message-State: AOAM532j0hEI+HcKT28piNyiQ1ehlHqgVCdILm62K534/AqCA+Pw62sx
        UbSwwec6wmx5wj6hxii5JKU=
X-Google-Smtp-Source: ABdhPJyRZxya4YyThmWlsbDxq73UkQ8j8ERHxu15+gPYz/Cc2TzIf/MJTKXoGjfbN0w1luu0LDrO4Q==
X-Received: by 2002:aca:af10:: with SMTP id y16mr1642883oie.120.1615861667809;
        Mon, 15 Mar 2021 19:27:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 101sm7743922otj.44.2021.03.15.19.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 19:27:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/9] watchdog: of_xilinx_wdt: Used dev_dbg()
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, Srinivas Goud <srinivas.goud@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
 <1615805214-24857-4-git-send-email-srinivas.neeli@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8b4ba82c-d6a8-a0f8-cc3d-e8aece36910a@roeck-us.net>
Date:   Mon, 15 Mar 2021 19:27:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615805214-24857-4-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/15/21 3:46 AM, Srinivas Neeli wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> This patch removes pr_info in stop function and adds dev_dbg()
> in start/stop function to display device specific debug info.
> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/watchdog/of_xilinx_wdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 0d7df2370db7..9e67b598907e 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -50,6 +50,7 @@ static int xilinx_wdt_start(struct watchdog_device *wdd)
>  	int ret;
>  	u32 control_status_reg;
>  	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
>  
This is the same as wdd and thus pointless.

>  	ret = clk_enable(xdev->clk);
>  	if (ret) {
> @@ -70,6 +71,8 @@ static int xilinx_wdt_start(struct watchdog_device *wdd)
>  
>  	spin_unlock(&xdev->spinlock);
>  
> +	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Started!\n");
> +
>  	return 0;
>  }
>  
> @@ -77,6 +80,7 @@ static int xilinx_wdt_stop(struct watchdog_device *wdd)
>  {
>  	u32 control_status_reg;
>  	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
>  
Same as above: This is the same as wdd and thus pointless.

>  	spin_lock(&xdev->spinlock);
>  
> @@ -91,7 +95,7 @@ static int xilinx_wdt_stop(struct watchdog_device *wdd)
>  
>  	clk_disable(xdev->clk);
>  
> -	pr_info("Stopped!\n");
> +	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Stopped!\n");
>  
>  	return 0;
>  }
> 

