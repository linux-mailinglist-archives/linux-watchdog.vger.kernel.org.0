Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C937E3FEA
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Nov 2023 14:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbjKGNUY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Nov 2023 08:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234025AbjKGNUN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Nov 2023 08:20:13 -0500
Received: from srv.wefi.net (srv.wefi.net [80.66.63.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3FE91F3
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Nov 2023 05:18:39 -0800 (PST)
Received: from [172.16.0.112] (unknown [91.223.201.37])
        by srv.wefi.net (Postfix) with ESMTPSA id DE7205A3500;
        Tue,  7 Nov 2023 14:18:36 +0100 (CET)
Message-ID: <fdc9d9c1cb641441cf8e0cc9d7c902951bb32115.camel@wefi.net>
Subject: Re: [RFC] improve it87_wdt (IT8784/IT8786) / keeping WDTCTRL
 unchanged / deactivate watchdog by setting WDTVALLSB/WDTVALMSB 0
From:   Werner Fischer <devlists@wefi.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Hanspeter Portner <dev@open-music-kontrollers.ch>
Cc:     linux-watchdog@vger.kernel.org
Date:   Tue, 07 Nov 2023 14:18:35 +0100
In-Reply-To: <87b1c97177c43eeec640483cc2f83f5f4d7b1060.camel@wefi.net>
References: <87b1c97177c43eeec640483cc2f83f5f4d7b1060.camel@wefi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter, hi Wim, hi Hanspeter,

On Mon, 2023-10-16 at 15:16 +0200, Werner Fischer wrote:
> Hi Guenter, hi Hanspeter,
> 
> I currently testing two devices with IT8784 and IT8786 watchdog
> timers.
> Although the chips are supported by it87_wdt.c after Hanspeter's
> patches back in 2020, the watchdog functionality does not work in my
> following test:
> - Debian 12 using Kernel 6.1.58 or current 6.6-rc
> - loading module it87_wdt
> - starting wd_keepalive Deamon
> - killing wd_keepalive using signal 9
> -> system keeps on running even after the configured watchdog timeout
> 
> For debugging purposes, I have used the patch below to report the
> content of the watchdog registers 0x71 (WDTCTRL), 0x72 (WDTCFG), 0x73
> (WDTVALLSB), and 0x74 (WDTVALMSB) to the system log.
> 
> It turned out, that 0x71 (WDTCTRL) has initially the following value
> set (before the module changes it to 0x00):
> - 8 decimal (IT8784 / IT8786)
> - 4 decimal (IT8613)
> 
> I figured out, that the following code line makes the watchdog of
> IT8784 and IT8786 non-functional for me:
>   superio_outb(0x00, WDTCTRL);
> I have removed this code in my patch below, then the watchdog works
> for IT8784 and IT8786.
> 
> I'm not sure, why the WDTCTRL register is set to 0x00 in the code. As
> it seems, the register can have different meanings for differnt
> IT8xxx chips. Accoring to [1] it seems sufficient to set both
> WDTVALLSB and WDTVALMSB to 0x00 to deactivate the watchdog timer:
> "When the WDT Time-out Value register is set to a non-zero value, the
> WDT loads the value and begin counting down from the value."
> This happens e.g. also when wd_keepalive is stopped cleanly.
> 
> I am open to support to improve the it87_wdt code.
> 
> But before I'm writing and sending a patch, I have the following
> question:
> * What is the reason, why WDTCTRL is set to 0x00 in the code? and
> * Could we think about removing this (at least for IT8784/8786)?
It seems to me that setting WDTCTRL to 0x00 has been in the code from
the beginning.

For my test systems with IT8784 and IT8786 I got the following
information from the system vendor:
"71H bit 3 is the mode choice for the clock input of the IT8784/IT8786
chip. This bit is set to 1 (= PCICLK mode) and can not be set to 0."
Setting it to 0 breaks the watchdog functionality.

Unfortunately, ITE does not provide the specifications PDFs publicly
anymore. But the documentation at [2] provides details regarding the
Watchdog Timer Control Register (71h) of an ITE chip, which has the
description "External CLK_IN Select: 1: PCICLK" for bit 3, too.

As it seems system-dependent, removing
  superio_outb(0x00, WDTCTRL);
from the code may lead to problems with other ITE chips, which maybe
could need WDTCTRL set to 0x00.

So my idea to be on the safe side for exiting users of it87_wdt, too:
* What do you think about an optional module parameter to let the user
  choose to leave WDTCTRL untouched? (this would make the watchdog work
  e.g. with my test systems with IT8784 and IT8786, too)

In case you would support such a code change, I would be happy to write
a patch (including some other minor/cosmetic code fixes/addition of
further ITE chips).

Best regards,
Werner

[2] http://files.nexcom.com/Driver/NDiSB425/User_Manual_NDiSB425-SI3_170111.pdf
