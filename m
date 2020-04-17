Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937D01ADE9E
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Apr 2020 15:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730656AbgDQNmA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Apr 2020 09:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730597AbgDQNl7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Apr 2020 09:41:59 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25F6C061A0C;
        Fri, 17 Apr 2020 06:41:59 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u65so1088958pfb.4;
        Fri, 17 Apr 2020 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9M/Oo/XUQFGMWJFPYaEqrZUbE1nLWNcARmCrEzYadGk=;
        b=YULvyl6MWSCpi6WgwQIA1qIWmr9+3IWDTprh6BYUTQBiUeDT0zKnSkZjanU81u0G86
         pzf7nntCcSkkumI1VKhcQrIVh0Q3I2kDYwz42Q3y03Yffym8Rjns8wjU9wPKqbja5NSp
         kDPoAu+V22JMqPTyUSASPsl4qNVeAR+NgUlKv/KHaRosXPa0FWH6/DhYneXJRGvwyino
         +CfpJxdoTEe9vOw77sgGBVjaqi+ZYrb4ETaJkdWZ868bquXzsG3pL0bXB5yv8ISnZDY9
         PEh7VE0PrIXMHtslBi2xiKxJNv7omyzdUiAtyeHpmQCm6BmYhZZL3Q9qXn301lOWUDy6
         tX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9M/Oo/XUQFGMWJFPYaEqrZUbE1nLWNcARmCrEzYadGk=;
        b=FRo0a27CIfbJmjveEWDGHlDCCe8YYJrEMhQ9NJP6CCQgkzcPydtEB0cuKO0Ew0Od4f
         5ijjexJTI/9+reG8WGXjULLkSP5K9S+oaXmocZG8RFSo9lPhx0Kqr1ewB97iYJQb/I7T
         ksfqUzVXTWu5kGht1wcm1eLsyvIHsDo5AyzKv643zsBG9dGDu/TygeqOcUEXe7+M7Lfo
         CsXJ9z4P2eS23b9VCVorVUDdbMipO/qWNiWuozP/y/nQKrMZYNhtX7uEGG2Jw3JT9U7g
         YwHIRuKwJZxMTcxXNoyZFv9795C2Ar31EDOMwDispSIq9IIquq3SoyzPrml25W6xBgLP
         YcKg==
X-Gm-Message-State: AGi0PuYEl8rXQGh0yindFyBkacma1r9HXWNj4VJNhFoXMOLeTo+uc79Z
        7AIVgEdtKr+VSq1iamv2lH/hZMypaj1D/07PS3cxlmVtF0aVVswm
X-Google-Smtp-Source: APiQypLwYOPdJB7yiiqSUXqnPoCxm/gpgXHq5MuvnuVXdkp9IVbHgRg463lBElUE1ePppkt7NtZFmmYy8nLU5ZhgWLs=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr3223682pgb.203.1587130919388;
 Fri, 17 Apr 2020 06:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200416163514.7334-1-michaelsh@mellanox.com>
In-Reply-To: <20200416163514.7334-1-michaelsh@mellanox.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 16:41:52 +0300
Message-ID: <CAHp75VfZLR0an_bkD0vK6sTQSTcf_xHbAB0i7Qbod02gpV4tzg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] support watchdog with longer timeout period
To:     michaelsh@mellanox.com
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        linux-watchdog@vger.kernel.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Apr 16, 2020 at 7:35 PM <michaelsh@mellanox.com> wrote:
>
> From: Michael Shych <michaelsh@mellanox.com>
>
> This patchset adds support of extended new watchdog type 3 of Mellanox
> Ethernet and Infiniband switch systems.
> This type of watchdog can have a timeout period longer than 255 or 32 sec.
> as it was before.
>

Pushed to my review and testing queue, thanks!


> Michael Shych (4):
>   platform_data/mlxreg: support new watchdog type with longer timeout
>     period
>   platform/x86: mlx-platform: support new watchdog type with longer
>     timeout
>   watchdog: mlx-wdt: support new watchdog type with longer timeout
>     period
>   Documentation/watchdog: Add description of new watchdog type 3
>
>  Documentation/watchdog/mlx-wdt.rst   |   9 +++
>  drivers/platform/x86/mlx-platform.c  | 106 +++++++++++++++++++++++++++++++
>  drivers/watchdog/mlx_wdt.c           |  75 +++++++++++++++++++++----
>  include/linux/platform_data/mlxreg.h |   5 +-
>  4 files changed, 183 insertions(+), 12 deletions(-)
>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
