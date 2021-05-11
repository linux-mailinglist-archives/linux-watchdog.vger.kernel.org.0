Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446FD37A545
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 12:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbhEKK6T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 06:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhEKK6Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 06:58:16 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E6CC061761
        for <linux-watchdog@vger.kernel.org>; Tue, 11 May 2021 03:57:08 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id n61so6198302uan.2
        for <linux-watchdog@vger.kernel.org>; Tue, 11 May 2021 03:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H3TFuIrc3Mj7EWsSB5KHDQrg/psdazR0cVvA5Agy22s=;
        b=BI5betzphHV53YRAHo1kbf3qtN5EZ+oJQvqpn4XXUNTvjtju9UI5Wxwcu/qn0vpzMa
         l8lD+g5mD22XYfa4O8a/DkbtdqMxftpPoCgk3EzFxlgMa9475q6tweCGnyLgcCpSu8ue
         poRgY190B4IYUbsx23WRK7dsxuPfKqFzfOElVB1Ti0fK7UgpND6B/TIlH7Ez2Ztt/UZw
         X9ChYwX5o5XMrZarBxHM9k9fuDXw7GeXfg0wQeftAJktbg8FdqoErJmdZxTz9ySB9ljp
         5kzgCqLZ8a1IL5VP4fZ8V/3eoLv/D//8lDoYt4CeIJg/ADMwinFvoAgj3MdlTZUA2vJ8
         V+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3TFuIrc3Mj7EWsSB5KHDQrg/psdazR0cVvA5Agy22s=;
        b=KS/GRrZsLSAesamS9AzsAH86DwTlS/yfKcJGNkU7118K9bjqEei+7Kfz4jc1hFUOhc
         l8GG2koaiVfFHMHLq6BoMyp6nIGxGQeqmAA4FX7k3gb9Wc7tn+CVdoP3fOI/IQM9EOop
         JmqEA6zd435GePWXb/wH4g3ttNQ9z4HWPtKwZhf4lG8Mx4Mkxk+RDsmAjDzL6dip79P3
         r7LRNWh7cAkk1BvNhp6gGsuuzNIxSIKJATMFVkdHzZGcb58bYXAg1yn+Hcwal4Y+DCRE
         yZ6jaomFxSz1t+QtArjwA3se0Wjjf6d2QABn99x4jhqZFZP1S0/97iG3EEveFCKkoKO0
         Zmjw==
X-Gm-Message-State: AOAM533bBEk5isLZMIX+huFcuzzxfZP7ncmyKodB1KkpM4YYUg31Z6ve
        tZ/f29LEMTmSozX+P0zc1+J2EKnTBN95bNPQUGRDMg==
X-Google-Smtp-Source: ABdhPJwynumHCSzbxs9fEYhSTsTQNyquQmA9nby0MfgarYqJoMGRF7eJ8B5GdcKLxBd8RzpG4b/jdGZAXltAK2YZE4E=
X-Received: by 2002:ab0:7002:: with SMTP id k2mr25127013ual.104.1620730627962;
 Tue, 11 May 2021 03:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210429081151.17558-1-cl@rock-chips.com> <20210429081151.17558-4-cl@rock-chips.com>
In-Reply-To: <20210429081151.17558-4-cl@rock-chips.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 11 May 2021 12:56:29 +0200
Message-ID: <CAPDyKFr3cpARwxZPUfnFfJT-=UMynUNK-Jb0NLNJG=k9O-=R9g@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] dt-bindings: mmc: rockchip-dw-mshc: add
 description for rk3568
To:     cl@rock-chips.com
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Chen-Yu Tsai <wens@csie.org>, uwe@kleine-koenig.org,
        mail@david-bauer.net, Johan Jonker <jbx6244@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        jensenhuang@friendlyarm.com,
        Michael Trimarchi <michael@amarulasolutions.com>,
        cnsztl@gmail.com, DTML <devicetree@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        David Wu <david.wu@rock-chips.com>,
        zhangqing <zhangqing@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jamie Iles <jamie@jamieiles.com>,
        linux-watchdog@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 29 Apr 2021 at 10:12, <cl@rock-chips.com> wrote:
>
> From: Liang Chen <cl@rock-chips.com>
>
> add "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc" for mmc nodes on
> a rk3568 platform to rockchip-dw-mshc.yaml.
>
> Signed-off-by: Liang Chen <cl@rock-chips.com>

Applied for next (and by amending the commit message according to
Rob's suggestion), thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/rockchip-dw-mshc.yaml        | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index 3762f1c8de96..eaa3b0ef24f6 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -29,21 +29,14 @@ properties:
>        - const: rockchip,rk3288-dw-mshc
>        - items:
>            - enum:
> -            # for Rockchip PX30
>                - rockchip,px30-dw-mshc
> -            # for Rockchip RK3036
>                - rockchip,rk3036-dw-mshc
> -            # for Rockchip RK322x
>                - rockchip,rk3228-dw-mshc
> -            # for Rockchip RK3308
>                - rockchip,rk3308-dw-mshc
> -            # for Rockchip RK3328
>                - rockchip,rk3328-dw-mshc
> -            # for Rockchip RK3368
>                - rockchip,rk3368-dw-mshc
> -            # for Rockchip RK3399
>                - rockchip,rk3399-dw-mshc
> -            # for Rockchip RV1108
> +              - rockchip,rk3568-dw-mshc
>                - rockchip,rv1108-dw-mshc
>            - const: rockchip,rk3288-dw-mshc
>
> --
> 2.17.1
>
>
>
