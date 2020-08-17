Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E87D246D84
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Aug 2020 19:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730108AbgHQRB0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Aug 2020 13:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730003AbgHQRBN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Aug 2020 13:01:13 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D920C061389;
        Mon, 17 Aug 2020 10:01:11 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id g19so18316221ioh.8;
        Mon, 17 Aug 2020 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7QBcITzR7oBFEugc9nX1hxSt40e3uHeGjBJ8k9Ii1wk=;
        b=fHgr2XhLG9zj5YkcLQCd22NWhIzfoaeu5QeDS+zuPzhgz6A9WrGtRdh1mQGvYcgzgH
         6fj9TEyhln/WsR5x6BeC/423hYjuYZ9wlMXn5FPXN6T07cqvK8Y0oPlHotB2Gh5KOdJT
         LJif1UzKeOQupsxHtrzDH/KPmIbvLLTsQG6KiVJJ3NvgHwx1pmdFar1M/FHW0UasC8Ll
         R6VPhg+9IY93n8I8ad7FHyBc+B1u5jept/EHHoEy+14aujf43pE8VBOGQoTiOWPAvjEb
         WdQW5G6QLx6h4Ma3swlKqupxWiwrjKAcA1iKiIuVFJMfGb0ZdOml/F6Vl6D2fImHN7d0
         gJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7QBcITzR7oBFEugc9nX1hxSt40e3uHeGjBJ8k9Ii1wk=;
        b=fMWw829erfdWc35n5lKmlLLiIh+9HmNE0hB41ezzkPTMFGq6g+qSR7mFqY5/MIMddl
         5ODHUeaBkz3PtE+NBtBBHbi0a2E4TBMZin4QWu1iuI1AlnYpNm546DDhKaq5FPwStpte
         HIXUuPNUvvny0duPb7L9gB8/V6wRjFOG0bt3izbF2x/2vallDC4vh3ncRb5H/UpphGL/
         ZYfU8bEIDhmjWT+pkleAjy+xrJadkmPGvjS2CwIewhShllbqYwuJTfVGZV2fMonyYYuw
         9zYAGo2mQiduADRfYKfq4WFaPI+tcG+3LnxFdxeeAVUkdxCxY7QtJ5t6yliIlaj8fwac
         qlNQ==
X-Gm-Message-State: AOAM533gSSOdGpkkFLrZ6P7QYFJJfyB+B0uX7AeAsatiXMpdviaDGjeM
        sxC1uD0pX/E3CYCKHN0MGSWceRJTL9Z/fJ+6wtvHBkx6
X-Google-Smtp-Source: ABdhPJyXrGoxJReNPAI+1RpBbwcrrU2PnQSgVLTs6ychSyck01qgTlPaYHYMzi+J5YyRvm1QP4hn4zCwUZeN4+VdjeU=
X-Received: by 2002:a02:95ae:: with SMTP id b43mr15158386jai.19.1597683670733;
 Mon, 17 Aug 2020 10:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192654.12783-1-krzk@kernel.org> <20200804192654.12783-7-krzk@kernel.org>
 <20200817165748.GA29664@kozik-lap>
In-Reply-To: <20200817165748.GA29664@kozik-lap>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Mon, 17 Aug 2020 19:00:54 +0200
Message-ID: <CA+Ln22Hw8_FT0s2N0rBo=2XVmuLagj=BFrTkTGd10J7d4B1Jow@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] ARM: samsung: remove HAVE_S3C2410_WATCHDOG and
 use direct dependencies
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
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

2020=E5=B9=B48=E6=9C=8817=E6=97=A5(=E6=9C=88) 18:57 Krzysztof Kozlowski <kr=
zk@kernel.org>:
>
> On Tue, Aug 04, 2020 at 09:26:47PM +0200, Krzysztof Kozlowski wrote:
> > A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs is not
> > really needed and the s3c24xx watchdog driver can depend on Samsung ARM
> > architectures instead.
> >
> > The "HAVE_xxx_WATCHDOG" pattern of dependency is not popular and Samsun=
g
> > platforms are here exceptions.  All others just depend on
> > CONFIG_ARCH_xxx.
> >
> > This makes the code slightly smaller without any change in
> > functionality.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. Re-add the dependency on architectures to keep same functionality.
>
> Hi Guenter, Tomasz,
>
> Does such removal of HAVE_S3C2410_WATCHDOG makes sense for you?

I don't have any objections and the patch itself is trivial.

Best regards,
Tomasz
