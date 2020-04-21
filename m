Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5331B1B15
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Apr 2020 03:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDUBJa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Apr 2020 21:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725958AbgDUBJa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Apr 2020 21:09:30 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DB6C061A0E
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Apr 2020 18:09:28 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id z1so7404733vsn.11
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Apr 2020 18:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aFRq3RluqVTW3eItiffvhrul27fygOSDx5LOp792/cY=;
        b=jGemw2P2rq8+zKge7bcDV6mMP5GeCYSBjW21Yga4LFd+SRnJNGAo1LIyCZsecJrAj+
         3Y2nk68i50FiVZkjKg3XewJTSb85k963UHIJB4QyqWe/KfxK1rup1VWPKA6RhXdb/LbF
         ZALCrIEKJacoE0XvLyBHMyRJFtUd8Qd5IXRqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFRq3RluqVTW3eItiffvhrul27fygOSDx5LOp792/cY=;
        b=KuG82qN5ZMXe7fMh7HJ67CYIi8FPji9xoUWBRRHcVD85xa/jhH+uu8/Tgy0Ixw+Teb
         mztbMXVEcm4XKjXqDKXNmmi37lZL6WUe9iyaGtkE4FXcxK3nCMPQLqP9cmCihtWCE81Q
         YBSXmvrDYk7p+oJCJFcFLawqKe12PmHozjNWUuXALj3/ZjrIXDzH02opfU53+IaWjUbF
         ZP/wGhy5Fw0q3bMa8MoO/lxpzlKSKF3fNr3qfMB8sgtKjo02JSwwbILDgnNS7hYF13oA
         QKQk7vuRWjsuSwEqwS3A2Fl1fSplKVNJBYPwjvLGXhL3WNLErhWx0S2I1YAIhO+pCBeI
         sWoA==
X-Gm-Message-State: AGi0PuYDdkL5o64S8kz5IIuzSSySBvse9K8QiGSVEp2hYz+mudm51i9W
        VbnthDGj4eeLy+9LSiRt3D3L4yh6jiw=
X-Google-Smtp-Source: APiQypJ4+SV5IRmKY3wcFhS7tBt0WcuUB+d5d2XhQG9ZzPA4/KieDi4asDhEsFqZUbKq3eqSwJHI/A==
X-Received: by 2002:a67:28c5:: with SMTP id o188mr14746656vso.227.1587431367804;
        Mon, 20 Apr 2020 18:09:27 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id u5sm338762vkk.16.2020.04.20.18.09.26
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 18:09:26 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id 1so7387608vsl.9
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Apr 2020 18:09:26 -0700 (PDT)
X-Received: by 2002:a67:d61c:: with SMTP id n28mr14119322vsj.70.1587431365930;
 Mon, 20 Apr 2020 18:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com> <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
 <20200415231215.GA182398@roeck-us.net> <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
 <CAODwPW9Vt7TcWfKYDmRgLndb2-+5HoNvA6XMJJznXCudQDngqw@mail.gmail.com> <9d029a04-2a37-cbbe-1932-be34d34f6b69@gmail.com>
In-Reply-To: <9d029a04-2a37-cbbe-1932-be34d34f6b69@gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Tue, 21 Apr 2020 11:08:57 +1000
X-Gmail-Original-Message-ID: <CAKz_xw33YBChSCDHcki2JCR=LXrvfEN2pseEN471xVvqhqrUfA@mail.gmail.com>
Message-ID: <CAKz_xw33YBChSCDHcki2JCR=LXrvfEN2pseEN471xVvqhqrUfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Julius Werner <jwerner@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Will Deacon <will@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Rob Herring <robh@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Olof Johansson <olof@lixom.net>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Thanks Florian,

> The PSCI binding itself has provision for specifying function IDs for
> different functions, and this seems to be followed by other subsystems
> as well like SCMI:
>
> https://www.spinics.net/lists/arm-kernel/msg791270.html

Are you referring to this line in the devicetree linked?

+- arm,smc-id : SMC id required when using smc or hvc transports

I cannot find any prior definition of this in the devicetree yaml
format, so I will add that as well.
Did you have a link for the psci usage that you referenced?

Thanks

Evan
