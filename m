Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BC21AB4E5
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Apr 2020 02:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405166AbgDPAwS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Apr 2020 20:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405170AbgDPAwQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Apr 2020 20:52:16 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82EEC061A0C
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Apr 2020 17:52:14 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id y3so19650840qky.8
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Apr 2020 17:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oymDymDSGwWgVl7PdrWgMeH1mdt9MH+svEJHIh9ofYo=;
        b=a2XbOiwlAAQzxczt4QF4WPs7900EFsrLVOxWmAfWFDrYlbOxFqFleRRIhOr+uI8M5f
         M2cwVJ40d4uDtjkefb7KmLLsMXHjL/sGzNwIx0DMzOlXnR5mb/1snHQ+m68Q4OvzwI+F
         RFsl2ztnRLmbC/I9LzD4UKpcjD3O1jAdNfCXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oymDymDSGwWgVl7PdrWgMeH1mdt9MH+svEJHIh9ofYo=;
        b=eMR3v90StQxGIXEU3eOvNeSHyORa7L6S+slSkI31gkrU1jvJWsdilb9WHdPk1iW13R
         3EgmVfVIx+jaE5P6+7u98X18iUAkQrhHPPWpxRvDuq3F19o5CBFUmHVEwyRLxqNndIGP
         4inVJ9pNDfWefQfpEy57lQTQ+d61B044tjkjLpplXI8R3brr12KfzyCJdKu+Eq0pWyec
         C0KOZQrzWUJcDohQ7SBsv2UMZf0MMrPgQN/KbYeDnwI0NF2fMNq4OxfpRpOyIN0pq2AJ
         izIW1m+gTdZAyfGQERI7eFGnTZOJjuQFLlcVcDI+sqxVXahAkkBfUWfNEaqgEcNWmrRH
         2AZQ==
X-Gm-Message-State: AGi0PuZIM7Z7XT0Ig/8g30PFS5MmEtjnLONj1eGibQ4jC0ixBiB6xakq
        8tlNb3BYm82myGcf5JBQJK3jtu4pnak=
X-Google-Smtp-Source: APiQypITKU0yd5l4/jSgpTZTf6H/wVxtwSPDDaGGts6VUdnyRvtkhcdBU77BPyLySbsPXidJPycdfQ==
X-Received: by 2002:a37:a844:: with SMTP id r65mr20292597qke.264.1586998333774;
        Wed, 15 Apr 2020 17:52:13 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 18sm7374109qks.98.2020.04.15.17.52.13
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 17:52:13 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id g6so1050045ybh.12
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Apr 2020 17:52:13 -0700 (PDT)
X-Received: by 2002:ab0:592c:: with SMTP id n41mr1543975uad.73.1586998027359;
 Wed, 15 Apr 2020 17:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com> <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com> <20200415231215.GA182398@roeck-us.net>
In-Reply-To: <20200415231215.GA182398@roeck-us.net>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Thu, 16 Apr 2020 10:46:39 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
Message-ID: <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Julius Werner <jwerner@chromium.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Thanks Xingyu,

Can anyone provide advice about making SMCWD_FUNC_ID a device tree
param directly, vs using the compatible to select from a table.

Please note get_timeleft erroneously returns res.a0 instead of res.a1
in this version.

Evan

On Thu, Apr 16, 2020 at 9:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Apr 15, 2020 at 03:29:29PM -0700, Julius Werner wrote:
> > > In addition, It looks more reasonable to use the "msec" as the unit of
> > > timeout parameter for the ATF fw interface with SMCWD_SET_TIMEOUT:
> > >
> > > - The fw interface will compatible with the uboot generic watchdog
> > > interface at [0], and there is no need to convert timeout from msec
> > > to sec.
> >
> > I think we're trying hard to keep this compatible to a Trusted
> > Firmware counterpart that we have already shipped, so we would prefer
> > to keep it at seconds if possible. That's what the Linux watchdog core
> > uses as well after all, so it just seems natural. I don't really see
> > how what U-Boot does would have anything to do with this.
> >
> > > - Some vendor's watchdog may be not support the "wdt_trigger_reset"
> > > reset operation, but they can use the method below to reset the system
> > > by the watchdog right now.
> > >
> > > watchdog_set_time(1);  //1ms
> > > watchdog_enable();
> >
> > They can still do that but they should do that on the Trusted Firmware
> > side. Emulating a missing reset functionality should be handled by the
> > hardware abstraction layer (in this case Trusted Firmware), not at the
> > Linux API level. So Linux would still send a PSCI_SYSTEM_RESET SMC,
> > but then Trusted Firmware can choose to implement that by setting the
> > watchdog to the smallest possible timeout (which it can because it's
> > accessing it directly, not through this SMC interface) and letting it
> > expire.
>
> I agree. Using a watchdog to implement reset functionality is always a
> means of last resort and should be avoided if possible.
>
> Guenter
