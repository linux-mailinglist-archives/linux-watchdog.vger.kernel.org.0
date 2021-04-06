Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758B6355716
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Apr 2021 16:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239544AbhDFO5P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Apr 2021 10:57:15 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:58764 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233155AbhDFO5O (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Apr 2021 10:57:14 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 136EuRp2022676
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 6 Apr 2021 16:56:27 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.42.66])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 136EqmdF003812;
        Tue, 6 Apr 2021 16:52:48 +0200
Date:   Tue, 6 Apr 2021 16:52:47 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
Message-ID: <20210406165247.78791bf7@md1za8fc.ad001.siemens.net>
In-Reply-To: <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
References: <20210329174928.18816-1-henning.schild@siemens.com>
        <20210329174928.18816-4-henning.schild@siemens.com>
        <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Thu, 1 Apr 2021 18:15:41 +0200
schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:

> On 29.03.21 19:49, Henning Schild wrote:
> 
> Hi,
> 
> > This driver adds initial support for several devices from Siemens.
> > It is based on a platform driver introduced in an earlier commit.  
> 
> Where does the wdt actually come from ?
> 
> Is it in the SoC ? (which SoC exactly). SoC-builtin wdt is a pretty 
> usual case.
>
> Or some external chip ?

I guess external chip, but again we are talking about multiple
machines. And the manuals i read so far do not go into that sort of
detail. In fact on some of the machines you will have two watchdogs,
one from the SoC and that "special" one.
That has several reasons, probably not too important here. The HW guys
are adding another wd not just for fun, and it would be nice to have a
driver.
 
> The code smells a bit like two entirely different wdt's that just have
> some similarities. If that's the case, I'd rather split it into two
> separate drivers and let the parent driver (board file) instantiate
> the correct one.

Yes, it is two. Just like for the LEDs. One version PIO-based another
version gpio/p2sb/mmio based.
In fact the latter should very likely be based on that gpio pinctl,
whether it really needs to be a separate driver will have to be seen.
There are probably pros and cons for both options.

regards,
Henning

> 
> --mtx
> 

