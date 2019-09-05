Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7A19AA018
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 12:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387941AbfIEKlz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 06:41:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:39376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731215AbfIEKlz (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 06:41:55 -0400
Received: from linux-8ccs (nat.nue.novell.com [195.135.221.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8503A206BB;
        Thu,  5 Sep 2019 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567680113;
        bh=f3g6+GkFfq7dsW3Hcfdj3HneqZPXcFMZ8t3cgR3qUcw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cxyT0NCRQWEW0CzJzXAKo/7ZeMnS91FwRcZR6V2djERXI2dpN9lo6kUNOwDCKqSN9
         +cwK/irArqaUooaX6It16R2kiGAZeIOM5GO2r0wJjuyVPaiYm5PqRdPBDrAgecqkEB
         o4pc6bNQO33ZjIl7KaHnCnv5U5WRXIE9dnMY9p/Q=
Date:   Thu, 5 Sep 2019 12:41:47 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Matthias Maennich <maennich@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        maco@android.com, sspatil@google.com,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules@vger.kernel.org,
        linux-usb <linux-usb@vger.kernel.org>,
        USB Mass Storage on Linux 
        <usb-storage@lists.one-eyed-alien.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [usb-storage] Re: [PATCH v4 12/12] RFC: watchdog: export core
 symbols in WATCHDOG_CORE namespace
Message-ID: <20190905104147.GA27788@linux-8ccs>
References: <20180716122125.175792-1-maco@android.com>
 <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com>
 <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
 <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
 <CAA6KcBBeP9xYbVws4=RMFNA4kyrodE-R3mifhbkee-Q+jFRcoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAA6KcBBeP9xYbVws4=RMFNA4kyrodE-R3mifhbkee-Q+jFRcoQ@mail.gmail.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

+++ Matthew Dharm [04/09/19 09:16 -0700]:
>On Wed, Sep 4, 2019 at 5:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Note that I don't object to the patch set in general. There may be symbols
>> which only need be exported in the context of a single subsystem or even
>> driver (if a driver consists of more than one module). For example, a mfd
>> driver may export symbols which should only be called by its client drivers.
>> In such a situation, it may well be beneficial to limit the use of exported
>> symbols.
>
>I can appreciate this benefit.
>
>> I am not sure what good that does in practice (if I understand correctly,
>> a driver only has to declare that it wants to use a restricted use symbol
>> if it wants to use it), but that is a different question.
>
>I think this question implies that you are coming from the perspective
>of "security" or wanting to restrict access to the underlying
>functions, rather than wanting to clean-up the way symbols are handled
>for manageability / maintainability purposes (which is the goal, as I
>understand it).
>
>HOWEVER, I have one question:  If these patches are included, and
>someone wants to introduce a bit of code which needs to use two
>symbols from different namespaces but with the same name, can that be
>done?  That is, if driver A has symbol 'foo' and driver B has symbol
>'foo' (both in their respective namespaces), and driver C wants to use
>A.foo and B.foo, can that be supported?

As of now, we currently don't support this - modpost will warn if a
symbol is exported more than once (across modules + vmlinux), and the
module loader currently assumes exported symbol names are unique.  Do
you have a concrete use case? If there is a strong need for this, I
don't think it'd be too hard to implement.

Thanks,

Jessica

