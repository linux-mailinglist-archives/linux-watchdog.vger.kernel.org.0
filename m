Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF72C461FF9
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Nov 2021 20:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349603AbhK2TRl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Nov 2021 14:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239442AbhK2TPl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Nov 2021 14:15:41 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464E2C05293C;
        Mon, 29 Nov 2021 07:33:42 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id q25so35410307oiw.0;
        Mon, 29 Nov 2021 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1NpJJxxsLe7XEOagDPhYXJdpe30GL1jTSYvPaf1NHno=;
        b=Pvb+GdFMFHXzIFzBVOJiFab5YB6C+tg2PsLlaKWNjPI5wHk90R9L8DLfZfLAb1uzv0
         0cx0EBIafs1RE69OLuybKf4f119+AvWTURSefjOeD/64AuRJCFV+VJ0SKzaEN+yUveBC
         AtRrV5kXPyfXcOeXiBMLhERB+nVOasDWW24jnrjXQhD73P6Fd9fE8pagNgUU1hu7CNKb
         oFKZVY/KfWNm+QcsvqBK29oM1b3Lu7AM9iZSqFbv9igs3f3vI9gArFo0Tv67n2t672e8
         A/kgYPiX94JTinlUNENROlu/Cd6JuBDi0A1elNuZhOctx9/A1uwSGExlRXjLbokqkYby
         wJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=1NpJJxxsLe7XEOagDPhYXJdpe30GL1jTSYvPaf1NHno=;
        b=7sEgiIe6T42JBc/pWlqrpLIkGVHM1KeEW/U4PqqN66TNzqcUQ98rts5f3RE412hHAR
         FSgtBaO0DQuL6fPA3PREbPj6jiXQrNUH3msXZvD1DNTF0evWm+/+78kcIxaGVLflwyAk
         KcxuR2nKWnPBwwRVKGWvSKmiNyKTuIpKc0ntfpB7XnHbrvTdT6kYIrAe9809+3wNpkSs
         JGO1cNgGvp1KP31mHYinlcQBCU+YEED0ZptiZFw0K6dVVDwNjRC67akMET3pouXOhkM1
         +S+LUX9JUNV2cDjDuT/IG/6f6MzHSuGRWkADlyws0ZaUY8BGl2EaxVZKGguM0G2L17aV
         /Y8g==
X-Gm-Message-State: AOAM531o8GQDobzD7P3ut4KpYCnZmq4gM4OdvNI6birw5qoOZ9S1rvDn
        5u6hkp1Ijy9eP8N+Ix/3MdM=
X-Google-Smtp-Source: ABdhPJy1uAfkkB2V6N2JphvgmoYK8jnWjNL0FQjdwyD31NLa90UtuuRex27e/8NnH2aGQN4RpCx69Q==
X-Received: by 2002:a05:6808:210c:: with SMTP id r12mr40118898oiw.104.1638200021658;
        Mon, 29 Nov 2021 07:33:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e3sm2706918otk.71.2021.11.29.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 07:33:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 29 Nov 2021 07:33:39 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: renesas,wdt: Add support
 for RZ/G2L
Message-ID: <20211129153339.GA2661363@roeck-us.net>
References: <20211122113554.15990-1-biju.das.jz@bp.renesas.com>
 <20211122113554.15990-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122113554.15990-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 22, 2021 at 11:35:53AM +0000, Biju Das wrote:
> Describe the WDT hardware in the RZ/G2L series.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> V2->v3:
>  * No change.
> V1->V2:
>  * No Change
> RFC->V1:
>  * Added clock-names and interrupt-names as required properties for RZ/G2L
>  * Re-order clocknames with internal module clock first
> ---
>  .../bindings/watchdog/renesas,wdt.yaml        | 75 ++++++++++++++-----
>  1 file changed, 57 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index ab66d3f0c476..91a98ccd4226 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -10,9 +10,6 @@ maintainers:
>    - Wolfram Sang <wsa+renesas@sang-engineering.com>
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>  
> -allOf:
> -  - $ref: "watchdog.yaml#"
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -22,6 +19,11 @@ properties:
>                - renesas,r7s9210-wdt      # RZ/A2
>            - const: renesas,rza-wdt       # RZ/A
>  
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> +          - const: renesas,rzg2l-wdt     # RZ/G2L
> +
>        - items:
>            - enum:
>                - renesas,r8a7742-wdt      # RZ/G1H
> @@ -56,11 +58,13 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    maxItems: 1
> +  interrupts: true
>  
> -  clocks:
> -    maxItems: 1
> +  interrupt-names: true
> +
> +  clocks: true
> +
> +  clock-names: true
>  
>    power-domains:
>      maxItems: 1
> @@ -75,17 +79,52 @@ required:
>    - reg
>    - clocks
>  
> -if:
> -  not:
> -    properties:
> -      compatible:
> -        contains:
> -          enum:
> -            - renesas,rza-wdt
> -then:
> -  required:
> -    - power-domains
> -    - resets
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - renesas,rza-wdt
> +    then:
> +      required:
> +        - power-domains
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rzg2l-wdt
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: wdt
> +            - const: perrout
> +        clocks:
> +          items:
> +            - description: Register access clock
> +            - description: Main clock
> +        clock-names:
> +          items:
> +            - const: pclk
> +            - const: oscclk
> +      required:
> +        - clock-names
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        clocks:
> +          maxItems: 1
>  
>  additionalProperties: false
>  
> -- 
> 2.17.1
> 
