Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D17F9300AFC
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 19:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbhAVSTX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 13:19:23 -0500
Received: from mga06.intel.com ([134.134.136.31]:63869 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729161AbhAVPqA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 10:46:00 -0500
IronPort-SDR: wnh0QIslsWRYXNAck9mXc9+AF+6FDA/QRozuE1qbnAg2finfL4Vjb3e6E+9u0xTfizMNdsVd4p
 43vBl9bOH01A==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="241001891"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="241001891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 07:44:07 -0800
IronPort-SDR: sQ/WUMYtHpTZMA2g1mb8CwJ8+xPVg2zNj3f6/R4/AdXHs2JfE7b+DsBMmZ3rAfD3POSEpzX9+0
 hf6ar18lckqg==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="351982060"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 07:44:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2ycU-0094v2-3W; Fri, 22 Jan 2021 17:45:06 +0200
Date:   Fri, 22 Jan 2021 17:45:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
Message-ID: <YArzAvcZXfv8DaI4@smile.fi.intel.com>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com>
 <YArtsQSQsGdfNlBI@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YArtsQSQsGdfNlBI@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

+Cc: Arnd, RTC maintainers, Lee

On Fri, Jan 22, 2021 at 05:22:25PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 22, 2021 at 03:59:34PM +0100, Hans de Goede wrote:
> > Hi,
> > 
> > What is the plan for merging this series ?
> > 
> > It touches files under:
> > arch/x86
> > drivers/watchdog
> > drivers/platform/x86
> > 
> > It is probably best if the entire series is merged through a single
> > tree. I don't expect this to cause any conflicts with current / upcoming
> > changes under drivers/platform/x86, so I'm fine with this being merged
> > through another tree.
> > 
> > Or if I can get an ack for that from the x86 and watchdog maintainers
> > I can merge the entire series through the pdx86 tree.
> 
> For time being I'm collecting tags and comments.
> As of today this series is independent per se, but other (later) clean up
> patches may rely on this.
> 
> One strategy can be providing an immutable branch for anybody who wants it and
> merge thru PDx86 or watchdog tree (I guess PDx86 is preferable because there
> are more patches touching other stuff, though independently, in this matters).

Yes, I think one more time and guess the best is:
 - get tags from x86 / watchdog
 - get tag from RTC
 - collect everything in PDx86 immutable branch
 - part 2 can be merged thru Lee's MFD tree with taking above mentioned branch
   as a base
 - part 3 (SFI removal) can be done based on Lee's branch and via tip tree

in this case we won't wait all maintainers to give a tag in a short period of
time (like couple of weeks from now on).

The full series (all three parts) are located in [1].

[1]: https://gitlab.com/andy-shev/next/-/tree/topic/mid-removal-next

-- 
With Best Regards,
Andy Shevchenko


