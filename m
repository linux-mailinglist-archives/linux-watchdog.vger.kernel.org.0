Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2643551296
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 10:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239445AbiFTIWk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 04:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239644AbiFTIWj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 04:22:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A489120AD
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Jun 2022 01:22:34 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z7so13979592edm.13
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Jun 2022 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yJTL9VsdOv2E21Dkt8BTO3+Qw07qwGtDXpvjpRBhc5g=;
        b=h6HdvNM3ah/gsRVjcr5JsUh3O7E9bjvNwmVZT89qSD4sHbUmKLzFsHkxunCVjXmhrs
         iF8X+A4LHt+9zazui0cKN8wY/dVdHGTccWqjENsC5aW8NNBOxDrNhqqOgqlKeIhhOnGb
         j/YTRw3L+/WAuNymjP0OpFNGEWGiuzwEVD89PilcSlb6f3QMAFVE+tQVSTXlFE8b4Bsf
         wW8yMWZa+xkIWmo1BXcuZg66pGczoI19J/3l2e7DjVG6XlVCh/gUuzlP2k/1fr2q3Dlm
         B/9oTmpkCXLedzgZms0RuJYJaAYtCBrwqwM2crb4ZGlxbhmRkxqggS2/c6RLHuRh7u3l
         fVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yJTL9VsdOv2E21Dkt8BTO3+Qw07qwGtDXpvjpRBhc5g=;
        b=aG5aEzYfQghebXZv7sr2tkes61LAL840pfuuu3sot2Z17DcPQlXif/NAVhd+o+Pl3f
         y/B0lXagVjwvVHd5sWfBjVvHv8+ms4NP4+VkBSm4rA9W85um9ksMOQXCOjcpFJIR0AKj
         lxzsCr4TROFQj3gPF1L1eW9rj7A6SRG6+cVV/WRfLpPn/LZqmm72hSbBD31PI0hZ9Fbp
         VS/YFvt3N/Qd6LXPoMGdp1qms+Dh8x9qPKJi2eVYgqH+jIFMdoKX6NL++M6oXjoDYZ76
         rEN0Wu7q2vYTKLcG+nGnl3kr4FJG29PDCstUmTUNLSO8I8zxbafSP4s8ddCjnIgjJHJe
         l+qw==
X-Gm-Message-State: AJIora/yQOJhqQdmMnU1gl6ra6S12TW86y3Iz0gmMmIxjxAVpqifb8uL
        M0DfmAkHDdJKJdx4b/5Jwnvz0g==
X-Google-Smtp-Source: AGRyM1uzcZsqQhCIoAQ1YkKeyAKAqGksNoYWgRmpMgaQIpLaG9BX11BZQzCejDAF/kpDoNvbzDxbqw==
X-Received: by 2002:a05:6402:4301:b0:42d:e8fb:66f7 with SMTP id m1-20020a056402430100b0042de8fb66f7mr28394069edc.229.1655713352841;
        Mon, 20 Jun 2022 01:22:32 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ht16-20020a170907609000b00711c7cca428sm5519146ejc.155.2022.06.20.01.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:22:32 -0700 (PDT)
Message-ID: <36b12f00-a7cb-9f94-d1c3-e04f7861b08e@linaro.org>
Date:   Mon, 20 Jun 2022 10:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 07/18] dt-bindings: reset: npcm: add GCR syscon
 property
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
References: <20220619151225.209029-1-tmaimon77@gmail.com>
 <20220619151225.209029-8-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220619151225.209029-8-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 19/06/2022 17:12, Tomer Maimon wrote:
> Describe syscon property that handles general control registers (GCR) in
> Nuvoton BMC NPCM reset driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/reset/nuvoton,npcm750-reset.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> index fa5e4ea6400e..7ba3a6ff82ed 100644
> --- a/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> @@ -19,6 +19,9 @@ properties:
>    '#reset-cells':
>      const: 2
>  
> +  nuvoton,sysgcr:
> +    description: a phandle to access GCR registers.

That's not valid. You miss here ref. My comment was to skip quotes and
you removed entire ref.

Best regards,
Krzysztof
