Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5C521814D
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jul 2020 09:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgGHHfj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jul 2020 03:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgGHHfe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jul 2020 03:35:34 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7028DC08E85B
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Jul 2020 00:35:34 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id g139so26286522lfd.10
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Jul 2020 00:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BR6f0/BqJCEN1CVfcKyyqFPGBwWk+T779U9WQ9pd+T8=;
        b=XmHSa0UzMCoKN/tnYpRpf1kVvmOC6ZnhRaRiqN4dhekdDS+dYRV4tKqjXeotjjk6CM
         0MOlfsqx2ohqnb6RqR6ienmLqhlOgV5HpjXxdnuF+2RNshU0o9RIAIhUZSGaeqwlgB4C
         gUW8FyQX+VrymFES8f5hJ2kMWkTZXksc4SuBtTUoukp8gzsIOf9gOetUEQ9GKiXZ9aEU
         cTaQ5sIe+t/aBH6d25PGmD5Ym6EFRxjCK4D01B+XFLYt6JFtN/HdUdeQ6VoTnNi1Qi+J
         7eBpWDqvtLxhJ+XWohhbbsQWumjK6uhfievDT2eH1knqhrEDjvihiHsulNpgkNzY+qj6
         CMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BR6f0/BqJCEN1CVfcKyyqFPGBwWk+T779U9WQ9pd+T8=;
        b=TpHYRH0RdDlEaPgBNDSzReFFgOmfMqCYqZkIWTkANJfnbCvCHLXXNl6quHpz48VVm8
         QePjn5859VGgT9A8u0VMkUMfIPubbCIdEZBkrxJieE4ChgGe9hD9/1bcgSt4a1Rw8W1D
         KF6ASmL/hG+OyGS0xn3+fhtXb+0hmIJDBLd0K+l7z0Q0xZe/VGcAmVxGGbB71vuP2sPT
         uywbt167m6SI1rTuTU+O8bb3+KRWrWkj8TiOnn3KZdfE+7+o1ahVVKEQOGoXp8TLrMI0
         tAtqzgdMoKEG/GIutZmEQLNBBaDsAMfJMD2U+HcThsTpulti/bZoTG9TZtVZN1cS4DSl
         R9HQ==
X-Gm-Message-State: AOAM531Zn1Rz8jp2464fssujojGLK6jJHnJwU+URBQS9XPgqr95zyM4M
        FzyZe+x1CjpO5UZdD2WNaZbGWjk+GTXkZF/JL4s9mg==
X-Google-Smtp-Source: ABdhPJyJ+eDL/+RhcnG7xcn/RKZTuk4K1j7DdGcaDL2nOuPTPOOM3n5gq5c736mD3TdGBOD+yswnwtLJpQbCLuN0+7s=
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr35325021lfp.21.1594193732803;
 Wed, 08 Jul 2020 00:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200706175353.16404-1-michael@walle.cc> <20200706175353.16404-9-michael@walle.cc>
In-Reply-To: <20200706175353.16404-9-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:35:21 +0200
Message-ID: <CACRpkda=C1XxLEJrVb8oMdrt1CgVyfDn7=cf7UdK0AJJwt+0Yg@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] gpio: add support for the sl28cpld GPIO controller
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 6, 2020 at 7:57 PM Michael Walle <michael@walle.cc> wrote:

> Add support for the GPIO controller of the sl28 board management
> controller. This driver is part of a multi-function device.
>
> A controller has 8 lines. There are three different flavors:
> full-featured GPIO with interrupt support, input-only and output-only.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Changes since v4:

This is awesomely elegant now.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose it needs merging through MFD with the rest.

Yours,
Linus Walleij
