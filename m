Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47834965B6
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 17:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730349AbfHTP6N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 11:58:13 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37846 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHTP6N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 11:58:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id f17so5502630otq.4
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Aug 2019 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0CtjLq8n6Fpgt3HyHCymg1B3+QDmeJ+5G6DC/G6V8Lg=;
        b=p1+khCBSUMF4QUSGTRisX3sYqcUwHQ1JR1R/EhDqCsu5ap3vWz6WppLuHyF6566BTF
         596fsUmUt/5UEP7P+wO9G85V3+JUrvsrY3fNYeAiCW9h5jskyeB0XTuhjW2RunJGerNA
         DG3/X9vq3iN7MwwLeJovgZlXN/V+TLk4hKemuvF0hoqjsXySv33oBL+TTNyJhuxdixJh
         4Sc3E2BlmRraFQSUdAup+HEso23oOIS49wOno3ZPEwrA2WxdF71CpjD530KZhuViAdZE
         +IfUjiPOMmzMPnvxuvo9g1HPfjTeAwBPvmhnYNB0KLD77XfjQZwo4HXNkvLT42yhZP2f
         nm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0CtjLq8n6Fpgt3HyHCymg1B3+QDmeJ+5G6DC/G6V8Lg=;
        b=Tokf2EwcvucarwCXyH8PIY4J6Xi2gwcCh+QlMVPbn0tGP/CR2piuY/UzhGa8B9JXX5
         3Vxtp0ZFZLOcv2Y8PqAkGT/71c+4SfOqVwAEYX0xFuIR+9Wt0BE9AwtYAOigPwndTwsQ
         6H4YxKh2nW7SDOtWX3n1XQ71vOIg4WnCfJahGBZDo75CeOQqrrmqOmFtzLIyBVMTZywo
         y/LQa5FaHFAll/kdqjwSIom6CpELWqa5MErv0JW0lqUdsGIV3biv+62K60APeAoW4w7u
         O29GQ5ZMU3MI27J6OqB9ZVxJcjW5AQjhP0G1Rd+vbXVOvRo9ydqKHS/Z5W6FhhjqD6zW
         WyhQ==
X-Gm-Message-State: APjAAAXbBF7UiOi8HgjN0+OV+/DxrL4pKobdDFiX7HhFYkowfPvbF+Pq
        9SQS4QeNM42mH2TYpXoYJMOaZw==
X-Google-Smtp-Source: APXvYqyuCmzoNsanc261R/VbN0R8pfbw7KLaaDjnMobV9MYHuuicVRSCYP894PttY0UBozF6WwIg2Q==
X-Received: by 2002:a05:6830:144d:: with SMTP id w13mr23749627otp.85.1566316691351;
        Tue, 20 Aug 2019 08:58:11 -0700 (PDT)
Received: from minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id z26sm5000855oih.16.2019.08.20.08.58.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 08:58:10 -0700 (PDT)
Date:   Tue, 20 Aug 2019 10:58:09 -0500
From:   Corey Minyard <cminyard@mvista.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jerry Hoemann <jerry.hoemann@hpe.com>, Convert@minyard.net,
        the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
        to@minyard.net, standard@minyard.net, interface@minyard.net,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 02/12] watchdog: Add the ability to provide data to read
Message-ID: <20190820155808.GQ445@minyard.net>
Reply-To: cminyard@mvista.com
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-3-minyard@acm.org>
 <20190819224345.GB8869@roeck-us.net>
 <20190820002309.GI445@minyard.net>
 <20190820010946.GF25435@anatevka.americas.hpqcorp.net>
 <20190820121243.GO445@minyard.net>
 <fa50d921-8d40-6bf8-00f3-b46d9468829a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa50d921-8d40-6bf8-00f3-b46d9468829a@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 20, 2019 at 06:53:40AM -0700, Guenter Roeck wrote:
> On 8/20/19 5:12 AM, Corey Minyard wrote:
> > On Mon, Aug 19, 2019 at 07:09:46PM -0600, Jerry Hoemann wrote:
> > > On Mon, Aug 19, 2019 at 07:23:09PM -0500, Corey Minyard wrote:
> > > > On Mon, Aug 19, 2019 at 03:43:45PM -0700, Guenter Roeck wrote:
> > > > > On Mon, Aug 19, 2019 at 03:37:01PM -0500, minyard@acm.org wrote:
> > > > > > From: Corey Minyard <cminyard@mvista.com>
> > > > > > 
> > > > > > This is for the read data pretimeout governor.
> > > > > > 
> > > > > > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > > > > 
> > > > > On further thought, I think it would be a bad idea to add this
> > > > > functionality: It changes the userspace ABI for accessing the watchdog
> > > > > device. Today, when a watchdog device is opened, it does not provide
> > > > > read data, it does not hang, and returns immediately. A "cat" from it
> > > > > is an easy and quick means to test if a watchdog works.
> > > > 
> > > > Umm, why would a "cat" from a watchdog tell you if a watchdog works?
> > > 
> > > cat /dev/watchdog starts the watchdog running.
> > > 
> > > Then one can do useful things like monitor /sys/class/watchdog/watchdogN and see
> > > time ticking down, etc..,
> > > 
> > > echo V > /dev/watchdog stops the watchdog assuming driver supports WDIOF_MAGICCLOSE.
> > > 
> > > So I can test without having to reboot.
> > > 
> > > One can't test magic close with the proposed change as /dev/watchdog
> > > is exclusive open.
> > 
> > Sure you can:
> > 
> > # echo "" >/dev/watchdog0
> > [   92.390649] watchdog: watchdog0: watchdog did not stop!
> > # sleep 2
> > # cat /sys/class/watchdog/watchdog0/timeleft
> > 8
> > # echo "V" >/dev/watchdog0
> > 
> > Works just fine.  But I can make it so that reading returns an error
> > unless the governor is the read one.
> > 
> > The question is if this is required to transfer the IPMI watchdog
> > over to the standard interface.  It currently has this function,
> > do we do an API change to move it over?
> > 
> Having to change the standard watchdog API to accommodate a non-standard driver
> is most definitely not the right approach. If it was, anyone could use it to
> force standard API/ABI changes. Just implement driver X outside its subsystem
> and then claim you need to change the subsystem to accommodate it.

I'm not advocating anything of the sort.  I think it can be done in
a way that keeps the API the same unless you enable a new pretimeout
governor.  I would not suggest that the API be changed, and I should
have handled that in the original design.

> 
> On a side note, a standard watchdog driver can implement its own ioctl functions.

I am aware of that, but you can't provide read data on a file descriptor
through that interface.  The actions and preactions could be done that
way, but that seemed a more general function that could benefit other
drivers. 

The function to provide read data might be useful, I don't know, but
it could be used with any driver that did a normal interrupt pretimeout.
I can't remember why it was originally done.  I vaguely remember someone
asking for it, but that was 17 years ago.

It could just be left out and added back if someone complains.  That's
not very friendly since it's an API change, but then we would know if
anyone was using it.

-corey

> 
> Guenter
> 
> > -corey
> > 
> > > 
> > > 
> > > 
> > > 
> > > -- 
> > > 
> > > -----------------------------------------------------------------------------
> > > Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
> > > -----------------------------------------------------------------------------
> > 
> 
