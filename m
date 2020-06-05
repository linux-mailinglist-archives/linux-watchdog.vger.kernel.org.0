Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFFF1EEF33
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jun 2020 03:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFEBmk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Jun 2020 21:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFEBmj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Jun 2020 21:42:39 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98429C08C5C0
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Jun 2020 18:42:37 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id w188so1856833vkf.0
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Jun 2020 18:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C5ypsurKn6EPPW0g1fbnIZOkTknD4rOPJcEpT9vTQck=;
        b=HffCxMdymASad9VyvMn/2LNf5v56Dj+53oolcX6jkBuJFGkFou2hGGiXSQfqGBOmNm
         HVEWDNLljg2ISFqqel2e/W5bnjMEvy3YskA1uOcGblTVNrCvGqzmgYhvPPo9mdMM7heK
         SLkKGObs2MrKOK4IxHgkDx7gnhF7q1R+N2MBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5ypsurKn6EPPW0g1fbnIZOkTknD4rOPJcEpT9vTQck=;
        b=eK8U9dnHiEe+zp+JpTHa3VD9u5kMvJCwNoR+sMCh9myhFtnC2YVAv7zvIJCOE/9DNb
         tKD8IfL14/vm7GuCQhjySwXxmQzKi2crDtcdaajEBmrCa25+wmNX3GoC6lz9/FYibg8W
         yFqPaj1Nv385qwnPSAztyq+ZSg2jGz2CJ0QnTFEjea8oYmsDhMOETx8j3yn592wp04Yc
         4ipikyCtx9hYvBnNMp0qVQ4rXQm+wFd2GvKseuOfIq4uAN96L8pcKM45lv+Q7kd1U5B0
         MSlpgWmlpn+ma4/5MkE4kEWTT96n5/EJucN3g9R9lbEuDo1X2EJ6OPVlI4jKIjtCPWYS
         96Xw==
X-Gm-Message-State: AOAM533oKmaNOvW5vt6UivGK18wqUBcIo/0NCW4Qh2DVsqO6afri08ny
        HihHOa5o8vT3zsWmUYACCGL+hF1ky/I=
X-Google-Smtp-Source: ABdhPJwWfNPMHiECHiBDo0YasC6eJHFhRsJFLSatPAYgl8kS5Rk+GiznS4iUpbAlLVerWFJnwVtzRA==
X-Received: by 2002:a1f:e485:: with SMTP id b127mr5370532vkh.99.1591321356426;
        Thu, 04 Jun 2020 18:42:36 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id y12sm956517vko.40.2020.06.04.18.42.35
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 18:42:35 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id u15so1836616vkk.6
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Jun 2020 18:42:35 -0700 (PDT)
X-Received: by 2002:a1f:5e51:: with SMTP id s78mr5587128vkb.59.1591321355196;
 Thu, 04 Jun 2020 18:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
 <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net> <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
 <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
In-Reply-To: <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Fri, 5 Jun 2020 11:42:09 +1000
X-Gmail-Original-Message-ID: <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
Message-ID: <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
To:     Julius Werner <jwerner@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
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

AFAICT this has now been merged upstream, I'm not sure what action to take:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c24a28b4eb842ad1256496be6ae01bab15f1dcb
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=72a9e7fea5866fc471fda78f05f166595c8c6ba6

On Wed, Jun 3, 2020 at 9:22 AM Evan Benn <evanbenn@chromium.org> wrote:
>
> Apologies for that slip up.
>
> Reviewed-by: Evan Benn <evanbenn@chromium.org>
>
> On Wed, Jun 3, 2020 at 6:16 AM Julius Werner <jwerner@chromium.org> wrote:
> >
> > Reviewed-by: Julius Werner <jwerner@chromium.org>
