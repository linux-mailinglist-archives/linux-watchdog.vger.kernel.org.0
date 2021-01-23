Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE98630173E
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbhAWRcc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAWRcb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:32:31 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE11EC06174A;
        Sat, 23 Jan 2021 09:31:50 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id i20so8467477otl.7;
        Sat, 23 Jan 2021 09:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=swznRfItuviAIzsJbhWlXVhBycUJMTNWt2mYcrBuhf8=;
        b=tcAKmq+00rDiaxhDHYmMvTAhQszIVB3F8G5W/UESzMfEDCkU8tCG02Vzrf0F+lizh9
         3n8dADfM8Qfzava+O0Yy0EULopAqgQ2/NicZzlbitAmKlaC3S+YaI9ZkCdj29ZXOhaCo
         v9AuUJIqeJU/pmto79k95GI3+Fl2DzjzGUlzfZKHHO/f0+QD3DoRIpinG/dB/F8F2gku
         t3zIDfVAoyp81skwsTDhCnz5Bq2CvfxD9MWOAfyliEahHEmdkTdzAeSFh+cI4ncMQkRi
         CAqox1/zcwDVqA5TjrXwjd6f9e2kSEMEJCRuaZ52iMCVlwJBRvvoHih18dV8ZnTtcIVI
         3PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=swznRfItuviAIzsJbhWlXVhBycUJMTNWt2mYcrBuhf8=;
        b=Ukvr+H8xDq7o2aogIQRmk/RPbqJu7OWzJ1+snv1E5ffFBKj18BsZPu031GWRm7WXT1
         A1fqPdDuSPX3aMR9ZbhO/KhrPcKVyJDQHi0ARaRh2fLIGySSwBt6MhEeA7SXuq3U4pHI
         0LQcYLV3H+Y3QvBdGF8oo9XK8Ey9KZCPTn3UyiZaRFHQnBWdgqCrdM72dNqVYYzYlLRq
         MLVxlB7eAOeTd+jszY635e+vCI5s2W81J4vmwmwVswRyOckWQ3OHmIbpWOAS02jhaxW/
         KRCv8hFzJ9smtUHa/+Hje2bCNewaD/Ti1VvNqAEMSxuEf1NByywP2BLOh8jJv+NQr4Oy
         l28w==
X-Gm-Message-State: AOAM530gkp80HY41WcTYCZdOYdBL+yja3v7Z0SmyV92ioo8pQdvD4IDS
        lXw0xlXPCFm347sJEgZA498=
X-Google-Smtp-Source: ABdhPJzmc4mAdCKeF0Hkd5dDgHnKUqlBSIpIsjrFWLxfgXd6dzG+Z1y5ty1OELGfaZclTfEXI5HDXg==
X-Received: by 2002:a9d:61d0:: with SMTP id h16mr7106743otk.1.1611423110181;
        Sat, 23 Jan 2021 09:31:50 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j11sm2469492otl.18.2021.01.23.09.31.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:31:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:31:48 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 17/21] dt-bindings: watchdog: sun4i: Add H616
 compatible string
Message-ID: <20210123173148.GA57180@roeck-us.net>
References: <20210118020848.11721-1-andre.przywara@arm.com>
 <20210118020848.11721-18-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118020848.11721-18-andre.przywara@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jan 18, 2021 at 02:08:44AM +0000, Andre Przywara wrote:
> Use enums to group all compatible devices together on the way.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 5ac607de8be4..9aa3c313c49f 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -19,13 +19,11 @@ properties:
>        - const: allwinner,sun4i-a10-wdt
>        - const: allwinner,sun6i-a31-wdt
>        - items:
> -          - const: allwinner,sun50i-a64-wdt
> -          - const: allwinner,sun6i-a31-wdt
> -      - items:
> -          - const: allwinner,sun50i-a100-wdt
> -          - const: allwinner,sun6i-a31-wdt
> -      - items:
> -          - const: allwinner,sun50i-h6-wdt
> +          - enum:
> +              - allwinner,sun50i-a64-wdt
> +              - allwinner,sun50i-a100-wdt
> +              - allwinner,sun50i-h6-wdt
> +              - allwinner,sun50i-h616-wdt
>            - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
