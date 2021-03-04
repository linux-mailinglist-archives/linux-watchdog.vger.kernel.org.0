Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CA832D018
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 10:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237964AbhCDJwA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 04:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237846AbhCDJvt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 04:51:49 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB5AC061574;
        Thu,  4 Mar 2021 01:51:09 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d8so5410889plg.10;
        Thu, 04 Mar 2021 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W9jHcnwXDaxPMdEitaMFrpEp1sfjFYbFNwckX35HAk0=;
        b=FiN5D7CN5Yd1lIwD4ahgeYb2Uy2hGkKGZ5EaGOhJfrlyhZ+eHlcTebcnzkgRe7r6ha
         D2/mBq/GXUbuYVAv9lK6utWBTpyF4Lbes0WMnXH8NyNZqgcAVaLJmCB/yCVG+QTEhZgj
         mwmTKSQucHq9VpEy42jFnM7j6Ymuytu21aMB3alT2iLoV6hFMTlRSXwZT+E2zDgkiMjT
         3z/2DCTLBm82OtYXQjuK7feQ3Pkj18hhRWC9JplMZDYs9U/eTJMXd3dZfhGf3YCg2o+m
         lLeh6SY369KWM0rAmxWmMz02CKdiPnPz3yr0AaosK+K9nIR+HYDQgfT0jHGM30CezhqU
         agAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W9jHcnwXDaxPMdEitaMFrpEp1sfjFYbFNwckX35HAk0=;
        b=HPcH446aeVbfu69a5SmroCGUbmMBcExxs4X6ExGucOT+BRf0yiu/kiTdQx37HKU9Vn
         jVAyJOt5C0QegxUp0zTjAAQEr52WgbbfKmbEdbNc09w3/8Xj+mY/2UsfNTxbqi7dkzeV
         WK2ybxcuFdWVqFm/vlWA8ALDzyadq6NOEvQ2sXZjov6Lg5fI6Rgmr/THG2fjtgq/xdhi
         WrhkPtVxDDcntzHlne9A4dqQK+4YgpWFjdT4U44fzRgWYfjK28Y0/UYW1CuvqpUQgZfm
         BFLEen3TQ+l/W2pwl8yUXDK3H7o+fEQJ/X83uC2vzJZfhDEKr+FicIbamcFfYl95xugw
         fsRg==
X-Gm-Message-State: AOAM531ofb3tXZSmmKTq/kSZxZZATUKqoaBlaOpkWnWKgN6kNQIxH5Nj
        hIcebHvdj0D+lxqv7/TAh62+ubjhmxavh+pEo3s=
X-Google-Smtp-Source: ABdhPJxUbb/E9yTMNDNFXwo9Poqb6WZSvJPzIkeSmdfHji+Jz1z4UnqLCGfAYbje7AZCj6en5/39JpFfnD79fxeTjJM=
X-Received: by 2002:a17:902:d2c1:b029:e5:ccfe:1e93 with SMTP id
 n1-20020a170902d2c1b02900e5ccfe1e93mr3176148plc.0.1614851468698; Thu, 04 Mar
 2021 01:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com> <20210302163309.25528-5-henning.schild@siemens.com>
In-Reply-To: <20210302163309.25528-5-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 11:50:52 +0200
Message-ID: <CAHp75Vf1gkb+qWhv7a5Q3Bf-brDkMsOKdFo4ckSpG2e-7bqWng@mail.gmail.com>
Subject: Re: [PATCH 4/4] platform/x86: pmc_atom: improve critclk_systems
 matching for Siemens PCs
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
        Pavel Machek <pavel@ucw.cz>,
        Michael Haener <michael.haener@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 4, 2021 at 9:27 AM Henning Schild
<henning.schild@siemens.com> wrote:

> Siemens industrial PCs unfortunately can not always be properly
> identified the way we used to. An earlier commit introduced code that
> allows proper identification without looking at DMI strings that could
> differ based on product branding.
> Switch over to that proper way and revert commits that used to collect
> the machines based on unstable strings.

> +#include <linux/platform_data/x86/simatic-ipc.h>

> +static int pmc_clk_is_critical(const struct dmi_system_id *d)
> +{
> +       int ret = true;
> +       u32 station_id;
> +
> +       if (!strcmp(d->ident, "SIEMENS AG")) {
> +               if (dmi_walk(simatic_ipc_find_dmi_entry_helper, &station_id))
> +                       ret = false;
> +               else
> +                       ret = (station_id == SIMATIC_IPC_IPC227E ||
> +                              station_id == SIMATIC_IPC_IPC277E);
> +       }
> +
> +       return ret;

Much easier to rewrite it as

if (strcmp(...)) // BTW, do we have a dmi_* helper for that?
  return true;

if (dmi_walk)
  return false;

return station_id == || ...;

> +}

Maybe instead you can rewrite it as a callback in DMI table which
changes a (global, yeah) variable that you simply reassign...



>         if (d) {
> -               clk_data->critical = true;
> -               pr_info("%s critclks quirk enabled\n", d->ident);
> +               clk_data->critical = pmc_clk_is_critical(d);
> +               if (clk_data->critical)
> +                       pr_info("%s critclks quirk enabled\n", d->ident);
>         }

...somewhere here?

Like
  clk_data->critical = global_var;
  if (...)
    pr_info();

It seems it will reduce burden on a callback by dropping strcmp() call.

-- 
With Best Regards,
Andy Shevchenko
