Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F720402F93
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 22:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346362AbhIGUZE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 16:25:04 -0400
Received: from infomag.iguana.be ([185.87.124.46]:42222 "EHLO
        infomag.iguana.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbhIGUZE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 16:25:04 -0400
X-Greylist: delayed 565 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Sep 2021 16:25:03 EDT
Received: by infomag.iguana.be (Postfix, from userid 1001)
        id 1408D603CACE; Tue,  7 Sep 2021 22:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 infomag.iguana.be 1408D603CACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iguana.be;
        s=infomag-20180602; t=1631045669;
        bh=Wq1Ut3kmDA4Qs1MUa9QhyW5dfF/rigDOl+Eh9VKTXik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=swsLaixR7nTIu8HccvB8qTzPt89gCreJJaG+BOPsOl0p/RPbkRFuB8Z5fPidYJZlt
         idzkIvBFM5IdATAWY3xfEPBCarsU90heHYzxVQjO7JnzpfRhYU31Vym1OyuTbR9c9S
         Ska3mtf0sSKvu3JLmlvv0Lr8yMBEw7vH5/3bZc8k=
Date:   Tue, 7 Sep 2021 22:14:29 +0200
From:   Wim Van Sebroeck <wim@iguana.be>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
Message-ID: <20210907201428.GA1109@infomag.iguana.be>
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
 <1444efd5-b778-949b-34e8-99d2541350e9@siemens.com>
 <85c2c85e-147c-b54e-e84d-10b989610979@siemens.com>
 <904ea225-e7de-a11a-419a-0c7ac05e9b6e@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <904ea225-e7de-a11a-419a-0c7ac05e9b6e@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi All,

> On 8/30/21 12:47 PM, Jan Kiszka wrote:
> >On 20.08.21 15:45, Jan Kiszka wrote:
> >>On 26.07.21 13:46, Jan Kiszka wrote:
> >>>From: Jan Kiszka <jan.kiszka@siemens.com>
> >>>
> >>>Obviously, the test needs to run against the register content, not its
> >>>address.
> >>>
> >>>Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
> >>>Reported-by: Mantas Mikulėnas <grawity@gmail.com>
> >>>Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >>>---
> >>>  drivers/watchdog/iTCO_wdt.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>>diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> >>>index b3f604669e2c..643c6c2d0b72 100644
> >>>--- a/drivers/watchdog/iTCO_wdt.c
> >>>+++ b/drivers/watchdog/iTCO_wdt.c
> >>>@@ -362,7 +362,7 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
> >>>  	 * Otherwise, the BIOS generally reboots when the SMI triggers.
> >>>  	 */
> >>>  	if (p->smi_res &&
> >>>-	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
> >>>+	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
> >>>  		tmrval /= 2;
> >>>  	/* from the specs: */
> >>>
> >>
> >>Ping, this is still missing in master. Stable kernels had the revert,
> >>but 5.14 will need this.
> >>
> >
> >Second reminder: 5.14 is out and now broken. Is the patch queued
> >somewhere? I do not see it in the watchdog staging branch.
> >
> 
> I had it in my own watchdog-next branch for about a month.
> Usually Wim picks it up from there or from the mainling list;
> he handles all upstreaming. Wim ?

This one is in linux-watchdog-next since 22 Aug.
Working on getting it upstream now.

Kind regards,
Wim.

