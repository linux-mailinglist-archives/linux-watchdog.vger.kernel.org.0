Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E63C285996
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Oct 2020 09:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbgJGHcQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Oct 2020 03:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727624AbgJGHcQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Oct 2020 03:32:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A6EC061755
        for <linux-watchdog@vger.kernel.org>; Wed,  7 Oct 2020 00:32:15 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kQ3vp-0006mp-Lw; Wed, 07 Oct 2020 09:32:13 +0200
Subject: Re: [RFC] Using a watchdog as system reset
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
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
 <04e33d49-4210-9dcd-040c-35059e0619ba@pengutronix.de>
Message-ID: <bf467000-2c5c-6fa5-ff31-f27179dc6763@pengutronix.de>
Date:   Wed, 7 Oct 2020 09:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <04e33d49-4210-9dcd-040c-35059e0619ba@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

On 10/7/20 9:25 AM, Ahmad Fatoum wrote:
>>> into the watchdog core.
>>
>> OK, will try to come up with a patch.
> 
> Instead of having a `provide-system-reset' property, how about providing
> it unconditionally, but with a very low priority?
> 
> This can be coupled with Guenther's suggestion of having a dynamic
> way to set the priority, e.g. a `watchdog-priority' property in the device
> tree that's common to all watchdogs? That's the way barebox is handling
> multiple watchdogs (default value in driver overridable in DT and at runtime).
> 
> What's the DT folks opinion on that?

Correction: s/watchdog-priority/reset-priority/

> 
> Cheers,
> Ahmad
> 
>>
>> Best regards
>> Uwe
>>
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
