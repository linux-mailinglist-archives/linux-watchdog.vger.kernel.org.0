Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08AED6D642A
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Apr 2023 15:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbjDDN5B (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Apr 2023 09:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235482AbjDDN4e (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Apr 2023 09:56:34 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3679159C1
        for <linux-watchdog@vger.kernel.org>; Tue,  4 Apr 2023 06:55:41 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-545e907790fso499116437b3.3
        for <linux-watchdog@vger.kernel.org>; Tue, 04 Apr 2023 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680616537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHkwTuEK0sRBaJKLMcnB+ss8uWVVS2sTLaR7SSh4ZeE=;
        b=Qq5kv5hhcFuFy0PJtvFX4bmOosaBrR84kqX5KLBFFzUEc6HYu6DcRmucycm+pwLw4z
         c1uAzgS+6IfRZYHJk5KJGH6BUXWCXHUvONFdF36/iOgG9fJm+Or6v5c3zg4rspaHH3g3
         HiltUNh0Van26IVMA9fB0iQ/2JU4EmqjOAKnh9wB4GYotEL+CBZNtjApM3/Mvn7TE8jd
         7annxlm42iGSeOwxHaUKhpp00xjGstfzsDYvTrigHwC9433728mLS/XLnCAvVdN12kQr
         08QyncQY1xCydyx4nySCZClEtVlnx7zpGvVuhHi5DCP1Pb+uzJy0FxU1zuboEdb75qqE
         HUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680616537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHkwTuEK0sRBaJKLMcnB+ss8uWVVS2sTLaR7SSh4ZeE=;
        b=jUxBYFMOWMhahKNLNadh6jIRUHQ3fIUzUd12JXC8tjoyQ0sXg1j78tgpTHpxbD6y+s
         PFf3H9tOnhMA8uUI8wUxhFOk6U6RC2yLK6d5NPzpOXrGkvTsb+lLDNYQG3Gwi6aaB2Lo
         m0rIJ+xrpzgUh++3IwC/Cf9v6R0E4pfsm2r1Kb2hEOWwJwrVG5IaKQqVt1lRhhMuZbP4
         eczWnZz/t7yjZ2Zu6KdJ8pTpvCA/lbEDDf1LZfkQazmoyExXMlCSOU2xlExn9a1m8Kcj
         imRMBr+L9DpFGv3HLGLBK8C2irtucxVzhK8lABHpz5zQOOLe9m0Bbs9I11mJo2tcSClp
         Vv0w==
X-Gm-Message-State: AAQBX9dtCAmI2E9QqwzM9REk8gvevUwg1v4pjjqwdRxMJdhd3Cr+xBG9
        RdeeBMQvlQ8FOT516H2tw4bUJmmJtx6sX2S4Xx7UuA==
X-Google-Smtp-Source: AKy350YrZFFIvslatnz6+JHLJxRXhURuO0Qe/CqTvhzL+6y/s/8tkJIoSvOoisaRTFct5e3xH8itE5OFyL+d4Sx3qSk=
X-Received: by 2002:a81:e545:0:b0:545:8202:bbcf with SMTP id
 c5-20020a81e545000000b005458202bbcfmr1485931ywm.9.1680616536968; Tue, 04 Apr
 2023 06:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com> <20230203-evk-board-support-v4-2-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-2-5cffe66a38c0@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Apr 2023 15:55:26 +0200
Message-ID: <CACRpkdYSpMD-V0QNGwtiKCA4KAedYfmFpvdCHWhjST9uTricTg@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 31, 2023 at 7:55=E2=80=AFPM Alexandre Mergnat <amergnat@baylibr=
e.com> wrote:

> This SoC is able to drive the following output current:
> - 2 mA
> - 4 mA
> - 6 mA
> - 8 mA
> - 10 mA
> - 12 mA
> - 14 mA
> - 16 mA
>
> Then drive-strength property is set with enum to reflect its HW capabilit=
y.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

This patch does not apply to my devel branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Can you please rebase and resend?

Yours,
Linus Walleij
