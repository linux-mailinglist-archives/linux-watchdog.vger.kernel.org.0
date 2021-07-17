Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6DF3CC3BF
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 Jul 2021 16:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233830AbhGQOLi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 17 Jul 2021 10:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbhGQOLi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 17 Jul 2021 10:11:38 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95903C06175F;
        Sat, 17 Jul 2021 07:08:40 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id z9so11788626qkg.5;
        Sat, 17 Jul 2021 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uzuuFiy7v8Z8GJw2BluwgIVx9Q3AwYTpXlZmYcbfAU0=;
        b=ZlcCWT3FWzMvmsNTWEvYIAnTHkmYsHLq6A5udlGvnlhF7yBIJnrZaa5V61cNMccEMh
         gfIexxtHu0kvhhydmsZ3Ed3laqvRILgIj301k/7b49nYOhuQ34oZrwl3WlzDikryyUSv
         JYW1FShPnek97TyoPBRmo18zn/tRJlAMBbymX7csYnYjF21VQAjUEKlI9//3QG/ek4wJ
         bVdOuNYtgwlG/rCCMOLMfH71bn8xj5AFSTGOl2+gQ6GF5OYP/DUPAakeoEXSOxfd/i9D
         oo2YKX8M087+tAt4S1BGX8a96YuaLZEVGcCjrXMD6EtQTlNUOz7TR5KgzxIqgWr17WP7
         OEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=uzuuFiy7v8Z8GJw2BluwgIVx9Q3AwYTpXlZmYcbfAU0=;
        b=rFbH2IJcOAsMYez9EPuVohIdQA/nUFVB7ecJeTE9dMivuyHAZeCJ4k7ITqK7CJwa5g
         dLXsQrYDMFJAH5p4LDR0Ruvamg5HODVsuAzgrmOGSp6/F33pzJ9g4WchMZDad+FHn8ag
         rTBafGFnUznWyKS0SVFDrkcJYEF4o8LXDFgR6RSWV+W3TH+75/8pVE6aXOEcMLIhnZq9
         28PCo3aXXM1Frafc6/Pv9kAtUrbsUDmuG581Cu9MmP1QYHqVPBY1YXvh9sKUQiFHVBET
         73T+yOhmBIkPh04KX8sQ4U7G3IcV6FtQgF0czRv4bky58fBRYlCPey1IPPt2DiQ7AzUI
         1pcg==
X-Gm-Message-State: AOAM533akeOJAxbnsKzESQOEFRSv/PJfk/XCpSXgaRs722c1AGlGVebA
        cLBXU24fImK3dk18TSWavzM=
X-Google-Smtp-Source: ABdhPJzTMI7guzZY/hlIXEJQs6LP03M7Nglqn4O1bRUG7nfdwTsgBevmE2x32HvkkKmCO5/h/CpQgA==
X-Received: by 2002:a05:620a:e12:: with SMTP id y18mr15271897qkm.106.1626530919823;
        Sat, 17 Jul 2021 07:08:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s81sm5191253qka.82.2021.07.17.07.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:08:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 17 Jul 2021 07:08:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add Maxim MAX63xx bindings
Message-ID: <20210717140838.GA857728@roeck-us.net>
References: <20210714153314.1004147-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714153314.1004147-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 14, 2021 at 05:33:13PM +0200, Linus Walleij wrote:
> This adds devicetree bindings for the Maxim MAX63xx watchdog
> timers.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../bindings/watchdog/maxim,max63xx.yaml      | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> new file mode 100644
> index 000000000000..f2105eedac2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/maxim,max63xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim 63xx Watchdog Timers
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Marc Zyngier <maz@kernel.org>
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: maxim,max6369
> +      - const: maxim,max6370
> +      - const: maxim,max6371
> +      - const: maxim,max6372
> +      - const: maxim,max6373
> +      - const: maxim,max6374
> +
> +  reg:
> +    description: This is a 1-byte memory-mapped address
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    wdt: watchdog@50000000 {
> +        compatible = "maxim,max6369";
> +        reg = <0x50000000 0x1>;
> +        timeout-sec = <10>;
> +    };
> +
> +...
> -- 
> 2.31.1
> 
