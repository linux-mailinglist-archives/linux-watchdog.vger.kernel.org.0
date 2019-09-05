Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E51AA08A
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 12:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731666AbfIEKwt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 06:52:49 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33583 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731142AbfIEKwt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 06:52:49 -0400
Received: by mail-qk1-f193.google.com with SMTP id x134so1669578qkb.0;
        Thu, 05 Sep 2019 03:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=czu/PiAww9XB7MKWzR+JeGUBiZd6i1YW50nMibpRMWM=;
        b=j/zbY3qjes+eq84DBlsk8mjAVM105toekpTzBuS6OtnEz0dVOPUFCuI2lZ2/wUmrmG
         MvwDr+IUweEWy9VEGvO4dXd6JLwiSCiitAUFJOMwTNmYX60TtsIKa9ngpUdpHTELCZWm
         AaR3696z3UjISIbYbfGm/FPFloSzAeUjpjKeBYGOzW9urXfaid+qa73DvwLJvIL9RzDA
         felNku8qskV5yuDj2DSzJzR3wTbLPbf8gxyOaNAop/XgOHqTQhXKNcNJA1h0XuVNOlmP
         HwAOGOV98nlP9ADevlcbOq9HxwvJjNZ5tI0Y8W73d44Ka6hojAdN7vCHCxiDJzY4vIIK
         bgYg==
X-Gm-Message-State: APjAAAUYYxYmPxPSxZ9/DdqIgU5/LTTJ9EW9TV53ehupMYQR99GGhfiE
        cMaurOBvtJB0Yw8SnHnblfqqaNQq6dvf0RFfRRtyfYho
X-Google-Smtp-Source: APXvYqyWZAErLRRjeUfF4GBmDqw5BjqZwUk6wIq3IU37cmxKozkYm8OYw3tcuu+1lbgZCEgiOlU+bPW0faEIHGV3BB4=
X-Received: by 2002:a37:4051:: with SMTP id n78mr2082165qka.138.1567680768377;
 Thu, 05 Sep 2019 03:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com> <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
 <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net> <CAA6KcBBeP9xYbVws4=RMFNA4kyrodE-R3mifhbkee-Q+jFRcoQ@mail.gmail.com>
 <20190905104147.GA27788@linux-8ccs>
In-Reply-To: <20190905104147.GA27788@linux-8ccs>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 5 Sep 2019 12:52:32 +0200
Message-ID: <CAK8P3a0rf0PhXK1RdF1mWTyGggBJeH0h0YOCxDvJFgxu8wmWKw@mail.gmail.com>
Subject: Re: [usb-storage] Re: [PATCH v4 12/12] RFC: watchdog: export core
 symbols in WATCHDOG_CORE namespace
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Matthias Maennich <maennich@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 5, 2019 at 12:41 PM Jessica Yu <jeyu@kernel.org> wrote:
> +++ Matthew Dharm [04/09/19 09:16 -0700]:
> >On Wed, Sep 4, 2019 at 5:12 AM Guenter Roeck <linux@roeck-us.net> wrote:

> >HOWEVER, I have one question:  If these patches are included, and
> >someone wants to introduce a bit of code which needs to use two
> >symbols from different namespaces but with the same name, can that be
> >done?  That is, if driver A has symbol 'foo' and driver B has symbol
> >'foo' (both in their respective namespaces), and driver C wants to use
> >A.foo and B.foo, can that be supported?
>
> As of now, we currently don't support this - modpost will warn if a
> symbol is exported more than once (across modules + vmlinux), and the
> module loader currently assumes exported symbol names are unique.  Do
> you have a concrete use case? If there is a strong need for this, I
> don't think it'd be too hard to implement.

I think what would prevent this from working in general is that having
two modules with the same exported symbol in different namespaces
won't link if you try to build both modules into the kernel itself.

      Arnd
