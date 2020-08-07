Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82B023F2D6
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Aug 2020 20:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgHGSiZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 14:38:25 -0400
Received: from forward500o.mail.yandex.net ([37.140.190.195]:39694 "EHLO
        forward500o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725893AbgHGSiZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 14:38:25 -0400
X-Greylist: delayed 437 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Aug 2020 14:38:22 EDT
Received: from mxback9g.mail.yandex.net (mxback9g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:170])
        by forward500o.mail.yandex.net (Yandex) with ESMTP id 71B4560083;
        Fri,  7 Aug 2020 21:30:59 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback9g.mail.yandex.net (mxback/Yandex) with ESMTP id Jr0i3gfLIB-Uwe4MD1j;
        Fri, 07 Aug 2020 21:30:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1596825058;
        bh=m/jDxnnqzj1sgkrZ03L56+2V0mkkC8zwbwVGLDh/z7o=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=L6J98Lga0onuM7EwUQje5yBnCw6f1Wi4gqdyGbZUYsQxzmYGEpqz5tnwydIbKkuye
         jGtPPZMVSJGaWH0Jq/HD1XqA7MLZrDhKanTuW6ZkcickFcS4Ixy2NtgIysNFWQx//Y
         85TApdPLO/HjKg86qkR9ZsImLa2KgSlv9JwYRNqQ=
Authentication-Results: mxback9g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas1-28d87b1eb748.qloud-c.yandex.net with HTTP;
        Fri, 07 Aug 2020 21:30:58 +0300
From:   Evgeny Novikov <novikov@ispras.ru>
Envelope-From: eugenenovikov@yandex.ru
To:     Guenter Roeck <linux@roeck-us.net>,
        "madhuparnabhowmik10@gmail.com" <madhuparnabhowmik10@gmail.com>
Cc:     "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
In-Reply-To: <20200807162141.GA41980@roeck-us.net>
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com> <20200807162141.GA41980@roeck-us.net>
Subject: Re: [ldv-project] [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Fri, 07 Aug 2020 21:30:58 +0300
Message-Id: <507311596824581@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

07.08.2020, 19:21, "Guenter Roeck" <linux@roeck-us.net>:
> On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
>>  From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>
>>  In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
>>  after misc_register(), hence if ioctl is called before its
>>  initialization which can call rdc321x_wdt_start() function,
>>  it will see an uninitialized value of rdc321x_wdt_device.queue,
>>  hence initialize it before misc_register().
>>  Also, rdc321x_wdt_device.default_ticks is accessed in reset()
>>  function called from write callback, thus initialize it before
>>  misc_register().
>>
>>  Found by Linux Driver Verification project (linuxtesting.org).
>>
>>  Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Having said that ... this is yet another potentially obsolete driver.
> You are really wasting your (and, fwiw, my) time.

Static analysis tools are not aware about obsolete drivers.
It would be great if there will be some formal way to filter them out.
Maybe some file will enumerate all obsolete drivers, or there will be
something within their source code, or something else.

-- 
Best regards,
Evgeny Novikov

>
> Florian, any thoughts if support for this chip can/should be deprecated
> or even removed ?
>
> Guenter
>
>>  ---
>>   drivers/watchdog/rdc321x_wdt.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>>  diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
>>  index 57187efeb86f..f0c94ea51c3e 100644
>>  --- a/drivers/watchdog/rdc321x_wdt.c
>>  +++ b/drivers/watchdog/rdc321x_wdt.c
>>  @@ -231,6 +231,8 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
>>
>>           rdc321x_wdt_device.sb_pdev = pdata->sb_pdev;
>>           rdc321x_wdt_device.base_reg = r->start;
>>  + rdc321x_wdt_device.queue = 0;
>>  + rdc321x_wdt_device.default_ticks = ticks;
>>
>>           err = misc_register(&rdc321x_wdt_misc);
>>           if (err < 0) {
>>  @@ -245,14 +247,11 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
>>                                   rdc321x_wdt_device.base_reg, RDC_WDT_RST);
>>
>>           init_completion(&rdc321x_wdt_device.stop);
>>  - rdc321x_wdt_device.queue = 0;
>>
>>           clear_bit(0, &rdc321x_wdt_device.inuse);
>>
>>           timer_setup(&rdc321x_wdt_device.timer, rdc321x_wdt_trigger, 0);
>>
>>  - rdc321x_wdt_device.default_ticks = ticks;
>>  -
>>           dev_info(&pdev->dev, "watchdog init success\n");
>>
>>           return 0;
>>  --
>>  2.17.1
>
> _______________________________________________
> ldv-project mailing list
> ldv-project@linuxtesting.org
> http://linuxtesting.org/cgi-bin/mailman/listinfo/ldv-project
