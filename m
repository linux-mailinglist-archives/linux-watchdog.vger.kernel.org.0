Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89CB371FBE
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 May 2021 20:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhECSe2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 May 2021 14:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhECSe1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 May 2021 14:34:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92601C061761
        for <linux-watchdog@vger.kernel.org>; Mon,  3 May 2021 11:33:33 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1lddNr-0007v1-Fn; Mon, 03 May 2021 20:33:31 +0200
Subject: Re: [RESEND PATCH v3 2/3] watchdog: f71808e_wdt: migrate to new
 kernel watchdog API
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
References: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
 <35b474fa750fa11781509e94675fc90e28b2d514.1618310618.git-series.a.fatoum@pengutronix.de>
 <92b48338-4d9a-dc02-d8b5-198bd34c9f21@roeck-us.net>
 <9f326f40-08dd-ab2b-0a80-970d20c57d6a@pengutronix.de>
 <20210503152854.GA624769@roeck-us.net>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <b904a91f-57f6-1cff-50a0-dc64db26cd41@pengutronix.de>
Date:   Mon, 3 May 2021 20:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210503152854.GA624769@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello Guenter,

On 03.05.21 17:28, Guenter Roeck wrote:
> On Mon, May 03, 2021 at 04:39:25PM +0200, Ahmad Fatoum wrote:
>> Hello Guenter,
>>
>> On 03.05.21 16:31, Guenter Roeck wrote:
>>>> -static struct fintek_wdt watchdog = {
>>>> -	.lock = __MUTEX_INITIALIZER(watchdog.lock),
>>>> -};
>>>> +static struct fintek_wdt watchdog;
>>>
>>> This should really be allocated, and "watchdog" is a terrible variable name
>>> even if static, especially given the previous patch.
>>
>> I can add a follow up patch to change this. I maintained the old
>> state of things here to make review easier.
>>
> Odd argument. You changed all the function names (unnecessarily,
> if you ask me) in the first patch of the series because they were
> too generic in your opinion.

I find it surprising to have a function called watchdog_set_timeout
defined locally in a driver.

But yes, the first patch was more useful in v2, where new functions
were added for pinmuxing each variant. Having f71808e_ for generic
code and f8186fg_ for a variant would not help code comprehension.

> That by itself added a lot of unnecessary complexity to the review.

This was not my intention. I figured having a separate patch that just
does the rename should make review of follow-up commits easier, not harder...

> And pretty much everything else changed
> in this patch anyway.

Feedback on v2 was that I change too much and that this made review harder.
I thus left name changes in a separate patch and limited changes in follow-up
commit to signatures where appropriate.

Thanks,
Ahmad

> 
> Guenter
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
