Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE7C5A2CEA
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Aug 2022 18:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239748AbiHZQ4u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Aug 2022 12:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240471AbiHZQ4t (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Aug 2022 12:56:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46AB7CB50
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 09:56:47 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id d18-20020a9d72d2000000b0063934f06268so1409198otk.0
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fa3h0ngSSKLcUwa0g73xazfhWHPCsQ3XlS59njOyh9Y=;
        b=RpGFrkGK7SF6OT5jZFy6+LeTeu5zrQDm4ejNSIJLXYwRv6lDoS8JkY5TNA5wKbPP8e
         Jg622kDjIozLWh264KUmNioOb3PRLP0tS3yBBh7BA4uN8+uv7xAKGb6q1Vp4pYv8iol4
         j5vBasXdcYcG9THXbpKrvbENi+vgMjMyPEh7oKTXzPN8DzAKo8gtUjZliTK4eFrh8xeO
         kgW1Lk3vrczceD2uk1sB3jwa3h4yNO54IEyhCT/nvF+OTfgxv0U9Bf42ToHAoXNo6Kdf
         ibCJeYa27tfaYxs/LsvILBY60wzp0r3z0NSFFxoXG+C2ts3rKS2/ZdJalinSY0hHaEIL
         GgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fa3h0ngSSKLcUwa0g73xazfhWHPCsQ3XlS59njOyh9Y=;
        b=Ome/tBYYKNxTZVE5ATMITGkusHJ9qJjhdgHEQjDHdiE8h349UkYY/9w2o8C5wAWD+d
         vhWxUqULi0dURWlllOB7p0Q9MlJPHppdL0v6CxmTNCyEh3SSzgN+XTEOpL2uaTdUy3uE
         /HoCE+VCjYAjcFi3z1w4izYHCSjNGrFRXgWFxbB0pVFtMAedDIYrpZS/JPifs1+dAdtE
         hqTAZVXekoPRu+pqOlwSu8UMlG/eyWfbQ0QxCkAlfVRrLLOWTqxPyCqSZx0zhxcrXyo9
         PSQm7LBj2cxbpQ2G9LU0n6muj7yMbngQHe0nbP5bgqwdUlsb4FbySTXIjLgTICDryM/s
         FhwA==
X-Gm-Message-State: ACgBeo1ZiLgDbH9Eb/+BQuQVCE0NwobXDstRNB4vBkAYa/18oqftvFcK
        mQFmzGxQ4cqmE5NO2/GkQt8q9uU3U01tpo9A+PnD3NGdFJfKcw==
X-Google-Smtp-Source: AA6agR7Z11Yezik97t3OhMROPSMLnmJR5udmc9GgV4L2RJWbjNQniCjhurUrZfMs8GniOlvIBPpqMA6WdbJlPIHn4MU=
X-Received: by 2002:a05:6830:2014:b0:639:2b01:7dac with SMTP id
 e20-20020a056830201400b006392b017dacmr1749200otp.168.1661533007229; Fri, 26
 Aug 2022 09:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220826135638.3751835-1-saproj@gmail.com> <20220826161235.GA2900848@roeck-us.net>
In-Reply-To: <20220826161235.GA2900848@roeck-us.net>
From:   Sergei Antonov <saproj@gmail.com>
Date:   Fri, 26 Aug 2022 19:56:35 +0300
Message-ID: <CABikg9y+BQT=MWQtkMRbM3P2JBLDrKUXeiSDiki3A_RNMSbXHQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: add _restart() function
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 26 Aug 2022 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Aug 26, 2022 at 04:56:38PM +0300, Sergei Antonov wrote:
> > Add a missing _restart function to watchdog_ops.
>
> The restart function isn't "missing" because it is optional.
>
> > FTWDT010 resets system when it is started with timeout = 0.
> >
> > Signed-off-by: Sergei Antonov <saproj@gmail.com>
> > ---
> >  drivers/watchdog/ftwdt010_wdt.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
> > index 21dcc7765688..9eaaaca1094d 100644
> > --- a/drivers/watchdog/ftwdt010_wdt.c
> > +++ b/drivers/watchdog/ftwdt010_wdt.c
> > @@ -93,6 +93,13 @@ static int ftwdt010_wdt_set_timeout(struct watchdog_device *wdd,
> >       return 0;
> >  }
> >
> > +static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
> > +                             unsigned long action, void *data)
> > +{
> > +     wdd->timeout = 0;
> > +     return ftwdt010_wdt_start(wdd);
>
> While technically correct, this crates the impression that
> ftwdt010_wdt_start() might return an error - which it never does.
> Given that, I would prefer
>         ftwdt010_wdt_start(wdd);
>         return 0;

Why loose the return value? My code lets it propagate. It is
potentially non-zero.

> Also, did you make sure that interrupt support does not interfer with
> restart ? We don't want to get an interrupt when the watchdog fires due
> to a call to the restart handler.

No, I did not test watchdog interrupt on my hardware (don't' know yet
how to set it up correctly). I only tested that restart restarts the
hardware as expected.
Now that I think of it, it may be more precise to do
gwdt->has_irq = false;
before calling ftwdt010_wdt_start()
So that WDCR_WDINTR flag will not be set and the chip will not trigger
an interrupt.
