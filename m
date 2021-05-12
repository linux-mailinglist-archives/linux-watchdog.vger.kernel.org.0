Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BC737BF27
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 16:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbhELODP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbhELODO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:03:14 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB4DC061574;
        Wed, 12 May 2021 07:02:05 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso20643036otm.4;
        Wed, 12 May 2021 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tSeGrKvLW0g4D71rZFGa+vGBWbA0xGEgOY1FpZBEwfU=;
        b=HnmmtyJ4krJtg2wO/BVQJ3Z+h0c4Zw90ZoEUXoq6udrev4cOErTykT2KoeSFOYQD1+
         J6eI/1IbMNAYDNhw5Hc60f27JP8HrSPiuVdQsh++939KFg3ke/yYnDZG3Lga5kUJk+zY
         C+3k8kL2tCCUfpYboTLQ7SRw3KvfQOmvj6Wd+sul4dW2XrsVg7K/JJjkrLUmIFRIyZpF
         dYlOWA2nxxyiCgv+CnEfxunDwbB1YvaiTEhpr5uwNa++/216PhLQMEL65i5hBtbC93oX
         gcGtGPXT+H2kkJtZXPDrSlsaBonlkH3Nt8I5W/I0UWziIPvbiv+hGI0kLfhKXTvXs/pS
         mtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=tSeGrKvLW0g4D71rZFGa+vGBWbA0xGEgOY1FpZBEwfU=;
        b=ZPM5BJI9tpUcosls2E9h7Qee+CQE3DAIquufV4EAX40GBfOL/kuUZ0pWYEfSlZcWk7
         tfnX21wD/McKBUIbNdu3ETYhuC/9IYsZ+hkpi4+x//sKVZ2rmL1/dmdbuF8gDdD4uzRV
         YKWKz1xW/pksBr6Z97CAz89a1XfAAksTe8OHR67URewK06u3J6uUmACwr6lNYCUlFVh1
         2drcYGZRt8uv3JDWGLafeEdJ5IwuEIZt3w1vC91dCeqCi4kK4ZGyWTi0Qxc6fKJLcbLu
         yAbcikA3w+SHlFxf8khjPLS+gfm+qW4M6fX+WnQbPDObqYwSJCBSvw1cw45RoRa5Efrk
         75xA==
X-Gm-Message-State: AOAM533axE++XeKwGDlkmtJZd1FHauL52Dx5esDxnWFN5tVBieepbuVY
        doy/3ERTG8GYaeMAKXk5H80=
X-Google-Smtp-Source: ABdhPJz2kmDEoO5V5xCYWU9qARKBAltyrreo+hUmzBVD47szRH8FPOOBSnD6QZieO6ZqBBpuPOeWSQ==
X-Received: by 2002:a9d:6e0d:: with SMTP id e13mr32011412otr.83.1620828125182;
        Wed, 12 May 2021 07:02:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p127sm2752oig.16.2021.05.12.07.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:02:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 07:02:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 07/10] watchdog: keembay: Update the check in
 keembay_wdt_resume()
Message-ID: <20210512140203.GG1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-8-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-8-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:21PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> Corrected the typo in the function keembay_wdt_resume, we need to
> enable the WDT if it is disabled/not active.
> 
> Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
> ---
>  drivers/watchdog/keembay_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index dd192b8dff55..10896415f8c7 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -260,7 +260,7 @@ static int __maybe_unused keembay_wdt_resume(struct device *dev)
>  {
>  	struct keembay_wdt *wdt = dev_get_drvdata(dev);
>  
> -	if (watchdog_active(&wdt->wdd))
> +	if (!watchdog_active(&wdt->wdd))

Have you tested this ? "watchdog_active" refers to the watchdog core state.
Your code now keeps the watchdog stopped after resume if it was running before,
and starts it if it wasn't. Please run through a suspend/resume cycle with
watchdog disabled and see what happens.

Guenter

>  		return keembay_wdt_start(&wdt->wdd);
>  
>  	return 0;
> -- 
> 2.17.1
> 
