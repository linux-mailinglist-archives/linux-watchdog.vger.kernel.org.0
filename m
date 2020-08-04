Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2B223BEA2
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 19:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729933AbgHDRJd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 13:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729628AbgHDRJb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 13:09:31 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1D8C06174A;
        Tue,  4 Aug 2020 10:09:30 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id c16so22883724ejx.12;
        Tue, 04 Aug 2020 10:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TmsN7b1e8rX4AEr8yauDRsn4mhsHXmUyeaZarjIQThg=;
        b=SAAlZINXTshQ5UICKXaibx5ndHSbTF9K1YpfnT5oRyj4GQRzF93RaHqvDn3XUZb7pf
         4orEEGGY44v7pppzWPG8L67xQLJslDm7GVCHbWi/kbk20IZtmTJ4dwzB0f9E6DGOzbJM
         iGfq/DI41YnTvO/UbAviX67Ab1aI8aJE5+XFDuaeLJ5H0Dhlf3qo7FabyNeCDu1GG4sa
         sxEfO1jD7Fh9r3SQ18M2ZR2jrCCtRA0ZXL00ehn8hWcs/78j07cGXgkj05Pww4p5Z3e3
         kCvPnezHEdfb51XPzV86QnBmHRli+kuJhb1pO483tUPcv3NTnMa5YULH0DLJ2cbKqcSZ
         Wl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TmsN7b1e8rX4AEr8yauDRsn4mhsHXmUyeaZarjIQThg=;
        b=UpGtXKU9t7OLyHIJdI3z5mvyd0LknImCXVJLu1WLT6r1+M2lA2QGl6n/6hqQ/JRWoc
         89iS2hBrTi4wU4iv8xFNUFFRezSoZCIxxHQl9ge6law2kPLg9G6XYRYkGya4oa6puv0/
         74guAqhr5WRTi1m0Iy5PquDpiz16iiDI1D6gFizpYj+kHqMDWNdOFVUGt4HfCEk7a/q8
         XfSABn8zDHTjFHAJOv3INwfuBrCMLfJ1yspFI1GzCTm8JlPoShXJhXTgnaR9cbEeOXSQ
         wmQSIQH+HAJtC8TgNROc0bh8YM3ARvb1Rh4f0zkVuE/AuTbRZ1wlF2ZK4UbFc8hhenrc
         f47Q==
X-Gm-Message-State: AOAM531aVp4UGmr4DGAW8AyF9wSxBbuM127Cz7Tm4hitlr2YFn2FYgj/
        vEuTAFy/gaglZwPRx4ugkXeUo4pzJYqpkfCPI/8lHKxRqA==
X-Google-Smtp-Source: ABdhPJx8Vxg+h2i9MEAYwONcjbEsNnD8gW5IFxNM/SlRiTssVc6oOKBlbPfhsZh6ZmLZt3RqSDqL3qX3aZw58AVcjFM=
X-Received: by 2002:a17:906:26c7:: with SMTP id u7mr21715410ejc.13.1596560967679;
 Tue, 04 Aug 2020 10:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMciSVWzH3fuo8eStwRUwGJ+VsJjctLucOZo-EVx07ktXzObFA@mail.gmail.com>
 <83ff62ab-42c8-df6c-32c1-c1df2f8cda7a@roeck-us.net>
In-Reply-To: <83ff62ab-42c8-df6c-32c1-c1df2f8cda7a@roeck-us.net>
From:   Naveen Kumar P <naveenkumar.parna@gmail.com>
Date:   Tue, 4 Aug 2020 22:39:16 +0530
Message-ID: <CAMciSVVq7LL+c6Va1xqcCfMMMqcM9+3DXsOi+6cyqjPfdLgpGA@mail.gmail.com>
Subject: Re: iTCO watchdog last reboot reason?
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 4, 2020 at 9:45 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/4/20 7:41 AM, Naveen Kumar P wrote:
> > [ Please keep me in CC as I'm not subscribed to the list]
> >
> > Hi everyone,
> >
> > I enabled the iTCO watchdog in my Linux system.
> >
> > sudo cat /dev/watchdog perfectly reboots my system. But, is there a
> > way to find out on each boot if the machine was rebooted due to a
> > watchdog timeout or not?
> >
> > Any ideas?
> >
>
> If the hardware supports it, the driver could set the reboot reason
> in its probe function.
Thank you Guenter for the quick response. Can you please point me to
the corresponding patch?
>
> Guenter
