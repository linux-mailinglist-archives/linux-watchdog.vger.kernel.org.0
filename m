Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FC33AA8D9
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jun 2021 04:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbhFQCEd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Jun 2021 22:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbhFQCEb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Jun 2021 22:04:31 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B10C061574;
        Wed, 16 Jun 2021 19:02:23 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l12so4727349oig.2;
        Wed, 16 Jun 2021 19:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cnqToFcjMI3Em0jBGFW7EOkssV0AHEWFs0bIeBQtX+Y=;
        b=nIDqVwmF/82NP+wdUidq2Y3LedQXg9tkNYuzA0lswx8GKAxKiL8UgrGTDXE78dXmOD
         V3AJkhcnYEWcRf+cVZ6On2aX8Saqcebqj02dLCIBi3r8uKqEEBbtyVIuI7Fxf3ZtNdtA
         cLWQYbDAf9IXmLlRYGBKcyaX/fxnyja0CqSlZ7eHmGqfuxGb/ICJQgBiA2iycbVb8h9e
         GE59O6ZLDukW2Wz0lyEHVdJqxAEywjFgnGtIiHOOdkvvvonuwayc++Q3H/Mx2OiMp2Cq
         EcEC4li0gnUYWVRzeQjkXAd+eSRL/YMxFN1JpEn2mHUcpfFYvDJc0LCtFLzLD122TH2Q
         CiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=cnqToFcjMI3Em0jBGFW7EOkssV0AHEWFs0bIeBQtX+Y=;
        b=pAKrAtIHXfzmk3zhZV4S2o94eyuyshk3YVPpgAg+gAKlGDj2+YsrZsdE03W8j1zEzE
         4QchdQqf83yRu1FJZuCuQxS9SjTMUg22j7/XnRn4mQhZwb7vnPOlCTcSl1NlQmV6VOti
         jwnaMoCsoTRmepo0lmUm+WNtEqMMCiOSlXbjU9gtb/TOh6zTsUqdEsC6EirjDmwKaJma
         Q2PYrDW0PsATYDLR7bEmipIgN/e5yp0UMPNz6MFo/bMJhYBrTxJk4b2M8oT81gItOfZT
         LOgi7x+EhlmZzUfW6ajbWW5NgqVBhMaD2tLE+LFi4BJqZRNbZGvnCe5AqC/eSEaWvpGT
         0XNA==
X-Gm-Message-State: AOAM532e+UHVHyjz5KymuGpRaKpgzA3yqjuFVDZfhWu0Q+cHeR+QkE8S
        Sa2QTgSqecLhfRikCQEc5lo7fkGl41c=
X-Google-Smtp-Source: ABdhPJzdf4aZRnTcU5iQe6hIURz+vS46Un4iiQSpzzx2b5P8HT8/1/+b2aBzSX+8+ZrwuBlEET3aHA==
X-Received: by 2002:a05:6808:1522:: with SMTP id u34mr1589473oiw.100.1623895343115;
        Wed, 16 Jun 2021 19:02:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 79sm960465otc.34.2021.06.16.19.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 19:02:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 16 Jun 2021 19:02:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: iTCO_wdt: use dev_err() instead of pr_err()
Message-ID: <20210617020221.GB3214397@roeck-us.net>
References: <20210616181708.19530-1-info@metux.net>
 <20210616181708.19530-2-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616181708.19530-2-info@metux.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 16, 2021 at 08:17:08PM +0200, Enrico Weigelt, metux IT consult wrote:
> Use dev_err() instead of pr_err(), so device name is also shown in the log.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/iTCO_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 6ba2b2f60737..35ff8d3fd9fc 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -479,13 +479,13 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  		if (!devm_request_region(dev, p->smi_res->start,
>  					 resource_size(p->smi_res),
>  					 pdev->name)) {
> -			pr_err("I/O address 0x%04llx already in use, device disabled\n",
> +			dev_err(dev, "I/O address 0x%04llx already in use, device disabled\n",
>  			       (u64)SMI_EN(p));
>  			return -EBUSY;
>  		}
>  	} else if (iTCO_vendorsupport ||
>  		   turn_SMI_watchdog_clear_off >= p->iTCO_version) {
> -		pr_err("SMI I/O resource is missing\n");
> +		dev_err(dev, "SMI I/O resource is missing\n");
>  		return -ENODEV;
>  	}
>  
> -- 
> 2.20.1
> 
