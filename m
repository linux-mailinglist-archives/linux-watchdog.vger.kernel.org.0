Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 201614AA2A
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2019 20:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729964AbfFRSpe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jun 2019 14:45:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:56018 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730384AbfFRSpd (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jun 2019 14:45:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 11:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; 
   d="scan'208";a="311113095"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by orsmga004.jf.intel.com with ESMTP; 18 Jun 2019 11:45:32 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Jun 2019 11:45:32 -0700
Received: from hasmsx106.ger.corp.intel.com (10.184.198.20) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Jun 2019 11:45:32 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.33]) by
 HASMSX106.ger.corp.intel.com ([169.254.10.193]) with mapi id 14.03.0439.000;
 Tue, 18 Jun 2019 21:45:30 +0300
From:   "Winkler, Tomas" <tomas.winkler@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH] watchdog: mei_wdt: no need to check return value of
 debugfs_create functions
Thread-Topic: [PATCH] watchdog: mei_wdt: no need to check return value of
 debugfs_create functions
Thread-Index: AQHVJe69bgioifdfD0qxeMsViSH2a6ahchmAgAA+9RD//9E4gIAAPN6A
Date:   Tue, 18 Jun 2019 18:45:29 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DC49B02@hasmsx108.ger.corp.intel.com>
References: <20190618155830.GB21825@kroah.com>
 <20190618170611.GB10509@roeck-us.net>
 <5B8DA87D05A7694D9FA63FD143655C1B9DC49A77@hasmsx108.ger.corp.intel.com>
 <20190618180405.GB31484@kroah.com>
In-Reply-To: <20190618180405.GB31484@kroah.com>
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
> On Tue, Jun 18, 2019 at 05:58:41PM +0000, Winkler, Tomas wrote:
> >
> > >
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > >
> > > > ---
> > > >  drivers/watchdog/mei_wdt.c | 30 +++++++-----------------------
> > > >  1 file changed, 7 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/drivers/watchdog/mei_wdt.c
> > > > b/drivers/watchdog/mei_wdt.c index 8023cf28657a..96a770938ff0
> > > > 100644
> > > > --- a/drivers/watchdog/mei_wdt.c
> > > > +++ b/drivers/watchdog/mei_wdt.c
> > > > @@ -539,38 +539,23 @@ static void dbgfs_unregister(struct mei_wdt
> *wdt)
> > > >  	wdt->dbgfs_dir = NULL;
> > > >  }
> > > >
> > > > -static int dbgfs_register(struct mei_wdt *wdt)
> > > > +static void dbgfs_register(struct mei_wdt *wdt)
> > > >  {
> > > > -	struct dentry *dir, *f;
> > > > +	struct dentry *dir;
> > > >
> > > >  	dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
> > > > -	if (!dir)
> > > > -		return -ENOMEM;
> > If create dir fails but  the consequent create file succeeds,  I would
> > guess this will be a mess in the debugs root directory.
> 
> Nope, debugfs_create_dir() can not return NULL, so no files will be created
> based on a -ERROR as a parent.
> 
> > Also the tear down won't work as debugfs_remove_recursive will just
> > bail out on NULL check.
> 
> Nope, NULL can not be returned from debugfs_create*() functions anymore.
> 
> > Isn't it better just return here, when create_dir fails?
> 
> Nope, no need to :)

I see,  not a fun of those dirty tricks but I admit it streamlines the code.
Ack
Thanks
Tomas

