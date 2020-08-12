Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735E8242A5C
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 15:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgHLNbY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 09:31:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33230 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgHLNbO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 09:31:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id f18so4257081wmc.0;
        Wed, 12 Aug 2020 06:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2HXl4QZEkZ4XHgTE5pAfXdvAM2LC9rDIm1qQF4lI0C0=;
        b=NE9r4QyVeCz+hcmDcz/t4Jt0vv0MmVRxfgK9NCk/dTc39U7ZHMrBSbyN8hkwl3Bm74
         JvEG+OFHRQQEsUiiMDIK0MCv7POBwy7mXTHEVFFSMvRL6KA+wyvnsqpmj9AjdbJadfpt
         AgIU6i36yb+2+TPM7qWpUobT0tetHMn/s5ZTxEtPz4N1kgmLbTyPfYOhe1rHIrlY4kkw
         RiTHYJiiHzlTzz9UTT5FN2cg48opVSMTU8n+ojKQUFNS8vw1Iuk8FAkUgkY/PBIDwV2V
         r0T37X7MqoZqAOuFLz17yVV1OY6Xl3uTlLJcutaSrtt2bTaDSW/keaMBUyHSF2/f9NiW
         tKvA==
X-Gm-Message-State: AOAM532DY2IRtCtft5YT8C+diKKcdL+7QQeTTT5nh5NnC1HjTW1h9Q2l
        KmMUVn29TPDtPGJFd6PE5gg=
X-Google-Smtp-Source: ABdhPJzHkyPlKfkamWjVagSZDYcuAe6tkz2hCu91pgFkTiYLa1dUV2thk5CA4SqwCpP9atHlIFXVNQ==
X-Received: by 2002:a1c:b6c4:: with SMTP id g187mr8035495wmf.149.1597239072753;
        Wed, 12 Aug 2020 06:31:12 -0700 (PDT)
Received: from pi3 ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id t13sm4154509wru.65.2020.08.12.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 06:31:12 -0700 (PDT)
Date:   Wed, 12 Aug 2020 15:31:09 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        patches@opensource.cirrus.com,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with
 prototypes and unify declaration
Message-ID: <20200812133109.GA15697@pi3>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
 <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
 <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
 <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
 <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
 <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 12, 2020 at 03:11:41PM +0200, Sylwester Nawrocki wrote:
> On 12.08.2020 13:28, Arnd Bergmann wrote:
> > On Wed, Aug 12, 2020 at 12:46 PM Sylwester Nawrocki
> > <s.nawrocki@samsung.com> wrote:
> >> On 12.08.2020 11:14, Arnd Bergmann wrote:
> >>>
> >>> It seems there have never been any callers and the entire file
> >>> can just be removed, with the rest of that platform_data header
> >>> file moved to drivers/media/platform/s3c-camif/.
> >>
> >> Yes, it seems that patch never made it to mainline:
> >> https://protect2.fireeye.com/v1/url?k=abe5f73a-f6293cfe-abe47c75-0cc47a314e9a-7fafe832d055d852&q=1&e=2596ffb6-c4cb-492a-8c6f-a0e261567842&u=https%3A%2F%2Fgit.linuxtv.org%2Fsnawrocki%2Fmedia.git%2Fcommit%2F%3Fh%3Dtesting%2Fs3c-camif%26id%3D355cbf835aff2aabf78390931cbbaa608af77967
> > 
> > I suppose it would still apply if anyone was interested, but I see your
> > point.
> > 
> >> I doubt there are still users of camera on the s3c2440 boards
> >> with current mainline kernels, if any at all, there are much
> >> better HW alternatives right now.
> > 
> > I see two board files (and no DT) instantiate the camif device:
> > NexVision Nexcoder 2440 and the FriendlyARM mini2440.
> > 
> > Can you say whether the camif on those would actually work
> > at all without your patch? If not, we know that there are no
> > users of that driver and could either drop it completely or move
> > it to staging for a release or two.
> 
> Without additional patches the camif will not work, the driver 
> needs an instance of struct s3c_camif_plat_data which specifies
> what image sensor is attached.
> 
> I think we can drop the driver, together with the s3c_camif_device
> platform device definitions. It can always be added again if anyone
> ever needs it or converts the platform to DT.

Since the header was in /include/media I assumed there might be some
user-space tools using it. But if it is not the case, I'll drop the code
then.

 
> IMO all non-DT code in arch/arm/mach-s3c24xx is a candidate for
> removal, it just adds to the maintenance effort and I seriously
> doubt there are now any users of it.

That is quite tricky... I really do not know whether there are any real
world users of S3C24xx and S3C64xx platforms. Evalkits are mostly not
available for buying so I do not expect new designs. However still
existing ones might be somewhere... Few years ago, back in Samsung, I
mentioned removing them. That time I think Marek or you Sylwester, said
that there are industrial applications using S3C24xx. I believe, why
not. The trouble is - how to find such users? How to get in touch for
testing or at least for bug reports if something is broken?

Or even more important - is it worth to spend effort and time on this?
If there is no single production system using recent Linux kernel, the
answer should be negative...

Best regards,
Krzysztof
