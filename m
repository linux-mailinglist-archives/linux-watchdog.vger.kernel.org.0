Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17777E38D
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 15:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfD2NTS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 09:19:18 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41751 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfD2NTR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 09:19:17 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hL6BZ-0008Nm-Kv; Mon, 29 Apr 2019 15:19:09 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hL6BX-0008Ne-87; Mon, 29 Apr 2019 15:19:07 +0200
Date:   Mon, 29 Apr 2019 15:19:07 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 08/16] watchdog: imx_sc_wdt: drop warning after
 calling watchdog_init_timeout
Message-ID: <20190429131907.xpl6duf4cvtwbmud@pengutronix.de>
References: <20190419181601.7412-1-wsa+renesas@sang-engineering.com>
 <20190419181601.7412-9-wsa+renesas@sang-engineering.com>
 <20190429101558.6vyiospb6oqsstt7@pengutronix.de>
 <616a9d4e-7050-a6c2-727d-f62e08d3d98c@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <616a9d4e-7050-a6c2-727d-f62e08d3d98c@roeck-us.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

On Mon, Apr 29, 2019 at 05:37:12AM -0700, Guenter Roeck wrote:
> On 4/29/19 3:15 AM, Uwe Kleine-König wrote:
> > On Fri, Apr 19, 2019 at 08:15:53PM +0200, Wolfram Sang wrote:
> > > The core will print out details now.
> > > 
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >   drivers/watchdog/imx_sc_wdt.c | 5 +----
> > >   1 file changed, 1 insertion(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> > > index 86c2722f2a09..6dc24ceb1b2c 100644
> > > --- a/drivers/watchdog/imx_sc_wdt.c
> > > +++ b/drivers/watchdog/imx_sc_wdt.c
> > 
> > This driver isn't in next, and I don't know where to look for it.
> > 
> 
> Branch watchdog-next of
> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git

Thanks, found it now.
 
> > > @@ -117,10 +117,7 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
> > >   	imx_sc_wdd->parent = &pdev->dev;
> > >   	imx_sc_wdd->timeout = DEFAULT_TIMEOUT;
> > > -	ret = watchdog_init_timeout(imx_sc_wdd, 0, &pdev->dev);
> > > -	if (ret)
> > > -		dev_warn(&pdev->dev, "Failed to set timeout value, using default\n");
> > > -
> > > +	watchdog_init_timeout(imx_sc_wdd, 0, &pdev->dev);
> > 
> > One side effect is however that ret isn't set any more. So I wonder if a
> > failure in watchdog_init_timeout() really makes the core print the
> > details as expected.
> > 
> 
> Sorry, I don't understand. The warning is printed in watchdog_init_timeout().
> What does that have to do with setting ret here or not ?

Ah, I thought the warning is done in the caller of the modified
function. Maybe this means the commit log can be improved to for
example:

	The function watchdog_init_timeout() itself already emits a
	more informative warning on failure. So drop the driver specific
	one.

Otherwise my concerns are eliminated.

Thanks
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
