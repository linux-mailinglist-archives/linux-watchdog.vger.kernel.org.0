Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9641F5FCA00
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Oct 2022 19:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiJLRnI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Oct 2022 13:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiJLRnH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Oct 2022 13:43:07 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BC8FBCE5
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Oct 2022 10:43:06 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso3890510pjq.1
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Oct 2022 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBnn0RhlQ+6DdSOoKO+sgebAz602h0F98qYUGINQ2QY=;
        b=oL9oA17Rv3sYBNRUVzz9OWknoQeoLlIRgwcpj9nL+V7t5136uPmkEIIYJVy8nngPqi
         XPQMWNxcW6HWKar7vvZtN+bkPhmRBGy9cQqhTqg1Er5nVV55oM3GOi1pa8HYjRmMqJCl
         sSgEXUXMH+IlrQkxbzY0ufmp84KC0uww3qZVDQKUINMJADZ/FT+nZOJjRPPVlRryF7my
         aCeXaYBEIsuFNAVW0YAr6HlJMD4hweGncj4xID95viT6YZpbaTh7J+o6lUcNZdgKZqYZ
         yrmKCaiUNUBQrd3JJXAZZMQ+HTSC+sc0sBdMZ6bW+lI65N9O25hdUgOwHE6rIQlk//F1
         5KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBnn0RhlQ+6DdSOoKO+sgebAz602h0F98qYUGINQ2QY=;
        b=QRZIVQd72jgmLaJvWUhE4coubMBGMZbYWo4PU1QT9CX5SFUpyDDTOFvdDP5wPQtx6X
         bJmIqPYO2rOjsw/1YnpoJom4hlsQ7ZjIaynoo+RnPBddycl6WjreELcwO0H6/dGGCT+s
         hlAMIumV4RvK+y/9Bn6jyVKWaXM2541GjOTNmBYUqJZjNZihS/6ko3m5G+3I/bkcNVuU
         LkjltjF6WmhtheecsEqCzrrJ/3zobh8vXmdyrNR/yKpHCUl103iM/FaNTKowLNAuSzC1
         82DiWMcBgREn5xnb8vdti4XABSGoSR15BIdJ4zV7d5n83B8dOkEFOFxgKcO8vZ1VEzRw
         hPkg==
X-Gm-Message-State: ACrzQf0dUS1xJXeuGmyTWT9K3JjqjGXmeS/W3gC4VZ7lLdKE8teV1qjm
        STWV4anLSc6QcoTiKQ8Kv5LPTG3WKTTwTQ==
X-Google-Smtp-Source: AMsMyM5t3l42P7kK41J8k8EXjAaZ4SyBVdaqQ1JW1baQGK0CvcBdSGZguLNZLgrLBx8s/5wwb351JQ==
X-Received: by 2002:a17:903:22c1:b0:184:983f:11b2 with SMTP id y1-20020a17090322c100b00184983f11b2mr3725138plg.40.1665596585648;
        Wed, 12 Oct 2022 10:43:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id je17-20020a170903265100b00174abcb02d6sm10812982plb.235.2022.10.12.10.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 10:43:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 Oct 2022 10:43:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Thomas.Kastner" <Thomas.Kastner@advantech.eu>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH] Added 'advantech_ec_wdt' watchdog driver
Message-ID: <20221012174303.GA2995920@roeck-us.net>
References: <Y0aQbw8TPpdp569v@EIS-S230>
 <20221012160939.GA2875718@roeck-us.net>
 <PSAPR02MB45334EDCB45CE1F40056A410F4229@PSAPR02MB4533.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PSAPR02MB45334EDCB45CE1F40056A410F4229@PSAPR02MB4533.apcprd02.prod.outlook.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 12, 2022 at 04:52:36PM +0000, Thomas.Kastner wrote:
> Guenter, thank you for your detailed review. I will address the issues and resubmit. Comments below.
> 
> ...
> > > +#include <linux/uaccess.h>
> > > +#include <linux/spinlock.h>
> > 
> > Alphabetic include file order, please.
> 
> Copied from existing driver, will fix regardless.
> 

That is never an good or even acceptable argument. Old drivers will always
have lots of oddities and don't typically use more recently introduced
helper functions. Case in point: both watchdog_init_timeout() and
watchdog_stop_on_unregister() were introduced after your example driver
was added to the kernel.

Also, please check if all the include files are really needed. For example,
I don't think <linux/uaccess.h> is needed.

> > > +#define DEFAULT_TIME         60
> > > +
> > > +static unsigned int timeout = DEFAULT_TIME;
> > 
> > This should be set to 0. The default timeout should be set
> > in struct watchdog_device.
>  
> Copied from existing driver, will fix regardless.
> 
> > > +     /* reset watchdog */
> > > +     outb(EC_CMD_WDT_RESET, EC_ADDR_CMD);
> > > +     usleep_range(10000, 11000);
> > 
> > Is this really needed ? If so, write an accessor function.
> > It would be preferred to have that accessor function wait
> > before accesses (cache the time of the last access and wait
> > if not enough time has expired). This would prevent unnecessary
> > wait operations in places like this one, where only a single
> > access happens.
> 
> Good point. Unfortunately the delay between individual accesses is required. 
> My reasoning here was that the watchdog reset function typically is called in many-second intervals only, so the potentially unnecessary wait therefore would be negligible and not justify the overhead of an accessor function.
> 

The problem is not the overhead in the code, but code pollution.
The argument should be that the code is not called often, thus
using an accessor function is cleaner and its runtime overhead
is negligible. Also, if that _was_ a concern, one could always
declare the accessor function as "static inline".

The the same time, forcing userspace to wait for 10ms for no good
reason is never a good idea, and "it is not called that often" is
not a valid argument. Add a thousand "not called that often" pieces
of code to the kernel, and userspace won't do anything but wait
for nothing.

Thanks,
Guenter

> > > +     val = t*10;
> > 
> > Space before and after '*'. Please run checkpatch; that should tell you.
> 
> I did, but either the script missed this or I did. Will fix.
> 
> > > +static struct watchdog_device adv_ec_wdt_dev = {
> > > +     .info =         &adv_ec_wdt_info,
> > > +     .ops =          &adv_ec_wdt_ops,
> > > +     .min_timeout =  MIN_TIME,
> > > +     .max_timeout =  MAX_TIME,
> > 
> > .timeout should be set to the default timeout.
>  
> Copied from existing driver, will fix regardless.
>  
> > > +static void adv_ec_wdt_remove(struct device *dev, unsigned int id)
> > > +{
> > > +     /* stop the watchdog */
> > > +     adv_ec_wdt_stop(NULL);
> > 
> > Call watchdog_stop_on_unregister() before registering the watchdog
> > instead. Also, again, the comment doesn't add value.
> > 
> > > +
> > > +     /* watchdog_unregister() and release_region() are called automatically
> > */
> > 
> > Also unnecessary (implied with devm_). And you don't actually
> > need a remove function when using watchdog_stop_on_unregister().
> 
> Thanks for pointing this out, I had missed that this function & feature exist. 
> 
> > > +             pr_err("Watchdog timer: value of timeout %d (dec) "
> > > +               "is out of range from %d to %d (dec)\n",
> > > +               timeout, MIN_TIME, MAX_TIME);
> > > +             return -EINVAL;
> > 
> > This does not belong here. The probe function should call
> > watchdog_init_timeout() to set and validate the timeout module
> > parameter, and keep the default (instead of failing) if it is
> > out of range.
> 
> Copied from existing driver, will fix regardless.
