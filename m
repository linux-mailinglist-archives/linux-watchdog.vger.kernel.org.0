Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5C86DAD59
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Apr 2023 15:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240717AbjDGNOs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Apr 2023 09:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240794AbjDGNOj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Apr 2023 09:14:39 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F59C7
        for <linux-watchdog@vger.kernel.org>; Fri,  7 Apr 2023 06:14:36 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id p15so48952998ybl.9
        for <linux-watchdog@vger.kernel.org>; Fri, 07 Apr 2023 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873276; x=1683465276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYfJz5DR0sarRMEimOcvYMZLh47D2UkV2Jy+IyrrQOQ=;
        b=afYShcwaWCRKxQfWVC6A3UR9s7WsYh/m45lh7dvhXtRB16e21H+vEI88O/1n9pP8I4
         2biUZIldSXj1UlxNMnKldwyioUX0rXkQ8q9t93u3HTfhmuy9m1zMO9pme+sLax1EPkCJ
         g/1HP/SlmfpmPCsMjbbIYuuW3UZB1iCBAeWDEqrR6I/5QiBmYqlRlH7m2o6blm935sP4
         +rh/mTZ6T2ieURwovpfl6ay3Qc5CDtgNGd/WsZSgg1EL1jWOuNz6qBxeci4IJwFs/KJh
         Z+XRLogC5gdLXNlFuAUkHjWFCucZxRZ8Xpc7swDcbtI3+U0rfFuyCzLFRwtClMgorn2r
         9Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873276; x=1683465276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYfJz5DR0sarRMEimOcvYMZLh47D2UkV2Jy+IyrrQOQ=;
        b=FKhDc8DynAcAYO1ylMtKzhM1y4wjs1yu+5we76zp5CEnuIHk0wH1j+ztX7Z895I9+6
         WpD+auDVouETPw1MqE8kNkaT1oQ+ysaU8w/ffV1Z5xN0uQB6JxqhB749G1hAh/At6EVn
         IWIXMxDXLg85cOzHyli+MLTBjmOim0bItkNmEDd7ilgAlglKgdWO0INe44b3Hr12kqVn
         a7uvGoIUj+Pvs9g0SgGxOAwz+EApRXVZqs9sxzEVksfDxZD5NgSEUxTZsqoZU3JHVako
         mpjPwFm01CP0uRDT/StaVmVGiml5fDFL6zsRfXLi+rKV1+4RulwGPAeUCiRdQKMVYXcU
         Qf8Q==
X-Gm-Message-State: AAQBX9c/3VfjDXR2j50BODwSkFZEZ4mkH7Fr/SCZ/vqaTJayAhm8B2/9
        mrkZAoIe8orV1IK709M9LjnCfzWy1GjouuO0hVkRfA==
X-Google-Smtp-Source: AKy350bjb0HMJWJBzAnomlx9pGRYUzANSN19TtSNZ11GKBKtXGW/aXrzLpx8tgmRFVv06JMuSLYzMOruSpo5bx91W2o=
X-Received: by 2002:a25:d28b:0:b0:b6c:2224:8a77 with SMTP id
 j133-20020a25d28b000000b00b6c22248a77mr1788606ybg.1.1680873275845; Fri, 07
 Apr 2023 06:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-11-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-11-1883c1b405ad@baylibre.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 7 Apr 2023 15:14:25 +0200
Message-ID: <CAFGrd9pu+t1K_4B-oCoRVq_rZfWZN=XWVARpTC5dS7HydZQFKg@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] arm64: dts: mediatek: add cpufreq support for mt8365-evk
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
        Amjad Ouled-Ameur <aouledameur@baylibre.com>
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
> In order to have cpufreq support, this patch adds proc-supply and
> sram-supply for each CPU.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boo=
t/dts/mediatek/mt8365-evk.dts
> index 431078f8670e..d723838ed49b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -88,6 +88,26 @@ optee_reserved: optee@43200000 {
>         };
>  };
>
> +&cpu0 {
> +       proc-supply =3D <&mt6357_vproc_reg>;
> +       sram-supply =3D <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu1 {
> +       proc-supply =3D <&mt6357_vproc_reg>;
> +       sram-supply =3D <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu2 {
> +       proc-supply =3D <&mt6357_vproc_reg>;
> +       sram-supply =3D <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu3 {
> +       proc-supply =3D <&mt6357_vproc_reg>;
> +       sram-supply =3D <&mt6357_vsram_proc_reg>;
> +};
> +
>  &ethernet {
>         pinctrl-0 =3D <&ethernet_pins>;
>         pinctrl-names =3D "default";
>
> --
> 2.25.1
>
