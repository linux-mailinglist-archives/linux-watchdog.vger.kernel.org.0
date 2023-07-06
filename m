Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73A17498AF
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jul 2023 11:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjGFJml (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jul 2023 05:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbjGFJmk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jul 2023 05:42:40 -0400
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 167A81990
        for <linux-watchdog@vger.kernel.org>; Thu,  6 Jul 2023 02:42:37 -0700 (PDT)
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id C317240204; Thu,  6 Jul 2023 11:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org C317240204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1688636556;
        bh=3l5GmfCcxuNvhAWRhzRn6SD0d+hBibcFwQqOhR5dABE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LCL4RXW6QKdAfpOmP9rh66F04tfQ8s/1bFio6CbNsoWI38iiJ5QN6I6YC8WFu4woq
         Y1DALfmln+97UVO+D4OCKfnGIPUzP/fWK/EqePC75NkJ8WW/HWS6edx+N2n3ONa69e
         I5T3RiH8agtAAnC7Ayf2UYUmO6Sj5IQHWfKqF4xU=
Date:   Thu, 6 Jul 2023 11:42:36 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.5 release cycle.
Message-ID: <20230706094236.GB1442@www.linux-watchdog.org>
References: <20230705122357.GA14855@www.linux-watchdog.org>
 <CAJhJPsU1LHoTxeekFLZtZpKm0dGysf8U3=rTRwFrEyvR3iA34A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhJPsU1LHoTxeekFLZtZpKm0dGysf8U3=rTRwFrEyvR3iA34A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Keguang,

> Hi Wim,
> Sorry to bother you.
> 
> On Wed, Jul 5, 2023 at 8:23 PM Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
> >
> >
> > Hi Linus,
> >
> > Please pull following watchdog changes for the v6.5 release cycle.
> >
> > This series contains:
> > * Add Xilinx Versal watchdog
> > * support Hygon FCH/SCH (Server Controller Hub)
> > * Convert GPL notices to SPDX identifiers
> > * Other improvements
> >
> > The output from git request-pull:
> > ----------------------------------------------------------------
> > The following changes since commit 547cc9be86f4c51c51fd429ace6c2e1ef9050d15:
> >
> >   Merge tag 'perf_urgent_for_v6.4' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2023-06-25 10:13:17 -0700)
> >
> > are available in the git repository at:
> >
> >   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.5-rc1
> >
> > for you to fetch changes up to 009637de1f65cff452ad49554d1e8ef9fda99e43:
> >
> >   watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub) (2023-06-26 14:30:07 +0200)
> >
> > ----------------------------------------------------------------
> > linux-watchdog 6.5-rc1 tag
> >
> > ----------------------------------------------------------------
> > Bagas Sanjaya (2):
> >       watchdog: Convert GPL 2.0 notice to SPDX identifier
> >       watchdog: ibmasr: Replace GPL license notice with SPDX identifier
> >
> > Keguang Zhang (1):
> >       watchdog: loongson1_wdt: Add DT support
> 
> Did you miss the following patch?
> dt-bindings: watchdog: Add Loongson-1 watchdog
> https://lore.kernel.org/lkml/20230511121159.463645-2-keguang.zhang@gmail.com/

Yes I apparently did. I'll add it.

> >
> > Krzysztof Kozlowski (1):
> >       dt-bindings: watchdog: restrict node name suffixes
> >
> > Srinivas Neeli (3):
> >       dt-bindings: watchdog: xlnx,versal-wwdt: Add versal watchdog
> >       watchdog: xilinx_wwdt: Add Versal window watchdog support
> >       MAINTAINERS: Add support for Xilinx versal watchdog
> >
> > Uwe Kleine-König (1):
> >       watchdog: ziirave_wdt: Switch i2c driver back to use .probe()
> >
> > Yuechao Zhao (1):
> >       watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub)
> >
> >  .../devicetree/bindings/watchdog/watchdog.yaml     |   4 +-
> >  .../bindings/watchdog/xlnx,versal-wwdt.yaml        |  50 +++++
> >  MAINTAINERS                                        |   2 +
> >  drivers/watchdog/Kconfig                           |  18 ++
> >  drivers/watchdog/Makefile                          |   1 +
> >  drivers/watchdog/ep93xx_wdt.c                      |   5 +-
> >  drivers/watchdog/ibmasr.c                          |   3 +-
> >  drivers/watchdog/loongson1_wdt.c                   |  13 +-
> >  drivers/watchdog/m54xx_wdt.c                       |   4 +-
> >  drivers/watchdog/max63xx_wdt.c                     |   5 +-
> >  drivers/watchdog/moxart_wdt.c                      |   4 +-
> >  drivers/watchdog/octeon-wdt-nmi.S                  |   5 +-
> >  drivers/watchdog/orion_wdt.c                       |   4 +-
> >  drivers/watchdog/rtd119x_wdt.c                     |   2 +-
> >  drivers/watchdog/sbc_fitpc2_wdt.c                  |   4 +-
> >  drivers/watchdog/sp5100_tco.c                      |   4 +-
> >  drivers/watchdog/ts4800_wdt.c                      |   4 +-
> >  drivers/watchdog/ts72xx_wdt.c                      |   4 +-
> >  drivers/watchdog/xilinx_wwdt.c                     | 201 +++++++++++++++++++++
> >  drivers/watchdog/ziirave_wdt.c                     |   2 +-
> >  20 files changed, 301 insertions(+), 38 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
> >  create mode 100644 drivers/watchdog/xilinx_wwdt.c
> > ----------------------------------------------------------------
> >
> > Kind regards,
> > Wim.
> >
> 
> 
> -- 
> Best regards,
> 
> Keguang Zhang

Kind regards,
Wim.

