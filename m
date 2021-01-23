Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46B33017B8
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 19:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbhAWSsH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 13:48:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:34396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbhAWSsH (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 13:48:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 384EB22D2B;
        Sat, 23 Jan 2021 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611427646;
        bh=UXp2NFzKNxkatDDXxDwnkDYnaYkcm//9A6g0qxA8fvc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SglYl624Xv1++VESR5wVWFdUhAX3SX6PddbHOw0vXngq5p9zW/6iSEj8+PpGyJWx4
         rG2pPXxpCrprG4NOFIdaF/HifBBuUDf2aIAkedamNqb81vUx3MY/dNP1uT2xoQwXBX
         k+5Ow1VzZuua/jXKxEqJ6Z7RUqbV0EPOc/DFF3DekfFNOjs+pX/UbRju8aytx8dW/S
         v6lsLUNU3ONpUjg7KRU45wD9rwv5DvPhbF+hg9IMoFmGBPHJJXePEWwo7bn86sHdne
         9s5SFIwaZgA05N23p6QsFbnFuQ87IENhnS87Q2cy3MWDVqyLX1dp0eq4wHbNnED1X+
         O0Qhxup3V1PWg==
Received: by mail-ot1-f51.google.com with SMTP id v1so8594483ott.10;
        Sat, 23 Jan 2021 10:47:26 -0800 (PST)
X-Gm-Message-State: AOAM533rHNGQqbMvhmaIKXK9FlxiZWazVlKX6m6itVYKrAjmXNIKk7bD
        haUWNgVMalpBJB8LjTGoyB/IwFOTFA4fonv2QPk=
X-Google-Smtp-Source: ABdhPJzXadBvqbm0Ka4A7fE+buyojDLYxoXTZHvib7C9uxqYQEZ/kN8zd+yrdxDnsSWAqq4It9JoroPbQD7MoX7T0Z4=
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr7354158otq.305.1611427645600;
 Sat, 23 Jan 2021 10:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20210120162745.61268-1-arnd@kernel.org> <20210120162745.61268-5-arnd@kernel.org>
 <20210123183434.GA60725@roeck-us.net>
In-Reply-To: <20210123183434.GA60725@roeck-us.net>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sat, 23 Jan 2021 19:47:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0r_Fysv1cfj2FcW+PAv8FEAPu=EYTzXODxGXGLQe5hkQ@mail.gmail.com>
Message-ID: <CAK8P3a0r_Fysv1cfj2FcW+PAv8FEAPu=EYTzXODxGXGLQe5hkQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] watchdog: remove tango driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jan 23, 2021 at 7:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Jan 20, 2021 at 05:27:44PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The tango platform is getting removed, so the driver is no
> > longer needed.
> >
> > Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > Cc: Mans Rullgard <mans@mansr.com>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Acked-by: Mans Rullgard <mans@mansr.com>
>
> I ueued this patch up in my watchdog-next tree, and while doing so
> removed the devicetree bindings as well. If Wim picks up the patch
> from my tree we should be fine; otherwise I'd suggest to submit a
> follow-up patch after v5.11 to remove the bindings file.

Thanks a lot!

       Arnd
