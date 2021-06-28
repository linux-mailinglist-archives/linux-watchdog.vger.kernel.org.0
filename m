Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8E43B66C9
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jun 2021 18:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbhF1Qde (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Jun 2021 12:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbhF1Qde (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Jun 2021 12:33:34 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742B7C061574;
        Mon, 28 Jun 2021 09:31:07 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 128-20020a4a11860000b029024b19a4d98eso4899993ooc.5;
        Mon, 28 Jun 2021 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ORsTqvtDccq70X0poDFX9rVL1vOBMr3BTqbaDtdmVOw=;
        b=UpMyg2XmV3vDgk1/2xl/Njoh5sd0HHrtg8nc5tD23UII3SHz53Y7HOHf+r2No6ZwUN
         UXobGMR0FMhAdCcs6sZCBvfdhsN71+tty4c0PGiBk11hNmXfhPyYpUGss5WjNAwW6hU0
         CXMzp3vt5rsB45GxLyjIlLYxBBe9Y45YLaKNzXydw4QEPN9pHWU7Q8Et8QJH9Uq80Nbz
         i050jtkDvyf/h9SYMEUFx6TsXbkBn9TFomnbvAVntynS7tR+tkcpzSf8SozokT6zokjJ
         AbNC+vCKn0n5NQfgTL35k4Z7DeVV/F1+myDmJ2axLVqGlQr7Fslg97WDdtay6duLNdjh
         peeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ORsTqvtDccq70X0poDFX9rVL1vOBMr3BTqbaDtdmVOw=;
        b=rDEGqDz+DUEjoBEBMJQlHrRzhraUG0yj7/xDBq0g0oeD6oTkH5FFiQjKQtH/ozRf6e
         rFy5sBkmYHw6xpAYpmIV17hqRA7t0TUZzaSiZhV7mYvj9ZdwC10Z1gqilgnYwxCemhqK
         ZM6bsTRq7GZBKpDl/potK9WMqW8pcIEaYV/L8h7k0r1jKUXTaNTKyVcQvTO5XAkf19qL
         uZy3esqf9K6cio5U0qvz/C8XPCkYSdIiK3wuym2mCKESupdgUFJ7g+n68vA8GVoj0+bE
         8KyJ1kbUGiZD/LzlTlki6/7Ei4bzvu1va1CxjU+5IetSoQYwUwLKrvyL/XK7Ufbl8Rzn
         NMLw==
X-Gm-Message-State: AOAM533jeiGxPu6J59Mh9s2/XeARJx/TSz0GhhUrwbWO83tgw1i/481q
        zjv0QyiVO6BQGXZf1RChOUU=
X-Google-Smtp-Source: ABdhPJwIVZAsPTtdY7s/33Y9IxLRciwKAyNzbotER8p7TZSkeErswPhOGUzXkatH9kbGdaYgY45QCg==
X-Received: by 2002:a4a:df18:: with SMTP id i24mr247039oou.68.1624897866822;
        Mon, 28 Jun 2021 09:31:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l2sm1624382otk.38.2021.06.28.09.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 09:31:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Jun 2021 09:31:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH V2 2/7] watchdog: bcm2835_wdt: consider
 system-power-controller property
Message-ID: <20210628163104.GA444942@roeck-us.net>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
 <1622981777-5023-3-git-send-email-stefan.wahren@i2se.com>
 <f4e62eec-a1c3-7759-3de3-dec98064dc4a@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e62eec-a1c3-7759-3de3-dec98064dc4a@i2se.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 22, 2021 at 09:12:30AM +0200, Stefan Wahren wrote:
> Hi Guenter,
> 
> Am 06.06.21 um 14:16 schrieb Stefan Wahren:
> > Until now all Raspberry Pi boards used the power off function of the SoC.
> > But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
> > possibly cannot register the poweroff handler because the it's
> > already registered by this watchdog driver. So consider the
> > system-power-controller property for registering, which is already
> > defined in soc/bcm/brcm,bcm2835-pm.txt .
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> > index dec6ca0..9490717 100644
> > --- a/drivers/watchdog/bcm2835_wdt.c
> > +++ b/drivers/watchdog/bcm2835_wdt.c
> > @@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
> >  	if (err)
> >  		return err;
> >  
> > -	if (pm_power_off == NULL) {
> > -		pm_power_off = bcm2835_power_off;
> > -		bcm2835_power_off_wdt = wdt;
> > +	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
> > +		if (!pm_power_off) {
> > +			pm_power_off = bcm2835_power_off;
> > +			bcm2835_power_off_wdt = wdt;
> > +		} else {
> > +			dev_info(dev, "Poweroff handler already present!\n");
> > +		}
> >  	}
> >  
> >  	dev_info(dev, "Broadcom BCM2835 watchdog timer");
> 
> this isn't not applied yet. Can this go via the watchdog-next tree into
> 5.14?
> 
I applied it to my watchdog-next branch; it will be up to Wim to send
it upstream. Note that the patch does not how up in linux-watchdog
patchwork (no idea why, though), which is why it got lost.

Guenter
