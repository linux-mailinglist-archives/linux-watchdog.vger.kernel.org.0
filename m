Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6185C74848B
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jul 2023 15:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjGENBu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jul 2023 09:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjGENBs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jul 2023 09:01:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF90A1700
        for <linux-watchdog@vger.kernel.org>; Wed,  5 Jul 2023 06:01:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so5096127e87.1
        for <linux-watchdog@vger.kernel.org>; Wed, 05 Jul 2023 06:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688562105; x=1691154105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6Y9F685UiU32EhKs6HMAHn4FbBX2KCKKX1PdAqE0sk=;
        b=bUctXmlRQswT3IwhOzJjsMuYFEH7so6hwdd6NiquddTsL4eNQszv3+JiyJPhbJud9J
         j4nEyRh9EXXU/lmjpEo+9eadv0Yk5HnLl9R4Z2PssezJuvpd0mXkCAIrDHUAywbDh/+v
         4B1D/JcSp2uoyMBpcdpoAzFr7wQOpxEZ4P4zdfe1LwieuLVri8qa6KvBRxDcsRL0OMa2
         w8NM2yHySahs5quuZK2HM2glNZDjISoo8cJ947kHC6e+PyVs/EroR+EVuqbpDnFBN56P
         UCN3YaGILxkjqS89JyqyH6MqLpoQPrrEDslo3L0ULYWtMSFOPcxQSaiiO4pwWEvPu1FM
         HCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688562105; x=1691154105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6Y9F685UiU32EhKs6HMAHn4FbBX2KCKKX1PdAqE0sk=;
        b=gT+EDvGhYx6K1wUZeGgGyFI7vbfHKmDBhCRmeRbWO5fcGOr+qkd6pfOeCEaAIu0DNN
         IFq3GnVXW8vr6kHX7ljrrL2rmdV1pX2Jve13S96py6/yZA+sBcSud/qVyfcNzLuFLLXz
         38C2mjlYe3pOdFr/4lDkRBex7kc+udq+wvQCWRPSO5UCDNTsmQbHnmE0RsYAG8RV2/hG
         /2MbX17Ps83AEZVcAPdy63EKaauEiOXR5lRHlICBUakKiOZgYcH7LxTkubLu2YmVBaQy
         Ix/3nYdSa3xFN8QY1X7oAuSed4uV8bfCxQVmIP+u3sIGavphFA+4mp7EBLcPcKCjpg/t
         /UBg==
X-Gm-Message-State: ABy/qLbx0fJ33e3DP8Q6u4buzgFG8CyqWotmBI/uAvIjMpU32klEP5da
        QBUHhub0r9skYPw2q6ePMxUFlC5x5U9UFvjoeLieQSAckbgTvg==
X-Google-Smtp-Source: APBJJlEvOJCIZGucTuMNktYai144v8/g6eDuRuy+UL724PAbMeFUM5HCrGB1FMBPODxVtspyMX+40mVW1zhTF07a4DI=
X-Received: by 2002:a05:6512:39c9:b0:4fb:7392:c72c with SMTP id
 k9-20020a05651239c900b004fb7392c72cmr14521061lfu.57.1688562103553; Wed, 05
 Jul 2023 06:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230705122357.GA14855@www.linux-watchdog.org>
In-Reply-To: <20230705122357.GA14855@www.linux-watchdog.org>
From:   Keguang Zhang <keguang.zhang@gmail.com>
Date:   Wed, 5 Jul 2023 21:01:27 +0800
Message-ID: <CAJhJPsU1LHoTxeekFLZtZpKm0dGysf8U3=rTRwFrEyvR3iA34A@mail.gmail.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.5 release cycle.
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wim,
Sorry to bother you.

On Wed, Jul 5, 2023 at 8:23=E2=80=AFPM Wim Van Sebroeck <wim@linux-watchdog=
.org> wrote:
>
>
> Hi Linus,
>
> Please pull following watchdog changes for the v6.5 release cycle.
>
> This series contains:
> * Add Xilinx Versal watchdog
> * support Hygon FCH/SCH (Server Controller Hub)
> * Convert GPL notices to SPDX identifiers
> * Other improvements
>
> The output from git request-pull:
> ----------------------------------------------------------------
> The following changes since commit 547cc9be86f4c51c51fd429ace6c2e1ef9050d=
15:
>
>   Merge tag 'perf_urgent_for_v6.4' of git://git.kernel.org/pub/scm/linux/=
kernel/git/tip/tip (2023-06-25 10:13:17 -0700)
>
> are available in the git repository at:
>
>   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.5-rc1
>
> for you to fetch changes up to 009637de1f65cff452ad49554d1e8ef9fda99e43:
>
>   watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub) (20=
23-06-26 14:30:07 +0200)
>
> ----------------------------------------------------------------
> linux-watchdog 6.5-rc1 tag
>
> ----------------------------------------------------------------
> Bagas Sanjaya (2):
>       watchdog: Convert GPL 2.0 notice to SPDX identifier
>       watchdog: ibmasr: Replace GPL license notice with SPDX identifier
>
> Keguang Zhang (1):
>       watchdog: loongson1_wdt: Add DT support

Did you miss the following patch?
dt-bindings: watchdog: Add Loongson-1 watchdog
https://lore.kernel.org/lkml/20230511121159.463645-2-keguang.zhang@gmail.co=
m/

>
> Krzysztof Kozlowski (1):
>       dt-bindings: watchdog: restrict node name suffixes
>
> Srinivas Neeli (3):
>       dt-bindings: watchdog: xlnx,versal-wwdt: Add versal watchdog
>       watchdog: xilinx_wwdt: Add Versal window watchdog support
>       MAINTAINERS: Add support for Xilinx versal watchdog
>
> Uwe Kleine-K=C3=B6nig (1):
>       watchdog: ziirave_wdt: Switch i2c driver back to use .probe()
>
> Yuechao Zhao (1):
>       watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub)
>
>  .../devicetree/bindings/watchdog/watchdog.yaml     |   4 +-
>  .../bindings/watchdog/xlnx,versal-wwdt.yaml        |  50 +++++
>  MAINTAINERS                                        |   2 +
>  drivers/watchdog/Kconfig                           |  18 ++
>  drivers/watchdog/Makefile                          |   1 +
>  drivers/watchdog/ep93xx_wdt.c                      |   5 +-
>  drivers/watchdog/ibmasr.c                          |   3 +-
>  drivers/watchdog/loongson1_wdt.c                   |  13 +-
>  drivers/watchdog/m54xx_wdt.c                       |   4 +-
>  drivers/watchdog/max63xx_wdt.c                     |   5 +-
>  drivers/watchdog/moxart_wdt.c                      |   4 +-
>  drivers/watchdog/octeon-wdt-nmi.S                  |   5 +-
>  drivers/watchdog/orion_wdt.c                       |   4 +-
>  drivers/watchdog/rtd119x_wdt.c                     |   2 +-
>  drivers/watchdog/sbc_fitpc2_wdt.c                  |   4 +-
>  drivers/watchdog/sp5100_tco.c                      |   4 +-
>  drivers/watchdog/ts4800_wdt.c                      |   4 +-
>  drivers/watchdog/ts72xx_wdt.c                      |   4 +-
>  drivers/watchdog/xilinx_wwdt.c                     | 201 +++++++++++++++=
++++++
>  drivers/watchdog/ziirave_wdt.c                     |   2 +-
>  20 files changed, 301 insertions(+), 38 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/xlnx,versa=
l-wwdt.yaml
>  create mode 100644 drivers/watchdog/xilinx_wwdt.c
> ----------------------------------------------------------------
>
> Kind regards,
> Wim.
>


--=20
Best regards,

Keguang Zhang
