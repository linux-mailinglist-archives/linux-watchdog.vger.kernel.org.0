Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711B36FBFA4
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 May 2023 08:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234725AbjEIGxg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 May 2023 02:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbjEIGxO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 May 2023 02:53:14 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3BBAD33
        for <linux-watchdog@vger.kernel.org>; Mon,  8 May 2023 23:53:11 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9659f452148so959149966b.1
        for <linux-watchdog@vger.kernel.org>; Mon, 08 May 2023 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615190; x=1686207190;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gVYUKUESgFg4JXOzPAjSxRkiRFFRfIKte714mnZ86g=;
        b=c6t/rIcOSaiWGIGAtBLzqVuVk9Tev5gB7eF4xFTFUhOi0kSla9f4WBJwTRzrLOciJD
         500GH/iS3kNjYz706tol8X20Y24nEbupifwz3mAUfPV41FtfXb4E3M45vsohor9cgGjE
         KXdYuDF/t5oNhWc/aB8QM7Pb5Bf43mNsFLOOTfqw43mu/L/PiuVl2YSHSut9WEf1Upy2
         zuEnCTC0Ac514nEsQyhcC4Lfzz5kHyInlYyxy5Wg+X2AOKWKwdSoP5EUhaeQ/vna+nR9
         YUJ5fVqSoTGM2jHMOQi++2a8WPWZjLP24XfmWAFP6gucd7fFvhNsxcIeFlzUUJsP/SP0
         dd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615190; x=1686207190;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gVYUKUESgFg4JXOzPAjSxRkiRFFRfIKte714mnZ86g=;
        b=ZKjEDJcWkl/bRcfs+obtRXhiq47DXfUG8waM4P2M2Tdy77Eu3s+PFAf5Dv4WhKcaLf
         DTxg0l96XGN4yl9DWjYqoUSKY8Y+2KLAfbrvOBwST+FAOaF/badcW35frLbzplffRGPQ
         M760Lj0xx+ZneJzGOQcpvwB5cKHRV5VJTj1Ywo2p7jE95HW9R4pPHH32HW0Aj8QwDQLv
         x4ko9QJvj7YqO75tabdqreQ5GyF9Kv0XUZcdMN+WBWa/wH7mKWXfvFXRVRU2SlW50bxk
         xQ6x798pIJZ5MbenUou9lC/dqm73rcdPhZnfr1hAGOcqTItsA9pXgoNYobJexVuD9/er
         aAiw==
X-Gm-Message-State: AC+VfDxYaNduV7Cc+8/J50xyqiqEddxUZtmSbMF6k5vDPZ+NpNagvhWn
        QSc9Oa7QVe5a/CRiGoGmkUjg2A==
X-Google-Smtp-Source: ACHHUZ65+L9lC22HwIp27k17nrs3SAtXzR1jYOlboAXf/p55Rd9BcjSN9Y21U+KDgvJ5kmk0VHWD6g==
X-Received: by 2002:a17:907:1b29:b0:94f:2d5f:6949 with SMTP id mp41-20020a1709071b2900b0094f2d5f6949mr12526827ejc.42.1683615189883;
        Mon, 08 May 2023 23:53:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id hz17-20020a1709072cf100b009664e25c425sm933807ejc.95.2023.05.08.23.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 23:53:09 -0700 (PDT)
Message-ID: <ea9ae4c9-2808-bf22-70a3-bb7e7b1168d0@linaro.org>
Date:   Tue, 9 May 2023 08:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2 v7] dt-bindings: watchdog: marvell GTI system watchdog
 driver
Content-Language: en-US
To:     Bharat Bhushan <bbhushan2@marvell.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sgoutham@marvell.com
References: <20230508131515.19403-1-bbhushan2@marvell.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508131515.19403-1-bbhushan2@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08/05/2023 15:15, Bharat Bhushan wrote:
> Add binding documentation for the Marvell GTI system
> watchdog driver.
> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
> v7:
>  - Corrected compatible to have soc name
>  - Converted marvell,wdt-timer-index to optional
> 
>  .../watchdog/marvell,octeontx2-wdt.yaml       | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/marvell,octeontx2-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/marvell,octeontx2-wdt.yaml b/Documentation/devicetree/bindings/watchdog/marvell,octeontx2-wdt.yaml
> new file mode 100644
> index 000000000000..72951b10f1f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/marvell,octeontx2-wdt.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/marvell,octeontx2-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Global Timer (GTI) system watchdog
> +
> +allOf:
> +  - $ref: watchdog.yaml#

Put allOf after maintainers:.

> +
> +maintainers:
> +  - Bharat Bhushan <bbhushan2@marvell.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: marvell,octeontx2-wdt

Why is this alone? Judging by the enum below, octeontx2 is not specific.

> +      - items:
> +          - enum:
> +              - marvell,octeontx2-95xx-wdt
> +              - marvell,octeontx2-96xx-wdt
> +              - marvell,octeontx2-98xx-wdt

We don't allow wildcards in general

> +          - const: marvell,octeontx2-wdt
> +      - const: marvell,cn10k-wdt

Same question - why is this alone?

Second question - it should be rather part of enum with the first one if
accepted.

> +      - items:
> +          - enum:
> +              - marvell,cn10kx-wdt
> +              - marvell,cnf10kx-wdt
> +          - const: marvell,cn10k-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

maxItems instead. You see it is different than above properties?

> +
> +  clock-names:
> +    minItems: 1

Need to define names.

Best regards,
Krzysztof

