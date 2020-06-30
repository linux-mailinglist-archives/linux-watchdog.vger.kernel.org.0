Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A8720FDD2
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbgF3Uhz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgF3Uhy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:37:54 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9BAC061755;
        Tue, 30 Jun 2020 13:37:54 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id i25so22581606iog.0;
        Tue, 30 Jun 2020 13:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=38KZfXGo5PyBgcyR/mf9dfZW2Qk4B4rGtanP3anFAmo=;
        b=Fj2uWZRhmQdVb+7q/isHj2wQVqMFAfhVSu3lMN2Id2l5Ye5HnMqwP4j5lQKn0fHb66
         MUv+1SfaS35JLFwD6WJcuYE+MTOkl0W8SUYaYigvls5G1jDG5imxELY1kvoh0SxqMKJG
         QSg4O5uFukVwLDfqc7Dqnnund7fXbQjjZ/y45OOfWnmex0OHEsNxYk5A+0JvkSBIrauZ
         MkQAEj1MFvL3b4qJuczRsNcgPSagcw3SNnjNAD9t9HTjUJY07djMjkia9x0T/WRTkntO
         3M154WqULBtiU0BN400kx+uc7dN0kWlmkKZZf90rbyKr6qd9xuf40grRx2k1z68xEfHC
         nWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=38KZfXGo5PyBgcyR/mf9dfZW2Qk4B4rGtanP3anFAmo=;
        b=gAvwCtKOI1tZy9QqzwfG7q72cgQsEyrM8Bmo63UrseFvcVNpxcRMpTFnr2FeXTXcMX
         hEVXuZ7jSz1IO/F4WkHPqKE1DtJtgfeUMslwFWMNEjldqGQNauf89LXwIs6hdsJlwr0G
         0bhsC47GW5K0hj9TDKP4dI2hW4bywT1g9nYozk1Qco8VqejWvKJjpJbX9XhDXFn8JNza
         pPyPtf+IJWnBol+UbgBStgiPvDGuhthae0C2UYMVrR2lVrNFtZpFw9ddZ8UwHdLFBlSg
         9dF7LHUhLIBMWO1Ht/wm5FNT76ZlxHHPSJ6pH85kUcGQ3VjWaS2GZBYtxQS6xvZWQ9NS
         YlAA==
X-Gm-Message-State: AOAM5322Om1pzZgMq32inNyBGxJrqj5gwH2uvdAoI6OGI0Vvrcimummj
        Bu7weJj3efIyfnwT2JA+4e6rNh+yMS2UQ/ab/VU=
X-Google-Smtp-Source: ABdhPJyb/CEwkfINABpfWWMSQ+ML0+ykFVkIncKfSMyZm7IOmv3ls+GVwrxAUKHMFFSVIk+7vkK2LsLzL8TstG9FxFM=
X-Received: by 2002:a02:30c4:: with SMTP id q187mr24244868jaq.102.1593549473442;
 Tue, 30 Jun 2020 13:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
 <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net> <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
 <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
 <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
 <alpine.DEB.2.21.2006302156120.3966@felia> <20200630203245.GA19763@roeck-us.net>
In-Reply-To: <20200630203245.GA19763@roeck-us.net>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 30 Jun 2020 22:37:42 +0200
Message-ID: <CAKXUXMxF8YwhGKjUr5h_c2ewmXiSz7saLYWvThn6VwyTYLKAeg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Evan Benn <evanbenn@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 30, 2020 at 10:32 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Jun 30, 2020 at 09:59:51PM +0200, Lukas Bulwahn wrote:
> >
> >
> > On Fri, 5 Jun 2020, Evan Benn wrote:
> >
> > > AFAICT this has now been merged upstream, I'm not sure what action to take:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c24a28b4eb842ad1256496be6ae01bab15f1dcb
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=72a9e7fea5866fc471fda78f05f166595c8c6ba6
> >
> > This patch is still fully valid and still applies to next-20200630; it can
> > be simply applied as any other bug fix to your driver code.
> >
> > Evan, can you please ask Wim as linux-watchdog maintainer to pick-up this
> > patch, with the reviews below?
> >
>
> It is in my tree. Maybe it got lost in the back-and-forth. I'll send
> a pull request to Wim in the next couple of weeks.
>

Great! Thanks, Guenter.
