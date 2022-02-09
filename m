Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1604AFCF1
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Feb 2022 20:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiBITLE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Feb 2022 14:11:04 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbiBITKw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Feb 2022 14:10:52 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF384C043182;
        Wed,  9 Feb 2022 11:10:44 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id q8so3497745oiw.7;
        Wed, 09 Feb 2022 11:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uGBQszRjKuZjfc1lBS7mhBr8HyjSkkpwuKdOPsga/3M=;
        b=pKv8+XFK13RTaXtbIjs3u6u9nWC7A35k42HB8hxxuTqp4989vPgqUrpWBqwt+IPPhx
         UIhLVgAhXlbmjByENR73CskQa2Mp8fTgUVpQZUx2OKj5HtD//csGDVmt4lPM/aGJDOGU
         Z5rBOnVgTFUSVeRTQzw5GC2fc/UYoP+6uNXBwC94fcSLj0gYTPrXpvXJXMljIkGRO+Li
         nsTngiIMZ7luSEF10iYSOQxQhbfksEUgGr+zyRt0/tVZJx1kJvEhLf+0vxLJp8+m+az7
         rStMBbt7zZXMC4dndWQoHoZuYLDgHolElm7PjlmevYs89B6qxOr//aUDuxHttrx45YXd
         IR8w==
X-Gm-Message-State: AOAM533/W8MDnmxxedj0Et1GxTCxQx6e7mRNpaqbsuiyH1emY03yPV5c
        MVlRl9HYQ9zXI+Z69q/lww==
X-Google-Smtp-Source: ABdhPJzpD9FzpWjsNjCly3kjImd1uYrlVR8YlnuOwd+KPQyw5wIjoOhj08QDwExTKNuhrLRLVlIcwg==
X-Received: by 2002:a05:6808:218f:: with SMTP id be15mr1691567oib.136.1644433772303;
        Wed, 09 Feb 2022 11:09:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r204sm7155587oih.1.2022.02.09.11.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 11:09:31 -0800 (PST)
Received: (nullmailer pid 709550 invoked by uid 1000);
        Wed, 09 Feb 2022 19:09:30 -0000
Date:   Wed, 9 Feb 2022 13:09:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: watchdog: brcm,bcm7038: add more
 compatible strings
Message-ID: <YgQRam1RFim1AMMf@robh.at.kernel.org>
References: <20220126132116.11070-1-zajec5@gmail.com>
 <20220126222034.16889-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220126222034.16889-1-zajec5@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 26, 2022 at 11:20:34PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This hardware block is used on almost all BCM63xx family chipsets and
> BCM4908 which reuses a lot of BCM63xx parts. Add relevant compatible
> strings and also include a generic one.
> 
> The only SoC with a different block I found is BCM6838 (thus not included
> in this change).
> 
> It may be worth noting that BCM6338, BCM6345, BCM6348 and BCM63268 don't
> include "SoftRst" register but that can be handled by drivers based on
> precise compatible string.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Sort enum entries & update brcm,twd.yaml
> ---
>  .../devicetree/bindings/mfd/brcm,twd.yaml     |  2 +-
>  .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 21 +++++++++++++++----
>  2 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> index 634526f790b8..3f5db1990aba 100644
> --- a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> +++ b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> @@ -55,7 +55,7 @@ examples:
>          #size-cells = <1>;
>  
>          watchdog@28 {
> -            compatible = "brcm,bcm7038-wdt";
> +            compatible = "brcm,bcm4908-wdt", "brcm,bcm63xx-wdt";
>              reg = <0x28 0x8>;
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> index a926809352b8..4d848442913c 100644
> --- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> @@ -16,9 +16,22 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - brcm,bcm6345-wdt
> -      - brcm,bcm7038-wdt
> +    items:
> +      - enum:
> +          - brcm,bcm4908-wdt
> +          - brcm,bcm6338-wdt
> +          - brcm,bcm6345-wdt
> +          - brcm,bcm6348-wdt
> +          - brcm,bcm6848-wdt
> +          - brcm,bcm6858-wdt
> +          - brcm,bcm7038-wdt
> +          - brcm,bcm60333-wdt
> +          - brcm,bcm63138-wdt
> +          - brcm,bcm63148-wdt
> +          - brcm,bcm63268-wdt
> +          - brcm,bcm63381-wdt
> +          - brcm,bcm68360-wdt
> +      - const: brcm,bcm63xx-wdt

Is it really worthwhile to update all these DTs?:

arch/mips/boot/dts/brcm/bcm63268.dtsi:                  compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm6328.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm6358.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm6362.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm6368.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm7125.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm7346.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm7358.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm7360.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm7362.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm7420.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm7425.dtsi:                   compatible = "brcm,bcm7038-wdt";
arch/mips/boot/dts/brcm/bcm7435.dtsi:                   compatible = "brcm,bcm7038-wdt";

I don't think so.

Rob
