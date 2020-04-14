Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E381A77FD
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Apr 2020 12:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438074AbgDNKBC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Apr 2020 06:01:02 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:40514 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438072AbgDNKBA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Apr 2020 06:01:00 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C825780C5CEE;
        Tue, 14 Apr 2020 10:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 17n4qNXQNhvP; Tue, 14 Apr 2020 13:00:35 +0300 (MSK)
Date:   Tue, 14 Apr 2020 13:01:16 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] watchdog: dw_wdt: Support devices with asynch clocks
Message-ID: <20200414100116.lwgqayfhspvd4ozh@ubsrv2.baikal.int>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132831.89B658030706@mail.baikalelectronics.ru>
 <20200315142207.GA8424@roeck-us.net>
 <20200410185934.o4aucef2xhbradlp@ubsrv2.baikal.int>
 <158681117129.84447.14839907555361565766@swboyd.mtv.corp.google.com>
 <b7671f21-8f10-710b-88bc-bc7ead684c12@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b7671f21-8f10-710b-88bc-bc7ead684c12@roeck-us.net>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Apr 13, 2020 at 07:55:42PM -0700, Guenter Roeck wrote:
> On 4/13/20 1:52 PM, Stephen Boyd wrote:
> > Quoting Sergey Semin (2020-04-10 11:59:34)
> >> Michael, Stephen, could you take a look at the issue we've got here?
> >>
> >> Guenter, my comment is below.
> >>
> >> On Sun, Mar 15, 2020 at 07:22:07AM -0700, Guenter Roeck wrote:
> >>> On Fri, Mar 06, 2020 at 04:27:45PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> >>>> @@ -358,10 +375,27 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
> >>>>             goto out_disable_clk;
> >>>>     }
> >>>>  
> >>>> +   /*
> >>>> +    * Request APB clocks if device is configured with async clocks mode.
> >>>> +    * In this case both tclk and pclk clocks are supposed to be specified.
> >>>> +    * Alas we can't know for sure whether async mode was really activated,
> >>>> +    * so the pclk reference is left optional. If it it's failed to be
> >>>> +    * found we consider the device configured in synchronous clocks mode.
> >>>> +    */
> >>>> +   dw_wdt->pclk = devm_clk_get_optional(dev, "pclk");
> >>>> +   if (IS_ERR(dw_wdt->pclk)) {
> >>>> +           ret = PTR_ERR(dw_wdt->pclk);
> >>>> +           goto out_disable_clk;
> >>>> +   }
> >>>> +
> >>>> +   ret = clk_prepare_enable(dw_wdt->pclk);
> >>>
> >>> Not every implementation of clk_enable() checks for a NULL parameter.
> >>> Some return an error. This can not be trusted to work on all platforms /
> >>> architectures.
> >>
> >> Hm, this was unexpected twist. I've submitted not a single patch with optional
> >> clock API usage. It was first time I've got a comment like this, that the
> >> API isn't cross-platform. As I see it this isn't the patch problem, but the
> >> platforms/common clock bug. The platforms code must have been submitted before
> >> the optional clock API was introduced or the API hasn't been properly
> >> implemented or we don't understand something.
> >>
> >> Stephen, Michael could you clarify the situation with the
> >> cross-platformness of the optional clock API.
> >>
> > 
> > NULL is a valid clk to return from clk_get(). And the documentation of
> > clk_enable() says that "If the clock can not be enabled/disabled, this
> > should return success". Given that a NULL pointer can't do much of
> > anything I think any platform that returns an error in this situation is
> > deviating from the documentation of the clk API.
> > 

Stephen, thanks for clarification. AFAICS regarding ARM the next three
platforms don't follow that rule:
- arch/arm/mach-ep93xx: No CCF support. clk_enable() returns -EINVAL if NULL
  clk parameter specified.
- arch/arm/mach-mmp: If no CCF enabled, then clk_enable() doesn't check
  the parameter for NULLness.
- arch/arm/mach-omap1: No CCF support. clk_enable() returns -EINVAL if
  NULL clk parameter specified.

Though these platforms statically instantiate the platform devices
except mmp, which may use dtb on some systems. Who knows how the drivers
are using the clocks after the instantiation. Maybe they don't.

> 
> This is not about returning an error; some platforms don't check for NULL.

Please, see the comment above. For ARM it's just three platforms. Though
as Stephen said returning error is wrong in this case too.

> 
> > Does any platform that uses this driver use one of these non-common clk
> > framework implementations? All of this may not matter if they all use
> > the CCF.
> > 
> 
> Currently the driver is only used on arm and arm64. Maybe those are safe ?

AFAICS these are only platforms using snps,dw-wdt at the moment:
	ARM64: Synaptics Berkin 4CT
	ARM64: Intel/Altera SOCFPGAs 
	ARM64: Rockchip PX30/RK33xx
	ARM: Altera SOCFPGA Arria10
	ARM: Marvell Berlin SoCs
	ARM: Rockhip RK3xxx
	ARM: Realview RV1108

All of them rely on CCF. In addition to them there is going to be
Baikal-T1 SoC based on MIPS P5600 CPU core, which clocks also require
CCF. So yes, we are safe to use the optional clocks API at the moment.

> 
> Also, it looks like clk_enable() exists in the non-standard implementations,
> but clk_prepare (and thus clk_prepare_enable) only exist in the standard
> implementation. With that, maybe it is always safe to call
> clk_prepare_enable() with a NULL parameter ?

No. clk_prepare_enable() calls both clk_prepare() and clk_enable()
sequentially. So if some of them don't expect NULL pointer passed, then
the system will blow up. Though this isn't problem for snps,dw-wdt
driver, since all the platforms using it rely on CCF, which has optional
clocks support.

If in future we have a platform, which don't use CCF and don't support
NULL-value of the clk parameter, then this will be the platform problem,
since it doesn't implement the clock API correctly.

Regards,
-Sergey

> 
> Thanks,
> Guenter
