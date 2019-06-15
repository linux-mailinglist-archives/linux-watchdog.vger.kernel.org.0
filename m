Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B6B46F8E
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2019 12:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfFOKiu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 15 Jun 2019 06:38:50 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:37242 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfFOKiu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 15 Jun 2019 06:38:50 -0400
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id E075540909; Sat, 15 Jun 2019 12:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org E075540909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1560592950;
        bh=x4moI263mVJ9xXic7CfPOGIPWBoqDc8/6cZrMgLHrrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a33jSYKHPmrGKL4bHC44S8kGiyIC/LW5QIg3kRKNEItop/qtctXJF40ON/1zXd/4j
         BgH7YfgZUmz3jFwYewwboPMspfWmDzvzr3h++8zpXPrvz64egaHFHXVSWSbC+y5WIo
         q17kUKzN8DhrwbU3GrwhWIEE2wagNL4K5wufWaEg=
Date:   Sat, 15 Jun 2019 12:02:30 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: Re: [PATCH v10 3/3] watchdog: make the device time out at
 open_deadline when open_timeout is used
Message-ID: <20190615100230.GA10480@www.linux-watchdog.org>
References: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
 <20190605140628.618-4-rasmus.villemoes@prevas.dk>
 <20190607183827.GA32475@roeck-us.net>
 <56280052-9437-9813-a24e-125abb876762@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56280052-9437-9813-a24e-125abb876762@prevas.dk>
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Rasmus,

> > On Wed, Jun 05, 2019 at 02:06:44PM +0000, Rasmus Villemoes wrote:
> >> When the watchdog device is not open by userspace, the kernel takes
> >> care of pinging it. When the open_timeout feature is in use, we should
> >> ensure that the hardware fires close to open_timeout seconds after the
> >> kernel has assumed responsibility for the device.
> >>
> >> To do this, simply reuse the logic that is already in place for
> >> ensuring the same thing when userspace is responsible for regularly
> >> pinging the device:
> >>
> >> - When watchdog_active(wdd), this patch doesn't change anything.
> >>
> >> - When !watchdoc_active(wdd), the "virtual timeout" should be taken to
> > 
> > s/watchdoc_active/watchdog_active/
> > 
> > otherwise
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks! Wim, can you fix up if/when applying, or do you prefer I resend?

I'll fix up when applying. No need to resend a new patch for that.

Kind regards,
Wim.

