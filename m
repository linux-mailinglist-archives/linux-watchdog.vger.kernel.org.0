Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C3F32EF4A
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 16:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhCEPq5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 10:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCEPq2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 10:46:28 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84012C061574;
        Fri,  5 Mar 2021 07:46:24 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id t26so1642039pgv.3;
        Fri, 05 Mar 2021 07:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=muCAXGAvU7U6CydZyOpIw9jA7JSUHT7smxOg5sT0Iu4=;
        b=oK/JTGO9g/Kqmjh7yZGHpTRLy7NU7mwA+lz78s/XEs/QNITOxoL06lXGuopF8TdAaT
         bThPRVQwOHHLkhAYf+VGPHelC8KxAAZ9QW9pt8QE6CJRd94VK6m4TS7Ix8dwuAQuch+n
         4lkWHtqDVAn7V6Wp9WzQE/25ThawjSO8Fvs/m/YYNICg6eEzzOStZUgTkHqjYhehXrv7
         l1W0ouBZ8qO4F5/yBGEyS4kXf+j5FyegFIuBrwFkm5w2lxj93/y/Q23b2O5t2kp4kLim
         MK/oi+iWrNQP1+rVIAX8QVAQGwfPIF6Mg1kBrkiI9PRChB5ozSny2x4QEq7RzJQMGzKj
         Oitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=muCAXGAvU7U6CydZyOpIw9jA7JSUHT7smxOg5sT0Iu4=;
        b=lCQwN/+ZlhNb0HW7r69yvnf1LryX6QoBA1dSoW+A+b9y6CffVRtoNB5bSIGKvySzKG
         hCagubrT9zBkryND98WsJHkdK9bSxOOrlnFWwGYFYkzyAoQsF5WmJqS86xNpA8XxYa+/
         wvVtdTLpgmNoG9GwioCohdd0KVpQzdj05PpQzjaghT5GV8kwZXWibvE/fc4TYSrj8/pi
         SDuALzn3I0CjJKzsW47BhikUuZV4O5qDE2Rv6N2hvmha1cJZdUS5NuzCswhAskHspAcl
         HtiiQF1v9eL0M5ekWwVe0jf195vCZOtn8YS7hvZSybAI0j2sDcgUagwjlYNs+UCYbh5F
         1uXw==
X-Gm-Message-State: AOAM533w+L0QnYGenOEkfq5HJfCyvHBeHYA0gD4sBMJA6ZFU0j83g5V6
        dysrnPGqlIIjwRIBTdBeTkyY+NtQN2YPIBWi2so=
X-Google-Smtp-Source: ABdhPJzSV4Q6Z0YSwoEA7dUi1pGDFzx5WuUAebZOgL5FO1zhN6yUNDZ4E9YhH2FMIeAcAjBB93H1hy44336bIttHZzw=
X-Received: by 2002:a62:1ad4:0:b029:1ed:b92c:6801 with SMTP id
 a203-20020a621ad40000b02901edb92c6801mr9236300pfa.7.1614959184089; Fri, 05
 Mar 2021 07:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com> <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <20210304204242.08b4c064@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210304204242.08b4c064@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 17:46:08 +0200
Message-ID: <CAHp75VfR+jOsikZMQDOVx4ZGmU84VitckQVQnwNJfpQbCCt-Rg@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 4, 2021 at 9:52 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Thu, 4 Mar 2021 12:11:12 +0200
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
> > <henning.schild@siemens.com> wrote:

...

> > Check for the rest of the series as well (basically this is the rule
> > of thumb to recheck entire code for the comment you have got at any
> > single place of it).
>
> For some code Gerd is the author, and i am the co-Author. We even have
> Jan in the mix at places. At least in copyright headers.
>
> I will remain the committer for the three of us. And since i do not
> know exactly what the problem is i will add only my Signed-off to avoid
> confusion.
>
> Please speak up it that would be wrong as well and point me to the docs
> i missed. Or tell me how it should be done.

Then make sure that you have From line with the Author (`git commit
--amend --author="..."`) and add your Co-developed-by tag.

...

> > > +       int i;
> > > +       u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
> > > +       u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
> >
> > Reversed xmas tree order?
>
> I do not get this, it is almost easter egg order time. Please explain.

Longer lines
usually go
first.

See above :-)

-- 
With Best Regards,
Andy Shevchenko
