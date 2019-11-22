Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAA3A107286
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 13:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfKVMyt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 07:54:49 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34061 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfKVMys (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 07:54:48 -0500
Received: by mail-ot1-f65.google.com with SMTP id w11so6097210ote.1
        for <linux-watchdog@vger.kernel.org>; Fri, 22 Nov 2019 04:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j95HJ+nW6cJV5FbqnwQq2oUU5AzggiyFmjXhPsXGGkA=;
        b=KeHQ7CuY1RiuGSNN9lSXKXlmkvEL7Qn3cjnjc70Pe/6CR2+WrnYQgx9m5VMLNIh11O
         SiipFXxlSFRaMckkisT6Gjvi0Ycf2C1LtS6/w4Dxpd5sayx6GPVIreZlKNq/8TUx1EID
         g7jN0TJnY71FbfothIHM4aK7/nZpSifSdTC/fgk78P51AkyblzwJWH7i5k69OafW3iCJ
         ov/Rz+3a9Ef5E0n8jihXEbKgXlgb/ltvwkVCMOXn5V5zk8GEevksjY5OmVCffM+I4TVA
         75dkI4vxahIrTQeJTiwYmfUey00X9CgUHs6tWT0G3JUq9xYvBBD5a729bkPL5pXQA4Oo
         EOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j95HJ+nW6cJV5FbqnwQq2oUU5AzggiyFmjXhPsXGGkA=;
        b=VFvzhiqqHNP6HjZjvGTPQayCSA1y13W4/kHpZwVOfWia1c53kldNdMYhegcOHluVIo
         xw2aZRlRTbaSSpusHo+ANrnlbqeALomSkF7qVMZ8C1pbLpNgSSYDlPN9Bj/wPaL2umPE
         mDoDNu+T/Hsh5K1+p1oPp1T8d7roLZhfOI45TgNbCijpJ9245SmmpExt93Cs6ILqZHk/
         Rg+MPDcxfv7QEKFM1hUjCkZ8cQzWEYTQcke2/eOwdaiukZcNmDoEtOQnxJocgTYknSQv
         nsTIF0zNIU12COidlEmjPiwh8f4n/hvj3WUlagMQ0QDrWaaNqX/Poe1Nne0hrPf2jdRV
         APIQ==
X-Gm-Message-State: APjAAAVogU5X+AUMmzxYf7NSwOPYixUSQfSFypgjzJ5XjJfSlTRjP7q/
        P1Ua4sxCfL2JOEV0FB8rJTTXRYN9BH9bOOwkoxY28TXQpEo=
X-Google-Smtp-Source: APXvYqzQ6zX4zZtb6UoV9LagLBMvZRMTDYTNcBOvl1shgQqQe6GivRK+HlB4l2bu70h/KBSdrlNY7XAMaSPhqzCbgIQ=
X-Received: by 2002:a05:6830:d5:: with SMTP id x21mr10970391oto.310.1574427287719;
 Fri, 22 Nov 2019 04:54:47 -0800 (PST)
MIME-Version: 1.0
References: <CAHhAz+h6SuGKWn0qNqsCdNjDks_vHuJW-KfiQja_b3x8x=vq_A@mail.gmail.com>
 <20191118143838.GA29359@google.com> <CAHhAz+j7v-Utpir8wyCVORv_fthdLLg_spR_G+8TjBBSyJa6wA@mail.gmail.com>
 <f28024de-bfad-5f3e-6332-aebfa48991a8@roeck-us.net>
In-Reply-To: <f28024de-bfad-5f3e-6332-aebfa48991a8@roeck-us.net>
From:   Muni Sekhar <munisekharrms@gmail.com>
Date:   Fri, 22 Nov 2019 18:24:36 +0530
Message-ID: <CAHhAz+jtq84Va9arE5EXB9w7XgYj4CNU-dCudvpjRaaYf1JT4g@mail.gmail.com>
Subject: Re: watchdog: how to enable?
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, linux-watchdog@vger.kernel.org,
        wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 22, 2019 at 4:29 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/18/19 7:09 AM, Muni Sekhar wrote:
> > On Mon, Nov 18, 2019 at 8:08 PM Bjorn Helgaas <helgaas@kernel.org> wrot=
e:
> >>
> >> [-cc linux-pci (nothing here is PCI-specific)]
> >>
> >> On Sat, Nov 16, 2019 at 06:05:05AM +0530, Muni Sekhar wrote:
> >>> My kernel is built with the following options:
> >>>
> >>> $ cat /boot/config-5.0.1 | grep NO_HZ
> >>> CONFIG_NO_HZ_COMMON=3Dy
> >>> CONFIG_NO_HZ_IDLE=3Dy
> >>> # CONFIG_NO_HZ_FULL is not set
> >>> CONFIG_NO_HZ=3Dy
> >>> CONFIG_RCU_FAST_NO_HZ=3Dy
> >>>
> >>> I booted with watchdog enabled(nmi_watchdog=3D1) as given below:
> >>>
> >>> BOOT_IMAGE=3D/boot/vmlinuz-5.0.1
> >>> root=3DUUID=3Df65454ae-3f1d-4b9e-b4be-74a29becbe1e ro debug
> >>> ignore_loglevel console=3DttyUSB0,115200 console=3Dtty0 console=3Dtty=
1
> >>> console=3DttyS2,115200 memmap=3D1M!1023M nmi_watchdog=3D1
> >>> crashkernel=3D384M-:128M
> >>>
> >>> When the system is frozen or the kernel is locked up(I noticed that i=
n
> >>> this state kernel is not responding for ALT-SysRq-<command key>) but
> >>> watchdog is not triggered. So I want to understand how to enable the
> >>> watchdog timer and how to verify the basic watchdog functionality
> >>> behavior?
> >>
> >> I don't know much about the watchdog, but I assume you've found these
> >> already?
> >>
> >>    Documentation/admin-guide/lockup-watchdogs.rst
> >>    Documentation/admin-guide/sysctl/kernel.rst
> >>
> >> Do you have CONFIG_HAVE_NMI_WATCHDOG=3Dy?  (See arch/Kconfig)
> >
> > I don=E2=80=99t have CONFIG_HAVE_NMI_WATCHDOG in kernel .config file.
> >
>
> That would mean you don't have NMI in the first place. What is your
> architecture ?

My system has =E2=80=9CIntel(R) Atom(TM) CPU  E3845=E2=80=9D processor and =
running
=E2=80=98uname -m=E2=80=99 gives x86_64.

/proc/interrupts gives the below statistics for NMI:

$ cat /proc/interrupts | grep NMI
 NMI:       4207       4167        125   Non-maskable interrupts


>
> Guenter
>
> > $cat /boot/config-5.0.1 | grep CONFIG_HAVE_NMI_WATCHDOG
> >
> > But tried to enable CONFIG_HAVE_NMI_WATCHDOG via menuconfig, but could
> > not able to find it. What is the role of CONFIG_HAVE_NMI_WATCHDOG?
> >
> > Symbol: HAVE_NMI_WATCHDOG [=3Dn]
> >
> >                                              =E2=94=82
> >    =E2=94=82 Type  : bool
> >
> >                                                  =E2=94=82
> >    =E2=94=82   Defined at arch/Kconfig:339
> >
> >                                                  =E2=94=82
> >    =E2=94=82   Depends on: HAVE_NMI [=3Dy]
> >
> >                                                  =E2=94=82
> >    =E2=94=82   Selected by [n]:
> >
> >                                                  =E2=94=82
> >    =E2=94=82   - HAVE_HARDLOCKUP_DETECTOR_ARCH [=3Dn]
> >
> >
> >    =E2=94=82 Symbol: HAVE_HARDLOCKUP_DETECTOR_ARCH [=3Dn]
> >
> >                                                  =E2=94=82
> >    =E2=94=82 Type  : bool
> >
> >                                                  =E2=94=82
> >    =E2=94=82   Defined at arch/Kconfig:346
> >
> >                                                  =E2=94=82
> >    =E2=94=82   Selects: HAVE_NMI_WATCHDOG [=3Dn]
> >
> >
> >
> >
> >
>


--=20
Thanks,
Sekhar
