Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4A530D6A4
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Feb 2021 10:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbhBCJtF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 04:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbhBCJsh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 04:48:37 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61175C061786
        for <linux-watchdog@vger.kernel.org>; Wed,  3 Feb 2021 01:47:57 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id d15so17059204qtw.12
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Feb 2021 01:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zk8/vp8JgNY876P4l17ZIlAqzB9Wo0hE+dFWOx8FtrM=;
        b=SY8KB6ZL7hu4tsDAT4WtjBrjedqhdXnJ0WfEvfJfTY4yh0iSUYYRhinj5pTMbKBDV1
         aUGstOUKrtsV6s3+W+PrL5fuzfzO0w1ItRwwVf+Gj24JPi7XOxzASbip5S8aN+T6CEwU
         +NX0nAvHbl0Z+rP1h+42oA2pbBBS/9Oc57Pzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zk8/vp8JgNY876P4l17ZIlAqzB9Wo0hE+dFWOx8FtrM=;
        b=rBAVq83+cznsZg5a85/xK1odymNJ7F9ba2Ich+j5Mk3nCD8JjVkPw0P6shHiQjn7PY
         UUgrU3gOSH53uQX5bPoVaQBytPbvzZR/UEaC2Lm1cWH5I8RDibda+In44+O807ykxAbs
         iri6WOco7gsHp9ILwrFJJBEQEXJve7VDbf96YPd4/HaQVobdMZeP5P7n4tuvK6J2lgN/
         9jNAYHaW/LlOYqRvhNDnDrh/vuPqgvAJfL0rosdJN96nz+PaOQURYzS4WcmGA9cwE2iB
         P0PzI4DR10/eJU01EA9pIs2YFCQjrallvZ9SzyG7BkenxUqAdKSzML1ykZ/Yw36Wb62V
         GEvA==
X-Gm-Message-State: AOAM532mMHNI6dfHv6GlyJURCSZjcvHMmCyrv807vY6BzgPMKdJKVGgR
        8AhQtaj3ZBH/wZN4DgQi/zL/GLJCQGWwm7/aWcbPvA==
X-Google-Smtp-Source: ABdhPJybIlxUI+vQirOWdUqx6AbdqbGySWHXWBWrXBPSLHmsuhjkp60HqhVWg2mWEWZVLnKYEXPVHI64xIy6+ueWcow=
X-Received: by 2002:ac8:5dc8:: with SMTP id e8mr1685704qtx.249.1612345676494;
 Wed, 03 Feb 2021 01:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20210202205544.24812-1-robh@kernel.org>
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 3 Feb 2021 18:48:59 +0900
Message-ID: <CAFr9PX=NmCev3c1jQ3VA89rwcTr3jpRQB-NKf+j+LOeOMHy1Og@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in examples
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Rob,

On Wed, 3 Feb 2021 at 05:55, Rob Herring <robh@kernel.org> wrote:
> diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> index 1f2ef408bb43..fe1e1c63ffe3 100644
> --- a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> @@ -46,7 +46,7 @@ examples:
>      #include <dt-bindings/gpio/msc313-gpio.h>
>
>      gpio: gpio@207800 {
> -      compatible = "mstar,msc313e-gpio";
> +      compatible = "mstar,msc313-gpio";
>        #gpio-cells = <2>;
>        reg = <0x207800 0x200>;
>        gpio-controller;

This is correct. The compatible string dropped the e at some point and
I must have missed the example.
Thanks for the fix.

Reviewed-by: Daniel Palmer <daniel@thingy.jp>
