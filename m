Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529151B5009
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Apr 2020 00:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgDVWWe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 22 Apr 2020 18:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725846AbgDVWWe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 22 Apr 2020 18:22:34 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CE8C03C1A9
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Apr 2020 15:22:32 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id s10so3616081iln.11
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Apr 2020 15:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R3pDdZfZ5bLsmtiaX3ho/Prc/GJlaWQtQCc0O+mFKI8=;
        b=FVPlhcN8SpwQ9kar8lLIzkCNOqERTFjDWWPdzkyz6Ph3snI/Dgm1QayGxRrtup/FYZ
         uvwjCAr4kTdVchuqSfKk4YE3zvMCIsjIsWXQYY8daJl3AlcUqfwO/f3EHzOMIUvrUVzn
         EQo3LNEU3QcAEw1oa9YnwK4Jg5j6Pzo+MbrrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3pDdZfZ5bLsmtiaX3ho/Prc/GJlaWQtQCc0O+mFKI8=;
        b=Vhq5xex5FlWQoH4Ak44yleXY7PWvv4oL5ke/F+b+N1yaGRy02XTW3SjcGy/qkN5/VR
         RIbY94J4P1pH571I90MhGV8+xAHmSKN1Gvt6XXKHmC/CJsXpZsWruCMON1tgUMjKEhIb
         wvZ/qW87uMb2acb4zDArtFo954BsFr9dQDt3W0QFoaeC+ZN/xJrZpdsyOOS2i2lrzITK
         DFe8FL4jJbLw66R9/IgrJPo407px5swB66pfDXGCVvfK/ub8BzVqKR9Q5dt0O+yXR/IJ
         m12TkOk14aI7gEJJZrheSRHxasOXr1lu6LMaDXmqFZVsDK/Ru3ZmGANxQA8U0OWPvHx+
         9O1Q==
X-Gm-Message-State: AGi0Pubwi8bESNS68yOnlCJEaoVbdrjqldjd/71A034hVgQ/+eTwFJmX
        U+9GwlEf9y0Hq9rqOHpVXj3bu9zzisq/Y5XmjIZNXQ==
X-Google-Smtp-Source: APiQypKiuVyAXmTGcV8md8ByrtcR6N+7n1XLevZ5e2D1tSsN5M7OMFaWAdj4CGmVqHj4ltYZYw7z3KpjuiJzCLrizYg=
X-Received: by 2002:a92:c6c8:: with SMTP id v8mr586970ilm.129.1587594151810;
 Wed, 22 Apr 2020 15:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
 <CAKz_xw3-tvYoCDs07xEUBBMf024aezGMoZ35LsTN+_dXT9nC2Q@mail.gmail.com> <bbd8f97b-8479-c38e-011f-b52e2cf34403@amlogic.com>
In-Reply-To: <bbd8f97b-8479-c38e-011f-b52e2cf34403@amlogic.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 22 Apr 2020 15:22:20 -0700
Message-ID: <CAODwPW-PGzCzW9dP4UXiR5joKRLOKJVBzXwPS7n_Ne-QedfsCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Xingyu Chen <xingyu.chen@amlogic.com>
Cc:     Evan Benn <evanbenn@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> > Yes I think you are correct. I got some reviews about the compatible name,
> > but I think I misinterpreted those, and arm,smc-wdt would work. I did wonder
> > if Xingyu from amlogic needed to modify the driver more, EG with different
> > SMCWD_enum values for the amlogic chip, he could then just add an
> > amlogic compatible
> > and keep our devices running with the other compatible. Although of
> > course it would be nicer if
> > the amlogic firmware could copy the values here.
> Using DTS property(arm,smc-id) or vendor's compatible to specify the
> Function ID is available for the meson-A1.The generic "arm, smc-wdt"
> looks nicer for MTK and Amlogic sec wdt, but the driver may not cover
> the other vendor's platform-specific differences in the future, so the
> platform-specific compatible string may be introduced eventually.

I think having a shared driver is only really useful if firmware
sticks to the same API anyway. Once we start implementing special
cases where every vendor uses a different SMC API, we might as well
make that totally different drivers then. For now it sounds like we
can fit existing MediaTek Chromebooks and Meson into the same API, so
let's do that (with a single arm,smc-wdt compatible string) and then
hopefully future vendors will see this interface and design their
firmware APIs to match it from the get go.
