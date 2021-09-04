Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8E0400BD1
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Sep 2021 17:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhIDPLv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Sep 2021 11:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbhIDPLv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Sep 2021 11:11:51 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA9CC061575;
        Sat,  4 Sep 2021 08:10:49 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id bi4so2979328oib.9;
        Sat, 04 Sep 2021 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=doZgp/4GdYI5KrgtOO8Mhfj8uXjudg+UojLzeQONPag=;
        b=hs8KbKS09fmOjnS0IvZRdFSSOggZgf2u8XqBqIDlXCrIzopt+NG9m3qItApsi+YpQu
         uAeuIAow5/3NS1joSNZqrBCNAaZJnjdNSsMwXYWGlMMJin8bNTi4eGFsTZkNM8K7c3W8
         GD7sZEE7o6CK78JAyP/9dfizknnalAsfWsLuHL5gpxB0kf9MgHjeeO3dD7jJ7siq/IAz
         UIosaXcSF7XffVJ8IdPdioF4GqkEwgpTOK13u9oVJAVmpeP3QWWV3GV1Hyzim05wyv4b
         M1RftE0TuztehTVLi5vC69Y4NEZ3b9+OVNoA1z9NbmOu2xNEXIcZ497peUwt/kfDt6Z0
         14Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=doZgp/4GdYI5KrgtOO8Mhfj8uXjudg+UojLzeQONPag=;
        b=TgD5t5ZyR5lzPKkoVMueRnoFIt8HhCjFE97tLxEC9VVd+pRVXBbch08vX4ec6xr2/0
         6shuPhf4xF98iNZpG0z9ChJRSwrsS9HmqPsSBrOuEkrrlAr0zJhM9pey16boZwsyp1kN
         JLuu0blCHLec1XAHsY0zba6aatAL2xwUmzNEh7RfGJHrlcgV2hn9KmQcWPnUH7m1KskM
         zgpKhy9nBA3LrxJ9RvwtKGXckUXLozdJiwBckfIV8wOO9N68nsdf2FQzpLiAs4k5u8VK
         MvwL/rYmtZDlsTfSI2V3JHDik1832M5uliy9ZiIUIAqWCzfxCiHKU6BYIrpCKKyvlvHc
         VHCQ==
X-Gm-Message-State: AOAM530dZbnOPDLQuCIgRzsifcj963zeaAMIAQpyk4Mm1IQfH5pLWn7r
        vK5IIEsHWDbYQ8M24OQz19c=
X-Google-Smtp-Source: ABdhPJy/LIrmgjHhH8kelR8GQJnGsChhzF5JNVEnnEFY3K8/fdnDRL9lgeYCpzljr12oFblZ+6CJAQ==
X-Received: by 2002:aca:31c1:: with SMTP id x184mr2901352oix.8.1630768248760;
        Sat, 04 Sep 2021 08:10:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a11sm535692oiw.36.2021.09.04.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:10:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Sep 2021 08:10:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: sunxi: Add compatibles for
 R329
Message-ID: <20210904151047.GA3638393@roeck-us.net>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 02, 2021 at 05:57:48PM -0500, Samuel Holland wrote:
> On existing SoCs, the watchdog has a single clock input: HOSC (OSC24M)
> divided by 750.  However, starting with R329, LOSC (OSC32k) is added as
> an alternative clock source, with a bit to switch between them.
> 
> Since 24 MHz / 750 == 32 kHz, not 32.768 kHz, the hardware adjusts the
> cycle counts to keep the timeouts independent of the clock source. This
> keeps the programming interface backward-compatible.
> 
> Furthermore, the R329 has two watchdogs: one for use by the ARM CPUs
> at 0x20000a0, and a second one for use by the DSPs at 0x7020400. The
> first of these adds two more new registers, to allow software to
> immediately assert the SoC reset signal. Add an additional "-reset"
> suffix to signify the presence of this feature.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes v2 to v3:
>  - Add else case
>  - Add additional allwinner,sun50i-r329-wdt-reset compatible
> Changes v1 to v2:
>  - Switch clock-names from enum to const
>  - Add descriptions to "clocks" items
> 
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 42 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 9aa3c313c49f..877f47759814 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -24,6 +24,8 @@ properties:
>                - allwinner,sun50i-a100-wdt
>                - allwinner,sun50i-h6-wdt
>                - allwinner,sun50i-h616-wdt
> +              - allwinner,sun50i-r329-wdt
> +              - allwinner,sun50i-r329-wdt-reset
>            - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
> @@ -33,7 +35,18 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: High-frequency oscillator input, divided internally
> +      - description: Low-frequency oscillator input, only found on some variants
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: hosc
> +      - const: losc
>  
>    interrupts:
>      maxItems: 1
> @@ -44,6 +57,33 @@ required:
>    - clocks
>    - interrupts
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - allwinner,sun50i-r329-wdt
> +          - allwinner,sun50i-r329-wdt-reset
> +
> +then:
> +  properties:
> +    clocks:
> +      minItems: 2
> +
> +    clock-names:
> +      minItems: 2
> +
> +  required:
> +    - clock-names
> +
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +
> +    clock-names:
> +      maxItems: 1
> +
>  unevaluatedProperties: false
>  
>  examples:
