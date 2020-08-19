Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A63C24A5C0
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Aug 2020 20:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHSSQe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Aug 2020 14:16:34 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:36900 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgHSSQ3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Aug 2020 14:16:29 -0400
Received: by mail-ej1-f68.google.com with SMTP id qc22so27429339ejb.4;
        Wed, 19 Aug 2020 11:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t3qsgE3nJwNaWUKRuhBUBlsZ1BJmez2mj7vmp2zbCgY=;
        b=Tnlj1unBauggwSlix70f6vUjhUdPBQurt+KOWCLPYbMhjWMOU3JgapxH/J7Q5F83aH
         4wyVyqm3s6E830ylmawbZ8hAnwGKLQ6GIqFDMUrAKT9Dmz0f3/oZqM2KHuSE2m4cGme2
         4u9r8F82WpnY72uJNvWbog33acySLCunQPdYHxU1tKiXVOxVsLb5kaxEM5DGa8krmjMf
         zB/874ApOtviZy3ZGQYwrxSfPrjQD8OKGAIL4HS605W3sJcjVetSYMG/pxzJSBcsKj6Z
         8Q02KRppgs1dOLREeVe/N1/eTU1pCrC30gu/H76ZkJROpBte3yKE222ts5V9wf4IxRpD
         Q29A==
X-Gm-Message-State: AOAM531T6t375gWm9oDMaW1zskRmi+juImDvW0yNqLkX3tMYDMfH56J4
        1tkfxbDPcFJVvI3tElvfKP0=
X-Google-Smtp-Source: ABdhPJzOcN1GZKTtRnWkWtwfjQiD9o87+S+tpPQkggCUttDLUkxuxmb4YmLExAOC3PinRJdWfsIbkw==
X-Received: by 2002:a17:906:e17:: with SMTP id l23mr25676842eji.13.1597860987481;
        Wed, 19 Aug 2020 11:16:27 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id gh25sm18892391ejb.109.2020.08.19.11.16.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 11:16:26 -0700 (PDT)
Date:   Wed, 19 Aug 2020 20:16:23 +0200
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
Subject: Re: [PATCH v2 06/13] ARM: samsung: remove HAVE_S3C2410_WATCHDOG and
 use direct dependencies
Message-ID: <20200819181623.GA21298@kozik-lap>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200804192654.12783-7-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 04, 2020 at 09:26:47PM +0200, Krzysztof Kozlowski wrote:
> A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs is not
> really needed and the s3c24xx watchdog driver can depend on Samsung ARM
> architectures instead.
> 
> The "HAVE_xxx_WATCHDOG" pattern of dependency is not popular and Samsung
> platforms are here exceptions.  All others just depend on
> CONFIG_ARCH_xxx.
> 
> This makes the code slightly smaller without any change in
> functionality.
> 

Applied.

Best regards,
Krzysztof

