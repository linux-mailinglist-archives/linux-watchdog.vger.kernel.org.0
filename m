Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A682CA29D
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Dec 2020 13:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgLAMXV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Dec 2020 07:23:21 -0500
Received: from gproxy4-pub.mail.unifiedlayer.com ([69.89.23.142]:52233 "EHLO
        gproxy4-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbgLAMXV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Dec 2020 07:23:21 -0500
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id 09544175B50
        for <linux-watchdog@vger.kernel.org>; Tue,  1 Dec 2020 05:22:30 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id k4ftkJMbdh41lk4ftkML2m; Tue, 01 Dec 2020 05:22:30 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=F+J5iJpN c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=_jlGtV7tAAAA:8
 a=QyXUC8HyAAAA:8 a=B5D4Pc9JQnwYv9h2Z4UA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=O5DDS3v3Of4yqWH8zDGHikBnjNwJ0jdPQ3vhYwQldXY=; b=VC5aalLSkxGqCSCHVcfH6EFmcZ
        x5PLdgFjrgbDjAOWD6gdVsev5FNQMsSJfcsPi8ArQpVrkO0T6m1a8HFe/1YJHbmJXPMJzPv3KWKfp
        x1xhtJYjY/a7Ui8mOoNazk7ap8CZ+pVs2kYaUZRmsPEL022e8rQBUXOt8BKxydMDxJqIlN1yvHaRC
        kmF4gxta60YDafAIQPtTPqcAqFv/YmxCvHqZApyWyTI0sX7VA/dg0BRf60N9vBoAVaNtVxouhZVNR
        ShtmvBe6RJGOS5XSF9tpG1LA830NJthwAngfhx/hbrxKO78eregvjvZmaiY0h1grdrd+wivud2V7g
        jTy51owg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:59646 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kk4fs-0045Po-VF; Tue, 01 Dec 2020 12:22:29 +0000
Date:   Tue, 1 Dec 2020 04:22:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Wan Mohamad, Wan Ahmad Zainie" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>
Subject: Re: [PATCH v2 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Message-ID: <20201201122228.GA50515@roeck-us.net>
References: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
 <870c2fda29b290ee6b9f88b15bd1f173bfad8723.1605028524.git.vijayakannan.ayyathurai@intel.com>
 <20201130220538.GA42581@roeck-us.net>
 <DM6PR11MB4250802106A1795B78DF3C31FBF40@DM6PR11MB4250.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4250802106A1795B78DF3C31FBF40@DM6PR11MB4250.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kk4fs-0045Po-VF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:59646
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Dec 01, 2020 at 06:19:09AM +0000, Ayyathurai, Vijayakannan wrote:
> Hi Guenter,
> 
> > From: Guenter Roeck <linux@roeck-us.net>
> > 
> > On Wed, Nov 11, 2020 at 01:53:07AM +0800,
> > vijayakannan.ayyathurai@intel.com wrote:
> > > From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> > >
> > > Intel Keembay Soc requires watchdog timer support.
> > > Add watchdog driver to enable this.
> > >
> > > +static void keembay_wdt_set_timeout_reg(struct watchdog_device *wdog,
> > bool ping)
> > > +{
> > > +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> > > +	u32 th_val = 0;
> > > +
> > > +	if (ping)
> > > +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout *
> > wdt->rate);
> > > +
> > > +	if (!ping && wdog->pretimeout) {
> > > +		th_val = wdog->timeout - wdog->pretimeout;
> > > +		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val
> > * wdt->rate);
> > > +	}
> > > +
> > > +	if (!ping)
> > > +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout *
> > wdt->rate);
> > 
> > I am a bit at loss here. This seems unnecessarily complex. Why not just the
> > following ?
> > 
> 
> Sure. I can follow the below way.
> Let me know if there is further comments to improve for the next version.
> 
No, that was all. Driver looks good otherwise.

Guenter

> > 	if (!ping && wdog->pretimeout) {
> > 		th_val = wdog->timeout - wdog->pretimeout;
> > 		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val
> > * wdt->rate);
> > 	}
> > 	keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt-
> > >rate);
> > 
> > Thanks,
> > Guenter
> 
> Thanks,
> Vijay
