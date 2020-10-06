Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E0028491D
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Oct 2020 11:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgJFJNf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Oct 2020 05:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgJFJNf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Oct 2020 05:13:35 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A63EC0613A9
        for <linux-watchdog@vger.kernel.org>; Tue,  6 Oct 2020 02:13:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so7656307pgl.2
        for <linux-watchdog@vger.kernel.org>; Tue, 06 Oct 2020 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9zZ3JqKuAucMkJsBK3uQ6oqn08Q8o246NeeOkBUzIpE=;
        b=sl5DvJTU8XoKckrDy72v6SE14TnVpy4Bt91zBzW0shyY1MAQ6mAh44/03XDifpnVyT
         4w+72PUsHJIIJhKHPRrCT8pTCi2CZ3lYrznO931Zy9GGzbJgV3AbLMDW/WTkvZw1ySi0
         xZ8mKac9WB616FWJmzh+4pR4DO2W+qMrWvhETvIhmdmS6svN/TirR+Lk59vHi5nED0Fw
         UNsL0wfC4tJEer6UJgLfY8iJyldfPPnH6zruIDXY8NS9LaxnxiZNZZ15iF6VLc8jtGT7
         kw77Swrlk5F0D0JlHVpGszmJH8RyljctW41ctPimXYx2UDZ6rbS2tZM9fINpQJUVuEtk
         CGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zZ3JqKuAucMkJsBK3uQ6oqn08Q8o246NeeOkBUzIpE=;
        b=FSN4voZ1j9Jymu3e6GgdqOZR15uSGx5JII/kKIPGnXFL1x5Mo53GM+GfEU9Cd41vt5
         ve8y8ZNW2i0MwAHECDu65V1a9YrExTEehYNsfhB/RJ/v+2pFhpq4zbaKc6PrmwKrTD0i
         GAH03ec0lhrXrVNOzwSAW45Itu/ojsVp2ON9Of29Fu5f4GqftQgT/ZlQ5G84elGGBZ6E
         yCcsKz+go3JtU0tlUsx7uboO3FDPQwubKVsOniTRnapddxiLc6LQsjYbmGIbc1wFOv2I
         NZMk/zYvUblAdUfieUG0eBHIZy3z3KkB8j7c7Xo6LVITkrchsiLkpKjNI70PVBF3f234
         8RsA==
X-Gm-Message-State: AOAM532bxkYmQfJAy/Kfrs0qmugiKp3TbJRjju2Q5B51S9R9tBLc7mPc
        zZOy+Wl5iTRqjZdPp+pM87HoHNRDBPbSE4h4P7Vr5fFJ/deNbg==
X-Google-Smtp-Source: ABdhPJw+U5yOHue/Ytd8RPqMjT92IYE0mZoO7yO1YIY/4s+p2JNLru501tVYMlY3tURTLHPZrBHXQO8va9HmuomgCis=
X-Received: by 2002:a67:6b07:: with SMTP id g7mr2713184vsc.48.1601975612161;
 Tue, 06 Oct 2020 02:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org> <20201005183830.486085-5-robh@kernel.org>
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 6 Oct 2020 11:12:55 +0200
Message-ID: <CAPDyKFoxg_i8tcRjV_htv9s1Z=gxYzJtxPAnCqRR9gzR2hkG0w@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-can@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>, linux-pwm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 5 Oct 2020 at 20:38, Rob Herring <robh@kernel.org> wrote:
>
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml    | 2 ++
>  .../devicetree/bindings/mmc/synopsys-dw-mshc-common.yaml     | 2 ++
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml   | 2 ++

[...]

>  Documentation/devicetree/bindings/power/power-domain.yaml    | 2 ++

For mmc and power-domain:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]

Kind regards
Uffe
