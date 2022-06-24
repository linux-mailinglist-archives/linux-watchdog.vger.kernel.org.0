Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245EF559D76
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jun 2022 17:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbiFXPhL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 Jun 2022 11:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiFXPhK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 Jun 2022 11:37:10 -0400
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1418947074
        for <linux-watchdog@vger.kernel.org>; Fri, 24 Jun 2022 08:37:07 -0700 (PDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25OFVaCv017983;
        Fri, 24 Jun 2022 10:31:37 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 25OFVYlh017982;
        Fri, 24 Jun 2022 10:31:34 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Fri, 24 Jun 2022 10:31:34 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org, nathanl@linux.ibm.com,
        wvoigt@us.ibm.com, aik@ozlabs.ru, vaishnavi@linux.ibm.com,
        npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Subject: Re: [PATCH v2 4/4] watchdog/pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
Message-ID: <20220624153134.GV25951@gate.crashing.org>
References: <20220602175353.68942-1-cheloha@linux.ibm.com> <20220602175353.68942-5-cheloha@linux.ibm.com> <87wnd642f7.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnd642f7.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 24, 2022 at 11:27:24PM +1000, Michael Ellerman wrote:
> Scott Cheloha <cheloha@linux.ibm.com> writes:
> > + * - For the "Query Watchdog Capabilities" operation, a 64-bit
> > + *   value structured as follows:
> > + *
> > + *       Bits  0-15: The minimum supported timeout in milliseconds.
> > + *       Bits 16-31: The number of watchdogs supported.
> > + *       Bits 32-63: Reserved.
> > + */
> > +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
> 
> This one is less obviously better, but I still think it's clearer as all
> the logic is there in front of you, rather than hidden in the macro. It
> is clearer that we're only returning a 16-bit value.
> 
> #define PSERIES_WDTQ_MIN_TIMEOUT(cap)	(((cap) >> 48) & 0xffff)

Or even
  ((cap) >> 48)
since it is a 64-bit value.  If you want better defences you should not
use macros here at all, anyway (but inline functions, instead).

I could rant about the 1000UL being meaningless and/or misleading, or
that 0x1 is just silly, but it is a sunny day :-)


Segher
