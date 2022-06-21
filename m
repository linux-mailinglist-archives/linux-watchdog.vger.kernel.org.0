Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD04D553660
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jun 2022 17:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352996AbiFUPkO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 11:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352971AbiFUPkM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 11:40:12 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D77C2C125
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 08:40:11 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id e40so7370303eda.2
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1sFbExhS+OPLRXtZhG6HHO16GCs3zpUEDAo1KtqwhuU=;
        b=WQGkyOh69T3rIJ9GhJep6gi1zgBYkO0OBKsIaFlY+6AZisg0V3xR73aaPs3OW44eku
         iZWOjwrf100p6yo3l8E8v5hOW+GH3yJA5uKRG4XDKXJ+gLTDhEUS8GfWWzYhJWGfA6VC
         LS+o7CtrxuSbhvNrlgpEL29B7aE5ENttCeCVqDmoYneLkjLqd71jeTE0hgfqWqxBwRfR
         PSvyjcKzNSC8TiGVclA7Cb+V8S6/yK6zy9koJlgPvyz+pARkqDykE0wSnEI9tFrq+PHm
         karQv1IJcNPCk0k6N430IaWslTnkrtyrPzoYJVoUeQlHOLnf9TIddhVCsVKtMgMP64Qw
         WP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1sFbExhS+OPLRXtZhG6HHO16GCs3zpUEDAo1KtqwhuU=;
        b=YABQarQqeO09/1HmyNVaE1CHh1OhTHBwmBhMvu0VUD/iFahXD0/StmyXAPZB1cOqKi
         z/urcQoman5nMp/Xt1S04tLHQttLKwIEv9JyVaKPw7zqoRn57iPLP5CIjGUoPZiJ5DkN
         MgKEnI/0yLmm7cSQSCTU9RZwPa3MswELYYEVJnnXC+ghLejWgs1M+toUVvY1W8+tqs4K
         pT+lZlpaok4siw9hzaZ1n9wU0n0SmLlRxQwpwIA4ykiH4qk6qNqS9FVmOLS0TpwlTlOG
         OV1kY1SVOSe5MxQleWRDTqwB8NNZyS3lu22m9j6lT6MRspTA3xXMP3KJdXnzUmvvdVG0
         3vJg==
X-Gm-Message-State: AJIora+lmml2QDFLRIMhd0GFey0+WnrLE4ZVD4+NSrbwlUmSPgcUVi89
        l9B8Qtah6hH6MjJsfaejy/hRTA==
X-Google-Smtp-Source: AGRyM1tgLH2e5nkg+AVdA2b8Jkx7KfBK6e+fSRsOTK0URy9oXzrHdA0RHNt8rt1JcY6ND0eqmpRGiw==
X-Received: by 2002:a05:6402:51d3:b0:431:6c7b:28d with SMTP id r19-20020a05640251d300b004316c7b028dmr35227379edd.281.1655826009584;
        Tue, 21 Jun 2022 08:40:09 -0700 (PDT)
Received: from [192.168.0.221] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z6-20020a17090665c600b006feb6dee4absm7929479ejn.137.2022.06.21.08.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 08:40:09 -0700 (PDT)
Message-ID: <5832f7f1-3c8f-d88d-3b72-99effc1e2e83@linaro.org>
Date:   Tue, 21 Jun 2022 17:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 05/18] dt-binding: clk: npcm845: Add binding for
 Nuvoton NPCM8XX Clock
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220621131424.162355-1-tmaimon77@gmail.com>
 <20220621131424.162355-6-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220621131424.162355-6-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 21/06/2022 15:14, Tomer Maimon wrote:
> Add binding for the Arbel BMC NPCM8XX Clock controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/clock/nuvoton,npcm845-clk.yaml   | 49 +++++++++++++++++++
>  .../dt-bindings/clock/nuvoton,npcm845-clk.h   | 49 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm845-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> new file mode 100644
> index 000000000000..3d4fddc090ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM8XX Clock Controller Binding
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +description: |
> +  Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller, which
> +  generates and supplies clocks to all modules within the BMC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm845-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See include/dt-bindings/clock/nuvoton,npcm8xx-clock.h for the full
> +      list of NPCM8XX clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"

You fixed one comment and ignore second. The same was with v3.

This is still no. Implement all the comments you received. I have to
double check your patchsets every time because I cannot trust that you
implemented what I asked for.


Best regards,
Krzysztof
