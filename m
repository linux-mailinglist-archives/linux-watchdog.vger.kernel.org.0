Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF4C5A2E1E
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Aug 2022 20:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343808AbiHZSSL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Aug 2022 14:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344928AbiHZSSJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Aug 2022 14:18:09 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C05E3425
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 11:18:07 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-11e86b7379dso1788477fac.10
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=hrW2PNYESNfPMgii30MLtVkxKp8vSG1HVzfZYiK3QVU=;
        b=nttxs6B5hS0jXoCJdnF1J6WWR7P7nGiMTRRbQXEgvwrSsLs5Zm19d71M9/zSqJp7p8
         I3mHkMPctqwlqYH4t7hBh8gB8fbYbSps39PkbU49pJ5eGix/oTJ4Iz0PVum6V3ibGNwl
         sOKTMDaB+KJ4r+Oz9SayGuiVwtzDvZGIFdiaUqNSuwOWWaKORlEQW746dBNnF9G96okT
         Mw5KKIN3bQE97DVh+wpFcY5RD2l6su1/1esob/Z5g2FmIZYX1BJBSOxwCUe8hdBiJWS5
         WCosZ81tfa2o/Fy12dtDDpSGl/nvV7rqjNXDkbw8pVFiCgH8wpatbBRpEuly7t+JlhHx
         Jidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hrW2PNYESNfPMgii30MLtVkxKp8vSG1HVzfZYiK3QVU=;
        b=tn7btshW8p9jwSuDwhmZUjV3qphZDS06QSXTScg57iGOZxZZQZiXa4cOd+otn9OrrK
         WuMuYMBduYe/93atfgyYryCiQsvvshcXUmljjvb+jj+vpfDI4xxRNAQPl32WyDOm5vJK
         PQlAHBdbN4FXqMgrHTBqOBEZrTj4xFLwcMZF0Gd/tUJu+9fmpd5dFEoALF+uePloQ2oY
         dMRzXulJKo2p8Qf6zGez6FUfe7Cre5qf6DrSar4fbuuLzio02AKqZhck7yEKi5rRrKVN
         DU+v7vK6NtN7VD+379dx4ohi5R52ofwVmIfXM7a1ZgVl6SVoaKacv7jtD/476axidMBT
         r/Kg==
X-Gm-Message-State: ACgBeo0aKyWvDeeXIn91tWXR1U3mn5caA9DK+T49/hgyVw7wZo/xW/hY
        GhFDVVxeqcx43JNyvWoaz2rvjLs7/KsBQ1KvaKzS81n+5aLJaw==
X-Google-Smtp-Source: AA6agR5mvLQhm392tpz+uT+qeMewNP6ZKQI7CYqJjrrKbBujGbl4Yz/0zFZN12fNOmcOrbsXe0yrHjhqN36D9OmZixY=
X-Received: by 2002:a05:6870:8984:b0:10d:d981:151f with SMTP id
 f4-20020a056870898400b0010dd981151fmr2396968oaq.212.1661537887104; Fri, 26
 Aug 2022 11:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220826135638.3751835-1-saproj@gmail.com> <20220826161235.GA2900848@roeck-us.net>
 <CABikg9y+BQT=MWQtkMRbM3P2JBLDrKUXeiSDiki3A_RNMSbXHQ@mail.gmail.com> <20220826173050.GA2906093@roeck-us.net>
In-Reply-To: <20220826173050.GA2906093@roeck-us.net>
From:   Sergei Antonov <saproj@gmail.com>
Date:   Fri, 26 Aug 2022 21:17:56 +0300
Message-ID: <CABikg9zNLDez84kqsdc4Eo3v-UBoG-LoPOcwLPE1Jt57vGvVXQ@mail.gmail.com>
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

On Fri, 26 Aug 2022 at 20:30, Guenter Roeck <linux@roeck-us.net> wrote:
> > > > +static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
> > > > +                             unsigned long action, void *data)
> > > > +{
> > > > +     wdd->timeout = 0;
> > > > +     return ftwdt010_wdt_start(wdd);
> > >
> > > While technically correct, this crates the impression that
> > > ftwdt010_wdt_start() might return an error - which it never does.
> > > Given that, I would prefer
> > >         ftwdt010_wdt_start(wdd);
> > >         return 0;
> >
> > Why loose the return value? My code lets it propagate. It is
> > potentially non-zero.
> >
> No, it never is. Look at the code. That is the whole point.

Of course I looked at ftwdt010_wdt_start() and saw it always returning
0. By "potentially" I meant it returning errors too in the future.

> > > Also, did you make sure that interrupt support does not interfer with
> > > restart ? We don't want to get an interrupt when the watchdog fires due
> > > to a call to the restart handler.
> >
> > No, I did not test watchdog interrupt on my hardware (don't' know yet
> > how to set it up correctly). I only tested that restart restarts the
> > hardware as expected.
> > Now that I think of it, it may be more precise to do
> > gwdt->has_irq = false;
> > before calling ftwdt010_wdt_start()
> > So that WDCR_WDINTR flag will not be set and the chip will not trigger
> > an interrupt.
>
> In that case I'd rather see a separate function which is called from both
> ftwdt010_wdt_start() and the restart function and has timeout and the interrupt
> flag as parameters. That would also address the never-happening error return.

OK. Submitting a new patch.
