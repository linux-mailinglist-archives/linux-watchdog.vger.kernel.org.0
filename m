Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5AE63D5C24
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 16:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbhGZOML (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 10:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbhGZOMD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 10:12:03 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E72BC061757;
        Mon, 26 Jul 2021 07:52:32 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so20141222pjb.0;
        Mon, 26 Jul 2021 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m3xpMmUPfJolIS+5CjbpSMuRxohhjfYkDp6XjZyRBZQ=;
        b=pGQYnl4oGXEByzzMsb0w0zmp77B/i1uknvDqyCbFOJxOQIWRYUZvmGrwciCXupnXln
         zmik2mMR+qrsjtsNd5RunMXhGHRau9fS8+pD/Cr898s2VgD25n+8AATuhWwO3HOcRPvP
         2uqhBV/2DHgcENfxTGTBFrpGTIz5/+oua94vO7pGHn7FbCba6eHqpzSwRedON6TqO5Xt
         5PYFeo2TeclaLqPxTn1r5P1MqUvYnCZ85JsExsOzfPb57T1aUAo+9hetY4WFxaYkf+HB
         Xh0DoX/hI7R14qG8HD9pDa0f0S5vnImGAmhJgLvdUBmA9fyob1EOcIS9BvwNdvbcUhCP
         sOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m3xpMmUPfJolIS+5CjbpSMuRxohhjfYkDp6XjZyRBZQ=;
        b=GWALT46T4GE2KPv5VP1PEuVptv+PjKxkPOPDADSG5oG0nFA7OSzNy8jf8FFl3nnoZc
         ucVaecxXAUJJBrIOD9wpq8YPD6OG+oU8WrIV1HaJcnzDusukhgnDKG0nrrkDC1tG2zvn
         zSTTGvB+hGT5TNJY+0FR39QpIMAFXqczDuFUoPZhDiio/JTexsHI6/b/ZXScVhNVogpg
         6w9kfBifEwLvA0EE6b/AUIYRglny0FGH5oolxziEllFa5XcnqQF/MNmQohRV7CA3Rej0
         y+ldAf+bZpo5h0A0es5WNkpZUfcM6aib0E0jRtnUtTq6AUspspu857rZIYFxM3JmhERg
         26NQ==
X-Gm-Message-State: AOAM533UFXgeSttgZWXfQIBcbYTuwrpCv4YNQRNgyKYqAfppJaKiG08A
        7ISfjWiJslv3jiD2r7ahgQv4yztQq7dY0V1Tp/Q=
X-Google-Smtp-Source: ABdhPJzo6wvSDeqPCLR41YgBPF9qGXVGP4xehAhbQY5QsLrL3b8irccgpK4ZM24HKvlXJ3lfu/CfGK1UOFKJVqh2Lmc=
X-Received: by 2002:a17:902:b713:b029:12b:b249:693f with SMTP id
 d19-20020a170902b713b029012bb249693fmr14661633pls.17.1627311151494; Mon, 26
 Jul 2021 07:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
 <CAHp75VfCydLguFX=MSoAQ_gayra5ovuwLxcY7m_pHiafvB7b5w@mail.gmail.com>
 <c1c15112-b102-570b-1432-568ca219ccf9@siemens.com> <CAHp75VdYUUqVi6rd6C-W+1aTXCPs7ehSLDcRfo4RVe7XU+6c+A@mail.gmail.com>
 <521d14ad-8952-7ef9-3575-b48cefeb8241@roeck-us.net> <84665dcf-f036-f059-61a4-cea5087ace2d@siemens.com>
In-Reply-To: <84665dcf-f036-f059-61a4-cea5087ace2d@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Jul 2021 17:51:51 +0300
Message-ID: <CAHp75VdqS5QUwq=25RGKOiPRfcNzNxG9kNMtP-2-=z4EAnUi8w@mail.gmail.com>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 26, 2021 at 5:05 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 26.07.21 15:59, Guenter Roeck wrote:
> > On 7/26/21 6:40 AM, Andy Shevchenko wrote:
> >> On Mon, Jul 26, 2021 at 3:04 PM Jan Kiszka <jan.kiszka@siemens.com>
> >> wrote:
> >>>
> >>> On 26.07.21 14:01, Andy Shevchenko wrote:
> >>>> On Mon, Jul 26, 2021 at 2:46 PM Jan Kiszka <jan.kiszka@siemens.com>
> >>>> wrote:
> >>>>>
> >>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>>>>
> >>>>> Obviously, the test needs to run against the register content, not =
its
> >>>>> address.
> >>>>>
> >>>>> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on
> >>>>> second timeout")
> >>>>> Reported-by: Mantas Mikul=C4=97nas <grawity@gmail.com>
> >>>>
> >>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >>>>
> >>>> Missed SoB of the submitter (hint: configure your Git to make sure
> >>>> that submitter and author are the same in terms of name-email).
> >>>
> >>> The signed off is there. Not sure what you are referring to.
> >>
> >> Nope. It's not. The sign of that is the From: line in the body of the
> >> email. It happens when the submitter !=3D author. And SoB of the forme=
r
> >> one is absent. But what is strange is that reading them here I haven't
> >> found the difference. Maybe one is in UTF-8 while the other is not and
> >> a unicode character degraded to Latin-1 or so?
> >>
> >
> > I have no idea why there is an additional From:, but both From:
> > tags in the e-mail source are exact matches, and both match the
> > name and e-mail address in Signed-off-by:. I agree with Jan,
> > the SoB is there.
>
> There is one unknown in this equation, and that is the anti-email system
> operated by a our IT and some company in Redmond.

Hmm... The From: in the body is the result of the `git format-patch` I beli=
eve.
So, two (or more?) possibilities here:
 1) your configuration enforces it to always put From: (something new to me=
);
 2) the submitter and author are not the same (see also:
https://github.com/git/git/commit/a90804752f6ab2b911882d47fafb6c2b78f447c3)=
;
 3) ...anything else...?

> But I haven't received
> any complaints that my outgoing emails are negatively affected by it
> (incoming are, but that's a different story...). If you received
> something mangled, Andy, please share the source of that email. I'm
> happy to escalate internally - and externally.

I believe I see it in the same way as lore, i.e.
https://lore.kernel.org/linux-watchdog/d84f8e06-f646-8b43-d063-fb11f4827044=
@siemens.com/raw

> For the potential case they were mangled or in case I'm submitting via a
> real email provider, my scripts always add a "From:" to the body of my
> patches. Outgoing, that From matched my Signed-off.


--=20
With Best Regards,
Andy Shevchenko
