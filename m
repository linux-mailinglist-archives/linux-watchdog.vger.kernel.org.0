Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD2B37BF36
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 16:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhELOF3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbhELOF1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:05:27 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF3EC06174A;
        Wed, 12 May 2021 07:04:18 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id u16so22349195oiu.7;
        Wed, 12 May 2021 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hurtn54WPjyZFZ9fAyALLC/h2FFj3dL9hsA1UGpG2Fw=;
        b=q8C0aQ6FoOzBtpa+schonjzmaFvMIdkIm+tfPjNaCShN7tcrwm5PoZ47NDjMvnEXFO
         TmIiU/GSjgn/6zPcBUzTZ7xN+TXt5pUlIQ50VPiIVP1ANDksHt4xHQ+iKTn33WRyirBR
         E5b5roteECsxNNmzVSRKE29grRFcLNy+GaAVd/A7H3UG6pYXjVWDvi6thb9PqiMhVVB0
         PLG/yjs3uVYwvvTFBWNmkxRIsbXvFqtdED3pnfcmcnXWLKzJXfcchzMaJ49lGrcVi2Zw
         Yvq7u1es+74R8CC2yBuIDWIuBMBLesggdqbzFcCKgJSU/VoAuDjxLDbQYmPU2ze8Lck5
         PEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Hurtn54WPjyZFZ9fAyALLC/h2FFj3dL9hsA1UGpG2Fw=;
        b=JFcAV8AUOltJGplOs9HdIevdhtQRxiCYnsan0LYL+7/GoLplHlshpNCZD3v1k56z/x
         L8N9CWhdP/Gf8BuGRqiUKcDkdk9MKfbGXaXGyJlcdO4Ew87hFDNJ9MPsc2i789Eqs9HF
         iSYxYcEy+mLD5Y5+Qw3h2KzCCsHxHQ1v/dYgRJ/8IfLwxnGCWdNUXsZYSZh1nvVnMw3/
         0fjmL3QffNFYSiscj/e7iufusjPVReeEv/iZl/IdLpziGTD1aByLUVUkDDESyq3VfGo9
         DBLdYjhjJHAoRZ5wEX7eZKZXkXLVsiOeblLVBvKh1heGpwqjumRR5FTLymDcvQrkqoSR
         zKRw==
X-Gm-Message-State: AOAM530jA2tO5TSH3KViadSMKDmo2FXxTgwluCbGybX3WZtol2ivAWWJ
        hVT2Zq+ZKkji6JjGUbn8YxnrcxQo62g=
X-Google-Smtp-Source: ABdhPJzOqdtXSr9z9flnfO/l8WrFn0WKpGRe/r5trUdSeSIZENuSbKhPPdrn+ycbOQJJKeSl4LZejg==
X-Received: by 2002:aca:355:: with SMTP id 82mr7768087oid.155.1620828257858;
        Wed, 12 May 2021 07:04:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w10sm4453608ott.75.2021.05.12.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:04:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 07:04:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 08/10] watchdog: keembay: MACRO for WDT enable and
 disable values
Message-ID: <20210512140415.GH1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-9-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-9-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:22PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> Introduced MACRO's for WDT enable and disable values for better readability
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index 10896415f8c7..63a7c5d719a3 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -27,6 +27,8 @@
>  #define WDT_TO_INT_MASK		BIT(9)
>  #define WDT_ISR_CLEAR		0x8200ff18
>  #define WDT_UNLOCK		0xf1d0dead
> +#define WDT_DISABLE		0x0
> +#define WDT_ENABLE		0x1
>  #define WDT_LOAD_MAX		U32_MAX
>  #define WDT_LOAD_MIN		1
>  #define WDT_TIMEOUT		5
> @@ -84,7 +86,7 @@ static int keembay_wdt_start(struct watchdog_device *wdog)
>  {
>  	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
>  
> -	keembay_wdt_writel(wdt, TIM_WDOG_EN, 1);
> +	keembay_wdt_writel(wdt, TIM_WDOG_EN, WDT_ENABLE);
>  
>  	return 0;
>  }
> @@ -93,7 +95,7 @@ static int keembay_wdt_stop(struct watchdog_device *wdog)
>  {
>  	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
>  
> -	keembay_wdt_writel(wdt, TIM_WDOG_EN, 0);
> +	keembay_wdt_writel(wdt, TIM_WDOG_EN, WDT_DISABLE);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
