Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E8244F7B8
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Nov 2021 12:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbhKNMBR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 14 Nov 2021 07:01:17 -0500
Received: from sibelius.xs4all.nl ([83.163.83.176]:53694 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234477AbhKNMBQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 14 Nov 2021 07:01:16 -0500
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id be7fde16;
        Sun, 14 Nov 2021 12:58:20 +0100 (CET)
Date:   Sun, 14 Nov 2021 12:58:20 +0100 (CET)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     "Sven Peter" <sven@svenpeter.dev>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, marcan@marcan.st,
        alyssa@rosenzweig.io, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <fc541162-928c-4318-bc2a-06da0cbdf5e8@www.fastmail.com>
        (sven@svenpeter.dev)
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add Apple Watchdog
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <d3cad37524f7debf@bloch.sibelius.xs4all.nl> <fc541162-928c-4318-bc2a-06da0cbdf5e8@www.fastmail.com>
Message-ID: <d3cad4a2f2f05eef@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> Date: Sun, 14 Nov 2021 12:40:48 +0100
> From: "Sven Peter" <sven@svenpeter.dev>
> 
> On Sat, Nov 13, 2021, at 22:07, Mark Kettenis wrote:
> >> From: Sven Peter <sven@svenpeter.dev>
> >> Date: Sat, 13 Nov 2021 10:47:31 +0100
> >> 
> >> Apple SoCs come with a simple embedded watchdog. This watchdog is also
> >> required in order to reset the SoC.
> >> 
> >> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> >> ---
> >>  .../bindings/watchdog/apple,wdt.yaml          | 52 +++++++++++++++++++
> >>  MAINTAINERS                                   |  1 +
> >>  2 files changed, 53 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> >> 
> >> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> >> new file mode 100644
> >> index 000000000000..e58c56a6fdf6
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> >> @@ -0,0 +1,52 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Apple SoC Watchdog
> >> +
> >> +allOf:
> >> +  - $ref: "watchdog.yaml#"
> >
> > I believew this should be:
> >
> >   - $ref: /schemas/watchdog/watchdog.yaml#
> >
> > with that fixed:
> >
> > Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
> >
> 
> Thanks for the review!
> Almost all the other YAML watchdog bindings just use '$ref: "watchdog.yaml#"'.
> Only arm,sp805.yaml uses '$ref: /schemas/watchdog/watchdog.yaml#'.

Hmm, maybe it is ok since the file can be found in the same directory.
Guess it is up to robh then.  Feel free to keep my Reviewed-by
regardless.
