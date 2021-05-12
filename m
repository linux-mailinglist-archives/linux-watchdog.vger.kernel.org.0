Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5D937BF06
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 15:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhELN7f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 09:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhELN7f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 09:59:35 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D377C061574;
        Wed, 12 May 2021 06:58:27 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso20610639otn.3;
        Wed, 12 May 2021 06:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/B6RUEws7o/XOq9McZRw6u57e3muv/9j/S/KhBwmylE=;
        b=ZVCWovKAOrqo0EWbBDE4po7opQmR3tP0kMtsRstWsLufWd1z/jncehAeodkblEGgJR
         2FWOm7ztG/Gw4il551K2mQ6UtoGesXN4ecSntOQNqxNbiLdFTcKPPrAG7pSS0XBc/Sw6
         AJ+qq1xgewbrsFD2glDHqxycSUt9ET5uV14ePV96m6XU3fJEioFGZwWFWKkiDD0Xzoeq
         N4vTFrj4YO2D0GcXSJ1DLuRm9Hu8EE2wr0tvuIYDSqGQcLAUwIm+EVhBblbfh03bA7Zr
         JQtTIl3pTK2OBTQmdac4QEit45CjhttaynB9E31a/vT47+jnqgJR07fElQcwzCpcHmi9
         p6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=/B6RUEws7o/XOq9McZRw6u57e3muv/9j/S/KhBwmylE=;
        b=XZpas0pXLsy2XQ1B4c6VT5PXqVzhYSzzCewaixaFMW7Q191WOT2zl3FITklvSaSAJ+
         E4f6RfiMbLg3yLDUxEbSH8JmHdmzt7X6rMME2dPvPWzvVpXACGsalEK7/JsnH9SkAnEu
         noOLWWwTyxmSPUq8ZDf6/RfSLvfnIY3wbmQxGQ3V9imeVk1A9fGaOgv81bp5wpFh3vtx
         Z3aso+OC2RF3n/YaD+mA5obu1OvY+6WfSRLIhThb0AxV+O3d5NNkgh4W1VjzXmIZQRcM
         X+TRp0pI4qsQuHnsR+g7JboUpuOkEZBZgX9GnoP+JnBGxy80TxAWvb/jbtnb47lKclax
         t0sQ==
X-Gm-Message-State: AOAM5308DBw2kiowqPAROthZnStRLPvJcVhTb5TxYfzXcf/qVkElfNjf
        R45bq5tljfD/fQszftpo/TI=
X-Google-Smtp-Source: ABdhPJyG3gcRXffyGwHGRWVyNHyxyHIhPXMDjUoy62EqJKQcoT2K4UGa/tHV3pBrG/pfjDHroPkrHA==
X-Received: by 2002:a05:6830:18d4:: with SMTP id v20mr10425834ote.313.1620827906901;
        Wed, 12 May 2021 06:58:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n37sm4481917otn.9.2021.05.12.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:58:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 06:58:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 02/10] watchdog: keembay: Upadate WDT pretimeout for
 every update in timeout
Message-ID: <20210512135825.GB1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-3-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-3-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:16PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> The pre-timeout value to be programmed to the register has to be
> calculated and updated for every change in the timeout value.
> Else the threshold time wouldn't be calculated to its
> corresponding timeout.
> 
> Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index f2f5c9fae29c..b2afeb4a60e3 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -109,6 +109,7 @@ static int keembay_wdt_set_timeout(struct watchdog_device *wdog, u32 t)
>  {
>  	wdog->timeout = t;
>  	keembay_wdt_set_timeout_reg(wdog);
> +	keembay_wdt_set_pretimeout_reg(wdog);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
