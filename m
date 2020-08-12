Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1469624267D
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 09:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgHLH7g (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 03:59:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:38466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgHLH7f (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 03:59:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70BC1206B5;
        Wed, 12 Aug 2020 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597219175;
        bh=2RVi0D02jynn0p6bTNjO1y53JcI46pZTDa3hdIrdGRU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WvaHRSRcEls0qNPsEW91OJCAhQYwOYUvsuPFUefwVJarK5lbkanhw0oDP5fEvVZ3R
         KmidoSAeqi9QgpOPRJlmz9Loj+WSXywqrDC83rtub8hXhP+yOMySrO+GCCr2nee4GG
         Sd6V3ENtxYxNTcy5/AjbPR/zCRDTo+qvtSYrrCtw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200804192654.12783-14-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org> <20200804192654.12783-14-krzk@kernel.org>
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with prototypes and unify declaration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-watchdog@vger.kernel.org, patches@opensource.cirrus.com
Date:   Wed, 12 Aug 2020 00:59:34 -0700
Message-ID: <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-08-04 12:26:54)
> The s3c_camif_gpio_put() declaration in
> include/media/drv-intf/s3c_camif.h header was different than definition.
> Fixing this allows to include that header to also fix the W=3D1 compile
> warnings:
>=20
>     arch/arm/mach-s3c24xx/setup-camif.c:28:5: warning: no previous protot=
ype for 's3c_camif_gpio_get' [-Wmissing-prototypes]
>        28 | int s3c_camif_gpio_get(void)
>     arch/arm/mach-s3c24xx/setup-camif.c:56:6: warning: no previous protot=
ype for 's3c_camif_gpio_put' [-Wmissing-prototypes]
>        56 | void s3c_camif_gpio_put(void)

Maybe it should have been void all along?
