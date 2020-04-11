Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 182941A4F82
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Apr 2020 13:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgDKLJs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Apr 2020 07:09:48 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:42820 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgDKLJs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Apr 2020 07:09:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C95878030786;
        Sat, 11 Apr 2020 11:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iXlglvlbxhAe; Sat, 11 Apr 2020 14:09:45 +0300 (MSK)
Date:   Sat, 11 Apr 2020 14:10:17 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] watchdog: dw_wdt: Support devices with non-fixed TOP
 values
Message-ID: <20200411111016.kwqciyeha7dyhwdz@ubsrv2.baikal.int>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132829.E508B8030705@mail.baikalelectronics.ru>
 <20200315141238.GA7245@roeck-us.net>
 <20200410125904.bdrr3jpi47mwvfkf@ubsrv2.baikal.int>
 <9dd40847-a2c7-d30c-0af4-07ff606a61f8@roeck-us.net>
 <20200410194513.tdnhmrpo7sgupn35@ubsrv2.baikal.int>
 <1c403426-90c9-5478-4cba-852be5d5141b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1c403426-90c9-5478-4cba-852be5d5141b@roeck-us.net>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 10, 2020 at 06:15:30PM -0700, Guenter Roeck wrote:
> On 4/10/20 12:45 PM, Sergey Semin wrote:
> > On Fri, Apr 10, 2020 at 09:21:35AM -0700, Guenter Roeck wrote:
> >> On 4/10/20 5:59 AM, Sergey Semin wrote:
> >>> On Sun, Mar 15, 2020 at 07:12:38AM -0700, Guenter Roeck wrote:
> >>>> On Fri, Mar 06, 2020 at 04:27:44PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> >>>>> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >>>>>
> >>>>> In case if the DW Watchdog IP core is synthesised with
> >>>>> WDT_USE_FIX_TOP == false, the TOP interval indexes make the device
> >>>>> to load a custom periods to the counter. These periods are hardwired
> >>>>> at the synthesis stage and can be within [2^8, 2^(WDT_CNT_WIDTH - 1)].
> >>>>> Alas their values can't be detected at runtime and must be somehow
> >>>>> supplied to the driver so one could properly determine the watchdog
> >>>>> timeout intervals. For this purpose we suggest to have a vendor-
> >>>>> specific dts property "snps,watchdog-tops" utilized, which would
> >>>>> provide an array of sixteen counter values. At device probe stage they
> >>>>> will be used to initialize the watchdog device timeouts determined
> >>>>> from the array values and current clocks source rate.
> >>>>>
> >>>>> In order to have custom TOP values supported the driver must be
> >>>>> altered in the following way. First of all the fixed-top values
> >>>>> ready-to-use array must be determined for compatibility with currently
> >>>>> supported devices, which were synthesised with WDT_USE_FIX_TOP == true.
> >>>>> Secondly we must redefine the timer period search functions. For
> >>>>> generality they are redesigned in a way to support the TOP array with
> >>>>> no limitations on the items order or value. Finally an array with
> >>>>> pre-defined timeouts must be calculated at probe stage from either
> >>>>> the custom or fixed TOP values depending on the DW watchdog component
> >>>>> parameter WDT_USE_FIX_TOP value.
> >>>>>
> >>>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >>>>> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> >>>>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> >>>>> Cc: Paul Burton <paulburton@kernel.org>
> >>>>> Cc: Ralf Baechle <ralf@linux-mips.org>
> >>>>> ---
> >>>>>  drivers/watchdog/dw_wdt.c | 145 +++++++++++++++++++++++++++++++-------
> >>>>>  1 file changed, 119 insertions(+), 26 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> >>>>> index fba21de2bbad..4a57b7d777dc 100644
> >>>>> --- a/drivers/watchdog/dw_wdt.c
> >>>>> +++ b/drivers/watchdog/dw_wdt.c
> >>>>> @@ -13,6 +13,7 @@
> >>>>>   */
> >>>>>  
> >>>>>  #include <linux/bitops.h>
> >>>>> +#include <linux/limits.h>
> >>>>>  #include <linux/clk.h>
> >>>>>  #include <linux/delay.h>
> >>>>>  #include <linux/err.h>
> >>>>> @@ -34,12 +35,24 @@
> >>>>>  #define WDOG_CURRENT_COUNT_REG_OFFSET	    0x08
> >>>>>  #define WDOG_COUNTER_RESTART_REG_OFFSET     0x0c
> >>>>>  #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
> >>>>> +#define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
> >>>>> +#define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
> >>>>>  
> >>>>> -/* The maximum TOP (timeout period) value that can be set in the watchdog. */
> >>>>> -#define DW_WDT_MAX_TOP		15
> >>>>> +/* There are sixteen TOPs (timeout periods) that can be set in the watchdog. */
> >>>>> +#define DW_WDT_NUM_TOPS		16
> >>>>> +#define DW_WDT_FIX_TOP(_idx)	(1U << (16 + _idx))
> >>>>>  
> >>>>>  #define DW_WDT_DEFAULT_SECONDS	30
> >>>>>  
> >>>>> +static const u32 dw_wdt_fix_tops[DW_WDT_NUM_TOPS] = {
> >>>>> +	DW_WDT_FIX_TOP(0), DW_WDT_FIX_TOP(1), DW_WDT_FIX_TOP(2),
> >>>>> +	DW_WDT_FIX_TOP(3), DW_WDT_FIX_TOP(4), DW_WDT_FIX_TOP(5),
> >>>>> +	DW_WDT_FIX_TOP(6), DW_WDT_FIX_TOP(7), DW_WDT_FIX_TOP(8),
> >>>>> +	DW_WDT_FIX_TOP(9), DW_WDT_FIX_TOP(10), DW_WDT_FIX_TOP(11),
> >>>>> +	DW_WDT_FIX_TOP(12), DW_WDT_FIX_TOP(13), DW_WDT_FIX_TOP(14),
> >>>>> +	DW_WDT_FIX_TOP(15)
> >>>>> +};
> >>>>> +
> >>>>>  static bool nowayout = WATCHDOG_NOWAYOUT;
> >>>>>  module_param(nowayout, bool, 0);
> >>>>>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
> >>>>> @@ -49,6 +62,8 @@ struct dw_wdt {
> >>>>>  	void __iomem		*regs;
> >>>>>  	struct clk		*clk;
> >>>>>  	unsigned long		rate;
> >>>>> +	unsigned int		max_top;
> >>>>> +	unsigned int		timeouts[DW_WDT_NUM_TOPS];
> >>>>>  	struct watchdog_device	wdd;
> >>>>>  	struct reset_control	*rst;
> >>>>>  	/* Save/restore */
> >>>>> @@ -64,20 +79,68 @@ static inline int dw_wdt_is_enabled(struct dw_wdt *dw_wdt)
> >>>>>  		WDOG_CONTROL_REG_WDT_EN_MASK;
> >>>>>  }
> >>>>>  
> >>>>> -static inline int dw_wdt_top_in_seconds(struct dw_wdt *dw_wdt, unsigned top)
> >>>>> +static unsigned int dw_wdt_find_best_top(struct dw_wdt *dw_wdt,
> >>>>> +					 unsigned int timeout, u32 *top)
> >>>>>  {
> >>>>> +	u32 diff = UINT_MAX, tmp;
> >>>>> +	int idx;
> >>>>> +
> >>>>>  	/*
> >>>>> -	 * There are 16 possible timeout values in 0..15 where the number of
> >>>>> -	 * cycles is 2 ^ (16 + i) and the watchdog counts down.
> >>>>> +	 * In general case of non-fixed timeout values they can be arranged in
> >>>>> +	 * any order so we have to traverse all the array values. We also try
> >>>>> +	 * to find a closest timeout number and make sure its value is greater
> >>>>> +	 * than the requested timeout. Note we'll return a maximum timeout
> >>>>> +	 * if reachable value couldn't be found.
> >>>>>  	 */
> >>>>> -	return (1U << (16 + top)) / dw_wdt->rate;
> >>>>> +	for (*top = dw_wdt->max_top, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
> >>>>> +		if (dw_wdt->timeouts[idx] < timeout)
> >>>>> +			continue;
> >>>>> +
> >>>>> +		tmp = dw_wdt->timeouts[idx] - timeout;
> >>>>> +		if (tmp < diff) {
> >>>>> +			diff = tmp;
> >>>>> +			*top = idx;
> >>>>> +		}
> >>>>> +	}
> >>>>> +
> >>>>> +	return dw_wdt->timeouts[*top];
> >>>>> +}
> >>>>> +
> >>>>> +static unsigned int dw_wdt_find_min_timeout(struct dw_wdt *dw_wdt)
> >>>>
> >>>> I would appreciate if the names of functions returning ms end with _ms
> >>>> to avoid confusion.
> >>>
> >>> Ok. I'll also modify the functions a bit, so only the
> >>> dw_wdt_find_best_top_ms() and dw_wdt_find_max_top_ms() methods would
> >>> return timeouts in milliseconds. Though if you insist in keeping seconds
> >>> in the timeouts array (see the comment after the next one), it'll be
> >>> dw_wdt_find_max_top_ms() only.
> >>>
> >>>>
> >>>>> +{
> >>>>> +	u32 min_timeout = UINT_MAX, top;
> >>>>> +	int idx;
> >>>>> +
> >>>>> +	for (top = 0, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
> >>>>> +		if (dw_wdt->timeouts[idx] <= min_timeout) {
> >>>>> +			min_timeout = dw_wdt->timeouts[idx];
> >>>>> +			top = idx;
> >>>>> +		}
> >>>>> +	}
> >>>>> +
> >>>>> +	return dw_wdt->timeouts[top];
> >>>>> +}
> >>>>> +
> >>>>> +static unsigned int dw_wdt_find_max_top(struct dw_wdt *dw_wdt, u32 *top)
> >>>>> +{
> >>>>> +	u32 max_timeout = 0;
> >>>>> +	int idx;
> >>>>> +
> >>>>> +	for (*top = 0, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
> >>>>> +		if (dw_wdt->timeouts[idx] >= max_timeout) {
> >>>>> +			max_timeout = dw_wdt->timeouts[idx];
> >>>>> +			*top = idx;
> >>>>> +		}
> >>>>> +	}
> >>>>> +
> >>>>> +	return dw_wdt->timeouts[*top];
> >>>>>  }
> >>>>>  
> >>>>> -static int dw_wdt_get_top(struct dw_wdt *dw_wdt)
> >>>>> +static unsigned int dw_wdt_get_timeout(struct dw_wdt *dw_wdt)
> >>>>>  {
> >>>>>  	int top = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET) & 0xF;
> >>>>>  
> >>>>> -	return dw_wdt_top_in_seconds(dw_wdt, top);
> >>>>> +	return dw_wdt->timeouts[top];
> >>>>>  }
> >>>>>  
> >>>>>  static int dw_wdt_ping(struct watchdog_device *wdd)
> >>>>> @@ -90,20 +153,13 @@ static int dw_wdt_ping(struct watchdog_device *wdd)
> >>>>>  	return 0;
> >>>>>  }
> >>>>>  
> >>>>> -static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
> >>>>> +static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
> >>>>>  {
> >>>>>  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> >>>>> -	int i, top_val = DW_WDT_MAX_TOP;
> >>>>> +	unsigned int timeout;
> >>>>> +	u32 top;
> >>>>>  
> >>>>> -	/*
> >>>>> -	 * Iterate over the timeout values until we find the closest match. We
> >>>>> -	 * always look for >=.
> >>>>> -	 */
> >>>>> -	for (i = 0; i <= DW_WDT_MAX_TOP; ++i)
> >>>>> -		if (dw_wdt_top_in_seconds(dw_wdt, i) >= top_s) {
> >>>>> -			top_val = i;
> >>>>> -			break;
> >>>>> -		}
> >>>>> +	timeout = dw_wdt_find_best_top(dw_wdt, req * MSEC_PER_SEC, &top);
> >>>>>  
> >>>>>  	/*
> >>>>>  	 * Set the new value in the watchdog.  Some versions of dw_wdt
> >>>>> @@ -111,7 +167,7 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
> >>>>>  	 * CP_WDT_DUAL_TOP in WDT_COMP_PARAMS_1).  On those we
> >>>>>  	 * effectively get a pat of the watchdog right here.
> >>>>>  	 */
> >>>>> -	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
> >>>>> +	writel(top | top << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
> >>>>>  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> >>>>>  
> >>>>>  	/*
> >>>>> @@ -119,10 +175,10 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
> >>>>>  	 * kernel(watchdog_dev.c) helps to feed watchdog before
> >>>>>  	 * wdd->max_hw_heartbeat_ms
> >>>>>  	 */
> >>>>> -	if (top_s * 1000 <= wdd->max_hw_heartbeat_ms)
> >>>>> -		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> >>>>> +	if (req * MSEC_PER_SEC > wdd->max_hw_heartbeat_ms)
> >>>>> +		wdd->timeout = req;
> >>>>>  	else
> >>>>> -		wdd->timeout = top_s;
> >>>>> +		wdd->timeout = timeout / MSEC_PER_SEC;
> >>>>>  
> >>>>>  	return 0;
> >>>>>  }
> >>>>> @@ -238,6 +294,41 @@ static int dw_wdt_resume(struct device *dev)
> >>>>>  
> >>>>>  static SIMPLE_DEV_PM_OPS(dw_wdt_pm_ops, dw_wdt_suspend, dw_wdt_resume);
> >>>>>  
> >>>>> +static void dw_wdt_init_timeouts(struct dw_wdt *dw_wdt, struct device *dev)
> >>>>> +{
> >>>>> +	u32 data, of_tops[DW_WDT_NUM_TOPS];
> >>>>> +	const u32 *tops;
> >>>>> +	int ret, idx;
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * Retrieve custom or fixed counter values depending on the
> >>>>> +	 * WDT_USE_FIX_TOP flag found in the component specific parameters
> >>>>> +	 * #1 register.
> >>>>> +	 */
> >>>>> +	data = readl(dw_wdt->regs + WDOG_COMP_PARAMS_1_REG_OFFSET);
> >>>>> +	if (data & WDOG_COMP_PARAMS_1_USE_FIX_TOP) {
> >>>>> +		tops = dw_wdt_fix_tops;
> >>>>> +	} else {
> >>>>> +		ret = of_property_read_variable_u32_array(dev_of_node(dev),
> >>>>> +			"snps,watchdog-tops", of_tops, DW_WDT_NUM_TOPS,
> >>>>> +			DW_WDT_NUM_TOPS);
> >>>>> +		if (ret < 0) {
> >>>>> +			dev_warn(dev, "No valid TOPs array specified\n");
> >>>>> +			tops = dw_wdt_fix_tops;
> >>>>> +		} else {
> >>>>> +			tops = of_tops;
> >>>>> +		}
> >>>>> +	}
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * We'll keep the timeout values in ms to approximate requested
> >>>>> +	 * timeouts with better accuracy.
> >>>>> +	 */
> >>>>> +	for (idx = 0; idx < DW_WDT_NUM_TOPS; ++idx)
> >>>>> +		dw_wdt->timeouts[idx] =
> >>>>> +			mult_frac(tops[idx], MSEC_PER_SEC, dw_wdt->rate);
> >>>>
> >>>> tops[idx] type is u32. Its value can be up to 0xffffffff. That means
> >>>> dw_wdt->rate must be >= 1000 to avoid overflow, which you should check.
> >>>
> >>> Right. I don't think that TOPs with timeouts bigger than
> >>> 0xffffffff milliseconds have any valuable usecases, so I'll just round
> >>> the overflows down to FFs.
> >>>
> >>
> >> Neither do unsorted random timeouts milli-seconds apart. You see the need
> >> to address one, so addressing other weaknesses is appropriate.
> > 
> > Don't really understand what you mean. Do you intend to filter the
> > unreachable timeouts out from the timeouts array? If so this isn't
> > possible with current design. I would have to implement a more complex
> > data structure, like an array of pairs {TOP, timeout} and refactor the
> > timeout search algorithm. Don't really think this optimization is required
> > seeing watchdog timeout set operation is normally performed just a few times
> > per watchdog usage session.
> > 
> 
> You state that defining a tops[idx] value > 0xffffffff / 1000 would be
> unreasonable, while at the same time you argue that a sequence of tops[idx]
> values of, say, 45, 46, 47, 43, 42, 99, 98, 55 would be perfectly reasonable
> and needs to be handled. All I am saying is that you need to deal with all odd
> cases, and that you can not assume that there is no tops[idx] value that results
> in an overflow. If "45, 46, 47, 43, 42, 99, 98, 55" is reasonable, so is
> 0xffffffff.

I am not saying, that TOPs like "45, 46, 47, 43, 42, 99, 98, 55" are
reasonable. Depending on the reference clock rate, most likely they will
be unreachable by the watchdog core. The core requests timeout in
seconds with minimum of 1 second, while my timeout-search algorithm returns
the closest but bigger than the requested timeout, which effectively
filters those TOPs out of any permitted selection. BTW there is another problem.
What if due to the too high reference clock frequency non of the TOPs
are able to reach 0.5 second timeout?.. The same problem could have happened
even without an upgrade provided by my patches.

Getting back to the issue. Suppose we had TOPs that amongst others
corresponded to the next timeouts: 1.01 and 1.99 sec. So if watchdog
core requests to set 1 s timeout, my search loop will select TOP
with 1.01 s. Since watchdog core is working with timeouts of 1 s
granularity, then TOP with 1.99 s will never be selected. If I didn't
have the milliseconds values of the TOPs, but the seconds only, I
wouldn't be able to make a proper decision between those two timeouts
seeing the TOPs might be in any order.

Regarding all the weaknesses. In order to address all of them (please
also note, that the previous version of the code didn't lack of some of
them) I would have to come up with much cleverer algorithm than the one
currently implemented. It would have to filter out all the unreachable
timeouts out of the array.

Regarding 0xffffffff being unreasonable. You're right. I shouldn't have
assumed this. Depending on the reference clock rate, such TOP might be
not that big value in seconds.

To sum up our discussion AFAICS the best way would be to create an array
of structures:
	struct dw_wdt_timeout {
		u32 top;
		unsigned int timeout;
	} timeouts[16];
which would have only reachable timeouts in !seconds! If we had a set
of uniquely reachable TOPs we wouldn't need to keep values in
milliseconds. We'd also get rid of the redundant unreachable values and
would solve a problem if non of the specified TOPs is reachable with
current reference clock rate. What do you think?

-Sergey

> 
> Guenter
