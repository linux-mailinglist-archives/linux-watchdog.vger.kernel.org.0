Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DB91AB51F
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Apr 2020 02:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391943AbgDPA50 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Apr 2020 20:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405924AbgDPA4x (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Apr 2020 20:56:53 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638B8C061A0F
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Apr 2020 17:56:52 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id f19so19273981iog.5
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Apr 2020 17:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0pi57Yw1CcnU/t5xDRYzAtYW33asqFUBaWgZbJ3tOfE=;
        b=Zxz39exVNPQUoC5oC7KxutI6O9HlznMuRYa653fUmfYsyaTRiTIZKuc9pujiaQLdn/
         6CTSitD7ypenyMARA3xWa1qvKF/8ZZRmHFyZAj3U7hHkFWoLTv1Vjvem8/AWPxPWGYRd
         9YsDvAZ0l32UROX6xPE8XcQ0FNYxiVvtWNDvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0pi57Yw1CcnU/t5xDRYzAtYW33asqFUBaWgZbJ3tOfE=;
        b=WFQNa6r0f8JALTsWgkPILumii+plNvc5qTei+BZXBbl2gidQH08U8CJBKeZkb6qppk
         NYKYuj1FcsDeo8/C3qlIZ69z160JTUZ0jCmVlUm6etxHNCktCo2mjkW5VW04HsOFF5wR
         iTsNXx+fMydiZeMb5gH0ZGF8mFJBA2TBHsMj2ekBaW/JeZc3VRVW46iwQ6SBrSHZ1KyH
         U7L7E1D2MEeBvTlp5gP2Ak2hxQtQDLIoOvI3CxElU1HccMuKVtc62QFjDnzuHSDvzG2a
         B2EOwH3DfiPeqSQl7DIz95TaRm6Wq8Mg9Ossc9Pw6BJcAb6smjgxCn95veX9lG+XEYtp
         lB6g==
X-Gm-Message-State: AGi0Pua0nO9z2znDnmXM3RZq0rN7n6vJG4LyKoujXF8iUURqsH0tovUe
        t+Bvr4PJyW4e4kQVh9F2ac4m4PgalOlyw9q1cSBVYQ==
X-Google-Smtp-Source: APiQypLaV14jW6zqGw/DJyeFplem0IPQuVzPs6SMj5UQP5j6yl5Y9t8lEAsFhz+mS6nRLGgdHeSVWyjl3NF1UNgldr0=
X-Received: by 2002:a6b:491a:: with SMTP id u26mr28900283iob.30.1586998611518;
 Wed, 15 Apr 2020 17:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com> <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
 <20200415231215.GA182398@roeck-us.net> <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
In-Reply-To: <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 15 Apr 2020 17:56:39 -0700
Message-ID: <CAODwPW9Vt7TcWfKYDmRgLndb2-+5HoNvA6XMJJznXCudQDngqw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
To:     Evan Benn <evanbenn@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Julius Werner <jwerner@chromium.org>,
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

> Can anyone provide advice about making SMCWD_FUNC_ID a device tree
> param directly, vs using the compatible to select from a table.

Sounds like most people prefer the way with using different compatible
strings? (Personally I don't really care either way.)
