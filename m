Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072B115713B
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2020 09:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbgBJIxL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Feb 2020 03:53:11 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47667 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgBJIxL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Feb 2020 03:53:11 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j14oX-0001oF-Kk; Mon, 10 Feb 2020 09:53:09 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1j14oX-0000tK-B8; Mon, 10 Feb 2020 09:53:09 +0100
Date:   Mon, 10 Feb 2020 09:53:09 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Stefan Lengfeld <contact@stefanchrist.eu>
Subject: Re: [PATCH] watchdog: da9062: Add dependency on I2C
Message-ID: <20200210085309.vv47s2i5kg4yyagi@pengutronix.de>
References: <20200208130803.23387-1-linux@roeck-us.net>
 <20200208140152.op4dplfvljosnlvb@pengutronix.de>
 <a02386a9-041b-a351-643f-ba0b6e91bab3@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a02386a9-041b-a351-643f-ba0b6e91bab3@roeck-us.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:48:54 up 87 days, 7 min, 100 users,  load average: 0.12, 0.09,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20-02-08 06:22, Guenter Roeck wrote:
> On 2/8/20 6:01 AM, Marco Felsch wrote:
> > Hi,
> > 
> > On 20-02-08 05:08, Guenter Roeck wrote:
> > > Since commit 057b52b4b3d58 ("watchdog: da9062: make restart handler atomic
> > > safe"), the driver calls i2c functions directly. It now therefore depends
> > > on I2C. This is a hard dependency which overrides COMPILE_TEST.
> > 
> > I just wondered why it doesn't complain if no regmap support is on and
> > surprise it provides stubs ^^ Is it worth to add i2c stubs too?
> > 
> 
> I'd rather not go there. In practice it doesn't make much of a difference -
> it just ensures that COMPILE_TEST can run on architectures which don't
> support I2C. I think 0day only finds it because they select COMPILE_TEST
> and then selectively disable I2C (and maybe other configuration options)
> to catch problems like this.

I know, just saying that this is a bit confusing for a reader because
the deps are handled correctly by MFD_* and REGMAP_* symbols. Anyway
thanks for fixing the bug I introduced. I was a bit to busy last week.

Regards,
  Marco

> Guenter
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
