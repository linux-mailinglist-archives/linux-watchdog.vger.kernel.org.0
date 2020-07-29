Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935B2232510
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 21:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2TI7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 15:08:59 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:38955 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2TI6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 15:08:58 -0400
Received: by mail-ej1-f67.google.com with SMTP id f24so4972711ejx.6;
        Wed, 29 Jul 2020 12:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Kk6GZ/lJmAXVSU51HkWJo7PA9w7q1gYfnsyVr0WMPOk=;
        b=JLMz2iC/vIPVcWWEm4JrUKpTuusef8Vp/EgxzHIqjTRyD4XJ3GUnlMaun8M/Jq/Peo
         YsR5JQ9XKUHfb4lZwLrt2aFCgWs+iwZGyxTJgIfqaAsCRie/kLQ6/8r+foY0mG+ezcLD
         zVgT5fO5KoHXE0XpkqzTUI5YB39q69Kl3McHzaMbCJhpTYlH9eQ29nSt0CUxb0Xa93NI
         Upa+TZivwyME//onZqU9B4Tfv69Rs7ha5FiFK77w0nG4utKXX2oJLZbQA+C3sA7TP/jx
         HVyCAEM6yXlOZXsrL9UDt27rHAE4CW5yMSpLcVPkpejpexhHYMfAhuYPDZQqUqESpnPl
         /ikg==
X-Gm-Message-State: AOAM533P9pkJ+1eDzMCIzKbOUX0WgS3tNOpRjVs4eDAu7wajH9dBS+Vt
        3kGYKAP2ttdGI2/XcgZvGrA=
X-Google-Smtp-Source: ABdhPJy+cd4Zv9RClGXMrb12WPzglxJiIigi0VSAL6EF6L9FGlqR/jQZQ2fHi+OZEEkZV03WOmvLzQ==
X-Received: by 2002:a17:906:6d4d:: with SMTP id a13mr31002287ejt.146.1596049736098;
        Wed, 29 Jul 2020 12:08:56 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id m5sm2616809edr.59.2020.07.29.12.08.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 12:08:55 -0700 (PDT)
Date:   Wed, 29 Jul 2020 21:08:52 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH 5/7] ARM: samsung: Kill useless HAVE_S3C2410_WATCHDOG
Message-ID: <20200729190852.GA5822@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-6-krzk@kernel.org>
 <20200729170245.GA177035@roeck-us.net>
 <CA+Ln22EcU+mhaYJYd3M-S0ZP-mA0bW4Qit-Kh6MyvwzxTRJ3GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CA+Ln22EcU+mhaYJYd3M-S0ZP-mA0bW4Qit-Kh6MyvwzxTRJ3GQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 29, 2020 at 07:36:38PM +0200, Tomasz Figa wrote:
> 2020年7月29日(水) 19:02 Guenter Roeck <linux@roeck-us.net>:
> >
> > On Wed, Jul 29, 2020 at 06:09:40PM +0200, Krzysztof Kozlowski wrote:
> > > A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs does
> > > not have sense, because:
> > > 1. All ARMv7 and ARMv8 Samsung SoCs have watchdog,
> > > 2. All architecture Kconfigs were selecting it (if WATCHDOG framework is
> > >    chosen),
> > > 3. HAVE_S3C2410_WATCHDOG is doing nothing except being a dependency of
> > >    actual Samsung SoC watchdog driver, which is enabled manually by
> > >    specific defconfigs.
> > >
> > > HAVE_S3C2410_WATCHDOG can be safely removed.
> > >
> >
> > That is not really correct. HAVE_S3C2410_WATCHDOG is used to ensure
> > that users can only enable S3C2410_WATCHDOG if the watchdog actually
> > exists in a system. With this change, it can be enabled for all
> > architectures and platforms.
> >
> > NACK.
> >
> > Guenter
> >
> 
> I'd side with Guenter on this. We better not flood users' screens with
> options that are not relevant to their hardware.
> 
> An alternative here could be making CONFIG_S3C2410_WATCHDOG depend on
> a general symbol for Samsung SoC support if there is such, but then,
> are we 100% sure that all the Samsung SoCs would actually have exactly
> this watchdog? If a new one shows up, one would have to bring back
> this HAVE_S3C2410_WATCHDOG symbol.

Ah, good points. Indeed for all of such SoC drivers we usually just
depend on architecture to limit the choices on other architectures.
In this case it would be:
    depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || COMPILE_TEST

I admit it is pretty long, but we already use this pattern. In shorter
version (less ARCH*) for all drivers, in full version also in:
drivers/iio/adc/Kconfig
drivers/gpu/drm/exynos/Kconfig

Have in mind that in general we follow the first approach and only three
drivers have still the HAVE_xxx option (also HAVE_S3C2410_I2C and
HAVE_S3C_RTC).

I can update therefore the "depends" while removing the
HAVE_S3C2410_WATCHDOG option or just keep it.

Best regards,
Krzysztof

