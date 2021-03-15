Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532AD33B06E
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhCOKzm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhCOKza (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:55:30 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09562C061574;
        Mon, 15 Mar 2021 03:55:30 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso14139257pjd.3;
        Mon, 15 Mar 2021 03:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jIF7EvU0U1TtP728imkgiBjyN2VC6Gv6fPzMn0h2Fs8=;
        b=vMomXyBWJv5gB48nMlyBCdeB5ntGrT2wSTk9scaBDwUvYQnwtGHd4e5WKRfbKgznCz
         AzvFI4Z/iGt7vBRJlpa1WJBKZYrloQjzZ+vbOE2yalF1EyG8+cWeQj0qsmjizjkc8xQg
         oNa3Zq7WU9MKMwlj/rqs2HqY1cYPXheaKvzspQe1/EZR7GYDNPdFB7u2T5b3wfkO/CjO
         TRGXaxPsju+NZMGpDt4OO0SMQ+/FEIoTGfx8enbukLh43luxYNT7Ud6nPZZFrDoyvKqE
         wpmvbMs0Rtg67JKKD7ZQrudFZcfG1g3m8wUSDNh6hCqWlhdwGz2VAFM+3b5i58iQtXJ9
         7Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIF7EvU0U1TtP728imkgiBjyN2VC6Gv6fPzMn0h2Fs8=;
        b=XAGnp3EAUrM1q4/7xZIKeoOAH6zjDNczeq5KCVC0s5kn5y+He/+K77BpFawlfHnSj8
         MvP61UP0jgg5JM1+qSShak+w0nQyRoZ7KOpU0wjQFP2efz3RWQWf1hCtVEB59SQSTB1Q
         gMIxGlTvwRI+wKzymYQ4/K8Oap6bYwhC5BlzrAj3FnDq/7Bn8hHOqKsxcyIgmKHWBl0R
         1lQJcoJjfNbUVnnLfPcd+imJ6UjxuJ9ivBgjuIyBLAcdOOEmUP0t2sFk/uzpT4B/3zd+
         1swCwJgd7US676Yr3cQxDODWE9FQ1B1YSYn4XKXCu5Z3nb8PkUGatwtYp62pdBvQ2Nmv
         zVCQ==
X-Gm-Message-State: AOAM530L4a1wKgmazHdIXl8WhvP7xHxQY3GgpTW8MWFlKE0/Zp0xt0Ps
        lfEldT+So1UPNdqh1aeb3JjGPJyOYjrkdLAYrxU=
X-Google-Smtp-Source: ABdhPJwPa8lp3UIGcZpdzkaRUTVzni8RWoRA1wtImgY50I5fMxmbBiZwzY1HS7/Tn5QWekKDNs3wj1EQTqZu3CuIsXw=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr10999285plb.21.1615805729579; Mon, 15
 Mar 2021 03:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210315095710.7140-1-henning.schild@siemens.com>
In-Reply-To: <20210315095710.7140-1-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Mar 2021 12:55:13 +0200
Message-ID: <CAHp75Vfu1PoN6bH4ew99Ct9JS=d9KSXtM0EXV_T7VF211TW-Yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] add device drivers for Siemens Industrial PCs
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

On Mon, Mar 15, 2021 at 12:12 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> changes since v1:
>
> - fixed lots of style issues found in v1
>   - (debug) printing
>   - header ordering
> - fixed license issues GPLv2 and SPDX in all files
> - module_platform_driver instead of __init __exit
> - wdt simplifications cleanup
> - lots of fixes in wdt driver, all that was found in v1
> - fixed dmi length in dmi helper
> - changed LED names to allowed ones
> - move led driver to simple/
> - switched pmc_atom to dmi callback with global variable
>
> --
>
> This series adds support for watchdogs and leds of several x86 devices
> from Siemens.
>
> It is structured with a platform driver that mainly does identification
> of the machines. It might trigger loading of the actual device drivers
> by attaching devices to the platform bus.
>
> The identification is vendor specific, parsing a special binary DMI
> entry. The implementation of that platform identification is applied on
> pmc_atom clock quirks in the final patch.
>
> It is all structured in a way that we can easily add more devices and
> more platform drivers later. Internally we have some more code for
> hardware monitoring, more leds, watchdogs etc. This will follow some
> day.

Thanks for an update!

I did review more thoughtfully the series and realized that you can
avoid that P2SB thingy and may the approach be much cleaner if you
register the real GPIO driver and convert your LEDs to be a GPIO LEDs.
Then you won't need any custom code for it (except some board file, or
what would be better to file _DSD in your ACPI tables.

--
With Best Regards,
Andy Shevchenko
