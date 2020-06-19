Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6F0200635
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jun 2020 12:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732379AbgFSK2K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 19 Jun 2020 06:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732378AbgFSK2F (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 19 Jun 2020 06:28:05 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC6EC06174E
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Jun 2020 03:27:17 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id x25so7171897edr.8
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Jun 2020 03:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kPEfq+/6b+G+EXZN69BsPMP21SU77fxBrWOwIXCfLBY=;
        b=BAUuYX2LXQmdwL+L9tPeCmNK3L0A+wwmJVeh3m9a5kQVWb0zPKYBT6kMW5zY4zPw5C
         MUxeCp8igp9FI7PXIwFtCL+cRkIZzUg/DHB/8uGea8Nm8yKWuzvWXmtwYV15nA7s+kMN
         jnk7vzb37BoclJ6Pz/OXuGTpcd4nqSSGqhvIXf4BB++OSrE7xRftqSO1PMH5AoktunEJ
         pPnd7pFhzWXXfUdk/5aB34pAxVHMv/EjEV+s4JBiOlZnH0LuM0FvCTnpa95kiBv98NWw
         fZJG0f8EhpxwS0qyieB7xE5ER0N4OqR6MlI9uBS3hWf5zNgOCwLUkpaOkOXzmydGf2H7
         1OMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kPEfq+/6b+G+EXZN69BsPMP21SU77fxBrWOwIXCfLBY=;
        b=GnjoCzekCGhpNHTB+eBLswXFLU5LSYuTvSaA8oRTSUi7QH/yvXc08EkWxL3nvvPc79
         1cko8jZ7U9YMgK4DGfef+6z6Dvg5a0eJWeN9yg/5nltBtE7/93iQSxzg7h/ICDkQG3Ut
         d6tGDEdZD+6E5KbNFZIWEa2uuuBqRs2HcnZaeNGtuIZrSza7rOx7Twdl6tNKSz4C3sSI
         8+EeYL+z3bUXC5dwp4/YqjCmZ8aHJkLhl+ghDZrBK9K+BH94+Cq96I0oJG3eMfF4fvHn
         goMmgANyXT0HMOc9JcsAKH3bpCDHXeG/5usIYtHMGMLRs6UmrGUA5Urm6ZjXFdLnN2NC
         04WQ==
X-Gm-Message-State: AOAM5322mDC97Izlu4hXbRmikEFGUIfVSlVtxAmx2aVUBXOm6/20layv
        V4meHViPtFFQN4vaCdRyRAdawpoR4oyQkUZk8upKoJGcMTM=
X-Google-Smtp-Source: ABdhPJxPXvMirCaubsdoy048tYU/ZWaaSptLBoUg3TNp5KvYPFJ/naIndPxmARHS30WObK4DfYcEMcd9Q+ZxQAWUDJc=
X-Received: by 2002:a50:f017:: with SMTP id r23mr2456294edl.205.1592562435416;
 Fri, 19 Jun 2020 03:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200612155942.246816-1-woodylin@google.com> <65a90fe9-8935-284a-80a9-5a4a37da6b05@roeck-us.net>
In-Reply-To: <65a90fe9-8935-284a-80a9-5a4a37da6b05@roeck-us.net>
From:   Woody Lin <woodylin@google.com>
Date:   Fri, 19 Jun 2020 18:27:04 +0800
Message-ID: <CAHn4DeecXWuG6Jt+icZohrr8icN+ZAkx1QDLG=CZgtCiW-ZWWg@mail.gmail.com>
Subject: Re: [PATCH v2] softdog: Add options 'soft_reboot_target' and 'soft_active_on_boot'
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> The code should include an explanation for the need for the double
> indirection (ie why schedule another worker instead of calling
> kthread_run directly). Also, there should be a comment explaining
> how it works, especially if kthread_run() fails to run a thread,
> and why kthread_run() is needed in the first place.

No problem, I am adding this to the next version.

> This isn't really a "reboot target". It is just a string passed
> to kernel_restart(). For the most part that string doesn't really
> do anything useful. What is it supposed to accomplish in your case,
> other than causing a reboot with the configured reboot_mode
> (which is a global variable) ?
>
> If the underlying idea is to cause an orderly restart following
> reboot_mode, a boolean would accomplish pretty much the same.
>
> Am I missing something ?

This argument is next sent to registered reboot notifiers and machine_restart,
according to implementation of 'kernel_restart'. So for platforms which
implemented different handlers for each 'cmd', the timeout can be handled with
desired behavior. For example, some platforms might want to reboot to rescue
mode when timeout.

 void kernel_restart(char *cmd)
   kernel_restart_prepare(cmd);
     -> blocking_notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd);
   ...
   machine_restart(cmd);

Btw, according to the signature of kernel_restart, I should name this argument
'soft_reboot_cmd', instead of '*_target'. Sorry for causing the confusion.

> > +     if (soft_active_on_boot) {
> > +             set_bit(WDOG_HW_RUNNING, &softdog_dev.status);
> > +             set_bit(WDOG_ACTIVE, &softdog_dev.status);
> > +     }
>
> Strictly speaking you should call the ping function here to start the timer.
> Otherwise the watchdog won't really start if watchdog_register_device()
> fails.

Thanks for catching this, I will revise this in the next version.

Woody
