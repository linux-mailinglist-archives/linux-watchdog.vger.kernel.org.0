Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7506A2323B2
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 19:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgG2RtP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 13:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RtP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 13:49:15 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22755C061794;
        Wed, 29 Jul 2020 10:49:15 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id s21so20161833ilk.5;
        Wed, 29 Jul 2020 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ycpaC4HDS5mWn3wrZmk78uipQQWS0G3LEzZ0F3Dgd/U=;
        b=RRkWoHYwzXDFpUWYKFbsbzM3WXIDK7iWfjPNTsozoCQfOYxT7sbXZhXSzYdKGwwB0H
         KpaST50MGkKYzAFhpwY4qgurIay8CcPHtQn8ABhCznnMp2vv289WbzaCMlyYHJT3NTeS
         Go9xud04+Q3Y/zDYQfL/TddYRe9boA1FNbQkCXEXHijXE/+x6lEs0Jwt0BG2XAZCz/lH
         2rHM326tBGOGKMVLUqgpGfLtEnoxMFTIdsKHTEQ3/1kZVFHHMYvNG3yP03qecvJyJ25W
         HBH1kiPZAP4BnYRBqBTU8mBqelSqsXd8BJjb+eEzvJl2M2zlsGl885slmt9In/+WHJyb
         14YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ycpaC4HDS5mWn3wrZmk78uipQQWS0G3LEzZ0F3Dgd/U=;
        b=ZuRXbasZ5H9moMDXVWacCx/5Z4igQvIgt01rDgxTxCIESZSmVw1KAGYQ+Jk2j6frfh
         UP3CcvjfTtfh/GzjJyPPbBf+EAwx0AQnG8rqhtgrJRtD9pXMJvFjX7Kw17bgI0Api4a1
         +Invk9ZN3Q9spOgDJDLQlBZ5OGyn7KNDvWL8qtSBNAmnGOLA0LuNhTxI/8sijolczbeP
         XrzJNbmMW70tM3NqYC+73gd1OCG/+z+PNE0EFeXU5g1IE8FAJpDDftNQRfg3VnfXyvnx
         X7NPyCZXvPz5/XaaWFAzK0hNPiVJh8WnATjpgK3PzPajCv2H9pN+1UBIH9j+7NnFThPy
         0q6Q==
X-Gm-Message-State: AOAM530dRmsA82WdlbwKbPXCe5QaP3zUIYp4S8YqC8nQ5eskxrFYdBYg
        9CrgnAwxL7TD59o5+y9zeGVSePx32zFGpFIBhHs=
X-Google-Smtp-Source: ABdhPJwWoVUeS4X9JOjdrnx4Ap+phImEIiTzRGwLP5R7zQh4ra0gphXJu3YCyKiDLAJgGFxYKrDoA1WvmtLqwKPS00Y=
X-Received: by 2002:a05:6e02:e10:: with SMTP id a16mr16254401ilk.204.1596044954472;
 Wed, 29 Jul 2020 10:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org> <20200729160942.28867-4-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-4-krzk@kernel.org>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Wed, 29 Jul 2020 19:49:02 +0200
Message-ID: <CA+Ln22HWNSwVWARKL2NeUVx1y5yqHe0SGPZ1hcqBW88awySfPA@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: s3c: Remove plat-samsung/.../samsung-time.h
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
> Remove the arch/arm/plat-samsung/include/plat/samsung-time.h header and
> move the contents to common.h headers in mach-s3c24xx and mach-s3c64xx.
> The definition of declared functions is already in common.c in mach
> directories, so it is logically to put declaration next to them.
>
> This is also one step further towards removal of plat-samsung directory
> and it fixes W=3D1 build warnings:
>
>     arch/arm/mach-s3c64xx/common.c:174:13: warning:
>         no previous prototype for 'samsung_set_timer_source' [-Wmissing-p=
rototypes]
>       174 | void __init samsung_set_timer_source(unsigned int event, unsi=
gned int source)
>
>     arch/arm/mach-s3c64xx/common.c:180:13: warning:
>         no previous prototype for 'samsung_timer_init' [-Wmissing-prototy=
pes]
>       180 | void __init samsung_timer_init(void)
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-s3c24xx/common.h                | 12 +++++++++
>  arch/arm/mach-s3c24xx/mach-amlm5900.c         |  2 --
>  arch/arm/mach-s3c24xx/mach-anubis.c           |  1 -
>  arch/arm/mach-s3c24xx/mach-at2440evb.c        |  1 -
>  arch/arm/mach-s3c24xx/mach-bast.c             |  1 -
>  arch/arm/mach-s3c24xx/mach-gta02.c            |  1 -
>  arch/arm/mach-s3c24xx/mach-h1940.c            |  1 -
>  arch/arm/mach-s3c24xx/mach-jive.c             |  1 -
>  arch/arm/mach-s3c24xx/mach-mini2440.c         |  1 -
>  arch/arm/mach-s3c24xx/mach-n30.c              |  1 -
>  arch/arm/mach-s3c24xx/mach-nexcoder.c         |  1 -
>  arch/arm/mach-s3c24xx/mach-osiris.c           |  1 -
>  arch/arm/mach-s3c24xx/mach-otom.c             |  1 -
>  arch/arm/mach-s3c24xx/mach-qt2410.c           |  1 -
>  arch/arm/mach-s3c24xx/mach-rx1950.c           |  1 -
>  arch/arm/mach-s3c24xx/mach-rx3715.c           |  1 -
>  arch/arm/mach-s3c24xx/mach-smdk2410.c         |  1 -
>  arch/arm/mach-s3c24xx/mach-smdk2413.c         |  1 -
>  arch/arm/mach-s3c24xx/mach-smdk2416.c         |  1 -
>  arch/arm/mach-s3c24xx/mach-smdk2440.c         |  1 -
>  arch/arm/mach-s3c24xx/mach-smdk2443.c         |  1 -
>  arch/arm/mach-s3c24xx/mach-tct_hammer.c       |  1 -
>  arch/arm/mach-s3c24xx/mach-vr1000.c           |  1 -
>  arch/arm/mach-s3c24xx/mach-vstms.c            |  1 -
>  arch/arm/mach-s3c64xx/common.h                | 13 ++++++++++
>  arch/arm/mach-s3c64xx/mach-anw6410.c          |  1 -
>  arch/arm/mach-s3c64xx/mach-crag6410.c         |  1 -
>  arch/arm/mach-s3c64xx/mach-hmt.c              |  1 -
>  arch/arm/mach-s3c64xx/mach-mini6410.c         |  1 -
>  arch/arm/mach-s3c64xx/mach-ncp.c              |  1 -
>  arch/arm/mach-s3c64xx/mach-real6410.c         |  1 -
>  arch/arm/mach-s3c64xx/mach-smartq.c           |  1 -
>  arch/arm/mach-s3c64xx/mach-smartq5.c          |  1 -
>  arch/arm/mach-s3c64xx/mach-smartq7.c          |  1 -
>  arch/arm/mach-s3c64xx/mach-smdk6400.c         |  1 -
>  arch/arm/mach-s3c64xx/mach-smdk6410.c         |  1 -
>  .../plat-samsung/include/plat/samsung-time.h  | 26 -------------------
>  37 files changed, 25 insertions(+), 61 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
>

For the s3c64xx bits:

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

I suppose the next step would be renaming those functions to s3c24xx_*
and s3c64xx_* to avoid naming collisions?

Best regards,
Tomasz
