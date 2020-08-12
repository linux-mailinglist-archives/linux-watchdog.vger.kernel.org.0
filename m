Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6554524266D
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 09:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgHLH5J (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 03:57:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:37460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgHLH5H (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 03:57:07 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 337FF206B2;
        Wed, 12 Aug 2020 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597219027;
        bh=tyXmsvrm0Da55C+UKk25Av4LOuZ0ELKK1/IGS0pFcns=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0MYa+c6HTbguXG56M12pgmwH/XlpMlZpbNLLN/qXwbbQuFXWvC1iZ1mGHxwhpwN3h
         nSnSMWoqGKor9xoqqgbMW1bzpyVss/jKG+FW+ZsKcjjM6Y1lldl2DXnMFoUb8K3lMW
         CUoU4yU2EX5I5cHAQJWFA5AZg7W97T69JFzgYEq8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200804192654.12783-2-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org> <20200804192654.12783-2-krzk@kernel.org>
Subject: Re: [PATCH v2 01/13] clk: samsung: s3c64xx: declare s3c64xx_clk_init() in shared header
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
Date:   Wed, 12 Aug 2020 00:57:06 -0700
Message-ID: <159721902609.33733.3673741521313105196@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-08-04 12:26:42)
> The s3c64xx_clk_init() is defined and used by the clk-s3c64xx driver and
> also used in the mach-s3c64xx machine code.  Move the declaration to a
> header to fix W=3D1 build warning:
>=20
>     drivers/clk/samsung/clk-s3c64xx.c:391:13: warning: no previous protot=
ype for 's3c64xx_clk_init' [-Wmissing-prototypes]
>       391 | void __init s3c64xx_clk_init(struct device_node *np, unsigned=
 long xtal_f,
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
>=20
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
