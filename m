Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0FF32F1A2
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 18:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhCERpe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 12:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhCERpO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 12:45:14 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E641C061574;
        Fri,  5 Mar 2021 09:45:14 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id kx1so2290967pjb.3;
        Fri, 05 Mar 2021 09:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JyWkAjyLm630j3rLL6KQnp7/1uSINIlHE/tZlt3ZAsw=;
        b=HA3CJSfIc/D+Dc62KR0OycnXvnBxuf1k++2TQ1WBH3jR5DVqOHop+lPLFMcV6wWdLZ
         XNVrjlEicxLEp2EbMLKx1YSjwfqX7ukoHWdegWysr3SWbJJbkutW/8s1wWd437O2LL7B
         Sc3B1Fl9qnoLMTihS2DZRs+82uFezRAu4WVJYQ4PZcjK3VmczG2Y3bWHr6RsXj5HxlWz
         0Swy1Abu1qnKNJwjkzssMo5iZiG3ZJQ+NCotALB/O6TS1WMf8duzyaIHSAM2yIlKQqTQ
         JI2LdyBEJdDn2lcWdeqDkD4kv8TEO7nyVoDszKQWD1hUgYv7vh9xWdGxRtIYklw6oebk
         NIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JyWkAjyLm630j3rLL6KQnp7/1uSINIlHE/tZlt3ZAsw=;
        b=Ho2sV4Wv49O5H/jKAIDQPoK4n+aTc2FcxT7ljTGvyU3MeaEmAytgj/n0MP3W4Vqqv2
         Xn+efYpllm8CtxsCLYHFCBF0V+8UEougtbg2NAehsKxgZlkDJYnRAKf0o9k97vI0/4LX
         ZgaVXgqNNnxcK/op43bNm/gq8AuvTJGXUV2Qworgt2KXXj2xaWO6cESACTYpaAi5f8eB
         S8sW/IXNAEbC1Qts44Of/4KL4USljyBsLTVoXpM3TYvqNZxXhCVJj/96Oy21YzF9WCOM
         ypP5oo//KRL1pDntZnMVNkQRZnTfWTm1zJWInU2lfce9om4xSRqTD//Y1jxB/gn06o7H
         YQbA==
X-Gm-Message-State: AOAM53293TAMNMtqu/WjsUxrZN5ESFeA7hmk/C3LXQvUReyZMW5x6MYx
        eZCcRu0M6mXhlvBdiZl0RfjRy0mqcut62y3UeOk=
X-Google-Smtp-Source: ABdhPJx/er0WRMxLnQ2slY7MOzmmgjgZmiY2Z4ikPObbAitoBk8o7YNSHxV8F5ayoRXVpqSe5dkVR8+7F1zng/ijC4M=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr11831616pjx.181.1614966313960;
 Fri, 05 Mar 2021 09:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com> <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com> <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
 <20210305174223.11537d42@md1za8fc.ad001.siemens.net> <CAHp75VdssrnvGn+Qs6Ua72MSFrTCHOCMBdPEAfmGFp1RrwdJ+g@mail.gmail.com>
In-Reply-To: <CAHp75VdssrnvGn+Qs6Ua72MSFrTCHOCMBdPEAfmGFp1RrwdJ+g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 19:44:57 +0200
Message-ID: <CAHp75VdcBxo5emWpNy7jHLfSMfN0zWW_L_BW3Hs3_55zyn6WOA@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 5, 2021 at 7:17 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Mar 5, 2021 at 6:47 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> > Am Fri, 5 Mar 2021 17:42:42 +0200
> > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede <hdegoede@redhat.com>
> > > wrote:
>
> ...
>
> > > [1]: https://gitlab.com/andy-shev/next/-/tree/p2sb
> >
> > That is a little weird, might be a good idea to RFC reply to the cover
> > letter of this one. To allow review and discussion in a central place.
>
> I'm now rebasing it to be more presentable.
> If you can test this approach and it works for you, I'll send a formal
> RFC series.

Okay, [1] now is in presentable shape, each patch with a proper commit
message and authorship, also all patches are compiled without issues.

-- 
With Best Regards,
Andy Shevchenko
