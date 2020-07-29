Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C83B2323A1
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 19:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgG2RqR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 13:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgG2RqR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 13:46:17 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D45C061794;
        Wed, 29 Jul 2020 10:46:17 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id j8so13080844ioe.9;
        Wed, 29 Jul 2020 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vL2EiXbptWkb+CeJ1aIsaGaoV70y1mT289hYeI0vTkg=;
        b=Pf7nKXdGqrVr1RkAz85fBJsu445+W+MUqnKlS7wvsWqPMO452kHEujmP81SJ2ac2bL
         GWC1J1h8oaCzKyxX7XK0ItTcmK31ixIteOA0BSX4uj+twuZdQpmi3po/ANKyEIYDbmn8
         EMdDl5xm6ZzEU/zfhm66lMzsaVChyR/LeQVY4PLxaz5HhQ7faPp8RLNd1F/bgLCB0qyH
         vH8NwBOTEycRR1UyELKB0AC7Pif05craVIlH+T4owJgFn7exkibt5z8R/Wu0eXaXC1D6
         8Ca2pERhmJdQ8UandVs4rt3pFeYa37PMpCkubj+L/ssLWtvhmzGKkpxEF4iPtQBqG6NQ
         9tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vL2EiXbptWkb+CeJ1aIsaGaoV70y1mT289hYeI0vTkg=;
        b=Hfc50umP6M2KOEXdA3I9Jt//rhhqT3yvzKAu+wsefjskTMGQ6H3Yth+7FL21OScfI4
         olWHCUhAWe8q4rwtLe8UU2v3UuRrXdrct+QD54Sk2fuQr/6BWU0Bf2sOb1eieYsBH61W
         ha025ViNO7CxhUU+fzOz0QRl5NIUqJAls+/KLdK1xcfDf7QI+r9mR+Zvadq+HGlQH4jo
         2yylyEAnu5Q9gmRmvP+lxiF3YJ0Jbn41FYpeSXVgtAl92D2bxf0klL/maTYATwN3pKrJ
         6YwTrcMbRreCqIH6PhhEWhGsT6t/LhRs44VMWj1DUXy28hZmdPn1cxVdAlAcPRgJXl+G
         j1qQ==
X-Gm-Message-State: AOAM5334VF8fXvR6kyA0iM6pN0xVpPF0Ws7L9TeE1KTR2dySeoPstrsp
        Ev1SSe/T46F6wjJuXgmuDIL1wN6/68LZHj4q4vc=
X-Google-Smtp-Source: ABdhPJwZMsvcOsBvVWQSB6Ahydqr7L806TY0co61XGVRpo8vp0muMNJkqI8HcDgdalYRhv7rGELQFoCQfN7UP/aoQDc=
X-Received: by 2002:a02:ccd7:: with SMTP id k23mr24083657jaq.73.1596044776435;
 Wed, 29 Jul 2020 10:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org> <20200729160942.28867-3-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-3-krzk@kernel.org>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Wed, 29 Jul 2020 19:46:04 +0200
Message-ID: <CA+Ln22EMWTRu4j-6b5Oj63Yvo+GYa_cB2+QU-h-woQ5G1K5DJw@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: s3c64xx: Include header to fix -Wmissing-prototypes
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
> Include the spi-s3c64xx.h header to fix W=3D1 build warning:
>
>     arch/arm/mach-s3c64xx/setup-spi.c:11:5: warning:
>         no previous prototype for 's3c64xx_spi0_cfg_gpio' [-Wmissing-prot=
otypes]
>        11 | int s3c64xx_spi0_cfg_gpio(void)
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-s3c64xx/setup-spi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-s3c64xx/setup-spi.c b/arch/arm/mach-s3c64xx/se=
tup-spi.c
> index 39dfae1f46e7..03c9d296bb0f 100644
> --- a/arch/arm/mach-s3c64xx/setup-spi.c
> +++ b/arch/arm/mach-s3c64xx/setup-spi.c
> @@ -4,6 +4,7 @@
>  //             http://www.samsung.com/
>
>  #include <linux/gpio.h>
> +#include <linux/platform_data/spi-s3c64xx.h>
>  #include <plat/gpio-cfg.h>
>  #include <mach/gpio-samsung.h>
>
> --
> 2.17.1
>

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
