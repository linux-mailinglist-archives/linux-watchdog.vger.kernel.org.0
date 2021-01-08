Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE3D2EED7C
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Jan 2021 07:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbhAHGfl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Jan 2021 01:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbhAHGfk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Jan 2021 01:35:40 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B4EC0612F4;
        Thu,  7 Jan 2021 22:35:00 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id r5so10049719eda.12;
        Thu, 07 Jan 2021 22:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z9yWM8kO/yF3fqCL5n5LCq8fF4B951xR4ABXYDaphFA=;
        b=GxYZ5/aERBYX+FmTnV/3chH3usPDq5qUsSCf/k2a2YystQU/HJsAmj7rbPy/KQtUZE
         yD4D7B6EYc95ocuEA/5x73yz5hsaeJrfSIMZlYJ49rPhWANy3qvSkCmzt9EwsPov81il
         Qei3hRnSljCzESnt/oZAXlyf+y/QH+4jjcWvA2EeBUzKEesf2C/wSXs7j6OUBm6hHUwL
         +vXFU8DBH81xQ/fU+K5fAfnCMpXJD4EaeToQ4vC1OwPKzfpCKoFYPeBVlVbGmoh/Nwnw
         WCnMiXaeVJV0UVcZuAmKF9kLcRK3rXudq+NFISCtPprfO/kQCJ7eAyLoulf/o5ZFWtZ9
         OISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z9yWM8kO/yF3fqCL5n5LCq8fF4B951xR4ABXYDaphFA=;
        b=TLJmuQ3ur9hzdv1y5IfeBCtWNsNISlUE0NpgJ5lBl49nhjRsrpH4VyERWvwD8DdJCc
         uEu5JIVAj2iVIVuK+A+poRLY/ZONd5blGeKvRjh3XQsqjf/wFzj0lWoQ/xGeaWR/4JsZ
         mg+2qhtkYXipdn9sgsXgSLbIkc8RVEqfRh5wk1uh68/xrq2pwDXav7Pu8cb7nBU1nMZO
         4gZBmcUe1jBpHzQ+QHi1/ubaWMW6UsPxUw5hzE2cKSPLqoxvGZDW4S9R12Y6ZkVW7VJc
         nOpIGXHrt1PjF85PE8zt/VM3iUZnr6Aa4sTwxkTllq1WcipdR+9zEMGSblmrbnGJKBLX
         16OQ==
X-Gm-Message-State: AOAM532XoXzEzWK27fotJiQcDWA/Qyc5/Rs2WB/KY9OGSY1YXtBStbfT
        Erp4fCGZkdaUkNhjDne2VnUe9vSpVfNjj62/Js58ebQp
X-Google-Smtp-Source: ABdhPJy9ieoFaI86x6eIWFE4vyV9chCjzWRsITSEBJIQi3E5g/iQQ6nc0j2dtbL2FWZwVUQKRwJFUk06/MdUOzy7hgU=
X-Received: by 2002:a50:ed17:: with SMTP id j23mr4230998eds.218.1610087697277;
 Thu, 07 Jan 2021 22:34:57 -0800 (PST)
MIME-Version: 1.0
References: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
 <019c196041600a00143fe16bda19b2a8f060e9a9.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
 <20210107151254.GB13040@roeck-us.net>
In-Reply-To: <20210107151254.GB13040@roeck-us.net>
From:   Matti Vaittinen <mazziesaccount@gmail.com>
Date:   Fri, 8 Jan 2021 08:34:46 +0200
Message-ID: <CANhJrGPqqb0WA0efEE0fjMEqaCwJaabyxBx2ucGhvC-JVxt7-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: BD70528: conditionally allow BD70528 module
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-power@fi.rohmeurope.com,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jan 7, 2021 at 5:12 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Jan 07, 2021 at 08:37:25AM +0200, Matti Vaittinen wrote:
> > The BD70528 watchdog module provides start/stop interface for RTC
> > driver because the BD70528 watchdog must be stopped when RTC time
> > is set. (WDG uses RTC counter and setting RTC may accidentally trigger
> > WDG if WDG is enabled). The BD71828 use same RTC driver as BD70528 but
> > don't share same WDG logic. When BD70528 is not configured a stub call
> > to "stop WDG" is implemented and in case when BD71828 is used, this
> > stub function should be called. Prevent configuring in the BD70528
> > watchdog when BD71828 is configured to avoid access to real WDG
> > functions when WDG does not exist in HW.
> >
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>
> As mentioned in my response to the other patch, I think this is the
> wrong solution.

I agree. Please forget this :)
Thanks for the review!

Best Regards
Matti

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-Matti Vaittinen

When you feel blue, no one sees your tears...
When your down, no one understands your struggle...
When you feel happy, no one notices your smile...
But fart just once...
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
