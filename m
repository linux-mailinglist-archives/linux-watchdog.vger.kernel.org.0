Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E834A958
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2019 20:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbfFRSEI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jun 2019 14:04:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:46224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730311AbfFRSEI (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jun 2019 14:04:08 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E06B92063F;
        Tue, 18 Jun 2019 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560881047;
        bh=Oy04H6+TUDkvWx1dBH32/VxZtAblhp2HvI/t6dxwLsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0o4uaxTytOkcwWf7zPkpcGm33s9jBCFiK4fCBS2t4d2DIRuFVaeqpB5XoFgkiHhkm
         E9SEOsJYpM4kRXgW9+SgtPmWfp7Hbs+Vd+CNZ4XSPF0pEVNLHAovyOMxzXIqVD4D0B
         VeAqpcO1JGkddmrTyLf7OfsRgXQQqtUtMr1CpcR0=
Date:   Tue, 18 Jun 2019 20:04:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Winkler, Tomas" <tomas.winkler@intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH] watchdog: mei_wdt: no need to check return value of
 debugfs_create functions
Message-ID: <20190618180405.GB31484@kroah.com>
References: <20190618155830.GB21825@kroah.com>
 <20190618170611.GB10509@roeck-us.net>
 <5B8DA87D05A7694D9FA63FD143655C1B9DC49A77@hasmsx108.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B9DC49A77@hasmsx108.ger.corp.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 18, 2019 at 05:58:41PM +0000, Winkler, Tomas wrote:
> 
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > > ---
> > >  drivers/watchdog/mei_wdt.c | 30 +++++++-----------------------
> > >  1 file changed, 7 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
> > > index 8023cf28657a..96a770938ff0 100644
> > > --- a/drivers/watchdog/mei_wdt.c
> > > +++ b/drivers/watchdog/mei_wdt.c
> > > @@ -539,38 +539,23 @@ static void dbgfs_unregister(struct mei_wdt *wdt)
> > >  	wdt->dbgfs_dir = NULL;
> > >  }
> > >
> > > -static int dbgfs_register(struct mei_wdt *wdt)
> > > +static void dbgfs_register(struct mei_wdt *wdt)
> > >  {
> > > -	struct dentry *dir, *f;
> > > +	struct dentry *dir;
> > >
> > >  	dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
> > > -	if (!dir)
> > > -		return -ENOMEM;
> If create dir fails but  the consequent create file succeeds,  I would
> guess this will be a mess in the debugs root directory. 

Nope, debugfs_create_dir() can not return NULL, so no files will be
created based on a -ERROR as a parent.

> Also the tear down won't work as debugfs_remove_recursive will just
> bail out on NULL check.

Nope, NULL can not be returned from debugfs_create*() functions anymore.

> Isn't it better just return here, when create_dir fails? 

Nope, no need to :)

thanks,

greg k-h
