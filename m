Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292AC3D5913
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 14:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbhGZLV2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 07:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbhGZLV1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 07:21:27 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7CBC061757;
        Mon, 26 Jul 2021 05:01:55 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso10933806pjq.2;
        Mon, 26 Jul 2021 05:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GzBBeBEG2I3c3crBDfXQEQ5kzRjfq24R4BAGmuXvWWU=;
        b=gCJS5NEOrRvScm/8FVibKGDhelwS71Pry7E50FmAMOHCAAarCdL+Ga9vF9oNN1i7g8
         cy/vMJNnczDxM/43XG9bp2t4WmEFOxxZz3unblGCMaHrfb3ivHdx1UB3UHOWnhm02uB6
         kXLohfGx+jQ/MZHvWJJh9mcSLvimX8VFJZvsgvXg1Ks725sWzeD4rF76UpyJbT0KW2e8
         39cqdZ54czF49VbbvgqjXkYKmHBaX2/Q8zNZywnSrS7g5O4LIQ9i5FJltiN/fQ5+fHsl
         a8vXbNRwWeEXh4ERnHPJnRKiv0Q3+2udZCOIGUJzEKwlath6+O+O03EB1XkT7IUrm7KE
         Wr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GzBBeBEG2I3c3crBDfXQEQ5kzRjfq24R4BAGmuXvWWU=;
        b=jvUiqRd37v/DyUUe7oAXJYXrTGHQaEsNev2dx++O9Wx3pFDI52fwZDJcHQFmkAJkeX
         JdsZfODDb4u17dIEgkqNozh1elkPCj9jgkgAhXqHGzsRWo5GFB7e5lVch/cjlyh9+UuH
         czHJO64nFIVfSHRpf12GFwUw4oyLk6va25yJkDZreji+ZGzjz2PUSD3MoIW/ATDTrc+q
         S48DIUr1nc5P5YWqfKoftM8j7SKGPmwCBtqsrbEOUeP0f3WkU4Oq/KFT8CxW7Yk1B7rq
         HUFdUOwm8e8pOMwl4wUTuWJQl/Sp/MrOhnGMaBS79h8h1Vrr8uR2fwN2TK0Qqq+JJEOt
         KweA==
X-Gm-Message-State: AOAM531tTcT9eK/6V4BkEwD/NM8/yk3Xzpsa8KlRQeFFRsu0N7ajoapR
        zWWq/PUegkcqE0bPDHUwIvLU6KyId5sZJwbk2nE=
X-Google-Smtp-Source: ABdhPJyB2BKCnP2+rcK4n/9y4TpIQMA15cc8+ubH/h186alhP0biluPgRCwbpEOa5xBnt0BzGGFmfvFxzEYhizcSQrI=
X-Received: by 2002:a63:5a5b:: with SMTP id k27mr17981056pgm.74.1627300915172;
 Mon, 26 Jul 2021 05:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
In-Reply-To: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Jul 2021 15:01:15 +0300
Message-ID: <CAHp75VfCydLguFX=MSoAQ_gayra5ovuwLxcY7m_pHiafvB7b5w@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 2:46 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> Obviously, the test needs to run against the register content, not its
> address.
>
> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second=
 timeout")
> Reported-by: Mantas Mikul=C4=97nas <grawity@gmail.com>

> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Missed SoB of the submitter (hint: configure your Git to make sure
that submitter and author are the same in terms of name-email).

...

>         if (p->smi_res &&
> -           (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) !=3D (TCO_EN | GBL_SMI_EN=
))
> +           (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) !=3D (TCO_EN | GBL_S=
MI_EN))
>                 tmrval /=3D 2;

There are so many parentheses, perhaps

#define TCO_GBL_SMI_EN   (TCO_EN | GBL_SMI_EN)
...
       if (p->smi_res &&
           (inl(SMI_EN(p)) & TCO_GBL_SMI_EN) !=3D TCO_GBL_SMI_EN)
               tmrval /=3D 2;

?

--=20
With Best Regards,
Andy Shevchenko
