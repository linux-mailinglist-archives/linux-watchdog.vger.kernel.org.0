Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91806AED9B
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Mar 2023 19:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjCGSF5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Mar 2023 13:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjCGSFh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Mar 2023 13:05:37 -0500
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FCEA1012;
        Tue,  7 Mar 2023 09:58:38 -0800 (PST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-176b48a9a05so8487997fac.0;
        Tue, 07 Mar 2023 09:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678211915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7Dj956z7zlWgar9S6Lis3J9Q3P6kOtz+RnDkzL7hwk=;
        b=JH9f3ubVIpHZlVZS3/FdKRZy7OFbB04pOcOdkX6NzYHugyQUvy7Cm7DCPJAVMKZDbQ
         xR/mBDW0v5HctbFTZ4GNx+6iYIVKcescKxzw3s2GnA7wfl5NvlFuc8jtmTqZdu18Y473
         mOW7cQvlrpI1u+5szD2fA4zt0g1xbtP6pqRz/3/XDy6XIowNdMBWM4143O2PElXmYKmw
         Gcv1b0ZrCA5xN4xkgaQXSmMWo5Sf0REnWVyeQvPnZdMdPsDlWqizPYF0Vrc3PCbEdfD6
         q9+8qIUREhTuoHHp1hBJLkj0M/61Xn3qYkvCJjcBXnVJkiuvDLcF88LjqK/PfUEZiqSw
         A1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678211915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7Dj956z7zlWgar9S6Lis3J9Q3P6kOtz+RnDkzL7hwk=;
        b=E/VYK5F+zHviSS4GUvdFDJt4tHPVQwGeAVoaHr9Uc7YWXWAsFW+TNOf6Mq+yjHA0Gj
         Uup4VAT2BXsczEDt1kEJwlTDEy1C34QV7pejksm5+OT7W4EtoAt4/qDewlYvKmIGhU8B
         zbyit4SHkJta4HdnROlmDEq0iGCHIYP+t2xPYokSnExGP6gK/ZHDGBTHcVcD0PWZtQPk
         2tPxDlc3UnXLiry/c8kfCZJlthnG2QbypqzsK2aCugYzvpwA4QJdNPw4hNWU8AzgCbuF
         fqTlZdT1AaeNavmSc5gMiNgJdTbu/nc2fL6VkfPITi5h0oxaBSG8reQfC5N4hVIiewqF
         wS9w==
X-Gm-Message-State: AO0yUKXg2MbN7xxm8gqlnODh0ufyCBT1+QPRuZ0L394xgZVyfae0lXJs
        ugVJa1TXU2g3gMUYljojl4+9/doP3YU=
X-Google-Smtp-Source: AK7set+8sgZzLXe6OxGMtrBOVojQfoKc7RKmMe8VookJMCejPnhNvEahzce35WEOND5QL/cY1vtyLw==
X-Received: by 2002:a05:6870:3a06:b0:176:3218:a837 with SMTP id du6-20020a0568703a0600b001763218a837mr7467248oab.16.1678211915625;
        Tue, 07 Mar 2023 09:58:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6-20020a056870020600b001723f29f6e2sm2073271oad.37.2023.03.07.09.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:58:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Mar 2023 09:58:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        wim@linux-watchdog.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v3] dt-bindings: watchdog: migrate rt2880 text bindings
 to YAML
Message-ID: <96b9712e-3c89-4425-9f34-580ff76aeec9@roeck-us.net>
References: <20230302085914.2858645-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302085914.2858645-1-sergio.paracuellos@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 02, 2023 at 09:59:14AM +0100, Sergio Paracuellos wrote:
> Ralink RT2880 Watchdog bindings used text format, so migrate them to YAML.
> There are some additions to the binding that were not in the original
> txt file. This binding is used in RT2880, RT3050, RT3352, RT3883, RT5350,
> and MT7620 SoCs. To properly align binding with driver code we need to add
> to the schema 'clocks' and 'resets' properties.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>  - Re-do commit message.
>  - add 'clocks' property and update example using it.
>  - drop 'reset-names'.
>  - Use 'unevaluatedProperties' instead of 'additionalProperties'.
> 
> Changes in v2:
>  - Fix reg address and size in example.
> 
>  .../bindings/watchdog/ralink,rt2880-wdt.yaml  | 46 +++++++++++++++++++
>  .../bindings/watchdog/rt2880-wdt.txt          | 18 --------
>  2 files changed, 46 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
> new file mode 100644
> index 000000000000..51e00de947e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/ralink,rt2880-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ralink Watchdog Timers
> +
> +maintainers:
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    const: ralink,rt2880-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
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
> +    watchdog@100 {
> +      compatible = "ralink,rt2880-wdt";
> +      reg = <0x120 0x10>;
> +      clocks = <&clkref>;
> +      resets = <&rstctrl 8>;
> +      interrupt-parent = <&intc>;
> +      interrupts = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt b/Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt
> deleted file mode 100644
> index 05b95bfa2a89..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Ralink Watchdog Timers
> -
> -Required properties:
> -- compatible: must be "ralink,rt2880-wdt"
> -- reg: physical base address of the controller and length of the register range
> -
> -Optional properties:
> -- interrupts: Specify the INTC interrupt number
> -
> -Example:
> -
> -	watchdog@120 {
> -		compatible = "ralink,rt2880-wdt";
> -		reg = <0x120 0x10>;
> -
> -		interrupt-parent = <&intc>;
> -		interrupts = <1>;
> -	};
