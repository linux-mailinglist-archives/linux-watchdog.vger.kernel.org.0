Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4572D6C71
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Dec 2020 01:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733073AbgLKASA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Dec 2020 19:18:00 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:53135 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393958AbgLKARm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Dec 2020 19:17:42 -0500
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id 5A0391404A1
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Dec 2020 17:17:01 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id nW7Ik0vjSdCH5nW7Jk3qt1; Thu, 10 Dec 2020 17:17:01 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=ZrDD1ezG c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=VwQbUJbxAAAA:8
 a=n2IuXNhsAAAA:20 a=P60nflJvJZ1DZXJ0TTYA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ekvtIws0SfA/x/tSI0N4ti3JHZLquQwZr2WPg4tHLII=; b=ZhbO5WDZSkgtDNNSaX3ypZU1iV
        Qallfy5FvErAiyIoTgqXGgL/YKb9tnR362Ya5x6lmnaKtHoov+wTMU0xozrgdnIUfwdEr12Qfg/cI
        moGmepGXnPveyoUIXr290qwrNs9cXLAMYxVAuC/0IHSn9yD/tYV3FYut/pR9Rn8fRzqcQXxu4c6Km
        G0KQPtFC6n5fDRYNCIWUI1NIsiRMXFKw/J7mRhxt6LiDS3ybw61gY9KHJlw7wjrGAnvviPMMCHmW9
        Zw6qujU+NRFIhaS4PZbRYffM4gdNQCoWT8w4HwcvFHuq+S+YlvfIZRX43wEZmr5yMNHHjmgdUnooI
        z0EwU3yA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34752 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1knW7I-0000Nu-Ex; Fri, 11 Dec 2020 00:17:00 +0000
Date:   Thu, 10 Dec 2020 16:16:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] watchdog: coh901327: add COMMON_CLK dependency
Message-ID: <20201211001659.GH259082@roeck-us.net>
References: <20201203223358.1269372-1-arnd@kernel.org>
 <CAKwvOd=i6DFLrPAe5KihT+ZK-nFZ+L7troC300q-9Jpa=i4Fqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=i6DFLrPAe5KihT+ZK-nFZ+L7troC300q-9Jpa=i4Fqg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1knW7I-0000Nu-Ex
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:34752
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 19
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Dec 10, 2020 at 03:00:30PM -0800, Nick Desaulniers wrote:
> On Thu, Dec 3, 2020 at 2:34 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > clang produces a build failure in configurations without COMMON_CLK
> > when a timeout calculation goes wrong:
> >
> > arm-linux-gnueabi-ld: drivers/watchdog/coh901327_wdt.o: in function `coh901327_enable':
> > coh901327_wdt.c:(.text+0x50): undefined reference to `__bad_udelay'
> 
> Isn't a linkage failure against __bad_udelay supposed to be
> interpreted as a value too large being passed to udelay()? IIRC, this
> was an issue for someone building an Apple touchpad driver with Clang
> at -O3...you sent a fix for that:
> https://github.com/ClangBuiltLinux/linux/issues/678,
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=fff2d0f701e6753591609739f8ab9be1c8e80ebb.

The problem is likely that clk_get_rate() returns a constant 0,
which in the real world would end up in a divide by 0 crash.
An alternative might be be to add

	freq = clk_get_rate(clk);
-->	if (freq == 0)
-->		return;

but I don't know if that would really be worth the effort.
I prefer the current fix.

Guenter

> 
> >
> > Add a Kconfig dependency to only do build testing when COMMON_CLK
> > is enabled.
> >
> > Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/watchdog/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 8bdbd125821b..32fa6de7b820 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -631,7 +631,7 @@ config SUNXI_WATCHDOG
> >
> >  config COH901327_WATCHDOG
> >         bool "ST-Ericsson COH 901 327 watchdog"
> > -       depends on ARCH_U300 || (ARM && COMPILE_TEST)
> > +       depends on ARCH_U300 || (ARM && COMMON_CLK && COMPILE_TEST)
> >         default y if MACH_U300
> >         select WATCHDOG_CORE
> >         help
> > --
> > 2.27.0
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
