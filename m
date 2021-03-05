Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8901E32F0F8
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 18:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhCERRd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 12:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhCERRS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 12:17:18 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2B7C061574;
        Fri,  5 Mar 2021 09:17:18 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id o38so1814689pgm.9;
        Fri, 05 Mar 2021 09:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vZxE5LzIm/RddZNFPKbHI1Yzxy5Rt/JdUUrNbKPK7BI=;
        b=jEia3TtZZen5UCXozTnq88z/B2DGZZGIJ3YW3T+2SXfKJEA0rM4psv5uXEF1V39hCL
         qRSKzH0qzqgn2b1+movpUs2jw9XKGe4KCIrHJPQqLNQ2x0BJLff8TV68FXE8tbLzGIav
         MGcs+yjNoKYScYMZVn7guxt2y01fK8OkrzFdcjCri/ww1DwbhUhmukWgURVwHa7hDk0p
         gtr2tohcHS1XOjMQOve/oMw3cTgS7wC9PbPsT83clQf/hOK34izBA82CGqwzJY72bGDJ
         uAnEOHA9C1jTECVtehQllJpN14NPM1Ok17ESdrkp0hPKveg0rXiQJk8pixroqAsuka3e
         Obbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vZxE5LzIm/RddZNFPKbHI1Yzxy5Rt/JdUUrNbKPK7BI=;
        b=uFTbxnuKJfAupP6Y2sAndwBViEtzbPp+N/qp/7yZty/D3xneXIi4ifNbhEk+gtGXv3
         jKWMlXPiUtE/IeT1J6F/7QaIfHKdsdbePw5EUFRrhPogyxKUk19LYNUFZkXAb+51WS2W
         UmkzJCCCaDNP5gcmImr5+1GzhXtNR2oCol9kqn/zkPA9Q//TWM/0nvU0ek3vdHeAQMmY
         kHK2zYkALv69PVEig4Y9RG9nThFmxggmKdNc5NIIcBdlBTChVd5XcPSkf4b0c6WR+S0/
         VDDVIJmDXIhVVcN6mkaFknmB1KAeilGewLToyfSm59VGQmInjdYAR4DFSnoqFPoBaeI1
         cmFA==
X-Gm-Message-State: AOAM532q8EEaKup7W03e8V/swTvyBoxq6rgI74ObKoprVwkuJ7U9ZrXm
        mfqADx/kLbYAy7xDDAuOSoHjhSYH/J80l91bE/s=
X-Google-Smtp-Source: ABdhPJw9/fsHyYEzsLX5qxp4uZa+zw7PCC/wyECwYZalmkooiW7ZcrJ3kd92+1dkVcydp1hyk4+DTLZCpNV4f2lfiWI=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr9734082pgf.4.1614964638082;
 Fri, 05 Mar 2021 09:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com> <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com> <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
 <20210305174223.11537d42@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210305174223.11537d42@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 19:17:01 +0200
Message-ID: <CAHp75VdssrnvGn+Qs6Ua72MSFrTCHOCMBdPEAfmGFp1RrwdJ+g@mail.gmail.com>
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

On Fri, Mar 5, 2021 at 6:47 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Fri, 5 Mar 2021 17:42:42 +0200
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede <hdegoede@redhat.com>
> > wrote:

...

> > [1]: https://gitlab.com/andy-shev/next/-/tree/p2sb
>
> That is a little weird, might be a good idea to RFC reply to the cover
> letter of this one. To allow review and discussion in a central place.

I'm now rebasing it to be more presentable.
If you can test this approach and it works for you, I'll send a formal
RFC series.

-- 
With Best Regards,
Andy Shevchenko
