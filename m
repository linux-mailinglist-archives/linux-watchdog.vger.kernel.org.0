Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41D8A7E39
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Sep 2019 10:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfIDIq3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Sep 2019 04:46:29 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:23311 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfIDIq2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Sep 2019 04:46:28 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x848kMS9010699;
        Wed, 4 Sep 2019 17:46:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x848kMS9010699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567586783;
        bh=rl11GH89ZlbuZX4guUp4Pw5JS7QAnPdbjduMTKste4M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qaQbLSu3X2Z3Psx1j5HJJJEFgFBgqUt3fTs5oIDcf7KPwOItCEKJy0GVvIHVc6IZx
         hWmxRH/hYIiLb3oVnJ5tBbdy2yOsIo5niB6VXOFO2CO2mF9YXGiWBlneWN7FKchBvI
         DXl5wVRYU2ktI8xGGyJ9k0s09qAp9zFqwD+blGJJKb2cMAnSD/f6Uj7/IyXqRVyERU
         nPCPf68u5qgEkO6kZJRvKB/omcKRqc2rUsVhcsZbc5ofvqkLQl4TfCP09fdUJK9cVu
         lrRwVu8QP84j5Nf4nOMimNXKnJwHmvAbCmCNnXxq1znMTe4CddZADvFZYATUHiDFv1
         5oaS9erWFMPGg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id q9so7139250vsl.4;
        Wed, 04 Sep 2019 01:46:23 -0700 (PDT)
X-Gm-Message-State: APjAAAXukg15R+prZUW9q4X0D85DhnG/drnHMDKW+YVB6DNtNjUYp6oN
        xKlgf7M88qtvAry2+Tn35VVijcq/JJJpE42Ov6U=
X-Google-Smtp-Source: APXvYqwoMX+iGMXtuj9+/GXZEDE/HhrJcM8ZW5hEjW8nX5c7VdUbVtMjZ3kbHt2QTmtFsrYXsZt7wEMb783MlVl7kqE=
X-Received: by 2002:a67:e9cc:: with SMTP id q12mr11685253vso.181.1567586782082;
 Wed, 04 Sep 2019 01:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com> <20190903161045.GA22754@roeck-us.net>
In-Reply-To: <20190903161045.GA22754@roeck-us.net>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 4 Sep 2019 17:45:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
Message-ID: <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] RFC: watchdog: export core symbols in
 WATCHDOG_CORE namespace
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Matthias Maennich <maennich@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        maco@android.com, sspatil@google.com,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules@vger.kernel.org,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Sep 4, 2019 at 1:10 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Sep 03, 2019 at 04:06:38PM +0100, Matthias Maennich wrote:
> > Modules using symbols from the WATCHDOG_CORE namespace are required to
> > explicitly import the namespace. This patch was generated with the
> > following steps and serves as a reference to use the symbol namespace
> > feature:
> >
> >  1) Use EXPORT_SYMBOL_NS* macros instead of EXPORT_SYMBOL* for symbols
> >     in watchdog_core.c
> >  2) make  (see warnings during modpost about missing imports)
> >  3) make nsdeps
> >
> > I used 'allmodconfig' for the above steps to ensure all occurrences are
> > patched.
> >
> > Defining DEFAULT_SYMBOL_NAMESPACE in the Makefile is not trivial in this
> > case as not only watchdog_core is defined in drivers/watchdog/Makefile.
> > Hence this patch uses the variant of using the EXPORT_SYMBOL_NS* macros
> > to export into a different namespace.
> >
> > An alternative to this patch would be a single definition line before
> > any use of EXPORT_SYMBOL*:
> >  #define DEFAULT_SYMBOL_NAMESPACE WATCHDOG_CORE
> >
> > This patch serves as a reference on how to use the symbol namespaces.
> >
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Matthias Maennich <maennich@google.com>
>
> As mentioned before, I am opposed to this set of changes. I don't see
> the point of restricting the use of exported symbols in WATCHDOG_CORE.
>
> Guenter


I agree.

I do not like this patch set either.

Anyway, the last two patches (usb-stroage, watchdog)
are useful to demonstrate
that this has a bad taste.


--
Best Regards
Masahiro Yamada
