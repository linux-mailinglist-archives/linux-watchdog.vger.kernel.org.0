Return-Path: <linux-watchdog+bounces-1357-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE52992F1C5
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 00:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A31D1F21CF8
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 22:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9A942AB5;
	Thu, 11 Jul 2024 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7RX05ZL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5B19FA72
	for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 22:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720736061; cv=none; b=UcvrJz/npfliX23zWvLJr9Ko1c/rD17kWen+91zbR1yCMXKCdlbSucEmzAydiIhBrhY8ZYAUh+lxIly846S7yghx8D1M2bTgHODTteh+sLEJN1heE+gv1vxc6G/MiMg1lUX0uo8gK/BegeVp+lt22fyGh/+kTj/6fql5er0nHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720736061; c=relaxed/simple;
	bh=QXJREbFPw77Njiu8EdpHaUlZsGzoR8eDWCD9Dn+0Y5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsEFvCFwKoibE6rLYkRGBoFoi80IfIOdU7C8tKdfeQlNDXEJLS5d8R/bYaF4MiYD36kpmDkKTNypKYVCial9iJ/FYIXnLDl806pQ8jChOkzicfPMRGMGFp/Ya70h3KXENTNP8G7dPW9ycGdF41LHqsHFl5XfnPkv4BEkQXXkSA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7RX05ZL; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-80fc4fe7a8eso669558241.1
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720736058; x=1721340858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXJREbFPw77Njiu8EdpHaUlZsGzoR8eDWCD9Dn+0Y5Y=;
        b=c7RX05ZL918S6tYHdfGnkYlrsRfEA19dWAIEw7VQtJL0lI5ixe7tSRNpeWgfhpAPuM
         TNx0TjG4sFvVj3x7ou2GlvSBWTUi239hWAqtYsDZVQBUlgQY69sMRrZHh898UaWMaKsX
         6/EED8MKpBRXp0TSWbXmczrDV2PRJQexykHe8Axl4oufAZL3vbogQuCElrNX+j6EgTj1
         z4uLjKAm3q0f5Qji6oMy/1RPUWK2iiRE+P6qdz0SN5G3ASGMk4wd/RYZKJp6nY2CXZIK
         kMj21uAleHZjLlVsg0R+N6/j7CPTZTndSSAVgRwkgQwbOAIf0CxsjZUEHoZ8uu4kbT8z
         B2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720736058; x=1721340858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXJREbFPw77Njiu8EdpHaUlZsGzoR8eDWCD9Dn+0Y5Y=;
        b=AZUFGSCzXM99QkEDkJPUoJDd4CYNyVUsNO4iKdysaozVYJCmPkHSvHjQgrZ/lfRPz3
         xZj0bNcEEITOp+3/WReoaCUsnENjojtxxg4MwfUiBHnie1n53S6ru7XM3rz0DkCFuVUy
         WLzU0pOOhKS9aTXT022ljhx3RpJC10RQnGXmv4vAG25gtwShEk6CGNILjdB7+PmtFESz
         2dhwIkiu0a9J4pVGpwWsI066vza1KPhp8avG5nZXcSpWpPKjehMVadRnQDoggzwWFvat
         EoPRwWDtFcMmhk3NEV9l2AmJctImeJ+RHA8KigKBYENZvAY6p/uO2BYTTp5rV3/kbHfq
         +UgA==
X-Forwarded-Encrypted: i=1; AJvYcCWDbyP1IPSFULMwAhW/mpwOJIA8a6fIe35IzUgLb+S6ycb1RiTh5lZ/5FymmCT1iCoFzp2CQA+Cq36s3q56nNPhWaC/3muthzTkF3+FGTY=
X-Gm-Message-State: AOJu0Yzpji2UjyV7d025KpIaILXvslf33zrkqvYuMmhiqXr6BjlnE5v3
	2ZM/fl0mOJj6a2w5KFqoNWJTBsDgQ6gTdRQXW7/AeZi01jqZo2bUerSeSj4AXOZFr2qLmAj3rSw
	5nb3kN6SeK9pbBkkmi200QxCb+ssU3cH5
X-Google-Smtp-Source: AGHT+IEvgUaaDAI8r1VQZd2YxfF1btw+TIdEuciooN77rkFtLQnZqxFFZP0uzGAHvlGSAd8PC+gKEUgBv2IrKR4tE1c=
X-Received: by 2002:a05:6102:4a88:b0:48f:9517:53c6 with SMTP id
 ada2fe7eead31-49119a48452mr1085475137.2.1720736058401; Thu, 11 Jul 2024
 15:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213094525.11849-1-devlists@wefi.net> <20231213094525.11849-4-devlists@wefi.net>
 <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com>
 <9770a65c-e08a-4f7c-9ffd-8899d8390e2e@roeck-us.net> <CADvTj4qk0QMafMOD81D=95oL3Qyc7Jd0C5_gGjtw+Kbn=_v9WA@mail.gmail.com>
 <49f46f96-dfc3-4c50-a33d-a6cf1b67066d@roeck-us.net> <CADvTj4ohSu7ngB=M8eEpA45shos8M9YM7bbDHhOy=HQVk9YG3w@mail.gmail.com>
 <b09058ca-9547-4d70-96a7-b7fe6b8beb3e@roeck-us.net>
In-Reply-To: <b09058ca-9547-4d70-96a7-b7fe6b8beb3e@roeck-us.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 11 Jul 2024 16:14:07 -0600
Message-ID: <CADvTj4r3y4W=PwP4aw1TsKpe1pY=SKBTWjfKZJqFe5J-GxNOJA@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
To: Guenter Roeck <linux@roeck-us.net>
Cc: Werner Fischer <devlists@wefi.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 3:42=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 7/11/24 14:09, James Hilliard wrote:
>
> >> The best we could possibly do might be to add a check for the bit in r=
egister
> >> 0xf1 and warn the user that they might have to use the ACPI driver if =
the bit
> >> is set. I am not sure if that would be helpful or just add noise, thou=
gh.
> >
> > Do your systems which work with the it87_wdt driver have that 0xF1 bit =
not set?
> >
>
> I only have one such system left, and the bit is not set on that system.
> I avoid buying hardware with ITE Super-IO chips nowadays since their supp=
ort
> for Linux is non-existent.

Yeah, I got stuck with a fleet of these boards, trying to make the best of =
it.

>
> > I'm thinking we should check for that bit and prevent loading the
> > it87_wdt driver if
>
> No. That would create the risk of no longer loading the driver on systems=
 where
> it currently works.

Hmm, any idea how likely it would be that the bit could be set on a board
which the driver works on?

Or maybe best to have a quirks table with dmi matching to disable the
driver on known broken systems?

>
> > it's set(maybe along with an override param). That way the wdat_wdt dri=
ver I
>
> I prefer the less invasive version of logging a message. The user can the=
n
> block the it87_wdt driver if it doesn't work.

Hmm, I build multiple watchdog drivers into the same kernel and somewhat
rely on the autodetection working correctly as I support multiple boards
with the same kernel build. It's not exactly trivial to conditionally preve=
nt
drivers from loading when built into the kernel AFAIU.

>
> Guenter
>

