Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DD6216890
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jul 2020 10:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgGGIrI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jul 2020 04:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgGGIrH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jul 2020 04:47:07 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490EBC061755
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Jul 2020 01:47:07 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lx13so27103269ejb.4
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Jul 2020 01:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ljcE2CYsdFBBdbP6ChpGQ95TGBfbBQYec8o/ofktGUs=;
        b=QsfzoXLelmPiKpVKxt7Pq0ms90RP5kh76heU8bwGDCoVTHD1TXzKJotafdoS+ifH2v
         +yMz0wvzIUVthLlNwyJ/iD/LFqlFslCDnNUs8FpvHyTezKXX3QfIPgH2+0Ygj1KZo+yV
         vLK1ZMQwygtaBmC5k7x6kLhBTsRlAxYR42HBJkrWub2t8+T2B2JuM4FzuIT/1WbELa/W
         iJRY2x0DRFKqPH7vkceVTJJd1tJzalp6TcL165fE+ZMpzDlk5qTPcWxx0q5h5WzVbVtr
         sMBOduAH3rz8REK7uOH2baHyuJeoPAsQ+/LCoNKld4pbeAMJNDPsjOpNvtAFnfvnXKwY
         MVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ljcE2CYsdFBBdbP6ChpGQ95TGBfbBQYec8o/ofktGUs=;
        b=hvMBIO62XAEEnbz5TynkC1yywQO9T/AR1px8BeCQBX72MGzCaiYyElreENLJ8e7+Yi
         79a6UezUN4bAsyj6vrktD5V38dZQK3DoZ6LB3Y4M+yr7sSOnDzql+uOU9g+AnDmy4ZKm
         cxlZC4QgrAkhwc7l8RPPYBbWiUM52t80v+RLIOia/xIAKvj4/lFdOOwe7ykDTDfqmGbu
         Pu/reicg0nHgwsTX+rs0LBBc7ZmOBFkBoUVSWyNtxG9M6Pq7wdDo2exUiudpXzkQpk5P
         5hsaTFiGc3R5SdMdrfM6AQmKF6MdcuPyiJAkiznIEVd2ECRuWf4sB8PnRE9pFeOyhbYZ
         Pz4w==
X-Gm-Message-State: AOAM530W5UZqQ7PHEdVjdWqmvDOXT6e4uRVmE1ZaWQXWj+0zALZcX/s6
        /Pg/i8jgAykKwKZIloTX4zMMEzdD8DUYpITMOumSOtFFthk=
X-Google-Smtp-Source: ABdhPJzQtmPnKZJgTRH+M9Dg7db4fy6gUangSHWBbWbiVutrcKQ7l2vFkLcrK94D43y95lMtFAD9MNC0rcgiu0F7p7M=
X-Received: by 2002:a17:906:5fc4:: with SMTP id k4mr46338964ejv.94.1594111625592;
 Tue, 07 Jul 2020 01:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200701110339.2833449-1-woodylin@google.com> <20200707040356.GA213018@roeck-us.net>
In-Reply-To: <20200707040356.GA213018@roeck-us.net>
From:   Woody Lin <woodylin@google.com>
Date:   Tue, 7 Jul 2020 16:46:54 +0800
Message-ID: <CAHn4DedP=r0UwN4bn=A3nH_2bcEFA24SEYSq4gJUcC9w9p0UKQ@mail.gmail.com>
Subject: Re: [PATCH v3] softdog: Add options 'soft_reboot_cmd' and 'soft_active_on_boot'
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 7, 2020 at 12:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Jul 01, 2020 at 07:03:40PM +0800, Woody Lin wrote:
> > Add module parameters 'soft_reboot_cmd' and 'soft_active_on_boot' for
> > customizing softdog configuration; config reboot command by assigning
> > soft_reboot_cmd, and set soft_active_on_boot to start up softdog
> > timer at module initialization stage.
> >
> > Signed-off-by: Woody Lin <woodylin@google.com>
> > ---
> >  drivers/watchdog/softdog.c | 56 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
> > index 3e4885c1545e..8c8d214b6aa7 100644
> > --- a/drivers/watchdog/softdog.c
> > +++ b/drivers/watchdog/softdog.c
> > @@ -20,11 +20,13 @@
> >  #include <linux/hrtimer.h>
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> > +#include <linux/kthread.h>
> >  #include <linux/module.h>
> >  #include <linux/moduleparam.h>
> >  #include <linux/reboot.h>
> >  #include <linux/types.h>
> >  #include <linux/watchdog.h>
> > +#include <linux/workqueue.h>
> >
> >  #define TIMER_MARGIN 60              /* Default is 60 seconds */
> >  static unsigned int soft_margin = TIMER_MARGIN;      /* in seconds */
> > @@ -49,11 +51,33 @@ module_param(soft_panic, int, 0);
> >  MODULE_PARM_DESC(soft_panic,
> >       "Softdog action, set to 1 to panic, 0 to reboot (default=0)");
> >
> > +static char *soft_reboot_cmd;
> > +module_param(soft_reboot_cmd, charp, 0000);
> > +MODULE_PARM_DESC(soft_reboot_cmd,
> > +     "Set reboot command. Emergency reboot takes place if unset");
> > +
> > +static bool soft_active_on_boot;
> > +module_param(soft_active_on_boot, bool, 0000);
> > +MODULE_PARM_DESC(soft_active_on_boot,
> > +     "Set to true to active Softdog on boot (default=false)");
> > +
> >  static struct hrtimer softdog_ticktock;
> >  static struct hrtimer softdog_preticktock;
> >
> > +static int reboot_kthread_fn(void *data)
> > +{
> > +     kernel_restart(soft_reboot_cmd);
> > +     return -EPERM; /* Should not reach here */
> > +}
> > +
> > +static void reboot_work_fn(struct work_struct *unused)
> > +{
> > +     kthread_run(reboot_kthread_fn, NULL, "softdog_reboot");
> > +}
> > +
> >  static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
> >  {
> > +     static bool soft_reboot_fired;
>
> Per coding style there should be an empty line here.

Ack.

>
> >       module_put(THIS_MODULE);
> >       if (soft_noboot) {
> >               pr_crit("Triggered - Reboot ignored\n");
> > @@ -62,6 +86,33 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
> >               panic("Software Watchdog Timer expired");
> >       } else {
> >               pr_crit("Initiating system reboot\n");
> > +             if (!soft_reboot_fired && soft_reboot_cmd != NULL) {
> > +                     static DECLARE_WORK(reboot_work, reboot_work_fn);
> > +                     /*
> > +                      * The 'kernel_restart' is a 'might-sleep' operation.
> > +                      * Also, executing it in system-wide workqueues blocks
> > +                      * any driver from using the same workqueue in its
> > +                      * shutdown callback function. Thus, we should execute
> > +                      * the 'kernel_restart' in a standalone kernel thread.
> > +                      * But since starting a kernel thread is also a
> > +                      * 'might-sleep' operation, so the 'reboot_work' is
> > +                      * required as a launcher of the kernel thread.
> > +                      *
> > +                      * After request the reboot, restart the timer to
> > +                      * schedule an 'emergency_restart' reboot after
> > +                      * 'TIMER_MARGIN' seconds. It's because if the softdog
> > +                      * hangs, it might be because of scheduling issues. And
> > +                      * if that is the case, both 'schedule_work' and
> > +                      * 'kernel_restart' may possibly be malfunctional at the
> > +                      * same time.
> > +                      */
> > +                     soft_reboot_fired = true;
> > +                     schedule_work(&reboot_work);
> > +                     hrtimer_add_expires_ns(timer,
> > +                                     (u64)TIMER_MARGIN * NSEC_PER_SEC);
> > +
> > +                     return HRTIMER_RESTART;
> > +             }
> >               emergency_restart();
> >               pr_crit("Reboot didn't ?????\n");
> >       }
> > @@ -145,12 +196,17 @@ static int __init softdog_init(void)
> >               softdog_preticktock.function = softdog_pretimeout;
> >       }
> >
> > +     if (soft_active_on_boot)
> > +             softdog_ping(&softdog_dev);
> > +
> >       ret = watchdog_register_device(&softdog_dev);
> >       if (ret)
> >               return ret;
> >
> >       pr_info("initialized. soft_noboot=%d soft_margin=%d sec soft_panic=%d (nowayout=%d)\n",
> >               soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
> > +     pr_info("             soft_reboot_cmd=%s soft_active_on_boot=%d\n",
> > +             soft_reboot_cmd, soft_active_on_boot);
>
> soft_reboot_cmd can be NULL, which makes the output a bit awkward.

Then how about change it to something like this:
"soft_reboot_cmd=%s", soft_reboot_cmd ?: "<null> (emergency reboot)"
Then we will see "soft_reboot_cmd=<null> (emergency reboot)" when it's NULL.

>
> >
> >       return 0;
> >  }


Woody
