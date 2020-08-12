Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D11242DE0
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 19:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbgHLRNf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 13:13:35 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33050 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgHLRNf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 13:13:35 -0400
Received: by mail-ed1-f66.google.com with SMTP id v22so2123870edy.0;
        Wed, 12 Aug 2020 10:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MT1HlMJVel4NfjLeoguo3S82lKmyadBedQuGtY3rkqk=;
        b=TfnCt8i46ssK+my+himX+2+Tux9PbfF5q6UvtbkAYYfII09bJB39WAz3TRXJ2D17au
         oT769zYqfbgbDLRFpa1Sh1/qY0Ni3xqTG5ipCP2oaWR1qftCOCCTAE9BMBfvQgOQAUpo
         Z4MAk5drl2VVDv6EH53M91CZ4J7jMhsd6IdXC0C8mcvJtsQ30P3UGLvoft97c2zsQknM
         rBfLddvN/XjTeQxOpogTtQflQZBpAmKeODc6y/mROOkwg98R65FFcfLpFeo+J9NHGPh7
         irtqtqhNqwBg4Yo+xeSMvYXGa2/fpbFOc2cgzpr6s1a2TrrmQM8QQ9w4vWfCyz7molfv
         dJng==
X-Gm-Message-State: AOAM5318bYz8jZQ2v+LXzBl1EAv66vj7curb0EddonzJ5hXtFVYAoYOC
        OvVfdUOdtIpNO1NwhSPQezQq3Dbivgg=
X-Google-Smtp-Source: ABdhPJxHwROrd0TssNGyu5e5q3y0vfIOw6f27KQllbOmg3rLagqeBRyVqwp6k+Jy2UBlAMcA2OF4Tw==
X-Received: by 2002:a05:6402:c84:: with SMTP id cm4mr920950edb.20.1597252412911;
        Wed, 12 Aug 2020 10:13:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id b20sm1821329eds.7.2020.08.12.10.13.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Aug 2020 10:13:32 -0700 (PDT)
Date:   Wed, 12 Aug 2020 19:13:29 +0200
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
Message-ID: <20200812171329.GA3420@kozik-lap>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
 <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
 <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
 <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
 <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
 <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com>
 <20200812133109.GA15697@pi3>
 <828b3dd5-31f0-0414-e6ea-7629b063e8ce@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <828b3dd5-31f0-0414-e6ea-7629b063e8ce@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 12, 2020 at 05:58:52PM +0200, Sylwester Nawrocki wrote:
> On 12.08.2020 15:31, Krzysztof Kozlowski wrote:
> > On Wed, Aug 12, 2020 at 03:11:41PM +0200, Sylwester Nawrocki wrote:
> >> On 12.08.2020 13:28, Arnd Bergmann wrote:
> >>> On Wed, Aug 12, 2020 at 12:46 PM Sylwester Nawrocki
> >>> <s.nawrocki@samsung.com> wrote:
> >>>> On 12.08.2020 11:14, Arnd Bergmann wrote:
> 
> >>> I see two board files (and no DT) instantiate the camif device:
> >>> NexVision Nexcoder 2440 and the FriendlyARM mini2440.
> >>>
> >>> Can you say whether the camif on those would actually work
> >>> at all without your patch? If not, we know that there are no
> >>> users of that driver and could either drop it completely or move
> >>> it to staging for a release or two.
> >>
> >> Without additional patches the camif will not work, the driver 
> >> needs an instance of struct s3c_camif_plat_data which specifies
> >> what image sensor is attached.
> >>
> >> I think we can drop the driver, together with the s3c_camif_device
> >> platform device definitions. It can always be added again if anyone
> >> ever needs it or converts the platform to DT.
> > 
> > Since the header was in /include/media I assumed there might be some
> > user-space tools using it. But if it is not the case, I'll drop the code
> > then.
> 
> That's a kernel internal header, only for board files, it should really 
> have been added to include/linux/platform_data.
>   
> >> IMO all non-DT code in arch/arm/mach-s3c24xx is a candidate for
> >> removal, it just adds to the maintenance effort and I seriously
> >> doubt there are now any users of it.
> > 
> > That is quite tricky... I really do not know whether there are any real
> > world users of S3C24xx and S3C64xx platforms. Evalkits are mostly not
> > available for buying so I do not expect new designs. However still
> > existing ones might be somewhere... Few years ago, back in Samsung, I
> > mentioned removing them. That time I think Marek or you Sylwester, said
> > that there are industrial applications using S3C24xx. I believe, why
> > not. The trouble is - how to find such users? How to get in touch for
> > testing or at least for bug reports if something is broken?
> 
> I believe if there any such applications of the S3C24XX SoCs still existing 
> somewhere their long term support doesn't include updating to new kernels. 
> I used to keep a running S3C2440 SoC based board just for the purpose of
> testing patches touching the common code, but I stopped it, I think it is
> not worth to waste time and health on it any more. For example support for 
> the OSELAS.BSP-Pengutronix-Mini2440 BSP I used for tests ended 5 years ago
> [1].
> 
> > Or even more important - is it worth to spend effort and time on this?
> > If there is no single production system using recent Linux kernel, the
> > answer should be negative...
> 
> I suspect nobody cares about that code (non-DT s3c24xx) any more for other
> than sentimental reasons.

I'll start then with S3C camif driver. :) I guess
drivers/media/platform/s3c-camif/ still should be left?

Best regards,
Krzysztof

