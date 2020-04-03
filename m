Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 259A519E133
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Apr 2020 00:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgDCW44 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Apr 2020 18:56:56 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:34385 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728459AbgDCW4z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Apr 2020 18:56:55 -0400
Received: by mail-il1-f195.google.com with SMTP id t11so9050946ils.1
        for <linux-watchdog@vger.kernel.org>; Fri, 03 Apr 2020 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AqKl27V7RFNmyor6QW5xd8i8kAV8SFQrhYdOkxkJcC8=;
        b=WPiy5e7K8C3QPMOUC92RgkkaI6mdprM/z4x2IEncYmEy/d6KK7jUOHmCmetCMsnqVc
         kBUsXiMJ5CPk89GqAtdkTRa9LsdaBYEp/cpn3fJHtLs0/2nM49F6CjWMe6UupK/IYTAT
         rhxUvgs+Xgt7OFNKBYmzA2qIcnYwH6wRp3tqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AqKl27V7RFNmyor6QW5xd8i8kAV8SFQrhYdOkxkJcC8=;
        b=KKaHNTVbXlFrWbqdXUecwM5JS7a5irdlYpC+EPznKC0qrO5ipZnVH5pZn9PC4aSMc2
         8x38MmtMUZjMAtWWjoCx5qTlQiKda9oQ6IZi6uRidTxSxE36u9CB3u7MEdRogf4nLfvE
         LsUW9GPXYiizxEvP0XtUIQ0rLZ6RL6HjokivCl+9SndQtYiahuZ3gfrY52DiyHSIifYc
         S0/LYVg2AfYGnR9gGvVZlEFd4gFOSrk+MVwVV/OikD0W1InR3jEUzpuNDKDRKAqQoBtI
         D10UgNY7mcXDfWl3UoqfqUeSnxkS24PNd8FbIZTxW/jZAzxwNuQ03tooGAtULRnSQS5i
         yBDw==
X-Gm-Message-State: AGi0PuZnAgjLkZWM6FmP3oCRDfvTKn86Be/Qq9BpNACRwjalU9zC3OxY
        lgksyv2EB3azs2Hg5Ds0Wyl7AwcgmViMy0s7uYCxyg==
X-Google-Smtp-Source: APiQypL/sgMRDscOesM/zrdL1QTRF5Nh56tikQdrdQDMkREU9bHS6EGHPKDF0BFGjrApSU6HGaGpCM0nXaMias8jAvA=
X-Received: by 2002:a92:cb49:: with SMTP id f9mr10827666ilq.193.1585954612585;
 Fri, 03 Apr 2020 15:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org> <20200403162742.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
In-Reply-To: <20200403162742.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
From:   Julius Werner <jwerner@chromium.org>
Date:   Fri, 3 Apr 2020 15:56:40 -0700
Message-ID: <CAODwPW_iSK_d6EHCk7QUVF7=bHVLuUYHX5mfapf+yeyuHHdNZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smd_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
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
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
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

> +       wdd->info = &smcwd_info;
> +       /* get_timeleft is optional */
> +       if (smcwd_call(SMCWD_GET_TIMELEFT, 0, NULL))

How is this supposed to work? A firmware that implements this call
would return the time left here which may not be 0 (maybe the watchdog
was already primed by the bootloader or whatever), so smcwd_call()
would interpret it as an error.

I think the cleanest solution would be to stick to the same return
codes in a0 and use a1 to report the time left when a0 is
PSCI_SUCCESS. This is more consistent with SMCWD_INIT too.
