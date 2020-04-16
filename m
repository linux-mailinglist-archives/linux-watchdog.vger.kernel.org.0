Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564F91ABB71
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Apr 2020 10:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502255AbgDPIii (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Apr 2020 04:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502374AbgDPIeu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Apr 2020 04:34:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11849C03C1AE
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Apr 2020 01:34:36 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so6865307ljn.7
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Apr 2020 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MyKtvenZZySMWZjgRLJbDJOPHGIrfVrSPfr0WfI/VtA=;
        b=fYkiVyjy7eOsJYWlAiTayzWjGkE+e1mUldI0Bx/CxoO/uRzO5h5zkKeWvLWyT4wIVq
         y4Um/zqK1i/EUxtP/cB7m2yiCfOAVbucsbSvm9uAIBdUy5w/NyEgZas2SerPH26kjihk
         NJ5qrlR6KCeUheLOqsfKpP2vrUVQYBdC/lh6Iy4lvDXzlo9F10OICHSA8GRZxV9vIwgG
         g+fgaQUuLBOTvaOt4crwBP5OOZe7ophOecfwpbiaskT4jEC1w1TFXKcnvnYX+N2JBeWE
         dUyc5WtmVr5a+KeD8IdGTWSudzyYEY/vdzcMmFi1Gbr8mYPVC1ncjFXy4g01wQx0gT9E
         vWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MyKtvenZZySMWZjgRLJbDJOPHGIrfVrSPfr0WfI/VtA=;
        b=gfpuQ0cusubOgfOhBrUJZthEUEps1QPbe8efrpIQSqY6xHn8QaCD1K6kw0t0GrkZbq
         X2lN0Lig7Nu8StWQ01bR7TxzEN5fDuUdJCJoPrNfsEmau8eYn5uQKRCGw/dkhnerY1km
         9DwOBn+0YNo2dGT7JgrdHlqFFDv9WdO4yNQq79AiF18YjF/CvgJBBYXwXs3+mxZzhbWy
         pxDv33PaCww4aQPeb+fuOOxBoA/Q0D7MuVCQl0enKMgyK1Md/irvuL/k1UafKkKvsqOT
         IrQWjpZu3vcRshQN6ocvrHE+9vBaPKRsHFCqXwHS83LW7q+H9LNbPtqwXNJL8M3TI7cY
         NZAA==
X-Gm-Message-State: AGi0PuaYBouwfT2uK73lJFiOztvruOp4GFqH7aHoh0rQFOy7sp61wG03
        9ZjxYdYAouYi8SIEvZj+KDw3IbbpDc7zCBG3bl66iQ==
X-Google-Smtp-Source: APiQypKpg4Qo0k4IoZG1lD0aQ14OtbNSt7M01nnNL2FnfHvo9Iw7EPQxYDZAVptV9fOJpu5zJ470WV5Vz4uxzy+rmRs=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr2229929ljh.223.1587026074289;
 Thu, 16 Apr 2020 01:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200402203656.27047-1-michael@walle.cc> <20200402203656.27047-12-michael@walle.cc>
In-Reply-To: <20200402203656.27047-12-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 10:34:23 +0200
Message-ID: <CACRpkdbANL_W3gcTwue5VUCWT95boMXjFSqTeFDZvJ6iSeNpJg@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] gpio: add support for the sl28cpld GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Michael,

this is looking good provided we can get the generic GPIO regmap
helper reviewed and merged. Thanks!

On Thu, Apr 2, 2020 at 10:37 PM Michael Walle <michael@walle.cc> wrote:

> This adds support for the GPIO controller of the sl28 board management
> controller. This driver is part of a multi-function device.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

> +       depends on MFD_SL28CPLD

Apart from this depends it seems the patch is compile-time
independent of the other patches so I'd suggest we just merge
the generic regmap driver and this driver to the GPIO tree once
we feel finished with them, optimistically assuming that the MFD
driver will land and that we will not need any fundamental
changes in the GPIO driver.

Worst case we have to revert the driver and that is no disaster.

Yours,
Linus Walleij
