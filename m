Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22FFA5B3AF9
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Sep 2022 16:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbiIIOot (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Sep 2022 10:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbiIIOok (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Sep 2022 10:44:40 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66899D68;
        Fri,  9 Sep 2022 07:44:25 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b144so1859885pfb.7;
        Fri, 09 Sep 2022 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=JwpogmzKpFPJvP8h2Z1mQPxrdy62RLNQd+TYcZ7zSbE=;
        b=joJJGXz0U4E0gIubhJhO2WG0Cwjl6mgRNJpuDkms8LVHpNU1IU0RAnobRA8b/RQHAN
         e9ImhOtcUMP9Fifd9Vi+2iLAavOVHD40+bxbWjPUcuyOiL21WUnuHkpLixUJgvo1+K68
         vbouwFTO7TrJKGU9MHfkJ64fawf0bND5o2whrLUf+WOr1UGvhvQOpsJUxiwr+J1W+ykm
         BoABuseR+znNzBBo5v42KEPky8a0jqTfO/yynRcnTzDXtReTr/bJb6bFmd0FExd0iDjG
         R/ZNrKJbd6hlKI6G+EvLZGiQ5gi8gZ70wD38K+nTX8cyTkdjYU5XPZUq+DV2i70hqbtA
         K/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=JwpogmzKpFPJvP8h2Z1mQPxrdy62RLNQd+TYcZ7zSbE=;
        b=NeIZWe66fs7HtnMx7DfJgucfXLaH79/yb+w1HXMEKmvPsi2j+NRN/fb3SVA4gQj0Ha
         5Y1eFBTik9KPh2PlPnY5+lNf3GfD3dg5a0VEn2Km/2XFBV5OlVLHqnXR+QodJygye+di
         H4m4t3B9SZdUE8urwcS+yF0kDq8k2Qx0FOJ2gUbktIeyt843UvGM0NMRS9IKi+Hbb0U+
         cnHOEF7MtRLATFRgnlVE6bgZcEF2csDP/3jJjwxeM1l2aO52dNNJtt6cvDVMqx25phHI
         BDcwI7T/ew4yAskByj20iVGDlxfabSp5Ots1yTQgrs1xw8AHTsD5C59+kAUJtrEUU/tJ
         piKw==
X-Gm-Message-State: ACgBeo2dC8vDJ9lT4z7C8/AfmFGeaaNNncSU9H6tnfhkKvKAEXtkDVtg
        674hYxxp9uwNeQv9fVx8yTY=
X-Google-Smtp-Source: AA6agR5BRNiy5DuY7qYIc8SOSaZWIyXS0/+us37cIkezr95VmsQyotpDWLyM9Bq5KqtQtJeaf1xU3g==
X-Received: by 2002:a65:590d:0:b0:434:bb83:26bf with SMTP id f13-20020a65590d000000b00434bb8326bfmr12020030pgu.581.1662734664474;
        Fri, 09 Sep 2022 07:44:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b00176b63535adsm545351plc.260.2022.09.09.07.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 07:44:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b1e73db6-fa52-26d1-4080-667c21e1b00d@roeck-us.net>
Date:   Fri, 9 Sep 2022 07:44:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Add r8a779g0 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Thanh Quan <thanh.quan.xn@renesas.com>
References: <e3a246be066d5e9c2231285bc1488fc12866cf5d.1662714387.git.geert+renesas@glider.be>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <e3a246be066d5e9c2231285bc1488fc12866cf5d.1662714387.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/9/22 02:08, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Document support for the Watchdog Timer (WDT) Controller in the Renesas
> R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index a8d7dde5271b8f2f..b2647bbaa19ce6c8 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -65,6 +65,7 @@ properties:
>             - enum:
>                 - renesas,r8a779a0-wdt     # R-Car V3U
>                 - renesas,r8a779f0-wdt     # R-Car S4-8
> +              - renesas,r8a779g0-wdt     # R-Car V4H
>             - const: renesas,rcar-gen4-wdt # R-Car Gen4
>   
>     reg:

