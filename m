Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDE93C5BDF
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jul 2021 14:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbhGLMMd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Jul 2021 08:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhGLMMc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Jul 2021 08:12:32 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF39C0613DD;
        Mon, 12 Jul 2021 05:09:43 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id a2so17991510pgi.6;
        Mon, 12 Jul 2021 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QDqsbSw5ub3US40KaqnvHwW7Q3ZUM55LG73YWMhDPxQ=;
        b=mfWDH2Fms6O77tl7wv+7hMAX1RU4P0QEfO1Kmzpexc6rH6UNwVpt0vGgWJbqIg5qkk
         5YQUiIUeTIJzTiViGp9DuxeFVP1B022YomDIm9CglhGDsn+NsaiX1m1vbBj+V6oAYEmc
         e+sTi4ArEEcfPBD2W9H3oJPfiaS7yjUW0fPTou/DnYksVFm+qbJ12a4huv7hioJ7K0pa
         KFqiBNeMPtlUClcOXMhBrOai8YuIWPfBwGY31SItmKOYLTUPpU9R/DbsXpwfwT68bm9G
         ID1Azzz3TXFDAMXNdcb36mrb/+7KGIe2gHUGObL5Lfc2OPLUm5BCBW/aRIah2wYc2yST
         Cc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QDqsbSw5ub3US40KaqnvHwW7Q3ZUM55LG73YWMhDPxQ=;
        b=JogmtmvwkRyJkfQkAI4yGV0LAKxJa5QiVgYAV2w2mJ09SH4NT3O+bMvIksfl473wmd
         T9tK9RFoYGlW5Hm/VrzRUm1NRQMkYi9i/+PMOKbdRNvEPGcn5w+TlHwhNYMQGm0PHJfH
         ETW6z+2Ha/R+uF3748jHs7SdoSzlkCLvhfpvyUYFCr5rYbA0aYrdx+5JtPV5QsEPBFuw
         MRDYizhrvMt8QwZMz4HU/37lQevV4dtYCoMJysxc1s5hli+kEeouB+84nJy3DZIVFvqT
         3/U4rb1OF3GcgDYzCBQhfZiHRP5v90oB5qexOEjGoJN8fX00xmQml8mH72AaJwy1B/6O
         lBtA==
X-Gm-Message-State: AOAM533an0uLYtKzAni/nzcSMfnrtIqK9+1OcX2B5M7PtGAjaVUTCx2E
        zs6EsC7eFnrK60F4VJcIJWm69vIvz/OCt8FDpQc=
X-Google-Smtp-Source: ABdhPJyDjntb09x1C4LNuWLUIWPpFwCw5HCcLsIodv8EQmaB5UiwWsDJXRzveYM2Mk/WiI6F1Jl4rE+HqPHUtzWTXQ0=
X-Received: by 2002:a63:d014:: with SMTP id z20mr53104677pgf.203.1626091783250;
 Mon, 12 Jul 2021 05:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <857d6cd4-839d-c42a-0aa7-8d45243981ee@redhat.com> <20210712133543.074aad80@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210712133543.074aad80@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Jul 2021 15:09:04 +0300
Message-ID: <CAHp75VfvVD20pZng_BG-ptZiYo9VBfHFe2OABo8VmtYcarfcSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] add device drivers for Siemens Industrial PCs
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
        Pavel Machek <pavel@ucw.cz>, Enrico Weigelt <lkml@metux.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 12, 2021 at 2:35 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> This series is basically stuck because people rightfully want me to use
> the GPIO subsystem for the LEDs and the watchdog bits that are
> connected to GPIO.
>
> Problem is that the GPIO subsystem does not initialize on the machines
> in question. It is a combination of hidden P2SB and missing ACPI table
> entries. The GPIO subsystem (intel pinctrl) needs either P2SB or ACPI do
> come up ...
>
> Andy proposed some patches for initializing the intel pinctrl stuff for
> one of the machines by falling back to SoC detection in case there is
> no ACPI or visible P2SB. While that works it would need to be done for
> any Intel SoC to be consistent and discussions seem to go nowhere.
>
> I would be willing to port over to "intel pintctl" and help with
> testing, but not so much with actual coding. Andy is that moving at all?
>
> Since my drivers do reserve the mmio regions properly and the intel
> pinctrl will never come up anyways, i do not see a conflict merging my
> proposed drivers in the current codebase. The wish to use the pinctrl
> infrastructure can not be fulfilled if that infra is not in place. Once
> intel pinctrl works, we can change those drivers to work with that.
>
> I do not want to take shortcuts ... but also do not want to get stuck
> here. So maybe one way to serialize the merge is to allow my changes
> like proposed and rebase on intel pinctrl once that subsystem actually
> initializes on these machines. We could even have two code paths ... if
> region can not be reserved, try gpio ... or the other way around.

Bjorn suggested exercising the IORESOURCE_PCI_FIXED on top of the
early PCI quirk that unhides P2SB for the entire run time. But I have
had no time to actually patch the kernel this way. Have tried the
proposed approach on your side?

-- 
With Best Regards,
Andy Shevchenko
