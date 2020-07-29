Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6CD232604
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 22:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgG2UPg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 16:15:36 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:34641 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgG2UPg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 16:15:36 -0400
Received: by mail-ej1-f66.google.com with SMTP id y10so25678785eje.1;
        Wed, 29 Jul 2020 13:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ouwd0qsnQ1Adj/+zRaVzdVpCm+8h05KMUp30fVnhcA8=;
        b=WCCGLGBn4hHDnNsd2nRwgnhe8aAXRQj2ynpVy+i38o8UZn2udLkh/grnd0yeaMMFq2
         hN9//4RPCYOySl5MB0sUD+1zZYq6zoTZgn0oaNitKEt6phlMgE2sSht0YgvuTuN2+0V3
         iWt4WNRSV2bj38c1BKskGUnocTJFBqAQoPLb9DG9lP3kDeIwWtFtmAj4//bJCHSn0PmC
         tupufDmoGcV77qM5nmhsr0WSat+Slkq302m3eTt7unuTjqblhHkwVYxBdQwC4IyJFifK
         ebXPIxDA7lR/QFtHMJUkZU2RL8XcAgm22K2XtYXLfoP6ruarohb07siTIW9f+sabvRIG
         A9Kg==
X-Gm-Message-State: AOAM531lUqBVwShDkv/n/9QUfBWr2XpPEVtExrQT4TSTC47TOWioYVGx
        basX4GuFDommhUxpiM4p7Yo=
X-Google-Smtp-Source: ABdhPJwzrwf3LW20eQQQ23yUjSgwrzDTiF8v8xCprZhLNGtK2AACk3VnEMiEQ8SoXRyfDGmBo2eFdQ==
X-Received: by 2002:a17:906:5013:: with SMTP id s19mr96306ejj.26.1596053734270;
        Wed, 29 Jul 2020 13:15:34 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id qc23sm2624999ejb.97.2020.07.29.13.15.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 13:15:33 -0700 (PDT)
Date:   Wed, 29 Jul 2020 22:15:30 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Vincent Sanders <vince@simtec.co.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com,
        linux-clk <linux-clk@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: Re: [PATCH 0/7] ARM: samsung: Cleanup of various S3C bits
Message-ID: <20200729201530.GA26917@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <CAK8P3a38VC5UD+1HHRFWnafM7ZLMc34Ay23FUCjjgiz46SCV=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a38VC5UD+1HHRFWnafM7ZLMc34Ay23FUCjjgiz46SCV=A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 29, 2020 at 10:01:26PM +0200, Arnd Bergmann wrote:
> On Wed, Jul 29, 2020 at 6:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Hi,
> >
> > I tried to cleanup few warnings in S3C machine code which lead to
> > finding some bigger issues.
> >
> > Patches touch mostly the ARM Samsung machine code except patch #1 (clk)
> > and #5 (watchdog).  They are independent from each other, except
> > some conflicting lines.
> >
> > The last three patches would welcome some testing... as I did not
> > perform such (lack of S3C hardware).
> 
> I have an older series that I mean to repost. Please have a look at
> the s3c-multiplatform branch of
> git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
> 
> The patches in there need to be rebased on a newer kernel, which
> should be easy, but they will conflict with your work. If there is
> anything in there you can easily pick up into your series, please
> do so.

Indeed now I remember you were doing it some time ago but a follow up
never happened.  I can take a look and either cherry pick or even take
over the series.

Best regards,
Krzysztof

