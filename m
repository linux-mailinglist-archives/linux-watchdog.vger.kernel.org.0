Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C419B23DFA5
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Aug 2020 19:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgHFRv2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Aug 2020 13:51:28 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33177 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbgHFQc2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Aug 2020 12:32:28 -0400
Received: by mail-ed1-f66.google.com with SMTP id v22so24821182edy.0;
        Thu, 06 Aug 2020 09:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wxM29TwDHDOi09iTaSOPQGfSxUGOXNj7j2gjsd4TQfE=;
        b=Iie02rSjkF6kJTVc3QaZpQ9taKhXiFBoRtRWBam4aDGmgMAd69EcXHcgiL7Tm1lAPz
         q6dZfmW9uxPZGgOvYItWNvKyPAMxLRlgjlT+uN3h+liOpxVCsRaga6x21CeKFVOAA163
         wFEexW7xhYqghKpEFAPUH8bFERcuqAJYVKSfOehLfoB75SdsJvxxnwgql3SG7kMGoe21
         tjdZKlr2EJxAvvnu/YCpnWRWjATzy18bevUlSuim2GQGzmmoyGZCnm/aum16z1k0RaEO
         Xb9JH8LFIgWpq4jomU1L8NmiyPfR3qEgCDydtxK0KjYzS4wJUA8L3fTlmqTytcwdcO+0
         j8zQ==
X-Gm-Message-State: AOAM530vQNf57Y649jGwOCpRg2JWDmFLHa2vLEMEF20zStPsBiwthOTJ
        gBJat8KqIsoicZFOy9G9xnaIn5MG5Hc=
X-Google-Smtp-Source: ABdhPJyUQGyc1Q+OrLmSrAWCBHqXKmBIT46iWjNVnHFun64JY2oBRGkx7MPtpucz/RGYqbRu580iKw==
X-Received: by 2002:a5d:4407:: with SMTP id z7mr7057870wrq.404.1596716175808;
        Thu, 06 Aug 2020 05:16:15 -0700 (PDT)
Received: from pi3 ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id e4sm6307243wru.55.2020.08.06.05.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 05:16:14 -0700 (PDT)
Date:   Thu, 6 Aug 2020 14:16:12 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lihua Yao <ylhuajnu@outlook.com>
Cc:     Russell King <linux@armlinux.org.uk>,
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
        linux-watchdog@vger.kernel.org,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>
Subject: Re: [PATCH v2 00/13] clk/watchdog/ARM: Cleanup of various S3C bits
Message-ID: <20200806121612.GA7617@pi3>
References: <20200804192654.12783-1-krzk@kernel.org>
 <BY5PR13MB30639E16691A4A601A1D7070C44B0@BY5PR13MB3063.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <BY5PR13MB30639E16691A4A601A1D7070C44B0@BY5PR13MB3063.namprd13.prod.outlook.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 05, 2020 at 04:18:32PM +0800, Lihua Yao wrote:
> Hi Krzysztof，
> 
> On 5/8/2020 3:26 am, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > I tried to cleanup few warnings in S3C machine code which lead to
> > finding some bigger issues.
> >
> > The patchset touches clk and watchdog trees. I would appreciate acks so
> > I can take everything through Samsung SoC tree. I have later a bigger
> > set which would create conflicts with it [1].
> >
> >
> > Changes since v1:
> > 1. Few new patches,
> > 2. Addressed review around clk and watchdog changes (see change logs in
> >    individual patches).
> >
> >
> > [1] v2 of Arnd's work for making S3C24xx multiplatform:
> > https://github.com/krzk/linux/tree/for-next/s3c-multiplatform-cleanup-w1-warnings-v2
> I gave a build and boot test. My TINY6410 board still works!
> Actually I had did the same test for Arnd's branch with linux v5.5
> and it works too!

Great! Thanks for testing.

Best regards,
Krzysztof

