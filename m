Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E188715F8C0
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2020 22:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389072AbgBNVcY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Feb 2020 16:32:24 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:39360 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388065AbgBNVcY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Feb 2020 16:32:24 -0500
Received: by mail-io1-f65.google.com with SMTP id c16so12101574ioh.6
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Feb 2020 13:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BZKc7Iw5Ao6DeSW088cynAow9LgysvsQp4C3aBIY+yc=;
        b=WMQs/0hLj9/SxQ3vyxLv+3rncv4W8okLOKv6C0paboIrojTdECQfyJCrhOCRT0fx4G
         oM3HAXuULlD2gvgTYP2NxZj61hNw6RN40PPsvbd226CVbYcK1BLyT/VvhFm1NUfXzdYg
         VY8r0gqWL+Gg+F2FX6wfqU9i/m0gWGApmJFk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BZKc7Iw5Ao6DeSW088cynAow9LgysvsQp4C3aBIY+yc=;
        b=ORULwvPe2xugv3dLD1Vt+EqLbIRt+rU2xmFZ5lZWIy5uycEzoEbWJu+QNFwRMoPxE+
         i6H3wee6k+rVdm85zchASzhYnJRBnz6FWtHUmL40QYrfIC5R02NT5aaY6+Ms8O081hRG
         3kpYMuGf9hZEIRd9OT/H4E939u+h2tvwNp4NMBxuOlpoCKJ8ATBPspUjxcSM9gzXICZh
         DlC5sF7+hEwnggK+ExYjNctT10WXLkHCHQHBS1NwEznJ3gSuKQsGFt+E2fL2EDk3fzVi
         TCKfsMbtpTN1M0uxxId73VxDO2s6NaA7Q9GKmCrvFdClH+3y2N97c03CYX0tO0cJJyJW
         ZMog==
X-Gm-Message-State: APjAAAWbpypBSUOK/lpoN+p90CaOQn6LIfln0SGsi0mlVvJ1PJ/Yr99z
        43zmDzIz9v4PM0VMgYJLMJ6uUvAx9PJIMb36tNJnAw==
X-Google-Smtp-Source: APXvYqx7rGGJlQRvlXAmdf/4YbIGlcmVKixshxKK0TyrASYGQsdOT/bDRr50fWVkgOszmmXZ5IeK2mFn5MiS01GixLo=
X-Received: by 2002:a5d:8796:: with SMTP id f22mr3932931ion.163.1581715942261;
 Fri, 14 Feb 2020 13:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.2.I7c8247c29891a538f258cb47828d58acf22c95a2@changeid> <804d3cc5-688d-7025-cb87-10b9616f4d9b@roeck-us.net>
In-Reply-To: <804d3cc5-688d-7025-cb87-10b9616f4d9b@roeck-us.net>
From:   Julius Werner <jwerner@chromium.org>
Date:   Fri, 14 Feb 2020 13:32:09 -0800
Message-ID: <CAODwPW-d_PpV4Jhg2CC+7Tfyrrh=gh6hRfcEKFb4gj+LB6vrWw@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-watchdog@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Anson Huang <Anson.Huang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> > with a Secure Monitor firmware to forward watchdog operations to
> > firmware via a Secure Monitor Call. This may be useful for platforms
> > using TrustZone that want the Secure Monitor firmware to have the final
> > control over the watchdog.
> >
>
> As written, one would assume this to work on all systems implementing
> ARM secure firmware, which is not the case. Please select a different
> name, and provide information about the systems where this is actually
> supported.
>
> If it happens to be standardized, we will need a reference to the standard
> supported. This needs to distinguish from IMX_SC_WDT, which also supports
> a secure monitor based watchdog (but doesn't claim to be generic).

Back when I wrote this I was hoping it could be something that other
platforms can pick up if they want to, but that hasn't happened yet
and the code on the Trusted Firmware side is still MediaTek-specific.
Unfortunately Arm doesn't make it easy to write generic SMC interfaces
and my attempts to change that haven't been very fruitful for now. So
yes, probably makes sense to treat this as MediaTek-specific for now,
we can still consider expanding it later if there's interest from
other platforms. (I would like to avoid every vendor writing their own
driver and SMC interface for this, although looking at that IMX driver
it seems that we're already there.)
