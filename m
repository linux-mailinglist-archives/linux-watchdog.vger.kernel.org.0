Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325EC5184C6
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 May 2022 15:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235668AbiECNFk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 May 2022 09:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbiECNFh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 May 2022 09:05:37 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D2B15811
        for <linux-watchdog@vger.kernel.org>; Tue,  3 May 2022 06:02:04 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i19so33245670eja.11
        for <linux-watchdog@vger.kernel.org>; Tue, 03 May 2022 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wjuyFMi3EftK+wExgb79hTBMB0k+0b/v8BwPvQxw7y4=;
        b=oOvQhBmRi4yPVLzZLUCYGs+BVsIOuNPmOP7zuAv3LXMD5ryY+jr8t0qhKx9q+F29WQ
         BFUMY9tC0t8775IV0zq6ZGatAqZ8vb+XQPoD5u8WlFYXY9Uh+p91xkYsKG1i6AMM+dea
         QjUYneOUmX+FKsXrxfDeRI0ClPGkjLAM7MA2UhERQfXsNikqp61+ZKvyowpZMAVC1kcc
         IE+J4noOuFayzwmzRnfXx3bb+i4h+LEFOJSnIgygLWD/q1uU/+Jj/KuwQbLrnbyGdnyL
         bI29AB4FWa5i4EPxR51jt+dA0JJVySxiPs/gI4T72agQLr11VJ9FxB4fZ4IyFzsXoqlV
         6vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wjuyFMi3EftK+wExgb79hTBMB0k+0b/v8BwPvQxw7y4=;
        b=ytI4159PqIDLuCcqukHdUrGRGqJWb2N7de3Q0Lampxvu5Ko4UoHUifi+YIKxDCUwwf
         pKbhbOXnxW3m6BUqJkOevpwyn26uL/FbGgh+buYAxkzVAfqII5G/hG/+QByQeb2oi7I0
         3AuuMRyQ2troMt9D4GHW24ZEHMAbOONLwfMorUvVTr8hsnGMg48YKAAfLTX1MacBfnVY
         UcyxR8OkeIDlWcIHbi71XIQrRDvZO5ILgSh5Yzr74uVR2QFQLvhrtwr7WwCzRZRSW/IR
         3VC3FYsBH0DOR9sQL3wYQN7xOP/qCSAFtvr/+slUjbfxABEblebK1uED9IZVFX5pR5zv
         Z+jA==
X-Gm-Message-State: AOAM532ylVD1KcmYXxIAo5TU5ACj3yEShTQEqq4wOZMedBog0I6dQ4WJ
        JdYV0Xgdn07CCw/9eZ/ai3Xc3Q==
X-Google-Smtp-Source: ABdhPJxwG4sLoDPShcHTI6lbe5nIz0+kudelkrlQymVFFYb3TDP1oKvJEVUWereTSbkBgJoKAqV1MA==
X-Received: by 2002:a17:907:6e28:b0:6f4:6428:6ee8 with SMTP id sd40-20020a1709076e2800b006f464286ee8mr6584030ejc.608.1651582918486;
        Tue, 03 May 2022 06:01:58 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz26-20020a17090775fa00b006f3ef214e49sm4580080ejc.175.2022.05.03.06.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 06:01:57 -0700 (PDT)
Message-ID: <b854c7b1-b0b5-b921-e6bf-ee88472d2f66@linaro.org>
Date:   Tue, 3 May 2022 15:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/7] dt-bindings: iommu: renesas,ipmmu-vmsa: R-Car V3U is
 R-Car Gen4
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
 <d351ca12724d5b306119bd8dcd9bfac09ba2a925.1651497024.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d351ca12724d5b306119bd8dcd9bfac09ba2a925.1651497024.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
