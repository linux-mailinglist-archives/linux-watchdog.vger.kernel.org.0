Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D30A353C64
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Apr 2021 10:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhDEI2w (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Apr 2021 04:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbhDEI2w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Apr 2021 04:28:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2307C061756
        for <linux-watchdog@vger.kernel.org>; Mon,  5 Apr 2021 01:28:46 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1lTKbF-00076r-6D; Mon, 05 Apr 2021 10:28:45 +0200
Subject: Re: [PATCH v3 0/3] watchdog: f71808e_wdt: migrate to new kernel API
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
References: <cover.dedd9f1159389b0a438076ef5e5a46aded186463.1612457906.git-series.a.fatoum@pengutronix.de>
 <d25d96fa-0b88-930b-3160-fda3e69d3cba@pengutronix.de>
Message-ID: <3b6a33c1-f560-f833-4f8f-21636ae3b76e@pengutronix.de>
Date:   Mon, 5 Apr 2021 10:28:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d25d96fa-0b88-930b-3160-fda3e69d3cba@pengutronix.de>
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

Hello,

On 16.03.21 18:47, Ahmad Fatoum wrote:
> On 04.02.21 18:00, Ahmad Fatoum wrote:
>> This series migrates the driver to the new kernel watchdog API and
>> then to the driver model.
>>
>> Main feedback from Guenther on v2 was that I need to split it up to
>> enable review. I have done so by removing the extra refactoring for
>> now and focused on the functional changes described above. The diff
>> is now much better readable.
>>
>> I tested it on a f81866.
> 
> Gentle ping.

Any news?

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
