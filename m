Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92532CC26A
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Dec 2020 17:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730712AbgLBQdV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Dec 2020 11:33:21 -0500
Received: from gproxy8-pub.mail.unifiedlayer.com ([67.222.33.93]:60502 "EHLO
        gproxy8-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728160AbgLBQdU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Dec 2020 11:33:20 -0500
Received: from CMGW (unknown [10.9.0.13])
        by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id CEF1C1AB06E
        for <linux-watchdog@vger.kernel.org>; Wed,  2 Dec 2020 09:32:39 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id kV3XkQ6EYi1lMkV3XkO1ju; Wed, 02 Dec 2020 09:32:39 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.2 cv=df/w5Tfe c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10
 a=evQFzbml-YQA:10 a=_jlGtV7tAAAA:8 a=QyXUC8HyAAAA:8 a=8O7TagkZGoWJBKvMwI0A:9
 a=CjuIK1q_8ugA:10 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IR4JcWq63DCNflzWowdl0Zd/tlDrhvosOyaWwsfUres=; b=vtH+r1byaYva0J/Fa5lMZzoCWl
        gA2UeWX5L346jqiaOJXN5lcFNovosEQevGGAdIoEb24ay4Qfn0rNPgDwnBNwIHyQzVoLIbvZHCy+6
        oUD5wYAO+ngxalk8OlLGvMdA2DCbiYw06b5vn/jGyQILYEMURtwhs/iq6OQs3cFOwzqOlqlVCw0cL
        0CdEemRozAgh39G5kixg8UN2aHEavol06942OKjXu55TLsKWzbdt8K7gtAXDgnOFTKP4LBXX5TTnt
        fwRxk3NkPa4jfVedaq8Pb8+yA8MYFyMyBxbCzGzGpSybbfwVDHKit1ck2UgiF8wEHW9hFHI2eTmZr
        eVyKbKjA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38428 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kkV3W-00386r-OW; Wed, 02 Dec 2020 16:32:38 +0000
Date:   Wed, 2 Dec 2020 08:32:38 -0800
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
Subject: Re: [PATCH v3 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Message-ID: <20201202163238.GA215023@roeck-us.net>
References: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <e941999cb6ccd19d1830b3205ec3a66081ed29fd.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <20201201163044.GA89174@roeck-us.net>
 <DM6PR11MB425005AF05352338BE5403BEFBF30@DM6PR11MB4250.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB425005AF05352338BE5403BEFBF30@DM6PR11MB4250.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kkV3W-00386r-OW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:38428
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Dec 02, 2020 at 02:55:32PM +0000, Ayyathurai, Vijayakannan wrote:
> Hi Guenter,
> 
> > From: Guenter Roeck <linux@roeck-us.net>
> > Sent: Wednesday, 2 December, 2020 12:31 AM
> > 
> > On Tue, Dec 01, 2020 at 11:10:33PM +0800,
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
> > > +	if (!ping && wdog->pretimeout) {
> > > +		th_val = wdog->timeout - wdog->pretimeout;
> > > +		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val
> > * wdt->rate);
> > 
> > Sorry for annoying you now, but I may have found another potential problem.
> > 
> > What happens if the user sets a pretimeout, then removes it ?
> > What should TIM_WATCHDOG_INT_THRES be set to in that case ?
> > Right now TIM_WATCHDOG_INT_THRES won't be updated anymore
> 
> It is a good catch. Indeed, I don't have coverage like this.
> 
> > in that case, which seems wrong. This might get worse with
> > the following sequence.
> > 
> > - set pretimeout
> > - clear pretimeout
> > - set timeout to some other value
> > 
> 
> Can the below method resolve this issue?
> 
> 
> static int keembay_wdt_set_pretimeout(struct watchdog_device *wdog, u32 t)
> {
>         struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> 
>         if(!t)
>                 keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, 0);
> 

Partially, only it makes for awkward code. After all, it is never really
necessary to set the timeout register after updating the pretimeout.
The "ping" parameter makes less and less sense with this in mind.
It might be better to split the set_timeout_reg function into
set_timeout_reg and set_pretimeout_reg and call those functions as needed
(and handle the if() above in the set_pretimeout_reg function).

Thanks,
Guenter

>         wdog->pretimeout = t;
>         keembay_wdt_set_timeout_reg(wdog, false);
> 
>         return 0;
> }
> 
> > Thanks,
> > Guenter
> > 
> 
> Thanks,
> Vijay
