Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8A52D8E88
	for <lists+linux-watchdog@lfdr.de>; Sun, 13 Dec 2020 17:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbgLMQNM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 13 Dec 2020 11:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730102AbgLMQNM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 13 Dec 2020 11:13:12 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F20BC0613CF;
        Sun, 13 Dec 2020 08:12:31 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id 15so16365069oix.8;
        Sun, 13 Dec 2020 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WPVtQ1Mz44bztjvcPbTZApa19516/GGnEk5ljEDINh8=;
        b=L/JfijbPJ+Mj6ae8tPUwxOCHZgScF73DL+rf5343UU8YIQsh+vfCfORPpoy6HRnGJW
         grIooOv5e1GUBaCmCjRTUZz8LVeZgCVfsQJBLjPN7e40g/6B9dnj7YGiNPN4jFE/olIw
         1NHIaP3FB/yOJ6eutVvMj05bzu10Q/IQLEOLSS9czRAS/Ghj/iEMTFGtUbyz+F+CboEn
         do81klb60xpuHhi0Fh0kDNJfDdFOjfNi21Ih7bu5D7Ktt442jdzr7GiJjqS0/c3pS2xB
         GN1Zs+IuAb8cnCw+2AH2zZYU4NqFn0KU9h+MH6bJPbVwMlk8BmKHrwOyCM5V6ugUIwsW
         VLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WPVtQ1Mz44bztjvcPbTZApa19516/GGnEk5ljEDINh8=;
        b=extmHYiT62kl1xtJfoKr0WbPusimh1fN/2+zOJXCYyvdLeQNFqJmEL/llXBI2S36M5
         cukiU3enxzrgL2mT49T00Y14YaRhx+oqyA3+vG3dUB6ndaZ6Fq90C1niS7yAvBmLyLEl
         g+F0Il7IJV+MX2EaE9Vc2lOTKyoJFC74Y8LIceMwV6QLRD67h2fMycTkKPAgQTSMECmE
         0zJX9qWoQTnniB3grINYW+cEwI6DHN69tueex+nHzq3G8n1aIvRJPPxRtPvz173r/8+s
         1o2avOBbGypv6ymh9N13UvlhedgOEgZCsoFkGQPqk3KucNZZ+HuUtcE7q9ciTc+nLnsr
         BH6g==
X-Gm-Message-State: AOAM5333cM8PU2YkViBQUXjudTxh7fXu2Akd1piLduTKgc1uVGUUwvRJ
        d74WEpt0cm7k7vrv4p6sRLc=
X-Google-Smtp-Source: ABdhPJzDm1OOjQ+niynzARCVQxF7RYZaIszycjgUqvnjTyHf2h0ymmlodIeXMC3j6PqR4BIxIg2Q6Q==
X-Received: by 2002:aca:72c1:: with SMTP id p184mr15980530oic.86.1607875950737;
        Sun, 13 Dec 2020 08:12:30 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r13sm1332253oti.49.2020.12.13.08.12.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Dec 2020 08:12:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 13 Dec 2020 08:12:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 16/21] dt-bindings: watchdog: sun4i: Add A100
 compatible
Message-ID: <20201213161228.GA44341@roeck-us.net>
References: <20201211011934.6171-1-andre.przywara@arm.com>
 <20201211011934.6171-17-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211011934.6171-17-andre.przywara@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Dec 11, 2020 at 01:19:29AM +0000, Andre Przywara wrote:
> From: Yangtao Li <frank@allwinnertech.com>
> 
> Add a binding for A100's watchdog controller.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml  | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index e8f226376108..5ac607de8be4 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -21,6 +21,9 @@ properties:
>        - items:
>            - const: allwinner,sun50i-a64-wdt
>            - const: allwinner,sun6i-a31-wdt
> +      - items:
> +          - const: allwinner,sun50i-a100-wdt
> +          - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,sun50i-h6-wdt
>            - const: allwinner,sun6i-a31-wdt
