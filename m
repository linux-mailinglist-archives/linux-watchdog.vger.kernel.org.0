Return-Path: <linux-watchdog+bounces-3546-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C1CABE1EC
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 19:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D07FE4C3AC9
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 17:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A022B27FD74;
	Tue, 20 May 2025 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDhPf4V0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D126B2C4;
	Tue, 20 May 2025 17:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747762762; cv=none; b=gFo2uOI4QFfsPVnEsMX2e2PMeHyoiElSNmVkPe6YzuYc72Epy4QaLqNAo0eGIxv+Zt0Bxo32gVfgXwsctbg5r9578nYLA6Zv7iD3E57Y+9i1+3J4rDl8P5mfp2aU4rG4l0gjS0x84YoguRK1DnwH8nv2SQPdR5CSacs8rj4jnhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747762762; c=relaxed/simple;
	bh=QM89OVSn6oFRiI0uGzP2UDQ698F7asNar2fVfWiWvYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2J1QMRiOchOXuh1nGcGXKwvb77NDCe4xW0MhvUf+0IsWacDNtzC1sPEUGuM0hfoGomXEgMKGH9iBz307BTQP8qRVGxYwGc4N0wYjl5nl7QUK8Y/I5//hbudAgH/ST0O8DzB4SDu3sanFLCsApG7r4n6DwZQ7lGhghtCzRu0QL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDhPf4V0; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476ae781d21so58017741cf.3;
        Tue, 20 May 2025 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747762758; x=1748367558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/cXnZFhK26rMDhHireAeksGXzd4YCvpdsNWOevRhCw=;
        b=dDhPf4V0YKi1YXLQ1r/QSykytMmgqpe5W3uLnz9yeWv3remsy9ckuQ4qNlWVicUAu0
         p9lEXWrdiOjjhPhoheLMHOgwC4cO/RKIzTefsJNNH9fWldbm4go3sNA7U8eRjMyiiKxK
         +W1qh3gWEyhPw7jKU9SCBw1jZds7Wb8/tlGD3MHx2sQFiQgHhaXyQQ7lOTOIAADrAx5c
         Jz6rKPpLGLdVJyDUdbRP6ayJ2uAu/Nf3qvT2DEoCw9D5jJa8iAzKfkPJoZF3qHRjw2yn
         jeCVLBQnWs4Yv3yqLb08YK4vsfcLs+mYx/+jj5xhp1uvmmlsTDs4rPXFOjICBMh3A0eu
         pmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747762758; x=1748367558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/cXnZFhK26rMDhHireAeksGXzd4YCvpdsNWOevRhCw=;
        b=nnlHmuNrHlwFhceV7tPanXunvcpU5z/aUK2Q0iOLPtR5Zi+dR1ijnj2vFHgUblkl3o
         bMFKfFnDm2w1sIOECyYT19ele4CIO8F/UZzra+flDe6KMiL/5DQdcFGqOy1SADsKSuCy
         wkj1umCSZfExKLfKmWqdNpIrfYnFm3dbo9rtEDX/GkqPeEj++vOVn/63+l3Q4TBCiD4S
         aN3kzU892RFNebzshT252qfoJqIWmx5pO1kYcLirfoZvFzWT+5NJBG5h3zlAiOLz/yUm
         COEFl5yTEYXm0JCYDc231OhqZ74hkcJmUaLZCABvE9kaNCWVODvXU6KsU66w0vuzMTRB
         YiUw==
X-Forwarded-Encrypted: i=1; AJvYcCUFAZdLLSN4FgWWl0RzC4Ie/gaXUXu8cwK9uf9uG+ClpDHkHMXY+qLHhxnQsDQ1MumxnDKQrGWeCmuY61I6@vger.kernel.org, AJvYcCUurSD0QvbfoC+lYnoYlABlcp7rm/vbmudu1qzN2Ip2frntSYrqBEBSAmd5KMZPIeJEDNLAvsa7Wny4@vger.kernel.org, AJvYcCVPbEpQUOIIwgIgvJ/hXySerJcduHWiaKPhEuyPfHYIiqAy+HI9150IejyJx8uzdNVhggpNR4r4fvbHGIzbJ+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYtGRHHbZslqGQv5wY3U5kHZDn8MCKZhxj3g+t2pUixut/Kf+d
	GMA08hgnhAErj13LcHnYc9dCk0SNR2iUkAD7qMIfDxv94iCyXosfhCCLQbSTsCNviLquMr3hrxe
	m5ShfycHGoMYZj6w3UJgMi/c8nrgJQ5aJ3Zxp
X-Gm-Gg: ASbGncuTlaik2mKxlMaBrtongXaCJX2uqcc51ZH4nrHByjTyXSHQEpgCMgDFL4tJidh
	HoR7gXXX4RqJUgu3T/q7UeYaPHxgsMdOK1/OVFhiMJsopFL008opgJlui5RyRXrw2SDuwUpqgXk
	NFCdNNa7YnvZerO7I+ZIkRnKIlmi0xs2OyM9rFB+PLPoYEJoYpdBL2k+/IVX7PAAGvvA==
X-Google-Smtp-Source: AGHT+IGCy8Dky2uDFs544GvIZ3DEH0oxECMeS+ZNPaiNhH+aATrtk0AVPWaVxOrcPA3K24xoB0ESl3vOs26Sf6ozux0=
X-Received: by 2002:a05:622a:6202:b0:476:76df:d26d with SMTP id
 d75a77b69052e-494b074f915mr256312981cf.8.1747762758261; Tue, 20 May 2025
 10:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>
 <202505180911.hDevFA1N-lkp@intel.com> <CABjd4YwJgZiq9_jKGa70GaxaW8TT=JuwDioU6jH=J_O=t+QT8w@mail.gmail.com>
 <f74dbbcb-1628-4280-92e8-d89823a3a318@roeck-us.net>
In-Reply-To: <f74dbbcb-1628-4280-92e8-d89823a3a318@roeck-us.net>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 20 May 2025 21:39:15 +0400
X-Gm-Features: AX0GCFu2VdGiOaPdTGNsD9E3jaLA46XfuVGvrGU1UJ1V9x-G8SIxw9EzEocSyA4
Message-ID: <CABjd4YyXwznntcLVcYL6qx16YEwv4_VWzrXrE7_QHmQxiE0pXQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, oe-kbuild-all@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:34=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 5/19/25 04:34, Alexey Charkov wrote:
> > On Sun, May 18, 2025 at 5:24=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> >>
> >> Hi Alexey,
> >>
> >> kernel test robot noticed the following build warnings:
> >>
> >> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/=
dt-bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
> >> base:   92a09c47464d040866cf2b4cd052bc60555185fb
> >> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates=
-v3-3-2197a1b062bd%40gmail.com
> >> patch subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepar=
e for watchdog functionality
> >> config: loongarch-randconfig-r123-20250517 (https://download.01.org/0d=
ay-ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/config)
> >> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> >> reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180=
911.hDevFA1N-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202505180911.hDevFA1N-=
lkp@intel.com/
> >>
> >> sparse warnings: (new ones prefixed by >>)
> >>>> drivers/clocksource/timer-vt8500.c:201:51: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *platfo=
rm_data @@     got void [noderef] __iomem *static [assigned] [toplevel] reg=
base @@
> >>     drivers/clocksource/timer-vt8500.c:201:51: sparse:     expected vo=
id *platform_data
> >>     drivers/clocksource/timer-vt8500.c:201:51: sparse:     got void [n=
oderef] __iomem *static [assigned] [toplevel] regbase
> >>
> >> vim +201 drivers/clocksource/timer-vt8500.c
> >>
> >>     175
> >>     176  /*
> >>     177   * This probe gets called after the timer is already up and r=
unning. This will create
> >>     178   * the watchdog device as a child since the registers are sha=
red.
> >>     179   */
> >>     180  static int vt8500_timer_probe(struct platform_device *pdev)
> >>     181  {
> >>     182          struct platform_device *vt8500_watchdog_device;
> >>     183          struct device *dev =3D &pdev->dev;
> >>     184          int ret;
> >>     185
> >>     186          if (!sys_timer_ch) {
> >>     187                  dev_info(dev, "Not enabling watchdog: only on=
e irq was given");
> >>     188                  return 0;
> >>     189          }
> >>     190
> >>     191          if (!regbase)
> >>     192                  return dev_err_probe(dev, -ENOMEM,
> >>     193                          "Timer not initialized, cannot create=
 watchdog");
> >>     194
> >>     195          vt8500_watchdog_device =3D platform_device_alloc("vt8=
500-wdt", -1);
> >>     196          if (!vt8500_watchdog_device)
> >>     197                  return dev_err_probe(dev, -ENOMEM,
> >>     198                          "Failed to allocate vt8500-wdt");
> >>     199
> >>     200          /* Pass the base address as platform data and nothing=
 else */
> >>   > 201          vt8500_watchdog_device->dev.platform_data =3D regbase=
;
> >
> > Frankly, given that this driver only applies to VT8500 (which is ARM
> > based), the warning appears a bit overzealous. After all, on ARM MMIO
> > addresses are in the same physical address space as normal memory
> > addresses, and furthermore this platform_data is never dereferenced
> > directly anyway.
>
> Guess we'll need AI compilers in the future to help them know that.
> I for my part would argue that "this warning can be ignored" is the
> source of many problems flying under the radar.
>
> >
> > I could silence the warning either by more aggressive casting or by
> > wrapping the pointer into some struct, but both of those sound a bit
> > overreaching. Would appreciate guidance from the list on how to best
> > approach this.
> >
>
> First of all, I am quite sure that using platform drivers for this is the
> wrong approach to start with. This seems to be a perfect candidate for
> an auxiliary driver.

TIL: auxiliary bus :)

Thanks for the pointer Guenter, it does indeed look like a more
appropriate choice. I'll try and port the driver to use that instead,
and resubmit.

> Second, I do consider passing an iomem pointer as platform data to be
> inherently unsafe. I would very much prefer either passing a regmap
> pointer or, if that doesn't work, a data structure.

I guess it resolves itself with the auxiliary driver approach, as I
can then just upcast the auxiliary device pointer to the parent's
enclosing private struct, which can then contain both a timer read
function and the specific pointers to the two registers the watchdog
needs. No need then for the child to do its arbitrary offsets into the
parent's iomem region - just use what's given directly. It's still
going to be iomem pointer access, but on the other hand putting a
layer of indirection (i.e. regmap) into the system timer code sounds a
bit scary to me.

Best regards,
Alexey

