Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6AADE7B9
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 18:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbfD2Q2M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 12:28:12 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41324 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728520AbfD2Q2M (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 12:28:12 -0400
Received: by mail-pg1-f195.google.com with SMTP id f6so5390850pgs.8
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Apr 2019 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6XQL/7mxqG9fqxvS7F+ut98YsP/y6sAMtY6EbU/82m8=;
        b=N7wO+bP3pdMGr0ftCpEDkwt2NhAovpIxIbT61VhreJzYQg2P9VDnkiu4r9PT0hcYyi
         fSCCcC0rwq+nG7vK7n/Q499D7mW17zHYq9Ub5JS44X0yAJbllKORq8rzsMwJh0KoORFh
         CRDwEelZ8Jdr97BG/Jv05sGaFfYlTRyw29yea3rpOayDiE9FpDR4OvsvC4vErUtXH/c+
         o2rBqnzDykFs/i/7GnywNc1jO9REK7rw5znEa4I6sj0R6qCIztU2ksrS+UVW18lx0H80
         Hk3WVVR9mGv0pOp8pPovIfgbabmP8pVRnf8q6NOHww+FCQCFAR47dpUFZVipGDV4ogS8
         L1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6XQL/7mxqG9fqxvS7F+ut98YsP/y6sAMtY6EbU/82m8=;
        b=rLLzZCCI11f+fTOUZttRuQBXPS0+qk8y3YDJD6QJAVFEXHEyJFuLUALsz8NdgKnhGJ
         iMdEUuFY8Nyuu33C3bdaef93mbX1JueEc6gDIjLBc4O1GwxAA+axpuUlaBlis/dFhk4j
         sFVX2Ll0pS/6EGS22csNVH8g04pJOh/owv/XNa5ZifRJAQ0IppxkSsjz7iMwHBJ9BkRu
         BQ4uhgpUQ9zR1aRxWi1JIbOxdUVxx70ft1Ej0u1U+oIwd77IqTL2EXAcbePeKpB+m90L
         ejY+c1pLoyqjcGeiYWy1i4XoJQdLHTPRI5q4aPn2r0qZMK46KPqr0ZJFAJYccfqRNel5
         cz9g==
X-Gm-Message-State: APjAAAWOvXG8KVRIhaJkA5RJLm+G8Fs8b/iPHyTdbaI1jVmYPDHDgljq
        pb78N3XLeqsdj5UzXDbyJYg=
X-Google-Smtp-Source: APXvYqy/t7rn/DLnDSH+TR5wWRf9yG/itO1BbBYUH9Adj0EtHHzuPlZxNhndhFfnzeztZ1w97rSWFA==
X-Received: by 2002:a63:314a:: with SMTP id x71mr10988226pgx.385.1556555291011;
        Mon, 29 Apr 2019 09:28:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r197sm27695398pfc.178.2019.04.29.09.28.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 09:28:09 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:28:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>,
        Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 2/5] watchdog: watchdog_core: make it explicitly
 non-modular
Message-ID: <20190429162807.GA13388@roeck-us.net>
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
 <1556034515-28792-3-git-send-email-paul.gortmaker@windriver.com>
 <439d89d7-bae6-c5c8-e9bf-5477304bc065@roeck-us.net>
 <20190424153700.GT23044@windriver.com>
 <20190424210530.GA29993@roeck-us.net>
 <20190427094833.GA32761@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190427094833.GA32761@www.linux-watchdog.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Apr 27, 2019 at 11:48:34AM +0200, Wim Van Sebroeck wrote:
> Hi All,
> 
> > On Wed, Apr 24, 2019 at 11:37:00AM -0400, Paul Gortmaker wrote:
> > > [Re: [PATCH 2/5] watchdog: watchdog_core: make it explicitly non-modular] On 23/04/2019 (Tue 18:22) Guenter Roeck wrote:
> > > 
> > > > On 4/23/19 8:48 AM, Paul Gortmaker wrote:
> > > > >The Kconfig currently controlling compilation of this code is:
> > > > >
> > > > >config WATCHDOG_CORE
> > > > >        bool "WatchDog Timer Driver Core"
> > > > >
> > > > >...meaning that it currently is not being built as a module by anyone.
> > > > >
> > > > >Lets remove the modular code that is essentially orphaned, so that
> > > > >when reading the driver there is no doubt it is builtin-only.
> > > > >
> > > > >We replace module.h with export.h since the file does export some
> > > > >symbols.  We don't add init.h since the file already has that.
> > > > >
> > > > >We also delete the MODULE_LICENSE tag etc. since all that information
> > > > >is already contained at the top of the file in the comments.
> > > > >
> > > > 
> > > > I must admit that I am not at all happy about this change. While not
> > > > configurable by default, I used tristate a lot (after enabling it
> > > > manually) to test watchdog core code while changing it. It saves a
> > > > lot of time to be able to reload the watchdog core without having
> > > > to reboot the entire system after each change. Removing the ability
> > > 
> > > I'm confused.  If it is useful, then why not formally make it tristate
> > > so other people can do the same as you do, and nobody is manually making
> > > the change over and over again each time?  I'd support that update.
> > > 
> > No idea. That precedes my involvement in the watchdog subsystem.
> > Let's wait for input from Wim. I have a set of patches ready, but it
> > doesn't make sense to me to submit them if Wim wants to go the non-modular
> > route.
> > 
> > FWIW, I am fine with the other patches except for the npcm patch, because
> > several of the other npcm drivers are buildable as module.
> 
> In general: If systems/devices can't handle modules then we should indeed make sure that we clean it up.
> 
Makes sense.

> For the watchdog core however, I am not in favour of doing that. I also use it as a module when i'm testing.
> I originally wanted to make it tristate (so that it can be loaded as a module), but I didn't had a clean way for the following situation:
> driver built as part of kernel, but watchdog system build as a module. We should imho avoid that.
> So no for this peticular patch and Guenter you can o ahead with another patch to make it tristate.
> 

That should be addressed by "select WATCHDOG_CORE" which is used throughout
the kernel. It would be a problem if we had any "depends on WATCHDOG_CORE".
Fortunately, there are no such dependencies. There are a couple of "depends
on WATCHDOG", but they are all "depends on WATCHDOG" followed by "select
WATCHDOG_CORE" as it should be. So we should be fine; any watchdog driver
built into the kernel forces WATCHDOG_CORE to be built into the kernel as
well.

I'll try to clean up my series and send it out this week. It requires more
than one patch since there are some dependencies on the pretimeout code.

Guenter
