Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D22B20FDB8
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgF3Ucs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgF3Ucr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:32:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D99C061755;
        Tue, 30 Jun 2020 13:32:47 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g67so9578613pgc.8;
        Tue, 30 Jun 2020 13:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZOvD+yJGwWIdexNCHF7ao+M7ocFeeBUXDaMNE7cgLcQ=;
        b=IA/L5j7gfJeTDO/PW+30Z14uTFoK3CAYSiZR4Q+MyfHAlE9YwD/wkY5q7FYwB+2Eq9
         W/6BHnch9MdF0BJO+kwbOyNQhSdvFAyh0hUrwZb6kgR2oR8hO9u6JScyZxLOdHxW8Nwc
         O4bg9j6oz+jpxob61BaGiJjp7WGEi+Tm31nxNshuDnZLCXCt/f56a7EZnS4T1FnrqPef
         LjYIG2suEpsYEHLDNK8KeBJeTtPT2AJyCYuNENUnQF+s9OTdlAiVDgHBG9tdKngclGCr
         3AeLQgKIH6H1VhKiJg6FXOx2gKiZt+Q1uWIuzl63nt/xSa9emgAElanDtI5/V0FiHwW0
         fvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZOvD+yJGwWIdexNCHF7ao+M7ocFeeBUXDaMNE7cgLcQ=;
        b=UH6odYY9N82tjeJ5BOYhgJbzpfxo0VVptcdFeJCiyU0ddzMdyqTsWX9oQ/B983CwJg
         3IFqfy877pjX7TDlhVkw3Ybi4hmGGFV8T2jybnl1u3/d37nmfIxDbKxrrtgaeu7mCTOM
         2R2QOUuqz7axwk4Y4LrIJOoYL+YJfkQpM5/1xYKo65DThRuqHawt+Gxa/DE3+A93PxYg
         K/lrzsBGmvJugvpwxVD3FwvDJ+R5mp1ynKlFCUELP+6511dmdFznQzPN/L0dz7t3gV3Y
         TOMtTSdcdox3+IljLr0Qak/R8u/TotWwSGacSVyzBbmFklCpE0KQ/an78tpi94q5I5Po
         LlMA==
X-Gm-Message-State: AOAM533+A/gxzOIGgYQuQK/Uwkn25WdYQymnV9VjZC0/Yt1/Z0UyZbdj
        Dx3XE5oHOdSRksewdJANn32bVHGp
X-Google-Smtp-Source: ABdhPJwUIs/KHc1fM7VSYIVz8n691X9VHdigNFpZCXHDxispSzkaMGkBpwyOBEriVVR7bbJ32PK11Q==
X-Received: by 2002:a63:b90a:: with SMTP id z10mr15798942pge.277.1593549167091;
        Tue, 30 Jun 2020 13:32:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i8sm3395573pfd.14.2020.06.30.13.32.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 13:32:46 -0700 (PDT)
Date:   Tue, 30 Jun 2020 13:32:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Evan Benn <evanbenn@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
Message-ID: <20200630203245.GA19763@roeck-us.net>
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
 <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net>
 <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
 <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
 <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
 <alpine.DEB.2.21.2006302156120.3966@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006302156120.3966@felia>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 30, 2020 at 09:59:51PM +0200, Lukas Bulwahn wrote:
> 
> 
> On Fri, 5 Jun 2020, Evan Benn wrote:
> 
> > AFAICT this has now been merged upstream, I'm not sure what action to take:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c24a28b4eb842ad1256496be6ae01bab15f1dcb
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=72a9e7fea5866fc471fda78f05f166595c8c6ba6
> 
> This patch is still fully valid and still applies to next-20200630; it can 
> be simply applied as any other bug fix to your driver code.
> 
> Evan, can you please ask Wim as linux-watchdog maintainer to pick-up this 
> patch, with the reviews below?
> 

It is in my tree. Maybe it got lost in the back-and-forth. I'll send
a pull request to Wim in the next couple of weeks.

Guenter
