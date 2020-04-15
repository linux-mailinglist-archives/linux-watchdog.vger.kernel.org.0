Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0645E1AB3CF
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Apr 2020 00:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732133AbgDOW3s (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Apr 2020 18:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732109AbgDOW3n (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Apr 2020 18:29:43 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C119AC061A0F
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Apr 2020 15:29:42 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id b12so18944668ion.8
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Apr 2020 15:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PVtGYrIeBI2+9xVgD4LCkJpnGBHTWG+8tKFXeAJgTRU=;
        b=gXSGbTR09MscBjxHvvT6Zy0GE7nYGjJ8nQRhWPJMjuaPZPTM411vSTxLoPH1wb/lRH
         E6Z4jtglLRMXQKommS2CbxodCJi11rjz7cgYPRAWFMxtk1Sc3UXB1U2xuagdbDr83VUY
         5gnHcn+7SSgE8W9/iOMJ1SOy7cFoMYxBGg8EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PVtGYrIeBI2+9xVgD4LCkJpnGBHTWG+8tKFXeAJgTRU=;
        b=dJA3OSz8ENq5aoWhZ/ipoR78y7VFaMVpq7T4JEH9p45r1xgXgaI+TwrRLXuTfIkfzR
         RqNyUxiahuYfEzgbMf4i1VlfJNzorys45bF5qZkBc9ktIMncvfNy7hU6iYUVFLiYUsyx
         EO35TjIyIH+tuJjgIxBrPxkxdlyvC9fgcPQd3Atxx2K/HR2Eom107dNGmgkzyNrdP/2/
         1S/ovSxTgE/hwHald7PGPIwKRH1dOj/0XocRMIZikWr2vDhMBgzspERW5lgxnYlIEVaO
         6kYVwhWQFSgDNNMU82eECTuUHGU7CGWMrUjcuuRSpbIY1thQHcbKNyYnG0anM5FmJJZq
         MC3A==
X-Gm-Message-State: AGi0PubqF8gG9y48S4nRMD+wbjqUJv+YHXLAQsI2KgFJNQBaYg8xd+o5
        hw6UOArBVUF4xPpUU/pRpZ77lJz5CpAWd2rcenxPeA==
X-Google-Smtp-Source: APiQypJ3eoCymVEhOWkVktr1qddf2Xa0knAtkx0Gy+/ySRR66TTx2i5h4oQ94XSCgON3AJO5/Bo8xzGkGGc86wd33Kk=
X-Received: by 2002:a05:6602:1302:: with SMTP id h2mr28555486iov.186.1586989781796;
 Wed, 15 Apr 2020 15:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com> <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
In-Reply-To: <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 15 Apr 2020 15:29:29 -0700
Message-ID: <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
To:     Xingyu Chen <xingyu.chen@amlogic.com>
Cc:     Evan Benn <evanbenn@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
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

> In addition, It looks more reasonable to use the "msec" as the unit of
> timeout parameter for the ATF fw interface with SMCWD_SET_TIMEOUT:
>
> - The fw interface will compatible with the uboot generic watchdog
> interface at [0], and there is no need to convert timeout from msec
> to sec.

I think we're trying hard to keep this compatible to a Trusted
Firmware counterpart that we have already shipped, so we would prefer
to keep it at seconds if possible. That's what the Linux watchdog core
uses as well after all, so it just seems natural. I don't really see
how what U-Boot does would have anything to do with this.

> - Some vendor's watchdog may be not support the "wdt_trigger_reset"
> reset operation, but they can use the method below to reset the system
> by the watchdog right now.
>
> watchdog_set_time(1);  //1ms
> watchdog_enable();

They can still do that but they should do that on the Trusted Firmware
side. Emulating a missing reset functionality should be handled by the
hardware abstraction layer (in this case Trusted Firmware), not at the
Linux API level. So Linux would still send a PSCI_SYSTEM_RESET SMC,
but then Trusted Firmware can choose to implement that by setting the
watchdog to the smallest possible timeout (which it can because it's
accessing it directly, not through this SMC interface) and letting it
expire.
