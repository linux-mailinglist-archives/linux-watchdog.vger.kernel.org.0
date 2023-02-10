Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1A28691D6B
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Feb 2023 12:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbjBJLAH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Feb 2023 06:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbjBJLAA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Feb 2023 06:00:00 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F35F5ACC5
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Feb 2023 02:59:58 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id o36so3543722wms.1
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Feb 2023 02:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGtDg5ATFbK3Kzugl2ywDB+EKvh8/NkVL/VYGLMSpms=;
        b=VnB5ytPrJvyomfcg/OYqui5pg2vZKhjHa/1KAjK5S48RUiSs4yQo4cJeQSrMFf3sR2
         Zft/FmNXtJI9V0OTp3BZ2sI2BZI2yV9t553wftX7vh2Wwkf4pISSIn/JYktCNp8pwTqt
         NDugeshKfUZ5AjjJdLAb8HeQbZxrR3ynoTIzXHkjlRG/1LLeH6bPlqDj4sQGB3oUGoRN
         BxTtSIFMefuXCrpi7oWiCcTDeumgQojA87+O9c3mYvxKqIp/zXHcCz8x90E8x98sXCit
         Hn+D7ab+wQNe2FiHoHZ3XGJUAzY0HUxW25XYQrJD1MkHNQcHNRehNC/1DoKZvrzmBOGF
         fFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGtDg5ATFbK3Kzugl2ywDB+EKvh8/NkVL/VYGLMSpms=;
        b=Wja86V407kuW0rS31wSj7kYNfQ5AFYsJLLst9i0iWhP3b1FO+MHWa2mphByPXGCy52
         a4rsqId7bjrxZeAKS2IRf89opv0K77PmnQ3FPWomkgeG+OX98QOjHKlBr9ZRQQHC4oxj
         JehmZo/LyFDwbw5zkrwtH9DX2Bw1xzGni5JwzZgb6RMTA8SFzxR0QpHq/BAagu/Y+PLc
         z2bsJyByHKOk6Vux5OVwwIcI5+9kGGTXsKTL399PChdbFQqsIMPcBR6cxvcpeASHRvVX
         FBlkyUyGEuO7KY2rKTZW832SJR40zw6uJlBTsTgBhEJfY/Za09vW8nA4cmaab93/o4em
         R3+w==
X-Gm-Message-State: AO0yUKVX6rSw/4Mb0f4+KtaKPgCdTgNX+TIxarhf3rOxJIDCD2mjTn7d
        xr2LoW/2BYO5IpLIz/npt1EaeA==
X-Google-Smtp-Source: AK7set/qb4p+63yJEnzFqA2Md8R/uEGASB9YbN6OJ5A4XFRJ3472S+AW3ApRhmy6MwVVzGxoi7W62g==
X-Received: by 2002:a05:600c:708:b0:3e0:17d:aeaf with SMTP id i8-20020a05600c070800b003e0017daeafmr12247703wmn.7.1676026796673;
        Fri, 10 Feb 2023 02:59:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ja13-20020a05600c556d00b003dc4b4dea31sm4470272wmb.27.2023.02.10.02.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 02:59:56 -0800 (PST)
Message-ID: <a0a141ef-b5ab-f84a-9a77-7b6d1f54ccc9@linaro.org>
Date:   Fri, 10 Feb 2023 11:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: mt7621-wdt: add phandle to
 access system controller registers
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230210065621.598120-1-sergio.paracuellos@gmail.com>
 <20230210065621.598120-2-sergio.paracuellos@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210065621.598120-2-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/02/2023 07:56, Sergio Paracuellos wrote:
> MT7621 SoC provides a system controller node for accessing to some registers.
> Add a phandle to this node to avoid using MIPS related arch operations and

I don't understand this part. You claim you add a phandle to this node,
but your binding suggest you add here a phandle to other node.

> includes in watchdog driver code.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/watchdog/mediatek,mt7621-wdt.yaml       | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
> index b2b17fdf4..3c545065f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
> @@ -14,11 +14,18 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt7621-wdt
> +    items:
> +      - const: mediatek,mt7621-wdt
> +      - const: syscon
>  
>    reg:
>      maxItems: 1
>  
> +  ralink,sysctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle of syscon used to control system registers

This needs to be more specific - which syscon? It also does not fit your
commit msg.


Best regards,
Krzysztof

