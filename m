Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542A0449908
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Nov 2021 17:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhKHQHm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Nov 2021 11:07:42 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:34680 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232136AbhKHQHm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Nov 2021 11:07:42 -0500
Received: by mail-ua1-f50.google.com with SMTP id b3so32532853uam.1;
        Mon, 08 Nov 2021 08:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WNd0nRET2KFu0g+CQKlMmSIy/neES2dkVOIw/yi259I=;
        b=KyOrxX9zyEgrC7OVKnHZCNtaxPbQKhxefVL2oG4MwFeYMNByeeg08fSONAF7ZGncoh
         LTHtOs7PsgLvT+H/M1um85brZbl/4pDSkuDXXd0V8gWPBLnH6kna6ncW+S/fNKSeTd/C
         rEPzqB0ayJOYMslb/S83qe2IyUQRmhcOtUZ3Xq4IGh4Fh3FQV90Eu+EEm7tP+8doxpNq
         h/62SHJRhmp06x9yjgi55+8aDX/gpHQvoJ3QnPH1UOG4ZfuMcRYarsRJYCPpugblEzfY
         OGap2OFBG4QZsCdfMUvp9rtBf36NlX48qKTtDkQ6HhM/POi0edyNe59RTVDcnUviuc7Q
         cT8Q==
X-Gm-Message-State: AOAM530boxuj1aGiH09/mTNYii+rnSBMJJiPI/kLpXdr/XezYJIPOyHm
        iJUcfB0Tzdux1tbDjaSNWGw5BdDWIIB5eHBw
X-Google-Smtp-Source: ABdhPJzQD1sGugsMPTNKgJKYcqnUU3GW59y2PdvGbaP0XOuHNTC4LAtQypGvHSBe6op6E77lFKt3qg==
X-Received: by 2002:ab0:3097:: with SMTP id h23mr66450ual.107.1636387496858;
        Mon, 08 Nov 2021 08:04:56 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id g187sm864396vsc.10.2021.11.08.08.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:04:56 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id p22so6768754vke.7;
        Mon, 08 Nov 2021 08:04:56 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr373301vko.7.1636387495375;
 Mon, 08 Nov 2021 08:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com> <20211104160858.15550-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211104160858.15550-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 17:04:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUj0Pd6ca3ma2c6C2n9t578KBRx+GdPEQnHPa3p9A0bvw@mail.gmail.com>
Message-ID: <CAMuHMdUj0Pd6ca3ma2c6C2n9t578KBRx+GdPEQnHPa3p9A0bvw@mail.gmail.com>
Subject: Re: [RFC 2/4] dt-bindings: watchdog: renesas,wdt: Add support for RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

On Thu, Nov 4, 2021 at 5:09 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Describe the WDT hardware in the RZ/G2L series.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml

> @@ -75,17 +79,49 @@ required:
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
> +            - description: Main clock
> +            - description: Register access clock
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: pclk

Usually we put the internal module clock first.

Please add (at least the first one):

     required:
       - clock-names
       - interrupt-names

> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        clocks:
> +          maxItems: 1
>
>  additionalProperties: false

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
