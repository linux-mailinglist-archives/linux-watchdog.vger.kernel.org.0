Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADC71C5D31
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 May 2020 18:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730206AbgEEQOW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 May 2020 12:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbgEEQOW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 May 2020 12:14:22 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58427C061A0F;
        Tue,  5 May 2020 09:14:22 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s8so1282700pgq.1;
        Tue, 05 May 2020 09:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TR420DO5TDFYZ0kRfMtDFSumabg0stTHWIXByAUnAjs=;
        b=r8WdTDSgBhXy79Qrfb9kOrWbKqyfmxj/vwHwYoydbWZoKmyLKC3v7Lr1tlNlMAjfTe
         8OBU9QJ0hQCKbceq7nq9g+6j8IwhdgOwFFlxQayHEgUIALe65y1R7P/Nz4hdJ+4Qj1UL
         SoBbzV+I7/kNkvSUpmdsQx0MuAnLdShrxlnzy6ncKMbj1rwQvgsNupF3cgE9Xvu59kH6
         7EYXV0KjEx+batDldhSrEP+oSXp4XqIe7IKGi99fSa1A3mu/k7VwkIbLWy+mNsQAp1xX
         ClerjN98tesLAPAdWIhmaQbSDFfX5naPFQ4/xxf1P82Wp4aKVjAAJs2copY27zqq+M1c
         4QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TR420DO5TDFYZ0kRfMtDFSumabg0stTHWIXByAUnAjs=;
        b=nX77OCCrctK0WtoCZbyscJY6C1p01XyX8cDvYsniw1lUdLK3vJw0+pysAGVv2+taz5
         nSaWTHKarVwbSZ+rBSdlMPFWVDioRDsDJ3kftLqofalqxp1uPKOijddwD0M4yGcLjd4N
         Fh8nEPX8N8PwF6qoI6hY55NLwgJR69ifkJCqJyyxFOV6662bigM7W+ok3Mg87+Ep1QTD
         S/k6Xery2Xqs/b17ev/XEoYCHunPpwhRqa4jZBqiT8qOJxV5xg5//t7oRxWdk10VEHHN
         MHVHhJU8LQ9CyPQg0MYn756oO+AAPtKeOwO3DVc+vMoxyMJP9y32r0wjDKrVNgpQ7KTy
         r3tQ==
X-Gm-Message-State: AGi0PuZOUFw4TRM0XWN+NB2nRiJmU5rkNb9HzY+MYg3OdmQsvTHPyYfi
        dGXotrqMP/zvVRgmUqmSyPuNlib4LqyBG800E30=
X-Google-Smtp-Source: APiQypJcgh6FOXhLaX5ASFB4hjFXfw9YtR0rwQq1+XHQaXgjAkXldf63zjtkVI08V+8fBi9y6dW4qXGvNRx8SvoupP0=
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr3920815pfr.36.1588695261799;
 Tue, 05 May 2020 09:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141427.17685-1-michaelsh@mellanox.com> <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net>
In-Reply-To: <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 19:14:15 +0300
Message-ID: <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] support watchdog with longer timeout period
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     michaelsh@mellanox.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
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

On Tue, May 5, 2020 at 7:09 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/4/20 7:14 AM, michaelsh@mellanox.com wrote:
> > From: Michael Shych <michaelsh@mellanox.com>

> > Michael Shych (4):
> >   platform_data/mlxreg: support new watchdog type with longer timeout
> >     period
> >   platform/x86: mlx-platform: support new watchdog type with longer
> >     timeout
> >   watchdog: mlx-wdt: support new watchdog type with longer timeout
> >     period
> >   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
> >
> >  Documentation/watchdog/mlx-wdt.rst   |  10 ++++
> >  drivers/platform/x86/mlx-platform.c  | 106 ++++++++++++++++++++++++++++++
> >  drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
> >  include/linux/platform_data/mlxreg.h |   5 +-

> Guess the big question is now which branch to use to take this series.
> Thoughts, anyone ?

count(watchdog) = 8
count(platform) = 6

Thoughts?

-- 
With Best Regards,
Andy Shevchenko
