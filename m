Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFCFF6D2807
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Mar 2023 20:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjCaSqN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 31 Mar 2023 14:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbjCaSqM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 31 Mar 2023 14:46:12 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3959F2031D
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 11:46:05 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-536af432ee5so432564627b3.0
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680288364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zb6xLZTQTQfDOfnoLhLa6/IVI8QnMb1cauJ4IIp9pzk=;
        b=T8YJTdeMYbb5+drzr4PfwSAPqM0g2ur1tDsqj0l9TLQw8+V2H3RKsATUpFv8ILGFeF
         jRgBFoslWA5UWvvGMuGLLKHXjoEfsJxZm/z12TEe2Ri8mBh0nVkcqjnIuPrmYW2OVUyR
         SGb72wCQFq79qxru/phdmgHFLqNKp0YzEvHeOUu+3ej1ML+s4JtnpHUal4G1GDqGMk65
         yFegAuuOH8/q7xvzzcfwcOXRA32jXAxxKYjnX3GRrS/h//SZb5nyl+gqSulMDW+8RMYl
         P2hdl1o9gO5QKMKl9toztNs0lmlfUhD3IU6Y+rJlz3r0Mm1SGP57kPMihEtIJIH/JT1o
         MrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680288364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zb6xLZTQTQfDOfnoLhLa6/IVI8QnMb1cauJ4IIp9pzk=;
        b=qu8Jd8gAp9WCWEPTQLh7FjbUM9DoT4h+B9a2qE5Kgc73g10NJD4HK5sFtE7Cc7Jfb8
         OORt7f1x1psxdVLO1/d/ZvWcoBCiU3T5unOr1bGWciqZyr/xlSYepswIun0FQqo1IMKO
         jknbVsbIvzyV0PLfcePmrjzc9gfg9LffzDFRO4BoyzWGYKhyGxzdaswZRk/7A7XSStC+
         JzoQzdKJd7S63wN8pQreOsHoHFGR0jUDmcoy5SGYVSovJAUU3QTBCc6BOG7kdHtKydua
         g4ohma/As3bwT7SFqgDMuJN4iPnzQ8lZJa+Hp2P8TL8Gt1TKmKjLKbPtrKl1hAq5LPSF
         Pl0w==
X-Gm-Message-State: AAQBX9dn66pD6IU0sv6+FI6IMEACmWtFHmJZ1XFtH59XBS8i6KaxpneK
        9aH4q9cKagp7UqtYrW1kTcz+M+o5ubCYqRuTVQrK1g==
X-Google-Smtp-Source: AKy350bgwepPnwHMRW0YSZuNpQ8dtHQVLT8+IDDu10nrt86RgYns1z2FMH6EnSP3ABnDRvDAIqVyiIAEzbdJAM+G6zI=
X-Received: by 2002:a81:ac55:0:b0:546:1e9e:aa01 with SMTP id
 z21-20020a81ac55000000b005461e9eaa01mr6163297ywj.3.1680288364273; Fri, 31 Mar
 2023 11:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com> <7hy1ncydtc.fsf@baylibre.com>
In-Reply-To: <7hy1ncydtc.fsf@baylibre.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 31 Mar 2023 20:45:53 +0200
Message-ID: <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
To:     Kevin Hilman <khilman@baylibre.com>
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
        Linus Walleij <linus.walleij@linaro.org>,
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
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

You forgot to apply the patches merged by Matthias:

Changes in v4:
- Remove v3 applied patch from the serie:
  - arm64: dts: mediatek: add ethernet support for mt8365 SoC
  - arm64: dts: mediatek: add mmc support for mt8365 SoC
  - arm64: dts: mediatek: add mt6357 device-tree
  - arm64: dts: mediatek: add pwrap support to mt8365 SoC
  - arm64: dts: mediatek: Increase the size BL31 reserved memory

...

Changes in v3:
- Remove v2 applied patch from the serie:
  - dt-bindings: mmc: mediatek,mtk-sd: add mt8365

Regards,
Alex
