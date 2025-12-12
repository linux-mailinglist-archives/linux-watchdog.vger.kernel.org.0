Return-Path: <linux-watchdog+bounces-4686-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57397CB9E75
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 23:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9A20307CDCB
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 22:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875E3255F52;
	Fri, 12 Dec 2025 22:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UliDajN5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41ED14F125
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577065; cv=none; b=P1fItpt+TM2GoYbd8GkZFJFofQTd98DGAsxZw/7lyxn9D3mlrzJclwluNUEWBcoyl7mZnWNxfcNcWyt+ghgUsjAGaCVeuN4lmwZDeZXFkXnLxH7wzWQ4/jG2U3dEklXFt8cqoULMfqMsQwPyaX1H6k0B3Zyx8b1Dfn6ZgsysZPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577065; c=relaxed/simple;
	bh=4v/4kyvCp5ARMxYyomdQUM82kp8yXQy0wcrsgshyOOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRT4rzUQhGDn+XOfxfIOYMUBypeIZXF8E+KPxd/EqXdCt8XShe3uho6ZPorAlPqaHv8Ol/QBFvQds6WBnhaW6CUaiRZWQnblv7fA54ffXTfPGwbFuI3uJ5aNb7cLANnEWId4A1b6yYb6396z+RHnU3LWSO9Qk+pgj1hHsPviBmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UliDajN5; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9412f43cb9eso45463241.2
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 14:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765577062; x=1766181862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLZl8fRG70f5QaiASXfflPgvh/orS/1uDnFpV7aJvnI=;
        b=UliDajN5sUSNfOJdBb4CYXubOfTmb5Wc0gaevAW1vwzlrRWjqunObHMVckIrrfuW+n
         njgm7eCWeFnJzwbYt837FmHhbag++j9GTlWK0PKM7CVyOPmo5MYNDasaDBKv2vwWbt7G
         P2G+p6kW3nmM9aUAVj+P2ss1JRk5fnhsAT520QKG7LhhBwkfmIMrsSHRe5Yy0iEuha67
         e4WHEEdHcoHv5yij4r3LHZjHlBvRMnfUtrtA0slqoFPqF7XrnpslBG5AtIsOfHTM5tAq
         bosfW72TN5HqHvCKP4djtD8SEHSVrx9J831qoYBYd3xgrNU3TAT+Jwvg8AMnSqK3+NMI
         lfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765577062; x=1766181862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iLZl8fRG70f5QaiASXfflPgvh/orS/1uDnFpV7aJvnI=;
        b=Zt1BGAVsYKOBDawC5/Elug4UyvRxu19Ap7RbCA2vX81JvYNYp9XuaAtBO6V1MzyQ8v
         fB039+F3bNHHsmlF3NpSyjcFj70tLmevXAymGvijeEkvgkxG80YdHzIVazAsUx4M72PQ
         WTAiTEgbNrYvhlvAinRjGQ/e88rAePHfR/fP9Suz0Dlsf0XuvCIasdOclctuDgmrGaTp
         afBPfWbmVcBcfikUctc1TwYWtHZ0RMLuw1FcOYCOyuQlmpx/P8qBNNMQG5DtwD3hz+Tm
         gWCyqFnSiuTJvuLq1bubr8NRISlLBbjhjN44P+avcLVBrnXNcwJNV9PGJ1n/YvddvJJ8
         Ep3A==
X-Forwarded-Encrypted: i=1; AJvYcCXe32QnIYJ76t9Yp9jQgvaEzT9eFuCCTOSBNiBH6GfjmWWoBNiOiitk5yN/8huo2hcdZKIPLocuvUOYCPU+DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YythTMp/OPvqrK10pngrUf1k2xV9mg/pNqBEO0Q887eR2vR+lKW
	RzDjEWiF94rfFY8QfJhkE5Pur/rXL6UfZKL+VTWbek9KLXi1hxzr0B2wWz6Ti5li84Izop//b4K
	OcqshvhmEz8j0tBy4MDrTo0NdabsxMYMj2q9VEiQ=
X-Gm-Gg: AY/fxX4CekH0rZasXBSTvxvIZBQLBYjsPSod9AiZyKkOUl4+FtY+rYc6Uppyla51GOa
	dXBl8e54YCUIuUaTFEJ3xK2zr/YUYn7An2JUKhDOyvf61dXpx+msIqkeVaxFLp+LPIdRc1uoF3t
	UAhNQrEHn4wL8PnMZa2g5JthMilwe+vraVbTcAIU95vKsBmANFhLCUzx/XuS/8SZZT/49bXjNPb
	UKmQ+cCeN2uT91yfe8UBGM3o7tUROlNjynUTk40EtyvINXAmFxRPMpkMrE0YYDFLb6OfCiOMKkH
	4k8Y
X-Google-Smtp-Source: AGHT+IH520LXdK/XpmnhrP0/ZSrsBrpKJ26KoE2IAa0772Y+CC2HdU/z9y6aaGsux6KVjvNl88ZAdmYrVTmnI/AqiOE=
X-Received: by 2002:a05:6102:d8d:b0:5db:ce49:5c71 with SMTP id
 ada2fe7eead31-5e82768fdefmr1387283137.18.1765577061777; Fri, 12 Dec 2025
 14:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117.131124.1452225967649047223.rene@exactco.de>
 <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com> <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net>
In-Reply-To: <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 12 Dec 2025 15:04:10 -0700
X-Gm-Features: AQt7F2pMO3djXQ6yd3BYAN5PQWfGYsG73Zo62qQRQuvtvVUZc2KG1T7m2Q11D_Y
Message-ID: <CADvTj4okwTFALbEWtYKju2Q7MRFJOwRk4PEC77w9+Pk9nRBtzQ@mail.gmail.com>
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, wim@linux-watchdog.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 2:50=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 12/12/25 12:17, James Hilliard wrote:
> ...
> >     +       /* wdt already left running by firmware? */
> >     +       if (_wdt_running()) {
> >     +               pr_info("Left running by firmware.\n");
> >
> >
> > I'm wondering, is there a way other than looking at dmesg to identify i=
f
> > a wdt was left running by the firmware? I'm thinking having an ioctl or
> > similar could be useful as a way to notify a user that a BIOS or firmwa=
re
> > configuration change may be needed.
> >
>
> This is not a bug, so there is no need to notify the user in the first pl=
ace.
> The only reason for accepting the message is that I was tired arguing.
> It is even misleading, because loading the driver, starting the watchdog
> by touching the watchdog device, unloading it, and loading it again will
> likely trigger the message.

Yeah, I'm aware it's not a bug, I'm just thinking it might be good to have
watchdog drivers record the initial running state.

>
> Userspace can check if a watchdog is running by reading
> /sys/class/watchdog/watchdog<index>/state. Do that after loading the driv=
er
> and before starting the watchdog daemon and you'll see if the watchdog
> was running when the driver was loaded. But that doesn't mean it was
> running when the system booted; it only means that the watchdog was runni=
ng
> when the driver was loaded.

Hmm, this seems impossible in some configurations, AFAIU systemd's
watchdog is integrated into PID 1, so loading a watchdog daemon later
doesn't appear possible.

Maybe it would make sense to have a sysfs variable like
/sys/class/watchdog/watchdog<index>/initial_state so that
there's a way for userspace to determine if a watchdog was
already armed by the time the driver was loaded?

>
> Guenter
>

