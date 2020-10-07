Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91295285E42
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Oct 2020 13:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgJGLfp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Oct 2020 07:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgJGLfo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Oct 2020 07:35:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FCCC061755
        for <linux-watchdog@vger.kernel.org>; Wed,  7 Oct 2020 04:35:43 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kQ7jR-0006iJ-Ny; Wed, 07 Oct 2020 13:35:41 +0200
Subject: Re: dt-binding to define default watchdog and machine reset (Was: Re:
 [RFC] Using a watchdog as system reset)
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Frank Rowand <frowand.list@gmail.com>
References: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
 <460aa962-9da5-6e1e-b5db-3f9f1d78110a@roeck-us.net>
 <41b0dfcd-adf1-296f-e5be-4db3eac9f097@roeck-us.net>
 <20201006184130.r2lajves5l7lm2qk@pengutronix.de>
 <c989af68-fa7b-e6cb-9306-a5f2e196fb20@roeck-us.net>
 <20201007071222.pnftcuezlricotq3@pengutronix.de>
 <04e33d49-4210-9dcd-040c-35059e0619ba@pengutronix.de>
 <20201007101835.yhlbjfpklepfodgw@pengutronix.de>
 <7e6dd4f6-cc1d-c7c8-4e56-5239995c4e87@roeck-us.net>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <72bdf57c-3544-5d4e-9086-2855d6c08e08@pengutronix.de>
Date:   Wed, 7 Oct 2020 13:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7e6dd4f6-cc1d-c7c8-4e56-5239995c4e87@roeck-us.net>
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

Hello,

On 10/7/20 1:04 PM, Guenter Roeck wrote:
> On 10/7/20 3:18 AM, Uwe Kleine-König wrote:
>> Let's introduce a generic watchdog property `watchdog-priority' that
>> provides a u32 to order the watchdogs for systems having two or more.
>> The value 0 means the watchdog is unusable/broken/disabled and the
>> watchdog with the biggest value is the one supposed to be used by
>> default.
>>
> 
> How do you suggest to implement that ? Device naming is determined
> by registration order. The watchdog subsystem doesn't decide which of
> the watchdogs is being used; userspace does that by opening the
> watchdog device. Userspace can already decide which watchdog to use
> by checking its sysfs attributes. If we were to create a sysfs attribute
> for userspace to read and compare, userspace could as well use the existing
> 'identity' attribute to make that decision.

Might be relevant for users of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED, so
the kernel only starts that one watchdog? This seems out-of-scope for
Uwe's Problem though.

>> Analogous a property `watchdog-restart-priority` is used to define if a
>> watchdog is supposed to be used to restart the machine. Again a value of
>> 0 means "Don't use" and otherwise the highest-value watchdog is used to
>> reset the machine.
>>
> 
> That makes more sense to me.

Yes, such a `restart-priority' is what I had in mind. Preferably covering
PMICs as well.

Cheers,
Ahmad

> 
> Guenter
> 
>> Maybe `restart-priority` is a better name that can also be used by
>> PMICs?!
>>
>>> What's the DT folks opinion on that?
>>
>> Best regards
>> Uwe
>>
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
