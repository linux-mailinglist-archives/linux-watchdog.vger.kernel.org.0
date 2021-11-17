Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AC2453FF3
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 06:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbhKQFY0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 00:24:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhKQFY0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 00:24:26 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3C8C061570;
        Tue, 16 Nov 2021 21:21:28 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id o4so3753079oia.10;
        Tue, 16 Nov 2021 21:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XzHFZqOT9RgbBtOPCevCltv7gDvLSlg00SfpeyNwR2c=;
        b=QDxGOrJsagNtjq3MzlcnnwkA3RbXavaxQdtAbUTeEcd3Vr1/pb5Bt3TXrdDvJ9Cqmu
         yPInVkYGP0GQj4JGQEiNxpF1TmhP4cEmxRmxbUBqrH1NtsUzx68nog0UteLftHJWAZT+
         q9820hhX6XeqcEfvebywldcE2XutHXVERnJPdxxwscfaoAZ2E1njdNKYcL9R9oZJGPhJ
         KIuduZRAjoaveh22itdCboME4mzkRlRi23IT0i+V9OumEPjhw24bBYeH7XOdDTfoXBLA
         E4sHtc78iFmmv+HdDQJiI+DsEqCElr3L+miokKAtqsc6o9X687eBF+PV8fYWHKFcLAmD
         fsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=XzHFZqOT9RgbBtOPCevCltv7gDvLSlg00SfpeyNwR2c=;
        b=HCEfJZgsb5RnPgVLghuL2E6ZpzllobtX1Ea2GlFuzUGjfHfhwfiNyoGggewOrZyTt5
         HEgmQb+/V9sWUWWEuPu79mJC2Nvioj1Q7vsMW6XBRHB7tOixZZpQ2BvKW7N6FFLd+Dxm
         LZAQy1xe/f8KWAEh6pripTZEjCT5pranje8/KXiL3MDF2gUH2+PIzaLs9l/wrJkCsE0D
         dW4DHKvGovGBzuIqhRmCVxJhJPwm0ebwSLDppsoH5JqFYIj35JmLRvsmiDFlstZw9Bf4
         dkE0WfK60oPOU/Be2GDmRtJavH+DfqOoy+zysAg2CdxvMuMiV/rocCXnHNPeSMoVX+i5
         qG6g==
X-Gm-Message-State: AOAM5338ziSoedhAkNvSXhT1WyWYDwIETz5j4dcSXk0DQhan/piv8lGC
        FECRsnV7peN6VfAUrY3Mc/kGoU80SR0=
X-Google-Smtp-Source: ABdhPJwBHbTLan8epw0Ppma7TJFBMyWelH09TcUyziyxEgOAFa59a5twe7YkEkR0nTCDbnT/VvqYMQ==
X-Received: by 2002:a54:4789:: with SMTP id o9mr58244239oic.74.1637126486985;
        Tue, 16 Nov 2021 21:21:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a16sm3902775otj.79.2021.11.16.21.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 21:21:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 16 Nov 2021 21:21:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Realtek Otto WDT binding
Message-ID: <20211117052125.GB215087@roeck-us.net>
References: <cover.1636018117.git.sander@svanheule.net>
 <62b3d83fcd56c46d070e7f2a9387fef2a2789499.1636018117.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62b3d83fcd56c46d070e7f2a9387fef2a2789499.1636018117.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 04, 2021 at 10:32:12AM +0100, Sander Vanheule wrote:
> Add a binding description for Realtek's watchdog timer as found on
> several of their MIPS-based SoCs (codenamed Otto), such as the RTL838x,
> RTL839x, and RTL930x series of switch SoCs.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> --

For the future, change log after '---', please.

> v2:
> - add realtek,rtl9300-wdt compatible
> - make interrupts property required
> - add Rob's Reviewed-by tag
> ---
>  .../bindings/watchdog/realtek,otto-wdt.yaml   | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
> new file mode 100644
> index 000000000000..11b220a5e0f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/realtek,otto-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek Otto watchdog timer
> +
> +maintainers:
> +  - Sander Vanheule <sander@svanheule.net>
> +
> +description: |
> +  The timer has two timeout phases. Both phases have a maximum duration of 32
> +  prescaled clock ticks, which is ca. 43s with a bus clock of 200MHz. The
> +  minimum duration of each phase is one tick. Each phase can trigger an
> +  interrupt, although the phase 2 interrupt will occur with the system reset.
> +  - Phase 1: During this phase, the WDT can be pinged to reset the timeout.
> +  - Phase 2: Starts after phase 1 has timed out, and only serves to give the
> +    system some time to clean up, or notify others that it's going to reset.
> +    During this phase, pinging the WDT has no effect, and a reset is
> +    unavoidable, unless the WDT is disabled.
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtl8380-wdt
> +      - realtek,rtl8390-wdt
> +      - realtek,rtl9300-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: interrupt specifier for pretimeout
> +      - description: interrupt specifier for timeout
> +
> +  interrupt-names:
> +    items:
> +      - const: phase1
> +      - const: phase2
> +
> +  realtek,reset-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      Specify how the system is reset after a timeout. Defaults to "cpu" if
> +      left unspecified.
> +    oneOf:
> +      - description: Reset the entire chip
> +        const: soc
> +      - description: |
> +          Reset the CPU and IPsec engine, but leave other peripherals untouched
> +        const: cpu
> +      - description: |
> +          Reset the execution pointer, but don't actually reset any hardware
> +        const: software
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +dependencies:
> +  interrupts: [ interrupt-names ]
> +
> +examples:
> +  - |
> +    watchdog: watchdog@3150 {
> +        compatible = "realtek,rtl8380-wdt";
> +        reg = <0x3150 0xc>;
> +
> +        realtek,reset-mode = "soc";
> +
> +        clocks = <&lxbus_clock>;
> +        timeout-sec = <20>;
> +
> +        interrupt-parent = <&rtlintc>;
> +        interrupt-names = "phase1", "phase2";
> +        interrupts = <19>, <18>;
> +    };
> +
> +...
> -- 
> 2.31.1
> 
