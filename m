Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C86210DC3
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jul 2020 16:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731473AbgGAOca (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jul 2020 10:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731328AbgGAOc3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jul 2020 10:32:29 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DD3C08C5C1
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Jul 2020 07:32:29 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id i14so24961334ejr.9
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Jul 2020 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxLULSln98YJXsUwbGitWq8+7G8zFnbLaI6SDWaG0LY=;
        b=FgeZkKjGqSl4qOJgBKb+qm+mzNarz5Cs1SVOWmR2KzyJAIT87DHtid5GQ3mOjH/URt
         AETmKihcrOVLBLSZOtyz9p0vUv/ZIVJhYbB+zfD+aicTH6GDDJVfOkpbw2JCMI4jIM+8
         O/rffgm5UyzwoN6yeB6SjySxj/JkeIOfOzEkzVfsbN4SiArNzX6lyFul0nMunyvtbqxC
         hR09rhZp2RTXkXOuS1/vn4l5nHp/XFFj/y1M9pqJQGKwGoJA5/g3Qyp2Nlisu830OjFp
         Ww1ZPXhpSIqXcOfWNxHm3n2vAJdd5KdNlKZBz2TXT0IgJ0Pg4eX7W4qW5rqwKA7YFIXE
         8vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxLULSln98YJXsUwbGitWq8+7G8zFnbLaI6SDWaG0LY=;
        b=MiCUh2eWWl8Gl2pzbLx4QQNBnyXlMHlSyIHgUAMrktEOollnrGRgGfUEeuAgWtkWM5
         AqEWkLTXjysyirdKiko7WtJXLhAn5aybEOad1RvP7l73GGBM0eQ+61U9KvKoBc2lXd9l
         7+ODn7mAZRm5jB62yDxSI67j83/fpKeorYvzM7BSQZEOzeq5PD/5CVVOy8DjIyC4f+aB
         GSC7VW+tngSUqFzHVizesM1wZxJVlDHhkAcR9VBTzCPze4T3W9REoNnpnTI+YCYdH/o+
         FhEcpRoO2HT0pPaTMf2y1u6rL/V+QiCLMsOPcW1JEOQeybcbXxqx0LyZnd3cuyU2CWZs
         9qlQ==
X-Gm-Message-State: AOAM532WFS7UwtZ5D+zEItEdkfPIsIXJNv8gwrYRA3SWOnRB0WBpCt3h
        uKgs5ZDohs/No1JzOQhTTvotY5BRXNwGoiTLIDupyqpSJnA=
X-Google-Smtp-Source: ABdhPJyO0uYygymisflpoCRny8mkHXlUAiF3BL9ktC6WWX2cg9LLGKmevNYgB6JeH2lXVjCygRKZ3e2b6zfWaYODV+A=
X-Received: by 2002:a17:907:1059:: with SMTP id oy25mr24847732ejb.90.1593613947764;
 Wed, 01 Jul 2020 07:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200701110339.2833449-1-woodylin@google.com> <d2ea870d-a9d0-fe8f-c11b-aa54750f1d0d@roeck-us.net>
In-Reply-To: <d2ea870d-a9d0-fe8f-c11b-aa54750f1d0d@roeck-us.net>
From:   Woody Lin <woodylin@google.com>
Date:   Wed, 1 Jul 2020 22:32:16 +0800
Message-ID: <CAHn4DefycJ9R=zTJJ_r8BTSeYPu5niuTAo8fYa5H_M1802idKA@mail.gmail.com>
Subject: Re: [PATCH v3] softdog: Add options 'soft_reboot_cmd' and 'soft_active_on_boot'
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Attach diff from v2 to v3 here for you to refer (Or any advice about
what next time I can do when uploading the v#N patch for reviewers to
figure out the diff between patch sets more easily? I'd love to follow
if it improves the review process)

Woody

---- 8< ----

diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index d267af37e066..8c8d214b6aa7 100644
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -51,10 +51,10 @@ module_param(soft_panic, int, 0);
 MODULE_PARM_DESC(soft_panic,
  "Softdog action, set to 1 to panic, 0 to reboot (default=0)");

-static char *soft_reboot_target;
-module_param(soft_reboot_target, charp, 0000);
-MODULE_PARM_DESC(soft_reboot_target,
- "Softdog action, set reboot target (default=emergency)");
+static char *soft_reboot_cmd;
+module_param(soft_reboot_cmd, charp, 0000);
+MODULE_PARM_DESC(soft_reboot_cmd,
+ "Set reboot command. Emergency reboot takes place if unset");

 static bool soft_active_on_boot;
 module_param(soft_active_on_boot, bool, 0000);
@@ -66,7 +66,7 @@ static struct hrtimer softdog_preticktock;

 static int reboot_kthread_fn(void *data)
 {
- kernel_restart(soft_reboot_target);
+ kernel_restart(soft_reboot_cmd);
  return -EPERM; /* Should not reach here */
 }

@@ -86,9 +86,26 @@ static enum hrtimer_restart softdog_fire(struct
hrtimer *timer)
  panic("Software Watchdog Timer expired");
  } else {
  pr_crit("Initiating system reboot\n");
- if (!soft_reboot_fired && soft_reboot_target != NULL) {
+ if (!soft_reboot_fired && soft_reboot_cmd != NULL) {
  static DECLARE_WORK(reboot_work, reboot_work_fn);
-
+ /*
+ * The 'kernel_restart' is a 'might-sleep' operation.
+ * Also, executing it in system-wide workqueues blocks
+ * any driver from using the same workqueue in its
+ * shutdown callback function. Thus, we should execute
+ * the 'kernel_restart' in a standalone kernel thread.
+ * But since starting a kernel thread is also a
+ * 'might-sleep' operation, so the 'reboot_work' is
+ * required as a launcher of the kernel thread.
+ *
+ * After request the reboot, restart the timer to
+ * schedule an 'emergency_restart' reboot after
+ * 'TIMER_MARGIN' seconds. It's because if the softdog
+ * hangs, it might be because of scheduling issues. And
+ * if that is the case, both 'schedule_work' and
+ * 'kernel_restart' may possibly be malfunctional at the
+ * same time.
+ */
  soft_reboot_fired = true;
  schedule_work(&reboot_work);
  hrtimer_add_expires_ns(timer,
@@ -179,10 +196,8 @@ static int __init softdog_init(void)
  softdog_preticktock.function = softdog_pretimeout;
  }

- if (soft_active_on_boot) {
- set_bit(WDOG_HW_RUNNING, &softdog_dev.status);
- set_bit(WDOG_ACTIVE, &softdog_dev.status);
- }
+ if (soft_active_on_boot)
+ softdog_ping(&softdog_dev);

  ret = watchdog_register_device(&softdog_dev);
  if (ret)
@@ -190,8 +205,8 @@ static int __init softdog_init(void)

  pr_info("initialized. soft_noboot=%d soft_margin=%d sec
soft_panic=%d (nowayout=%d)\n",
  soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
- pr_info("             soft_reboot_target=%s soft_active_on_boot=%d\n",
- soft_reboot_target, soft_active_on_boot);
+ pr_info("             soft_reboot_cmd=%s soft_active_on_boot=%d\n",
+ soft_reboot_cmd, soft_active_on_boot);

  return 0;
 }
---- >8 ----

On Wed, Jul 1, 2020 at 10:10 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/1/20 4:03 AM, Woody Lin wrote:
> > Add module parameters 'soft_reboot_cmd' and 'soft_active_on_boot' for
> > customizing softdog configuration; config reboot command by assigning
> > soft_reboot_cmd, and set soft_active_on_boot to start up softdog
> > timer at module initialization stage.
> >
> > Signed-off-by: Woody Lin <woodylin@google.com>
>
> Sigh. Now I'll have to look up old versions and compare to figure out
> changes from v2. Why do people always believe that kernel maintainers
> have endless amounts of time available ?
>
> [ Sorry, yes, I know, we are supposed to remain friendly all the time.
>   It is just _so_ frustrating to have to deal with this all the time. ]
>
> Guenter
>
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
> >
> >       return 0;
> >  }
> >
>
