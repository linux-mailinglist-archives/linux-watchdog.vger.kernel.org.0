Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608B8578536
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jul 2022 16:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiGROVN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jul 2022 10:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiGROVM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jul 2022 10:21:12 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CAA6276
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Jul 2022 07:21:10 -0700 (PDT)
Received: from mail-oa1-f50.google.com ([209.85.160.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3UEW-1oDzqp08ag-000cFv for <linux-watchdog@vger.kernel.org>; Mon, 18 Jul
 2022 16:21:09 +0200
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-10bf634bc50so24053609fac.3
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Jul 2022 07:21:08 -0700 (PDT)
X-Gm-Message-State: AJIora8r2YVfcfozk7jBa4E/5ThTqDiuC2n9kSVJQxTOoCF0XxvNFgV6
        cV6KkLemMmFuWvGAWUW7uZcpQz/doLSAlBM/DSU=
X-Google-Smtp-Source: AGRyM1u3T7s1p1tMCI3Ux3IMuwbe7i4DiTt+21krVOs89HFUCcgbDFyHfQD+kzZHPRaiPmpi1WSRcKQJW4jBIRjM+80=
X-Received: by 2002:a05:6870:6114:b0:10c:6bf:542f with SMTP id
 s20-20020a056870611400b0010c06bf542fmr16739255oae.188.1658143714477; Mon, 18
 Jul 2022 04:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220706165406.117349-1-tmaimon77@gmail.com> <CACPK8Xd0n5cpsCJ6guPzEj8JfXkz_ERzU3VdXW-Xx2QX8ssNKg@mail.gmail.com>
 <CAK8P3a0Ojf1hm5Q2FJZEGLygku+qkPmKnKpBD8eAZPeRZtb=gw@mail.gmail.com>
In-Reply-To: <CAK8P3a0Ojf1hm5Q2FJZEGLygku+qkPmKnKpBD8eAZPeRZtb=gw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 18 Jul 2022 13:28:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Dh+wTyPYhvv5c-wsqMK24ZgqPWHw2C7xuFh9vL53XfA@mail.gmail.com>
Message-ID: <CAK8P3a3Dh+wTyPYhvv5c-wsqMK24ZgqPWHw2C7xuFh9vL53XfA@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] Introduce Nuvoton Arbel NPCM8XX BMC SoC
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        Jiri Slaby <jirislaby@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Robert Hancock <robert.hancock@calian.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Qin Jian <qinjian@cqplus1.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:NH4leMXlbzQhyBB3UMIydoNuubOb5LdJ1qaHn3pnqfDW/EWfFGN
 GVdmWiht72SrnHd9zbqGNe17He+ayKaiBfVe1dIQSq4v+BI15fyVox60ng3H55gV/uMRs8j
 lJI0dtakGVMmLZyuY3d/tI8sZiOhECQigIEr3yex/ZGaCwHSA/nhvlAkaEl78PcxxnKYudK
 GLLrYFNIuSxKgWxTSRoxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yzVU3sfF8kM=:MrpR+C/MlOPZozJtsAMvG9
 kV+yy9gGX99spkILJ5bsI5hDHkZIzY7NKyrMpiDEj2r9VkhmgjnUMf/hR3BOLpPMopP6lcJC3
 pvZV3dB21pOG2iQD6vRFUOkz9Zz/PXVBIg6bNi1iwCu51ZwZI0PNrWJjPyc9FeZA+6rb8UqGB
 EPnnJHIoxHCCaFcM4YO3ZgOTSESpChLTzZ2OFEuGG2wv0VIO2BYgCvbNOphCPNWSYdG3efwUi
 kjJRxhcfLat1sx/NklLlFDYsM5Q1443igkj/LClgsu32N39hPOn7uo+ZahNetmqHJAdK0hjId
 gy/CbDq6oye8KPPksVamx/wbm5zxw7tx6hCr9ja3N6ikufv9dk5yGDlPLqcB+3XYLk3OKqD8/
 LW4f9OGautJJ+I8OvsGtSGS54r1MJekDEkT5ibWqN4Liwp6U6Pd14dWdVJ3FLXN0KmEB0JH0R
 XlcXw8Nd7r1D4RzCK2Wh0+8+tLZ0ph6JgsLSquMgx4sGuJcWaxaOJ35t6HkOstM2EARqfNE1A
 2IZLOaToU8hf0dOnIiJuwmZmjpyda+5QVl8wG3I7jrwuyWhrNoghL5XbPwPFsjavAWUZpGCi7
 MyKxsuHPC1mvp7drZd+6DhIGg8QEJsVUUX/BYF4YDK79G3Su4mx9nL/yioKjYjeJ4TDm05b/Z
 pJRIEXwlOgACOZ0BLrb7M4MozoecK3iQEgRN0rTS0EXs4JhGbMZLIGWvHFOo5l1BIyDvGvDit
 hSp/44RJNeGM4va+REv1oiuplVW7FekdZcjHODufWGVN9FyTqnjZO/B7suwN/XEgggBa54whG
 lHyThxo22H1sCG5ZyulTGRC/0w/9TruDKq0UZ8yjjm1in0CQwdUgJYetBWzVlhv17br0/jA9b
 v41L3tmjd7gJ8E7FMMQA==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 8, 2022 at 3:45 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Jul 8, 2022 at 8:50 AM Joel Stanley <joel@jms.id.au> wrote:
> > Are you happy with a cross tree new soc branch for this series? If so
> > I can put them in a branch and get some build coverage before sending
> > them out.
> >
> > (I notice the clock and reset changes are waiting on acks still)
>
> Yes, I think we should merge the parts that are reviewed already, but I'd
> leave out the clk (4/16) and reset (9/16) patches in this case.
>
> Krzysztof has reviewed the binding changes, so I don't mind having
> the DT nodes added in the soc tree even if the two drivers are still
> missing.
>
> I would do the same thing for the sunplus SP7021 platform that
> Qin Jian has been posting, as this is also waiting for a final Ack
> on the clk driver.
>
> I would put both of the new platforms into a single branch in the
> SoC tree, separate from the usual dt/drivers/soc/defconfig
> branches. I was already planning to pick npcm8xx up myself,
> but if you can do a pull request, that would be even better.

I see there is now a v9 of the series, let me know if I should
apply some or all of those, or if I should wait for a pull request
from you.

I've just merged the Sunplus sp7021 support leaving out the
clock driver in order to make progress on that one, and
we can do the same thing here if there is still ongoing discussion
about some of the drivers. It would be nice to not wait too long
though, as we are already past -rc7.

      Arnd
