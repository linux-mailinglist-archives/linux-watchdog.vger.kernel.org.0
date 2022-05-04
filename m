Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA945190E5
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 May 2022 00:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243458AbiECWJb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 May 2022 18:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233631AbiECWJa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 May 2022 18:09:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E850201BB;
        Tue,  3 May 2022 15:05:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 25834B82028;
        Tue,  3 May 2022 22:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFFEC385A9;
        Tue,  3 May 2022 22:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651615553;
        bh=oXRDlcllC0cjULPtqKpnnLAaTtBjrH2yAKjYZHOmxEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kOgp61XjaLQHEUr+7iCLidSubGhFGYa9ZfqSwTIe88Kaow5K0+WdhIpmXruBl0hJA
         jOAPSXk5fDbtvCumHKrFR/rbTbt42IZvFALXjqsLVOO4797SHPZmsM38XK7JXYbbZQ
         HR1y9+53GpK168pLYVviAKv6nD5Jbknho+UWI/sveR8DsXGI3e3i3RHUeYR01HOzy3
         8veDQD03CMdNrxdDpW1gBWnSrSFunUW8VJXlHnOGJqDcfTBFi3Vu+z+bY586dIfQgy
         GLhrRsdGut+aqUnxntNe+l/OWXTAsN9JrO6awlelfPG2X+1lQQD5kMgw/wzDfwW7b8
         2r33J7HeuBZCA==
Received: by pali.im (Postfix)
        id CD3D398A; Wed,  4 May 2022 00:05:50 +0200 (CEST)
Date:   Wed, 4 May 2022 00:05:50 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Tzung-Bi Shih <tzungbi@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: max63xx_wdt: Add support for specifying
 WDI logic via GPIO
Message-ID: <20220503220550.3jczn2hzc5me34qj@pali>
References: <20220429131349.21229-1-pali@kernel.org>
 <20220429131349.21229-2-pali@kernel.org>
 <YnCoQUGQsXIfbowQ@google.com>
 <6f69677c-18d9-abd9-93d7-cf1f29603ed6@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f69677c-18d9-abd9-93d7-cf1f29603ed6@roeck-us.net>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Monday 02 May 2022 21:37:16 Guenter Roeck wrote:
> On 5/2/22 20:57, Tzung-Bi Shih wrote:
> > On Fri, Apr 29, 2022 at 03:13:49PM +0200, Pali Rohár wrote:
> > > @@ -27,6 +27,7 @@
> > >   #include <linux/io.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/property.h>
> > > +#include <linux/gpio/consumer.h>
> > 
> > It would be better to keep them alphabetically.  Anyway, they aren't sorted
> > originally...
> > 
> > > +static void max63xx_gpio_ping(struct max63xx_wdt *wdt)
> > > +{
> > > +	spin_lock(&wdt->lock);
> > 
> > Does it really need to acquire the lock?  It looks like the lock is to prevent
> > concurrent accesses to the mmap in max63xx_mmap_ping() and max63xx_mmap_set().
> > 
> 
> Actually, that doesn't work at all. spin_lock() directly contradicts
> with gpiod_set_value_cansleep().
> 
> > > +	gpiod_set_value_cansleep(wdt->gpio_wdi, 1);
> > > +	udelay(1);
> > 
> > Doesn't it need to include <linux/delay.h> for udelay()?
> > 
> > > @@ -225,10 +240,19 @@ static int max63xx_wdt_probe(struct platform_device *pdev)
> > >   		return -EINVAL;
> > >   	}
> > > +	wdt->gpio_wdi = devm_gpiod_get(dev, NULL, GPIOD_FLAGS_BIT_DIR_OUT);
> > > +	if (IS_ERR(wdt->gpio_wdi) && PTR_ERR(wdt->gpio_wdi) != -ENOENT)
> > 
> > Use devm_gpiod_get_optional() to make the intent clear.  Also, it gets rid of
> > the check for -ENOENT.
> > 
> > > +		return dev_err_probe(dev, PTR_ERR(wdt->gpio_wdi),
> > > +				     "unable to request gpio: %ld\n",
> > > +				     PTR_ERR(wdt->gpio_wdi));
> > 
> > It doesn't need to again print for PTR_ERR(wdt->gpio_wdi).  dev_err_probe()
> > prints the error.
> > 
> > >   	err = max63xx_mmap_init(pdev, wdt);
> > >   	if (err)
> > >   		return err;
> > > +	if (!IS_ERR(wdt->gpio_wdi))
> > > +		wdt->ping = max63xx_gpio_ping;
> > 
> > Thus, the max63xx_gpio_ping() overrides max63xx_mmap_ping() if the GPIO was
> > provided?  It would be better to mention the behavior in the commit message.
> > 
> > Also, could both the assignments of `wdt->gpio_wdi` and `wdt->ping` happen
> > after max63xx_mmap_init()?
> 

Hello! I'm going to look at all these issues. Recently I sent max63
watchdog driver also into U-Boot and seems that I mixed DTS and driver
code between U-Boot and Kernel... and tested something mixed.

I will do new testing again, and will check that I'm testing correct
code.
