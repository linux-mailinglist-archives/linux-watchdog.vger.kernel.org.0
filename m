Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3C7DE8CF
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2019 11:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfJUJ7Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Oct 2019 05:59:16 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:35561 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbfJUJ7Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Oct 2019 05:59:16 -0400
Received: by mail-ua1-f66.google.com with SMTP id n41so3619492uae.2
        for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2019 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pdHS5iTjhH216W3OQmstavgIx2TJJX3EShTQ+j4ScZ4=;
        b=A+lOYOm+Xr9/QoAPbGmRqhJkdtF0Lqe8WUL4ACj5RU0nNNF8swHXxJ1znB4G8Os5Ny
         GFNaGZ/ejdu+ewHfdHOPCmruyouYE59ddCzoE/xVdTrwx+9jDUvHxy7BDp9wIDVdNxfI
         /6ZVUUwI4YOYuKQGiiojp4zvyT6amzLfph0exWZKznf04jiM3DxdRAExfvqYeyeqcqdD
         +jHYiIvYbVFtFjJ+6C1ZbvLjFHV0Oba7w+6LuMl93+fW5xmlBomtFj1iieYNFONPPx+n
         GuW5fPipC9llariB4WKqkEzYSA5LiCXyADKzbRoQItF2MbOokfHyNH6+nW64EQTg2+/Q
         SDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pdHS5iTjhH216W3OQmstavgIx2TJJX3EShTQ+j4ScZ4=;
        b=MqSNqiY+pwRM5+VJhey52pG+/i/xMjCNbB/u2qNaWn0/QxZoh8RVBfRA9GGlfPEYhZ
         q9dHAPCK0uME2F9zwq/JlV9J4/Wb6w6bBF2Nq6gHXzC/OkGg0hfoFdwpURmGZ3LuXfYv
         9bmOIRqCmnfqHWpIv/H7g/xk3epbh6WRRt+o/knabWlY+efJInfxErhbPxtsH8DWITkV
         olblI6RLdb8je6DzkfibXmBQMBU/2Q3bgA+1C/EhZnGLkZYu/XcAE4NCGGeruXaXU1nS
         V6W9XlBDyKDeGsjvVIJXB8LTkD5powSUrsFyvUOfH82cSgOui5zt5znMr7xhoKu5sbuW
         6XTg==
X-Gm-Message-State: APjAAAVyGGvL5BnMUEiKyNz+6idwhTrvS6CJc0JPUgoqfZNmuck2sUv5
        9M75qGKsPBMeeAoRu0qqJjHIVRqZg0CUSCT/3T/eaQ==
X-Google-Smtp-Source: APXvYqyX35z25w9uC+afBeqWkMX+7aKojU6riMDxod1s9TtFAaRTKL1Dky4gIujxC0cprlM32BbtJAeRhAkOs/Lhxl0=
X-Received: by 2002:ab0:5a97:: with SMTP id w23mr2075364uae.129.1571651953620;
 Mon, 21 Oct 2019 02:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de> <20191018154201.1276638-5-arnd@arndb.de>
In-Reply-To: <20191018154201.1276638-5-arnd@arndb.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 21 Oct 2019 11:58:37 +0200
Message-ID: <CAPDyKFqHoPOPAA_0WpxQUjBTXJ-5BfMbcNXhFNr7rv3RObsgow@mail.gmail.com>
Subject: Re: [PATCH 05/46] ARM: pxa: split up mach/hardware.h
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Brown <broonie@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 18 Oct 2019 at 17:43, Arnd Bergmann <arnd@arndb.de> wrote:
>
> The mach/hardware.h is included in lots of places, and it provides
> three different things on pxa:
>
> - the cpu_is_pxa* macros
> - an indirect inclusion of mach/addr-map.h
> - the __REG() and io_pv2() helper macros
>
> Split it up into separate <linux/soc/pxa/cpu.h> and mach/pxa-regs.h
> headers, then change all the files that use mach/hardware.h to
> include the exact set of those three headers that they actually
> need, allowing for further more targeted cleanup.
>
> linux/soc/pxa/cpu.h can remain permanently exported and is now in
> a global location along with similar headers. pxa-regs.h and
> addr-map.h are only used in a very small number of drivers now
> and can be moved to arch/arm/mach-pxa/ directly when those drivers
> are to pass the necessary data as resources.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[...]

For the mmc part:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
