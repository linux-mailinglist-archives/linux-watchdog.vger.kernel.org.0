Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189FD95E25
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 14:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbfHTMMx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 08:12:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:32799 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728248AbfHTMMx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 08:12:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id q20so4807239otl.0
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Aug 2019 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U2NIheRF1MKDtg0x1ThLhLoSGJ3AGDkS7J4R8r99Hx0=;
        b=mQYNOQNM2JHFdqrBGNGjC1trjiGsKxqXlFEm/SuTx72JQHCIuKZyy3OMhabkWvmurb
         JNAZxv0+/vlz9iz2k3VbAddkZrcAQkOMV9nFWipr2x49kdUmfr+lg3TeJs6E3Nm7ufim
         CMp8JuZEorUXaTQ9T5Dt8Fxw+eSBKgtDPJNqBIoaW70S4Qym0qIkujjA462nw6yaX8qG
         PUksWoBBcySj5fhLKy1EVotyTQc+u/ys4SPDASj1u47Xn58+y93QnypSEOTbp1YBwl9a
         aEcDUT6Z6tJw1USQI6fiXInuJCpQHk8t82viojjPCDh5n5PzLqZchpaRgEjenDHhoAY6
         SCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=U2NIheRF1MKDtg0x1ThLhLoSGJ3AGDkS7J4R8r99Hx0=;
        b=MXcFRgmiroYllMDzTDBOTFhq40WzkuXTLnDJOtRLV0RbZPfyOd6j62pMXnrlI3FMpJ
         JklxlEzbbh/WPY9M8kCRCSsE6OltzY/oKueteXTf9tutbyS0kr2oalBjCgAB9k9e3a5O
         cL+p2UKcwDw3ZP3jw6ungQk27dkmKUa5fWdAd5w3KZ0hJxvnWzNDyGXr5qv3mjizKCKo
         B4z03Mv6ig0IyB8raTHratqm6ggC9C7rPFvDlNxgJ+EO9bZptEuqj+rQlnWMvsBM3bGD
         Qeg7uKg7Fqo3qC0pIrijA8xL7wNO9mKXIisWMxwEld50JqlHGJfSFGOmYyeQaYIxvlPt
         rPsg==
X-Gm-Message-State: APjAAAVF2WLfKgL1i4Z/Td+ZHbfNYmbC2rkkfIXWphB45KTtwQUx901b
        7KlYy2wYc+v9OZsj7NXQ8ofoJg==
X-Google-Smtp-Source: APXvYqxNcpMud7umLgwuPPtOqX3SYTiCDl7kAXowbHvos51WFlQLFN0pahzHmsmhHbFh5u7FJlPCzQ==
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr13106907otq.364.1566303167654;
        Tue, 20 Aug 2019 05:12:47 -0700 (PDT)
Received: from minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id a22sm6464731otr.3.2019.08.20.05.12.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 05:12:45 -0700 (PDT)
Date:   Tue, 20 Aug 2019 07:12:44 -0500
From:   Corey Minyard <cminyard@mvista.com>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Convert@minyard.net,
        the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
        to@minyard.net, standard@minyard.net, interface@minyard.net,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 02/12] watchdog: Add the ability to provide data to read
Message-ID: <20190820121243.GO445@minyard.net>
Reply-To: cminyard@mvista.com
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-3-minyard@acm.org>
 <20190819224345.GB8869@roeck-us.net>
 <20190820002309.GI445@minyard.net>
 <20190820010946.GF25435@anatevka.americas.hpqcorp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820010946.GF25435@anatevka.americas.hpqcorp.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 07:09:46PM -0600, Jerry Hoemann wrote:
> On Mon, Aug 19, 2019 at 07:23:09PM -0500, Corey Minyard wrote:
> > On Mon, Aug 19, 2019 at 03:43:45PM -0700, Guenter Roeck wrote:
> > > On Mon, Aug 19, 2019 at 03:37:01PM -0500, minyard@acm.org wrote:
> > > > From: Corey Minyard <cminyard@mvista.com>
> > > > 
> > > > This is for the read data pretimeout governor.
> > > > 
> > > > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > > 
> > > On further thought, I think it would be a bad idea to add this
> > > functionality: It changes the userspace ABI for accessing the watchdog
> > > device. Today, when a watchdog device is opened, it does not provide
> > > read data, it does not hang, and returns immediately. A "cat" from it
> > > is an easy and quick means to test if a watchdog works.
> > 
> > Umm, why would a "cat" from a watchdog tell you if a watchdog works?
> 
> cat /dev/watchdog starts the watchdog running.
> 
> Then one can do useful things like monitor /sys/class/watchdog/watchdogN and see
> time ticking down, etc..,
> 
> echo V > /dev/watchdog stops the watchdog assuming driver supports WDIOF_MAGICCLOSE.
> 
> So I can test without having to reboot.
> 
> One can't test magic close with the proposed change as /dev/watchdog
> is exclusive open.

Sure you can:

# echo "" >/dev/watchdog0
[   92.390649] watchdog: watchdog0: watchdog did not stop!
# sleep 2
# cat /sys/class/watchdog/watchdog0/timeleft
8
# echo "V" >/dev/watchdog0

Works just fine.  But I can make it so that reading returns an error
unless the governor is the read one.

The question is if this is required to transfer the IPMI watchdog
over to the standard interface.  It currently has this function,
do we do an API change to move it over?

-corey

> 
> 
> 
> 
> -- 
> 
> -----------------------------------------------------------------------------
> Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
> -----------------------------------------------------------------------------
