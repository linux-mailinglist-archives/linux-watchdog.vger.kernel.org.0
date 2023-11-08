Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68257E525B
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Nov 2023 10:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235438AbjKHJFo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Nov 2023 04:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235423AbjKHJFn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Nov 2023 04:05:43 -0500
Received: from srv.wefi.net (srv.wefi.net [80.66.63.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB2FF10A
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Nov 2023 01:05:40 -0800 (PST)
Received: from [172.16.0.112] (unknown [91.223.201.37])
        by srv.wefi.net (Postfix) with ESMTPSA id C5C2D5A3500;
        Wed,  8 Nov 2023 10:05:39 +0100 (CET)
Message-ID: <1cf8b20152ea7b0c1c624b14a7e29d5f0e8e7bd4.camel@wefi.net>
Subject: Re: [RFC] improve it87_wdt (IT8784/IT8786) / keeping WDTCTRL
 unchanged / deactivate watchdog by setting WDTVALLSB/WDTVALMSB 0
From:   Werner Fischer <devlists@wefi.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Hanspeter Portner <dev@open-music-kontrollers.ch>
Cc:     linux-watchdog@vger.kernel.org
Date:   Wed, 08 Nov 2023 10:05:28 +0100
In-Reply-To: <140b264d-341f-465b-8715-dacfe84b3f71@roeck-us.net>
References: <87b1c97177c43eeec640483cc2f83f5f4d7b1060.camel@wefi.net>
         <fdc9d9c1cb641441cf8e0cc9d7c902951bb32115.camel@wefi.net>
         <140b264d-341f-465b-8715-dacfe84b3f71@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 2023-11-07 at 06:34 -0800, Guenter Roeck wrote:
> On 11/7/23 05:18, Werner Fischer wrote:
> > > * What is the reason, why WDTCTRL is set to 0x00 in the code? and
> > > * Could we think about removing this (at least for IT8784/8786)?
> > It seems to me that setting WDTCTRL to 0x00 has been in the code
> > from the beginning.
> > 
> > For my test systems with IT8784 and IT8786 I got the following
> > information from the system vendor:
> > "71H bit 3 is the mode choice for the clock input of the
> > IT8784/IT8786 chip. This bit is set to 1 (= PCICLK mode) and can
> > not be set to 0."
> > Setting it to 0 breaks the watchdog functionality.
> > 
> > Unfortunately, ITE does not provide the specifications PDFs
> > publicly anymore. But the documentation at [2] provides details
> > regarding the
> They really never did, or at least not for a long time. Some board
> vendors used to be Linux-friendly and provided datasheets on request,
> but that is no longer the case. My recommendation used to be, and
> still is, not to use boards with Super-IO chips from ITE to run
> Linux. This is not only due to lack of datasheets, but also due to
> the lack of support from both chip and board vendors if there are any
> issues when trying to support the chips in Linux.
Fortunately, the manufacturer of my test systems supports me very well
here. I will simply try to improve the watchdog support for the chips
in the test systems. Currently I have four different boards, containing
one of IT8613, IT8659, IT8784 and IT8786.

> 
> Bit 4..7 of the register are used to control watchdog timer resets
> (pings). Skipping the write entirely is therefore unacceptable even
> for IT8784/IT8786 because we _don't_ want activity on a (legacy)
> keyboard, mouse, game, or infrared port to reset the watchdog timer.
Thanks for the explanation. Understood.

> > So my idea to be on the safe side for exiting users of it87_wdt,
> > too:
> > * What do you think about an optional module parameter to let the 
> > user choose to leave WDTCTRL untouched? (this would make the
> >   watchdog work e.g. with my test systems with IT8784 and IT8786, 
> > too)
> Make it conditional for IT8784/IT8786: On those chips, read the value
> from the chip and clear all but bit 3. This is the safest we can do.
> Future chips can be added as needed.
This is a great idea, thank you very much for that.
I am trying to write a corresponding patch.

Werner

