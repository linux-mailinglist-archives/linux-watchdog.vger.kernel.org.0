Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE5C6B2604
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Mar 2023 15:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjCIOAD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 Mar 2023 09:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjCIN7h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 Mar 2023 08:59:37 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249A4F1849
        for <linux-watchdog@vger.kernel.org>; Thu,  9 Mar 2023 05:56:45 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-536bbef1c5eso36183657b3.9
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Mar 2023 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678370204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhxj3g02U6JfJorCEqukLhEPbi5ScM6y20Fj/uWtxsc=;
        b=M6OUagewNatTVBWogs7CL7Frl+ekF/MC2BZgxAEhzQWeyuSsXaRpkf4c99DXMGsgc6
         GIkzhUNU2BURb1j3QuJVpX9peQPez+0A+Lwv3I+Pr4W55I9ScaDo7aFhChRp0sadmIiL
         0lKL1TZ0CxVdMF8HoIQ/7ufJEuKA5Dra+MJuKUyHRmB9rs9CuHe4y70Qv5xVu1WwZK0B
         1vXdXtOHzSOCFokSbLcL3GvOf4lTYuXwXKVhUa8ogJNH81T3PpCdFdiMh5PpBeOSTCOE
         8RasSI/d7wlsztguwb8tqjCkoykqGh1gdjoQgiePJjOS2aABefBearXVltjCsf9a3xlk
         bqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhxj3g02U6JfJorCEqukLhEPbi5ScM6y20Fj/uWtxsc=;
        b=wpwGYZCMemDXhQTh3ggIFOwnxO0lzRdH1IuMOYqevuk9UdPS91Odc+pjxT6c1FDTrq
         4fdiPDw8+SA3vdKktCLzpPwYVX24EhLfvbzAhKrmf26MvHZXwJt4hoqHKFNWNAh7Xwy3
         SztFOKaUmuo9knx0yg8O5qwgs1xLsUuPbCU1M9cjdB3rz1UMQaXKijmwKuHuANfkFXhE
         uq2AwA+blP5tA2UeDOBeWE2+9csw43V++xbpOJQpfwjbbxs1w7w2x82ZJ8wUBsHWDJJS
         MyCxQ1Y4DOQNqyjBRCtbN5QevhuFikQ2SevHm2bOi62HpDz2FELppGApr1McyRv7/aZu
         RfMg==
X-Gm-Message-State: AO0yUKWEI0LGQFl992Hdm4GP/9gQuCgD7aVpabbIpcyNzY+B43NjehJJ
        snfhGxveBX7NDnnD5cEOT8XRPBZhGvC4x45jdGeSHLprgNivpbge
X-Google-Smtp-Source: AK7set8C8YjXMi5gSQYXdOX+ayCa5RjgmjqpOw5RNChqcaFChToV9jRVJLPT0IsYxq4ctbaJ0y/nV2OJRYi9K+NoTvc=
X-Received: by 2002:a81:ad63:0:b0:52a:9f66:80c6 with SMTP id
 l35-20020a81ad63000000b0052a9f6680c6mr13521476ywk.9.1678370204353; Thu, 09
 Mar 2023 05:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com> <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 14:56:33 +0100
Message-ID: <CACRpkdb+CQFOW8zjK2pGhRX=tBUcJAyVN=ohEt8eccndA2nYpA@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Mar 7, 2023 at 2:18 PM Alexandre Mergnat <amergnat@baylibre.com> wrote:

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
> Then drive-strength property is set with enum to reflect its HW capability.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Is this something I can apply directly to the pinctrl tree once the DT
maintainers have
had a chance to look at it?

Yours,
Linus Walleij
