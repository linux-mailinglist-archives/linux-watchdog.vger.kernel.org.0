Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B52496870
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 20:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbfHTSQo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 14:16:44 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35825 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfHTSQn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 14:16:43 -0400
Received: by mail-ot1-f67.google.com with SMTP id g17so5918383otl.2
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Aug 2019 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ViohNphGEIvVk/soibbp/JujrtnvyTv7AG7dq1v12Ag=;
        b=CVyR3F7AbXysEDlj3OTn8hpK6P+XHGCb7czR6jXYPGJ1sbseEm62n4tHzfed291EBa
         5vjSHXRlE1ySA5bRsW4TvsfFz+tPGijOStRG8fZR5gbYX+6AZM+Kfu4bMlmcRDBwq8t3
         UxzzCdyh+w64wnI8A11SJXj8VJyKknuYk6YUNEYZVJHtmns8s7YrTkmvBcjNvqqKvBrM
         izUP0VVZDqPSPYnqTYA2byDEd+k2faDrAMJX02Bz965ukI/x2Sld4XHqmiuDJ8Ruuwse
         NcHXaO9XaFJdKcJpyvGlhp8DO6d6IBJlEPdpNXj6dLtkdvtcv2bCWJQFJxswWXSfeWid
         YmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ViohNphGEIvVk/soibbp/JujrtnvyTv7AG7dq1v12Ag=;
        b=Op5gQdjsp+EX8vFo02k9RTQ+ri1ENm5fMY9OWH/C6V3gmppS3BJy4wUMLg8vzZvFJK
         p/wlr/vLSJal1k3J+2YlNvjcC9U0HeCboK5hWxTEjq5Z1KeHCOxzk999a3NkYtl9r2U/
         f8pLq6kNDBxjfqjiNr2o/Iy0LyuAklScCA+mzpUkuoUJ/BsQkb/fL5ovyzQPqKGAWz6o
         2184PCIa3ku51umXAUq/bC1cVS3KAiqf4B6gNBlJj2ytspGwn/08jnh+j5NhfbfOq+AY
         hDAgfa74PiLTM47AnpRpqe/XPkr0cY4f935h/Y5PBc/uZ9ZSwZYknI9URWXAgBVDKaiM
         2pWA==
X-Gm-Message-State: APjAAAVpVOpqqtGK1k5ffo5/H+KHJnX85yQbDWW5a+ZHjl4Dm4zsCqbJ
        br1DyojtKEJkzDaCtEg1JIMC/QDT9th8Kg==
X-Google-Smtp-Source: APXvYqyaFu85fd38UcR0jqLyTYj/huenvQhgF/hy+kP57dzf9M5+a9JW7s22JDUrQAbk41w9LST40g==
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr6948343otk.107.1566325000143;
        Tue, 20 Aug 2019 11:16:40 -0700 (PDT)
Received: from minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id i16sm6781032otc.65.2019.08.20.11.16.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 11:16:39 -0700 (PDT)
Date:   Tue, 20 Aug 2019 13:16:37 -0500
From:   Corey Minyard <cminyard@mvista.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jerry Hoemann <jerry.hoemann@hpe.com>, Convert@minyard.net,
        the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
        to@minyard.net, standard@minyard.net, interface@minyard.net,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 02/12] watchdog: Add the ability to provide data to read
Message-ID: <20190820181637.GR445@minyard.net>
Reply-To: cminyard@mvista.com
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-3-minyard@acm.org>
 <20190819224345.GB8869@roeck-us.net>
 <20190820002309.GI445@minyard.net>
 <20190820010946.GF25435@anatevka.americas.hpqcorp.net>
 <20190820121243.GO445@minyard.net>
 <fa50d921-8d40-6bf8-00f3-b46d9468829a@roeck-us.net>
 <20190820155808.GQ445@minyard.net>
 <f4a6d027-c491-5e81-777e-ac2ffaecd3dc@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4a6d027-c491-5e81-777e-ac2ffaecd3dc@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 20, 2019 at 10:14:50AM -0700, Guenter Roeck wrote:
> On 8/20/19 8:58 AM, Corey Minyard wrote:
> > On Tue, Aug 20, 2019 at 06:53:40AM -0700, Guenter Roeck wrote:
> > > On 8/20/19 5:12 AM, Corey Minyard wrote:
> > > > On Mon, Aug 19, 2019 at 07:09:46PM -0600, Jerry Hoemann wrote:
> > > > > On Mon, Aug 19, 2019 at 07:23:09PM -0500, Corey Minyard wrote:
> > > > > > On Mon, Aug 19, 2019 at 03:43:45PM -0700, Guenter Roeck wrote:
> > > > > > > On Mon, Aug 19, 2019 at 03:37:01PM -0500, minyard@acm.org wrote:
> > > > > > > > From: Corey Minyard <cminyard@mvista.com>
> > > > > > > > 
> > > > > > > > This is for the read data pretimeout governor.
> > > > > > > > 
> > > > > > > > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > > > > > > 
> > > > > > > On further thought, I think it would be a bad idea to add this
> > > > > > > functionality: It changes the userspace ABI for accessing the watchdog
> > > > > > > device. Today, when a watchdog device is opened, it does not provide
> > > > > > > read data, it does not hang, and returns immediately. A "cat" from it
> > > > > > > is an easy and quick means to test if a watchdog works.
> > > > > > 
> > > > > > Umm, why would a "cat" from a watchdog tell you if a watchdog works?
> > > > > 
> > > > > cat /dev/watchdog starts the watchdog running.
> > > > > 
> > > > > Then one can do useful things like monitor /sys/class/watchdog/watchdogN and see
> > > > > time ticking down, etc..,
> > > > > 
> > > > > echo V > /dev/watchdog stops the watchdog assuming driver supports WDIOF_MAGICCLOSE.
> > > > > 
> > > > > So I can test without having to reboot.
> > > > > 
> > > > > One can't test magic close with the proposed change as /dev/watchdog
> > > > > is exclusive open.
> > > > 
> > > > Sure you can:
> > > > 
> > > > # echo "" >/dev/watchdog0
> > > > [   92.390649] watchdog: watchdog0: watchdog did not stop!
> > > > # sleep 2
> > > > # cat /sys/class/watchdog/watchdog0/timeleft
> > > > 8
> > > > # echo "V" >/dev/watchdog0
> > > > 
> > > > Works just fine.  But I can make it so that reading returns an error
> > > > unless the governor is the read one.
> > > > 
> > > > The question is if this is required to transfer the IPMI watchdog
> > > > over to the standard interface.  It currently has this function,
> > > > do we do an API change to move it over?
> > > > 
> > > Having to change the standard watchdog API to accommodate a non-standard driver
> > > is most definitely not the right approach. If it was, anyone could use it to
> > > force standard API/ABI changes. Just implement driver X outside its subsystem
> > > and then claim you need to change the subsystem to accommodate it.
> > 
> > I'm not advocating anything of the sort.  I think it can be done in
> > a way that keeps the API the same unless you enable a new pretimeout
> > governor.  I would not suggest that the API be changed, and I should
> > have handled that in the original design.
> > 
> > > 
> > > On a side note, a standard watchdog driver can implement its own ioctl functions.
> > 
> > I am aware of that, but you can't provide read data on a file descriptor
> > through that interface.  The actions and preactions could be done that
> > way, but that seemed a more general function that could benefit other
> > drivers.
> > 
> That comment was more directed towards the ioctls you are adding to the
> watchdog core, which I think would require more discussion.

Ok, that's kind of a separate discussion.  We should probably have it
on that email.

> 
> > The function to provide read data might be useful, I don't know, but
> > it could be used with any driver that did a normal interrupt pretimeout.
> > I can't remember why it was originally done.  I vaguely remember someone
> > asking for it, but that was 17 years ago.
> > 
> 
> I find it odd. Only one driver can have the watchdog device open,
> and that open file should be used to ping the watchdog. It can't do that
> while waiting for a pretimeout. This almost sounds like the user wrote
> an application which waited for the pretimeout to happen before pinging
> the watchdog.

No, poll() is also implemented, so you can wait for poll input and
also wait for a timeout.  And fasync is also implemented.  And you
can have multiple threads in the same program, one for pinging and
one for reading.  Single open does not mean single thread through
the driver.

> 
> Talking about a standardized ABI to inform userspace if a pretimeout
> occurred... if there is a use case for this, I'd rather trigger a udev
> event on the "pretimeout" sysfs attribute. That would make much more
> sense to me than sending a random data byte to the "read" function.
> The WDIOC_GETSTATUS ioctl could then report that a pretimeout occurred.
> Or, depending on the use case, just report the fact that a pretimeout
> occurred with WDIOC_GETSTATUS. That would be really simple to add,
> and I would support it.

I'd agree on the udev event, but none of that existed when this was
originally written.  I'd prefer to not implement interfaces that
require periodic polling.

To me the only sensible thing to do on a pretimeout is to panic.
But people come up with all kinds of wild things, and I almost
certainly had some sort of external impetus to add this.

> 
> > It could just be left out and added back if someone complains.  That's
> > not very friendly since it's an API change, but then we would know if
> > anyone was using it.
> 
> It is still better than an API change for standard watchdog drivers,
> and a somewhat awkward interface to inform userspace about pretimeout
> events.

Like I said before, I think we can avoid an API change.  It's not an
API change if you add a new function that has to be enabled separately
that then makes it work differently.  Othersize you could never add
any new function.  And one can argue whether it's an API change, really,
as API changes only affect non-erroneous uses of an API.  Whether
reading from a write-only device is erroneous is questionable in my
mind ;-).

But I'm fine with leaving it out, then we can discuss how to add
something back in if someone complains.  That's probably the best
way forward.  I separated it out so those changes can be dropped
without affecting anything else.  And if someone complains, we would
get a real user who would know why they are using it.

Thanks,

-corey

> 
> Thanks,
> Guenter
> 
> > 
> > -corey
> > 
> > > 
> > > Guenter
> > > 
> > > > -corey
> > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > -- 
> > > > > 
> > > > > -----------------------------------------------------------------------------
> > > > > Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
> > > > > -----------------------------------------------------------------------------
> > > > 
> > > 
> > 
> 
