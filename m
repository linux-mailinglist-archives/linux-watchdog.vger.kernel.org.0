Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47F320FD45
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgF3UAG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728878AbgF3UAF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:00:05 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BF2C061755;
        Tue, 30 Jun 2020 13:00:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w16so21875309ejj.5;
        Tue, 30 Jun 2020 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=ldl1WwxRjxrbVs0UyhlhGaXCB+HE7WnXiRirMFC/VI0=;
        b=CpGnE3fRqwe5FDnQJHrqoN5FQAsEk/lJgO/etAhGA/GpHiRweSYKsr/NgURn7e6B4D
         +jlULt0/BZAn/jEV2kKgM2JpUsO2tbI/vCWl5oY8c3yUcT4XBLHmS2C6JcLvxd1POBB3
         L+D6r9yDP91lkK6SuwP5JX/5MCGetnWX7JdxXibLZH1170XyCBXKQE9RGHZ8xtVJnAkm
         AJaqI8VOALrvvwx+CoPcg5iN8M3LJYF/OxMIYNQQMU1O/UIRbkHI/nxv5BTaxWNixnNw
         GugNu3MdWMT1PAl7siYeUGj2EPYdnf0A7WCAm8G8tXOvQKBc934o4PK3ix/HbjhvqfN3
         Z3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=ldl1WwxRjxrbVs0UyhlhGaXCB+HE7WnXiRirMFC/VI0=;
        b=BHgq6/80ggRrp6YjM4Hks5ez28MYoCInrJY03M31vKkKiUrYMGbwnEhbdo6QuD143g
         ie/zwB7oAVtZtqR2WCcHRR8XJp490z9YNBeWuWr/0+G+zEjG9cC18v8XR0YjGmgzlwAd
         SRcMT18m1eYD7nyoLojPQHHYMyanQymihkbBlt7Kr8gB/Vz7OmLaAbdMmbh6zEMd6cCp
         cwqqhA2naLBamzWuBbnCWTdT7KjS5pUtv6QgWnK4uFpGjlc6/b7NWogb8asn6GNl07ok
         xrIKTqeFH083tTsXxXgh5l5axJ1lyJZ84sBADjAt4ucygSPh212vILiyQ5Ho5MppJXKb
         nsVg==
X-Gm-Message-State: AOAM5314Qiwwhi4Xw5I2sWKFfKUMLFW02kYT1xGc9SWjfB5hTkcii/Cn
        6IyYGSi3F8vxh+HyVMnaHVY=
X-Google-Smtp-Source: ABdhPJx6VFGPGnkdrs5wh+o9pBBfjA00TUqefANt1swuANi6ZEQ+n81vfiqllrSO33moHSoygdt0NA==
X-Received: by 2002:a17:906:7f90:: with SMTP id f16mr19377109ejr.507.1593547202116;
        Tue, 30 Jun 2020 13:00:02 -0700 (PDT)
Received: from felia ([2001:16b8:2d31:bc00:cc6f:aee9:d326:7bf7])
        by smtp.gmail.com with ESMTPSA id y7sm3768744edq.25.2020.06.30.13.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:00:01 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Tue, 30 Jun 2020 21:59:51 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Evan Benn <evanbenn@chromium.org>
cc:     Julius Werner <jwerner@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
In-Reply-To: <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2006302156120.3966@felia>
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com> <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net> <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com> <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
 <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On Fri, 5 Jun 2020, Evan Benn wrote:

> AFAICT this has now been merged upstream, I'm not sure what action to take:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c24a28b4eb842ad1256496be6ae01bab15f1dcb
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=72a9e7fea5866fc471fda78f05f166595c8c6ba6

This patch is still fully valid and still applies to next-20200630; it can 
be simply applied as any other bug fix to your driver code.

Evan, can you please ask Wim as linux-watchdog maintainer to pick-up this 
patch, with the reviews below?

Lukas

> 
> On Wed, Jun 3, 2020 at 9:22 AM Evan Benn <evanbenn@chromium.org> wrote:
> >
> > Apologies for that slip up.
> >
> > Reviewed-by: Evan Benn <evanbenn@chromium.org>
> >
> > On Wed, Jun 3, 2020 at 6:16 AM Julius Werner <jwerner@chromium.org> wrote:
> > >
> > > Reviewed-by: Julius Werner <jwerner@chromium.org>
> 
