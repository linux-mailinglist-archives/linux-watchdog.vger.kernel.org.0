Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777B2212750
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jul 2020 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgGBPHI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Jul 2020 11:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgGBPHI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Jul 2020 11:07:08 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DFCC08C5C1
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Jul 2020 08:07:08 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id c1so5393765pja.5
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Jul 2020 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kuERFCurRHWRntvGyisJO9CuguySX5+hG0Bw5AL1HQk=;
        b=MCrpDf7ej9UyLlt9KPIkdl5wHCjlRq8p21y+FBhLqXcsQshq+1blmxelzOE6rqj3yL
         xG8rCUpuvXyj7Okny6RVWtrOQaqy0JhzZDcHT7cyeLLdeTQFjgoVf/8so8nhPh00nWRk
         kCtfcso35EGTLfDkLAYgTG7J1NL9784fnX1fgcKvuFIvIX73iqlBZzuHuppcI3W9h4Cc
         SpS9pT+Ik1WDjApLxI+N6IrI6Hqm9aQ/BI+igezkChi6aunimiaXveh5NTnSMKdslA/C
         wG5sp1tPXujrqPXbcw/fDCNAV9RXhBj4lg/PU8PSJUkWTTLFYWYHPpneUY+2jlR8aAW1
         7YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=kuERFCurRHWRntvGyisJO9CuguySX5+hG0Bw5AL1HQk=;
        b=CJ3MTZ07gD+BpzH/6zz2x+Q/GGo/2Iups9Tpc6DmUrHyuX6ri26NHmhqRz+GIFIDfM
         Q6loHjt0dRCpKmRVNZbSubL3nH0HXUvEcGR0fPdmTI2382H/WFYNCQPJZbnqECJDgZgf
         oaTFwyWBFerOIK13QElGjS6nj5nYw0PujWpa0Ar1gjOfj+j6vlx2SyZZWz75nsuQSmaw
         0T41F4bjXpAgTQ5E8d/Hm1u8r/BG3t5eCKq7ptL/fxCPIkV4UAttyd78MRHjFMX5rzZE
         UbsJNbaWKKGHwZgBq5GdAWPr2BlBIg9J3vnz+w+gVh0LZAXgNstW26glf+T1UBUD//Xb
         yn7Q==
X-Gm-Message-State: AOAM531iCnt0BCsIHbj7zpjNU0Gct/HUGrFdE0bYZr0VhtsHf5Ltch9m
        tsnbstZSCyX1OqACueM++loE/nzB
X-Google-Smtp-Source: ABdhPJx0IuK2+pBbwUWe1Z0iuaoqqdHK4R40Y6i3Ki4Enf8ilmNZuB8ju9Ah0g5Nfp5Z8wzJlYlSIg==
X-Received: by 2002:a17:90a:354d:: with SMTP id q71mr34731998pjb.216.1593702427641;
        Thu, 02 Jul 2020 08:07:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u26sm9272017pgo.71.2020.07.02.08.07.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 08:07:07 -0700 (PDT)
Date:   Thu, 2 Jul 2020 08:07:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Woody Lin <woodylin@google.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3] softdog: Add options 'soft_reboot_cmd' and
 'soft_active_on_boot'
Message-ID: <20200702150706.GB253551@roeck-us.net>
References: <20200701110339.2833449-1-woodylin@google.com>
 <d2ea870d-a9d0-fe8f-c11b-aa54750f1d0d@roeck-us.net>
 <CAHn4DefycJ9R=zTJJ_r8BTSeYPu5niuTAo8fYa5H_M1802idKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHn4DefycJ9R=zTJJ_r8BTSeYPu5niuTAo8fYa5H_M1802idKA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 01, 2020 at 10:32:16PM +0800, Woody Lin wrote:
> Attach diff from v2 to v3 here for you to refer (Or any advice about
> what next time I can do when uploading the v#N patch for reviewers to
> figure out the diff between patch sets more easily? I'd love to follow
> if it improves the review process)
> 

I would have expected something like

---
v3: Renamed soft_reboot_target to soft_reboot_cmd
    Explain reason for introducing a worker
    <other changes made in v3>

v2: <changes made in v2>

Guenter

> Woody
> 
> ---- 8< ----
> 
> diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
> index d267af37e066..8c8d214b6aa7 100644
> --- a/drivers/watchdog/softdog.c
> +++ b/drivers/watchdog/softdog.c
> @@ -51,10 +51,10 @@ module_param(soft_panic, int, 0);
>  MODULE_PARM_DESC(soft_panic,
>   "Softdog action, set to 1 to panic, 0 to reboot (default=0)");
> 
> -static char *soft_reboot_target;
> -module_param(soft_reboot_target, charp, 0000);
> -MODULE_PARM_DESC(soft_reboot_target,
> - "Softdog action, set reboot target (default=emergency)");
> +static char *soft_reboot_cmd;
> +module_param(soft_reboot_cmd, charp, 0000);
> +MODULE_PARM_DESC(soft_reboot_cmd,
> + "Set reboot command. Emergency reboot takes place if unset");
> 
>  static bool soft_active_on_boot;
>  module_param(soft_active_on_boot, bool, 0000);
> @@ -66,7 +66,7 @@ static struct hrtimer softdog_preticktock;
> 
>  static int reboot_kthread_fn(void *data)
>  {
> - kernel_restart(soft_reboot_target);
> + kernel_restart(soft_reboot_cmd);
>   return -EPERM; /* Should not reach here */
>  }
> 
> @@ -86,9 +86,26 @@ static enum hrtimer_restart softdog_fire(struct
> hrtimer *timer)
>   panic("Software Watchdog Timer expired");
>   } else {
>   pr_crit("Initiating system reboot\n");
> - if (!soft_reboot_fired && soft_reboot_target != NULL) {
> + if (!soft_reboot_fired && soft_reboot_cmd != NULL) {
>   static DECLARE_WORK(reboot_work, reboot_work_fn);
> -
> + /*
> + * The 'kernel_restart' is a 'might-sleep' operation.
> + * Also, executing it in system-wide workqueues blocks
> + * any driver from using the same workqueue in its
> + * shutdown callback function. Thus, we should execute
> + * the 'kernel_restart' in a standalone kernel thread.
> + * But since starting a kernel thread is also a
> + * 'might-sleep' operation, so the 'reboot_work' is
> + * required as a launcher of the kernel thread.
> + *
> + * After request the reboot, restart the timer to
> + * schedule an 'emergency_restart' reboot after
> + * 'TIMER_MARGIN' seconds. It's because if the softdog
> + * hangs, it might be because of scheduling issues. And
> + * if that is the case, both 'schedule_work' and
> + * 'kernel_restart' may possibly be malfunctional at the
> + * same time.
> + */
>   soft_reboot_fired = true;
>   schedule_work(&reboot_work);
>   hrtimer_add_expires_ns(timer,
> @@ -179,10 +196,8 @@ static int __init softdog_init(void)
>   softdog_preticktock.function = softdog_pretimeout;
>   }
> 
> - if (soft_active_on_boot) {
> - set_bit(WDOG_HW_RUNNING, &softdog_dev.status);
> - set_bit(WDOG_ACTIVE, &softdog_dev.status);
> - }
> + if (soft_active_on_boot)
> + softdog_ping(&softdog_dev);
> 
>   ret = watchdog_register_device(&softdog_dev);
>   if (ret)
> @@ -190,8 +205,8 @@ static int __init softdog_init(void)
> 
>   pr_info("initialized. soft_noboot=%d soft_margin=%d sec
> soft_panic=%d (nowayout=%d)\n",
>   soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
> - pr_info("             soft_reboot_target=%s soft_active_on_boot=%d\n",
> - soft_reboot_target, soft_active_on_boot);
> + pr_info("             soft_reboot_cmd=%s soft_active_on_boot=%d\n",
> + soft_reboot_cmd, soft_active_on_boot);
> 
>   return 0;
>  }
> ---- >8 ----
> 
> On Wed, Jul 1, 2020 at 10:10 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 7/1/20 4:03 AM, Woody Lin wrote:
> > > Add module parameters 'soft_reboot_cmd' and 'soft_active_on_boot' for
> > > customizing softdog configuration; config reboot command by assigning
> > > soft_reboot_cmd, and set soft_active_on_boot to start up softdog
> > > timer at module initialization stage.
> > >
> > > Signed-off-by: Woody Lin <woodylin@google.com>
> >
> > Sigh. Now I'll have to look up old versions and compare to figure out
> > changes from v2. Why do people always believe that kernel maintainers
> > have endless amounts of time available ?
> >
> > [ Sorry, yes, I know, we are supposed to remain friendly all the time.
> >   It is just _so_ frustrating to have to deal with this all the time. ]
> >
> > Guenter
> >
> > > ---
> > >  drivers/watchdog/softdog.c | 56 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 56 insertions(+)
> > >
> > > diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
> > > index 3e4885c1545e..8c8d214b6aa7 100644
> > > --- a/drivers/watchdog/softdog.c
> > > +++ b/drivers/watchdog/softdog.c
> > > @@ -20,11 +20,13 @@
> > >  #include <linux/hrtimer.h>
> > >  #include <linux/init.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/kthread.h>
> > >  #include <linux/module.h>
> > >  #include <linux/moduleparam.h>
> > >  #include <linux/reboot.h>
> > >  #include <linux/types.h>
> > >  #include <linux/watchdog.h>
> > > +#include <linux/workqueue.h>
> > >
> > >  #define TIMER_MARGIN 60              /* Default is 60 seconds */
> > >  static unsigned int soft_margin = TIMER_MARGIN;      /* in seconds */
> > > @@ -49,11 +51,33 @@ module_param(soft_panic, int, 0);
> > >  MODULE_PARM_DESC(soft_panic,
> > >       "Softdog action, set to 1 to panic, 0 to reboot (default=0)");
> > >
> > > +static char *soft_reboot_cmd;
> > > +module_param(soft_reboot_cmd, charp, 0000);
> > > +MODULE_PARM_DESC(soft_reboot_cmd,
> > > +     "Set reboot command. Emergency reboot takes place if unset");
> > > +
> > > +static bool soft_active_on_boot;
> > > +module_param(soft_active_on_boot, bool, 0000);
> > > +MODULE_PARM_DESC(soft_active_on_boot,
> > > +     "Set to true to active Softdog on boot (default=false)");
> > > +
> > >  static struct hrtimer softdog_ticktock;
> > >  static struct hrtimer softdog_preticktock;
> > >
> > > +static int reboot_kthread_fn(void *data)
> > > +{
> > > +     kernel_restart(soft_reboot_cmd);
> > > +     return -EPERM; /* Should not reach here */
> > > +}
> > > +
> > > +static void reboot_work_fn(struct work_struct *unused)
> > > +{
> > > +     kthread_run(reboot_kthread_fn, NULL, "softdog_reboot");
> > > +}
> > > +
> > >  static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
> > >  {
> > > +     static bool soft_reboot_fired;
> > >       module_put(THIS_MODULE);
> > >       if (soft_noboot) {
> > >               pr_crit("Triggered - Reboot ignored\n");
> > > @@ -62,6 +86,33 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
> > >               panic("Software Watchdog Timer expired");
> > >       } else {
> > >               pr_crit("Initiating system reboot\n");
> > > +             if (!soft_reboot_fired && soft_reboot_cmd != NULL) {
> > > +                     static DECLARE_WORK(reboot_work, reboot_work_fn);
> > > +                     /*
> > > +                      * The 'kernel_restart' is a 'might-sleep' operation.
> > > +                      * Also, executing it in system-wide workqueues blocks
> > > +                      * any driver from using the same workqueue in its
> > > +                      * shutdown callback function. Thus, we should execute
> > > +                      * the 'kernel_restart' in a standalone kernel thread.
> > > +                      * But since starting a kernel thread is also a
> > > +                      * 'might-sleep' operation, so the 'reboot_work' is
> > > +                      * required as a launcher of the kernel thread.
> > > +                      *
> > > +                      * After request the reboot, restart the timer to
> > > +                      * schedule an 'emergency_restart' reboot after
> > > +                      * 'TIMER_MARGIN' seconds. It's because if the softdog
> > > +                      * hangs, it might be because of scheduling issues. And
> > > +                      * if that is the case, both 'schedule_work' and
> > > +                      * 'kernel_restart' may possibly be malfunctional at the
> > > +                      * same time.
> > > +                      */
> > > +                     soft_reboot_fired = true;
> > > +                     schedule_work(&reboot_work);
> > > +                     hrtimer_add_expires_ns(timer,
> > > +                                     (u64)TIMER_MARGIN * NSEC_PER_SEC);
> > > +
> > > +                     return HRTIMER_RESTART;
> > > +             }
> > >               emergency_restart();
> > >               pr_crit("Reboot didn't ?????\n");
> > >       }
> > > @@ -145,12 +196,17 @@ static int __init softdog_init(void)
> > >               softdog_preticktock.function = softdog_pretimeout;
> > >       }
> > >
> > > +     if (soft_active_on_boot)
> > > +             softdog_ping(&softdog_dev);
> > > +
> > >       ret = watchdog_register_device(&softdog_dev);
> > >       if (ret)
> > >               return ret;
> > >
> > >       pr_info("initialized. soft_noboot=%d soft_margin=%d sec soft_panic=%d (nowayout=%d)\n",
> > >               soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
> > > +     pr_info("             soft_reboot_cmd=%s soft_active_on_boot=%d\n",
> > > +             soft_reboot_cmd, soft_active_on_boot);
> > >
> > >       return 0;
> > >  }
> > >
> >
