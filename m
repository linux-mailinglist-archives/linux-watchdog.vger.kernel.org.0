Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169071C2DD6
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 May 2020 18:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgECQKx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 3 May 2020 12:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgECQKw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 3 May 2020 12:10:52 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5302C061A0E;
        Sun,  3 May 2020 09:10:52 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a7so2581188pju.2;
        Sun, 03 May 2020 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lNEP2F0m0UFazKrvCDAnOWUwZWM1bpEcCCWurLrhkJI=;
        b=a6c65hcobLfmVxvbRbTKX8Ybbiw2xzcrUQX+Pxzs2cINAgx/uZ8rO+f6gkHt9TRIrd
         wNz9EksMbNMeYfRiJaVkVLEejP/TbhB4ujAbylpQ/3Q/5lWPSfM8Jp8Fg3cHg9lGbF/i
         NtQ9rBENI9jZ9StfvJsqRFW/s/O5h1W4nal+fhmZXQUIhe4FmdTTkw+ZFmIgUaWC4DcL
         uHnfc7WuMxEhtQM3IpUm9t/YdB+SBWcnPrSW0/QE/+tg8mf66jvYITc+pmfM/0oHgWLu
         b5V1LOczH3TVW7QkM5c37m50ku6vfYdYygithN+hJd9sNp7te+BLZL9ejL1fXDDl7ptR
         NLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lNEP2F0m0UFazKrvCDAnOWUwZWM1bpEcCCWurLrhkJI=;
        b=EK1iPebmTecBLV23g2/Xp7dTQXpCPHoSNJ8rTVujwwOAltW89BRNSCNkHJoPrPiH/N
         p9i7FSmOVxY33sYConcyqoI/OYYbT7bDf3ssGfxGJBKz0s2mr6pV7bqUnAFRsSWlSjdF
         5eoDaewjKoraOhc1uB2XFlGelhLsjRlAvBM2JlWt7FGvmDzMpnEWdRTImHAx1J6gOoH8
         9PyjjLWuBUqIUugByj/ozmiAf/8KdC9abz96yNH+A8jy6gE4sJKn8Y5RF5lyMq/2BNWf
         e073CB0qSp0Ii74QYenqTJgMiVBvAOSM7S1q4QZpW7lVTdb0lkbefiiRtuH3hu5C1V5t
         zj5g==
X-Gm-Message-State: AGi0PuZnKcxBRo5h9CGI2bYmxwOgnSLrtpymL6l260ut+4VrHQlUCAGH
        rjTFVvkj4I/xyvXqZAyJD2HxLZ1fd2xquEWY9Ak=
X-Google-Smtp-Source: APiQypLoQLYQKdDpwLOr/HehPEuWMsinBA8F2qs5KS3UF3yDJKoG/eJ7YRd4Z8tbG2mQep8N+P6sIJIREU7qzqbD/uQ=
X-Received: by 2002:a17:902:7003:: with SMTP id y3mr14472271plk.18.1588522252296;
 Sun, 03 May 2020 09:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200503053424.31943-1-michaelsh@mellanox.com>
In-Reply-To: <20200503053424.31943-1-michaelsh@mellanox.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 3 May 2020 19:10:40 +0300
Message-ID: <CAHp75Vff-xe06L1xOc9jMii+kEPJZzmiPBFPVMkeD46v0QW+hw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] support watchdog with longer timeout period
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

On Sun, May 3, 2020 at 8:34 AM <michaelsh@mellanox.com> wrote:
>
> From: Michael Shych <michaelsh@mellanox.com>
>
> This patchset adds support of extended new watchdog type 3 of Mellanox
> Ethernet and Infiniband switch systems.
> This type of watchdog can have a timeout period longer than 255 or 32 sec.
> as it was before.
>

If you ignore my tags, why are you bothering about changes at all?

> Michael Shych (4):
>   platform_data/mlxreg: support new watchdog type with longer timeout
>     period
>   platform/x86: mlx-platform: support new watchdog type with longer
>     timeout
>   watchdog: mlx-wdt: support new watchdog type with longer timeout
>     period
>   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
>
>  Documentation/watchdog/mlx-wdt.rst   |  10 ++++
>  drivers/platform/x86/mlx-platform.c  | 106 ++++++++++++++++++++++++++++++
>  drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
>  include/linux/platform_data/mlxreg.h |   5 +-
>  4 files changed, 182 insertions(+), 12 deletions(-)
>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
