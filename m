Return-Path: <linux-watchdog+bounces-2235-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BD9A4220
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 17:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36D91F24DEC
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 15:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893911F429A;
	Fri, 18 Oct 2024 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDRPxfXk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2091F4264;
	Fri, 18 Oct 2024 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729264738; cv=none; b=dwjwI6DykQgSsR+9Z1TwLBnajtMylU8Tab1UYhUn5SOGb6TCAeiasWF8vcDIpk1XFyA7nFHYm75Guk4DlsUplUotW6I4tWbR1Y2lclsF1Um1DjAjbt/EfgN0ztfQMhQug+8jb6tSJzLuXNUjATD07Ga2aRx7qjpdb+7KbM16qak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729264738; c=relaxed/simple;
	bh=nVfa+imeiHbMcXl3EHSK5pbE+r26B0V/5kqtTnUoIMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTwb3Fax8UdKQ5PzhRoyAiFqb02NPJRa3ftSRcXuU771zO+R8PMy3KNmoPx2XuWxkjh6qhkmBt9YekcW064PZQqU3vLqCtgrqLsuHjPrAMvvINyW+fJy/oKpj6sijcMu0incfnA7uXH6CrD+tKvAz+hQvSTfvlgiej5nYK/gmVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDRPxfXk; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e5f86e59f1so1118350b6e.1;
        Fri, 18 Oct 2024 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729264735; x=1729869535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVfa+imeiHbMcXl3EHSK5pbE+r26B0V/5kqtTnUoIMQ=;
        b=aDRPxfXkw38Vh2ctFcn56MrFRG3kFfZvNYJjdNKd3sadutQ8brkWlvlWHIa5qObV40
         aXbEkNwY7XuTvL/YbbAChWyBEoE7drnmAghUnY/xN+Kc6RdZp8YIXEqSOH0Lr7kYvelg
         ltaPS5f4C0nhWI95fUidpPO9HWTrzRc50pYsaiHQgBUbDJ+EnvwxbXeBMeGTf/al1KuV
         vOAqQb+KMsM2sjLbVJGw5zUP4eEyhOzg7bCmC3JPR3LJJA7eiGXufFziJ+JxDkk1hG2c
         zVICsSLu63xoTDTK/ODv/2uU+WzxDAljz5sOSlddAPi/VPuGIJgscar8aXwNsq5+XH1S
         bqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729264735; x=1729869535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVfa+imeiHbMcXl3EHSK5pbE+r26B0V/5kqtTnUoIMQ=;
        b=CPDr6up1huOk0NH1DZo0cCLQpOycRqGdJXo0xWkxisGbI55A1FzyuGyUzLGiTy2LjO
         75WOA8AlKX6ywysrUHU4XIF1+sCdZyqd6AsBmKizwJ6089XneXU/MeZwfYrakNUJJxSy
         QXx4L1HZbnbB3aO/Vj/Uz2FjXLvxQQ5Fd6LR/E5OJvMMoBNZnqxKlUZlvSzvVgkDGjoQ
         i3bBNuAcQ6yr2HYqOQJcGPoTUoizigxSNJU4IOsHbZOeW6ezsh1wSfUdbxvSY4PMNyQS
         Lfco1occT0vfcZVdgAqtF0Age5hYiwAPaG6R3VH8QM5lO4IaZ+qzo7llxsdHP/VZXJ6U
         VZag==
X-Forwarded-Encrypted: i=1; AJvYcCUVM3CRyWqONi1hBGP/MrmeMp6WxGLHJZoQfI/0qEzOZNl/HRuxgdoGLDiKKHl6c+NYQmGMfSdoeIyXZZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBcK1dHJQYNzlTeNAk7YsuwtMiQLahHhtUWSe5w2Et1vodY0gX
	QXFMZDm5SJAgukAD1v9xC+Rcd96VLv2FDByn+15lvFV0X4DSV5r5GTaSZHJZhmziVDCQBZWHysS
	kU08yZl6vaTMqA5JIMlX4hA3x/hXxzWPR
X-Google-Smtp-Source: AGHT+IHZKpl9hVDnEIZrXjZqWd+5h7zBspkclj83B7EHcIfWawJ8Xh3LC0qhnqnr7Ah5V11j4UM7E4/C5JNSFWbr9mQ=
X-Received: by 2002:a05:6808:200e:b0:3e5:db57:c479 with SMTP id
 5614622812f47-3e602c7aa71mr2695763b6e.3.1729264735576; Fri, 18 Oct 2024
 08:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018030917.2540841-1-james.hilliard1@gmail.com>
 <66922a0b-6e30-4501-9262-8bdd224155f9@roeck-us.net> <CADvTj4pnYn478mzM6LQFJ7x1SBANY_Q4JBygTUqx2PnJgJkQxg@mail.gmail.com>
 <20a922fb-6703-4712-9818-8e97c38b5148@roeck-us.net>
In-Reply-To: <20a922fb-6703-4712-9818-8e97c38b5148@roeck-us.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 18 Oct 2024 09:18:44 -0600
Message-ID: <CADvTj4rmPdWqf2ohJenzxXupFq5gpwr4dofjS3vU=q0wTtoFNQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: it87_wdt: add quirks for some Qotom IT8786 boards
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 4:09=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/17/24 21:29, James Hilliard wrote:
> > On Thu, Oct 17, 2024 at 9:59=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 10/17/24 20:09, James Hilliard wrote:
> >>> For the watchdog timer to work properly on the QCML04 board we need t=
o
> >>> set PWRGD enable in the Environment Controller Configuration Register=
s
> >>> Special Configuration Register 1 when it is not already set, this may
> >>> be the case when the watchdog is not enabled from within the BIOS.
> >>>
> >>> For the Qotom QGLK02 board the vendor indicates that the IT8786
> >>> watchdog hardware is not functional due to a conflict with the BIOS
> >>> power-on function, with PWRGD set the watchdog will trigger but the
> >>> board will poweroff rather than restart as expected. Disable the
> >>> it87 driver on this broken hardware.
> >>>
> >>
> >> This shouldn't be done in drivers, and it doesn't scale. The driver ne=
eds
> >> to be disabled with the mechanism supported by the distribution, for e=
xample
> >> in /etc/modprobe.d/blacklist-watchdog.conf, or by whatever other mecha=
nism
> >> the distribution supports for that purpose.
> >
> > There isn't really a good way that I've found with my setup since I use=
 common
> > images for both of these boards. I'm also worried that it's much easier=
 to mess
> > something critical like this up if user space is involved in hardware d=
etection.
> >
> > Many other watchdog drivers do this sort of thing so I'm a bit confused=
 why we
> > would want to not do that here as well, for example:
> > https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/renesas_w=
dt.c#L176-L207
> > https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/ebc-c384_=
wdt.c#L125
> > https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/lenovo_se=
10_wdt.c#L242-L285
> > https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/sbc_fitpc=
2_wdt.c#L203-L206
> >
>
> Those are specialty watchdog drivers, which only work on a very limited n=
umber of boards
> to start with. For the most part they use DMI data to determine if the wa=
tchdog is supported
> on a board, not to determine if a watchdog isn't supported.
>
> The it87 driver works on thousands of boards, and is not wired up on a su=
bstantial percentage
> of them. In many cases, systems with ITE Super-IO chips have two Super-IO=
 chips installed
> (one of them typically being an IT8786), and only one of those (or none) =
will have the watchdog
> wired up. Many boards with Intel CPUs use the iTCO watchdog and don't hav=
e the Super-IO
> watchdog wired up at all. Trying to maintain a deny-list for all boards w=
here the watchdog
> isn't wired up would not scale.

Hmm, so what would scale then? I mean obviously having every user manually
configure watchdog drivers scales even worse than trying to maintain a deny=
-list
as users are generally going to expect drivers to work properly without man=
ual
configuration.

Maybe something like hid-quirks would work better here for matching the
correct watchdog driver on systems where multiple watchdog drivers
otherwise detect a watchdog as being present?:
https://github.com/torvalds/linux/blob/v6.11/drivers/hid/hid-quirks.c

>
> Guenter
>

