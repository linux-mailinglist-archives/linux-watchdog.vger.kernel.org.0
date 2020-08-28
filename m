Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83ABA255F70
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 19:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgH1RJJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 13:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgH1RJI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 13:09:08 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743F2C061232
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Aug 2020 10:09:08 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l191so731305pgd.5
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Aug 2020 10:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fvMiQMV52wKOEkTpGVSpB7X3SeoYo75JG5xPWkqYPi4=;
        b=CbRzY0Ca9hAnhGk6G1j7ey29t2XvK1sOOy2Rcmz7dHBdKIc4c3Dvd2fWXjb0Khc7jV
         uRubCZ0L9ewUygrw1nKYy3PPkXxRQ529G8wAeoJpB1pM5hNBfT7W7h+3T5Tybm73nr/2
         5jpFJSM7e+y+Cqvk1sel99tJ0Cq9drgZPRzvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fvMiQMV52wKOEkTpGVSpB7X3SeoYo75JG5xPWkqYPi4=;
        b=RZiIlilYmLTYGqOXd6qywsuV6kEvcYVdYOTj+6XWVDj4iLFoX4lpx3tDu/l84BoDLh
         cgP+zHFImZOnaa9GnOhZ/brfVMeQmq+xemVsaRpDkzvsHoyYL6HyrQwLJS/j3hiVXF+F
         r5FQxvXYztIXVoedChz6O6shb7sidNwp/N/6MCd8xC+cvJXobMRo5Qmxa3Lyg2xpLPxV
         Pzx2WCOGteZar/1O+IvFIz05iUAnZYFEyB2hYDfQV3mu0D/eRMqf7dq8xsDdl6QmqyaT
         +dgHxDOJiehZuedE3nP8VcQ9kz+KMwRGMmaf853armDAUlGb9rU3g8HDopea8b1apLM8
         tTUQ==
X-Gm-Message-State: AOAM5304BdFJ0L1zosQuA811b4IwDHin88tYSlEo5wiJcZzqy3vEJsJB
        pC8/cYd1PinIS5k7DoGlMtu+IQ==
X-Google-Smtp-Source: ABdhPJwxPSoNbou2DAEM+RiHTsFFGyTTNhIxXlmLEPikNxiq1HWpxuzAkInPzqbu3rd5ZyqN8tpg5A==
X-Received: by 2002:a62:3583:: with SMTP id c125mr2028913pfa.1.1598634547231;
        Fri, 28 Aug 2020 10:09:07 -0700 (PDT)
Received: from [10.136.8.253] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id f18sm25318pgv.84.2020.08.28.10.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 10:09:06 -0700 (PDT)
Subject: Re: [PATCH 08/10] ARM: dts: Cygnus: Fix SP805 clocks
To:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <20200828130602.42203-1-andre.przywara@arm.com>
 <20200828130602.42203-9-andre.przywara@arm.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <0525ead5-ae53-e047-97fa-ac245846d605@broadcom.com>
Date:   Fri, 28 Aug 2020 10:09:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828130602.42203-9-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 8/28/2020 6:06 AM, Andre Przywara wrote:
> The SP805 DT binding requires two clocks to be specified, but the
> Broadcom Cygnus DT currently only specifies one clock.
> 
> In practice, Linux would pick a clock named "apb_pclk" for the bus
> clock, and the Linux and U-Boot SP805 driver would use the first clock
> to derive the actual watchdog counter frequency.
> 
> Since currently both are the very same clock, we can just double the
> clock reference, and add the correct clock-names, to match the binding.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/bcm-cygnus.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
> index 35bdd0969f0a..dacaef2c14ca 100644
> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
> @@ -234,8 +234,8 @@
>  			compatible = "arm,sp805" , "arm,primecell";
>  			reg = <0x18009000 0x1000>;
>  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&axi81_clk>;
> -			clock-names = "apb_pclk";
> +			clocks = <&axi81_clk>, <&axi81_clk>;
> +			clock-names = "wdog_clk", "apb_pclk";
>  		};
>  
>  		gpio_ccm: gpio@1800a000 {
> 

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
