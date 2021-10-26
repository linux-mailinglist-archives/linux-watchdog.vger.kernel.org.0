Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F5743B5FB
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Oct 2021 17:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhJZPsm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Oct 2021 11:48:42 -0400
Received: from infomag.iguana.be ([185.87.124.46]:38660 "EHLO
        infomag.iguana.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbhJZPsl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Oct 2021 11:48:41 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Oct 2021 11:48:41 EDT
Received: by infomag.iguana.be (Postfix, from userid 1001)
        id 34061603CACE; Tue, 26 Oct 2021 17:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 infomag.iguana.be 34061603CACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iguana.be;
        s=infomag-20180602; t=1635262809;
        bh=ILfp7LWOhmKj8vVPjSv8TJsD1eEoAW9Svun2Hh+8ZTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gGhAtHUkkkAQ90Aj9prvwgJ+4EgxT7BidNSOzaKQ0Ahcajwe63wLyMKe78FTRJqH7
         m7Mdhjzo00L2rmwSQQ+eEQGKCBhuO1V3fvR6vpMPivTyp9rYNsvWW+7UvbiG8QL0TG
         tOi/U1mhm0SaOsFtf03g1LGuC7Q1xpm+8txRErZE=
Date:   Tue, 26 Oct 2021 17:40:09 +0200
From:   Wim Van Sebroeck <wim@iguana.be>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>,
        "Javier S . Pedro" <debbugs@javispedro.com>
Subject: Re: [PATCH] Revert "watchdog: iTCO_wdt: Account for rebooting on
 second timeout"
Message-ID: <20211026154009.GA22910@infomag.iguana.be>
References: <20211008003302.1461733-1-linux@roeck-us.net>
 <20211020194408.GA2882870@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020194408.GA2882870@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> On Thu, Oct 07, 2021 at 05:33:02PM -0700, Guenter Roeck wrote:
> > This reverts commit cb011044e34c ("watchdog: iTCO_wdt: Account for
> > rebooting on second timeout") and commit aec42642d91f ("watchdog: iTCO_wdt:
> > Fix detection of SMI-off case") since those patches cause a regression
> > on certain boards (https://bugzilla.kernel.org/show_bug.cgi?id=213809).
> > 
> > While this revert may result in some boards to only reset after twice
> > the configured timeout value, that is still better than a watchdog reset
> > after half the configured value.
> > 
> > Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
> > Fixes: aec42642d91f ("watchdog: iTCO_wdt: Fix detection of SMI-off case")
> > Cc: Jan Kiszka <jan.kiszka@siemens.com>
> > Cc: Mantas Mikulėnas <grawity@gmail.com>
> > Reported-by: Javier S. Pedro <debbugs@javispedro.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Any chance you can send a pull request with this patch prior to the v5.15
> release ?

Will do it this evening.

Kind regards,
Wim.

