Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B385AA24F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 14:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732114AbfIEMAu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 08:00:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730767AbfIEMAu (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 08:00:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5DD121883;
        Thu,  5 Sep 2019 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567684849;
        bh=1xeBfYskUOKOC0SaWvO+Y+ILr+BecrmFnTQs8zVFl50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O7ZKkc1lP219Poi6xqKaQgcEbNWBZjpRM+hT8SY5Se9MidWdhWqCTwhjTpGjpN4nD
         WCMVt5asF1oqgG8825623EO5kDyielgIOW8VGBywGk3lFfl9Jf8Kmivv59G3O4o9QU
         cNKDVjNSLQ6OC6TBoVcwdmsHfBrC4iHpgxsw7pBA=
Date:   Thu, 5 Sep 2019 14:00:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jessica Yu <jeyu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Maennich <maennich@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Martijn Coenen <maco@android.com>,
        Sandeep Patil <sspatil@google.com>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules@vger.kernel.org,
        linux-usb <linux-usb@vger.kernel.org>,
        USB Mass Storage on Linux 
        <usb-storage@lists.one-eyed-alien.net>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Subject: Re: [usb-storage] Re: [PATCH v4 12/12] RFC: watchdog: export core
 symbols in WATCHDOG_CORE namespace
Message-ID: <20190905120046.GA7952@kroah.com>
References: <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com>
 <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
 <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
 <CAA6KcBBeP9xYbVws4=RMFNA4kyrodE-R3mifhbkee-Q+jFRcoQ@mail.gmail.com>
 <20190905104147.GA27788@linux-8ccs>
 <CAK8P3a0rf0PhXK1RdF1mWTyGggBJeH0h0YOCxDvJFgxu8wmWKw@mail.gmail.com>
 <20190905111617.GB27788@linux-8ccs>
 <CAK7LNATBWCTJ-FXydob5FUYMymsqCxhenBynb2_NfJdSC2yGDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATBWCTJ-FXydob5FUYMymsqCxhenBynb2_NfJdSC2yGDQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 05, 2019 at 08:25:32PM +0900, Masahiro Yamada wrote:
> On Thu, Sep 5, 2019 at 8:16 PM Jessica Yu <jeyu@kernel.org> wrote:
> >
> > +++ Arnd Bergmann [05/09/19 12:52 +0200]:
> > >On Thu, Sep 5, 2019 at 12:41 PM Jessica Yu <jeyu@kernel.org> wrote:
> > >> +++ Matthew Dharm [04/09/19 09:16 -0700]:
> > >> >On Wed, Sep 4, 2019 at 5:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > >> >HOWEVER, I have one question:  If these patches are included, and
> > >> >someone wants to introduce a bit of code which needs to use two
> > >> >symbols from different namespaces but with the same name, can that be
> > >> >done?  That is, if driver A has symbol 'foo' and driver B has symbol
> > >> >'foo' (both in their respective namespaces), and driver C wants to use
> > >> >A.foo and B.foo, can that be supported?
> > >>
> > >> As of now, we currently don't support this - modpost will warn if a
> > >> symbol is exported more than once (across modules + vmlinux), and the
> > >> module loader currently assumes exported symbol names are unique.  Do
> > >> you have a concrete use case? If there is a strong need for this, I
> > >> don't think it'd be too hard to implement.
> > >
> > >I think what would prevent this from working in general is that having
> > >two modules with the same exported symbol in different namespaces
> > >won't link if you try to build both modules into the kernel itself.
> > >
> > >      Arnd
> >
> > Ah yeah, you are right. I only tried building an identically named
> > exported symbol in a module and in the kernel, and there I got away
> > with a modpost warning. But this breaks when building the module into
> > the kernel, so I guess this is out of the question.
> >
> > Thanks,
> >
> > Jessica
> >
> 
> 
> The cover letter starts with
> "As of Linux 5.3-rc7, there are 31207 [1] exported symbols in the kernel".
> 
> Whether or not we apply this patch set,
> we will have to carefully maintain them
> so that 31207 symbols are unique, anyway.
> (And, we can do this with allmodconfig + modpost)
> 
> So, what is the point of the namespace,
> where it does not loosen the scope of uniqueness?

It does not "loosen" anything.  The problem is, we have 31207 exported
symbols and no one has any idea how they are "clustered" :)

Ideally we would have separate namespaces where we could "keep" others
from accessing symbols that are required to be global, but we do not
want anyone else to use them.  But we have C, and we need to live with
that.

This is the "next best thing".  This provides a namespace and a marking
by the user of that exported symbol that they really do know what they
are doing.

The USB storage exports are a concrete example of this in this patchset.
Those symbols are to only be used by other USB storage drivers, and they
are marked that way here.

This also gives us the ability to start to actually understand what our
different exported symbols are for.  Right now the USB core exports a
ton of stuff, but who is expected to use what?  Right now any USB driver
can use any of those functions and no one notices.  After this patchset
is merged, I will start to "carve up" the USB exports into different
"namespaces".  One example will be the functions only for use by USB
host controller drivers.  Then if someone submits a new driver that says
"use the USB host controller driver namespace", and that driver is _not_
a USB host controller driver, it's a huge red flag that something really
isn't correct here.

Some other USB functions will probably get marked "USB core only" or
some such thing, and then to use them you have to say you are importing
from the "usb core only" which again, is a huge flag that you are doing
something wrong.

So on it's own, this patchset doesn't do much.  But it gives us the
building blocks on which to start to make sense of those 31000+
different exported symbols.

As an aside, this is something that I know I and others have been
wanting to see happen for 10+ years now, and I'm very happy to see it
show up in a workable form as we have known this is a issue for a very
long time.

Hope this helps explain things better,

greg k-h
