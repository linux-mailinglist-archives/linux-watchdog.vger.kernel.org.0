Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA4F713BA47
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2020 08:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgAOHUJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jan 2020 02:20:09 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56957 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgAOHUJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jan 2020 02:20:09 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ircy8-0004ku-Qm; Wed, 15 Jan 2020 08:20:00 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ircy5-0007fK-Hu; Wed, 15 Jan 2020 08:19:57 +0100
Date:   Wed, 15 Jan 2020 08:19:57 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Stefan Lengfeld <contact@stefanchrist.eu>
Cc:     support.opensource@diasemi.com, linux@roeck-us.net,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: da9062: make restart handler atomic safe
Message-ID: <20200115071957.j7sptgbmuilgs2lj@pengutronix.de>
References: <20200113091521.5754-1-m.felsch@pengutronix.de>
 <20200114200034.nbk6vf77ucngfs6o@porty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114200034.nbk6vf77ucngfs6o@porty>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:18:18 up 60 days, 22:36, 54 users,  load average: 0.31, 0.13,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Stefan,

On 20-01-14 21:00, Stefan Lengfeld wrote:
> Hi Marco,
> 
> On Mon, Jan 13, 2020 at 10:15:21AM +0100, Marco Felsch wrote:
> > The restart handler is executed during the shutdown phase which is
> > atomic/irq-less. The i2c framework supports atomic transfers since
> > commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
> > transfers") but unfortunately the regmap framework doesn't support it
> > yet. Hard coding the i2c stuff can be done without worries since the
> > DA9062 is an i2c-only device.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Reviewed-by: Stefan Lengfeld <contact@stefanchrist.eu>
> 
> Thanks for picking up the patch and submitting it.

I will send a v2 to cover Guenter's suggestion. Can I keep your reviewed
by tag?

Regards,
  Marco

> Kind regards,
>     Stefan
