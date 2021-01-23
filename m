Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347F2301728
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbhAWRVK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:21:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbhAWRVI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:21:08 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6DEC06174A;
        Sat, 23 Jan 2021 09:20:28 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id j8so2239128oon.3;
        Sat, 23 Jan 2021 09:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aa2zhNGEVZtl6VmccV5UFZrKiIyp17kWyCqdcVHVHY0=;
        b=fFgA0NUqXaku8+W69UNv8VLzwja6322eL+nb1CEUI8rHNjci1SrnWagoUhhKcYNVzR
         kut4i68WxVLtWiQDlN1ki+KXEph7jxbi1jGXmqveBXRMNWN1QG6HlmCkvUWoKxmxaDXb
         LlAorBsUsFHMI381z3B2NojUO7WQg4UnVcNH2lTCHZroJo9/VzDYq5LjTqkKzQA2JVfC
         vuTuSimWUwOr0HQ/u1vL2Jz9vhtPSQcv6gKuBDRCZ5nIEEWgJzOoQ/l1HRauvhjSdonD
         nQ5z68gV44lLI6TWOZzm2p5R2osgY7PhZJgEm/IBogzIQvyarRhUxa9xMGsW5pDT3S9i
         ipug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=aa2zhNGEVZtl6VmccV5UFZrKiIyp17kWyCqdcVHVHY0=;
        b=NjYeioXpbaCR8SphrWomUKFnnRvBUuZdJCkLs7ugDqerjkF1COWb3oN/ECE8dSXPjd
         UgVbQcweSsW+YPsvDhScYAfRK+jwtshGKWTszNw/iXfHEITs5xz7VCE4KnhhLuD+qs/y
         4IgXy/xc87Taq6L+farvwHdA6OsLJulUurPZ67Z4jX1T3krY2zdzpw5pYUbqGDxr8iQA
         C4shBUnmlt5hX3jbtfrLbTS7JCVRzz77z6c/aKVqf/8zGGYk0lPJGNIS9pEP9UPsBwTc
         Pbeb28Lej72zeg7z4YMp3LTLasYeV4uKXNGAv+JkX4HcIE6vern7NDYMNa25OWED8Qc5
         otLg==
X-Gm-Message-State: AOAM533qayWiag7qCS7kK/aDoRgsmnfeEsQM+ntO8hs13a8/che96G9a
        uyIjLe+axqs4CDfZnLbon2spKJSc+uA=
X-Google-Smtp-Source: ABdhPJxIrr1yJazmxH5j1L9GZit8rfkCVzkbmVq+v2Wd1FaMruoXoZN6zhL3sJEScO+XSeyhTeRZ9A==
X-Received: by 2002:a4a:901a:: with SMTP id i26mr7575583oog.42.1611422427977;
        Sat, 23 Jan 2021 09:20:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i126sm2399054oif.22.2021.01.23.09.20.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:20:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:20:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: watchdog: renesas,wdt: add r8a779a0
 (V3U) support
Message-ID: <20210123172026.GA56070@roeck-us.net>
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
 <20201218173731.12839-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218173731.12839-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Dec 18, 2020 at 06:37:26PM +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Please apply it to the watchdog-tree.
> 
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 6933005b52bd..ab66d3f0c476 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -50,6 +50,7 @@ properties:
>                - renesas,r8a77980-wdt     # R-Car V3H
>                - renesas,r8a77990-wdt     # R-Car E3
>                - renesas,r8a77995-wdt     # R-Car D3
> +              - renesas,r8a779a0-wdt     # R-Car V3U
>            - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
>  
>    reg:
