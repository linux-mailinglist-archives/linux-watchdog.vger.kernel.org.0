Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC24F5EB2EB
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Sep 2022 23:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiIZVQO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Sep 2022 17:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiIZVQN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Sep 2022 17:16:13 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE9511453;
        Mon, 26 Sep 2022 14:16:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id u59-20020a17090a51c100b00205d3c44162so578843pjh.2;
        Mon, 26 Sep 2022 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=PSWyEqrLpjvJMT11H3kIdDppGDVWa/GJ7SLb23VdZCI=;
        b=fD1C+rSNYGvvR93L5HWufdJ9zt1U0kSdl5m2WoCR68x+9eJ/GRUEHTU/QcyX1A5Sw6
         o4OL4Wdhxy5qxXVni6MySMCaSNLn64y0aMyXznL3ThOUnJCeF+MZ2/ZhDtJt4YLLhqWs
         v6l7rV8rNtylKAg8wEk+ORcpRJDf9dGCKChB52laHB4ZDHpwUZEtkfmT5vS4syFCd8e5
         yStxxo9nlPaoZZVVHqp1ZHX27vFrBbYZptqNBZwyCeDtPWydrTvclJGXpx/Wx9Ws0ja+
         IdClX81JfQQsWsXTpTmjVhw+lY9eFo2Z7/pCaErqkTktoeJLs+TxoOIIGnln4EG9VCly
         RWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PSWyEqrLpjvJMT11H3kIdDppGDVWa/GJ7SLb23VdZCI=;
        b=v34L5Xr1CbvAVHely+u4VRovKUkH8QsBg/W+VOESx45JIUqMo5HBsatRNxQj1wJDk5
         Lck2UoillkyXIOW5kPQurz5gVZow/S7kHkruJYVC+YWIDSrAjtnhwoGIAkjZtA8AXoIS
         IHaUI6+8ASDMwFujKjy5C/n2QZsdUIeLNMtIeMOMAl4awKhrXnY7PUfFLxP3izI+uRQf
         EX0OKX9lXJaaU1UzNnGx/6QZPcN9SayALR3K1c4f4jmIWaZLJQ2AT/gYAwqUsVlhA724
         TPOZdA5I5RcStM4pTPmxrpTdlmLm7WsPZy7m2jxmkYecWCiBQQER2DNSotKCxs0v79vf
         As1w==
X-Gm-Message-State: ACrzQf0mmEogfd6mFwFiGncowzGXUpvxr1MS/VLKBpEPA8GsIbUR/SuP
        i7HgqOor5onhq9XxjY/YI5rZIM5Qpn/lGg==
X-Google-Smtp-Source: AMsMyM7bg56APRC1DTJLcg2XfPIQ9QUnMOiRUOJPJNZVmhYhDz4DhXYASepap7tg/1JuxVyQQMPkKQ==
X-Received: by 2002:a17:902:b70a:b0:178:9491:3ab4 with SMTP id d10-20020a170902b70a00b0017894913ab4mr24033759pls.55.1664226971529;
        Mon, 26 Sep 2022 14:16:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z13-20020a170903018d00b001768452d4d7sm11720728plg.14.2022.09.26.14.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 14:16:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 26 Sep 2022 14:16:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wim@linux-watchdog.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v2] dt-bindings: watchdog: migrate mt7621 text
 bindings to YAML
Message-ID: <20220926211508.GA682626@roeck-us.net>
References: <20220926162549.805108-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926162549.805108-1-sergio.paracuellos@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Sep 26, 2022 at 06:25:49PM +0200, Sergio Paracuellos wrote:
> Soc Mt7621 Watchdog bindings used text format, so migrate them to YAML.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2 RESEND:
> - Resent sending also to watchdog maintainers.
> 
> Changes in v2:
>  - Rebase onto last kernel version.
>  - Add Krzysztof Reviewed-by tag.º
> 
>  .../watchdog/mediatek,mt7621-wdt.yaml         | 33 +++++++++++++++++++
>  .../bindings/watchdog/mt7621-wdt.txt          | 12 -------
>  2 files changed, 33 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
> new file mode 100644
> index 000000000000..b2b17fdf4e39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/mediatek,mt7621-wdt.yaml#
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
> +    const: mediatek,mt7621-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    watchdog@100 {
> +      compatible = "mediatek,mt7621-wdt";
> +      reg = <0x100 0x100>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt b/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
> deleted file mode 100644
> index c15ef0ef609f..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Ralink Watchdog Timers
> -
> -Required properties:
> -- compatible: must be "mediatek,mt7621-wdt"
> -- reg: physical base address of the controller and length of the register range
> -
> -Example:
> -
> -	watchdog@100 {
> -		compatible = "mediatek,mt7621-wdt";
> -		reg = <0x100 0x10>;
> -	};
