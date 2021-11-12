Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E6544EF8D
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Nov 2021 23:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbhKLWqQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Nov 2021 17:46:16 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:35716 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbhKLWqP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Nov 2021 17:46:15 -0500
Received: by mail-oi1-f173.google.com with SMTP id m6so20654966oim.2;
        Fri, 12 Nov 2021 14:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dCuD+YjqtVnRtkWIUOOxbHP+fcjNzXnTv5I+4RHdVB0=;
        b=ul1mq9zSpq5iHtigdIrTTCWqQikP+Zkfv7T5jbLbNDQ56hqydwmPKJTGBmSQM5iDhu
         fl+mdP0EeNPT7zR8QXh7pgWjm8MpgOlvT52T3goSpIEqHGZdlSevf05Y0IPq/E/7P7iX
         UDLOu6DKXdadzZRF4/k5OvBhOAh7UhKRrkxTUyvH6GOZ6Co1zWBvuqw15WM0HHK5XQJ6
         P/xGSUvoTZ5NKV/UboskVPRYf/XGARADQAyd65IeBj7B+pBY5ZwFLecMTou0XLG6jjdN
         ZIU9IUaD8WbmT1JPuiKU1NZcqi6970uKhETC24nRUFG9wGik5YlYWFwsUXZOneNg4utQ
         QM8w==
X-Gm-Message-State: AOAM532oddPnnad8aM7ISqnaIuLXH+92VTV+UqKYHtgLXRAph6tpHC1v
        Vu3k2BXI+8ap0vp8myWkqQ==
X-Google-Smtp-Source: ABdhPJw2PwOESQ+/jRCGL6gzFQuxnZMAfxJUgi0JcPErgF9CKwlxulleLUJxDTSFc3Lx1uAHlNMPBg==
X-Received: by 2002:a05:6808:228c:: with SMTP id bo12mr15539917oib.93.1636757004240;
        Fri, 12 Nov 2021 14:43:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h1sm1424536otq.45.2021.11.12.14.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:43:23 -0800 (PST)
Received: (nullmailer pid 3511445 invoked by uid 1000);
        Fri, 12 Nov 2021 22:43:22 -0000
Date:   Fri, 12 Nov 2021 16:43:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 02/12] dt-bindings: watchdog: Document Exynos850
 watchdog bindings
Message-ID: <YY7uCs9gxBPoigOc@robh.at.kernel.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-3-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-3-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, 07 Nov 2021 22:29:33 +0200, Sam Protsenko wrote:
> Exynos850 SoC has two CPU clusters:
>   - cluster 0: contains CPUs #0, #1, #2, #3
>   - cluster 1: contains CPUs #4, #5, #6, #7
> 
> Each cluster has its own dedicated watchdog timer. Those WDT instances
> are controlled using different bits in PMU registers, new
> "samsung,index" property is added to tell the driver which bits to use
> for defined watchdog node.
> 
> Also on Exynos850 the peripheral clock and the source clock are two
> different clocks. Provide a way to specify two clocks in watchdog device
> tree node.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - Renamed "samsung,index" property to more descriptive
>     "samsung,cluster-index"
>   - Disabled "samsung,cluster-index" property for SoCs other than
>     Exynos850
> 
> Changes in v2:
>   - Stated explicitly that Exynos850 driver requires 2 clocks
>   - Used single compatible for Exynos850
>   - Added "index" property to specify CPU cluster index
>   - Fixed a typo in commit message: dedicater -> dedicated
> 
>  .../bindings/watchdog/samsung-wdt.yaml        | 45 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
