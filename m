Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E4E35467D
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Apr 2021 20:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhDESCU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Apr 2021 14:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbhDESCS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Apr 2021 14:02:18 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60971C061756
        for <linux-watchdog@vger.kernel.org>; Mon,  5 Apr 2021 11:02:12 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so12111508oty.12
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Apr 2021 11:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=K4zdxlCfF+9wdrPikfFUgqQ8pA/Nz56HxINd7wlpdQQ=;
        b=CWUc2wzLuar+BKfpMhHs/5++SytiM7suYsGIZa9zmJ53sA3dw+2QbEmuep0pDOrqo8
         c6aD76ReKvqedCvvyc/T9dbeMXEFIHT7q2jxW5rZoxB96i8EPZ298k/xV1Pwhn+wyIds
         sccHhXXelKgquTd2fPnE9a/1aE0Kwz5A5ZhqAaRzkxly19wKCSyyuj4kGF7xnM0SP1lu
         yw8svUCzZz8b8tGcNrVnOpDrtyBM9K/IBKdTjUTUxzbNiG9bmoj76KFtJzptepQinSoK
         MUjhqokO+pvZ16HdUznbnx/i4YkrrSK5dcX1ZJzu3RoajfwDnS7Ayf5PEHdzZqxB5UFR
         ZWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=K4zdxlCfF+9wdrPikfFUgqQ8pA/Nz56HxINd7wlpdQQ=;
        b=bsJqPcx/XHps7/kM4PZANDzIAyXC3aOorscA3LzOquFrDuO6VE9lKyd7R2OEQW6nfl
         M0B3vdlXu35fOV6x394YXSptIqdoKQGpoIInN5v58bBRVxbeHI3DdJzz6b7oSkx7iV/i
         qa8GT6YLfD3WMrxMAOW4iXvCRR5Cl4YXsUG9A9QHB6WJe7x9wttLIsqytTwJpBLquf9+
         x0/QS+KSZueZqLNkFi8oNBxhsg5NUsAgaHhmXGWh+ToJIc6jJKDf0K8n1wtpTNtfHPbR
         32hYypaQdW3A6pCPVd/xZiDQ6Oy0oUdbO6wM/spzDJwEhoIYsS7kWjMLSj0KWBCD55AE
         5qkQ==
X-Gm-Message-State: AOAM530aZeDKnYMX4+yRQxBGdRmMdXCfHU4M4XVrZ1gBrgAphAp8ODPH
        KwRcJGY9DygS0trE+LhbPpc=
X-Google-Smtp-Source: ABdhPJyPjxwFNFqkpRmXWI9QsVA/DkrPpl3ZhUatuJTkHXkcoKrMAvcim8Phipqpc1c+MDpIsrjS2w==
X-Received: by 2002:a05:6830:1e03:: with SMTP id s3mr23811707otr.321.1617645731847;
        Mon, 05 Apr 2021 11:02:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n83sm3169333oif.18.2021.04.05.11.02.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Apr 2021 11:02:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 5 Apr 2021 11:02:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Eichenberger <eichest@gmail.com>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH] watchdog: imx_sc_wdt: fix pretimeout
Message-ID: <20210405180210.GH93485@roeck-us.net>
References: <20210405125946.369230-1-eichest@gmail.com>
 <2580102e-4459-c55e-0aab-2882af8e9ae7@roeck-us.net>
 <20210405174352.GA395591@eichest-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405174352.GA395591@eichest-laptop>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Apr 05, 2021 at 07:43:52PM +0200, Stefan Eichenberger wrote:
> Hi Guenter,
> 
> On Mon, Apr 05, 2021 at 07:42:20AM -0700, Guenter Roeck wrote:
> > On 4/5/21 5:59 AM, eichest@gmail.com wrote:
> > > From: Stefan Eichenberger <eichest@gmail.com>
> > > 
> > > If the WDIOF_PRETIMEOUTE flag is not set when registering the device the
> > 
> > WDIOF_PRETIMEOUT
> > 
> 
> Thanks for that finding.
> 
> > > driver will not show the sysfs entries or register the default governor.
> > > By moving the registering after the decision whether pretimeout is
> > > supported this gets fixed.
> > > 
> > 
> > This is problematic. If the notifier is called and the watchdog is not yet
> > registered, it will call watchdog_notify_pretimeout on an unregistered
> > watchdog device which would crash the system. The notifier function needs
> > to handle that situation. This is for both registration and removal: On
> > removal, the watchdog device would be unregistered first (because of the
> > use of devm_ functions) and, again, the notifier could be called on an
> > unregistered watchdog device.
> > 
> 
> Isn't that handled in watchdog_notify_pretimeout with if (!wdd->gov)?
> As I understand the code, a governor is registered earliest in
> watchdog_register_pretimeout, which is called by watchdog_dev_register.
> The same when doing an unregister, which should be called when doing a
> watchdog_dev_unregister.
> 

Ah yes, you are correct. Thanks for checking, and sorry for the noise.

Guenter

> > > Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
> > > ---
> > >  drivers/watchdog/imx_sc_wdt.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> > > index e9ee22a7cb45..eddb1ae630e0 100644
> > > --- a/drivers/watchdog/imx_sc_wdt.c
> > > +++ b/drivers/watchdog/imx_sc_wdt.c
> > > @@ -183,10 +183,6 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
> > >  	watchdog_stop_on_reboot(wdog);
> > >  	watchdog_stop_on_unregister(wdog);
> > >  
> > > -	ret = devm_watchdog_register_device(dev, wdog);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > >  	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> > >  				       SC_IRQ_WDOG,
> > >  				       true);
> > > @@ -213,6 +209,10 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
> > >  	else
> > >  		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
> > >  
> > > +	ret = devm_watchdog_register_device(dev, wdog);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	return 0;
> > 
> > This is equivalent to just "return ret;".
> > 
> 
> Thanks, will fix that too. 
> 
> Regards,
> Stefan
