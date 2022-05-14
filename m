Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5976D52718E
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 May 2022 16:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbiENOFc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 May 2022 10:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbiENOFb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 May 2022 10:05:31 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E04014011;
        Sat, 14 May 2022 07:05:30 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-f16a3e0529so3650101fac.2;
        Sat, 14 May 2022 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H1rAn7agXNY4SKWR1IHEUDfm7bTD4FsfGjzsnQ8t8wY=;
        b=OZtXXpiEuzc3B3gQ5VPp2GUesAXeMh9RQ75PXl82D4HO2rLSnMm0USKkfVsq3dfWAw
         yATr8setkpZbWQHnXEykD4flJmymkJrzg9u4i0RXqVV8yBODGngTvkwndK4dwXwPPLu6
         zBzksljL+qjdlPuJlNHtn6J4SEh4DHELfEyLi4rxhww1nPvSiPc/a2DkmRjCsejlx+9D
         VH/nRL7RgKECqbjJDS7CfnEagB58zeuoxoa4MRe8oQlMa9wka7CK7kpeEDODZs8GJaRf
         WpAKAT+NSyRmvHTWCAnTZB+SsrQBcryTcpAlzB4k7ubIhM/ROiP2Eb19/GWhur+35eB+
         +vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=H1rAn7agXNY4SKWR1IHEUDfm7bTD4FsfGjzsnQ8t8wY=;
        b=Mjn/pUtG0jFo4TR7+6wRkuKhCUZ6Dc7hDB+GhUujEoe3Dl21TgKJHqu+rfjDkBH1Rj
         gVuiAcaAycNDE9gEQPtGIBSqO+aNwzgft8diKTHNIr8IZGmp5hn9RweHA5F5Qyl2wD+S
         +Tr3qxoRQJkkBpjOekzA5ocMvzH1OEXyZt9P+4tu1nrHArn2AapoAtsQRPa5DCOZ+vzO
         Kdk4vPeMpfM6cFDDgiMqq90wfFt4S+uuHVIlBXQJsCfF6DO78KV3zcoT16gfKxvS58yd
         rDjx0ozny+LCNoWTWDT6cRkFta4EBFYv2Tw3nUE3Wf5QVJeSnwg/9kctIReVEkexBgX/
         ka7Q==
X-Gm-Message-State: AOAM530tGdhmZA3PpISr5EpPQvPerev6vPHc4IZgGtxT/wXPZQjt1dDK
        G2cuS7CjsJssMxYuFjxyowimYOs6EcpG0g==
X-Google-Smtp-Source: ABdhPJwipn4axI3cqJczT1ezRfeeLaRwVQT+kfnfHtLORgAacul8FEuqzaPS5fpgrrnDFN07lEmZfw==
X-Received: by 2002:a05:6870:5708:b0:db:2ef8:f220 with SMTP id k8-20020a056870570800b000db2ef8f220mr10781289oap.198.1652537129831;
        Sat, 14 May 2022 07:05:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q14-20020a4a6c0e000000b00333301670dcsm2350996ooc.2.2022.05.14.07.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:05:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 14 May 2022 07:05:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G2UL SoC
Message-ID: <20220514140527.GA1318039@roeck-us.net>
References: <20220424071323.151757-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220424071323.151757-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Apr 24, 2022 at 08:13:23AM +0100, Biju Das wrote:
> Document RZ/G2UL WDT bindings. RZ/G2UL WDT is similar to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-wdt" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 59a48387e72d..84c008d956e4 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -21,6 +21,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - renesas,r9a07g043-wdt    # RZ/G2UL
>                - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
>                - renesas,r9a07g054-wdt    # RZ/V2L
>            - const: renesas,rzg2l-wdt
