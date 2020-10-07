Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAFB285977
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Oct 2020 09:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbgJGHZf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Oct 2020 03:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgJGHZf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Oct 2020 03:25:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F35C061755
        for <linux-watchdog@vger.kernel.org>; Wed,  7 Oct 2020 00:25:35 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kQ3pM-0005sD-O6; Wed, 07 Oct 2020 09:25:32 +0200
Subject: Re: [RFC] Using a watchdog as system reset
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Frank Rowand <frowand.list@gmail.com>
References: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
 <460aa962-9da5-6e1e-b5db-3f9f1d78110a@roeck-us.net>
 <41b0dfcd-adf1-296f-e5be-4db3eac9f097@roeck-us.net>
 <20201006184130.r2lajves5l7lm2qk@pengutronix.de>
 <c989af68-fa7b-e6cb-9306-a5f2e196fb20@roeck-us.net>
 <20201007071222.pnftcuezlricotq3@pengutronix.de>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <04e33d49-4210-9dcd-040c-35059e0619ba@pengutronix.de>
Date:   Wed, 7 Oct 2020 09:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007071222.pnftcuezlricotq3@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello Uwe,

On 10/7/20 9:12 AM, Uwe Kleine-König wrote:
> Hello Guenter,
> 
> On Tue, Oct 06, 2020 at 02:04:10PM -0700, Guenter Roeck wrote:
>> On 10/6/20 11:41 AM, Uwe Kleine-König wrote:
>>> Hello Guenter,
>>>
>>> On Tue, Oct 06, 2020 at 07:29:11AM -0700, Guenter Roeck wrote:
>>>> On 10/6/20 4:56 AM, Guenter Roeck wrote:
>>>>> On 10/6/20 3:29 AM, Uwe Kleine-König wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I have an i.MX25 system here with an external watchdog (using the
>>>>>> gpio_wdt driver). So the internal watchdog (imx2_wdt) is unused.
>>>>>>
>>>>>> The problem with the unused imx2_wdt is that this usually provides the
>>>>>> restart handler and now a reboot ends with
>>>>>>
>>>>>> 	reboot: Restarting system
>>>>>> 	Reboot failed -- System halted
>>>>>>
>>>>>> until eventually the watchdog bites and resets the machine.
>>>>>>
>>>>>> I imagine that this is a common enough issue to warrant a generic
>>>>>> solution. My suggestion is to formalize and implement something like:
>>>>>>
>>>>>> 	watchdog {
>>>>>> 		compatible = "linux,wdt-gpio";
>>>>>> 		...
>>>>>> 		provide-system-reset;
>>>>>> 	}
>>>>>>
>>>>>> with the sematic of: "This is the dedicated mechanism to reset this
>>>>>> machine."
>>>>>>
>>>>>
>>>>> Some systems have more than one means to reset it, which is why
>>>>> restart handlers have a priority. This in turn suggests that we should
>>>>> maybe have a means to set that priority dynamically for the imx2_wdt driver
>>>>> (or for watchdog drivers in general) instead of having it fixed at 128.
>>>>> That would also solve your problem, assuming there is a different
>>>>> (currently lower priority) means to reset the hardware in your system.
>>>>>
>>>>> Alternatively, can't you just blacklist the imx2-wdt driver ?
>>>>
>>>> After having another couple hours of sleep and a coffee, I wonder if
>>>> this is already done, and the reboot just fails _because_ the imx2_wdt
>>>> is _not_ loaded. Is that the case ?
>>>
>>> Right, I disabled the imx2_wdt driver.
>>>  
>>>> If so, it looks like you want the reset functionality of the imx_wdt driver
>>>> but not its watchdog functionality.
>>>
>>> My thought was to use the gpio-watchdog as reset source, but using the
>>> imx-watchdog only for reset but not watchdog is an obvious alternative I
>>> didn't think about.
>>
>> It isn't really something I would have thought to ever be relevant: If
>> a watchdog can be used to reset the system, and that method to reset
>> the system is known to work and supposed to be used, why not use it as
>> system watchdog ? So that use case is quite odd, especially since the
>> watchdog on that system can apparently be used to trigger an external
>> pin.
> 
> The motivation to use the external watchdog is that access to the MRAM
> only works if the external watchdog is active. And (if I'm well
> informed) this external watchdog was introduced because of some
> regulation stuff where it must be guaranteed that there is a watchdog.
> With an external watchdog this is much easier to do than with an SoC
> internal one.
> 
> And then because using two watchdogs is ugly disabling the internal one
> was straight forward even though it works just fine (apart from enabling
> access to the MRAM).
> 
>> If we assume that there was a reason for not using the SoC watchdog,
>> we must also assume that using it to reset the system does not really
>> work (otherwise, what would be the point of having a separate gpio
>> based watchdog in that system ?).
>>
>> With that in mind, your other option kind of makes sense. The only
>> question would be how to express this in devicetree. I am certainly
>> open to accepting a patch introducing such a property/functionality
>> into the watchdog core.
> 
> OK, will try to come up with a patch.

Instead of having a `provide-system-reset' property, how about providing
it unconditionally, but with a very low priority?

This can be coupled with Guenther's suggestion of having a dynamic
way to set the priority, e.g. a `watchdog-priority' property in the device
tree that's common to all watchdogs? That's the way barebox is handling
multiple watchdogs (default value in driver overridable in DT and at runtime).

What's the DT folks opinion on that?

Cheers,
Ahmad

> 
> Best regards
> Uwe
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
