Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20599386C97
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 23:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238169AbhEQVtw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 17:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhEQVtv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 17:49:51 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188F7C061573;
        Mon, 17 May 2021 14:48:33 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id i20so5774100qtx.4;
        Mon, 17 May 2021 14:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yy4Ww7Xsmv9xryEPdH8I2IgOJkGPnLcUqglHc0pHwhs=;
        b=YWG+n3G2sxfcomptraIXExgGe/G6gpmi7Ysb16+vKMqGgy3+fHHPiJ7OyIgm9M8JZb
         dYPWQwCMVGImgwFEeParb2IlMGWWNUOaYPYh+Q5JMfhKcYgmt1q3vIlB66OK6oli6b5Q
         pf2XcvnyHPcGSwFolMcxsJxtxJcD55JxBVAE10UBaqjk0LoQLxzhMGWXQ7mhsq8JZ43y
         w13zGkVO+/5aQ5hzFRg85KlezFooEBhR25R9YlTYJKvGL70R6QfBhvHTXq/tJV2/nk1z
         lQb+1MojBfjaHBLO1fivA+mXd9mfe9Wvkw1HlNyQ0lv0R5x3xaR13KevLIVrwtWOJJLX
         lviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=yy4Ww7Xsmv9xryEPdH8I2IgOJkGPnLcUqglHc0pHwhs=;
        b=rM/X4E/ESZNK48nzW1b/6F6IAstkTEkgJ2t+wbbEIj1Q5eotKfddfF+TGO3Rstj3Fo
         b6KP3g8YPFTYWqEvZOIOrEMH2FMml/lBY1R0L6NfJjVs0E+TnDnPU4IwWs+ZgSkDkTvB
         QBV0L4Oygg5Hf8Udx/ee3wAVRhh7ey1nMhtKR91U65lIsfjCngZaPDnCpP2URGZ7k60m
         8NIQbiD2O8aBJkFklJblES/gU5DcWxKP8ttcnMdt/eYQ3MZvuCfLVX3psIaVeZONtxUa
         6oO+4hR9tgIc/MkQ9NbXssuxle093Ggryl1DL3+wY6Vt13JDco+BqFM5BbfudPF3mq8V
         MSNw==
X-Gm-Message-State: AOAM533k/6/HgnwSoueIWloxDxJfudKYbiTB7ZQE6S9wELnzFUirNtmV
        4zBrFIVjVhfXDbDM1+iXygSy6KDIvsw=
X-Google-Smtp-Source: ABdhPJyB8KnOzvXniflu60Z/px/b9SeVrLAcsl5h7bNLycruW94AG9wBCz1LtRqQUX85rkul4pQvsQ==
X-Received: by 2002:a05:622a:15:: with SMTP id x21mr1600696qtw.6.1621288112391;
        Mon, 17 May 2021 14:48:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o4sm5386279qkb.29.2021.05.17.14.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:48:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 17 May 2021 14:48:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v1 1/1] watchdog: sp805: Fix kernel doc description
Message-ID: <20210517214830.GB3623005@roeck-us.net>
References: <20210517174912.26419-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517174912.26419-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 17, 2021 at 08:49:12PM +0300, Andy Shevchenko wrote:
> Kernel doc validation script is not happy
> 
>   CHECK   .../sp805_wdt.c
>   .../sp805_wdt.c:73: warning: Function parameter or member 'rate' not described in 'sp805_wdt'
> 
> Fix this by describing rate parameter.
> 
> While at it, mark clk one optional.
> 
> Fixes: dc0e4a3bb7dc ("watchdog: sp805: Add clock-frequency property")
> Cc: Srinath Mannam <srinath.mannam@broadcom.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp805_wdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 531551216c8c..dbeb2146c968 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -57,7 +57,8 @@
>   * @wdd: instance of struct watchdog_device
>   * @lock: spin lock protecting dev structure and io access
>   * @base: base address of wdt
> - * @clk: clock structure of wdt
> + * @clk: (optional) clock structure of wdt
> + * @rate: (optional) clock rate when provided via properties
>   * @adev: amba device structure of wdt
>   * @status: current status of wdt
>   * @load_val: load value to be set for current timeout
> -- 
> 2.30.2
> 
