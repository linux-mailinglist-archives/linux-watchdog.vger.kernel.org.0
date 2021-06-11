Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87BEE3A4048
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 12:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhFKKhm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 06:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbhFKKhl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 06:37:41 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A361C061574;
        Fri, 11 Jun 2021 03:35:44 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id c13so5332681oib.13;
        Fri, 11 Jun 2021 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CL8/Svq9gNJKgOiNLGqVNr492jbcHqwurkx/kYrwgrM=;
        b=m9WzSvoadQfxuR+6MG7OpdOT47ONxLqLMDrhBc4GsXRlAvZGabqxIsCNiWsYHVyM9f
         C9GdCnwLPV+BE7ojhXwJ1ZiuFzlucqEU9qSjNelxpyocYlt07vpgzO/Ruvjf/RkLYqra
         wsZaG3xWDQpNqDWxUgCbZ+ELw5p6AzA1XdcbDiSNc7BTGlyzFka6pONEomm+q+qX9oZI
         q7UUryAdsbRBUvQIiQIYHyxpN5sagAQ9nqGVrcfQtzTU9zD+4UQdPfS7T1bjeoHOSAQn
         XJ/gruVzlm7of0KVXM44d5uq36bhf9ySoMvL7nF2p0H1Sbr9/9VSpOoSnt3ka+1r/lUL
         WMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=CL8/Svq9gNJKgOiNLGqVNr492jbcHqwurkx/kYrwgrM=;
        b=Y9K3yUBzqoWQNXEyZRGdv6Nm/qgw9+Ip2lttzA0eR9053s/ksaOUAgdgnGpUVKHy3U
         lzx0qN1+gBsx4u7k8YAZ+hkn3gB7NVcDP+D6im+IuGFPnY2oqPGRZtrh8RbTAqhuEwOX
         VhGD/QrcYxVFyV1Ofhpv9g6biHYjQxRjEf8hCXGU1YZeqTQDMWq3DzVWCbjEnymDsUUx
         ptz4efZ+Eg6tzOaEngRSgAmQMHqXMhkQ5x5/lhOGVFABooJ++cuzFq1J+gEpffS7pHNz
         yRNdK6/yS6HYwLUWoWyzSCxYRxKxFvTKxsPyegb3B+faGOfpTd1hNU7tiP9DjrsE0S/R
         7qSA==
X-Gm-Message-State: AOAM532aW/DeUrCVvM4nPO9Qv7VsrKXI4qQFQQnK1omrGVIifYKEgnsR
        y5om+rw88LoecXXglDCB4n4=
X-Google-Smtp-Source: ABdhPJyKVcuwihx4x9Nz8kVrTc1ypAEJ5hMaAptcZN39FJBDRjJh+TvUq+4hvWaHegONL2luI+ENOg==
X-Received: by 2002:aca:f452:: with SMTP id s79mr2006735oih.84.1623407743779;
        Fri, 11 Jun 2021 03:35:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l18sm1150188otr.50.2021.06.11.03.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 03:35:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Jun 2021 03:35:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: sama5d4_wdt: add support for sama7g5-wdt
Message-ID: <20210611103541.GA3189041@roeck-us.net>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
 <20210527100120.266796-2-eugen.hristev@microchip.com>
 <20210527165506.GA1294623@roeck-us.net>
 <94d409ba-2073-a84e-5c8e-580f6e12191c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94d409ba-2073-a84e-5c8e-580f6e12191c@microchip.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 11, 2021 at 09:19:56AM +0200, Nicolas Ferre wrote:
> On 27/05/2021 at 18:55, Guenter Roeck wrote:
> > On Thu, May 27, 2021 at 01:01:19PM +0300, Eugen Hristev wrote:
> > > Add support for compatible sama7g5-wdt.
> > > The sama7g5 wdt is the same hardware block as on sam9x60.
> > > Adapt the driver to use the sam9x60/sama7g5 variant if either
> > > of the two compatibles are selected (sam9x60-wdt/sama7g5-wdt).
> > > 
> > > Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter, Wim,
> 
> How do we proceed? Do I take this "driver" patch through my tree which goes
> to arm-soc or do you take it with the watchdog tree?

I applied the series to my watchdog-next branch. That is all I can do
from my side.

Guenter

> 
> I'm planning to send my pull-requests before the end of this week.
> 
> Best regards,
>   Nicolas
> 
> > > ---
> > >   drivers/watchdog/sama5d4_wdt.c | 10 ++++++++--
> > >   1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> > > index e5d11d6a2600..ec20ad4e534f 100644
> > > --- a/drivers/watchdog/sama5d4_wdt.c
> > > +++ b/drivers/watchdog/sama5d4_wdt.c
> > > @@ -268,8 +268,10 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
> > >        wdd->min_timeout = MIN_WDT_TIMEOUT;
> > >        wdd->max_timeout = MAX_WDT_TIMEOUT;
> > >        wdt->last_ping = jiffies;
> > > -     wdt->sam9x60_support = of_device_is_compatible(dev->of_node,
> > > -                                                    "microchip,sam9x60-wdt");
> > > +
> > > +     if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
> > > +         of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
> > > +             wdt->sam9x60_support = true;
> > > 
> > >        watchdog_set_drvdata(wdd, wdt);
> > > 
> > > @@ -329,6 +331,10 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
> > >        {
> > >                .compatible = "microchip,sam9x60-wdt",
> > >        },
> > > +     {
> > > +             .compatible = "microchip,sama7g5-wdt",
> > > +     },
> > > +
> > >        { }
> > >   };
> > >   MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
> > > --
> > > 2.25.1
> > > 
> 
> 
> -- 
> Nicolas Ferre
