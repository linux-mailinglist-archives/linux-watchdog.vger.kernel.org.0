Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127D233DB5B
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Mar 2021 18:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239243AbhCPRrX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Mar 2021 13:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239239AbhCPRrU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Mar 2021 13:47:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD86EC06174A
        for <linux-watchdog@vger.kernel.org>; Tue, 16 Mar 2021 10:47:19 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1lMDmo-0006fa-Dw; Tue, 16 Mar 2021 18:47:18 +0100
Subject: Re: [PATCH v3 0/3] watchdog: f71808e_wdt: migrate to new kernel API
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
References: <cover.dedd9f1159389b0a438076ef5e5a46aded186463.1612457906.git-series.a.fatoum@pengutronix.de>
Message-ID: <d25d96fa-0b88-930b-3160-fda3e69d3cba@pengutronix.de>
Date:   Tue, 16 Mar 2021 18:47:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cover.dedd9f1159389b0a438076ef5e5a46aded186463.1612457906.git-series.a.fatoum@pengutronix.de>
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

On 04.02.21 18:00, Ahmad Fatoum wrote:
> This series migrates the driver to the new kernel watchdog API and
> then to the driver model.
> 
> Main feedback from Guenther on v2 was that I need to split it up to
> enable review. I have done so by removing the extra refactoring for
> now and focused on the functional changes described above. The diff
> is now much better readable.
> 
> I tested it on a f81866.

Gentle ping.

> 
> v2 -> v3:
>   https://lore.kernel.org/linux-watchdog/20201020062112.6762-1-a.fatoum@pengutronix.de/
>   - factored out identifier renaming again for easier review
>   - reordered commits
>   - removed refactoring that can go in later. Focusing now on kernel watchdog
>     API and platform device/driver migration
>   - removed platform_device_id and changed code to match by name
> 
> v1 -> v2:
>   https://lore.kernel.org/linux-watchdog/20200611191750.28096-1-a.fatoum@pengutronix.de/
>   - reworked to platform device/driver pair (Guenther)
>   - squashed identifier renaming into the patches that touch
>     the respective lines anyway
>   - fixed checkpatch.pl nitpicks (Guenther)
>   - fixed locally used variable declared without static (0-day)
>   - fixed unneded line break due to old line limit (Guenther)
>   - renamed struct fintek_wdog_data to struct fintek_wdt
> 
> Ahmad Fatoum (3):
>   watchdog: f71808e_wdt: rename variant-independent identifiers appropriately
>   watchdog: f71808e_wdt: migrate to new kernel watchdog API
>   watchdog: f71808e_wdt: refactor to platform device/driver pair
> 
>  drivers/watchdog/Kconfig       |   1 +-
>  drivers/watchdog/f71808e_wdt.c | 450 +++++++---------------------------
>  2 files changed, 100 insertions(+), 351 deletions(-)
> 
> base-commit: 1048ba83fb1c00cd24172e23e8263972f6b5d9ac
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
