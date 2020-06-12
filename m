Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF39B1F7443
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jun 2020 09:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgFLHB6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Jun 2020 03:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgFLHB6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Jun 2020 03:01:58 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1284CC03E96F
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Jun 2020 00:01:58 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id m32so5669763ede.8
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Jun 2020 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qXRVeKq1Yr3hfL1/oO68wHvkqQs9uxgOZT1e1oMPMsI=;
        b=rp/MhWt5lZIwDML35x/O6ngjsdND+HVEus2JYVTAqnJnZW0/91TGmJZagDcMXRoBII
         W8fXh345SVf8qXkD5UoPWiiKd7vbHedXagJOLtvzqY7114o0h1ivlDJsJQ6TeKyplroO
         rM+rbVb/VniKRC0WEgI5j2adPUig+ULFwP+bYCzQ2V3otvWynOJQ0TSmRzEnPvBtEt0H
         tMfzrlliRUZymni5Qs7ajUTDbjgNzriZBSdULBJFIZBSWQYixwYqpiTay/bh+nuuWxiC
         2ojz4CttWWPY0X34ApTE7dvi5Hio0T9RjPM4uPeNp84McQpEWeEdwRmGA+nXk6l5KW0T
         StQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qXRVeKq1Yr3hfL1/oO68wHvkqQs9uxgOZT1e1oMPMsI=;
        b=KesxWdda6/PxzEaiRUmOixgRnpe2Hs60AR3Y9dEjZPC9wKBXxGDag+W/xSE/gOgiyG
         8ue0l1Bx4BWqpUvH9rZeOgTf1W9SlJYlCSHEtPB1EtYHNMCq+faDVT9+AXugsBNwO91U
         CWeTMfcYzLveQoLl0URRzoyQ69XHfbCZVhXzvpO6UZqPfjUgUy6Vi9ZDbiwqFI7kxFqZ
         BRFaPjqwTD81eJoThPmDGnr18nyZxkapDSU+NgcVSuWdqbFWbHppDXYa29//V4VPyZwa
         LG9e5bRuyWID66GmQS+MdbMENlayeiRgRSUL4c1k0EselWRYv/4AKTZilC/AvklrYjTk
         GPFw==
X-Gm-Message-State: AOAM532UyIDk5Aye4vTf1QMx1crR4sEBYSCP7yEzMBAcY+enJRNQc2kP
        Vr2NHJSyLL0XDv4sqO+dB8yR6ruqTuRcYjkef9YSdM3LlvY=
X-Google-Smtp-Source: ABdhPJylt+DmbLIFXtGU5l9DtBXzEDTguCg3HbpJxCjurBATJmPYjYrKo78r1N0prS8Z1kjiBAjfytftCc/BttKNeWQ=
X-Received: by 2002:a05:6402:1481:: with SMTP id e1mr10405308edv.113.1591945316254;
 Fri, 12 Jun 2020 00:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200603103923.116113-1-woodylin@google.com> <938e6176-aa35-8613-231e-31fb37fd09b1@roeck-us.net>
In-Reply-To: <938e6176-aa35-8613-231e-31fb37fd09b1@roeck-us.net>
From:   Woody Lin <woodylin@google.com>
Date:   Fri, 12 Jun 2020 15:01:44 +0800
Message-ID: <CAHn4DeetqwhTnDpKcozo3HQCD4xta4enz_gmUtz0i9dy196Wbg@mail.gmail.com>
Subject: Re: [PATCH] softdog: Add options 'soft_reboot_target' and 'soft_active_on_boot'
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

Thanks for taking a look at this. Yes it's a double indirection, and reason to
do this is: I was worrying about if I use the system_wq to execute
'kernel_restart' (which calls to 'device_shutdown' and 'syscore_shutdown'), I
might end up blocking kernel modules' destructor callback function that also
using the system_wq for their cleaning up processes (although I didn't notice
there is a condition that a kernel module needs system_wq for its cleaning up).
To avoid resulting a blocking like this, I will need to execute
'kernel_restart' in a standalone context, that is: a kernel thread. But the
context to start up a kernel thread needs to be able to sleep, so this can't be
done in the execution context of the hrtimer callback function. Finally I have
to implement this as a double indirection: schedules a worker in hrtimer
callback function execution context, then creates a kernel thread in the worker
context, which is able to sleep.

And yes, thanks for catching this: both the worker and the kernel thread may
never be executed if there is a scheduling issue. I will upload v2 patch to
cover this by re-scheduling the same hrtimer with another TIMER_MARGIN (60
secs) expiration. So we can at least fallback to 'emergency_restart' when there
is a scheduling issue.

Sincerely,
Woody

On Wed, Jun 10, 2020 at 1:18 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >               pr_crit("Initiating system reboot\n");
> > +             if (soft_reboot_target != NULL) {
> > +                     static DECLARE_WORK(reboot_work, reboot_work_fn);
> > +
> > +                     schedule_work(&reboot_work);
> > +                     return HRTIMER_NORESTART;
> > +             }
>
> So this adds a double indirection: It first schedules a worker,
> then the worker creates a kernel thread, which finally calls
> kernel_restart(). If the softdog hangs, it may well be because
> of scheduling issues. If so, both the worker and the kernel thread
> may never execute, and the system would not reboot even though
> the softdog did fire.
>
> Is this double indirection really necessary ?
>
> Thanks,
> Guenter
