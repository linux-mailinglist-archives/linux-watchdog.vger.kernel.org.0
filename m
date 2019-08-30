Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 813F4A3C82
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2019 18:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbfH3Qsm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Aug 2019 12:48:42 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41446 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3Qsm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Aug 2019 12:48:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id 196so4983840pfz.8;
        Fri, 30 Aug 2019 09:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pk5V+7zqa1A7jxjsbjG2uhSw9j6dlDFBclUGejhv4g8=;
        b=hfeV8ETA4/yFa7bnnUmPSGglA2PvpWL9uUl3aKK022l+hcIbP8E6R/qPOZbY9pNDD+
         AxE4b4DseTq++lqUwXI7aDU4Wkgj5zpdyJJlZ4IfKRFEJaT04tnN0BoNUmUsHF4z85Gp
         pWYW/ZzMZYmxd92O4B/NsqYYQgcUlzHSLi7dLUjyLlYf70qseir0uLP1rqHnULm2SCnf
         6cITvevC3zCQLtWE9SYu9h+xQpC6Kg3ozhIc1spvom4ojR4FEtWvTHlikm1C3QbjBhSo
         PimITd09AuIgjF2R0Fv49MOiTsyBy8bhEsWgEv53TH5NPWTPshXzgpeN3ils3IE2nR7M
         ETwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pk5V+7zqa1A7jxjsbjG2uhSw9j6dlDFBclUGejhv4g8=;
        b=jE50o7Es1aEeqRaAeWU8ITSqUZsNCgYf2wiT7UJ48RB/JYmmntWJnZQubsFrbZBsd3
         OP3sLo0PWg0+AXw2JXLmYVgh+lZuvn2Iv7bEFK4hn6uMMOKH/ToRZuKJrHDeYFPG3Ybi
         /dlKdEmyLm66ww1FT5oMNjfIbeoTqiQ/s6pk+UOXBeikFMTrru/rv7D0ywJI8MUqJicP
         8rJmXYlAoGHfm9pl0rtsx+FWgRWiRYjrwaSbAoKyVxvfcbZk9N+PTdI2owCQOyORbzFn
         Q+R6LaGU4LCxhPsGIlMhLR8H3hlFrwnTNeiKIuX9o2jwln/jRqhYzKK/8giLwsGEcBZY
         fAXw==
X-Gm-Message-State: APjAAAUCV0GFfkuxQQTnQSDVBUiE6Ob9EFxIDAyIFDJSa7ZUCWeoEfvT
        Bz2YBegR+6CIvMRB/QMIe40PtXFK
X-Google-Smtp-Source: APXvYqzSW1fwYGfO9+zh5OWaAop3/qR5bz8ZgiTXNWF4yiHCTa+UfVOG4jLlpNMeZiTPPwjn+OHX8Q==
X-Received: by 2002:a62:4ed1:: with SMTP id c200mr19076386pfb.218.1567183722041;
        Fri, 30 Aug 2019 09:48:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14sm6882987pfo.15.2019.08.30.09.48.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 09:48:41 -0700 (PDT)
Date:   Fri, 30 Aug 2019 09:48:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RESEND v2 4/6] dt-bindings: watchdog: sun4i: Add the
 watchdog clock
Message-ID: <20190830164840.GD7911@roeck-us.net>
References: <20190821143835.7294-1-mripard@kernel.org>
 <20190821143835.7294-4-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821143835.7294-4-mripard@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 04:38:33PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner watchdog has a clock that has been described in some DT, but
> not all of them.
> 
> The binding is also completely missing that description. Let's add that
> property to be consistent.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> 
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes from v1:
>   - New patch
> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 31c95c404619..3a54f58683a0 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -31,12 +31,16 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
>    interrupts:
>      maxItems: 1
>  
>  required:
>    - compatible
>    - reg
> +  - clocks
>    - interrupts
>  
>  unevaluatedProperties: false
> @@ -47,6 +51,7 @@ examples:
>          compatible = "allwinner,sun4i-a10-wdt";
>          reg = <0x01c20c90 0x10>;
>          interrupts = <24>;
> +        clocks = <&osc24M>;
>          timeout-sec = <10>;
>      };
>  
> -- 
> 2.21.0
> 
