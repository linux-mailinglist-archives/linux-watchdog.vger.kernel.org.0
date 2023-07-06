Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2D47498BC
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jul 2023 11:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjGFJwJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jul 2023 05:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbjGFJwI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jul 2023 05:52:08 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603CD1BE1
        for <linux-watchdog@vger.kernel.org>; Thu,  6 Jul 2023 02:51:58 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so725394a12.0
        for <linux-watchdog@vger.kernel.org>; Thu, 06 Jul 2023 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688637117; x=1691229117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVGkBHunqq0WclHIc25+RfH+0z//VIZucSEpeQRiW8s=;
        b=VIJlzrjuHuzsA6SW10ItjHtlPPao4pjqTZMxMXsxtahq73i6c6ledJGrmnm42EUmqW
         GpbVTszkHj0lyt6179dqIv1ZrlFPNJFFqIBxMUfff9Usg/zar0oN9JxHFvqciT3Kx8RU
         ydCy240/LeLXILmeg9iBBFjlCxbnDSlN5KlTzDdflVnCXf0rphz8KrKyC/iigOEPjwkQ
         9TJZPwDPIvZq9Lo5QIXY9YS/1AWFnzn9qoCfSbyAsjRcv6S5O1/aHqyXNxY5dsmw7e/P
         58qhjSrHXXIGz2bWeSStPYrDT4f6QNj3Awa0ttthoOTzSHf+RLagmjRpfyqUgiMjJ0aa
         R0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688637117; x=1691229117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVGkBHunqq0WclHIc25+RfH+0z//VIZucSEpeQRiW8s=;
        b=f0IzEdygO8aUoRQs+gc2rSBWOqOr0xmAdr6WpO40eER3j+lfc9yK0ExjOD6unUhdYn
         b7QOR1EjXdNGp3KduK4cCrO3j5Sjd1EqHigo149gzJa44mKWm9tzzARVIRimTsIcoiXF
         35vN2EW436OnrW6f36Dzira5xRNihoWdAIG9sbzdJWEWABNiY4cBe25LNjT0QRBRnqrZ
         Kk7OVW4dB9m7RUh06ru0sexo9mEGMBvB5nJJq/GKli21cnPy+PJKEFQ+GjLAzcMlN1Lg
         qrQCcZ4BsSw3w16paIiw3rwoO1YLuGFcSQFF094BXB8uW/YV7ZKY5QUAWkYYJ/QVNn5Z
         d5QA==
X-Gm-Message-State: ABy/qLa5XU9S+1e1QyZKppzkREAhOhaCowd0TYLfQhg6M31GdVoomJDN
        bumuWIMLCPZZ/2XW+fnOW/DtXdef5kvvjdfO3RfLGp5cA+s=
X-Google-Smtp-Source: APBJJlEoqUgdXCO3qM/FSFChS6Aw8+u4z254mXnH+H+g/ZLx+v5mWk+yjdO08Z4m6DkOzwexpHFTi1TT/P0kw5K0AQo=
X-Received: by 2002:aa7:cd8b:0:b0:51e:1656:bb24 with SMTP id
 x11-20020aa7cd8b000000b0051e1656bb24mr1050744edv.26.1688637116620; Thu, 06
 Jul 2023 02:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230705122357.GA14855@www.linux-watchdog.org>
 <CAJhJPsU1LHoTxeekFLZtZpKm0dGysf8U3=rTRwFrEyvR3iA34A@mail.gmail.com> <20230706094236.GB1442@www.linux-watchdog.org>
In-Reply-To: <20230706094236.GB1442@www.linux-watchdog.org>
From:   Keguang Zhang <keguang.zhang@gmail.com>
Date:   Thu, 6 Jul 2023 17:51:40 +0800
Message-ID: <CAJhJPsXCbwNh5D1CQ5i-kbqTkeqi8Hs2C4vo8PoVkuvYN=fM8g@mail.gmail.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.5 release cycle.
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Thanks very much!

On Thu, Jul 6, 2023 at 5:42=E2=80=AFPM Wim Van Sebroeck <wim@linux-watchdog=
.org> wrote:
>
> Hi Keguang,
>
> > Hi Wim,
> > Sorry to bother you.
> >
> > On Wed, Jul 5, 2023 at 8:23=E2=80=AFPM Wim Van Sebroeck <wim@linux-watc=
hdog.org> wrote:
> > >
> > >
> > > Hi Linus,
> > >
> > > Please pull following watchdog changes for the v6.5 release cycle.
> > >
> > > This series contains:
> > > * Add Xilinx Versal watchdog
> > > * support Hygon FCH/SCH (Server Controller Hub)
> > > * Convert GPL notices to SPDX identifiers
> > > * Other improvements
> > >
> > > The output from git request-pull:
> > > ----------------------------------------------------------------
> > > The following changes since commit 547cc9be86f4c51c51fd429ace6c2e1ef9=
050d15:
> > >
> > >   Merge tag 'perf_urgent_for_v6.4' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/tip/tip (2023-06-25 10:13:17 -0700)
> > >
> > > are available in the git repository at:
> > >
> > >   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.5-=
rc1
> > >
> > > for you to fetch changes up to 009637de1f65cff452ad49554d1e8ef9fda99e=
43:
> > >
> > >   watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub)=
 (2023-06-26 14:30:07 +0200)
> > >
> > > ----------------------------------------------------------------
> > > linux-watchdog 6.5-rc1 tag
> > >
> > > ----------------------------------------------------------------
> > > Bagas Sanjaya (2):
> > >       watchdog: Convert GPL 2.0 notice to SPDX identifier
> > >       watchdog: ibmasr: Replace GPL license notice with SPDX identifi=
er
> > >
> > > Keguang Zhang (1):
> > >       watchdog: loongson1_wdt: Add DT support
> >
> > Did you miss the following patch?
> > dt-bindings: watchdog: Add Loongson-1 watchdog
> > https://lore.kernel.org/lkml/20230511121159.463645-2-keguang.zhang@gmai=
l.com/
>
> Yes I apparently did. I'll add it.
>
> > >
> > > Krzysztof Kozlowski (1):
> > >       dt-bindings: watchdog: restrict node name suffixes
> > >
> > > Srinivas Neeli (3):
> > >       dt-bindings: watchdog: xlnx,versal-wwdt: Add versal watchdog
> > >       watchdog: xilinx_wwdt: Add Versal window watchdog support
> > >       MAINTAINERS: Add support for Xilinx versal watchdog
> > >
> > > Uwe Kleine-K=C3=B6nig (1):
> > >       watchdog: ziirave_wdt: Switch i2c driver back to use .probe()
> > >
> > > Yuechao Zhao (1):
> > >       watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller =
Hub)
> > >
> > >  .../devicetree/bindings/watchdog/watchdog.yaml     |   4 +-
> > >  .../bindings/watchdog/xlnx,versal-wwdt.yaml        |  50 +++++
> > >  MAINTAINERS                                        |   2 +
> > >  drivers/watchdog/Kconfig                           |  18 ++
> > >  drivers/watchdog/Makefile                          |   1 +
> > >  drivers/watchdog/ep93xx_wdt.c                      |   5 +-
> > >  drivers/watchdog/ibmasr.c                          |   3 +-
> > >  drivers/watchdog/loongson1_wdt.c                   |  13 +-
> > >  drivers/watchdog/m54xx_wdt.c                       |   4 +-
> > >  drivers/watchdog/max63xx_wdt.c                     |   5 +-
> > >  drivers/watchdog/moxart_wdt.c                      |   4 +-
> > >  drivers/watchdog/octeon-wdt-nmi.S                  |   5 +-
> > >  drivers/watchdog/orion_wdt.c                       |   4 +-
> > >  drivers/watchdog/rtd119x_wdt.c                     |   2 +-
> > >  drivers/watchdog/sbc_fitpc2_wdt.c                  |   4 +-
> > >  drivers/watchdog/sp5100_tco.c                      |   4 +-
> > >  drivers/watchdog/ts4800_wdt.c                      |   4 +-
> > >  drivers/watchdog/ts72xx_wdt.c                      |   4 +-
> > >  drivers/watchdog/xilinx_wwdt.c                     | 201 +++++++++++=
++++++++++
> > >  drivers/watchdog/ziirave_wdt.c                     |   2 +-
> > >  20 files changed, 301 insertions(+), 38 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/watchdog/xlnx,v=
ersal-wwdt.yaml
> > >  create mode 100644 drivers/watchdog/xilinx_wwdt.c
> > > ----------------------------------------------------------------
> > >
> > > Kind regards,
> > > Wim.
> > >
> >
> >
> > --
> > Best regards,
> >
> > Keguang Zhang
>
> Kind regards,
> Wim.
>


--=20
Best regards,

Keguang Zhang
