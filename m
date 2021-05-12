Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4528737BF9D
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 16:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhELOQx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbhELOQI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:16:08 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9CDC061347;
        Wed, 12 May 2021 07:14:38 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso20617519otb.13;
        Wed, 12 May 2021 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h/2v8S6FtY6HcuVUHrB5RBON1H72Nf5qzZh/OC/rNz0=;
        b=notmZQ44aCKDeGmL+DT6ijYkyZArYwy/nen6vTCnOMft2JsPO40HrthjgJ7I3gyUIi
         AyepODpe/c9EAWPTw14AQFpzpVOpKoi/m8tyTezJLRcWdOxCWip58J9yCDbM7DkxXRlv
         1Ez9PWcv6o8zwEhhA1RAaB6DSzqIo2Zml5kEPQOpJPUpOmvHq3tP3XKIupcPS7gA0dVu
         2NrQf2Zgz8+QymIYvvqZywJQOqmWFqFBw5VVfmRsiW88vcWiw3UdHwo9PQcBoc+JvcvW
         cvMJkrNDUqRon83mJ+BtyCg0X4fMxsTOZTGhMfKcGH0cVx+Acxa90MgyjU+dmradJhPj
         HV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=h/2v8S6FtY6HcuVUHrB5RBON1H72Nf5qzZh/OC/rNz0=;
        b=VGx+4xjg5Pv7CDimKbA0eT50bm6Pb0slGkJoEQO8VVEaYDfuaqd7ZVId0A6IW/Q9XZ
         +qMtlJqu47EOHIGPB//49m6sNUMGjxxsq0SnRcvHqEu22CILop5O2tCNo3S8E8xVaLSZ
         bbSNfNzVk2JL1HiMV8zYMjKljwXNAx1+qciBb8pB6iMWcGRzkdDM0K1AwsmT2bgubwDy
         v/bs446j2wUdVqFrhaoyVe672wN6gsJoYvD2MxYjN5hFOnP7SHgV3w3u9S8CFxnNLG0a
         Rlrnc+lVSSqRbugK/3b9wY6vqdnefF5OObjJsM3syRzXLNCJFzwNgscpVkpnQ3z8Xetn
         NW8g==
X-Gm-Message-State: AOAM5334q6cCq3uIEefmrSyYJNlxcuhQUMq+Wzb5GXlOaiW4iSw/IsTm
        TIb2YeztW7Yz5PQIAUXjOVU=
X-Google-Smtp-Source: ABdhPJwFZion7oe6mvm7vc9ex2JG29Ufe3gjJOw30Wt+ev77WHmd8lSKoEDPcx9RA5OJsGQ3Ee95hw==
X-Received: by 2002:a9d:2f66:: with SMTP id h93mr26009143otb.188.1620828877708;
        Wed, 12 May 2021 07:14:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z9sm25659oog.25.2021.05.12.07.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:14:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 07:14:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] watchdog: imx2_wdt: clear WDOG_HW_RUNNING before
 suspend
Message-ID: <20210512141435.GL1333995@roeck-us.net>
References: <1620732032-7675-1-git-send-email-yibin.gong@nxp.com>
 <d5364293-8cba-0d39-aa45-a55c5d6d2af6@roeck-us.net>
 <VE1PR04MB66889A576AD92D4D789199D489529@VE1PR04MB6688.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB66889A576AD92D4D789199D489529@VE1PR04MB6688.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 11:34:37AM +0000, Robin Gong wrote:
> On 2021/05/11 11:59 Guenter Roeck <groeck7@gmail.com> wrote: 
> > On 5/11/21 4:20 AM, Robin Gong wrote:
> > > Since watchdog_ping_work is not freezable so that it maybe scheduled
> > > before imx2_wdt_resume where watchdog clock enabled, hence, kernel
> > > will hang in imx2_wdt_ping without clock, and then watchdog reset
> > > happen. Prevent the above case by clearing WDOG_HW_RUNNING before
> > > suspend, and restore it with ping in imx2_wdt_resume.
> > >
> > > Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> > > ---
> > >   drivers/watchdog/imx2_wdt.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> > > index b84f80f..d3751e9 100644
> > > --- a/drivers/watchdog/imx2_wdt.c
> > > +++ b/drivers/watchdog/imx2_wdt.c
> > > @@ -357,6 +357,13 @@ static int __maybe_unused
> > imx2_wdt_suspend(struct device *dev)
> > >   		 */
> > >   		__imx2_wdt_set_timeout(wdog, IMX2_WDT_MAX_TIME);
> > >   		imx2_wdt_ping(wdog);
> > > +
> > > +		/*
> > > +		 * clear WDOG_HW_RUNNING to prevent watchdog_ping_work
> > running
> > > +		 * before imx2_wdt_resume where clock enabled, otherwise kernel
> > > +		 * will hang and watchdog reset happen then.
> > > +		 */
> > > +		clear_bit(WDOG_HW_RUNNING, &wdog->status);
> > >   	}
> > >
> > >   	clk_disable_unprepare(wdev->clk);
> > > @@ -386,6 +393,7 @@ static int __maybe_unused imx2_wdt_resume(struct
> > device *dev)
> > >   	if (imx2_wdt_is_running(wdev)) {
> > >   		imx2_wdt_set_timeout(wdog, wdog->timeout);
> > >   		imx2_wdt_ping(wdog);
> > > +		set_bit(WDOG_HW_RUNNING, &wdog->status);
> > >   	}
> > >
> > >   	return 0;
> > >
> > I really don't like this; it depends on assumptions how the watchdog core
> > works, and it misuses WDOG_HW_RUNNING to indicate that the clock is
> > stopped (or that the driver is in suspend mode).
> > 
> > If ping doesn't work with the clock stopped, I think it would be much better to
> > have a flag indicating that the clock is stopped, and have the ping function do
> > nothing if it is called with stopped clock (ie if suspended).
> > 
> Understood, but I think that corner case should be a common potential issue
> in all watchdog drivers which disable clock in suspend with WDOG_HW_RUNNING.
> So common way looks better than many different specific flags in such different
> watchdog driver with the similar intention?
> 

We can not assume that the situation is exactly the same for all drivers
and use a core flag to indicate some driver specific state just to avoid
a driver-internal flag.

Either case, it looks like you are saying that the watchdog can be stopped
after all, by disabling its clock.

> BTW, for i.mx2_wdt which watchdog can't be stop unless kernel enter into suspend,
> that seems like watchdog stop after suspend and clear WDOG_HW_RUNNING makes
> sense? 
> 

Yes, if you make it official and add a stop function which disables the watchdog
by stopping its clock. Then the driver should not set WDOG_HW_RUNNING in the
first place, and use the normal mechanisms to start and stop the watchdog.
That would include starting the clock in the start function, and stopping it
in the stop function.

Thanks,
Guenter
