Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96FE25D420
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Sep 2020 10:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbgIDI66 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Sep 2020 04:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729869AbgIDI64 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Sep 2020 04:58:56 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B990C061246
        for <linux-watchdog@vger.kernel.org>; Fri,  4 Sep 2020 01:58:56 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so7028659ljk.8
        for <linux-watchdog@vger.kernel.org>; Fri, 04 Sep 2020 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e5bqL5TjHbwBbQQx08EWcQb2A9xnNxuFA36RwtHgwZA=;
        b=vj9H27nYx9c3BTGbF47tdYeEfxFGyDB42r8FcChdlsq2Q/QAmh2XtJIHlpQp6swIoj
         RMTZradXBRiPloHad/p0tj+CYFxCd0KLPu1rFIQDkAxZu9MvBT/H442q8ck4tszxddMW
         FnwBQP08jLIPGtH9wX6JuEtRTf0htM/DhYKhe4TENRq7RI/4j2kFwh8YvydLBowPhWbO
         tLXx1ZqjUnsur2XK8NUt/Y5qGRjIUPkEm0SKV8wa2QuRDfaK1aELXTFEaVa9NNaXEv87
         f93oUQoAdT4bEQTpgSMejicznc2/XIjrvOG9WxQjK/3IwPnLOtbVXC1QNZALiagXtIma
         mzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e5bqL5TjHbwBbQQx08EWcQb2A9xnNxuFA36RwtHgwZA=;
        b=EkN5vkP2NrVHOJRwk+Qgae9Y68koOIW2M+9yoNmPvpwVSBRb6/QBi8GKnQhnB8nxZ/
         5+tUGFqkz7oHwhP40QRcaoD901ZHN3G5H1KWhyuFWd9nWZqxnHDF38dcpcWaDNi/I/9H
         pxHYMAqf4x5kCiGqvyWPjngzZ8PXmF1a9TzPnahDA7LYIKdLB31d3yW3jMszTR033cO8
         fUkUVJg1AXItG6o5PlCHOeDEz0hn4ge1+Atn0SCeAxEdhnhOaDMTQ8gSQ+iNk6E+alus
         NPVgrHesC/xz4dGGFFCNcUDM1c+tzHONiVA3mj6/cHiBTMBXuWUO07CawFK0/w/QxHZR
         FsOw==
X-Gm-Message-State: AOAM532oVd5ejNBKofiDG2156G4riJFgEdYXzpL5yrv9eVeuOdwYcUyA
        Y5iPbJS4Y1MbZw7wGMvTsgQMVOvPopacDCL4yWDA5A==
X-Google-Smtp-Source: ABdhPJwBOG7Hh44q1D63QCcRhYO5V5+LCYkolaEWM8gLEkK+7LP+gf9P/+1WSp243uMeKZNw+XTvVtxuRO+q8WQ14gM=
X-Received: by 2002:a2e:9988:: with SMTP id w8mr3563728lji.286.1599209934290;
 Fri, 04 Sep 2020 01:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200828130602.42203-1-andre.przywara@arm.com> <19c6a67e-48f0-c0b6-3653-32a5a1f09e07@gmail.com>
In-Reply-To: <19c6a67e-48f0-c0b6-3653-32a5a1f09e07@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Sep 2020 10:58:43 +0200
Message-ID: <CACRpkdbMbNd87145iwdL7=x501cvgU7wiZXNLF456sn6WvoodQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] dt-bindings: Convert SP805 to Json-schema (and fix users)
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chanho Min <chanho.min@lge.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 28, 2020 at 9:34 PM Florian Fainelli <f.fainelli@gmail.com> wro=
te:
> On 8/28/20 6:05 AM, Andre Przywara wrote:

> What is the plan for merging this series? Should Rob pick up all changes
> or since those are non critical changes, should we just leave it to the
> SoC maintainers to pick up the changes in their tree?

What about Andr=C3=A9 just send a pull request to the ARM SoC maintainers
for the whole thing?

Yours,
Linus Walleij
