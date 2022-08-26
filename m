Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22745A2D82
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Aug 2022 19:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237259AbiHZRaz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Aug 2022 13:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbiHZRay (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Aug 2022 13:30:54 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0612DAA08
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 10:30:53 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso8698120pjh.5
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=U4N4IWUZ559Gn1BqqKuc+ghpDPpy0Ee8g1rK8qbyvIU=;
        b=YyjL1AZNYaaKB5naCWd3w0H1jwN8+tAtSlBOl3PkBwWQq5SaVkhkN+1a39IRJ+A5ei
         E1xW7K2z39XHbk7DN07p05fnj3WidapfaNLG88zWSRbTHj2j8i8Siti1Ilwj75LjpioS
         hTaHywwiFKTVT1wOxdlf/ROsLP0eQIAoAXENppoSS2Oq4bWZKiK+pqTy52dN41hoJ/s/
         FQMc8L6tTsLDwfiyx7jmR7owMLxlvCKs8JG+veVrTdouGV/GJF4FwZlpaIPbWiI9w+VI
         IqbTJH66lo9YF04aMArYqrEjbhca8W/pXkzJPd8v8BnrNNnkZTEw273Q34nFok9CpzLl
         cIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=U4N4IWUZ559Gn1BqqKuc+ghpDPpy0Ee8g1rK8qbyvIU=;
        b=N7sLom3qrfLDJppYF5ihbxN3+GmcbyTP+QYIw9ta2rz7WnznITznyUL07P2f54vXcN
         sVwzJJZ6UAjTGPyORmNE0uHQPB2ipKmvqo6b0gGO+IDgVAvKOe5ZdSjb5sTilHm/kUL+
         dkXRfUFCNz2eTlmevmKy1yoVqj9NU2Ab1HH8SNLop2i6t2dHrlD/7r5KPfVCP/m52jsX
         dKIk7XczTHTZU+ojl9lV4F4uhOVWa5tjwCEOoj5uS4wvH/t26dSBI6L25rcgdqWjNTQw
         4/j83GIaZpRm2WnrchgKs4WDzvisYOkxD8TQX+Mc/GrTKnZuoZgP2ykVl63ptjqskGNf
         s5uQ==
X-Gm-Message-State: ACgBeo3785LdK1cf3kF/1sKkesf7m1lIf2Rkobul/Au1oeWedVsaeK11
        Y6krcg1LXT45dQz3EZG7g+A=
X-Google-Smtp-Source: AA6agR5c6zHQlg91ntIAQN9O4dltEe2ZeFIzRjYf8M80DyC1DTzMVMkNG1cFxxqDWAfVXo0eF3ZuKA==
X-Received: by 2002:a17:90b:38c1:b0:1fd:6a31:a17e with SMTP id nn1-20020a17090b38c100b001fd6a31a17emr3142795pjb.53.1661535053356;
        Fri, 26 Aug 2022 10:30:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x22-20020a1709027c1600b0016f1319d2a7sm1817199pll.297.2022.08.26.10.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 10:30:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 26 Aug 2022 10:30:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sergei Antonov <saproj@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: add _restart() function
Message-ID: <20220826173050.GA2906093@roeck-us.net>
References: <20220826135638.3751835-1-saproj@gmail.com>
 <20220826161235.GA2900848@roeck-us.net>
 <CABikg9y+BQT=MWQtkMRbM3P2JBLDrKUXeiSDiki3A_RNMSbXHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABikg9y+BQT=MWQtkMRbM3P2JBLDrKUXeiSDiki3A_RNMSbXHQ@mail.gmail.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 26, 2022 at 07:56:35PM +0300, Sergei Antonov wrote:
> On Fri, 26 Aug 2022 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Fri, Aug 26, 2022 at 04:56:38PM +0300, Sergei Antonov wrote:
> > > Add a missing _restart function to watchdog_ops.
> >
> > The restart function isn't "missing" because it is optional.
> >
> > > FTWDT010 resets system when it is started with timeout = 0.
> > >
> > > Signed-off-by: Sergei Antonov <saproj@gmail.com>
> > > ---
> > >  drivers/watchdog/ftwdt010_wdt.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
> > > index 21dcc7765688..9eaaaca1094d 100644
> > > --- a/drivers/watchdog/ftwdt010_wdt.c
> > > +++ b/drivers/watchdog/ftwdt010_wdt.c
> > > @@ -93,6 +93,13 @@ static int ftwdt010_wdt_set_timeout(struct watchdog_device *wdd,
> > >       return 0;
> > >  }
> > >
> > > +static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
> > > +                             unsigned long action, void *data)
> > > +{
> > > +     wdd->timeout = 0;
> > > +     return ftwdt010_wdt_start(wdd);
> >
> > While technically correct, this crates the impression that
> > ftwdt010_wdt_start() might return an error - which it never does.
> > Given that, I would prefer
> >         ftwdt010_wdt_start(wdd);
> >         return 0;
> 
> Why loose the return value? My code lets it propagate. It is
> potentially non-zero.
> 
No, it never is. Look at the code. That is the whole point.

> > Also, did you make sure that interrupt support does not interfer with
> > restart ? We don't want to get an interrupt when the watchdog fires due
> > to a call to the restart handler.
> 
> No, I did not test watchdog interrupt on my hardware (don't' know yet
> how to set it up correctly). I only tested that restart restarts the
> hardware as expected.
> Now that I think of it, it may be more precise to do
> gwdt->has_irq = false;
> before calling ftwdt010_wdt_start()
> So that WDCR_WDINTR flag will not be set and the chip will not trigger
> an interrupt.

In that case I'd rather see a separate function which is called from both
ftwdt010_wdt_start() and the restart function and has timeout and the interrupt
flag as parameters. That would also address the never-happening error return.

Thanks,
Guenter
