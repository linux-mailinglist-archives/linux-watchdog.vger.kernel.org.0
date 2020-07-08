Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB6121829E
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jul 2020 10:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgGHIhD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jul 2020 04:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgGHIhD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jul 2020 04:37:03 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3332FC08C5DC
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Jul 2020 01:37:03 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p20so49406733ejd.13
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Jul 2020 01:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dWR0n2XbP23eaFNi7tFlmLcGlU5MbvP4GwLGfba98GI=;
        b=eYKa7Ns/vZGYLl5kW/0vqgUl/1bXovYivVVYOmWse1JkJcdv2taiITn0vwVRBgnOkN
         KVa6E7zhu3nasR5EJMUXYUlw3/SkvhnSZIERX1DZm8L0RRoP1F6brlnfU1Yn3PX8x7Ar
         0v4GR0aISPXcXb+eU8JGag9xXfmzu5gE0hTSMGZE/GUmOx7ur+FxKnGvj6Skf4Lx+y2w
         Tv6GcNCTWOD3HsWqpdx1Vz6QntfDhDezHVX+ZRa8ZqNXkGDnZPaEnQcnNkPmuJyjBGPI
         6uu7MLO0AVyp8cBOS2sK+blZDK18R0odJxwP3Uay6+qUsVpb0JQpa3Xj7mIEKvSofsho
         andQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dWR0n2XbP23eaFNi7tFlmLcGlU5MbvP4GwLGfba98GI=;
        b=uYjYVZNBUmjTiDduqS98QNNvgd2fY+C3n4IQRdIjtzcmKcErlrhz2uUZhQ8ZC1kMAr
         rvUHEdCTRbJrxXuJK93vJ+kCH9rd/mQy0XW/1Sp2AFb6InXbh5cmTQUMfILUAB9yac6y
         O6uRn2aN4C+y/jZSAfqTRKFcgt4iDxK7gST2Ql0MuDxqKilpZO+RKppjPOVAv1eaOwPy
         DcNO+C2WmQ90ulGtt6RNaaPyQzzpScEvj+AAbfJ737PlK9tYylU6RIG9x5m3skiuvVjg
         f9V2Jl3qyCHFP+r+TctJOYD+aUUde89skYMIZyIQt9WOOpIunX8tEN77ddscdH3vrWgy
         bjiw==
X-Gm-Message-State: AOAM533O0Z04qsvWtNuI8p2pgdRoSloV38VsP+swDgm18LuNZASZALGh
        1uuESjivsAJW2dGEbdwF7zDbLZ0Fy97iqsGmhd2E7uKUsPY=
X-Google-Smtp-Source: ABdhPJyGHuSdjp/nJllSo394u2sWyu2YpXqjnRGruHq8M8J6ODVq+TsXO9getskV9sHg7iSnYUxKJfdEY4YwBTZ1i+Y=
X-Received: by 2002:a17:906:3958:: with SMTP id g24mr48922174eje.26.1594197421570;
 Wed, 08 Jul 2020 01:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200708083218.3157213-1-woodylin@google.com>
In-Reply-To: <20200708083218.3157213-1-woodylin@google.com>
From:   Woody Lin <woodylin@google.com>
Date:   Wed, 8 Jul 2020 16:36:50 +0800
Message-ID: <CAHn4DectM_HT-Ko8fzezUJgEEfedNqBpXVvDn6K_sAHxF-EQsA@mail.gmail.com>
Subject: Re: [PATCH v4] softdog: Add options 'soft_reboot_cmd' and 'soft_active_on_boot'
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Change history:

v4: Fix coding style: add an empty line after declaration section.
    Show "<not set>" in the initialization log message when
=E2=80=98soft_reboot_cmd=E2=80=99 is NULL.

v3: Renamed soft_reboot_target to soft_reboot_cmd
    Explain reason for introducing a worker
    Callk softdog_ping explicitly to replace set_bit WDOG_HW_RUNNING
and WDOG_ACTIVE.

v2: Add rescheduling of hrtimer to handle failure cases of
'schedule_work' and 'kernel_restart'

Woody

On Wed, Jul 8, 2020 at 4:35 PM Woody Lin <woodylin@google.com> wrote:
>
> Add module parameters 'soft_reboot_cmd' and 'soft_active_on_boot' for
> customizing softdog configuration; config reboot command by assigning
> soft_reboot_cmd, and set soft_active_on_boot to start up softdog
> timer at module initialization stage.
>
> Signed-off-by: Woody Lin <woodylin@google.com>
> ---
>  drivers/watchdog/softdog.c | 57 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
> index 3e4885c1545e..7a1096265f18 100644
> --- a/drivers/watchdog/softdog.c
> +++ b/drivers/watchdog/softdog.c
> @@ -20,11 +20,13 @@
>  #include <linux/hrtimer.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/kthread.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/reboot.h>
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
> +#include <linux/workqueue.h>
>
>  #define TIMER_MARGIN   60              /* Default is 60 seconds */
>  static unsigned int soft_margin =3D TIMER_MARGIN;        /* in seconds *=
/
> @@ -49,11 +51,34 @@ module_param(soft_panic, int, 0);
>  MODULE_PARM_DESC(soft_panic,
>         "Softdog action, set to 1 to panic, 0 to reboot (default=3D0)");
>
> +static char *soft_reboot_cmd;
> +module_param(soft_reboot_cmd, charp, 0000);
> +MODULE_PARM_DESC(soft_reboot_cmd,
> +       "Set reboot command. Emergency reboot takes place if unset");
> +
> +static bool soft_active_on_boot;
> +module_param(soft_active_on_boot, bool, 0000);
> +MODULE_PARM_DESC(soft_active_on_boot,
> +       "Set to true to active Softdog on boot (default=3Dfalse)");
> +
>  static struct hrtimer softdog_ticktock;
>  static struct hrtimer softdog_preticktock;
>
> +static int reboot_kthread_fn(void *data)
> +{
> +       kernel_restart(soft_reboot_cmd);
> +       return -EPERM; /* Should not reach here */
> +}
> +
> +static void reboot_work_fn(struct work_struct *unused)
> +{
> +       kthread_run(reboot_kthread_fn, NULL, "softdog_reboot");
> +}
> +
>  static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
>  {
> +       static bool soft_reboot_fired;
> +
>         module_put(THIS_MODULE);
>         if (soft_noboot) {
>                 pr_crit("Triggered - Reboot ignored\n");
> @@ -62,6 +87,33 @@ static enum hrtimer_restart softdog_fire(struct hrtime=
r *timer)
>                 panic("Software Watchdog Timer expired");
>         } else {
>                 pr_crit("Initiating system reboot\n");
> +               if (!soft_reboot_fired && soft_reboot_cmd !=3D NULL) {
> +                       static DECLARE_WORK(reboot_work, reboot_work_fn);
> +                       /*
> +                        * The 'kernel_restart' is a 'might-sleep' operat=
ion.
> +                        * Also, executing it in system-wide workqueues b=
locks
> +                        * any driver from using the same workqueue in it=
s
> +                        * shutdown callback function. Thus, we should ex=
ecute
> +                        * the 'kernel_restart' in a standalone kernel th=
read.
> +                        * But since starting a kernel thread is also a
> +                        * 'might-sleep' operation, so the 'reboot_work' =
is
> +                        * required as a launcher of the kernel thread.
> +                        *
> +                        * After request the reboot, restart the timer to
> +                        * schedule an 'emergency_restart' reboot after
> +                        * 'TIMER_MARGIN' seconds. It's because if the so=
ftdog
> +                        * hangs, it might be because of scheduling issue=
s. And
> +                        * if that is the case, both 'schedule_work' and
> +                        * 'kernel_restart' may possibly be malfunctional=
 at the
> +                        * same time.
> +                        */
> +                       soft_reboot_fired =3D true;
> +                       schedule_work(&reboot_work);
> +                       hrtimer_add_expires_ns(timer,
> +                                       (u64)TIMER_MARGIN * NSEC_PER_SEC)=
;
> +
> +                       return HRTIMER_RESTART;
> +               }
>                 emergency_restart();
>                 pr_crit("Reboot didn't ?????\n");
>         }
> @@ -145,12 +197,17 @@ static int __init softdog_init(void)
>                 softdog_preticktock.function =3D softdog_pretimeout;
>         }
>
> +       if (soft_active_on_boot)
> +               softdog_ping(&softdog_dev);
> +
>         ret =3D watchdog_register_device(&softdog_dev);
>         if (ret)
>                 return ret;
>
>         pr_info("initialized. soft_noboot=3D%d soft_margin=3D%d sec soft_=
panic=3D%d (nowayout=3D%d)\n",
>                 soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
> +       pr_info("             soft_reboot_cmd=3D%s soft_active_on_boot=3D=
%d\n",
> +               soft_reboot_cmd ?: "<not set>", soft_active_on_boot);
>
>         return 0;
>  }
> --
> 2.27.0.383.g050319c2ae-goog
>
