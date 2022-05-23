Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290F2530FDB
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 May 2022 15:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235959AbiEWNO5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 May 2022 09:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236013AbiEWNOP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 May 2022 09:14:15 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FCC544EC;
        Mon, 23 May 2022 06:13:37 -0700 (PDT)
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mn2eN-1nSuHP06tz-00kBm7; Mon, 23 May 2022 15:13:36 +0200
Received: by mail-ot1-f46.google.com with SMTP id g13-20020a9d6b0d000000b0060b13026e0dso2056789otp.8;
        Mon, 23 May 2022 06:13:35 -0700 (PDT)
X-Gm-Message-State: AOAM533z+6UxQMa6HNrMHJ6ub7hEcPGwR05V46hFKnbB6o/+jo0u9IyG
        LZnBzHrKsDwJBdHes8zH0DEuO5OvTstHca1uUyg=
X-Google-Smtp-Source: ABdhPJww6UI3VHujKsiD4GORINdaaD7sInRUTDtpI+wOKYOknAfrhPLfgU/Tcrezf+twApFr3bW/yO+tBPWuypHA/W0=
X-Received: by 2002:a25:c747:0:b0:64f:62fb:f55e with SMTP id
 w68-20020a25c747000000b0064f62fbf55emr13692906ybe.106.1653299558644; Mon, 23
 May 2022 02:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com>
In-Reply-To: <20220522155046.260146-1-tmaimon77@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 23 May 2022 11:52:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2CUy17vbd5Go523894vcF_oLz=dAR7JNLsUuR1Gsc9sA@mail.gmail.com>
Message-ID: <CAK8P3a2CUy17vbd5Go523894vcF_oLz=dAR7JNLsUuR1Gsc9sA@mail.gmail.com>
Subject: Re: [PATCH v1 00/19] Introduce Nuvoton Arbel NPCM8XX BMC SoC
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        gregkh <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Jiri Slaby <jirislaby@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        robert.hancock@calian.com,
        "nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
        Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:alt7ILHwRIljPmzaXRDqVUE9bi6SETHTV4oq2XdrPids99Dcq9o
 J4WjEaysTHkRjeSxmZz/RufbdF4iqI0/VHekehJDBoE9t3o7SIfvcuyNbnbtXEDFzM+kbVz
 1E6oqcxt1zecGBKAtkmIhutZ1tuJY8uQklwv/xUZK6TrzI7vzROOh2oCtCCCR8Hp0b7bqYK
 KKQiul3Lk+0pytYDLADtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PbgzhMWW664=:J9vzSsqyvMt0MHlGIS691W
 trsdtKEGMQD2JBwjHsF0EP4CwZA16V24LYXkNc9Ly7wD1HqBBpfru5tHygXwQqXKD7zOOmDnn
 Tw+FNS3imeie7iMBhwa0voRhgc79P7AcTikS48euqKO32Mz9l3R1scyzfb3Zo7AB0eTuYVlVF
 9gbmu6UQ19q5SuIAPGQRgu26QRql5BtVtSWsoP1xe5aNJcYxtdQxUxICUAg4wlhMHHxCRpCnS
 wh5qeu9bRpxqyTMTIUwDo7Q68gfDEijNUb9aiYkU+/ptzYuZv8FSIy7nCwRdca/yfm9GfYDHp
 fIlmPlNn9h5MWbHjN0niOM3OcSnvCXRD15SsTImZYVkCMD9dj490ww3xbbhxHaE8o3LUlTlYw
 SMsdzysG1XyMlNl7J7cRiYJu5wv9Q+m6Nqlt/2UlDfrhbw/AwJfu8fF+LsppZrCXbIeOOaiIO
 +VUBv2v/eG0RlE698XVy3rjFAdvTMQijrsjfbnrtIx6yEEtNJYcIapIVaDVunE1/gYc0ppRSp
 CrT6HsuZk4fMIBr80QStOBClvJEkwAnQhI03mWGXtYDM95Qd8WiH+gi14CnHg2xAgt6DAg3QY
 uEmIEIk81TABkFI9y7Wt4fkl9YH8xnL7UH8Yey1S0hsJXwBcd4pFsme8Lg4w926lUqNqKz3r6
 vG+CDw0ayPCBgwaIyMxyELDxVQSUj5laMsFdvCcHPFcYvh8ej4kPca/Fy1VNzXaPBmM7gx/KD
 wIAJuA2X0o0uSiDhBdtTY/Wy3lhSIZuza925cimnIrzzWjaJAOtErd8Y3qFgHLH48tm8JKZf7
 YH2W0OUe3Dv12doFGkHxG1bT9Q/WxpfZOCQVvJI89FnyHxXI0VeExvHwZL2ElBvN7z3grjNEu
 wAuHauKMIcnRvwrcoHNA==
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patchset  adds initial support for the Nuvoton
> Arbel NPCM8XX Board Management controller (BMC) SoC family.
>
> The Nuvoton Arbel NPCM8XX SoC is a fourth-generation BMC.
> The NPCM8XX computing subsystem comprises a quadcore ARM
> Cortex A35 ARM-V8 architecture.
>
> This patchset adds minimal architecture and drivers such as:
> Clocksource, Clock, Reset, and WD.
>
> Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.
>
> This patchset was tested on the Arbel NPCM8XX evaluation board.

Thanks for your submission. Please note a few things about the process here:

- The merge window is currently open, which means a lo

Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.

This patchset was tested on the Arbel NPCM8XX evaluation board.

Tomer Maimon (19):
  dt-bindings: timer: npcm: Add npcm845 compatible string
  clocksource: timer-npcm7xx: Add NPCM845 timer support
  dt-bindings: serial: 8250: Add npcm845 compatible string
  tty: serial: 8250: Add NPCM845 UART support
  dt-bindings: watchdog: npcm: Add npcm845 compatible string
  watchdog: npcm_wdt: Add NPCM845 watchdog support
  dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
  clk: npcm8xx: add clock controller
  dt-bindings: reset: add syscon property
  reset: npcm: using syscon instead of device data
  dt-bindings: reset: npcm: Add support for NPCM8XX
  reset: npcm: Add NPCM8XX support
  dt-bindings: arm: npcm: Add maintainer
  dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
  dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
  arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
  arm64: dts: nuvoton: Add initial NPCM8XX device tree
  arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
  arm64: defconfig: Add Nuvoton NPCM family supportt of maintainers
  won't be reviewing your patches at the moment. It may be better to wait
  for the -rc1 to be out before sending out v2

- don't send your patches to soc@kernel.org unless you want me to pick
  them up into the soc tree and they have been reviewed already. The series
  is clearly still under review at the moment, and I expect it to go through
  a few revisions first.

- gmail marked your emails as possible spam for me. I don't know what
  happened here, but you may want to look into this to ensure that
  everybody receives it.

Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.

This patchset was tested on the Arbel NPCM8XX evaluation board.

Tomer Maimon (19):
  dt-bindings: timer: npcm: Add npcm845 compatible string
  clocksource: timer-npcm7xx: Add NPCM845 timer support
  dt-bindings: serial: 8250: Add npcm845 compatible string
  tty: serial: 8250: Add NPCM845 UART support
  dt-bindings: watchdog: npcm: Add npcm845 compatible string
  watchdog: npcm_wdt: Add NPCM845 watchdog support
  dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
  clk: npcm8xx: add clock controller
  dt-bindings: reset: add syscon property
  reset: npcm: using syscon instead of device data
  dt-bindings: reset: npcm: Add support for NPCM8XX
  reset: npcm: Add NPCM8XX support
  dt-bindings: arm: npcm: Add maintainer
  dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
  dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
  arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
  arm64: dts: nuvoton: Add initial NPCM8XX device tree
  arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
  arm64: defconfig: Add Nuvoton NPCM family support

- For an initial platform submission, I can merge the
  clk/clocksource/serial/reset drivers along with the platform if they
  have an Ack from the subsystem maintainers. I would normally
  not include the watchdog patch in this as it's not essential, but
  I suppose that it's fine if you only do a oneline change and it
  has an Ack. If you have other nonessential drivers that need changes,
  best submit them separately though.

         Arnd
