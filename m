Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7353BD57
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jun 2019 22:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389279AbfFJUNJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jun 2019 16:13:09 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:49301 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389099AbfFJUNJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jun 2019 16:13:09 -0400
X-Originating-IP: 37.205.120.66
Received: from localhost (unknown [37.205.120.66])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2B7A6E000B;
        Mon, 10 Jun 2019 20:13:04 +0000 (UTC)
Date:   Mon, 10 Jun 2019 22:13:01 +0200
From:   Alexandre Belloni <alexandre.belloni@free-electrons.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ken Sloat <KSloat@aampglobal.com>,
        "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "wim@iguana.be" <wim@iguana.be>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
Message-ID: <20190610201301.GH25472@piout.net>
References: <BL0PR07MB41152EDB169FE9ED1AD3B4C9AD130@BL0PR07MB4115.namprd07.prod.outlook.com>
 <20190610162811.GA11270@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610162811.GA11270@roeck-us.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

On 10/06/2019 09:28:11-0700, Guenter Roeck wrote:
> On Mon, Jun 10, 2019 at 03:51:52PM +0000, Ken Sloat wrote:
> > Hello Nicolas,
> > 
> > I wanted to open a discussion proposing new functionality to allow disabling of the watchdog timer upon entering 
> > suspend in the SAMA5D2/4.
> > 
> > Typical use case of a hardware watchdog timer in the kernel is a userspace application opens the watchdog timer and
> > periodically "kicks" it. If the application hits a deadlock somewhere and is no longer able to kick it, then the watchdog
> > intervenes and often resets the processor. Such is the case for the Atmel driver (which also allows a watchdog interrupt
> > to be asserted in lieu of a system reset). In most use cases, upon entering a low power/suspend state, the application 
> > will no longer be able to "kick" the watchdog. If the watchdog is not disabled or kicked via another method, then it will
> > reset the system. This is the current behavior of the Atmel driver as of today.
> > 
> > The watchdog peripheral itself does have a "WDIDLEHLT" bit however, and this is enabled via the "atmel,idle-halt" dt
> > property. However, this is not very useful, as it literally only makes the watchdog count when the CPU is active. This 
> > results in non-deterministic triggering of the WDT and means that if a critical application were to crash, it may be
> > quite a long time before the WDT would ever trigger. Below is a similar statement made in the device-tree doc for this
> > peripheral:
> > 
> > - atmel,idle-halt: present if you want to stop the watchdog when the CPU is
> > 		   in idle state.
> > 	CAUTION: This property should be used with care, it actually makes the
> > 	watchdog not counting when the CPU is in idle state, therefore the
> > 	watchdog reset time depends on mean CPU usage and will not reset at all
> > 	if the CPU stop working while it is in idle state, which is probably
> > 	not what you want.
> > 
> > It seems to me, that it would be logical and useful to introduce a new property that would cause the Atmel WDT
> > to disable on suspend and re-enable on resume. It also appears that the WDT is re-initialized anyways upon
> > resume, so the only piece missing here would really be a dt flag and a call to disable.
> > 
> Wondering - why would this need a dt property ? That would be quite unusual. Is
> there a condition where one would _not_ want the watchdog to stop on suspend ?
> 

There are customers that protects suspend/resume using the watchdog.
They wake up their platform every 15s to ping the watchdog.

Also, I don't see why the application deciding to go to suspend wouldn't
be able to disable the watchdog before do so if this is the wanted policy.

> If anything I would suggest to drop atmel,idle-halt completely; it really looks
> like it would make the watchdog unreliable.
> 
> Thanks,
> Guenter

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
