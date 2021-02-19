Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F067331FA3C
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Feb 2021 15:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhBSOC6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 19 Feb 2021 09:02:58 -0500
Received: from smtp.asem.it ([151.1.184.197]:54910 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230241AbhBSOC5 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 19 Feb 2021 09:02:57 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000818655.MSG 
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Feb 2021 15:01:57 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 19
 Feb 2021 15:01:56 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Fri, 19 Feb 2021 15:01:56 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: R: [PATCH v1] watchdog: wdat: add param. to start wdog on module
 insertion
Thread-Topic: [PATCH v1] watchdog: wdat: add param. to start wdog on module
 insertion
Thread-Index: AQHXBhOZhCefmAy4X0yS/T4Cg8tbv6pfPluAgAAygZA=
Date:   Fri, 19 Feb 2021 14:01:56 +0000
Message-ID: <bf4e89bd11964f2e9f621f949adc338b@asem.it>
References: <20210218163200.1154812-1-f.suligoi@asem.it>
 <20210219105447.GI2542@lahna.fi.intel.com>
In-Reply-To: <20210219105447.GI2542@lahna.fi.intel.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F20.602FC4D5.00A7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Mika,

> >  	 const struct wdat_instruction *instr, u32 *value)
> >  {
> > @@ -437,6 +443,8 @@ static int wdat_wdt_probe(struct platform_device
> *pdev)
> >  	}
> >
> >  	wdat_wdt_boot_status(wdat);
> > +	if (start_enabled)
> > +		wdat_wdt_start(&wdat->wdd);
> 
> No objections to this if it is really needed. However, I think it is
> better start the watchdog after devm_watchdog_register_device() has been
> called so we have everything initialized.

Yes, it is needed. We need this feature to enable the watchdog
as soon as possible and this is essential for unmanned applications,
such as routers, water pumping stations, climate data collections,
etc.  

Right, ok for the correct positioning of the wdat_wdt_start function
at the end of the watchdog device initialization. Thanks!

> 
> >  	wdat_wdt_set_running(wdat);
> >
> >  	ret = wdat_wdt_enable_reboot(wdat);
> > --
> > 2.25.1

Regards,
Flavio
