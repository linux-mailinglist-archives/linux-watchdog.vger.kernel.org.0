Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD341007DC
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 16:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfKRPHl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 10:07:41 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38264 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfKRPHl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 10:07:41 -0500
Received: by mail-oi1-f195.google.com with SMTP id a14so15591324oid.5
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Nov 2019 07:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MlH+SBZG4ty81nEv5bwhNL4D+TFmDzFiHXkc3d7vDz0=;
        b=D5+bVu9+nl8/mD9vAvc+/Vuk6VQW32jldaz8Sut0c0RSGaTgAtwcwfylJl2CKCYxLU
         UGZY7d3W8eL7jfwRwvE3rEbSHhNB7gh2hb4o/E3nL4zoqvnAeYsyGnKLkmLrSFNVjx4H
         2ZxjyxE2qSDSHz9827Rhz4TwfLpyRB3u4UA8YUEtQg0Gdycd1XnS6XVeSleQT7Wxl5a3
         ttNhPOoUdUaKgz7stS72VKpXRhDYFErZ0W56jhb2TSDMjvDZXZvpRzKsJH3cJF5JD+ar
         ewJlbCvlRl54Sunkb4ure0KoRsba1g01mE5uc8BSBsNBxGXH+eJk6wQOs9Tw+8kdycC7
         9vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MlH+SBZG4ty81nEv5bwhNL4D+TFmDzFiHXkc3d7vDz0=;
        b=XABFiyngricPVFbgEZnmEil63W2i9FGUGvrplj1j1hiNd2TYHTqSEu1IhRIjPmVx47
         yHZU+EBCqrPmvRs85F9Qm6I1q0LcCWEky7qUe1qFq1VtwxoByaZ8HYBfa84aqiHCoIDn
         lGAqwdLVWlwyZ3FDBpUk+rsMsC+e0frYFmYjT28QdieWPW31q6mow+C2XnYgekxF3HTr
         iSrSDaEmq0UID2zRvtnX2rToUw5gFzHQtYqqbhsyU05eokPXrs9CigPDMNZ2//a8a/uY
         qqxSNng9Vsm+RXZxp1YhQUPoJ/S/ED9n60hL230Idd8+mzecENrLSD10zZiDZZgq6Mgi
         i4Ow==
X-Gm-Message-State: APjAAAUhQmNsdj0OHpVjucAl1pXI9WdAFrDkm4rWZAvbq3NFZMt9OdLI
        FESLzPHxwEuqBkSE5A00rPm4C5K1go3EBjKBBkrcimT/cjg=
X-Google-Smtp-Source: APXvYqznzGupSt5wVuI5K2NC4n77cmIbYfVaPKRI0BcNcQbGseGVNa16ZIDuKTDK8k0HRrAYMnicuDWVTX0PPUlbQ3I=
X-Received: by 2002:aca:da85:: with SMTP id r127mr15918948oig.128.1574089660006;
 Mon, 18 Nov 2019 07:07:40 -0800 (PST)
MIME-Version: 1.0
References: <CAHhAz+h6SuGKWn0qNqsCdNjDks_vHuJW-KfiQja_b3x8x=vq_A@mail.gmail.com>
 <0d5c20b1-6b0f-430b-17b0-d3624062020d@roeck-us.net> <CAHhAz+iSXZSY012-jNx_wmNmgx_UiHZ4rjxkCUcHk3CjLc9gDg@mail.gmail.com>
 <e5b24949-5215-9d3d-ca45-cab221d4f58a@roeck-us.net> <CAHhAz+i83WoGyNwF_sjN+rVH812Nvm=U8ddbv-gWuNbD05HPdg@mail.gmail.com>
 <e4147248-b710-6c8f-530c-1dd6672da8ab@roeck-us.net> <CAHhAz+gGPaNTO1VR2iBBDFEdJ+cJx6+CNoAneLj6yTW0hgEfkA@mail.gmail.com>
 <da120ac6-062a-3dcc-e635-979fdd021592@roeck-us.net>
In-Reply-To: <da120ac6-062a-3dcc-e635-979fdd021592@roeck-us.net>
From:   Muni Sekhar <munisekharrms@gmail.com>
Date:   Mon, 18 Nov 2019 20:37:26 +0530
Message-ID: <CAHhAz+jA-7518cyYvBySbqxtTCUfsiHN4NbZW3mSaqu8F9Zm=g@mail.gmail.com>
Subject: Re: watchdog: how to enable?
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 18, 2019 at 7:40 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/18/19 1:52 AM, Muni Sekhar wrote:
> > On Sun, Nov 17, 2019 at 3:12 AM Guenter Roeck <linux@roeck-us.net> wrot=
e:
> >>
> >> On 11/16/19 10:34 AM, Muni Sekhar wrote:
> >>> On Sat, Nov 16, 2019 at 9:31 PM Guenter Roeck <linux@roeck-us.net> wr=
ote:
> >>>>
> >>>> On 11/15/19 7:03 PM, Muni Sekhar wrote:
> >>>> [ ... ]
> >>>>>>
> >>>>>> Another possibility, of course, might be to enable a hardware watc=
hdog
> >>>>>> in your system (assuming it supports one). I personally would not =
trust
> >>>>>> the NMI watchdog because to detect a system hang, after all, there=
 are
> >>>>>> situations where even NMIs no longer work.
> >>>>>
> >>>>> >From dmesg , Is it possible to know whether my system supports
> >>>>> hardware watchdog or not?
> >>>>> I assume that my system supports the hardware watchdog , then how t=
o
> >>>>> enable the hardware watchdog to debug the system freeze issues?
> >>>>>
> >>>>
> >>>> Hardware watchdog support really depends on the board type. Most PC
> >>>> mainboards support a watchdog in the Super-IO chip, but on some it i=
s
> >>>> not wired correctly. On embedded boards it is often built into the S=
oC.
> >>>> The easiest way to see if you have a watchdog would be to check for =
the
> >>>> existence of /dev/watchdog. However, on a PC that would most likely
> >>>> not be there because the necessary module is not auto-loaded.
> >>>> If you tell us your board type, or better the Super-IO chip on the b=
oard,
> >>>> we might be able to help.
> >>>
> >>> I=E2=80=99m having two same configuration systems, in one system I in=
stalled
> >>> the Vanilla kernel and I see the /dev/watchdog and /dev/watchdog0
> >>> nodes. In other system I=E2=80=99m running with ubuntu distribution k=
ernel,
> >>> but I don=E2=80=99t see any watchdog device node. So it looks like I =
need to
> >>> manually load the kernel module in distro kernel. Is there a way to
> >>> know what is the corresponding kernel module for  /dev/watchdog node?
> >>>
> >>> # ls -l /dev/watchdog*
> >>> crw------- 1 root root  10, 130 Nov 15 17:15 /dev/watchdog
> >>> crw------- 1 root root 248,   0 Nov 15 17:15 /dev/watchdog0
> >>>
> >>> # ps -ax | grep watchdog
> >>>     678 ?        S      0:00 [watchdogd]
> >>>
> >>> Regarding Super-IO chip, how to find out the Super-IO chip model?
> >>>
> >> You could try to run sensors-detect (from the "sensors" package).
> >>
> >> If you can boot a system with /dev/watchdog0, you should see the type
> >> in /sys/class/watchdog/watchdog0/identity.
> > I could not find the /sys/class/watchdog/watchdog0/identity and
> > /sys/class/watchdog/watchdog0/timeout files.
> > $ ls -l /sys/class/watchdog/watchdog0/
> > total 0
> > -r--r--r-- 1 root root 4096 Nov 18 15:12 dev
> > lrwxrwxrwx 1 root root    0 Nov 18 15:12 device -> ../../../iTCO_wdt.0.=
auto
> > drwxr-xr-x 2 root root    0 Nov 18 15:12 power
> > lrwxrwxrwx 1 root root    0 Nov 18 14:53 subsystem ->
> > ../../../../../../class/watchdog
> > -rw-r--r-- 1 root root 4096 Nov 18 14:53 uevent
> >
>
> Presumably CONFIG_WATCHDOG_SYSFS is not enabled in your configuration.
>
> >>
> >> Also, you can test if the watchdog works with "sudo cat /dev/watchdog"=
,
> >> assuming the watchdog daemon is not running. The watchdog works if the
> >> system reboots after the watchdog times out (/sys/class/watchdog/watch=
dog0/timeout
> >> is the timeout in seconds).
> > sudo cat /dev/watchdog perfectly rebooted my system. I don't see
> > timeout node, how do I configure the timeout value?
>
> sudo apt-get install watchdog
> man watchdog
>
> should tell you. Alternatively, enable CONFIG_WATCHDOG_SYSFS.
>
> >>
> >>>>
> >>>> Note though that this won't help to debug the problem. A hardware
> >>>> watchdog resets the system. It helps to recover, but it is not inten=
ded
> >>>> to help with debugging.
> >>> How do I use the hardware watchdog to reset my system when system is
> >>> frozen? It helps me to collect the crashdump and finally helps me to
> >>> find the root cause for the system frozen issue.
> >>>
> >> There won't be a crashdump. It just hard-resets the system.
> > So is there any other solution to capture the crashdump or trigger
> > soft reboot once kernel is lockedup?
>
> Not that I know of. I suspect, though, that you either have a hard lockup
> where even NMI is non-operational, or NMI doesn't work in your system
> to start with.
>
> If you have nmi_watchdog=3D1 in your kernel command line, /proc/interrupt=
s
> should show a non-zero number of NMI interrupts. Do you see that in your =
system ?

Yes, I see non-zero number. When it(NMI interrupt count) supposed to change=
?

$ cat /proc/interrupts | grep NMI
 NMI:       4129       4153       4192        183   Non-maskable interrupts

$ dmesg | grep NMI
[    0.402175] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.402199] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.402220] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.402242] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    4.636467] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    4.658289] | NMI testsuite:
[   13.863284] INFO: NMI handler (kgdb_nmi_handler) took too long to
run: 9.744 msecs

Also I enabled pstore\ramoops. While testing the hardware watchdog by
running 'sudo cat /dev/watchdog', I see that console dump updates
between next boot. I see the same behavior consistently.

$ cat /sys/fs/pstore/console-ramoops-0
[  293.462623] printk: console [pstore-1] enabled
[  293.471026] pstore: Registered ramoops as persistent store backend
[  293.477800] ramoops: using 0x100000@0x3ff00000, ecc: 16
[  315.461263] systemd-journald[1665]: Sent WATCHDOG=3D1 notification.
[  317.447791] watchdog: watchdog0: nowayout prevents watchdog being stoppe=
d!
[  317.456616] watchdog: watchdog0: watchdog did not stop!
No errors detected

Now I installed the watchdog daemon and started that service before
the kernel locks up. On triggering few tests kernel locked up and
hardware watchdog triggered the reset, but in this case I don't see
console-ramoops-0 file. Only difference is , this time 'watchdog'
daemon triggered the hardware watchdog. Not sure why console dump not
updated in this scenario?


>
> Guenter



--=20
Thanks,
Sekhar
