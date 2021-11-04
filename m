Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6604F4450DB
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Nov 2021 10:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhKDJGr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Nov 2021 05:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbhKDJGr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Nov 2021 05:06:47 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A785C061714
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Nov 2021 02:04:09 -0700 (PDT)
Received: from [10.104.240.139] (unknown [195.176.0.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 9634E26C264;
        Thu,  4 Nov 2021 10:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1636016647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lgdmrl8gEgM7oaX+1I952F+YNozG51f3c8JRvnIag6c=;
        b=9Puid0xsIVpPg1hoCpdgLq0oKeCSZcUJfa7BqxVnrd2p52bwAihK2MiyWgRo59uGEQSrzt
        /9mFajs6942E1/5/+78taIPqGM9ucYKdJ1uKDAHutA2i47ITc/IjMOniPCTRGRdvROrUyb
        jiWZ3AgG3QOrBQjpAcpTytZoQRZQ9bNjc0z9hofs5KsMuS5l+y3Ar6JlzY/A8GS++R7SG6
        1IPd02ru6hwhhZZcJjhAIAAgP08blMsgxe7IlgNKWIq4Ux9RyifPFDTwczVAXp1K/OjsFK
        V1hW9Ttttk5D9AC09Wrui2puFjf7OOW9Mmu1hnsRdRlpYTlm2u+ZMb3urEZ9wg==
Message-ID: <e1827ee6d586333b91a4193fa0e27725baba8739.camel@svanheule.net>
Subject: Re: [PATCH 2/2] watchdog: Add Realtek Otto watchdog timer
From:   Sander Vanheule <sander@svanheule.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Date:   Thu, 04 Nov 2021 10:04:05 +0100
In-Reply-To: <c81fd654-011f-0375-7dde-61365c898efb@roeck-us.net>
References: <cover.1634131707.git.sander@svanheule.net>
         <7eb1e3d8a5bd3b221be0408bd6f0272e6d435ade.1634131707.git.sander@svanheule.net>
         <20211013184852.GA955578@roeck-us.net>
         <4cf85218627371e1d07238257d0a89f824606415.camel@svanheule.net>
         <6b1a9479-c456-ceeb-5aa2-6121f5c5d67f@roeck-us.net>
         <b1c8713cd10358355d4086e6d80ce6f10d295fe8.camel@svanheule.net>
         <c81fd654-011f-0375-7dde-61365c898efb@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 (3.42.0-1.fc35) 
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

After acquiring a device with an RTL9302B SoC and testing the driver, I couldn't find
any bits that disable the WDT reset and only trigger the interrupt. So I just dropped
the phase2 interrupt implementation from the v2 patches and added a note in the
commit message.

Best,
Sander

