Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E3432D094
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 11:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238418AbhCDKUr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 05:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238413AbhCDKUl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 05:20:41 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FB8C061761;
        Thu,  4 Mar 2021 02:20:01 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id i14so6248757pjz.4;
        Thu, 04 Mar 2021 02:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WNUHUqaKo4AACk4/HP99Le3h45ECSkpHnOCYCf1c8j8=;
        b=NGEE40RmNFsUcCVgBTWBN44Sc4X4xlPudgJNKHJqPSCi7V85F/HbvLxBIimhNUNEnC
         l7EclRNFIdX38cbMqI5RvKtHdiw+6E/FAbyMWvp4hNRC+8rrzMZlniyuins1tBqykyYx
         sHETsnjX4Rc5SOHvvaO3BCGBFbMlOFaSSN6zln2o9PtZ/vqpC62XR+g66tZkQ5tzrOWG
         sCH429Y1zr/Qp0cxDEr2AcjjFeAhH/lygBaRlP3sgTI4MesvPf12yYMcDELIj7o98YSJ
         MMBgtw/oh8rPEBO1MLqHDdldyBncUxQmYVrhLyjRl1zFSVaJz4K838YZfDf3S91e5iGk
         /yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WNUHUqaKo4AACk4/HP99Le3h45ECSkpHnOCYCf1c8j8=;
        b=KWzM/uiMEBIYBEhUQZJO+GrePIkusjiBrX/gth0QTFkvG/m8YX0Vf6Wkmtzlh6g+ER
         qGppiS2FRRqO0FGv7zL7DZq2mXzDYBOuTfxcZtG4DksLW593A7EQ9UOlUtY0JkgC1qhR
         6EBHzuVbBxUo2wgzQKEEu7+GHG86JPrDAf3CLcQRu/py4zyLqrQch/YLqD4Mod1NuNen
         f8HxdQ6NZpB5oypQCJCbAkj04u6qtArRaktg926cg4Weo8N4b/MSIFEotj7eFhyfDsbs
         mXVhNY7jKLAk8pvTJJmAJnnWHZFWfu0/2UADTIOdCHO6untfBowARuHVxSilkdumkR30
         vXKg==
X-Gm-Message-State: AOAM531guHchEioYsBGNdeJE4xM3SwL5yYgZshdMVxYgJlezM8RprUB/
        NJVyC4NmtO7Zl+5NHaXjIr4z4qpIvYaKLkIEk3U=
X-Google-Smtp-Source: ABdhPJx3TJFPc3LVmusCej4X0Px4qU3fxVZ4yZ/0HFHesCkrLwkdoOAcD82G1HVJXjnbjeJsDgi7DxnPG1mujPmzZIo=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr3909806pjx.181.1614853200659;
 Thu, 04 Mar 2021 02:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
In-Reply-To: <20210302163309.25528-1-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 12:19:44 +0200
Message-ID: <CAHp75VeYN_q0OVoTGQ5fe-08exfGgpM3-ohG8iF4D8B_fKar=g@mail.gmail.com>
Subject: Re: [PATCH 0/4] add device drivers for Siemens Industrial PCs
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

On Thu, Mar 4, 2021 at 9:29 AM Henning Schild
<henning.schild@siemens.com> wrote:

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
>
> But the idea here is to share early, and hopefully not fail early.

I have given a few comments here and there, so please check the entire
series and address them in _all_ similar locations. As I have noticed,
I have different approach about P2SB code, I have to give the series a
dust and see if you can utilize it.

I would like to be Cc'ed on the next version.


-- 
With Best Regards,
Andy Shevchenko
