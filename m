Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651E43986B3
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jun 2021 12:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbhFBKmV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Jun 2021 06:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbhFBKmO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Jun 2021 06:42:14 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD13C061574;
        Wed,  2 Jun 2021 03:40:22 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id x15so2158457oic.13;
        Wed, 02 Jun 2021 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JlqO9gRfl1QVrQ5sFutQl1oSqzDRUSVAEh2YPKcjxjQ=;
        b=MPKW6bQjvYfIb/pY3AeWm3TH458u++5YGbJLZw47lYTzLQDuvCqDwttSuyFB3oq8Us
         G/6m6NK0VblXpHLdxpwzfUz4oPEbsrGpHogAcmYkgkv8gvzPopCsMND/5HTHJf56gO42
         9aZInFo7dT86LfEZ6H2yEXqkMBoKQE/MLQ87MNGNiwG1rWo9UXRqsniBRf5zc7RFysd1
         1YzEPd1ggvt480RhdnuTn07Kp6ruawfpq8nYwX4GLthExL2ON02vveXRDHFMhQhal06O
         gkoqBr7ZHuB+7m5K/ETPAz9ZxgU1mRawQbn1do9UytvCPtwmkojeVRLBWwirJvbe9Lk/
         Ri6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=JlqO9gRfl1QVrQ5sFutQl1oSqzDRUSVAEh2YPKcjxjQ=;
        b=P17dAEZ0Y2Z+eTSlzFZ+/DoAtR8BvVaaL6t6+jl4LMT9WHwrxQyGOiNgjaWC/UT5HQ
         2RxZCvxgI8nkIQWTIYbXC20hES431Cm/6GUgLKi29Eih/O8UOUIe9LAMBUDOPLwZcPuw
         30Z+nwzkrvAihdbv7ngKW19IplxJlK1zMPFikYB60RuYrW7VzyvrSplI+Xj1tk5MrzJn
         DDzg+/voB2BtEKZtSH4zTgwFeprAFGDpnUkfQKvWmyJU9DxVUTPKkifcNnV/7LVnkwVv
         uUzuazzfzr7cdXqt5Lpn0LU4P9a50HCE3Mc+CJWw6jnG/0/YOiMXkS21A7fnIUeWDxuR
         nDXw==
X-Gm-Message-State: AOAM531GvOuoyiiyFxs6CVSBjljGekj8I0wzEw2RbxotKXwRJDuWz5hN
        H3Lh8VLO63weskfQrLrF59w=
X-Google-Smtp-Source: ABdhPJwJhf7Q3rZlC39gDTHaWCNM9Xa+lpvV9Eaqi8tD1eHZ+IDnlHmCihZBblQOxw43dRjDKtd9iQ==
X-Received: by 2002:a54:4809:: with SMTP id j9mr3113440oij.14.1622630422059;
        Wed, 02 Jun 2021 03:40:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 12sm1904012ooy.0.2021.06.02.03.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:40:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 03:40:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     nicolas saenz julienne <nsaenz@kernel.org>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/6] watchdog: bcm2835_wdt: consider
 system-power-controller property
Message-ID: <20210602104019.GB1865238@roeck-us.net>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
 <e61ba6f5b906fd26a61e9c79ef4dcf4792a364d7.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e61ba6f5b906fd26a61e9c79ef4dcf4792a364d7.camel@kernel.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 01, 2021 at 11:43:27AM +0200, nicolas saenz julienne wrote:
> On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> > Until now all Raspberry Pi boards used the power off function of the SoC.
> > But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
> > possibly cannot register the poweroff handler because the it's
> > already registered by this watchdog driver. So consider the
> > system-power-controller property for registering, which is already
> > defined in soc/bcm/brcm,bcm2835-pm.txt .
> > 
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > ---
> >  drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> > index dec6ca0..9490717 100644
> > --- a/drivers/watchdog/bcm2835_wdt.c
> > +++ b/drivers/watchdog/bcm2835_wdt.c
> > @@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
> >  	if (err)
> >  		return err;
> >  
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
> 
> nit: shoudln't this be a warning?
> 
No. If anything, it should not be there in the first place, but I didn't want
to argue about it. It is perfectly valid for a system to have more than one
means to reset it, meaning this message is just noise. Making it a warning
would just make it worse.

Guenter

> Other than that,
> 
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> 
> Regards,
> Nicolas
> 
> 
