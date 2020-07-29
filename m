Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DB9232508
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 21:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgG2TCr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 15:02:47 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:36988 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgG2TCr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 15:02:47 -0400
Received: by mail-ej1-f66.google.com with SMTP id qc22so10660087ejb.4;
        Wed, 29 Jul 2020 12:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=F6RvPQWo2rxOQUwgKhzdatI6SzUaFewn4ve7RS5gdpo=;
        b=ehqWLc3J+gIujHKHyBDLFImxsfMwYeRTUnH84F2YLGdnwZlTXqdb0657/9M9e7Q+Wf
         AMCue2v0sFkEPzXdg8EHPkNP4KRg72b4ff8CKxIhLdd22SuGPhdMjIFsFWySfGJQk4Zr
         yqwH7b6tfyopMiGPPog6TZ0ii/CmWpNAGbGH5pZOueUBpnAZfEAT7sqSXXoQi4ZCUY3o
         WqQ1q+dXt0wmBETCOpCqKApXAdqkh7fqoyQHBvZiTn1ia47ucdUl5yXFhQMohtHCt1bx
         BX59tzXYUUtBRk76MPvfBo45nQqW6gfGHfFdCl9IPkqbUuO3qz1VuOhsqLbq4EpJmyNb
         ewiQ==
X-Gm-Message-State: AOAM531TeRngt0G2R+oJEuWsWtaRJAUPTZ9Kar4LEsft+bKgu+JvaEjg
        cge9K0240u6uH7QS1yukILU=
X-Google-Smtp-Source: ABdhPJwrigyfWYWlC1oTscTi/S00vRyVwCtVK1J8TCQ1Ndue3IczGeg0UBI6RW2qdkMOGa4mUYUFCw==
X-Received: by 2002:a17:907:42a0:: with SMTP id ny24mr25051905ejb.328.1596049363432;
        Wed, 29 Jul 2020 12:02:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id i10sm2593802edx.42.2020.07.29.12.02.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 12:02:42 -0700 (PDT)
Date:   Wed, 29 Jul 2020 21:02:39 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>
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
Subject: Re: [PATCH 3/7] ARM: s3c: Remove plat-samsung/.../samsung-time.h
Message-ID: <20200729190239.GA5723@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-4-krzk@kernel.org>
 <CA+Ln22HWNSwVWARKL2NeUVx1y5yqHe0SGPZ1hcqBW88awySfPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CA+Ln22HWNSwVWARKL2NeUVx1y5yqHe0SGPZ1hcqBW88awySfPA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 29, 2020 at 07:49:02PM +0200, Tomasz Figa wrote:
> 2020年7月29日(水) 18:11 Krzysztof Kozlowski <krzk@kernel.org>:
> >
> > Remove the arch/arm/plat-samsung/include/plat/samsung-time.h header and
> > move the contents to common.h headers in mach-s3c24xx and mach-s3c64xx.
> > The definition of declared functions is already in common.c in mach
> > directories, so it is logically to put declaration next to them.
> >
> > This is also one step further towards removal of plat-samsung directory
> > and it fixes W=1 build warnings:
> >
> >     arch/arm/mach-s3c64xx/common.c:174:13: warning:
> >         no previous prototype for 'samsung_set_timer_source' [-Wmissing-prototypes]
> >       174 | void __init samsung_set_timer_source(unsigned int event, unsigned int source)
> >
> >     arch/arm/mach-s3c64xx/common.c:180:13: warning:
> >         no previous prototype for 'samsung_timer_init' [-Wmissing-prototypes]
> >       180 | void __init samsung_timer_init(void)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm/mach-s3c24xx/common.h                | 12 +++++++++
> >  arch/arm/mach-s3c24xx/mach-amlm5900.c         |  2 --
> >  arch/arm/mach-s3c24xx/mach-anubis.c           |  1 -
> >  arch/arm/mach-s3c24xx/mach-at2440evb.c        |  1 -
> >  arch/arm/mach-s3c24xx/mach-bast.c             |  1 -
> >  arch/arm/mach-s3c24xx/mach-gta02.c            |  1 -
> >  arch/arm/mach-s3c24xx/mach-h1940.c            |  1 -
> >  arch/arm/mach-s3c24xx/mach-jive.c             |  1 -
> >  arch/arm/mach-s3c24xx/mach-mini2440.c         |  1 -
> >  arch/arm/mach-s3c24xx/mach-n30.c              |  1 -
> >  arch/arm/mach-s3c24xx/mach-nexcoder.c         |  1 -
> >  arch/arm/mach-s3c24xx/mach-osiris.c           |  1 -
> >  arch/arm/mach-s3c24xx/mach-otom.c             |  1 -
> >  arch/arm/mach-s3c24xx/mach-qt2410.c           |  1 -
> >  arch/arm/mach-s3c24xx/mach-rx1950.c           |  1 -
> >  arch/arm/mach-s3c24xx/mach-rx3715.c           |  1 -
> >  arch/arm/mach-s3c24xx/mach-smdk2410.c         |  1 -
> >  arch/arm/mach-s3c24xx/mach-smdk2413.c         |  1 -
> >  arch/arm/mach-s3c24xx/mach-smdk2416.c         |  1 -
> >  arch/arm/mach-s3c24xx/mach-smdk2440.c         |  1 -
> >  arch/arm/mach-s3c24xx/mach-smdk2443.c         |  1 -
> >  arch/arm/mach-s3c24xx/mach-tct_hammer.c       |  1 -
> >  arch/arm/mach-s3c24xx/mach-vr1000.c           |  1 -
> >  arch/arm/mach-s3c24xx/mach-vstms.c            |  1 -
> >  arch/arm/mach-s3c64xx/common.h                | 13 ++++++++++
> >  arch/arm/mach-s3c64xx/mach-anw6410.c          |  1 -
> >  arch/arm/mach-s3c64xx/mach-crag6410.c         |  1 -
> >  arch/arm/mach-s3c64xx/mach-hmt.c              |  1 -
> >  arch/arm/mach-s3c64xx/mach-mini6410.c         |  1 -
> >  arch/arm/mach-s3c64xx/mach-ncp.c              |  1 -
> >  arch/arm/mach-s3c64xx/mach-real6410.c         |  1 -
> >  arch/arm/mach-s3c64xx/mach-smartq.c           |  1 -
> >  arch/arm/mach-s3c64xx/mach-smartq5.c          |  1 -
> >  arch/arm/mach-s3c64xx/mach-smartq7.c          |  1 -
> >  arch/arm/mach-s3c64xx/mach-smdk6400.c         |  1 -
> >  arch/arm/mach-s3c64xx/mach-smdk6410.c         |  1 -
> >  .../plat-samsung/include/plat/samsung-time.h  | 26 -------------------
> >  37 files changed, 25 insertions(+), 61 deletions(-)
> >  delete mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
> >
> 
> For the s3c64xx bits:
> 
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> I suppose the next step would be renaming those functions to s3c24xx_*
> and s3c64xx_* to avoid naming collisions?

That's a good point. I will send a follow up patch. Thanks!

Best regards,
Krzysztof

