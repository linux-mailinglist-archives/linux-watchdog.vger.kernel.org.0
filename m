Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57BF96DAD1D
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Apr 2023 15:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjDGNIk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Apr 2023 09:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjDGNIj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Apr 2023 09:08:39 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A103076AB
        for <linux-watchdog@vger.kernel.org>; Fri,  7 Apr 2023 06:08:36 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id p203so48905277ybb.13
        for <linux-watchdog@vger.kernel.org>; Fri, 07 Apr 2023 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872916; x=1683464916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLLVgeqbEDeqTFPI4P39tQQxxRUKPGk2hxPwWtx7KaE=;
        b=XN9SbYQd3XpeqF2Z0PQ7esBc1Gl7JYH957ZcK4vzDgrc5a9oooVC9gq29yPtGtcCfa
         4jF9UDhJVY30Lg+Lu67gkWQgQkbbDE5W6XM+v1atHBlSadRPW93TQuaf2Ee2fkTw9Txx
         3dyUKpRyCDZc5beDgMniaBTbFrEioazA8YZZiYMeLDN60BOe7ShNR7fSCNsrT9n5KqA1
         TMbUwhS7u9yqeMRGxRb8MzJtg7qFAMw1ctou6vCxO/jNZ8UFwr0ScM0YN/qQ7uV5beja
         GFr0U/dHBQ5JtaLVPsMHyOoQYdID/sBLTIhDcGGkXYWbYkfm2jnCvWlgbu2+NLsO171K
         a+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872916; x=1683464916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLLVgeqbEDeqTFPI4P39tQQxxRUKPGk2hxPwWtx7KaE=;
        b=d1nfNHlsF0Ipnzh9ACeqAdqykBhbbW2+GKZHSnfilz1dbjg0YBLiAZrl648cal0xKv
         jYn5h5CrxQX2agsPOwVYnIb9WfLeyepUn/885XKYjDxfNkdBz2gwPnT9ehcCihhkD6X+
         7Ivczmw2CLarKv8WdxOQBlbCtDEk7adOkddTcMdBFtypDNUqhBbNA3dqMjRWE810Ndes
         PSVwlipqrakBGRtrexOH+Cmlh4UIcoFUV6tzR6mr4AkYMvNcVHJFoq3/zUY26QdFsojA
         lvFzg8XpRzyLJW2t7vo+7piShYrdo32BfKxaWJXfuNTl20+dtq+y3lO3nHy3xqbQog4S
         7Ovg==
X-Gm-Message-State: AAQBX9eME1jMIF8uJwxwZvGMpT8ZGshlSki1M1LLyu8D6qsGxhiIcXTt
        Kzt0z2JahM2jx4ilk1y/P7vLqqgufdPoVll8zje8BQ==
X-Google-Smtp-Source: AKy350YLZihMhzB+mdd71bZKDJZvF/AIGIyRY1E58MdNGmy1VpnHnj4VC2+IDSkQ7AmfGY7ZYm4clBM+wIUjda9dog0=
X-Received: by 2002:a25:d958:0:b0:b75:3fd4:1b31 with SMTP id
 q85-20020a25d958000000b00b753fd41b31mr1807164ybg.1.1680872915732; Fri, 07 Apr
 2023 06:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 7 Apr 2023 15:08:24 +0200
Message-ID: <CAFGrd9pV8Zk-4M3gPRYBSqqG7dTA6bri4LV2ZcfKyTZN6STsmA@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Improve the MT8365 SoC and EVK board support
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> This commits are based on the Fabien Parent <fparent@baylibre.com> work.
>
> The purpose of this series is to add the following HWs / IPs support for
> the mt8365-evk board:
> - Watchdog
> - Power Management Integrated Circuit "PMIC" wrapper
> - MT6357 PMIC
> - MultiMediaCard "MMC" & Secure Digital "SD" controller
> - USB controller
> - Ethernet MAC controller
>
> Add CPU Freq & IDLE support for this board.
>
> This series depends to anothers which add support for MT8365 EVK board
> [1], add the MT8365 I2C support [2] (both are currently applied) and
> finally the pinctrl binding cleanup [3].
>
> =3D=3D=3D Build:
>
> To test this serie, cherry-pick patches from the dependent series ([1],[2=
],[3])
> and the applied patches from this serie (documented in the "Changes" belo=
w).
> Be carefull, the pinctrl serie [3] is rebased to linusw/linux-pinctrl,
> cherry-pick will not be straightforward.
> Finally, cherry-pick this serie.
>
> You can also take my branch [4] which have all the needed patches
> retrieved from the instructions above.
>
> Use the arm64 defconfig to make the build.
>
> Regards,
> Alex
>
> [1]: https://lore.kernel.org/all/20230309213501.794764-1-bero@baylibre.co=
m/
> [2]: https://lore.kernel.org/all/20221122-mt8365-i2c-support-v6-0-e1009c8=
afd53@baylibre.com/
> [3]: https://lore.kernel.org/all/20230327-cleanup-pinctrl-binding-v3-0-6f=
56d5c7a8de@baylibre.com/
> [4]: https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/am=
ergnat/i350-evk-board-support
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Changes in v5:
> - Add patches to build the MT6357 regulator driver and MTK PMIC keys by d=
efault
> - Remove "dt-bindings: pinctrl: mediatek,mt8365-pinctrl: add drive streng=
th property"
>   patch from this serie and add it to the pinctrl serie [3]
> - Link to v4: https://lore.kernel.org/r/20230203-evk-board-support-v4-0-5=
cffe66a38c0@baylibre.com
>
> Changes in v4:
> - Remove v3 applied patch from the serie:
>   - arm64: dts: mediatek: add ethernet support for mt8365 SoC
>   - arm64: dts: mediatek: add mmc support for mt8365 SoC
>   - arm64: dts: mediatek: add mt6357 device-tree
>   - arm64: dts: mediatek: add pwrap support to mt8365 SoC
>   - arm64: dts: mediatek: Increase the size BL31 reserved memory
> - Drop "arm64: dts: mediatek: fix systimer properties" which is done [1]
> - Fix style, typo and re-order properties.
> - Use interrupts-extended for the PMIC node.
> - Link to v3: https://lore.kernel.org/r/20230203-evk-board-support-v3-0-0=
003e80e0095@baylibre.com
>
> Changes in v3:
> - Remove v2 applied patch from the serie:
>   - dt-bindings: mmc: mediatek,mtk-sd: add mt8365
> - Add trailers and simply resend.
> - Link to v2: https://lore.kernel.org/r/20230203-evk-board-support-v2-0-6=
ec7cdb10ccf@baylibre.com
>
> ---
> Alexandre Mergnat (10):
>       arm64: defconfig: enable MT6357 regulator
>       arm64: defconfig: enable Mediatek PMIC key
>       dt-bindings: watchdog: mediatek,mtk-wdt: add mt8365
>       arm64: dts: mediatek: add watchdog support for mt8365 SoC
>       arm64: dts: mediatek: add mt6357 PMIC support for  mt8365-evk
>       arm64: dts: mediatek: add mmc support for mt8365-evk
>       arm64: dts: mediatek: add usb controller support for mt8365-evk
>       arm64: dts: mediatek: add ethernet support for mt8365-evk
>       arm64: dts: mediatek: add OPP support for mt8365 SoC
>       arm64: dts: mediatek: add cpufreq support for mt8365-evk
>
> Amjad Ouled-Ameur (1):
>       arm64: dts: mediatek: Add CPU Idle support
>
> Fabien Parent (1):
>       arm64: dts: mediatek: set vmc regulator as always on
>
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 249 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 142 ++++++++++++
>  arch/arm64/configs/defconfig                       |   3 +
>  4 files changed, 395 insertions(+)
> ---
> base-commit: 4f2a499a344b36ebb325e610265452ea88541116
> change-id: 20230203-evk-board-support-d5b7a839ed7b
>
> Best regards,
> --
> Alexandre Mergnat <amergnat@baylibre.com>
>
