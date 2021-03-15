Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B5433B106
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 12:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhCOL1K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 07:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhCOL1C (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 07:27:02 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D10C061574;
        Mon, 15 Mar 2021 04:27:01 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso14581895pjb.4;
        Mon, 15 Mar 2021 04:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUeQwlvH5YJ8N7DlU0KsZby/CVI/jMuNfIJRKUr/DNU=;
        b=vRWvchIGnykCDLaeIHJSLW5SpffZo/Hidh39yCPoUWOzu95hfGLY7KUuDceVdxPz1m
         RX+vO+CIE/69ODROo8Xsij2p3VLSaSOUS6t3gOK6O59EwOism3p03/m17M5IidF6qgof
         Y8eiVyLQWx00kkwmZa3CSGsV8nTULFJPHyV+W/Rl+zDztf994cp0t19y2X26wKeC9ird
         HknLaTj3fseFrk6OxQ28GqLzqOAFQuxR66Tza4/U/Ed3Gz4wjJ+JzBLxu3bVIObbN05l
         VafOSDm3+eCZSjj3NBwOlsYJAVGRy3QN0b4epeR5jovI7+/unloZMkao0Z2psEy59re0
         THxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUeQwlvH5YJ8N7DlU0KsZby/CVI/jMuNfIJRKUr/DNU=;
        b=FZeNHDwj094SfwYsoTZrDgRngTyJlZ92kEqis4IK1v4qFdRUxL62kfT7eZQgVbmpVA
         qjpQo38CIYi1nt+ufx4S7xFGAl+ZjbDV6ojpuKdL0lPkQV25KZREC3fdnP8ECg7NbxCU
         ToV+AowSL6833ta5oy8eVhC+AKi8ky4/U+Ani3//dqtCsbbSbTEDW3ac+QOnX/rbCRZp
         BOWEs4r6ms0vLZFS2TrjKdG8SuNw9Ln8H0YayM8sAKXOZci4X6guY5s/TVotRIEq1+gp
         p0E9A9I/B3IYBhwCyrdrgmGVhH3zuggE+s9LyHy1wowkQiXlkkSHgvVbxxM7jDcrX982
         vYUg==
X-Gm-Message-State: AOAM532rct8hPlr3YdzKsu0KB4k8TZy6+ikjwcaaA0x/dkwjauGGa7/J
        hJNzftbuUu1tUHPFwqw1ceKXc2TFyT9rWypUWWY=
X-Google-Smtp-Source: ABdhPJxz2BPmPBc7oFK/MVET64Gh2swZ2AHRSTJwhyM2W2wsG1PK7w3D/9wyOGjPE5Kv6g1Nx06p1DafuuLxUlf6hQU=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr12799434pjb.129.1615807621336;
 Mon, 15 Mar 2021 04:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-3-henning.schild@siemens.com> <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
 <20210315111915.GA14857@duo.ucw.cz>
In-Reply-To: <20210315111915.GA14857@duo.ucw.cz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Mar 2021 13:26:45 +0200
Message-ID: <CAHp75Ve6+QwuPQYRhCeUy3d=8tpmU5irKUrmVtGCWmm7nGayzw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 15, 2021 at 1:19 PM Pavel Machek <pavel@ucw.cz> wrote:

> > > +       struct simatic_ipc_led *led =
> > > +               container_of(led_cd, struct simatic_ipc_led, cdev);
> >
> > One line?
>
> 80 columns. It is fine as it is.

With the inline helper it will be possible to have this neat and short.

-- 
With Best Regards,
Andy Shevchenko
