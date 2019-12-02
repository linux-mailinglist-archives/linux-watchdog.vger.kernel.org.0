Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC0A510EBB0
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 15:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbfLBOoP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 09:44:15 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58325 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBOoP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 09:44:15 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ibmvr-0000qo-7u; Mon, 02 Dec 2019 15:44:11 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ibmvq-0004gF-Iv; Mon, 02 Dec 2019 15:44:10 +0100
Date:   Mon, 2 Dec 2019 15:44:10 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] watchdog: da9062: add power management ops
Message-ID: <20191202144410.k4jqnysyxgrwqmu2@pengutronix.de>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
 <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
 <AM5PR1001MB0994B329C5D4B8846FC7A71880430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202130314.dzne7eh2b5sb46c2@pengutronix.de>
 <AM5PR1001MB099461A4E8253F74FC11D6E480430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <1feb2b8e-af46-ffa9-873a-fd9b624294b9@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1feb2b8e-af46-ffa9-873a-fd9b624294b9@roeck-us.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:16:35 up 17 days,  5:35, 29 users,  load average: 0.02, 0.02,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 19-12-02 05:38, Guenter Roeck wrote:
> On 12/2/19 5:27 AM, Adam Thomson wrote:
> > Hi Marco,
> > 
> > > > Hmmm. Wouldn't that then be a board specific fix rather than this change?
> > > > Am concerned relying on software to reenable the watchdog on resume could
> > > allow
> > > > for a hang scenario potentially if that code never gets to execute. Other
> > > > systems shouldn't need this fix, assuming they don't have issues at the HW
> > > > level, so this this seems like it could be making those systems less robust. If
> > > > we are to do this at the driver level, maybe this should be an option through DT
> > > > to help faulty systems, but I'm thinking this shouldn't be default behaviour.
> > > 
> > > I don't think that we should rely on the OTP values. Those values are
> > > set by Dialog, the SoM manufacturers or by the customer itself and the
> > > time shows that this is error prone too. At least if the customer or the
> > > SoM manufacturer don't ask the Dialog Support..
> > > 
> > > You're right with the (re-)enabling but there are other drivers using
> > > such an approach.. IMHO it is safer to go this way rather than trust
> > > the OTP and the PCB layout. I would rather add a dt-compatible to tell
> > > the driver to do nothing during suspend/resume e.g.:
> > > 
> > >      - dlg,use-hw-pm
> > > 
> > > or something. Because the user needs to validate the PCB and the OTP
> > > values.
> > 
> > The thing is the DT FW is supposed to be fairly static so I would rather not
> > enforce this change on users if they adopt a kernel version with this update in.
> > I also still think it's safer if the HW does this for us. I would have hoped for
> > most designs this would be caught in early bring up where it can be rectified
> > with minimal impact, although I'm guessing that's not the case in your scenario.

Currently there is only the phytec-phycore upstream DT using the
da9061/2 PMIC... Anyway I got your concerns.

> dla,use-sw-pm ?
> dla,hw-pm-broken ?

Yes one of these. Which do you prefer Adam?

Regards,
  Marco 

> 
> Guenter
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
