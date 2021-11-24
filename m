Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25CF245C7C1
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 15:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354409AbhKXOpK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 09:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354308AbhKXOpF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 09:45:05 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3934C08C5D1
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Nov 2021 06:10:52 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso4534800otf.0
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Nov 2021 06:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lJIm0bw74VxJSfIPoqgkJ4NYaOfkN1Su9+TbhoIwsF8=;
        b=QpTUVm19qBEuGLlnxBlJgiIxxJ55vgbjq4FWMXfGm/B3l5nIN1YX2OSLyIayGvcktV
         2r4PPmlfspEASNQYZH79LK5s+MEuKwKWPd06X3DOEZ1roMH3xHSCFYy9O7+WXSUDTGCK
         4TRsUgUU0UtJua357tZYDrY/o9LXLR2eHZMNyZzvlw0al3vBZwfl1lVgbhKXpP903din
         7cym/eSefuq/vzmQOx66nQ0PRogisVHp/cTU7w37Cj8Z5hByCQBMJDBqWAf/i37cZRLZ
         wfAJL1S28KnaRMEqk154hYe4VKBeECg5TpUHgC0pKgItB+RqU/+9qX3yAwix8SB98zSG
         T1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lJIm0bw74VxJSfIPoqgkJ4NYaOfkN1Su9+TbhoIwsF8=;
        b=IMD1AUH62ddoYs/5PumQM58l35hAzMb3PsXWv/n5mshaX1F6yQcW4ZxVHMwsdJey0O
         Eg1nVMkT1qkiPfZDp3XmiUz2nJDPEZz+sEKAaox95jPN0v/y0oazhiztuu6glaYUEnlZ
         NTDtdvkWcKB9LPVz63knrRkgaaE/9CkN90rw+s2DoWFCIDTzj/RYpytuF/ePVmveI3NS
         q99fYbIMxZSw7uDQkZAZU3GEMx7L5xAVO64qo0OS78w0vfcOZpexiPdUw2VMHnhqR4kP
         uvXDa03lcq4TZgtb9sQSrb5I7fvX6cEDydly5/84pwHzHUT9jDMiylpn/vxH9YAP1Pbg
         uI4g==
X-Gm-Message-State: AOAM533g9/AU/O1uWffQxyZkSbF1cuiL21KTQRN2PaNULs2s9bdwlKyg
        3g+BaGSy1hA8iZim76vyjyIVUhPCdRA=
X-Google-Smtp-Source: ABdhPJxzdVDQVDkAKYvQF32E2SyLTe4mEYNfyN/YqFpWwRn5iy0ULedgYEACxis2zRUsD+4z0t0vjg==
X-Received: by 2002:a05:6830:3155:: with SMTP id c21mr13262889ots.183.1637763052097;
        Wed, 24 Nov 2021 06:10:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 111sm2815378otu.55.2021.11.24.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 06:10:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 24 Nov 2021 06:10:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrej Picej <andrej.picej@norik.com>
Cc:     support.opensource@diasemi.com, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, y.bas@phytec.de
Subject: Re: [PATCH] watchdog: da9063: use atomic safe i2c transfer in reset
 handler
Message-ID: <20211124141050.GA3668370@roeck-us.net>
References: <20211124080654.2601135-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124080654.2601135-1-andrej.picej@norik.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 24, 2021 at 09:06:54AM +0100, Andrej Picej wrote:
> From: Yunus Bas <y.bas@phytec.de>
> 
> This patch is based on commit 057b52b4b3d5 ("watchdog: da9062: make restart
> handler atomic safe"), which uses the atomic transfer capability of the
> i2c framework.
> 
> Signed-off-by: Yunus Bas <y.bas@phytec.de>
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/da9063_wdt.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> index d79ce64e26a9..9adad1862bbd 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
> +#include <linux/i2c.h>
>  #include <linux/delay.h>
>  #include <linux/mfd/da9063/registers.h>
>  #include <linux/mfd/da9063/core.h>
> @@ -169,14 +170,19 @@ static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  			      void *data)
>  {
>  	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
> +	struct i2c_client *client = to_i2c_client(da9063->dev);
>  	int ret;
>  
> -	ret = regmap_write(da9063->regmap, DA9063_REG_CONTROL_F,
> -			   DA9063_SHUTDOWN);
> -	if (ret)
> +	/* Don't use regmap because it is not atomic safe */
> +	ret = i2c_smbus_write_byte_data(client, DA9063_REG_CONTROL_F,
> +					DA9063_SHUTDOWN);
> +	if (ret < 0)
>  		dev_alert(da9063->dev, "Failed to shutdown (err = %d)\n",
>  			  ret);
>  
> +	/* wait for reset to assert... */
> +	mdelay(500);
> +
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 
