Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20F930174A
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbhAWRfB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbhAWReu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:34:50 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8AEC06174A;
        Sat, 23 Jan 2021 09:34:03 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id w8so9954522oie.2;
        Sat, 23 Jan 2021 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b4K5CQtBVamoURmPksyutnNAiwTza805g1N0hR+Tyog=;
        b=WQYZi8e2c26NusVxkq8YszXgFKXZagnXWL/hrebvsPdwtnEWVQ1M/E4/GOEXR4qVf6
         Z2Z+PSdS8+iOVVtKvMAMSQ/0eDulMqXe8VMyGs+4wprWhBRklgUk9uXfYmaR6asAmAfi
         ShAfzmZIYjVqe8A+im1PWkHd2SD+JnQg5k/BD0nklKzCrAOElud5UCu8o9sFR4vxcIpW
         LRDBou3xD3Hk4yheYKzxk3oRb4LsSYlT5xPxUU9PnxnL3QxZt6U61U0TvDSrDguuyyCd
         I/f73pEYb3pvGwCW7eMcnBzwhLKLgcFWqxWnNmC6iQvXH2T+eU0vMug7J+ha8SQnXdpz
         AJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=b4K5CQtBVamoURmPksyutnNAiwTza805g1N0hR+Tyog=;
        b=Je/l7md4KCvPSQ1uECSEcfurCAcrS8VmVLN3c0UdNj+SFNk3tcWmFCbVa8eH4kOu65
         W8gY08iP7fOKZKKTqJzVsgNQe8fmVRoOu6uYAewhi3aocrc22XYNz893hXd5ZNL8j371
         6xk74JP8jLyBSJfT8ybHlWuMCQ0Uci5rmlPOHB72Z0iJzPPBYiyKBO046juwiznTwm0n
         W1829vHSsUTMhJy02dfUVggi2dEGDDOvCxdJI00qAQdI9Rz28LgsDfZMGkwtiJV5JUNX
         00Jgoq+gQs2e05RIIMw/mG2CYeAA+YzE/2qD3GaHm88HxCarofoFq1YgclU/s8NYesib
         6YgQ==
X-Gm-Message-State: AOAM532LeHR4PVHJQxHnHUQpJn3R2V+UqeS7dh2ILE+xuaZ40ST65Jh4
        gOzQgF/hwHxl2zUwiW7J7mY=
X-Google-Smtp-Source: ABdhPJw9dgIKA1nn4BG+mGoYH+i220V0pOWwagtjlRLUeq9o1Y/h3LU06D2rFztt1BTRLUBRLYkt6A==
X-Received: by 2002:a05:6808:2d2:: with SMTP id a18mr6771655oid.139.1611423242888;
        Sat, 23 Jan 2021 09:34:02 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i9sm2460576oii.34.2021.01.23.09.34.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:34:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:34:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, robh+dt@kernel.org, wim@linux-watchdog.org,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-binding: watchdog: add more Rockchip compatibles
 to snps,dw-wdt.yaml
Message-ID: <20210123173401.GA57343@roeck-us.net>
References: <20201218120534.13788-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Dec 18, 2020 at 01:05:27PM +0100, Johan Jonker wrote:
> The watchdog compatible strings are suppose to be SoC orientated.
> In the more recently added Rockchip SoC dtsi files only
> the fallback string "snps,dw-wdt" is used, so add the following
> compatible strings:
> 
> "rockchip,px30-wdt", "snps,dw-wdt"
> "rockchip,rk3228-wdt", "snps,dw-wdt"
> "rockchip,rk3308-wdt", "snps,dw-wdt"
> "rockchip,rk3328-wdt", "snps,dw-wdt"
> "rockchip,rk3399-wdt", "snps,dw-wdt"
> "rockchip,rv1108-wdt", "snps,dw-wdt"
> 
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> make ARCH=arm64 dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index f7ee9229c..b58596b18 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -18,10 +18,16 @@ properties:
>        - const: snps,dw-wdt
>        - items:
>            - enum:
> +              - rockchip,px30-wdt
>                - rockchip,rk3066-wdt
>                - rockchip,rk3188-wdt
> +              - rockchip,rk3228-wdt
>                - rockchip,rk3288-wdt
> +              - rockchip,rk3308-wdt
> +              - rockchip,rk3328-wdt
>                - rockchip,rk3368-wdt
> +              - rockchip,rk3399-wdt
> +              - rockchip,rv1108-wdt
>            - const: snps,dw-wdt
>  
>    reg:
