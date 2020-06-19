Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A8A201335
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jun 2020 18:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388049AbgFSP6q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 19 Jun 2020 11:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392613AbgFSP6o (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 19 Jun 2020 11:58:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84605C06174E
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Jun 2020 08:58:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i12so4227640pju.3
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Jun 2020 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rTyw/7FKTJeB+PQoPyQ9pvfT3NjiZ61aFG2XywUVXtg=;
        b=TFNl/ItGQr8d5u1oxDP89JRldK77IzQyYZpGmfJ7ZqaLezIJuk++uU1Ros9lr0J97L
         +huA79wqPewd6q7UHDvKmJXspkA77+9eI2kdOcPqAyYEafz0pe3skmNtHUUre/+z0Szm
         4kB4Bdcu2kWSONtuLiLU1+9jp36IQMHKPORMdLNQf8VaMVZbH7uRCDOtonM3uIP0NbdC
         lt36tPP+5Iy/ifgI8EEUfM3K/KedWCVkvNNmTf/UylSTU8CEmHRJY1H4XctQLOIIYRtz
         W6Xy56Av4apg9szzK5fPo8hCFSEX8ZiHXm3Fu2hOl3xr7U/S3A22e3E8zQiLlEnG589N
         Bstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rTyw/7FKTJeB+PQoPyQ9pvfT3NjiZ61aFG2XywUVXtg=;
        b=QGBj+c+h5WO4LKVFj/n3Hp2Wtqb1tISvvWQZcnYk5G8y0qUTnkd6KPo+vOlNcYS2AQ
         jHc09hsn59belTkeYbgXy8mzYX9AHOlnLBHmJ69U3thoR/J4A7HWMpFPzMUH+pP8WMB+
         EfqHL1SNoEvGevNd5yzfgEHysGZmbladCaMHvUEhKENPjHBO1A9BB4ezTYZj0rJ70MJq
         V/Ym+ZUUtgDfYXB9HOngEsFv1diXI+88c9wawvWhzFatY8h3zg/LR3POlqDnvxwGdzya
         QPZ8EC703YrQcB2ZQDp3HBLyGY1oCkQRjPtqzDmQp/XDFAVgrdhc4YSZb9hiqGQVrbRH
         +QNQ==
X-Gm-Message-State: AOAM532vrXL9V87SXXNoOFjHPKmoNwhJPpN7ZaxgRzqVej858WrAZkES
        1fa6KQpk+UYUsDsu4cOX7eU=
X-Google-Smtp-Source: ABdhPJxXF6Q8APJ1eH1O5CdvSWId8xpEfDSbxlRjkj0dP0O3Vaf/qY5UqEr3onn3Kq1+Uo9yxv9AQA==
X-Received: by 2002:a17:902:8681:: with SMTP id g1mr8524335plo.161.1592582324045;
        Fri, 19 Jun 2020 08:58:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j13sm5844873pje.25.2020.06.19.08.58.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 08:58:43 -0700 (PDT)
Date:   Fri, 19 Jun 2020 08:58:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Woody Lin <woodylin@google.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2] softdog: Add options 'soft_reboot_target' and
 'soft_active_on_boot'
Message-ID: <20200619155842.GA237422@roeck-us.net>
References: <20200612155942.246816-1-woodylin@google.com>
 <65a90fe9-8935-284a-80a9-5a4a37da6b05@roeck-us.net>
 <CAHn4DeecXWuG6Jt+icZohrr8icN+ZAkx1QDLG=CZgtCiW-ZWWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHn4DeecXWuG6Jt+icZohrr8icN+ZAkx1QDLG=CZgtCiW-ZWWg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 19, 2020 at 06:27:04PM +0800, Woody Lin wrote:
> Hi Guenter,
> 
> > The code should include an explanation for the need for the double
> > indirection (ie why schedule another worker instead of calling
> > kthread_run directly). Also, there should be a comment explaining
> > how it works, especially if kthread_run() fails to run a thread,
> > and why kthread_run() is needed in the first place.
> 
> No problem, I am adding this to the next version.
> 
> > This isn't really a "reboot target". It is just a string passed
> > to kernel_restart(). For the most part that string doesn't really
> > do anything useful. What is it supposed to accomplish in your case,
> > other than causing a reboot with the configured reboot_mode
> > (which is a global variable) ?
> >
> > If the underlying idea is to cause an orderly restart following
> > reboot_mode, a boolean would accomplish pretty much the same.
> >
> > Am I missing something ?
> 
> This argument is next sent to registered reboot notifiers and machine_restart,
> according to implementation of 'kernel_restart'. So for platforms which
> implemented different handlers for each 'cmd', the timeout can be handled with
> desired behavior. For example, some platforms might want to reboot to rescue
> mode when timeout.
> 
>  void kernel_restart(char *cmd)
>    kernel_restart_prepare(cmd);
>      -> blocking_notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd);
>    ...
>    machine_restart(cmd);
> 
> Btw, according to the signature of kernel_restart, I should name this argument
> 'soft_reboot_cmd', instead of '*_target'. Sorry for causing the confusion.
> 
Yes, that would make more sense.

Thanks,
Guenter

> > > +     if (soft_active_on_boot) {
> > > +             set_bit(WDOG_HW_RUNNING, &softdog_dev.status);
> > > +             set_bit(WDOG_ACTIVE, &softdog_dev.status);
> > > +     }
> >
> > Strictly speaking you should call the ping function here to start the timer.
> > Otherwise the watchdog won't really start if watchdog_register_device()
> > fails.
> 
> Thanks for catching this, I will revise this in the next version.
> 
> Woody
