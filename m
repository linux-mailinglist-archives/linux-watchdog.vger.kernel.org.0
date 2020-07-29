Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7457123260A
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 22:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgG2UQm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 16:16:42 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:41033 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgG2UQm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 16:16:42 -0400
Received: by mail-ej1-f67.google.com with SMTP id w9so25622030ejc.8;
        Wed, 29 Jul 2020 13:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G9J40aLhPUBHarAksyHrJM+WbtR3gRhMvbXXJTyIEsw=;
        b=k2GVsKVFsPbSoZjpQ3yHGuN2nXG3JuzUeQS7q3rJbgD8wQ3i4YS9KDvXh493xZ1163
         PCH/5gcPzeFR8WzXsUt6l2320LsIG14JQeSuv3dLC+gdwrZBomBsKhFXVyPc/sdfxJSL
         jxVpsVBjPuSFkybl+r+EkcU+pPgKfe4Hu9EwkzghJQGdIr7uPwaaBkJuAXOAu9xgcobS
         FzBsSUyUacvrAsYzhgfS06VdcRIBY1CTNMSelLQNy5sMDBcsbE750/GjICDAIzztoRDy
         rvITvxUzH7lerEzbP78/kaBtzXszVmFzn7kQdiSA2e+6pLgrJnoC+QqMWC9xGsbBINi8
         MX/Q==
X-Gm-Message-State: AOAM531HQspdPQmKdwXRXrtihdzC1rOoTyjQmb6u41EbhI48M8ZFFVaK
        Z0EvW5gM2LuP/3wUtw/aU/k=
X-Google-Smtp-Source: ABdhPJz8NSZ1YgCRCp5BY64q7jD+PPCB1uyy1HQKw9M5f39sg32SzCcRfdGo1BmuaDhYo5fGcHeBew==
X-Received: by 2002:a17:906:78e:: with SMTP id l14mr80328ejc.67.1596053799753;
        Wed, 29 Jul 2020 13:16:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id a23sm2669500eju.68.2020.07.29.13.16.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 13:16:39 -0700 (PDT)
Date:   Wed, 29 Jul 2020 22:16:35 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Vincent Sanders <vince@simtec.co.uk>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-watchdog@vger.kernel.org, patches@opensource.cirrus.com,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: Re: [PATCH 1/7] clk: samsung: s3c64xx: Declare s3c64xx_clk_init() in
 shared header
Message-ID: <20200729201635.GB26917@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-2-krzk@kernel.org>
 <159605176358.1360974.7715120460121088439@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <159605176358.1360974.7715120460121088439@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 29, 2020 at 12:42:43PM -0700, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-07-29 09:09:36)
> > diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
> > new file mode 100644
> > index 000000000000..b6b253c46c22
> > --- /dev/null
> > +++ b/include/linux/clk/samsung.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
> > + */
> > +
> > +#ifndef __LINUX_CLK_SAMSUNG_H_
> > +#define __LINUX_CLK_SAMSUNG_H_
> > +
> > +#ifdef CONFIG_ARCH_S3C64XX
> > +void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
> 
> Don't use __init in header files. It doesn't do anything.
> 
> > +                            unsigned long xusbxti_f, bool s3c6400,
> > +                            void __iomem *base);
> > +#else
> > +static inline void __init s3c64xx_clk_init(struct device_node *np,
> 
> Forward declare struct device_node;
> 
> > +                                          unsigned long xtal_f,
> > +                                          unsigned long xusbxti_f,
> > +                                          bool s3c6400,
> > +                                          void __iomem *base) { }
> 
> Include <linux/compiler.h> (or compiler_types.h) for __iomem define
> please.

Thanks for the feedback. I'll send v2.

Best regards,
Krzysztof

