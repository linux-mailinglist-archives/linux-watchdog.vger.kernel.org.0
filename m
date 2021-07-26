Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEFA3D68DF
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 23:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhGZVFo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 17:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhGZVFo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 17:05:44 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3750EC061757;
        Mon, 26 Jul 2021 14:46:11 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id k4-20020a17090a5144b02901731c776526so966236pjm.4;
        Mon, 26 Jul 2021 14:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgtEAFRQu+sQ8IDAKmaF4skCHu48KSCADIk8RQevi5Q=;
        b=GL+nD5Mq9JnEvF4bRlZpwJKRrcxN6t/wb5RMdDsJJzi3PN36saiYHdk0KDLjcDcx42
         8IfuTBccuiAXHfcFCwRocIylIzU8fsrxBEuj44+0Rcs/o/nG3JCIdHULN1bLJSmAjVK7
         KMC0SpkZCyMTPPonEXvq5zFjud4WkRKLHqo8Y5kXoOo+IOl1VqYz7r3QfUbLc1A0Bd+E
         P6Kjqw0TOKu7JRt84jrd0F+uPb3MVwpNXTuWKGhmlOybNKfjEZfAmPvVyJ/YPVRHG2fF
         LAiUiHRtHIryF6ODxnXknWh4L/jWwnb+f9F9Sgbyqkh+wsjuoqt0VRNeX0ueydlvmESG
         y58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgtEAFRQu+sQ8IDAKmaF4skCHu48KSCADIk8RQevi5Q=;
        b=KklXD62gPGXP0B8W/JLZQ58hFKYlECF0hgzxvs+yXIo2lhKRACMmK+m1A2NDRuAsGl
         VL9WGagafr3ImukYxzNiR8O6dRMPQRYMS2V4GZEzuCnhlxIi++Eyd/0de1ws27IPqW7y
         WeYfTbyCeGL/1RDd8sXRcQCEGAL9QoHpvX4VAI8g6cI0VvgN9r9c36gtWSefqsbC9BO/
         PtLhyEUIz2fPJ1aXuwPbYpMst2mEv1WOtjFFYEW8CwEPrT2R8Qas6Le4OiEk9YK6yp3K
         tIHTccrNu8/+sNnKpzNzWeBAekI9k/CkOckLVVlYRKeCQ2lC1z2kcYX90/PyEUxVuRf8
         CBuA==
X-Gm-Message-State: AOAM5301iOz6ayj5+gzHmC7MtxdVkPg0bg0LR9baw80Axaj+huOXCiRX
        Z9qxDWyAj2uqC/8YTuuFwErp4bz+y3oxg5oieno=
X-Google-Smtp-Source: ABdhPJy23DiaMNR6XxYqmNcvXGF+5IGqShyobbp3qUd9QQ8fzGsxAZL8u1aHxcYCWG194M1q/xqwlraeaULNhym2PvA=
X-Received: by 2002:a17:90b:3647:: with SMTP id nh7mr19133195pjb.228.1627335970764;
 Mon, 26 Jul 2021 14:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
 <CAHp75VfCydLguFX=MSoAQ_gayra5ovuwLxcY7m_pHiafvB7b5w@mail.gmail.com>
 <c1c15112-b102-570b-1432-568ca219ccf9@siemens.com> <CAHp75VdYUUqVi6rd6C-W+1aTXCPs7ehSLDcRfo4RVe7XU+6c+A@mail.gmail.com>
 <521d14ad-8952-7ef9-3575-b48cefeb8241@roeck-us.net> <84665dcf-f036-f059-61a4-cea5087ace2d@siemens.com>
 <CAHp75VdqS5QUwq=25RGKOiPRfcNzNxG9kNMtP-2-=z4EAnUi8w@mail.gmail.com> <175ca7d9-254b-ca35-359c-a077b284c9fa@siemens.com>
In-Reply-To: <175ca7d9-254b-ca35-359c-a077b284c9fa@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Jul 2021 00:45:34 +0300
Message-ID: <CAHp75VeuP5pC3oT84KP-uVd=q+u0cSg0vzoa3zaWTuS59PZ6aQ@mail.gmail.com>
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
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 26, 2021 at 8:10 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 26.07.21 16:51, Andy Shevchenko wrote:
> > On Mon, Jul 26, 2021 at 5:05 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >> On 26.07.21 15:59, Guenter Roeck wrote:
> >>> On 7/26/21 6:40 AM, Andy Shevchenko wrote:

...

> >>> I have no idea why there is an additional From:, but both From:
> >>> tags in the e-mail source are exact matches, and both match the
> >>> name and e-mail address in Signed-off-by:. I agree with Jan,
> >>> the SoB is there.
> >>
> >> There is one unknown in this equation, and that is the anti-email system
> >> operated by a our IT and some company in Redmond.
> >
> > Hmm... The From: in the body is the result of the `git format-patch` I believe.
> > So, two (or more?) possibilities here:
> >  1) your configuration enforces it to always put From: (something new to me);
>
> Yes, it does, as I explained in my other reply. That's a safety net
> because you never have full control over what some mail servers do to
> the first From.

I see now. Thanks for your patience and elaboration, it's all good then!

> >  2) the submitter and author are not the same (see also:
> > https://github.com/git/git/commit/a90804752f6ab2b911882d47fafb6c2b78f447c3);
> >  3) ...anything else...?


-- 
With Best Regards,
Andy Shevchenko
