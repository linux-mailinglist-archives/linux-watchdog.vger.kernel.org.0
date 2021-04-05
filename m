Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803E7354644
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Apr 2021 19:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238894AbhDERoD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Apr 2021 13:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbhDERoC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Apr 2021 13:44:02 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B7AC061756
        for <linux-watchdog@vger.kernel.org>; Mon,  5 Apr 2021 10:43:56 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id e14so17857401ejz.11
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Apr 2021 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zIMLY6lG3DBRV54ypQpdCvtNwEiHz5jAkE8uGLy83RY=;
        b=oq0W3aSRihZRP2q04xOCMv/uRM37797RNu7zATY0YMfimAfH0fAUMOpss2kDUqWG2B
         ZCns79tj6UzL5eHcYJO3nvYn3wlylOHJHCxOuf6QKk/lrCzWj6XMvkqT1RQZBlofQGA+
         PFSYSIyk0Lxz5g5vaA+Lq0dx3tpdqJJSVqELt4Hctxk/ZWwYSbg/Rdg+ejWusFJLnjn/
         H4Zud35DA11ISZXz6jRhJzALQeE/Hmw3s3wgtrGGb/aHam+mN+tIXYmBtE1rN0DfCmHH
         h1hTsVeuHPRx6MEnBMUdQcTwreXSycUke6D34MUVx98XU7GDI5w9YPK2etjm1ZDKjfrD
         IOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zIMLY6lG3DBRV54ypQpdCvtNwEiHz5jAkE8uGLy83RY=;
        b=AACdUcJbSnCx/KscANrNyBJoQPbYiyRGF6G8XJmeHAshI19hju4MbbUWuY4lDBil3V
         zApy25+y0t2vxVdRum6voTxcdXThFUQWGwHv1+yPMBnc8WmAjR3JG+I9GZHL/ysPGn6N
         Oja3tT4SbkhNUoQymQ4EMZsfm97GlbD+TQJAC5+siITWffX/hLspg8oRjaoHDDmoG6GJ
         IVE1Z/IVhCMz5CGX9OoAvClAfCIoNcvkjWUPALRP7tso/A8QG3zAmdysVr7N4GEpcqXH
         B0q4XsaArMKf/PiAJzuAbCwrsa+GVAxcoHuFKS1eEWzw7QM+EscZjmrt7sWJ0MkDHrwI
         6viA==
X-Gm-Message-State: AOAM531UdPxC4tOm8mdIPRDsL9slokPehJdd34KiQS6NVSKeponOHw8X
        /DzVjeteNUV2/nhLXGU6AIw=
X-Google-Smtp-Source: ABdhPJwTRbzF+e4dLeHOK45uZMGNDOmFBIC+w8Xiex88Z3oodMXxdV+10H8nLtq1mfgMS3VyLrUSVQ==
X-Received: by 2002:a17:906:368c:: with SMTP id a12mr30116267ejc.389.1617644634894;
        Mon, 05 Apr 2021 10:43:54 -0700 (PDT)
Received: from eichest-laptop (77-57-203-148.dclient.hispeed.ch. [77.57.203.148])
        by smtp.gmail.com with ESMTPSA id y16sm1798723edc.62.2021.04.05.10.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:43:54 -0700 (PDT)
Date:   Mon, 5 Apr 2021 19:43:52 +0200
From:   Stefan Eichenberger <eichest@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH] watchdog: imx_sc_wdt: fix pretimeout
Message-ID: <20210405174352.GA395591@eichest-laptop>
References: <20210405125946.369230-1-eichest@gmail.com>
 <2580102e-4459-c55e-0aab-2882af8e9ae7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2580102e-4459-c55e-0aab-2882af8e9ae7@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On Mon, Apr 05, 2021 at 07:42:20AM -0700, Guenter Roeck wrote:
> On 4/5/21 5:59 AM, eichest@gmail.com wrote:
> > From: Stefan Eichenberger <eichest@gmail.com>
> > 
> > If the WDIOF_PRETIMEOUTE flag is not set when registering the device the
> 
> WDIOF_PRETIMEOUT
> 

Thanks for that finding.

> > driver will not show the sysfs entries or register the default governor.
> > By moving the registering after the decision whether pretimeout is
> > supported this gets fixed.
> > 
> 
> This is problematic. If the notifier is called and the watchdog is not yet
> registered, it will call watchdog_notify_pretimeout on an unregistered
> watchdog device which would crash the system. The notifier function needs
> to handle that situation. This is for both registration and removal: On
> removal, the watchdog device would be unregistered first (because of the
> use of devm_ functions) and, again, the notifier could be called on an
> unregistered watchdog device.
> 

Isn't that handled in watchdog_notify_pretimeout with if (!wdd->gov)?
As I understand the code, a governor is registered earliest in
watchdog_register_pretimeout, which is called by watchdog_dev_register.
The same when doing an unregister, which should be called when doing a
watchdog_dev_unregister.

> > Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
> > ---
> >  drivers/watchdog/imx_sc_wdt.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> > index e9ee22a7cb45..eddb1ae630e0 100644
> > --- a/drivers/watchdog/imx_sc_wdt.c
> > +++ b/drivers/watchdog/imx_sc_wdt.c
> > @@ -183,10 +183,6 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
> >  	watchdog_stop_on_reboot(wdog);
> >  	watchdog_stop_on_unregister(wdog);
> >  
> > -	ret = devm_watchdog_register_device(dev, wdog);
> > -	if (ret)
> > -		return ret;
> > -
> >  	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> >  				       SC_IRQ_WDOG,
> >  				       true);
> > @@ -213,6 +209,10 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
> >  	else
> >  		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
> >  
> > +	ret = devm_watchdog_register_device(dev, wdog);
> > +	if (ret)
> > +		return ret;
> > +
> >  	return 0;
> 
> This is equivalent to just "return ret;".
> 

Thanks, will fix that too. 

Regards,
Stefan
