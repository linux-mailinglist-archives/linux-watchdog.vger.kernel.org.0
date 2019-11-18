Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 403011007E1
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 16:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfKRPJd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 10:09:33 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44031 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfKRPJc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 10:09:32 -0500
Received: by mail-oi1-f194.google.com with SMTP id l20so15566517oie.10
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Nov 2019 07:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JTR4B3/bjyMBoeEoqvqbK+mes5crRSS49ciiIaSp6Ww=;
        b=rB54GK0C1XD2+nIkM6gY7xhcBEiQkQrOE9zZQM5TWfMwmNVYg7YPBeY/wpSlYqBBc/
         viBmdMGlSgfi35QnZm2yNaDLPCusjq3l9ghQZM9URF1Qs64cuAFYipFml7Gg6qf2c17W
         idYcPFJEHGc52YwbctAa54cUG8abP7w+Txq2NRSGhJfhFh+qLrCw7XG2TL12KSPgO83s
         9lwRlee67+vCE4DGyiQ6xBtZ6Oa/1bZWp0nRqOk/ntoVUeFBP282+Apdp5wzbtszZuVe
         E9eiFIsGc/4HHEaZ3t1dV7lqT2q4JHgWU3oGz9t10+LpiP54h+6Ixqhxcy1UfD8+aybY
         wKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JTR4B3/bjyMBoeEoqvqbK+mes5crRSS49ciiIaSp6Ww=;
        b=gmnRlXFv5I5GtAYOeAa7ncKSfjc4b2Mzijyp7UnbUZzWQoUqCAb0tdjYYo3z+K8rB4
         Bi5ugZg9axCHcVHYd9UKmWxBE1IaUYp/2tPify2t9keVtPGdWeE8iDHBcJgzT6oErVTZ
         cl2ClPifeCrQL+/3iLXW7RdrV2X6WSFxaWvOIT8Kfc3w7UAzMPmyNMNoy66kXpRb3IXS
         Z3FYINOX18Du6oxd8nWzuAj6n32FYvRJ6ELLDVXgjSgzRs6yn2Wau+piNMDWushntyCK
         6MMPivdNOF+Q9nctkHVdDTu/MA3VQdlXEX8f0Hmh7EQm5cF0etA7Qk+ywsBF+2HM7hca
         6R2w==
X-Gm-Message-State: APjAAAX+7xQl4scA2dVaUH/zfWW8FMdJb6Fz5gwlW5OC8uGfdX+E5YwT
        R1J6KQHwOJFi5CtH0WyKbXrM51rW0B9uCSJBWnc=
X-Google-Smtp-Source: APXvYqxsH7y/CXkyFeAdAkiaQfXinGAU0LRC7+DMqkl88xW6fwE6Qj33/4f9QMnB5zKprlhBIKvI5PPKwYnxvrJkc4k=
X-Received: by 2002:aca:39d7:: with SMTP id g206mr19482099oia.101.1574089771544;
 Mon, 18 Nov 2019 07:09:31 -0800 (PST)
MIME-Version: 1.0
References: <CAHhAz+h6SuGKWn0qNqsCdNjDks_vHuJW-KfiQja_b3x8x=vq_A@mail.gmail.com>
 <20191118143838.GA29359@google.com>
In-Reply-To: <20191118143838.GA29359@google.com>
From:   Muni Sekhar <munisekharrms@gmail.com>
Date:   Mon, 18 Nov 2019 20:39:19 +0530
Message-ID: <CAHhAz+j7v-Utpir8wyCVORv_fthdLLg_spR_G+8TjBBSyJa6wA@mail.gmail.com>
Subject: Re: watchdog: how to enable?
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 18, 2019 at 8:08 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [-cc linux-pci (nothing here is PCI-specific)]
>
> On Sat, Nov 16, 2019 at 06:05:05AM +0530, Muni Sekhar wrote:
> > My kernel is built with the following options:
> >
> > $ cat /boot/config-5.0.1 | grep NO_HZ
> > CONFIG_NO_HZ_COMMON=3Dy
> > CONFIG_NO_HZ_IDLE=3Dy
> > # CONFIG_NO_HZ_FULL is not set
> > CONFIG_NO_HZ=3Dy
> > CONFIG_RCU_FAST_NO_HZ=3Dy
> >
> > I booted with watchdog enabled(nmi_watchdog=3D1) as given below:
> >
> > BOOT_IMAGE=3D/boot/vmlinuz-5.0.1
> > root=3DUUID=3Df65454ae-3f1d-4b9e-b4be-74a29becbe1e ro debug
> > ignore_loglevel console=3DttyUSB0,115200 console=3Dtty0 console=3Dtty1
> > console=3DttyS2,115200 memmap=3D1M!1023M nmi_watchdog=3D1
> > crashkernel=3D384M-:128M
> >
> > When the system is frozen or the kernel is locked up(I noticed that in
> > this state kernel is not responding for ALT-SysRq-<command key>) but
> > watchdog is not triggered. So I want to understand how to enable the
> > watchdog timer and how to verify the basic watchdog functionality
> > behavior?
>
> I don't know much about the watchdog, but I assume you've found these
> already?
>
>   Documentation/admin-guide/lockup-watchdogs.rst
>   Documentation/admin-guide/sysctl/kernel.rst
>
> Do you have CONFIG_HAVE_NMI_WATCHDOG=3Dy?  (See arch/Kconfig)

I don=E2=80=99t have CONFIG_HAVE_NMI_WATCHDOG in kernel .config file.

$cat /boot/config-5.0.1 | grep CONFIG_HAVE_NMI_WATCHDOG

But tried to enable CONFIG_HAVE_NMI_WATCHDOG via menuconfig, but could
not able to find it. What is the role of CONFIG_HAVE_NMI_WATCHDOG?

Symbol: HAVE_NMI_WATCHDOG [=3Dn]

                                            =E2=94=82
  =E2=94=82 Type  : bool

                                                =E2=94=82
  =E2=94=82   Defined at arch/Kconfig:339

                                                =E2=94=82
  =E2=94=82   Depends on: HAVE_NMI [=3Dy]

                                                =E2=94=82
  =E2=94=82   Selected by [n]:

                                                =E2=94=82
  =E2=94=82   - HAVE_HARDLOCKUP_DETECTOR_ARCH [=3Dn]


  =E2=94=82 Symbol: HAVE_HARDLOCKUP_DETECTOR_ARCH [=3Dn]

                                                =E2=94=82
  =E2=94=82 Type  : bool

                                                =E2=94=82
  =E2=94=82   Defined at arch/Kconfig:346

                                                =E2=94=82
  =E2=94=82   Selects: HAVE_NMI_WATCHDOG [=3Dn]





--=20
Thanks,
Sekhar
