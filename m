Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57366BAA7E
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Mar 2023 09:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbjCOILg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Mar 2023 04:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjCOILd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Mar 2023 04:11:33 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DBC2884F
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Mar 2023 01:11:22 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id j7so7497405ybg.4
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Mar 2023 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678867882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pvx2PL8LGDK3W8+E79pZBCoBzTKmBaY+LVdR8n5TD/g=;
        b=MADLCMC7roVI8wwfAlxv6wEFm5zfJjNwB3x2CYtI/1xlOad5kMNBsm+9wMB1y2vb/o
         426UTDd7tLaZlGxGEGQB3jyu+LNU4kQqXlnpSD+KWHAjH+q+iFRib6Q0dD4YXaiFRA9F
         QJkGlLx0mO6VNDaY7KeG+RLoj94r8PqDhp5SHTCBLH5VUzQwtcN+F+pJcUSpGDj7Mpjh
         1sPr3i+6R1l53pYS2+ib2V2t6wEj0Y9G72h6mYJtyVwBjDOXecFbWxOtIRf1FwKzNMzM
         PgFzBGDqHoyXvW9VlzHbIo5zLl0wM5Z7Y8/oAoa/DrA2ApWE4tGM9BTkxkT72lfvtcPy
         4LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678867882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pvx2PL8LGDK3W8+E79pZBCoBzTKmBaY+LVdR8n5TD/g=;
        b=AEhXeOOt2/gbmaBiAv4p1dGEF4VAmNPQCbvFK5AQCiUS3AbTM4V3QilAYjjB/ODtZ7
         2H5cSr+hegzoI9uWuLYYI8MuKj83fn5eAj1Wo0h7ys7dDiCtAXNXE7jcLKqg4OlcQ9qb
         MQLkfiX6f07IXkkgLYzXZ4cnbZBfSRJeFWF9Bx0JyLFvvDmWbrM+seWTdebjpDj8zljo
         OrXcj+UTX7sWxpKUGpqnF8ytapOOGHL3d18w4bdRUuufQo9GflVeel0MxE1ML9cf3IoU
         hpufyWEdl0vZoRkrInddph+JdT6bqzOhtu6BLQ5uIKYljoun5kwEYi9bIOM4YPKQ/EMh
         H0AQ==
X-Gm-Message-State: AO0yUKVF9ushl8qFzlQjcP2mcNrWDqReimnGbdRDXh0L9s8gV1RJkcaS
        nfq167wYbse86x/O7csgqyUn9O/qvBs6HjCotKbz8Q==
X-Google-Smtp-Source: AK7set9A2zYI6pMRgNbXuK7nABMIl97HViLafw5PcRY262FGkwm8Z05z1Fr8by8LQaDAAqC5HXIwCelI1ertWu8vEmg=
X-Received: by 2002:a25:8d89:0:b0:b33:531b:3dd4 with SMTP id
 o9-20020a258d89000000b00b33531b3dd4mr8108839ybl.1.1678867882064; Wed, 15 Mar
 2023 01:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
 <3b7c6f28-57bd-33de-5531-8c4eae8cf6eb@linaro.org> <6e08d78f-ef4c-b228-f7d2-d63767ea87b8@collabora.com>
 <62ed2988-2347-9fd9-82f9-6dcc9ae75808@collabora.com>
In-Reply-To: <62ed2988-2347-9fd9-82f9-6dcc9ae75808@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Wed, 15 Mar 2023 09:11:11 +0100
Message-ID: <CAFGrd9rZxwtxx5f8Gp35-5152EPGiyEdZjps1Mhn5bL6QfufnA@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
        devicetree@vger.kernel.org,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Le ven. 10 mars 2023 =C3=A0 10:49, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 10/03/23 10:46, AngeloGioacchino Del Regno ha scritto:
> >
> > Anyway, Alexandre: can you please perform a cleanup to the MT8365 pinct=
rl binding?

Yes I can ! :D
Should I do it directly in this patch series or (I prefer) in a new one ?

> > The cleanup means you're setting mediatek,drive-strength-adv as depreca=
ted and
> > adding the right properties (...and possibly changing the devicetrees t=
o use it).
> >
> > For more information, you can look at commit history for the (unfortuna=
tely, named
> > incorrectly) MT8195 pinctrl documentation: bindings/pinctrl/pinctrl-mt8=
195.yaml
> > where we performed the same cleanup that I'm asking you to do, except w=
e didn't
> > have to set any property as deprecated because there was *no devicetree=
 upstream*
> > that was actually using that property (hence not an ABI breakage).

Thanks for the information, that helps.

Regards,
Alex
