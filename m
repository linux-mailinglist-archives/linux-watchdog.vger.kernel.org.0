Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F945184CF
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 May 2022 15:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235719AbiECNGC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 May 2022 09:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235680AbiECNGB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 May 2022 09:06:01 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D771EAFE
        for <linux-watchdog@vger.kernel.org>; Tue,  3 May 2022 06:02:29 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id d6so19757423ede.8
        for <linux-watchdog@vger.kernel.org>; Tue, 03 May 2022 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iV4tVGnh7QHG+PfLI7Q0mYHuyjPaEc/xG5BZIpO4pGA=;
        b=vlfeNENfF1eD8fgkOGVOtjFsvzln7tEDY/uEOryyt3IHcK5bc03CduITlrE+RmjT9t
         HkAcbdG/F1yq25CW01RMJG7ZegtpUArT99f7TXV4enR2D5bIaMgR0oSP347XArZCCdpS
         qGSVQMoY0pywrhjAmsy+EyIiVd3XrNGmKpA7wEeUYOj3/GPonpwV6l21NY2iA4ja9oML
         7h3cupaTpNJ/0caFjvOLT2aAtApxXPpQt20omxMugYYxJRyy81Lq5aRFR8DbbG6dyOnM
         90GXzqKSr8WPkPU3me/B2ilh5xwXh6CrlYYYdpjNUcY33g6ag+ddd5hhIfNbf8ogTk8i
         v/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iV4tVGnh7QHG+PfLI7Q0mYHuyjPaEc/xG5BZIpO4pGA=;
        b=TvWWPuWz+Hr7zZ28WOMf5graWRgGfW3CTSK7gq2iE+F2KZZCtqCJyXqo9eIjHlsuwh
         WH9SalxUobPCI0h2g4S2VvcdYW0nT6SVz7ej661AQqzurvlqI38WWmmGJc/LDF6FeWqS
         LQRrSF5q6XdycBonaEQCH/bXCrhWe2CLcWpY3kqqFgtX15DWX+cDAkFv1kJJvpCAVrok
         19oAyVQFzxhB2PaFi+PHEUjYLCPhEs4qTFttmPSEICIeA81XwJcXDG1mW/KFXzG8Hq4M
         dEnUzwAj5+R1SWRnCGwrK+4opFGd7rbmirqubqg59/GBxm9BR1jgdmNgZFr7c6K5p1E+
         FWvw==
X-Gm-Message-State: AOAM531uKtiqO9TZx+excOtySvGEt01rv8w2LHYj3WQOPDHEcdssAu8l
        BcPItobC1rC1e98hpe90Xocrw5PPkIJFnQ==
X-Google-Smtp-Source: ABdhPJwIvyRvYCHNzuAJACjjuKhS9C3I9YB94dUMYFyGqf8a7sXjPP+2fhc+RFrOulXQwqT8A5V5tQ==
X-Received: by 2002:a05:6402:5107:b0:427:ded9:9234 with SMTP id m7-20020a056402510700b00427ded99234mr4223009edd.275.1651582947612;
        Tue, 03 May 2022 06:02:27 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hg1-20020a1709072cc100b006f3ef214e72sm4579481ejc.216.2022.05.03.06.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 06:02:26 -0700 (PDT)
Message-ID: <7dec1fb4-1803-838e-291f-10f56b9fe10e@linaro.org>
Date:   Tue, 3 May 2022 15:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/7] dt-bindings: renesas,rcar-dmac: R-Car V3U is R-Car
 Gen4
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1651497024.git.geert+renesas@glider.be>
 <e6e4cf701f3a43b061b9c3f7f0adc4d6addd4722.1651497024.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e6e4cf701f3a43b061b9c3f7f0adc4d6addd4722.1651497024.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02/05/2022 15:34, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/dma/renesas,rcar-dmac.yaml     | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
