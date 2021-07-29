Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB6C3D9C91
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 06:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbhG2EY4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 00:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbhG2EYz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 00:24:55 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BB0C061757;
        Wed, 28 Jul 2021 21:24:52 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id 184so4697968qkh.1;
        Wed, 28 Jul 2021 21:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7Oqj3DttJ5RhEJCqZkn0/WMVhGGM0rTesKNmkQoAdSg=;
        b=l+w5qTrAUfiJGPqP+BIKupqZOTbFZyq9f2ChgMbFZrCOSpM7nb2S+o1Jy99HoSLAdl
         V/4RzbWceiywjoYdXUD27eRMLKoexStLUvEZX5SYtpfBZq05+YnRmNqQlSkOqhZySKnT
         6E8/GOKw9GNKPz8H+oalgsmKb+Vj8BuC1zHsD8EtoCKAOFfpeKj7ZRFz8QDna0NDxth6
         kDQr5hVQyxYnyI+f8++f8xx/9IKwDitR/d2tSmQarVLoQ2at/zWYRQPNlzEoBYMCnN2e
         9C4JoLg4Y/yUnkCXmaRfcAwRVKKY+mD687U3PR6WQ8pNPSC+CamJUvs7IR5UBBaibUVs
         NSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7Oqj3DttJ5RhEJCqZkn0/WMVhGGM0rTesKNmkQoAdSg=;
        b=iirrzGpLs9wCJ44SYboThwtmdqa+cA9WXe/XkAITAskwY2RAjnlzVLOTQVg9ZKWnfA
         t3ymJetki+umhul2dizpXvHsMRWHvkIg5yaylmxAWZ2V8s+b4YdX3o1JpFEfFUCiapNi
         f44BWMVy5vywMpQCW7A+rC+AbvmR74Mf1Ep2q+ddBLBB1CrGxG9xXGbyRwZhEPL2689C
         F711XO+7OUUV7AMW9Wwb4Sriw+ccIAeGc4qXfVR8RSKKvidYMSLNUt5ko0ywOUKdMWR1
         U9h6eHtxCHbDIQFamY771w7L4r+ig+Xf5cqqlakXumPZcyv0t9Y908U4sK8YKwLiGuXX
         JRIg==
X-Gm-Message-State: AOAM531LeUxM4zWELLrMEC0GH0fSVTQ8qYkilMBzIEIgNYHMzKV6MNY8
        e+9cOJRr1W/IoNPpFusgClNUH57DonA=
X-Google-Smtp-Source: ABdhPJz4GevoejyfdnOCq1g5/zuOuNU2b/OD8GiMc+U3hhNU0CHPpZcIgdplnlu3wFkebxkhJY/O0A==
X-Received: by 2002:a05:620a:204c:: with SMTP id d12mr3279206qka.417.1627532691260;
        Wed, 28 Jul 2021 21:24:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n14sm846138qti.47.2021.07.28.21.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:24:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 28 Jul 2021 21:24:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: sunxi: Add compatible for D1
Message-ID: <20210729042449.GA1716994@roeck-us.net>
References: <20210726035143.53132-1-samuel@sholland.org>
 <20210726035143.53132-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726035143.53132-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Jul 25, 2021 at 10:51:42PM -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 853ceb1b7c0f..756e6ab99860 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
>            - const: allwinner,sun4i-a10-wdt
> +      - const: allwinner,sun20i-d1-wdt

Alignment is off.

Guenter

>  
>    reg:
>      maxItems: 1
> @@ -59,6 +60,7 @@ if:
>      compatible:
>        contains:
>          enum:
> +          - allwinner,sun20i-d1-wdt
>            - allwinner,sun50i-r329-wdt
>  
>  then:
