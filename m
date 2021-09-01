Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4ABF3FD888
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Sep 2021 13:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbhIALQZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Sep 2021 07:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31368 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234640AbhIALQY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Sep 2021 07:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630494927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kk4W4K9MQ9ua2+zgx8bPqDZ+eX9GszTN0dZY5t310is=;
        b=AT0aSqJ/37owBL8HJIyTwr9jMuEjSGnCbojAx7sLKfIcLDJ/9L+sbJy2NjTROjx1zd4ZXX
        r1HdM8BBZODgoO1FaM0R5x4DTpBB98Gc6HlQPY9B7jha416Zi5PZgREBlqoLcezk3EfHo2
        nHPpJ0ev01tDPAEUopqs0TIR97qYZCk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-hMHXNTbYMcOvf0GltmWkcw-1; Wed, 01 Sep 2021 07:15:26 -0400
X-MC-Unique: hMHXNTbYMcOvf0GltmWkcw-1
Received: by mail-wr1-f70.google.com with SMTP id d10-20020adffbca000000b00157bc86d94eso659733wrs.20
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Sep 2021 04:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kk4W4K9MQ9ua2+zgx8bPqDZ+eX9GszTN0dZY5t310is=;
        b=ctuSxuBu45om64GswFuhSUt0Rt/GjgiX22EoQHx3tcRY73wSFQwPJ10Naoaq9gBQeP
         RP+yBejnAF4tvNjJtWaDVd9IvMpMsPhR5+AOVPl/KMJiTedD+QCaxgPNHMlxR4xNYCtJ
         9IfcX8Fg4dTh/V47PusnEYcfTfqlGTmTvrtvB6FlhW7m5ZyNwOVEFhh5PjlTLCIPkHv2
         bmBQEoEixMLksqxbCJrEuNDHWjBU8F6sCgEHERwDcflFquXb39FpEOjxcR98TVhCEKDE
         7TTOpXnt4OQV/FRAEmgZKJrdyH4FgmtE6fey8Pgxcu5xZ1z770+JFZlzbXbJXWHWc7R/
         JJbQ==
X-Gm-Message-State: AOAM533/t89KdSxALFz9zWMgF+gDA4porYKF9mOw7gO0LV6Y5nsPVXvI
        ZtUN0HheQmFuHDXow+4mO663XnCyPGlStZXdppM0g/w+1YHFRaKPnegi5Rta2GyzXcnb3u/bMgr
        IsaszXa+5LnCEGs7aRT46X7e3C9Y=
X-Received: by 2002:a05:600c:219:: with SMTP id 25mr8926970wmi.157.1630494925315;
        Wed, 01 Sep 2021 04:15:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsAhcL5Q/tNxsf8q1PSTmDvInUuurABvWhyX4FKAw3F08cXef5JP80ilzhnyQPzSX/DmDMJg==
X-Received: by 2002:a05:600c:219:: with SMTP id 25mr8926950wmi.157.1630494925131;
        Wed, 01 Sep 2021 04:15:25 -0700 (PDT)
Received: from morpheus.roving-it.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.gmail.com with ESMTPSA id d6sm19018155wra.5.2021.09.01.04.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 04:15:24 -0700 (PDT)
Message-ID: <2c8c29d811c470f1df69ce5bb370f3f493fc55c2.camel@redhat.com>
Subject: Re: [Watchdog drivers] - WDIOC_GETSUPPORT clarification
From:   Peter Robinson <perobins@redhat.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Jose Noguera <jnoguera@redhat.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Date:   Wed, 01 Sep 2021 12:15:23 +0100
In-Reply-To: <3d7ec88a-8756-9a22-9e85-ab3b8c9953d2@roeck-us.net>
References: <CAKu6O181WOq36RCDO0VPcsZZoUFAJ88BMqv0Hqf+qYCeZsMJtQ@mail.gmail.com>
         <9866b7d2-1d43-db77-fa79-0be4bed51f5f@roeck-us.net>
         <0db70d23-d15c-e485-2600-439dc5d55d47@redhat.com>
         <3d7ec88a-8756-9a22-9e85-ab3b8c9953d2@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 2021-08-18 at 07:53 -0700, Guenter Roeck wrote:
> On 8/18/21 7:49 AM, Hans de Goede wrote:
> > Hi,
> > 
> > On 8/18/21 4:13 PM, Guenter Roeck wrote:
> > > On 8/18/21 2:57 AM, Jose Noguera wrote:
> > > > Hello all!
> > > > 
> > > > I’m Jose, working in Red Hat on Fedora IoT and RHEL For Edge
> > > > related projects.
> > > > 
> > > > While trying to add the feature of figuring out whether the
> > > > current boot was triggered or not by a hardware watchdog using
> > > > wdctl, we’ve found an odd behaviour in the drivers definition
> > > > that we would like to check with you.
> > > > 
> > > > Looking specifically for the flag WDIOF_CARDRESET, we can find
> > > > 40 files that contain it:
> > > > 
> > > > $ grep -rl CARDRESET drivers/watchdog/ | wc -l
> > > > 40
> > > > 
> > > > but only 19 of them have the flag advertised in the options
> > > > field of the watchdog_info struct returned by the
> > > > WDIOC_GETSUPPORT ioctl.
> > > > 
> > > > This leads to wdctl not showing WDIOF_CARDRESET for drivers
> > > > like i6300esb, even when the board had been reset this way:
> > > > 
> > > > $ sudo wdctl
> > > > Device: /dev/watchdog0
> > > > Identity: i6300ESB timer [version 0]
> > > > Timeout: 30 seconds
> > > > Pre-timeout: 0 seconds
> > > > 
> > > > FLAG DESCRIPTION STATUS BOOT-STATUS
> > > > KEEPALIVEPING Keep alive ping reply 1 0
> > > > MAGICCLOSE Supports magic close char 0 0
> > > > SETTIMEOUT Set timeout (in seconds) 0 0
> > > > 
> > > > Working with Hans (in CC), we added a little patch (BugZilla
> > > > ticket: 1993983) on wdctl and this would be the output of the
> > > > command when it was a card reset triggered boot:
> > > > 
> > > > $ sudo wdctl
> > > > Device: /dev/watchdog0
> > > > Identity: i6300ESB timer [version 0]
> > > > Thank you all for your time,
> > > > 
> > > > Jose
> > > 
> > > > Timeout: 30 seconds
> > > > Pre-timeout: 0 seconds
> > > > 
> > > > FLAG DESCRIPTION STATUS BOOT-STATUS
> > > > CARDRESET Card previously reset the CPU 1 1
> > > > KEEPALIVEPING Keep alive ping reply 1 0
> > > > MAGICCLOSE Supports magic close char 0 0
> > > > SETTIMEOUT Set timeout (in seconds) 0 0
> > > > 
> > > > So our question is, may we know what is intended to be present
> > > > in ident.options? What should the API call WDIOC_GETSUPPORT
> > > > return in the options field?
> > > > 
> > > 
> > > Search for WDIOC_GETSUPPORT in Documentation/watchdog/watchdog-
> > > api.rst.
> > > I don't see any ambiguity there. Patches welcome.
> > 
> > Ok, so drivers which may set CARDRESET in their GETBOOTSTATUS
> > reply, but
> > don't advertise this in their GETSUPPORT watchdog_info.options
> > reply
> > are buggy and should be fixed, got it. Thanks.
> > 
> > I've made a note about fixing this in a possible-kernel-projects
> > document
> > which I keep for when people who are interested in kernel
> > development
> > ask me for projects.
> > 
> 
> With an add-on: If the driver in question is an old-style driver,
> anyone
> affected by the problem should really convert the driver to support
> the watchdog subsystem.

Would you have a link to any docs/posts outlining what needs to be done
for conversion to the watchdog subsystem?

Regards,
Peter

