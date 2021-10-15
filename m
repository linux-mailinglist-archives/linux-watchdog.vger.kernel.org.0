Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B7842F1B6
	for <lists+linux-watchdog@lfdr.de>; Fri, 15 Oct 2021 15:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239231AbhJONJ5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 15 Oct 2021 09:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239219AbhJONJ4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 15 Oct 2021 09:09:56 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F14C061570
        for <linux-watchdog@vger.kernel.org>; Fri, 15 Oct 2021 06:07:48 -0700 (PDT)
Received: from [130.246.252.99] (stfc-guest-0076.rl.ac.uk [130.246.252.99])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 11DA5261E09;
        Fri, 15 Oct 2021 15:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1634303267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OouvDrdrM4gIu0RFlsE/NFaiid3M9GLimFnmOS+qiNo=;
        b=0v2bOaVZ3NpU8VICqzq/wcFsuLnj6Xm8Z3N9czerUEedYsRZIqy8rdgy/PqHzn/Fvi8Vk3
        9BJWixHjelcBefcge8x88R816jaqpGVsD+Fbnz0z++/DA+8uOlKaOHcKqaACWkCVpekmYm
        IE+Kz0T9hleWx7186Uh9SxDe3OWeNawDeBXLTYN2SQl4Wj77GfiEvF1JE2JVc0m7vWIUIM
        ygmLdqDpUe0TB5tPHPsWy6Y4WaOmT4UIeULZ8hv1Hj8KQ4pYEpBXbfs0eT+LoN5JzX7TG+
        SY2C0XBABRJeExXj4Q//FUuGWBZg6xNRy9N0FUXqRg/giy+15kilhMVLQZ0s7Q==
Message-ID: <5fae298a1a9daac74818b779677d4e1735ddc527.camel@svanheule.net>
Subject: Re: [PATCH 2/2] watchdog: Add Realtek Otto watchdog timer
From:   Sander Vanheule <sander@svanheule.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Date:   Fri, 15 Oct 2021 14:07:45 +0100
In-Reply-To: <c81fd654-011f-0375-7dde-61365c898efb@roeck-us.net>
References: <cover.1634131707.git.sander@svanheule.net>
         <7eb1e3d8a5bd3b221be0408bd6f0272e6d435ade.1634131707.git.sander@svanheule.net>
         <20211013184852.GA955578@roeck-us.net>
         <4cf85218627371e1d07238257d0a89f824606415.camel@svanheule.net>
         <6b1a9479-c456-ceeb-5aa2-6121f5c5d67f@roeck-us.net>
         <b1c8713cd10358355d4086e6d80ce6f10d295fe8.camel@svanheule.net>
         <c81fd654-011f-0375-7dde-61365c898efb@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 2021-10-14 at 09:56 -0700, Guenter Roeck wrote:
> On 10/14/21 3:26 AM, Sander Vanheule wrote:
> > On Wed, 2021-10-13 at 14:03 -0700, Guenter Roeck wrote:
> > > On 10/13/21 12:46 PM, Sander Vanheule wrote:
> > > > On Wed, 2021-10-13 at 11:48 -0700, Guenter Roeck wrote:
> > > > > On Wed, Oct 13, 2021 at 03:29:00PM +0200, Sander Vanheule wrote:
> > > > [...]
> > > > 
> > > > > > 
> > > > > > diff --git a/drivers/watchdog/realtek_otto_wdt.c
> > > > > > b/drivers/watchdog/realtek_otto_wdt.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..64c9cba6b0b1
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/watchdog/realtek_otto_wdt.c
> > > > > > @@ -0,0 +1,411 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +
> > > > > > +/*
> > > > > > + * Realtek Otto MIPS platform watchdog
> > > > > > + *
> > > > > > + * Watchdog timer that will reset the system after timeout, using the
> > > > > > selected
> > > > > > + * reset mode.
> > > > > > + *
> > > > > > + * Counter scaling and timeouts:
> > > > > > + * - Base prescale of (2 << 25), providing tick duration T_0: 168ms @
> > > > > > 200MHz
> > > > > > + * - PRESCALE: logarithmic prescaler adding a factor of {1, 2, 4, 8}
> > > > > > + * - Phase 1: Times out after (PHASE1 + 1) × PRESCALE × T_0
> > > > > > + *   Generates an interrupt, WDT cannot be stopped after phase 1
> > > > > > + * - Phase 2: starts after phase 1, times out after (PHASE2 + 1) ×
> > > > > > PRESCALE × T_0
> > > > > > + *   Resets the system according to RST_MODE
> > > > > 
> > > > > Why is there a phase2 interrupt if phase2 resets the chip ?
> > > > > 
> > > > 
> > > > The SoC's reset controller has an interrupt line for phase2, even though
> > > > then it then the
> > > > WDT also resets the system. I don't have any documentation about this
> > > > peripheral; just
> > > > some vendor code and there the phase2 interrupt isn't enabled. I mainly
> > > > added it here for
> > > > completeness.
> > > > 
> > > 
> > > It seems pointless to mandate an interrupt just for completeness.
> > 
> > Okay, then I will just drop it here. As I understand, the bindings should be as
> > complete as possible, so I think the phase2 interrupt definition should remain
> > there?
> > 
> 
> I still don't see the point of it if there is no known use case. At the very
> least it will need to be optional, but even then I would expect a description
> of the use case.
> 
> FWIW, technically I suspect that there is a means for the watchdog to generate
> a second interrupt instead of resetting the hardware (otherwise the second
> interrupt would not really make sense), but without hardware and without
> datasheet it is impossible to confirm that.

I haven't found any WDT reset enable/disable flag for the RTL838x and RTL839x series,
but I noticed the RTL930x series does have a potentially interesting field in their
reset controller.

WD_RST_EN: https://svanheule.net/realtek/longan/register/rst_glb_ctrl_0

Sadly we don't have any proper datasheets. All we have is the register layouts from
the source archives, which we've been trying to document ourselves. I've ordered some
hardware with an RTL9302 SoC, so I should be able to provide an update next week.

Best,
Sander

