Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3F8331ECC
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Mar 2021 06:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhCIFwH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Mar 2021 00:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhCIFvz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Mar 2021 00:51:55 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08897C06174A;
        Mon,  8 Mar 2021 21:51:55 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id f8so6694621otp.8;
        Mon, 08 Mar 2021 21:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P8use5HznHVSTRQHEMf/PO2GeUcJ6pS+jo8eH21EzzA=;
        b=MFhEXsN/NqptaShWoDt2CvQgZ+3DpRXwRezMOCNCfjB31lf9RDZkGmT+WEoyr9jiD1
         ROVQ1GdVvfOL7M7ULXPlUkqhSKdo+dJ8T/NZbApQquzaL590C3yNkOHPccu088QBBeMp
         pOB3rJD4e4yWsIgYPyKq8sJe36+tXOhyU5Hr2NosKvPyFgh5lwBM4HsfR6x4Ax1bGdGp
         8uDzT2mO7D7zMDdsAjESAR/ZJcRjsrYe0o5jWPqqpX/wACiEj1vmeIapbfAOnT+svJ2j
         8isQJhUhBg8enKvkiCbJoMxGHCeQwMvsCMktD1iU5DmpHXe1YQbBaQfGS/2+ALnSOU6y
         VWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=P8use5HznHVSTRQHEMf/PO2GeUcJ6pS+jo8eH21EzzA=;
        b=VyS+tt9clC00ypZdHLG8xNhVuzggSheqRQpVge42j4imFYT9rn2Iiifetm9AQ/VCse
         nyCq96xkE7IAYkX8cOuIhY1xdT2nOBuOpO+iToySRoabPvfmOSBf1dWW1PF+++lPWuwJ
         QOejexWx/Xa/lbtx6485g9JqLOyW2M/MSwzTyLtdd6exPymABDz6TTbba5kfKGneBdGj
         9x+hcyYzJ3NmfLIyEOjRI81k+d2OuruVWf+Flq3rzI4y5U6HihuhaYS26YQiEVw6+BYx
         YiCbuC0/IcokkFmIiEIII5ul4HuQAESKRyexwaap3aigsiAHU0ggXFbqIFyjdTj9gHKU
         dT9w==
X-Gm-Message-State: AOAM533NuOkxyy7k0wcvJIHVoZJMm+LCyWMNUPMS5xBOZupC+UhmP8FZ
        +picvHltLUBgXt3dRYzQVfTIjRXkCJI=
X-Google-Smtp-Source: ABdhPJz5oVFutlAYPZ5icpEM+7jpjpJ2D0jxP5kqu3uMFieSPbIMKHk4E255CqqIe4ofHvzErsW5mQ==
X-Received: by 2002:a9d:6545:: with SMTP id q5mr22902859otl.179.1615269114081;
        Mon, 08 Mar 2021 21:51:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 53sm1126323oti.77.2021.03.08.21.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 21:51:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 0/3] add "delay" clock support to gpio_wdt
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <20210304221247.488173-1-linux@rasmusvillemoes.dk>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1c0cd771-6067-69be-9838-9d3ab24a2503@roeck-us.net>
Date:   Mon, 8 Mar 2021 21:51:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304221247.488173-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/4/21 2:12 PM, Rasmus Villemoes wrote:
> As Arnd and Guenther suggested, this adds support to the gpio_wdt
> driver for being a consumer of the clock driving the ripple
> counter. However, I don't think it should be merged as-is, see below.
> 
> The first patch makes sense on its own, quick grepping suggests plenty
> of places that could benefit from this, and I thought it would be odd
> to have to re-introduce a .remove callback in the gpio_wdt driver.
> 

This has zero chance to be accepted. As suggested in the patch,
just use devm_add_action(), like many other watchdog drivers.

> Unfortunately, this turns out to be a bit of an "operation succeeded,
> patient (almost) died": We use CONFIG_GPIO_WATCHDOG_ARCH_INITCALL
> because the watchdog has a rather short timeout (1.0-2.25s, 1.6s
> typical according to data sheet). At first, I put the new code right
> after the devm_gpiod_get(), but the problem is that this early, we get
> -EPROBE_DEFER since the clock provider (the RTC which sits off i2c)
> isn't probed yet. But then the board would reset because it takes way
> too long for the rest of the machine to initialize. [The bootloader
> makes sure to turn on the RTC's clock output so the watchdog is
> actually functional, the task here is to figure out the proper way to
> prevent clk_disable_unused() from disabling it.]
> 

Is there a property indicating always-on for clocks, similar to
regulator-always-on ? The idea seems to exist, but it looks like
it is always explict (ie mentioned somewhere in the code that a clock
is always on, or "safe"). It would help if the clock in question
can be marked as always-on without explicit consumer.

Thanks,
Guenter

> Moving the logic to after the first "is it always-running and if so
> give it an initial ping" made the board survive, but unfortunately the
> second, and succesful, probe happens a little more than a second
> later, which happens to work on this particular board, but is
> obviously not suitable for production given that it's already above
> what the spec says, and other random changes in the future might make
> the gap even wider.
> 
> So I don't know. The hardware is obviously misdesigned, and I don't
> know how far the mainline kernel should stretch to support this; OTOH
> the kernel does contain lots of workarounds for quirks and hardware
> bugs. 
> 
> 
> 
> 
> Rasmus Villemoes (3):
>   clk: add devm_clk_prepare_enable() helper
>   dt-bindings: watchdog: add optional "delay" clock to gpio-wdt binding
>   watchdog: gpio_wdt: implement support for optional "delay" clock
> 
>  .../devicetree/bindings/watchdog/gpio-wdt.txt |  6 ++++
>  .../driver-api/driver-model/devres.rst        |  1 +
>  drivers/clk/clk-devres.c                      | 29 +++++++++++++++++++
>  drivers/watchdog/gpio_wdt.c                   |  9 ++++++
>  include/linux/clk.h                           | 13 +++++++++
>  5 files changed, 58 insertions(+)
> 

