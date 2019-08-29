Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA25A2A5B
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2019 00:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbfH2W4F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Aug 2019 18:56:05 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46158 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbfH2W4E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Aug 2019 18:56:04 -0400
Received: by mail-oi1-f195.google.com with SMTP id t24so3863730oij.13;
        Thu, 29 Aug 2019 15:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AcqAKzCkm/gS75dDEccyBh6Oz2jirMULmsO7hRuPRrg=;
        b=T5Ma4Zd5bMuuEw+CVg0G0+KTxTlak/eE9IGR3c7wGom18bNtrFXK9C5fYpq0Y6fI1b
         c8m4q6+QNm0bgpDuSHujRv/h5m235x8IZpmGtlExxhzs1KyICXXGYK/6z/07Qz98RUjE
         0a/tlnQ5l/YWnulfhx9QN6PIKHyzcVOsJuQjnt93Rivhn9vuqITRNJGKHPeiYoCidoBY
         DeOxp4DALlsTgH0ZcjmaPO5CVdD9Idr0+Vge32MnBnesTYYMbZGa3wWc0+m1AwSpgBpr
         RcpS2/w56WBGtFltQTyE+ygJpVygVXRSmGqbQJME+5gtiNBKNOQDh+wMDTo70avPx5IN
         RgnQ==
X-Gm-Message-State: APjAAAVIb6FbGr6pVRwpYQxijh3bolRCZbBWmAJAphFu2QyPX9t8j0Wp
        91k3yjKgTkA7R/FPGE/suA==
X-Google-Smtp-Source: APXvYqwkvLByG+E3adSffoHfKaAwsMfaOUgusko2o61o2oZkDP5FVCtM+58yL1hGvRelXT0PjmhLBg==
X-Received: by 2002:aca:f5c8:: with SMTP id t191mr8247459oih.61.1567119363695;
        Thu, 29 Aug 2019 15:56:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i22sm1253218oto.80.2019.08.29.15.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:56:02 -0700 (PDT)
Date:   Thu, 29 Aug 2019 17:56:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Alexander Amelkin <a.amelkin@yadro.com>,
        openbmc@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings/watchdog: Add access_cs0 option for
 alt-boot
Message-ID: <20190829225602.GA15783@bogus>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-5-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826104636.19324-5-i.mikhaylov@yadro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 26, 2019 at 01:46:36PM +0300, Ivan Mikhaylov wrote:
> The option for the ast2400/2500 to get access to CS0 at runtime.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5077a1f5cb3..023a9b578df6 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -34,6 +34,13 @@ Optional properties:
>                  engine is responsible for this.
>  
>   - aspeed,alt-boot:    If property is present then boot from alternate block.
> +                       At alternate side 'access_cs0' sysfs file provides:

What's sysfs?

Don't put Linux stuff in bindings.

> +                       ast2400: a way to get access to the primary SPI flash
> +                                chip at CS0 after booting from the alternate
> +                                chip at CS1.
> +                       ast2500: a way to restore the normal address mapping from
> +                                (CS0->CS1, CS1->CS0) to (CS0->CS0, CS1->CS1).
> +
>   - aspeed,external-signal: If property is present then signal is sent to
>  			external reset counter (only WDT1 and WDT2). If not
>  			specified no external signal is sent.
> -- 
> 2.20.1
> 
