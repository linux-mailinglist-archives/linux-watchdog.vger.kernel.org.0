Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0889C1BC3CE
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Apr 2020 17:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgD1PgI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 11:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727932AbgD1PgH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 11:36:07 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAA4C03C1AB;
        Tue, 28 Apr 2020 08:36:07 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l20so2555063pgb.11;
        Tue, 28 Apr 2020 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=47/IKu5NcN48zokcEkCuU0Ibnk7c4G0KllSpA5jpEXg=;
        b=BRhyMcJ8Fm3fFROWFd6GPam53RdFNs6yOE4jMBHrieKKdwd7DzksDMZrVESd53FNOH
         Hc6AU9U1eZV63fZLzteSw2Tr4D++/Zbie0ree9Fok2fZKZMGvdpk3gAuQL1VZYoZ1gSi
         FBrkf9X1ZBCFZpZbEA+EvksZtamQtZBa4fsgmAOS04VRsVk4Wkwc9S3aHNLdLd9xvDtO
         1QI7Q41PpPndAZDcEoQ42+LdL4laE95om89tIAaPXImCZMPUq8/OfDBNrHVgD4QWG6/Y
         Hc4e9ajMiGnEz7uXMb1LPkzjMxUWleQ7nUx1MwB0D2D1e+gQMh9dtPfCb8ZjlDX62OVb
         Z8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=47/IKu5NcN48zokcEkCuU0Ibnk7c4G0KllSpA5jpEXg=;
        b=Ph42VBU4xuyHD5uVJTdKGQ7JcUGq3ONH050Z60wGIn6ZRAPwFGQLvMJ0TXsawWZvSE
         uIzJHN7re2dLoVb8pYfmU1q6kfFepBq7raULbh4PEABMmUV9SL5g6DFG/86MaQOl3SwX
         Fm0WyTLnDLpSfjECLoE3k9owvtYC7YJPDCuk5TCSgtABny3g+vZrkf5Oj9hA2UWk359I
         908hD2AEmR0zxlmoHT16rYtMgGYnEe6u01nE4oHdIaOYmsZbiBgDci+QPy7NzHXXOZL6
         vOsEUzAxnw/uuVwFPAt+BHacTpeQ/KdgyJLOymcc4bJmZM5ob/+xeBkwvc8sy4btNA8B
         Cxag==
X-Gm-Message-State: AGi0PuZ3MEU6L4MjJCnXq7hoGPVv92JXG1ghAObFJ4pIxKZdMyybftz3
        eKomqLoIkSJPCkA/eMLTPvJ/T+Ys7vqLyBpTvcU=
X-Google-Smtp-Source: APiQypIiwRcZyqamaoyII4of/pYVXVo9MalYv/fXia9WK+JRC5qUmdVe2lmsiapfwJP8qVaHcDIFK2jsjw2t5jAN0MY=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr29987668pgb.203.1588088167227;
 Tue, 28 Apr 2020 08:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200428130816.582-1-michaelsh@mellanox.com>
In-Reply-To: <20200428130816.582-1-michaelsh@mellanox.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 28 Apr 2020 18:36:00 +0300
Message-ID: <CAHp75VdxGO55sGvMizzZrLfs-sdmEBmDj5nRXYn_wQ=GugexYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] support watchdog with longer timeout period
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

On Tue, Apr 28, 2020 at 4:09 PM <michaelsh@mellanox.com> wrote:
>
> From: Michael Shych <michaelsh@mellanox.com>
>
> This patchset adds support of extended new watchdog type 3 of Mellanox
> Ethernet and Infiniband switch systems.
> This type of watchdog can have a timeout period longer than 255 or 32 sec.
> as it was before.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

for PDx86 bits.

> Michael Shych (4):
>   platform_data/mlxreg: support new watchdog type with longer timeout
>     period
>   platform/x86: mlx-platform: support new watchdog type with longer
>     timeout
>   watchdog: mlx-wdt: support new watchdog type with longer timeout
>     period
>   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
>
>  Documentation/watchdog/mlx-wdt.rst   |  12 ++++
>  drivers/platform/x86/mlx-platform.c  | 106 ++++++++++++++++++++++++++++++
>  drivers/watchdog/mlx_wdt.c           |  75 +++++++++++++++++++++----
>  include/linux/platform_data/mlxreg.h |   5 +-
>  4 files changed, 186 insertions(+), 12 deletions(-)
>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
