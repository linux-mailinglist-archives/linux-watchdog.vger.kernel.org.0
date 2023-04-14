Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7EDF6E21ED
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Apr 2023 13:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjDNLVj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Apr 2023 07:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjDNLVi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Apr 2023 07:21:38 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12080CF
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Apr 2023 04:21:37 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94eb65068caso83717066b.3
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Apr 2023 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681471295; x=1684063295;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWP16bG6uUr4pZjxU30nkO7zZOcUfB3YuG/344uIKNQ=;
        b=RS8Qhvt0joORbhPMbnrHe/IfmdjZ0uOTbrgCAmyBIgJ5m26eaqgonnlIyIeCxGL9Ry
         Sl5gOj9wsiAhkE1cmGC6DaE34pv5pyCSiV/ZeNaM0JMVh1ECH85kt4poSz76UCYPNF1O
         HI74UMYeOXFuaN5HwrTSGIMBX6C1tsDTKffPckyIBy4eNsgM3gfRRVmcd2Q9PfPUs9Ly
         nf0LEgk3MucrjFbylGBnuuPseNh6ewCWhS8Q25+/VTqwf6eo3Eex062iKP4pMjEq1AVQ
         z8DaOgVsAh1uAMsr4HY5m+nIVMOF7FyVIcgoLkMSxKQfSthOyXohvPvW/gSwIQMb0TzF
         TN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681471295; x=1684063295;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWP16bG6uUr4pZjxU30nkO7zZOcUfB3YuG/344uIKNQ=;
        b=Ol48LUU5QfCPs8dPuRANwdMK8rj2d/Jx4DXZ7PiNOPYlQoxiNuN+VrDUUpm90Y9JZT
         UZSoDKKvL3DRZ0js1603wTojyvQk863piE6QyjMyL/h177d1ahA9v9bENMajnvFJbuZD
         ER5/FzFh8TGPvjW8Ga4AFqMkgP2ysR8A5b17ETHYS9OyR04PnA/2iSxnqcCPM7qOOk2L
         /qPSzlcE1s8z1pmQTkM4a0iJcbx+4X57TOm+b7JSuImknzrll45oJ9zYgKYqXowECSwa
         OZmlZT1N+VG+g0iTTlMT/LPGkoplKpcxP8ezX/nDAD/DNtxr1vetGzGERYmk9IIDasvy
         XEhQ==
X-Gm-Message-State: AAQBX9cFrnIHsS9muLSnH+cBtc8f1ZRcANC7GDDS+ODNGp2Wi2kLZaiB
        TP2jQBY8LrImyNWWeOaFlBSQsA==
X-Google-Smtp-Source: AKy350aEZXq5vhpbcuIVMGc02L1mtWNHGPAkZUnP5pk7APNWBHnrMhr1AOTOpXrDzGDBYgbb0dLnkA==
X-Received: by 2002:a50:ec84:0:b0:506:74d6:45aa with SMTP id e4-20020a50ec84000000b0050674d645aamr5212418edr.24.1681471295533;
        Fri, 14 Apr 2023 04:21:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:40b9:8c57:b112:651d? ([2a02:810d:15c0:828:40b9:8c57:b112:651d])
        by smtp.gmail.com with ESMTPSA id b11-20020a17090636cb00b00930aa50372csm2326194ejc.43.2023.04.14.04.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 04:21:35 -0700 (PDT)
Message-ID: <a5aa1be1-f98d-af04-9879-b924a5bcb14c@linaro.org>
Date:   Fri, 14 Apr 2023 13:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: marvell octeonTX2 GTI system
 atchdog driver
Content-Language: en-US
To:     Bharat Bhushan <bbhushan2@marvell.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230414102342.23696-1-bbhushan2@marvell.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414102342.23696-1-bbhushan2@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 14/04/2023 12:23, Bharat Bhushan wrote:
> Add binding documentation for the Marvell octeonTX2
> GTI system watchdog driver.

Subject: typo: atchdog

> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
>  .../watchdog/marvell-octeontx2-wdt.yaml       | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/marvell-octeontx2-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/marvell-octeontx2-wdt.yaml b/Documentation/devicetree/bindings/watchdog/marvell-octeontx2-wdt.yaml
> new file mode 100644
> index 000000000000..e509f26c61b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/marvell-octeontx2-wdt.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/marvell-octeontx2-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell OcteonTX2 GTI system watchdog
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +maintainers:
> +  - Bharat Bhushan <bbhushan2@marvell.com>
> +
> +properties:
> +  compatible:
> +    const: marvell-octeontx2-wdt

That's not correct compatible. marvell is a vendor prefix.

Did you test the bindings before sending?

> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      OcteonTX2 GTI system watchdog register space

Drop description, it is obvious.

> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      OcteonTX2 GTI system watchdog interrupt number

Ditto

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false

unevaluatedProperties: false instead

> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        watchdog@802000040000 {
> +          compatible = "marvell-octeontx2-wdt";
> +          reg = <0x8020 0x40000 0x0 0x20000>;

Are you sure that this is correct DTS? 32-bit numbers are usually
8-digit long. Plus size of 0x20000 is crazy huge. And the unit address
is a bit unusual. Are you sure dtc W=1 does not say about any errors in
your DTS?


> +          interrupts = <0 38 1>;

Use defines for common flags.

> +        };
> +    };
> +
> +...

Best regards,
Krzysztof

