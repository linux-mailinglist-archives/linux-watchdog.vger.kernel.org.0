Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47D6F1ACD5
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 May 2019 17:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfELPnw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 May 2019 11:43:52 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:38373 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfELPnw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 May 2019 11:43:52 -0400
Received: by mail-it1-f195.google.com with SMTP id i63so9839027ita.3
        for <linux-watchdog@vger.kernel.org>; Sun, 12 May 2019 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KPdcFiwc52qsPtlV5dMHI1Jd08Cmm56jMeKEdUqwcDk=;
        b=J3zv5gZXXSmniCcNuLAECaWzQVAvXY7tNA1qZL+quwXBbAvgTOQ9y5mwmOTKzf44oa
         zPYSzO0S4AW7MIfVEWIvaGRN/1k3+DWpaAFWlep545ydxybHYYlbWzJQjsYXMA87iQon
         qmH9agi6fbSMXVD+MOCZETCOnIjYawU86XlDO6V8OWPwj9N9h9PeKUXaOEtpsOoKGNh0
         vGRgMxeG7OzHmv+Exl2WeHtecPjXHsdvujzT+Sk9NVUW3i3bvlOE9rU1EcerdxdzrJod
         EVhedrVkPAWlDoX45Askj8tsB7kRgALLXmcuSIZO1nwJch+ScgkbL5TMk3h5agjAf4Nu
         pl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KPdcFiwc52qsPtlV5dMHI1Jd08Cmm56jMeKEdUqwcDk=;
        b=OaNAt8FGRjWpQH0+s+pT4boJM6Lj/yGm5BSRJKUJtDwe4+Bvc+TRuDgtj1CSdBpRKQ
         6viLnqgLaUFyGIKEKZwA8N+k9F4wMJK5lN5QdjbyH6gbzRZ2/Be1K3p/QdlEoBHba4QZ
         56hmbrJJAe4z2UgwIpqIv/amoW6VOdMRnNAyAcB2BAV5ASeXxyYtkT2cE7jo12jg3yjr
         wh9V/kbTZIZ7kLD4+38qpHl2iOhLlAgtSoNWwX9azYm5H7qBg7yEvp/0PG9630P2UBjm
         9HW/MDYWlMlA0GwxI9AfMl7jqVnYW+l88YPXwgdcdJnV81BxYSoErHRTat7A/GE5/Iyz
         kcxw==
X-Gm-Message-State: APjAAAXkPkBX3Wb3SUKnEM0u3L4fDCVGdS5+EwtbqotkPwHrh79WTzja
        43ATkXHJGcbhewM5+CK+WwmWKprkZGWElb3pGg==
X-Google-Smtp-Source: APXvYqy0ZBWq2Brra6vGMKlyXfSBgqCBDYCXha81661llKJZEV9C3qgGcxMEPgvaNn867o3dSHtmTdYnOZ4SCLYItZg=
X-Received: by 2002:a24:2b4c:: with SMTP id h73mr13086109ita.41.1557675831809;
 Sun, 12 May 2019 08:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Sun, 12 May 2019 18:43:29 +0300
Message-ID: <CAKKbWA5ydScNecjU1C4z72o=6ZiX1D2ik4nUe7VoiFaSF=z9nw@mail.gmail.com>
Subject: Re: [PATCH 0/5] wdt: clean up unused modular infrastructure
To:     Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        Patrick Venture <venture@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Wim Van Sebroeck <wim@iguana.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

I saw many drivers that are putting "#ifdef MODULE" around module specific code.
I think it answers all 4 concerns above.
It also covers the case where a developer made the driver available to
be compiled as a module and in the Kconfig didn't make it tristate.
What do you think?

On Thu, May 9, 2019 at 9:17 AM Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>
> People can embed modular includes and modular exit functions into code
> that never use any of it, and they won't get any errors or warnings.
>
> Using modular infrastructure in non-modules might seem harmless, but some
> of the downfalls this leads to are:
>
>  (1) it is easy to accidentally write unused module_exit/remove code
>  (2) it can be misleading when reading the source, thinking a driver can
>      be modular when the Makefile and/or Kconfig prohibit it
>  (3) an unused include of the module.h header file will in turn
>      include nearly everything else; adding a lot to CPP overhead.
>  (4) it gets copied/replicated into other drivers and can spread.
>
> As a data point for #3 above, an empty C file that just includes the
> module.h header generates over 750kB of CPP output.  Repeating the same
> experiment with init.h and the result is less than 12kB; with export.h
> it is only about 1/2kB; with both it still is less than 12kB.
>
> Here, In this series, we do what has been done for other subsystems,
> like, net, x86, mfd, iommu....  and audit for uses of modular
> infrastructure inside code that currently can't be built as a module.
>
> As always, the option exists for driver authors to convert their code
> to tristate, if there is a valid use case for it to be so.  But since
> I don't have the context for each driver to know if such a use case
> exists, I limit myself to simply removing the unused code in order to
> make the driver consistent with the Makefile/Kconfig settings that
> control it.
>
> Paul.
>
> ---
>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-watchdog@vger.kernel.org
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: openbmc@lists.ozlabs.org
> Cc: Patrick Venture <venture@google.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>
>
> Paul Gortmaker (5):
>   watchdog: rtd119x: drop unused module.h include
>   watchdog: watchdog_core: make it explicitly non-modular
>   watchdog: npcm: make it explicitly non-modular
>   watchdog: intel_scu: make it explicitly non-modular
>   watchdog: coh901327: make it explicitly non-modular
>
>  drivers/watchdog/coh901327_wdt.c      | 24 ++++--------------------
>  drivers/watchdog/intel_scu_watchdog.c | 18 ------------------
>  drivers/watchdog/npcm_wdt.c           | 13 ++++++-------
>  drivers/watchdog/rtd119x_wdt.c        |  1 -
>  drivers/watchdog/watchdog_core.c      | 15 +--------------
>  5 files changed, 11 insertions(+), 60 deletions(-)
>
> --
> 2.7.4
>


-- 
Regards,
Avi
