Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359A8640508
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Dec 2022 11:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbiLBKsH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Dec 2022 05:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbiLBKsG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Dec 2022 05:48:06 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183E895835
        for <linux-watchdog@vger.kernel.org>; Fri,  2 Dec 2022 02:48:05 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id b9so4981068ljr.5
        for <linux-watchdog@vger.kernel.org>; Fri, 02 Dec 2022 02:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rtYcu6/3CQ2S7j8h20Y4A6KAn9ZcSJMr/CDNrzIstnQ=;
        b=Hk/Li4JaaBWRgFd1nMX7JJDu1fjwBX3sjpsJWIwGzephlDPZiA0DG3oR/1IBdlJBHc
         3AxVGQowYtusxWTTcYll8wjfvwMUH+Pisxon83SbDwMiR1j0832B0FuJdXxqwKp8ls7M
         cfjBZqWHag+V8EfW4d9kx9ISJkAmvjVyyfZm3aUl6uCUSn/tHCBnXPCUTv7GhIo6+iWh
         5D//Aw/6VB1mJLZcF1CJrdCa1Dk0L1Ag1msAFjRoWBlbe1izqBRxWvgF4bcS/aAhEj6a
         LVUh65SvjG4TxbSxxKaibmPilM/mfxDn+3KjIbDBxVAubnNkqurweUq80+qLwe4CEMU2
         foWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtYcu6/3CQ2S7j8h20Y4A6KAn9ZcSJMr/CDNrzIstnQ=;
        b=5innmOytUlTAPfj73hgZ9n5Hpn/v3PQCfy/BIsjPJYt/lS8HlllOSCm9AnP5TRuqV8
         ADctrb8Tk2UtVpQQqR3+zSb/D8+CEAwRyLJH3twnXavZ9qdY/d31kOXioOKYZGZiqDWq
         UiyG521orkPyIbvEy35yFx79ZEvs02PM6akM3dN1HqoDU362MgAiTAIBuav4siH68R2/
         IfxOAQhZBxHe3Hic82ed+CEopkqPYOZLdJBdDHvyT7e8vci0Vs7xg4/Ji8Zb69g6oPPO
         1F/LCg+XAlbQGv1fNB0FMYk5FyGeOzFD5JpDL1wQ+EieoKjW66rMPdbRX5gi7MvhGCjw
         V7MQ==
X-Gm-Message-State: ANoB5pkYg695Al32XcCUNuviQMQ1wUA8Nqc2M9CANi+BZspFkl7Lm+OM
        bxH6DQLF0mx13rLz0Zrh3ltmpg==
X-Google-Smtp-Source: AA0mqf5kICRVgIlw6pQmSQRYTPuyrEjRpC1cLcHLMJHCp2kVwoaY5Hrz+SdFZjavsjSxLsCYIrXicg==
X-Received: by 2002:a2e:be07:0:b0:26c:6dce:ce59 with SMTP id z7-20020a2ebe07000000b0026c6dcece59mr17660429ljq.130.1669978083449;
        Fri, 02 Dec 2022 02:48:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b26-20020a2e895a000000b00279e0b8bae7sm92593ljk.65.2022.12.02.02.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:48:03 -0800 (PST)
Message-ID: <66e66749-cc0f-f147-2648-03b52f95cca5@linaro.org>
Date:   Fri, 2 Dec 2022 11:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: jh7110: Add watchdog node
Content-Language: en-US
To:     "xingu.wu" <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Samin Guo <samin.guo@starfivetech.com>,
        linux-kernel@vger.kernel.org
References: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
 <20221202093943.149674-4-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202093943.149674-4-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02/12/2022 10:39, xingu.wu wrote:
> From: Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> This adds the watchdog node for the Starfive JH7110 SoC.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index c22e8f1d2640..22f5a37d691e 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -433,5 +433,19 @@ uart5: serial@12020000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		wdog: watchdog@13070000 {
> +			compatible = "starfive,jh7110-wdt";
> +			reg = <0x0 0x13070000 0x0 0x10000>;
> +			interrupts = <68>;
> +			clocks = <&syscrg JH7110_SYSCLK_WDT_CORE>,
> +				 <&syscrg JH7110_SYSCLK_WDT_APB>;
> +			clock-names = "core_clk", "apb_clk";
> +			resets = <&syscrg JH7110_SYSRST_WDT_APB>,
> +				 <&syscrg JH7110_SYSRST_WDT_CORE>;
> +			reset-names = "rst_apb", "rst_core";
> +			timeout-sec = <15>;
> +			status = "okay";

Why? okay is by default

Best regards,
Krzysztof

