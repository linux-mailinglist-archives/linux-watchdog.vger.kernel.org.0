Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915883A1D6F
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Jun 2021 21:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhFITGj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Jun 2021 15:06:39 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:36605 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhFITGj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Jun 2021 15:06:39 -0400
Received: by mail-ot1-f51.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so25008964otl.3;
        Wed, 09 Jun 2021 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FXSEcfB5SUcNxZP0MOeA1wAez5HsP1pj0Jjf8UKVWHY=;
        b=JCCgWqfs7qQn8jEgQYxvwda8trtx38SU/Nv9e8oZGbjF9CshLJNWWkX7e8jhtUWVsx
         wlyWuQc3itRTi7ajWwNcPQ3ec0qjecp/m0gkM/TkdE7ATKrWAWy4tuajkqy7c0n9rpey
         3e/en1fC9fzje22PazEAwM4H7jj1fJBf1ApgeFOKrAvJ/Kbg40snxE4DgnHoVy3vUF86
         79EGtKL/yQvazbfknmt3VAMq1W/PyG10TU+tS7s3UPHjJn+YWpm5KmppWnl5xSD1JWrY
         XU2ZJhrFL+20UgU6vy5S0aESQIQb+tVC9Xy03AdagZ8HKP42tYTuknEJwYSium9lU1Ce
         8NLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=FXSEcfB5SUcNxZP0MOeA1wAez5HsP1pj0Jjf8UKVWHY=;
        b=b3yfViebt2dUYgmiVYWaUj28gsRwcatWm55ViFO4e+QvdqDIg/JunFg5I6L6sEcGGJ
         Nkb3Fn8qLGMRZffkRm3UqbkgNf5Pniky6n33j5/LFvTTUEvExRUDVheIxWZYWv/mK/K9
         tX+WI/YJOBQ9Z2lVEgJam8ZdmX/jS/PYB6oQlfFFsPlsheWY/m/rzmEkgHpOIAuVUynd
         sYIAN06Zp4e6Wn3gyJtk+U2jN+Tpo511hL3U0uyJH+YARGdEt4sDn4FzlGSQco+PTgSs
         30QJb2DSTv++2XsBviHbeOhd9vUJaJVvgX499cQbGwNjLDQRyVZ29G2Y0a7cptTYcuAg
         m+zw==
X-Gm-Message-State: AOAM532nIdX+mYquR9kyApcrdR7Y0lB+C5uS2a3xsykKdWP1/J6QQl+Y
        YhfKs3vZs9/SG1vjg4+lod4=
X-Google-Smtp-Source: ABdhPJxk/8Iv7ad/klVIULIgyrhCmOs1GL+ozOHGVP+tfW2KZ4GyqhuognVhqSkP1E7tO2JB894rZw==
X-Received: by 2002:a9d:2f62:: with SMTP id h89mr712491otb.225.1623265423442;
        Wed, 09 Jun 2021 12:03:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 3sm166016otu.52.2021.06.09.12.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 12:03:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 12:03:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fu Wei <fu.wei@linaro.org>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: Convert arm,sbsa-gwdt to DT schema
Message-ID: <20210609190341.GB2534956@roeck-us.net>
References: <20210607194022.3095736-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607194022.3095736-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jun 07, 2021 at 02:40:22PM -0500, Rob Herring wrote:
> Convert the arm,sbsa-gwdt binding to DT schema format.
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Fu Wei <fu.wei@linaro.org>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../bindings/watchdog/arm,sbsa-gwdt.yaml      | 51 +++++++++++++++++++
>  .../bindings/watchdog/sbsa-gwdt.txt           | 31 -----------
>  2 files changed, 51 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml b/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
> new file mode 100644
> index 000000000000..6bfa46353c4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/arm,sbsa-gwdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SBSA (Server Base System Architecture) Generic Watchdog
> +
> +maintainers:
> +  - Fu Wei <fu.wei@linaro.org>
> +
> +description: |
> +  The SBSA Generic Watchdog Timer is used to force a reset of the system after
> +  two stages of timeout have elapsed. A detailed definition of the watchdog
> +  timer can be found in the ARM document: ARM-DEN-0029 - Server Base System
> +  Architecture (SBSA)
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    const: arm,sbsa-gwdt
> +
> +  reg:
> +    items:
> +      - description: Watchdog control frame
> +      - description: Refresh frame
> +
> +  interrupts:
> +    description: The Watchdog Signal 0 (WS0) SPI (Shared Peripheral Interrupt)
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +
> +    watchdog@2a440000 {
> +        compatible = "arm,sbsa-gwdt";
> +        reg = <0x2a440000 0x1000>,
> +              <0x2a450000 0x1000>;
> +        interrupts = <0 27 4>;
> +        timeout-sec = <30>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt b/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
> deleted file mode 100644
> index 6f2d5f91964d..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -* SBSA (Server Base System Architecture) Generic Watchdog
> -
> -The SBSA Generic Watchdog Timer is used to force a reset of the system
> -after two stages of timeout have elapsed.  A detailed definition of the
> -watchdog timer can be found in the ARM document: ARM-DEN-0029 - Server
> -Base System Architecture (SBSA)
> -
> -Required properties:
> -- compatible: Should at least contain "arm,sbsa-gwdt".
> -
> -- reg: Each entry specifies the base physical address of a register frame
> -  and the length of that frame; currently, two frames must be defined,
> -  in this order:
> -  1: Watchdog control frame;
> -  2: Refresh frame.
> -
> -- interrupts: Should contain the Watchdog Signal 0 (WS0) SPI (Shared
> -  Peripheral Interrupt) number of SBSA Generic Watchdog.
> -
> -Optional properties
> -- timeout-sec: Watchdog timeout values (in seconds).
> -
> -Example for FVP Foundation Model v8:
> -
> -watchdog@2a440000 {
> -	compatible = "arm,sbsa-gwdt";
> -	reg = <0x0 0x2a440000 0 0x1000>,
> -	      <0x0 0x2a450000 0 0x1000>;
> -	interrupts = <0 27 4>;
> -	timeout-sec = <30>;
> -};
> -- 
> 2.27.0
> 
