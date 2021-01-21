Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67DD2FEE54
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Jan 2021 16:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbhAUPT4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Jan 2021 10:19:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:42314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732777AbhAUPTT (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Jan 2021 10:19:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3F3A23A03;
        Thu, 21 Jan 2021 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611242317;
        bh=v6+vvSaYWIajsivUUhnm7a7X5QHco3pxYbNl7HxE1Iw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VPn21a7jQTuJBe7K6iIi8d4kJvWlRrVJptfmlAQ6a/MKx2nvonMXmjLK3SkowqaIu
         cLZ6rkRIhgem6Afrab/SXPi2dERjAjlrWEuuemp//U9+QWFRGT8kL1StPsyzpnMHb9
         eQLm21jkAb/pEwzMetuX8jxmmSR5S3/QimPqcIfIurBcDdzA5FuSUtt7ke5TVsDTnv
         pp6U4aVM9miZLF+GOc5Q0auDW8FHRxPvBlDoHrUkGd8OKP2a78kxYoSsgbx2iFfrcV
         gq6v6tuTB2VjU/7LYNsb7ivuGVawCtQW9C9sWU2ISEYH02WzFB2j4cB3R2aMeNngVm
         CqA+Q9xSxrXvA==
Received: by mail-oi1-f176.google.com with SMTP id g69so1694821oib.12;
        Thu, 21 Jan 2021 07:18:36 -0800 (PST)
X-Gm-Message-State: AOAM530kEqvCqXMCFJ28WCxSAkUjyDFk/sPpja/W15DznkG5+G3Y4Xec
        SWCbvJkwBlxLQAFuHfXrBm2pfptj/YB9X1Eywrs=
X-Google-Smtp-Source: ABdhPJw0itn7ClD0Eq2pp0vSMlTaPvCv5/ESF9uPVl+TstvIzTqgG6OmMTXkR3vXeWNWW/7sdmTSiVULwXiUsfoMlBs=
X-Received: by 2002:aca:be54:: with SMTP id o81mr40465oif.67.1611242316188;
 Thu, 21 Jan 2021 07:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20210120162745.61268-1-arnd@kernel.org> <20210120162745.61268-5-arnd@kernel.org>
 <yw1xv9bqxucj.fsf@mansr.com>
In-Reply-To: <yw1xv9bqxucj.fsf@mansr.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 21 Jan 2021 16:18:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2QFewbxz+HEo9MCE3+RuZBT=yM3Bd2pGhtvN0=-9sj_g@mail.gmail.com>
Message-ID: <CAK8P3a2QFewbxz+HEo9MCE3+RuZBT=yM3Bd2pGhtvN0=-9sj_g@mail.gmail.com>
Subject: Re: [PATCH 4/5] watchdog: remove tango driver
To:     =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jan 21, 2021 at 3:01 PM M=C3=A5ns Rullg=C3=A5rd <mans@mansr.com> wr=
ote:
> Arnd Bergmann <arnd@kernel.org> writes:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The tango platform is getting removed, so the driver is no
> > longer needed.
> >
> > Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > Cc: Mans Rullgard <mans@mansr.com>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/watchdog/Kconfig      |  11 --
> >  drivers/watchdog/Makefile     |   1 -
> >  drivers/watchdog/tangox_wdt.c | 209 ----------------------------------
> >  3 files changed, 221 deletions(-)
> >  delete mode 100644 drivers/watchdog/tangox_wdt.c
>
> The DT binding can go as well.

Good catch! I thought I had cross-checked all DT compatible strings of the
removed dts files, bindings and drivers to make sure everything is gone
at once, but it seems I missed a couple of files including this one.

Guenter and Wim, let me know if I should resend this patch or all watchdog
patches, or just remove the binding as part of the platform removal in the
soc tree.

       Arnd
