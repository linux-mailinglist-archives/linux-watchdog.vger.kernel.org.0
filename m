Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF34E24A5CC
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Aug 2020 20:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgHSSRo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Aug 2020 14:17:44 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:34268 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHSSRn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Aug 2020 14:17:43 -0400
Received: by mail-ej1-f68.google.com with SMTP id o23so27458564ejr.1;
        Wed, 19 Aug 2020 11:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yl0aiKpy9oU+yX24bKO0Wi0FwOjbsT5HEwJCqJSSr0E=;
        b=ZioiGYFi+VQXtE2WYt0NrrHBVlMvkFgXwe6a3LgTKenelZIGR/32Vz6VpMctpPIZZf
         2mgLd5ka8V2m17ticNnkSDNfXt9/MA0Za4hhnDhHSxOubIh4L6z9CjLGwR5MTB2Nl0/S
         4YNA0VSykpsze0Qqu/CQjbm2sm+OtBbIWsO9lERkKDNbloSZd53NfH7wxi24VxdopjOR
         gbv98nAEfZtWr1i3y6BB8wQHEAL/GTAc4U4YtM2AOfQsoldZW/9Rb1xHt+8RcxCZBjew
         6vnta2xVgqXJBtyjZe2KqQuc/Y0AIwzF6XtAk/hj93CHFk+tFMK610oKias0LTfBmdkc
         fZgg==
X-Gm-Message-State: AOAM532BU3fiwFxbk1I8UbH7deRG0RUKZxMYRIYqyFJZutqQnGfbcPYH
        9ADMVyszP8mivT/T7WvLpow=
X-Google-Smtp-Source: ABdhPJwPrp0tgwpB1iLAmKOegFv4OOS/OWlgOOvq+s6N718YJm5HdBzWfJk3O7jPqez5lMwHUAJGLw==
X-Received: by 2002:a17:907:20f5:: with SMTP id rh21mr26001104ejb.194.1597861061058;
        Wed, 19 Aug 2020 11:17:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id b20sm18281130eds.7.2020.08.19.11.17.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 11:17:40 -0700 (PDT)
Date:   Wed, 19 Aug 2020 20:17:36 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
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
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: Re: [PATCH v2 07/13] ARM: s3c64xx: switch to generic watchdog driver
 reset
Message-ID: <20200819181736.GB21298@kozik-lap>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200804192654.12783-8-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 04, 2020 at 09:26:48PM +0200, Krzysztof Kozlowski wrote:
> Similarly to commit f6361c6b3880 ("ARM: S3C24XX: remove separate restart
> code"), the platform watchdog reset code can be removed in favor of
> a generic watchdog driver which already handles reset.
> 
> This allows removal of a bunch of machine code and fixes also W=1
> compile warnings:
> 
>     arch/arm/plat-samsung/watchdog-reset.c:29:6: warning: no previous prototype for 'samsung_wdt_reset' [-Wmissing-prototypes]
>        29 | void samsung_wdt_reset(void)
>     arch/arm/plat-samsung/watchdog-reset.c:69:13: warning: no previous prototype for 'samsung_wdt_reset_of_init' [-Wmissing-prototypes]
>        69 | void __init samsung_wdt_reset_of_init(void)
>     arch/arm/plat-samsung/watchdog-reset.c:89:13: warning: no previous prototype for 'samsung_wdt_reset_init' [-Wmissing-prototypes]
>        89 | void __init samsung_wdt_reset_init(void __iomem *base)
> 
> The generic watchdog-based system reset is not exactly the same as
> before.  The previous method had a fallback to soft_restart() which now
> is gone.
> 
> The commit also removes a FIXME note about calling s3c64xx_clk_init()
> inside s3c64xx_init_irq().  No one fixed this since long time and the
> note is not meaningful anymore because watchdog part is removed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Applied.

Best regards,
Krzysztof

