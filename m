Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527293FA6CB
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Aug 2021 18:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbhH1QYq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 28 Aug 2021 12:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234467AbhH1QYq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 28 Aug 2021 12:24:46 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FDAC061756;
        Sat, 28 Aug 2021 09:23:55 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso12111388ota.8;
        Sat, 28 Aug 2021 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e00tT1WGM1MeY+aTqkfLBt5Jw5xRDnXK4DZViwul0w4=;
        b=OGY7XuCS+3wQSZKNoOjPzD+Veeh9GBMavXAYkIR6oli4r+4VvzzVQMx+u26rzlJRgX
         O+FBBMBB+gmT4aX7WE4opxSP9teu9aHt27P2/Lp5njVurRNJHUT99TIs13gyOuvNBBi2
         k43kS2qfw4+zQXEh0biZdBkKDu51Nd6JCdIsAajanyQsZy8KUBuucOY8PxUILvOGUXoz
         lCmVgn/3VhvvZkd7zAxgRmj8uDsWxGqOnvEyUGfpepvn4M28vSxmiP1tjpZfs2x+nMNc
         sVXug/9z4Sgqcuj7/8Qwf7Q7VzLRMCCSOWwbnPq2g8CYH7m9M4y+SA1yxScb8jW/poOG
         DW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=e00tT1WGM1MeY+aTqkfLBt5Jw5xRDnXK4DZViwul0w4=;
        b=j5kAJyd1AhuqMVF0qzmza5BqGqxh7wquNS4Vw/abH4DKljERCL7BM5UngfU5vK0FMZ
         Rgq2hsewRYQ5Al9SLdFnRAbx7chjDAINFLZhgU0aQMuERe+4XwYjkTXBxHh1zNpnCmyC
         R1r4xK8BQZv5zwi66Q5q2d5c21RE1y/iS8fa55MLllEcetu4hNfV0lB65lf6cpoF6tzq
         mMLc4ro1uEK8lqscxng15swsKgvL6k2Nn+h5uV25/20fBUjiIb7I9NNgxCzmg7CnyRj5
         m45jMwz8qTNIhTQgMdJpqkYe7gfvWioe4j6kHE7RSAAVya2P7GaxS/uBvpwdjcG461ix
         dQQQ==
X-Gm-Message-State: AOAM532s6R/0Fp9AwM+KsCsxcirnyMkBHH3nxWZzEO8uEL2hbnmi5TKM
        VoJewVe5KB+2Toqgm/ncL4A=
X-Google-Smtp-Source: ABdhPJwgheHP9xFxdiCDi0/2ty3Qhjm8CypzDW4X80tPGWRcHgx4iqDm18vlTXVU6xmvSUjtzhnsNA==
X-Received: by 2002:a9d:6c4c:: with SMTP id g12mr12465615otq.298.1630167831683;
        Sat, 28 Aug 2021 09:23:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 4sm1847076ooa.11.2021.08.28.09.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 09:23:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 28 Aug 2021 09:23:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: watchdog: sunxi: Add compatible for
 D1
Message-ID: <20210828162349.GA824322@roeck-us.net>
References: <20210805045716.46141-1-samuel@sholland.org>
 <20210805045716.46141-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805045716.46141-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 04, 2021 at 11:57:15PM -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Acked-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes v1 to v2:
>  - None.
> 
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 8fa5b0d32381..6ef5e7caae80 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
>            - const: allwinner,sun4i-a10-wdt
> +      - const: allwinner,sun20i-d1-wdt
>  
>    reg:
>      maxItems: 1
> @@ -61,6 +62,7 @@ if:
>      compatible:
>        contains:
>          enum:
> +          - allwinner,sun20i-d1-wdt
>            - allwinner,sun50i-r329-wdt
>  
>  then:
