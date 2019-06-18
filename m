Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 420BA4A8EE
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2019 19:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730162AbfFRR6p convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jun 2019 13:58:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:37821 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729349AbfFRR6p (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jun 2019 13:58:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 10:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; 
   d="scan'208";a="358342216"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jun 2019 10:58:45 -0700
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Jun 2019 10:58:45 -0700
Received: from lcsmsx156.ger.corp.intel.com (10.186.165.234) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Jun 2019 10:58:44 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.33]) by
 LCSMSX156.ger.corp.intel.com ([169.254.15.128]) with mapi id 14.03.0439.000;
 Tue, 18 Jun 2019 20:58:42 +0300
From:   "Winkler, Tomas" <tomas.winkler@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH] watchdog: mei_wdt: no need to check return value of
 debugfs_create functions
Thread-Topic: [PATCH] watchdog: mei_wdt: no need to check return value of
 debugfs_create functions
Thread-Index: AQHVJe69bgioifdfD0qxeMsViSH2a6ahchmAgAA+9RA=
Date:   Tue, 18 Jun 2019 17:58:41 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DC49A77@hasmsx108.ger.corp.intel.com>
References: <20190618155830.GB21825@kroah.com>
 <20190618170611.GB10509@roeck-us.net>
In-Reply-To: <20190618170611.GB10509@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.184.70.10]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> > ---
> >  drivers/watchdog/mei_wdt.c | 30 +++++++-----------------------
> >  1 file changed, 7 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
> > index 8023cf28657a..96a770938ff0 100644
> > --- a/drivers/watchdog/mei_wdt.c
> > +++ b/drivers/watchdog/mei_wdt.c
> > @@ -539,38 +539,23 @@ static void dbgfs_unregister(struct mei_wdt *wdt)
> >  	wdt->dbgfs_dir = NULL;
> >  }
> >
> > -static int dbgfs_register(struct mei_wdt *wdt)
> > +static void dbgfs_register(struct mei_wdt *wdt)
> >  {
> > -	struct dentry *dir, *f;
> > +	struct dentry *dir;
> >
> >  	dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
> > -	if (!dir)
> > -		return -ENOMEM;
If create dir fails but  the consequent create file succeeds,  I would guess this will be a mess in the debugs root directory. 
Also the tear down won't work as debugfs_remove_recursive will just bail out on NULL check.
Isn't it better just return here, when create_dir fails? 

> > -
> >  	wdt->dbgfs_dir = dir;
> > -	f = debugfs_create_file("state", S_IRUSR, dir, wdt, &dbgfs_fops_state);
> > -	if (!f)
> > -		goto err;
> >
> > -	f = debugfs_create_file("activation",  S_IRUSR,
> > -				dir, wdt, &dbgfs_fops_activation);
> > -	if (!f)
> > -		goto err;
> > +	debugfs_create_file("state", S_IRUSR, dir, wdt, &dbgfs_fops_state);
> >
> > -	return 0;
> > -err:
> > -	dbgfs_unregister(wdt);
> > -	return -ENODEV;
> > +	debugfs_create_file("activation", S_IRUSR, dir, wdt,
> > +			    &dbgfs_fops_activation);
> >  }
> >
> >  #else
> >
> >  static inline void dbgfs_unregister(struct mei_wdt *wdt) {}
> > -
> > -static inline int dbgfs_register(struct mei_wdt *wdt) -{
> > -	return 0;
> > -}
> > +static inline void dbgfs_register(struct mei_wdt *wdt) {}
> >  #endif /* CONFIG_DEBUG_FS */
> >
> >  static int mei_wdt_probe(struct mei_cl_device *cldev, @@ -623,8
> > +608,7 @@ static int mei_wdt_probe(struct mei_cl_device *cldev,
> >  	if (ret)
> >  		goto err_disable;
> >
> > -	if (dbgfs_register(wdt))
> > -		dev_warn(&cldev->dev, "cannot register debugfs\n");
> > +	dbgfs_register(wdt);
> >
> >  	return 0;
> >
> > --
> > 2.22.0
> >
