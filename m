Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE514B277B
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Feb 2022 15:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350681AbiBKOAa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Feb 2022 09:00:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345700AbiBKOA3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Feb 2022 09:00:29 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B85386
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Feb 2022 06:00:26 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 350713F4B4
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Feb 2022 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644588022;
        bh=rjkrR5XxQmo1qZPV6d9L8Q/uhIi2chbUs/Ji4gNgrnM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Z+TlSPiLb79aHAzHIZmWMvPR+H95w6lV6+CTBslm430NoPJv4G0l45Z0cqJNnp66d
         xCCAB5unoE9h6om4JQlf18akH6I/ouqkiRX23SmD3ZtZNwgjfx9l5DeuIhZwjYpekF
         w1Vn1sqzeBPQAgAgOGHCxXnefEfwCHu3uFgeIZf7kpxEdZTuCAlYiSiYGbgIW2IMTh
         1juAIYPQvfhuDOvxXwxcFzou2C7e6OmqGslaBBCzb1/AhzBOVAhxHm9R1IZTLuXCCp
         rFwX3MIkMzZ0UzUi8V/8tKuRZqMuioVmB+WZ+7yrOMT/YS+Sl0NXAoia3CZf9jB5/r
         W6273upzy/Pjg==
Received: by mail-ed1-f69.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso5396108edb.5
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Feb 2022 06:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rjkrR5XxQmo1qZPV6d9L8Q/uhIi2chbUs/Ji4gNgrnM=;
        b=Go4c38bQ611xM0Wf9WoVRDxRuif/8mk6mOm71RLE/8GnGjQvAKAHWfVjTIs994rkcr
         WugGvUMNzJktJ88eRqs6uu1CcrWv/mcAColvAI6+fLchd9mGB/FN+Vix4rreECinKxeZ
         fMM5oPYJXkBJr4GAGv8GBaauAFuMy/ywO/hlVPVQDTEMnJgoaLQD086pY8Un13vQ9eMP
         +YOTFtOFKp0auoETPouPkFIwzso3tmNNywmekVbIj+StKwo5qiwhh9troboIvUTK5HMI
         AV6F1HKOhZBAlePtvrQ6Bi9Tt8uyPvQMcsFEwEMugtoWTz2ezqjpKhCdjQaOLBXA0xp3
         mrKg==
X-Gm-Message-State: AOAM5311lXVETEvc1DaOwdb8Rn2/hV/1s6CQjV9We8NXUPrVaqTR9YT7
        qUNVGBC8LiiToCuBe0kCQJSUcnE6ev19V9DU3GJsR/U2vxZNSnSGOz9Zb5cCVxXCiMXylEBeu+A
        M7jUqubyTTWI9XV2v2xgFIQudEdW8+LV2+jyXN/OPbbwE
X-Received: by 2002:a05:6402:1e92:: with SMTP id f18mr2057088edf.34.1644588021800;
        Fri, 11 Feb 2022 06:00:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoDFT2IewBAOG7RwMtyfmdbeVK3CsUUz2cYaWSNoDO7/urcw7AqVZHVuv6xEDECsV7hFGFcg==
X-Received: by 2002:a05:6402:1e92:: with SMTP id f18mr2057060edf.34.1644588021570;
        Fri, 11 Feb 2022 06:00:21 -0800 (PST)
Received: from [192.168.0.99] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h8sm6188496ejy.31.2022.02.11.06.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 06:00:20 -0800 (PST)
Message-ID: <830af6d3-ba5a-d085-ddcb-772d16f56085@canonical.com>
Date:   Fri, 11 Feb 2022 15:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] dt-bindings: watchdog: convert faraday,ftwdt010 to
 yaml
Content-Language: en-US
To:     Corentin Labbe <clabbe@baylibre.com>, linux@roeck-us.net,
        robh+dt@kernel.org, wim@linux-watchdog.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220211115528.3382374-1-clabbe@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220211115528.3382374-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/02/2022 12:55, Corentin Labbe wrote:
> Converts watchdog/faraday,ftwdt010.txt to yaml.
> This permits to detect missing properties like clocks and resets or
> compatible like moxa,moxart-watchdog.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Changes since v1:
> - Added myself as maintainer as requested by Linus
> - Added $ref to watchdog.yaml
> - Removed useless quotes
> - Added blank lines between properties
> - Removed timeout-secs as already provided by watchdog.yaml
> 
> Change since v2:
> - rewrite compatible section
> 
> Changes since v3:
> - Fix indent errors reported by yamllint
> - Change additionalProperties to unevaluatedProperties
> - Added timeout-secs in example
> 
>  .../bindings/watchdog/faraday,ftwdt010.txt    | 22 ------
>  .../bindings/watchdog/faraday,ftwdt010.yaml   | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
