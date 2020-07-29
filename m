Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4276D232385
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 19:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgG2RkB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 13:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RkB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 13:40:01 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01064C061794;
        Wed, 29 Jul 2020 10:40:01 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id c16so8333007ils.8;
        Wed, 29 Jul 2020 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aEIYYq2kW/WiB6gUi4gfbO509LEn/L/Pyhh8ZaCEkmE=;
        b=ZIAkcoprPEJ+NVIytPXW7aSmDNMFVtiigUDPl/ClKFR8KIIQsziLh0oVZ0wnHihULU
         uXFjNq74e7qd8p4nRqlufhnQ+KV4/AnDIfG6PkEccPwwY53UWbBQdoKVHDbnlYm0x/zt
         7g85MxLYVCd60/lbpRH2F1wAn8yCWMLdffq31MXEdjhEL95Y5uXMgJ8QNfLUm6QMcLK0
         gTFcJh5phQAFCZbSYhfQx3ULbKrbPvIYdy8Q8W0XjxIxO9rs75F7+8Bjf9c4SdBjpjdY
         VRqzj/RazUGauvupuwGUFHaVitpZT5dE8vtqXDkAJ/1m5e15P/awYrDdN2P3aNKb0Cjm
         EhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aEIYYq2kW/WiB6gUi4gfbO509LEn/L/Pyhh8ZaCEkmE=;
        b=e5uFTRCq9gyjuZVhbmhfVdGPhIwi0kP+Wd5Kj+dBSAvg7o+WOovp5nR7pf8uG1FDQ+
         fq0ATRZiVQdIQIktEk4wWvh1aKrSkLV2sronIREko+hZQ7aJ1k+JTQhK0+X69s8rvmSs
         /wzuDp+jwH9t8+6PDvDWj35NV+LXTA2mDGF8WhyTtKTI1GYTghI6lcqkNHYzW+ILxgBi
         cGHFQW7zK35sMcGl4kXNJePVPG/8RdeiyJ4cAI1aPAbwI1McEVtGR21/QNbm8M86Oluv
         +4F1t/xl0bM7zJfFGz/TWAeUXlgjpC8PI7ZZ4n6ibvxazwbWJ+2qkW9wUA4YlOYHhqbm
         /+Aw==
X-Gm-Message-State: AOAM532wnusYvQ2O5QqKh8XEpdsMAxaUGCdgjMJfi0FhQeBLmfPf7U83
        YrpHKYrdqO7rb7oi8SU16thjy193m6CoA713Qt0=
X-Google-Smtp-Source: ABdhPJwlp3xYVIJRiw+Y130nbuhCK+JvFexj+zBfdC3ovRWCIz3H/lUQR0sXo63rj1TyhNei7XVXo1nGHy8fELiAB2A=
X-Received: by 2002:a92:8946:: with SMTP id n67mr16523409ild.168.1596044400155;
 Wed, 29 Jul 2020 10:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org> <20200729160942.28867-2-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-2-krzk@kernel.org>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Wed, 29 Jul 2020 19:39:47 +0200
Message-ID: <CA+Ln22E_VkAYz7cpE1TdVGj6AkjWOgyVm01gzSjMPs=JE8+qLw@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: samsung: s3c64xx: Declare s3c64xx_clk_init() in
 shared header
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Vincent Sanders <vince@simtec.co.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:SAMSUNG SOC CLOCK DRIVERS" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

2020=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 18:11 Krzysztof Kozlowski <kr=
zk@kernel.org>:
>
> The s3c64xx_clk_init() is defined and used by clk-s3c64xx driver and
> also used in mach-s3c64xx machine code.  Move the declaration to a
> header to fix W=3D1 build warning:
>
>     drivers/clk/samsung/clk-s3c64xx.c:391:13: warning: no previous protot=
ype for 's3c64xx_clk_init' [-Wmissing-prototypes]
>       391 | void __init s3c64xx_clk_init(struct device_node *np, unsigned=
 long xtal_f,
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS                       |  1 +
>  arch/arm/mach-s3c64xx/common.c    |  1 +
>  arch/arm/mach-s3c64xx/common.h    |  2 --
>  drivers/clk/samsung/clk-s3c64xx.c |  1 +
>  include/linux/clk/samsung.h       | 21 +++++++++++++++++++++
>  5 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/clk/samsung.h
>

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
