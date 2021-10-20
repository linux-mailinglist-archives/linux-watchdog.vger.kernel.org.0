Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8701434485
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Oct 2021 07:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhJTFLm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Oct 2021 01:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhJTFLl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Oct 2021 01:11:41 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E417C06161C;
        Tue, 19 Oct 2021 22:09:28 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so6821535otq.12;
        Tue, 19 Oct 2021 22:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZYFDxXyB+iDRIc7daewSGkmOFvkfKRcOQaO+hoKFVEU=;
        b=TokxIlSFaWT8avrNOpGNR/PIKsDE3Jcqir4M5zwwBngoBaAWr9Z8ImRwSTTLcwo0xd
         mFw8SC0Vdm01GNkvvEOaQzl5FAXE3uN6hAMsGSXOZ3LULUrSktp81f9lsXG4cdOmFwQi
         p1oqDYvD+TykQgv6khdrEW0R1vNua8t6MAeyXWB2hoYcC5KHQ/Db7SfVCA3edwhKJFA7
         xTD3vkHP8wzEYT9MylFfYCgAT6fnmVmSgrY//+DnaYdeQzJ53iA7xfLq/8fi37nQCp7k
         zcdyCWCdDYZ0N4cscyTSr5g1qmt1TCh2h4uY+2LY4rQkZedeZPsz7nbkNfj4qKV3mo3w
         wXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=ZYFDxXyB+iDRIc7daewSGkmOFvkfKRcOQaO+hoKFVEU=;
        b=Il2uxRL348kRkh4niEJeCKTG5Kdcjjn6CQgh635TcgFb0i2fNdtnLsdaXoELJFbzJf
         4VbCxGaNz24e1f1ZR3Va9l799amSWjU8LkqLwYVTYTh1xUsHVDl20W/1LnRqgNUbGZhs
         xfZgCal/GrlZGcR16zFksmHOauoIS2dxGH1yYevlPhpdgGqaL2nJBO7G+diRDASZ3VV1
         ZctkwuooeK3rXf/4c+2mm9mwuds7E57kzgwDgDMRAPCmf5MjZs7NgCCNeCS6WkpZ1nA3
         ly4aTRtNBhyJOl386xoBrT8okPTaMN1CfmmsiQaBXSMrKsJlEbHRQkCwx72NFjuRPz8e
         cmWA==
X-Gm-Message-State: AOAM532vx+4TdltUSXCb1GeW21Csn6IeZrUngCo5FwbrdOV9jFZU+ONH
        3MHQGquPPxiZKOC78to4Ei7zrYS+j2c=
X-Google-Smtp-Source: ABdhPJy5jAJko2+wBPCSx+EyWC+Fi57hOD55cxcgufcUHRUelrmCx3kHtzvKtOP11AhEAUPoA3VQEg==
X-Received: by 2002:a9d:72d8:: with SMTP id d24mr8771583otk.149.1634706567312;
        Tue, 19 Oct 2021 22:09:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o80sm265086ota.68.2021.10.19.22.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 22:09:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 19 Oct 2021 22:09:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Srinivas Neeli <sneeli@xilinx.com>
Cc:     Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: Re: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal Window watchdog
 mode
Message-ID: <20211020050924.GA844012@roeck-us.net>
References: <20210527095709.12841-1-srinivas.neeli@xilinx.com>
 <20210527095709.12841-3-srinivas.neeli@xilinx.com>
 <fb83065e-7870-c830-7dde-efb3af8cc25c@roeck-us.net>
 <DM6PR02MB538635505ABE30C42100E059AF369@DM6PR02MB5386.namprd02.prod.outlook.com>
 <DM6PR02MB5386C805459902F9C28391AAAF139@DM6PR02MB5386.namprd02.prod.outlook.com>
 <e6f75042-3b49-46f9-8679-572044eee17f@roeck-us.net>
 <DM6PR02MB5386027ED2C41CA05B3751FCAFA99@DM6PR02MB5386.namprd02.prod.outlook.com>
 <DM6PR02MB5386B179BBD56A8E7D4E13C0AFBC9@DM6PR02MB5386.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR02MB5386B179BBD56A8E7D4E13C0AFBC9@DM6PR02MB5386.namprd02.prod.outlook.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 18, 2021 at 09:23:23AM +0000, Srinivas Neeli wrote:
> Hi Guenter,
> 
> Could you please share your comments on below limitations.
> 
> 
> Thanks
> Srinivas Neeli
> 
> > -----Original Message-----
> > From: Srinivas Neeli <sneeli@xilinx.com>
> > Sent: Wednesday, September 29, 2021 12:32 PM
> > To: Guenter Roeck <linux@roeck-us.net>; Shubhrajyoti Datta
> > <shubhraj@xilinx.com>; Srinivas Goud <sgoud@xilinx.com>; Michal Simek
> > <michals@xilinx.com>
> > Cc: wim@linux-watchdog.org; linux-watchdog@vger.kernel.org; linux-
> > kernel@vger.kernel.org; git <git@xilinx.com>
> > Subject: RE: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal Window
> > watchdog mode
> > 
> > Hi Guenter,
> > 
> > I went through reference "rti_wdt.c" driver. It implemented Window
> > watchdog with few limitations.
> > Limitations:
> > ---------------
> > 1) Not able to configure Closed window and Open window separately.
> > 	Because of xilinx window watchdog supports separate configurable
> > closed and open windows.
> > 2) In case of rti driver, if any bad event(error event) occur due to any user
> > space event like ping then
> >    the watchdog core bypassing the ping call.
> >     But in case of xilinx watchdog there are separate register bits for counting
> > error events.
> > 	So if I implement driver in similar to rti-wdt.c driver, then we can not
> > be able read the error events from
> > 	the registers.
> > 	So is this ok because we are not notifying the errors to user.
> > 

I can only repeat: You can not misuse pretimeout to configure the minimum
window size. If you want that configurable, maybe you can use a module
parameter. Not sure I understand the comment about error events. If an
error event is userspace pinging the watchdog within the closed window,
sure, then you can not use min_hw_heartbeat_ms to indicate the minimum
window size. I don't really understand the point of this (or why anyone
would want such a "window" watchdog in the first place), but then I don't
have to understand it. Just remember to explain to your customers and
document in the driver what happens if userspace pings the watchdog too
early (eg that the ping will be ignored and that the watchdog will reboot
the system unless another ping happens within the configured window).
Either case, again, you can not (mis-)use pretimeout for anything
but for configuring a pretimeout.

Guenter

> > Thanks
> > Srinivas Neeli
> > 
> > > -----Original Message-----
> > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > > Sent: Wednesday, July 14, 2021 5:01 PM
> > > To: Srinivas Neeli <sneeli@xilinx.com>; Shubhrajyoti Datta
> > > <shubhraj@xilinx.com>; Srinivas Goud <sgoud@xilinx.com>; Michal Simek
> > > <michals@xilinx.com>
> > > Cc: wim@linux-watchdog.org; linux-watchdog@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; git <git@xilinx.com>
> > > Subject: Re: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal Window
> > > watchdog mode
> > >
> > > On 7/13/21 10:29 PM, Srinivas Neeli wrote:
> > > > Hi Guenter,
> > > >
> > > > If you are fine with my justification, I will send v2 with update code.
> > > >
> > >
> > > We have at least one more watchdog driver with open/closed window
> > > concepts.
> > > This is not a "pretimeout". Please see drivers/watchdog/rti_wdt.c for
> > > an example on how to handle this; essentially you have to set
> > > min_hw_heartbeat_ms to the value of the closed window timeout. The
> > > watchdog core then handles the mechanics.
> > >
> > > You can not use "pretimeout" to set the "closed" window size; this is
> > > an ABI abuse. There is no standard ABI for this, so if you want to
> > > have it configurable it would have to be a module parameter.
> > >
> > > Guenter
> > >
> > > > Thanks
> > > > Srinivas Neeli.
> > > >
> > > > *From:* Srinivas Neeli <sneeli@xilinx.com>
> > > > *Sent:* Wednesday, June 9, 2021 12:57 PM
> > > > *To:* Guenter Roeck <linux@roeck-us.net>; Shubhrajyoti Datta
> > > > <shubhraj@xilinx.com>; Srinivas Goud <sgoud@xilinx.com>; Michal
> > > > Simek <michals@xilinx.com>
> > > > *Cc:* wim@linux-watchdog.org; linux-watchdog@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; git <git@xilinx.com>
> > > > *Subject:* RE: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal Window
> > > > watchdog mode
> > > >
> > > > Hi Guenter Roeck,
> > > >
> > > > Thanks for review.
> > > >
> > > > Versal platform contain System watchdog Timer. It supports two
> > > > functions, Those are
> > > >
> > > > 1) Generic watchdog mode
> > > >
> > > > 2) Window watchdog mode
> > > >
> > > > Right now we are implementing window watchdog timer functionality in
> > > driver.
> > > >
> > > > Features of Window watchdog mode:
> > > >
> > > > - The timer contains two configurable windows( closed and open).
> > > >
> > > > - The timer has to restart only in open window.
> > > >
> > > > - If software tries to restart out side of open window it will
> > > > generate a
> > > reset.
> > > >
> > > > We have a requirement for window watchdog driver, So I  implemented
> > > window watchdog in two scenarios.
> > > >
> > > > 1) With Pre-timeout
> > > >
> > > > 2) With without Pre-timeout
> > > >
> > > > *Scenario 1:*
> > > >
> > > > With pre-timeout:
> > > >
> > > > Here we will get two window concept.
> > > >
> > > > 1) closed window
> > > >
> > > > 2) Open window
> > > >
> > > > start to pre-timeout, we are calling "*closed*" window.
> > > >
> > > >  From pre-timeout to timeout we are calling “*Open*” window.
> > > >
> > > > *Operations:*
> > > >
> > > > start
> > > >
> > > > keep alive(only in open window,  closed window we are ignoring)
> > > >
> > > > stop
> > > >
> > > > we don't have permission to refresh/restart our timer in closed
> > > > window, So
> > > ignoring the keepalive.
> > > >
> > > > Adjusted code to generate interrupt after completion of closed window.
> > > once we cross the closed window we can restart our time anytime.
> > > >
> > > > Once we reaches to timeout , will get reset signal.
> > > >
> > > > *Advantage:*
> > > >
> > > > After getting pre-timeout notification we can reset our timer or can
> > > > collect
> > > our log.
> > > >
> > > > once we get interrupt we can conclude our task is not working as
> > expected.
> > > >
> > > > So we can takecare of our tasks.
> > > >
> > > > *Scenario 2:*
> > > >
> > > > with out pre-timeout:
> > > >
> > > > It will work like general watchdog timer.
> > > >
> > > > we can run keepalive anytime(as there is no closed window, only open
> > > window present).
> > > >
> > > > Once we reaches to time out, will get reset.
> > > >
> > > > *Operations:*
> > > >
> > > > start
> > > >
> > > > keep alive
> > > >
> > > > stop
> > > >
> > > > For more details:
> > > >
> > > > https://www.xilinx.com/support/documentation/architecture-
> > > manuals/am01
> > > > 1-versal-acap-trm.pdf
> > > > <https://www.xilinx.com/support/documentation/architecture-
> > > manuals/am0
> > > > 11-versal-acap-trm.pdf>
> > > >
> > > > major comments will update in V2.
> > > >
> > > >  > -----Original Message-----
> > > >
> > > >  > From: Guenter Roeck <groeck7@gmail.com
> > > <mailto:groeck7@gmail.com>>
> > > > On Behalf Of Guenter Roeck
> > > >
> > > >  > Sent: Thursday, May 27, 2021 8:09 PM
> > > >
> > > >  > To: Srinivas Neeli <sneeli@xilinx.com
> > > > <mailto:sneeli@xilinx.com>>; Shubhrajyoti Datta
> > > >
> > > >  > <shubhraj@xilinx.com <mailto:shubhraj@xilinx.com>>; Srinivas Goud
> > > > <sgoud@xilinx.com <mailto:sgoud@xilinx.com>>; Michal Simek
> > > >
> > > >  > <michals@xilinx.com <mailto:michals@xilinx.com>>
> > > >
> > > >  > Cc: wim@linux-watchdog.org <mailto:wim@linux-watchdog.org>;
> > > > linux-watchdog@vger.kernel.org
> > > > <mailto:linux-watchdog@vger.kernel.org>; linux-
> > > >
> > > >  > kernel@vger.kernel.org <mailto:kernel@vger.kernel.org>; git
> > > > <git@xilinx.com <mailto:git@xilinx.com>>
> > > >
> > > >  > Subject: Re: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal Window
> > > >
> > > >  > watchdog mode
> > > >
> > > >  >
> > > >
> > > >  > The subject is confusing. This patch does not add "Versal Window
> > > > watchdog
> > > >
> > > >  > mode", it adds a driver which supports the Versal Window watchdog.
> > > > The
> > > >
> > > >  > subject should be something like "watchdog: Add Versal Window
> > > > watchdog
> > > >
> > > >  > driver".
> > > >
> > > >  >
> > > >
> > > >  > On 5/27/21 2:57 AM, Srinivas Neeli wrote:
> > > >
> > > >  > > Versal watchdog driver uses Window watchdog mode. Window
> > > watchdog
> > > >
> > > >  > > timer(WWDT) contains closed(first) and open(second) window with
> > > >
> > > >  > > 32 bit width. WWDT will generate an interrupt after the first
> > > > window
> > > >
> > > >  > > timeout and reset signal after the second window timeout.
> > > > Timeout and
> > > >
> > > >  > > Pre-timeout configuration, Stop and Refresh trigger only in
> > > > open
> > > >
> > > >  > > window.
> > > >
> > > >  >
> > > >
> > > >  > Does that mean that userspace can not send a keepalive before the
> > > >
> > > >  > pretimeout expires ? That is not how this is supposed to work. If
> > > > that is the
> > > >
> > > >  > case, this is not a pretimeout. Pretimeout is supposed to be used
> > > > for
> > > >
> > > >  > emergency handling, such as triggering a crash dump. The above
> > > > description
> > > >
> > > >  > as well as the code suggests that an interrupt is all but mandatory.
> > > >
> > > >  >
> > > >
> > > >  > Assuming that is all the case, ie that keepalive is only possible
> > > > after the
> > > >
> > > >  > interrupt was received, and that timeout updates are also only
> > > > possible after
> > > >
> > > >  > an interrupt was received, one possible handling would to record
> > > > that a
> > > >
> > > >  > keepalive was received, and to record that a request to update
> > > > the timeout
> > > >
> > > >  > was received if that happens while the window is closed. Then,
> > > > when the
> > > >
> > > >  > interrupt is received, those actions can be applied. Otherwise,
> > > > if there was
> > > >
> > > >  > no keepalive request prior to the interrupt, the interrupt
> > > > handler would call
> > > >
> > > >  > watchdog_notify_pretimeout().
> > > >
> > > >  >
> > > >
> > > >  > Of course, this is all just guesswork.
> > > >
> > > >  >
> > > >
> > > >  > More comments below.
> > > >
> > > >  >
> > > >
> > > >  > Guenter
> > > >
> > > >  >
> > > >
> > > >  > >
> > > >
> > > >  > > Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com
> > > > <mailto:srinivas.neeli@xilinx.com>>
> > > >
> > > >  > > ---
> > > >
> > > >  > >   drivers/watchdog/Kconfig       |  16 ++
> > > >
> > > >  > >   drivers/watchdog/Makefile      |   1 +
> > > >
> > > >  > >   drivers/watchdog/xilinx_wwdt.c | 382
> > > >
> > > >  > +++++++++++++++++++++++++++++++++
> > > >
> > > >  > >   3 files changed, 399 insertions(+)
> > > >
> > > >  > >   create mode 100644 drivers/watchdog/xilinx_wwdt.c
> > > >
> > > >  > >
> > > >
> > > >  > > diff --git a/drivers/watchdog/Kconfig
> > > > b/drivers/watchdog/Kconfig index
> > > >
> > > >  > > 355100dad60a..2ed17f278783 100644
> > > >
> > > >  > > --- a/drivers/watchdog/Kconfig
> > > >
> > > >  > > +++ b/drivers/watchdog/Kconfig
> > > >
> > > >  > > @@ -307,6 +307,22 @@ config XILINX_WATCHDOG
> > > >
> > > >  > >            To compile this driver as a module, choose M here:
> > > > the
> > > >
> > > >  > >            module will be called of_xilinx_wdt.
> > > >
> > > >  > >
> > > >
> > > >  > > +config XILINX_WINDOW_WATCHDOG
> > > >
> > > >  > > +      tristate "Xilinx Window Watchdog timer"
> > > >
> > > >  > > +      depends on HAS_IOMEM
> > > >
> > > >  > > +      select WATCHDOG_CORE
> > > >
> > > >  > > +      help
> > > >
> > > >  > > +        Window Watchdog driver for the versal_wwdt ip core.
> > > >
> > > >  > > +        Window watchdog timer(WWDT) contains closed(first) and
> > > >
> > > >  > > +        open(second) window with 32 bit width. WWDT will
> > > > generate
> > > >
> > > >  > > +        an interrupt after the first window timeout and reset
> > > >
> > > >  > > +        signal after the second window timeout. Timeout and
> > > >
> > > >  > > +        Pre-timeout configuration, Stop and Refresh trigger
> > > >
> > > >  > > +        only in open window.
> > > >
> > > >  > > +
> > > >
> > > >  > > +        To compile this driver as a module, choose M here: the
> > > >
> > > >  > > +        module will be called xilinx_wwdt.
> > > >
> > > >  > > +
> > > >
> > > >  > >   config ZIIRAVE_WATCHDOG
> > > >
> > > >  > >          tristate "Zodiac RAVE Watchdog Timer"
> > > >
> > > >  > >          depends on I2C
> > > >
> > > >  > > diff --git a/drivers/watchdog/Makefile
> > > > b/drivers/watchdog/Makefile
> > > >
> > > >  > > index a7eade8b4d45..97d10c3d39c7 100644
> > > >
> > > >  > > --- a/drivers/watchdog/Makefile
> > > >
> > > >  > > +++ b/drivers/watchdog/Makefile
> > > >
> > > >  > > @@ -148,6 +148,7 @@ obj-$(CONFIG_M54xx_WATCHDOG) +=
> > > >
> > > >  > m54xx_wdt.o
> > > >
> > > >  > >
> > > >
> > > >  > >   # MicroBlaze Architecture
> > > >
> > > >  > >   obj-$(CONFIG_XILINX_WATCHDOG) += of_xilinx_wdt.o
> > > >
> > > >  > > +obj-$(CONFIG_XILINX_WINDOW_WATCHDOG) += xilinx_wwdt.o
> > > >
> > > >  > >
> > > >
> > > >  > >   # MIPS Architecture
> > > >
> > > >  > >   obj-$(CONFIG_ATH79_WDT) += ath79_wdt.o diff --git
> > > >
> > > >  > > a/drivers/watchdog/xilinx_wwdt.c
> > > > b/drivers/watchdog/xilinx_wwdt.c new
> > > >
> > > >  > > file mode 100644 index 000000000000..8fa2cb2225e8
> > > >
> > > >  > > --- /dev/null
> > > >
> > > >  > > +++ b/drivers/watchdog/xilinx_wwdt.c
> > > >
> > > >  > > @@ -0,0 +1,382 @@
> > > >
> > > >  > > +// SPDX-License-Identifier: GPL-2.0
> > > >
> > > >  > > +/*
> > > >
> > > >  > > + * Window Watchdog Device Driver for Xilinx Versal WWDT
> > > >
> > > >  > > + *
> > > >
> > > >  > > + * (C) Copyright 2021 Xilinx, Inc.
> > > >
> > > >  > > + */
> > > >
> > > >  > > +
> > > >
> > > >  > > +#include <linux/clk.h>
> > > >
> > > >  > > +#include <linux/interrupt.h>
> > > >
> > > >  > > +#include <linux/io.h>
> > > >
> > > >  > > +#include <linux/ioport.h>
> > > >
> > > >  > > +#include <linux/of_device.h>
> > > >
> > > >  > > +#include <linux/of_address.h>
> > > >
> > > >  > > +#include <linux/module.h>
> > > >
> > > >  > > +#include <linux/watchdog.h>
> > > >
> > > >  > > +
> > > >
> > > >  > > +#define XWWDT_DEFAULT_TIMEOUT           40
> > > >
> > > >  > > +#define XWWDT_MIN_TIMEOUT    1
> > > >
> > > >  > > +#define XWWDT_MAX_TIMEOUT   42
> > > >
> > > >  > > +
> > > >
> > > >  > > +/* Register offsets for the WWdt device */
> > > >
> > > >  > > +#define XWWDT_MWR_OFFSET      0x00
> > > >
> > > >  > > +#define XWWDT_ESR_OFFSET          0x04
> > > >
> > > >  > > +#define XWWDT_FCR_OFFSET          0x08
> > > >
> > > >  > > +#define XWWDT_FWR_OFFSET        0x0c
> > > >
> > > >  > > +#define XWWDT_SWR_OFFSET        0x10
> > > >
> > > >  > > +
> > > >
> > > >  > > +/* Master Write Control Register Masks */
> > > >
> > > >  > > +#define XWWDT_MWR_MASK                         BIT(0)
> > > >
> > > >  > > +
> > > >
> > > >  > > +/* Enable and Status Register Masks */
> > > >
> > > >  > > +#define XWWDT_ESR_WINT_MASK BIT(16)
> > > >
> > > >  > > +#define XWWDT_ESR_WSW_MASK BIT(8)
> > > >
> > > >  > > +#define XWWDT_ESR_WEN_MASK BIT(0)
> > > >
> > > >  > > +
> > > >
> > > >  > > +/* Function control Register Masks */
> > > >
> > > >  > > +#define XWWDT_SBC_MASK                            0xFF00
> > > >
> > > >  > > +#define XWWDT_SBC_SHIFT                             16
> > > >
> > > >  > > +#define XWWDT_BSS_MASK                             0xC0
> > > >
> > > >  > > +
> > > >
> > > >  > > +static int wwdt_timeout;
> > > >
> > > >  > > +
> > > >
> > > >  > > +module_param(wwdt_timeout, int, 0644);
> > > >
> > > >  > MODULE_PARM_DESC(wwdt_timeout,
> > > >
> > > >  > > +                      "Watchdog time in seconds. (default="
> > > >
> > > >  > > +                      __MODULE_STRING(XWWDT_DEFAULT_TIMEOUT)
> > > > ")");
> > > >
> > > >  > > +
> > > >
> > > >  > > +struct xwwdt_device {
> > > >
> > > >  > > +      void __iomem *base;
> > > >
> > > >  > > +      spinlock_t spinlock; /* spinlock for register handling
> > > > */
> > > >
> > > >  > > +      struct watchdog_device xilinx_wwdt_wdd;
> > > >
> > > >  > > +      struct clk *clk;
> > > >
> > > >  > > +      int irq;
> > > >
> > > >  > > +};
> > > >
> > > >  > > +
> > > >
> > > >  > > +static int is_wwdt_in_closed_window(struct watchdog_device
> > > > *wdd)
> > > >
> > > >  >
> > > >
> > > >  > should return bool
> > > >
> > > > Will update in V2.
> > > >
> > > >  >
> > > >
> > > >  > > +{
> > > >
> > > >  > > +      u32 control_status_reg;
> > > >
> > > >  > > +      struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      spin_lock(&xdev->spinlock);
> > > >
> > > >  > > +      control_status_reg = ioread32(xdev->base +
> > > > XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +      spin_unlock(&xdev->spinlock);
> > > >
> > > >  > > +      if (control_status_reg & XWWDT_ESR_WEN_MASK)
> > > >
> > > >  > > +                      if (!(control_status_reg &
> > > > XWWDT_ESR_WSW_MASK))
> > > >
> > > >  > > +                                      return 0;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      return 1;
> > > >
> > > >  >
> > > >
> > > >  > Can be written as expresion without if statement
> > > >
> > > > Will update in V2
> > > >
> > > >  >
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +static int xilinx_wwdt_start(struct watchdog_device *wdd) {
> > > >
> > > >  > > +      struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
> > > >
> > > >  > > +      struct watchdog_device *xilinx_wwdt_wdd = &xdev-
> > > >
> > > >  > >xilinx_wwdt_wdd;
> > > >
> > > >  > > +      u64 time_out, pre_timeout, count;
> > > >
> > > >  > > +      u32 control_status_reg, fcr;
> > > >
> > > >  > > +      int ret;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      count = clk_get_rate(xdev->clk);
> > > >
> > > >  > > +      if (!count)
> > > >
> > > >  > > +                      return -EINVAL;
> > > >
> > > >  > > +
> > > >
> > > >  > Is there a reason to believe that the clock rate can change ?
> > > >
> > > >  > If not I would suggest to read it once and store it in struct
> > xwwdt_device.
> > > >
> > > > Will update in V2.
> > > >
> > > >  >
> > > >
> > > >  > > +      /* Calculate timeout count */
> > > >
> > > >  > > +      pre_timeout = count * wdd->pretimeout;
> > > >
> > > >  > > +      time_out = count * wdd->timeout;
> > > >
> > > >  > > +      if (!watchdog_active(xilinx_wwdt_wdd)) {
> > > >
> > > >  > > +                      ret  = clk_enable(xdev->clk);
> > > >
> > > >  >
> > > >
> > > >  > This is at the very least confusing.
> > > >
> > > >  > The last action in the probe function is to call
> > > > clk_disable_unprepare(),
> > > >
> > > >  > meaning the clock should not be prepared here. How can it be
> > > > enabled
> > > >
> > > >  > without being prepared ?
> > > >
> > > > Will update in V2
> > > >
> > > >  >
> > > >
> > > >  > > +                      if (ret) {
> > > >
> > > >  > > +                                      dev_err(wdd->parent,
> > > > "Failed to enable clock\n");
> > > >
> > > >  > > +                                      return ret;
> > > >
> > > >  > > +                      }
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +
> > > >
> > > >  > I think it would be better to separate the functions to
> > > > start/stop the clock
> > > >
> > > >  > from the function to update/enable the watchdog. The use of
> > > >
> > > >  > watchdog_active() combined with
> > > >
> > > >  > clk_enable/clk_disable/clk_prepare_enable/clk_disable_unprepare
> > > >
> > > >  > is confusing and makes it all but impossible to review the driver.
> > > >
> > > >  >
> > > >
> > > >  > > +      spin_lock(&xdev->spinlock);
> > > >
> > > >  > > +      iowrite32(XWWDT_MWR_MASK, xdev->base +
> > > >
> > > >  > XWWDT_MWR_OFFSET);
> > > >
> > > >  > > +      iowrite32(~(u32)XWWDT_ESR_WEN_MASK,
> > > >
> > > >  > > +                        xdev->base + XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (pre_timeout) {
> > > >
> > > >  > > +                      iowrite32((u32)(time_out - pre_timeout),
> > > >
> > > >  > > +                                        xdev->base +
> > > > XWWDT_FWR_OFFSET);
> > > >
> > > >  > > +                      iowrite32((u32)pre_timeout, xdev->base +
> > > >
> > > >  > XWWDT_SWR_OFFSET);
> > > >
> > > >  > > +                      fcr = ioread32(xdev->base +
> > > > XWWDT_SWR_OFFSET);
> > > >
> > > >  > > +                      fcr = (fcr >> XWWDT_SBC_SHIFT) &
> > > > XWWDT_SBC_MASK;
> > > >
> > > >  > > +                      fcr = fcr | XWWDT_BSS_MASK;
> > > >
> > > >  > > +                      iowrite32(fcr, xdev->base +
> > > > XWWDT_FCR_OFFSET);
> > > >
> > > >  > > +      } else {
> > > >
> > > >  > > +                      iowrite32((u32)pre_timeout,
> > > >
> > > >  > > +                                        xdev->base +
> > > > XWWDT_FWR_OFFSET);
> > > >
> > > >  > > +                      iowrite32((u32)time_out, xdev->base +
> > > >
> > > >  > XWWDT_SWR_OFFSET);
> > > >
> > > >  > > +                      iowrite32(0x0, xdev->base +
> > > > XWWDT_FCR_OFFSET);
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +
> > > >
> > > >  > > +      /* Enable the window watchdog timer */
> > > >
> > > >  > > +      control_status_reg = ioread32(xdev->base +
> > > > XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +      control_status_reg |= XWWDT_ESR_WEN_MASK;
> > > >
> > > >  > > +      iowrite32(control_status_reg, xdev->base +
> > > > XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      spin_unlock(&xdev->spinlock);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      dev_dbg(xilinx_wwdt_wdd->parent, "Watchdog Started!\n");
> > > >
> > > >  > > +
> > > >
> > > >  > > +      return 0;
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +static int xilinx_wwdt_stop(struct watchdog_device *wdd) {
> > > >
> > > >  > > +      struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
> > > >
> > > >  > > +      struct watchdog_device *xilinx_wwdt_wdd = &xdev-
> > > >
> > > >  > >xilinx_wwdt_wdd;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (!is_wwdt_in_closed_window(wdd)) {
> > > >
> > > >  > > +                      dev_warn(xilinx_wwdt_wdd->parent, "timer
> > > > in closed
> > > >
> > > >  > window");
> > > >
> > > >  > > +                      return -EINVAL;
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +
> > > >
> > > >  > > +      spin_lock(&xdev->spinlock);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      iowrite32(XWWDT_MWR_MASK, xdev->base +
> > > >
> > > >  > XWWDT_MWR_OFFSET);
> > > >
> > > >  > > +      /* Disable the Window watchdog timer */
> > > >
> > > >  > > +      iowrite32(~(u32)XWWDT_ESR_WEN_MASK,
> > > >
> > > >  > > +                        xdev->base + XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      spin_unlock(&xdev->spinlock);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (watchdog_active(xilinx_wwdt_wdd))
> > > >
> > > >  > > +                      clk_disable(xdev->clk);
> > > >
> > > >  > > +
> > > >
> > > >  >
> > > >
> > > >  > The stop function won't be called if the watchdog is not running,
> > > > ie if
> > > >
> > > >  > watchdog_active() returns false.
> > > >
> > > >  > I don't undeerstand the logic of clock handling in this driver.
> > > >
> > > >  > More on that below.
> > > >
> > > >  >
> > > >
> > > >  > > +      dev_dbg(xilinx_wwdt_wdd->parent, "Watchdog Stopped!\n");
> > > >
> > > >  > > +
> > > >
> > > >  > > +      return 0;
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +static int xilinx_wwdt_keepalive(struct watchdog_device *wdd)
> > > > {
> > > >
> > > >  > > +      u32 control_status_reg;
> > > >
> > > >  > > +      struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      /* Refresh in open window is ignored */
> > > >
> > > >  > > +      if (!is_wwdt_in_closed_window(wdd))
> > > >
> > > >  > > +                      return 0;
> > > >
> > > >  > > +
> > > >
> > > >  > This is dangerous. There is no reason for userspace to adhere to
> > > > these
> > > >
> > > >  > restrictions.
> > > >
> > > >  >
> > > >
> > > >  > > +      spin_lock(&xdev->spinlock);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      iowrite32(XWWDT_MWR_MASK, xdev->base +
> > > >
> > > >  > XWWDT_MWR_OFFSET);
> > > >
> > > >  > > +      control_status_reg = ioread32(xdev->base +
> > > > XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +      control_status_reg |= XWWDT_ESR_WINT_MASK;
> > > >
> > > >  > > +      control_status_reg &= ~XWWDT_ESR_WSW_MASK;
> > > >
> > > >  > > +      iowrite32(control_status_reg, xdev->base +
> > > > XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +      control_status_reg = ioread32(xdev->base +
> > > > XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +      control_status_reg |= XWWDT_ESR_WSW_MASK;
> > > >
> > > >  > > +      iowrite32(control_status_reg, xdev->base +
> > > > XWWDT_ESR_OFFSET);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      spin_unlock(&xdev->spinlock);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      return 0;
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +static int xilinx_wwdt_set_timeout(struct watchdog_device
> > > > *wdd,
> > > >
> > > >  > > +
> > > > unsigned int new_time)
> > > >
> > > >  > > +{
> > > >
> > > >  > > +      u32 ret = 0;
> > > >
> > > >  > > +      struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
> > > >
> > > >  > > +      struct watchdog_device *xilinx_wwdt_wdd = &xdev-
> > > >
> > > >  > >xilinx_wwdt_wdd;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (!is_wwdt_in_closed_window(wdd)) {
> > > >
> > > >  > > +                      dev_warn(xilinx_wwdt_wdd->parent, "timer
> > > > in closed
> > > >
> > > >  > window");
> > > >
> > > >  > > +                      return -EINVAL;
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +
> > > >
> > > >  >
> > > >
> > > >  > So userspace can clog the log by continuously trying to set the timeout
> > ?
> > > >
> > > >  >
> > > >
> > > >  > Also, again, this is dangerous. Userspace does not know the window
> > size.
> > > >
> > > > user can configure window size.
> > > >
> > > >  >
> > > >
> > > >  >
> > > >
> > > >  > > +      if (new_time < XWWDT_MIN_TIMEOUT ||
> > > >
> > > >  > > +          new_time > XWWDT_MAX_TIMEOUT) {
> > > >
> > > >  > > +                      dev_warn(xilinx_wwdt_wdd->parent,
> > > >
> > > >  > > +                                      "timeout value must be
> > > > %d<=x<=%d, using %d\n",
> > > >
> > > >  > > +                                      XWWDT_MIN_TIMEOUT,
> > > >
> > > >  > > +                                      XWWDT_MAX_TIMEOUT,
> > > > new_time);
> > > >
> > > >  > > +                      return -EINVAL;
> > > >
> > > >  > > +      }
> > > >
> > > >  >
> > > >
> > > >  > This is handled by the watchdog core.
> > > >
> > > >  >
> > > >
> > > >  > > +
> > > >
> > > >  > > +      wdd->timeout = new_time;
> > > >
> > > >  > > +      wdd->pretimeout = 0;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (watchdog_active(xilinx_wwdt_wdd)) {
> > > >
> > > >  > > +                      ret = xilinx_wwdt_start(wdd);
> > > >
> > > >  > > +                      if (ret)
> > > >
> > > >  > > +
> > > > dev_dbg(xilinx_wwdt_wdd->parent, "timer start
> > > >
> > > >  > failed");
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +
> > > >
> > > >  > > +      return ret;
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +static int xilinx_wwdt_set_pretimeout(struct watchdog_device
> > > > *wdd,
> > > >
> > > >  > > +
> > > > u32
> > > > new_pretimeout)
> > > >
> > > >  > > +{
> > > >
> > > >  > > +      u32 ret = 0;
> > > >
> > > >  > > +      struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
> > > >
> > > >  > > +      struct watchdog_device *xilinx_wwdt_wdd = &xdev-
> > > >
> > > >  > >xilinx_wwdt_wdd;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (!is_wwdt_in_closed_window(wdd)) {
> > > >
> > > >  > > +                      dev_warn(xilinx_wwdt_wdd->parent, "timer
> > > > in closed
> > > >
> > > >  > window");
> > > >
> > > >  > > +                      return -EINVAL;
> > > >
> > > >  > > +      }
> > > >
> > > >  >
> > > >
> > > >  > This restriction is not only dangerous but confusing, and simply
> > > unacceptable.
> > > >
> > > >  > Userspace will get -EINVAL with no idea what is wrong.
> > > >
> > > >  > A watchdog daemon will bail out for no good reason.
> > > >
> > > >  >
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (new_pretimeout < wdd->min_timeout ||
> > > >
> > > >  > > +          new_pretimeout >= wdd->timeout)
> > > >
> > > >  > > +                      return -EINVAL;
> > > >
> > > >  > > +
> > > >
> > > >  > This is handled by the watchdog core.
> > > >
> > > >  >
> > > >
> > > >  > > +      wdd->pretimeout = new_pretimeout;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (watchdog_active(xilinx_wwdt_wdd)) {
> > > >
> > > >  > > +                      ret = xilinx_wwdt_start(wdd);
> > > >
> > > >  > > +                      if (ret)
> > > >
> > > >  > > +
> > > > dev_dbg(xilinx_wwdt_wdd->parent, "timer start
> > > >
> > > >  > failed");
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +
> > > >
> > > >  > > +      return ret;
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +static void xwwdt_clk_disable_unprepare(void *data) {
> > > >
> > > >  > > +      clk_disable_unprepare(data);
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +static irqreturn_t xilinx_wwdt_isr(int irq, void *wdog_arg) {
> > > >
> > > >  > > +      struct xwwdt_device *xdev = wdog_arg;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      watchdog_notify_pretimeout(&xdev->xilinx_wwdt_wdd);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      return IRQ_HANDLED;
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +static const struct watchdog_info xilinx_wwdt_ident = {
> > > >
> > > >  > > +      .options = WDIOF_MAGICCLOSE |
> > > >
> > > >  > > +                         WDIOF_KEEPALIVEPING |
> > > >
> > > >  > > +                         WDIOF_SETTIMEOUT,
> > > >
> > > >  > > +      .firmware_version = 1,
> > > >
> > > >  > > +      .identity = "xlnx_window watchdog",
> > > >
> > > >  > > +};
> > > >
> > > >  > > +
> > > >
> > > >  > > +static const struct watchdog_info xilinx_wwdt_pretimeout_ident
> > > > = {
> > > >
> > > >  > > +      .options = WDIOF_MAGICCLOSE |
> > > >
> > > >  > > +                         WDIOF_KEEPALIVEPING |
> > > >
> > > >  > > +                         WDIOF_PRETIMEOUT |
> > > >
> > > >  > > +                         WDIOF_SETTIMEOUT,
> > > >
> > > >  > > +      .firmware_version = 1,
> > > >
> > > >  > > +      .identity = "xlnx_window watchdog",
> > > >
> > > >  > > +};
> > > >
> > > >  > > +
> > > >
> > > >  > > +static const struct watchdog_ops xilinx_wwdt_ops = {
> > > >
> > > >  > > +      .owner = THIS_MODULE,
> > > >
> > > >  > > +      .start = xilinx_wwdt_start,
> > > >
> > > >  > > +      .stop = xilinx_wwdt_stop,
> > > >
> > > >  > > +      .ping = xilinx_wwdt_keepalive,
> > > >
> > > >  > > +      .set_timeout = xilinx_wwdt_set_timeout,
> > > >
> > > >  > > +      .set_pretimeout = xilinx_wwdt_set_pretimeout, };
> > > >
> > > >  > > +
> > > >
> > > >  > > +static int xwwdt_probe(struct platform_device *pdev) {
> > > >
> > > >  > > +      struct device *dev = &pdev->dev;
> > > >
> > > >  > > +      struct watchdog_device *xilinx_wwdt_wdd;
> > > >
> > > >  > > +      struct xwwdt_device *xdev;
> > > >
> > > >  > > +      u32 pre_timeout = 0;
> > > >
> > > >  > > +      int ret;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      xdev = devm_kzalloc(dev, sizeof(*xdev), GFP_KERNEL);
> > > >
> > > >  > > +      if (!xdev)
> > > >
> > > >  > > +                      return -ENOMEM;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
> > > >
> > > >  > > +      xilinx_wwdt_wdd->info = &xilinx_wwdt_ident;
> > > >
> > > >  > > +      xilinx_wwdt_wdd->ops = &xilinx_wwdt_ops;
> > > >
> > > >  > > +      xilinx_wwdt_wdd->parent = dev;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      xdev->base = devm_platform_ioremap_resource(pdev, 0);
> > > >
> > > >  > > +      if (IS_ERR(xdev->base))
> > > >
> > > >  > > +                      return PTR_ERR(xdev->base);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      ret = of_property_read_u32(dev->of_node,
> > > > "pretimeout-sec",
> > > >
> > > >  > > +
> > > > &pre_timeout);
> > > >
> > > >  > > +      if (ret)
> > > >
> > > >  > > +                      dev_dbg(dev,
> > > >
> > > >  > > +                                      "Parameter
> > > > \"pretimeout-sec\" not found\n");
> > > >
> > > >  > > +
> > > >
> > > >  > > +      xdev->clk = devm_clk_get(dev, NULL);
> > > >
> > > >  > > +      if (IS_ERR(xdev->clk))
> > > >
> > > >  > > +                      return PTR_ERR(xdev->clk);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      ret = clk_get_rate(xdev->clk);
> > > >
> > > >  > > +      if (!ret)
> > > >
> > > >  > > +                      return -EINVAL;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      ret = clk_prepare_enable(xdev->clk);
> > > >
> > > >  > > +      if (ret) {
> > > >
> > > >  > > +                      dev_err(dev, "unable to enable
> > > > clock\n");
> > > >
> > > >  > > +                      return ret;
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +      ret = devm_add_action_or_reset(dev,
> > > >
> > > >  > xwwdt_clk_disable_unprepare,
> > > >
> > > >  > > +
> > > > xdev->clk);
> > > >
> > > >  > > +      if (ret)
> > > >
> > > >  > > +                      goto err_clk_disable;
> > > >
> > > >  > > +
> > > >
> > > >  >
> > > >
> > > >  > Seems pointless. What happens when you unload the driver ?
> > > >
> > > >  >
> > > >
> > > >  > > +      xilinx_wwdt_wdd->pretimeout = pre_timeout;
> > > >
> > > >  > > +      xilinx_wwdt_wdd->timeout = XWWDT_DEFAULT_TIMEOUT;
> > > >
> > > >  > > +      xilinx_wwdt_wdd->min_timeout = XWWDT_MIN_TIMEOUT;
> > > >
> > > >  > > +      xilinx_wwdt_wdd->max_timeout = XWWDT_MAX_TIMEOUT;
> > > >
> > > >  > > +
> > > >
> > > >  > > +      xdev->irq = platform_get_irq_byname(pdev, "wdt");
> > > >
> > > >  > > +      if (xdev->irq < 0) {
> > > >
> > > >  > > +                      ret = xdev->irq;
> > > >
> > > >  > > +                      goto err_clk_disable;
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +
> > > >
> > > >  > > +      if (!devm_request_irq(dev, xdev->irq, xilinx_wwdt_isr,
> > > >
> > > >  > > +                                            0, dev_name(dev),
> > > > xdev)) {
> > > >
> > > >  > > +                      xilinx_wwdt_wdd->info =
> > > > &xilinx_wwdt_pretimeout_ident;
> > > >
> > > >  > > +      }
> > > >
> > > >  > > +
> > > >
> > > >  > > +      ret = watchdog_init_timeout(xilinx_wwdt_wdd,
> > > >
> > > >  > > +
> > > > wwdt_timeout, &pdev->dev);
> > > >
> > > >  > > +      if (ret)
> > > >
> > > >  > > +                      dev_info(&pdev->dev, "Configured default
> > > > timeout
> > > >
> > > >  > value\n");
> > > >
> > > >  > > +
> > > >
> > > >  > > +      spin_lock_init(&xdev->spinlock);
> > > >
> > > >  > > +      watchdog_set_drvdata(xilinx_wwdt_wdd, xdev);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      ret = devm_watchdog_register_device(dev,
> > > > xilinx_wwdt_wdd);
> > > >
> > > >  > > +      if (ret)
> > > >
> > > >  > > +                      goto err_clk_disable;
> > > >
> > > >  > > +
> > > >
> > > >  > At this point the watchdog is fully instantiated, and userspace
> > > > may have
> > > >
> > > >  > enabled it.
> > > >
> > > >  >
> > > >
> > > >  > > +      clk_disable_unprepare(xdev->clk);
> > > >
> > > >  > > +
> > > >
> > > >  > And now its clock is getting stopped. Actually, it is getting unprepared.
> > > >
> > > >  > Does this even work ?
> > > >
> > > >  >
> > > >
> > > >  > > +      dev_info(dev, "Xilinx Window Watchdog Timer with timeout
> > > > %ds\n",
> > > >
> > > >  > > +                      xilinx_wwdt_wdd->timeout);
> > > >
> > > >  > > +
> > > >
> > > >  > > +      return 0;
> > > >
> > > >  > > +
> > > >
> > > >  > > +err_clk_disable:
> > > >
> > > >  > > +      clk_disable_unprepare(xdev->clk);
> > > >
> > > >  >
> > > >
> > > >  > devm_add_action_or_reset() already handles this.
> > > >
> > > >  >
> > > >
> > > >  > > +      return ret;
> > > >
> > > >  > > +}
> > > >
> > > >  > > +
> > > >
> > > >  > > +/* Mat for of_platform binding */
> > > >
> > > >  > > +static const struct of_device_id xwwdt_of_match[] = {
> > > >
> > > >  > > +      { .compatible = "xlnx,versal-wwdt-1.0", },
> > > >
> > > >  > > +      {},
> > > >
> > > >  > > +};
> > > >
> > > >  > > +MODULE_DEVICE_TABLE(of, xwwdt_of_match);
> > > >
> > > >  > > +
> > > >
> > > >  > > +static struct platform_driver xwwdt_driver = {
> > > >
> > > >  > > +      .probe = xwwdt_probe,
> > > >
> > > >  > > +      .driver = {
> > > >
> > > >  > > +                      .name = "Xilinx Window Watchdog",
> > > >
> > > >  > > +                      .of_match_table = xwwdt_of_match,
> > > >
> > > >  > > +      },
> > > >
> > > >  > > +};
> > > >
> > > >  > > +
> > > >
> > > >  > > +module_platform_driver(xwwdt_driver);
> > > >
> > > >  > > +
> > > >
> > > >  > > +MODULE_AUTHOR("Neeli Srinivas <sneeli@xilinx.com
> > > > <mailto:sneeli@xilinx.com>>");
> > > >
> > > >  > > +MODULE_DESCRIPTION("Xilinx Window Watchdog driver");
> > > >
> > > >  > > +MODULE_LICENSE("GPL");
> > > >
> > > >  > >
> > > >
> > > > Thanks
> > > >
> > > > Srinivas Neeli.
> > > >
> 
