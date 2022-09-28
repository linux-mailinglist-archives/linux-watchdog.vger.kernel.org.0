Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD975ED55B
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Sep 2022 08:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbiI1GuR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Sep 2022 02:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbiI1Gtz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Sep 2022 02:49:55 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB7F9E8B0
        for <linux-watchdog@vger.kernel.org>; Tue, 27 Sep 2022 23:48:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id bk15so10459189wrb.13
        for <linux-watchdog@vger.kernel.org>; Tue, 27 Sep 2022 23:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=Wd2il4hF1pzBZFrFvjsTW5saNk78apafDtYni0rMMhE=;
        b=MDUkWtgyMrkStEdW4r7xq0XlV0ajeWxSRfd2onCbAaO6HrMhEJutjXjZ95hMJBz6o1
         uGgrjhs9+HGTitEtbnQ2gEzrg7IoGnH8s2UpLZQ1gYIsuvIB5aYFM6Tr8oE7kC6aCBlr
         JNPg9nt0XFfA2sI0sMSjRwdvaLozxDCjDpA0wsxHt5pslo2gCfVM4+EdIOOHikET/F0W
         Szwdmd47MqwHc0ykCVf0u7A8s6yfZHo3DMOsIe0bmkekRSR4qMXMaDNjfsgtaF+mSqdf
         SOd0mbv9JPyr+JW4jWUqldcw0buRjy4SPWQM9qpAMRsoWND0nzc7F/j/CkmU9L6isIoK
         yE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=Wd2il4hF1pzBZFrFvjsTW5saNk78apafDtYni0rMMhE=;
        b=58DLi/gGeb9yvFm3NOzJY6PEfPcn3pDASov8kTOc/1mepA9PhRo7WQazB/6OWL3paL
         ayySrPCPxoLkper1gwq928HQW4XB8CH9n5flS8u3sSb9qAjszMMOZQGf50zd+zIjNRjl
         bZuwBCVGczelyNTBZjofg4BiYiY2CuCHUPuFN87/Bi8RzdVx11v3QtvhCHYO5Yr0kYTW
         wBqQoz6dfa1eJyNQEpd5key9M0pX+nrtnKa4CMsgtvyNp3NXh1jI9X9//Mi1YItsykO8
         dlBUT39t0znAmn8jnsG8JcCQ96AR+mXlWFTw81n6RgTSLwNTkU8q/QqrfCQf22hdQ+6l
         Yrkg==
X-Gm-Message-State: ACrzQf3YUbt9rv9MDBg2ovMul5RyGnazFeuUK4cc9h/vrt6Ooypb4tZh
        0WhE3RY0fXkk+Uk+g/niNu3Jnw==
X-Google-Smtp-Source: AMsMyM6Cq6V5sv4DrIS4+SKGT/Vi+FTJGPTDXxdu1lQbtH2CTZu9dl8wGvB2jhFPwca7f3cBDhZHWA==
X-Received: by 2002:a05:6000:806:b0:22a:36df:2663 with SMTP id bt6-20020a056000080600b0022a36df2663mr18751807wrb.423.1664347700811;
        Tue, 27 Sep 2022 23:48:20 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:5f1e:d910:dd1e:5b09])
        by smtp.gmail.com with ESMTPSA id t5-20020a0560001a4500b002286670bafasm3522714wry.48.2022.09.27.23.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 23:48:20 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-iio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: twl4030-pwrbutton - add missing of.h include
In-Reply-To: <20220927052217.2784593-1-dmitry.torokhov@gmail.com>
References: <20220927052217.2784593-1-dmitry.torokhov@gmail.com>
Date:   Wed, 28 Sep 2022 08:48:19 +0200
Message-ID: <87y1u4f0zw.fsf@mkorpershoek-xps-13-9370.home>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Sep 26, 2022 at 22:22, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> The driver is using of_match_ptr() and therefore needs to include
> of.h header.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/twl4030-pwrbutton.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
> index b307cca17022..e3ee0638ffba 100644
> --- a/drivers/input/misc/twl4030-pwrbutton.c
> +++ b/drivers/input/misc/twl4030-pwrbutton.c
> @@ -26,6 +26,7 @@
>  #include <linux/errno.h>
>  #include <linux/input.h>
>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/twl.h>
>  
> -- 
> 2.38.0.rc1.362.ged0d419d3c-goog
