Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16CA83D5A88
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 15:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234161AbhGZNCH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 09:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233903AbhGZNBd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 09:01:33 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B919C061757;
        Mon, 26 Jul 2021 06:41:26 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso2598pjf.4;
        Mon, 26 Jul 2021 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=86rnBHji9Xk7NcgifSarZEp/toeYNcQuiSn6nVGy4jI=;
        b=BsfxXeWHHatzRFSCVSXTdXPDLk1Ots3pqTmqFAI115TTo+Zo2p2z1f5yHtCVyZJO3v
         6iJnkeWyUvFXtOKQxzzPndHgbgAT+zETR8dI0mkcLG2Z9YiuxGXDXC4XT0DfnAIqXJ95
         u5VDpb932B7swQ9r1WXwYxgIPst2b8FjOOcW4tPmuiuWVlBAsixtD38sTrAqHwsaXSOR
         efBqNPeH/DvtTplRKtJ/c+AOuM7hCeiNw5Vt+MM+8ZWcg1i/kU0HaCujVVujz2jsCMhf
         QqLiha147kf3nz9m5naLWB795yp1aD/rSsGvt20utJ5HhPyiL3t/dt+mhgEejkLFUJGF
         Pmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=86rnBHji9Xk7NcgifSarZEp/toeYNcQuiSn6nVGy4jI=;
        b=jnnMQAp80B0mtySDjhwHuxMVc8pn2wLabJjwSR77VuTWNCSWIKfwNJNgjp6fdamsHe
         Cv1tDmXbNBSo3ITjSDgyxpg8rMlqFcc/QFu7xZXvKXsOD4uDcS6SwpAwen7aKkV0Pt05
         Gexn9Uj4D8/lOfn5BMyaqb7kKqzz7exhehrfU/N5X2GLrOzeKr6AyoKbu2HLswWcrGcR
         qenqBlHz5DDCPJgoKWDj+lfmiqjEEBy2rh01izaHBRUuxatCd5rFxg3F0aL7/MFZvB98
         lziG/RpFKYjFBw5G+pgy6wvRd3WgbxvXROtJNj+/GShk8LWiv8/0WHrwAivfLH2lh2vS
         Tovw==
X-Gm-Message-State: AOAM531RzDz4+FNK03wF4606gBLTRy0nwcIJpHGRr8LuZmD9nqW3P/p3
        yawTrizH7Ysr6Swufk/MxX0kQV8gFtD5GuUaVrE=
X-Google-Smtp-Source: ABdhPJzEXc2js49a534TAA/L9dTGjfTDfJsyWqiSyFNh72SEYXOKzinkpjCDr6CdAxWVGoCoEt7XWoCfyYPuOSk+Dbc=
X-Received: by 2002:a63:5a5b:: with SMTP id k27mr18348648pgm.74.1627306885943;
 Mon, 26 Jul 2021 06:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
 <CAHp75VfCydLguFX=MSoAQ_gayra5ovuwLxcY7m_pHiafvB7b5w@mail.gmail.com> <c1c15112-b102-570b-1432-568ca219ccf9@siemens.com>
In-Reply-To: <c1c15112-b102-570b-1432-568ca219ccf9@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Jul 2021 16:40:46 +0300
Message-ID: <CAHp75VdYUUqVi6rd6C-W+1aTXCPs7ehSLDcRfo4RVe7XU+6c+A@mail.gmail.com>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
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

On Mon, Jul 26, 2021 at 3:04 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 26.07.21 14:01, Andy Shevchenko wrote:
> > On Mon, Jul 26, 2021 at 2:46 PM Jan Kiszka <jan.kiszka@siemens.com> wro=
te:
> >>
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> Obviously, the test needs to run against the register content, not its
> >> address.
> >>
> >> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on sec=
ond timeout")
> >> Reported-by: Mantas Mikul=C4=97nas <grawity@gmail.com>
> >
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >
> > Missed SoB of the submitter (hint: configure your Git to make sure
> > that submitter and author are the same in terms of name-email).
>
> The signed off is there. Not sure what you are referring to.

Nope. It's not. The sign of that is the From: line in the body of the
email. It happens when the submitter !=3D author. And SoB of the former
one is absent. But what is strange is that reading them here I haven't
found the difference. Maybe one is in UTF-8 while the other is not and
a unicode character degraded to Latin-1 or so?

--=20
With Best Regards,
Andy Shevchenko
