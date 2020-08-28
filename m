Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73442557EE
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 11:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgH1Jmx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 05:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgH1Jmn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 05:42:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4259BC061235
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Aug 2020 02:42:40 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w25so565298ljo.12
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Aug 2020 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aOHxtM5yk1gvAYHJqAG90Qc4zP0j2G+j6TpnDxaoDIA=;
        b=L98VAkj/cNInmoKUxH8AOMVGrtQB6tuwlU+TtqyN5Ybq0OUUvv1/WwZwP/2Q2BHyKh
         vqUlX41ul/3RpVcXqGfRbkUmVVvq6H1hEWgDQMRDV/7DaH91K3EGhG9soVvrYxzDayLX
         Eqax3EwZJned8+IDqYNTwphOYkkSSaXo2hXUr/bYJbdL0c1Fcq87vv4Q3drcyo/ypkPU
         uHS6o48yHpMIBAWuJqv1j5jmWKbAs7euGm039AzZib3oBy7mF/xCc8cB+9yD3drlKdM8
         Vu8bGjLkz3mCqUOQuR1k2EBXuw7/zEKf7s116YtbCzzU427zzOjEE516m3pOeDUBdRQZ
         vWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aOHxtM5yk1gvAYHJqAG90Qc4zP0j2G+j6TpnDxaoDIA=;
        b=fZXE8k65mf72bUt4k3U7bA6pFbiWS9zC2WydtjcrpZvPBoeJE2saED+FJJVT7Yebny
         D/MGiXibN3HRwW7E/2oMpuS15NQ+JaxIj9auRj6uwq5rn83UdV3i7qzm2ROZWqidc7Fd
         kvZoMuc6l1sb16aIgvWcc+mW/tI7LYFnM/HTHT52c4xx3ETX4F6eS2KtVQw6PyLud2Qi
         V8+f+XFL8YcF606NUL+rS+1GeSkc1048gfugvD+D2r9p2wtsUDAhxclkhnrmSu0yleDJ
         NGi7bz2jLNlCQ3tIvnTuDa90AHJGffWGibvfjg5DksUfzXst3kApxcso56fZj6qwvHMw
         No9g==
X-Gm-Message-State: AOAM5320hx2Tx+a99ecx9eM9ovdvk6/KhmriqtQQnHWzYkxaKPL4HzTg
        TmeF13P8hk5sAKXoRL2WvK3PXEA+S9+VpnTsOyS+VAAfznk=
X-Google-Smtp-Source: ABdhPJyoS2eg46/tyZ0yOApwD8OZKfUAZkgcEVLTK+EqD3GisGxH98dOWf4tudhOdF9/ATIaddWgil7TZpkYIeZMjNY=
X-Received: by 2002:a2e:558:: with SMTP id 85mr495792ljf.293.1598607758211;
 Fri, 28 Aug 2020 02:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200823161550.3981-1-krzk@kernel.org>
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 11:42:27 +0200
Message-ID: <CACRpkdYRk=1m0+FoE2YKYtwh+Vt6sFbh6w-m1t04YMV0WJR5VA@mail.gmail.com>
Subject: Re: [PATCH 01/22] dt-bindings: gpio: fsl-imx-gpio: Add i.MX 8 compatibles
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-mtd@lists.infradead.org, linux-pwm@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Aug 23, 2020 at 6:16 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> DTSes with new i.MX 8 SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
>
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
>     compatible:0: 'fsl,imx8mm-gpio' is not one of ['fsl,imx1-gpio', 'fsl,imx21-gpio', 'fsl,imx31-gpio', 'fsl,imx35-gpio', 'fsl,imx7d-gpio']
>     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
>
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
>     compatible: ['fsl,imx8mm-gpio', 'fsl,imx35-gpio'] is too long
>
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
>     compatible: Additional items are not allowed ('fsl,imx35-gpio' was unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I'm just waiting for some review from the i.MX people on these FSL things,
then I can apply it.

Yours,
Linus Walleij
