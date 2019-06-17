Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45BC2484B0
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2019 15:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbfFQN5N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Jun 2019 09:57:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42401 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbfFQN5N (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Jun 2019 09:57:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3FB1A19CF77;
        Mon, 17 Jun 2019 13:57:08 +0000 (UTC)
Received: from ws.net.home (unknown [10.40.205.47])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AC206136A;
        Mon, 17 Jun 2019 13:57:05 +0000 (UTC)
Date:   Mon, 17 Jun 2019 15:57:03 +0200
From:   Karel Zak <kzak@redhat.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org
Subject: Re: RFE: export watchdog features and version by /sys
Message-ID: <20190617135703.l3pzb3ndzhqxhflq@ws.net.home>
References: <20190606100131.2xgrs5cmtnj4hjyb@ws.net.home>
 <20190606171304.GA313@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606171304.GA313@roeck-us.net>
User-Agent: NeoMutt/20180716-1584-710bcd
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 17 Jun 2019 13:57:13 +0000 (UTC)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 06, 2019 at 10:13:04AM -0700, Guenter Roeck wrote:
> On Thu, Jun 06, 2019 at 12:01:31PM +0200, Karel Zak wrote:
> > 
> >  Hi,
> > 
> >  I'd like to improve wdctl(8) to read watchdog info from /sys, but I
> >  found that sysfs does not provide all information like ioctl API.
> > 
> >  Unfortunately, there is no way how from /sys get info about supported
> >  watchdog features and firmware version. This info is accessible only 
> >  by WDIOC_GETSUPPORT ioclt (struct watchdog_info->options and
> >  watchdog_info->firmware_version).
> > 
> >  It would be nice to have "options" and "firmware_version" also in in
> >  sysfs. Please :-)
> > 
> 
> Makes sense. Care to submit patches implementing it ?

Frankly, although it seems like relatively simple task it would be
better if some kernel developer will do it :-) 

> We would have to resolve the conflict against the existing
> firmware_version attribute provided by ziirave_wdt.

Hmm, maybe use "version" as a filename for the attribute.

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com
