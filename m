Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A316D1EC4
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Mar 2023 13:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbjCaLJf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 31 Mar 2023 07:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbjCaLJR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 31 Mar 2023 07:09:17 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13351D842
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 04:08:55 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id z83so26945937ybb.2
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680260935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrZ4nuKFRbdrvkseheS7XRYqEh2EC/QvjKLix2jXZFM=;
        b=p8HE8uYDQXIMNWouHzNhuIPq4ZYpcpiB2tjtZuopwJd/AlYTllfvkZumoyD3e/aM7a
         Rsituuiso2kH/VdZb40vv8jtPdJNbYku8HkT1NxamcWm15rgUETuxgZWfce3K4OlsyJT
         8EYq24i6h1AxbQKxcbsErcKtHV0SISL4sLOHWGtxxHXScAUsEopBmv6kXPUb2UP3kamx
         7ejJ4g3jcDtINsK2lt0tIFmNU5xb6+K0y6cGos/6qAj9HGe3eQ9yrRkXgJxG1CWCQDv4
         U50TBQ8X7/8T8XMPSnMernOOPbz8JoPb/BIhGLvpV6JYEt/IuIVi75EXyJsAZUXykI0w
         2u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680260935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrZ4nuKFRbdrvkseheS7XRYqEh2EC/QvjKLix2jXZFM=;
        b=YR3eaDOyyz7czq3U+OMUKLMoAKW6wud34glv6Muw1dAC5/Vw/wxIo+5gIIaBk1S0F/
         ctYuMciVW1mjejtzk/+O3sSIAUtQS3yL0x2oj69SSWKRIHbdlqRwmT/jU3aeDuw3pVaL
         EKTVCzvtigvr1BdX/JLlEWBMLCgg28zrVdYRvbdEkeKpdrXvavm5GzMcz/O2UYvjrGCt
         MuIzlKqHPnqDo2I/nr2EQsgkxx9hl3dVI/tF8vfGb7QUC/4D/AcjB1qz1HzGId/EZAg6
         wdjRvS712O9kVWLnznpLRgJd4uX9HD5N8btYVHGI2KvDDj6BthtCej5pMmWkHBm9vJvv
         gFLw==
X-Gm-Message-State: AAQBX9famR6Yl8T8XujB84QpN1EzDUgZ/K+5HgtQtRfvSt5ucrwmgwQf
        XVvTpgj/bJMjWg14JnCPDAghPHqEjqV0K9/XAsP3vg==
X-Google-Smtp-Source: AKy350bS9SyNRus3dGUyYtiJgys+HJA9rC8VrYDEuvi3iswc8ROzk0fLQpNKXYrIlL5r6jnukfZX+uNeYtTgRvFeeN4=
X-Received: by 2002:a05:6902:18d5:b0:b75:3fd4:1b31 with SMTP id
 ck21-20020a05690218d500b00b753fd41b31mr18131967ybb.1.1680260934863; Fri, 31
 Mar 2023 04:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-10-0003e80e0095@baylibre.com> <7b6be990-9e90-8e44-7c5e-f8b7a2701ce7@collabora.com>
In-Reply-To: <7b6be990-9e90-8e44-7c5e-f8b7a2701ce7@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 31 Mar 2023 13:08:43 +0200
Message-ID: <CAFGrd9qMEtHVT+P-mBNxh6g1jOm5ifArSxi1bbGnrKgxCf7zSQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] arm64: dts: mediatek: set vmc regulator as
 always on
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
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

Le mer. 29 mars 2023 =C3=A0 15:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > MSDC1 IP block is powered by VMC. Make sure it is always on.
>
> Why always on?
> Can't you just set mt6357_vmc_reg as VIN of mt6357_vmch_reg? :-)

I'm not sure to get it. mt6357_vmc_reg & mt6357_vmch_reg come from
PMIC and are supposed to be independent.
You suggest to link them in the mt8365-evk dts file using something like:
&mt6357_vmch_reg {
    vin-supply =3D <&mt6357_vmc_reg>;
};

Also, regulator binding probably needs change to support that.

Regards,
Alex
