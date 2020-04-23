Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9AD1B66AA
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Apr 2020 00:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgDWWRW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Apr 2020 18:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDWWRV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Apr 2020 18:17:21 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C42C09B043
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Apr 2020 15:17:20 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id u12so7494949uau.10
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Apr 2020 15:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ImyDKT5GUuGx4UdReAU1SFZBdyoyuA09f+p98B9B22U=;
        b=MVrB7ptavsGiQQua0Vjywdn5LaMTu4XF0Z1Ou35iDTtlPrECrJF03b1X9OfQreT1Sv
         Vrs6/p06qmY0edU5rq5DjBnn0HF8gPWw2/bsLkke5gs8JhP6nZqduiZuAIPqaK/geeaF
         9jGZybC4kWQR1xAWiRngZ+uRtePeQ1MeLOEvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ImyDKT5GUuGx4UdReAU1SFZBdyoyuA09f+p98B9B22U=;
        b=IZ+id0I9Q/0Fd0M81LPiy7nDzoHRnsHYxkOoqF2QMLu3lvVGWboHaJjRatxZ06qeiX
         9q2d94NyzIltEN9119VtD/3RSf0QGnJPycfa9hBmiW5MrOE9dX7GmmtYiznb7xDmLOl6
         vCfyZFd66fDnsQTmX+0Rh35hhg+tYmby9lNbL4L7UufbBL+3ZFxmuJ8jxP7NdW5qj7/F
         C/hJQQH2iUqxJvJSOci/JABUR6GThzq57AuWNz2m6S9HaoelqJT1HCwtOD7ehpf+vV1/
         8TJNCawkKtbOFm0ZZjRtNIDOtlvDslft/DrJjURK4U5guL3b2y12Uz+3bSMvRR2IemZh
         3idQ==
X-Gm-Message-State: AGi0PubWuTzRan/ZfvMBk3WnRv3JTejDWu1LYUOvBH+qswhjejM8UgAe
        GrPg8gHxwGnLiGrIIMUO1BKl9SyoaHOpPlI05M7vlA==
X-Google-Smtp-Source: APiQypJDlCWw7UIoyUEUjtlXhQdYSbXsrKe/ELL5y8iA5voVOv7hSWTM7nSU1GgatF1cMHiK0C9YmT8nvji7Iv8Jnmc=
X-Received: by 2002:a67:1447:: with SMTP id 68mr5466353vsu.163.1587680238725;
 Thu, 23 Apr 2020 15:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200423044036.234578-1-evanbenn@chromium.org> <20200423143945.v5.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
In-Reply-To: <20200423143945.v5.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
From:   Julius Werner <jwerner@chromium.org>
Date:   Thu, 23 Apr 2020 15:17:06 -0700
Message-ID: <CAODwPW9-c8EcZh_zB6SwohzvHtCQasaNLQM0fj2bj5O5KuVPfg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
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
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> +       err = of_property_read_u32(pdev->dev.of_node, "arm,smc-id",
> +                                  &smc_func_id);
> +       if (err < 0)
> +               return err;
> +       watchdog_set_drvdata(wdd, (void *)(uintptr_t)smc_func_id);

Your device tree binding says there's a default and this is optional.
I think you need to change the code so that that's actually true.
