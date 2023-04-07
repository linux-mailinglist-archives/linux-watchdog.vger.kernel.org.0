Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DDE6DAD25
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Apr 2023 15:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbjDGNKY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Apr 2023 09:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbjDGNKT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Apr 2023 09:10:19 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCC97EDC
        for <linux-watchdog@vger.kernel.org>; Fri,  7 Apr 2023 06:10:12 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-54184571389so795171097b3.4
        for <linux-watchdog@vger.kernel.org>; Fri, 07 Apr 2023 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873012; x=1683465012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B39VyebJYnuGTjHcWDPxYe6oPc5V8Fl1158lshWAUY=;
        b=f53//PACP7kgOmszXV77uUvDMPT9Y61TmpZjdAW++41qj3A7aw+ir36/BtlIPyO3Kn
         i2ORUv2zWrELKrrquOBN3xLuhxSv0ET3weEr+ssjZADJk3DWzO02PeSVHsWd1uHeqvjn
         XBvA73Byqt3wilVvJtGKMV8oxjG8HG1lDrsg2plH/mTAk9d6SrTw4W37bpp14Nmsc/Ty
         AY0uqFeUWbq2xuTSjphtvf0QwZteTHm8qD46xt2SCYdyoIrVYj3anLDvYSLjj1wC8oTJ
         54yNVjhD+S7vU0IFIEsc8/G/dJM5otHT285DoNf/nX2R9WkcIyOLxYu4pN+wBsaQ2/Gz
         sEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873012; x=1683465012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4B39VyebJYnuGTjHcWDPxYe6oPc5V8Fl1158lshWAUY=;
        b=06ap9QrYgUyN4U1TMiYuaaP7R9aza4TOBO54SsGz8Q+6Xed6JI1qwQPcWp22uzphD7
         rLOSghKR0zULYwtEm9X72mFO0V7P6dyeiVAo/e3NfPC5JJY36E8UueIJhS3ieekqRWjR
         elITLGRjNi5BIJ7xevb+M7d/nAvhue1AVuygPD+BVceNEhhIJAd3Ckn3hFW+0DSZO+w1
         8hkuZKLR0iryAKAI6bkM4GmNpixdy0/yS7ikgaatuN7pXnSPFe7LNVRsykhreq/1Gr5k
         2mTqb7lVO9z1ua28BTTWf1tBuOf00BJ6jp29mlLBHziTh4+pmdgMoZ38kkJzf/46AlLg
         yM+Q==
X-Gm-Message-State: AAQBX9f9q0oGS+J+6keKg/PcOBUyZ3nxKycKVALZQ/Z11U6J9x5wTmy5
        NDm991pS8IkgrILzc8p2P9GuGx0wQWcDlEnj9uCiKQ==
X-Google-Smtp-Source: AKy350bJk0AACnynN0kqCLCkF/5dozOA90cXc4Q98GGea0b+hZw74doxVa3aZnouULl/xJ46a66T+ja5Kmji9UF77dY=
X-Received: by 2002:a81:441e:0:b0:540:e744:13ae with SMTP id
 r30-20020a81441e000000b00540e74413aemr1092692ywa.3.1680873011652; Fri, 07 Apr
 2023 06:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-1-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-1-1883c1b405ad@baylibre.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 7 Apr 2023 15:10:00 +0200
Message-ID: <CAFGrd9p8gR+poX48ubMm9n6Rg1RaGqZR1BG22fJQYcjBzX0wOg@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] arm64: defconfig: enable MT6357 regulator
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
        Will Deacon <will@kernel.org>, catalin.marinas@arm.com
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
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7790ee42c68a..e4cb65889ae6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -685,6 +685,7 @@ CONFIG_REGULATOR_MAX77620=3Dy
>  CONFIG_REGULATOR_MAX8973=3Dy
>  CONFIG_REGULATOR_MP8859=3Dy
>  CONFIG_REGULATOR_MT6315=3Dm
> +CONFIG_REGULATOR_MT6357=3Dy
>  CONFIG_REGULATOR_MT6358=3Dy
>  CONFIG_REGULATOR_MT6359=3Dy
>  CONFIG_REGULATOR_MT6360=3Dy
>
> --
> 2.25.1
>
