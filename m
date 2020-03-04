Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED01F17964B
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Mar 2020 18:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgCDRIf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Mar 2020 12:08:35 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37366 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgCDRIf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Mar 2020 12:08:35 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so1268868pfn.4;
        Wed, 04 Mar 2020 09:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WcXiDjy33PYge8hUsXuS+/8NVEyCDj8/Q41XwHVNKcw=;
        b=nPtvWklQt9QghWJiSdW0QkhlOrTOjZ3+Pds6ZlGJMH65EhPXyR/CLtQPDyWFP6vkVk
         WBs9KyqFwr2826o1eb60HIE/D7eB88nLn5qItsO4QRJum9NW2rUgoDgdu2C/+OBnAOSm
         7VGNMVXMqTvDsGKcEVAvHD4xY3TNY3Ecoz0Qo3LB+REQP+1vkTxrkDtf35T1c8a3WTAq
         sLvRu06xnTEnC5SFMLwJEPp9umUI7fdjZNSUghVcNxaa2fnjI1marOElFj9M6v17L6Tc
         cDQfQ0dSZIo4z57MzT4QliTFyIk634DnwZVwEEfcMAlNnN7o5KsNQ0HOvPjIMqpmRcrW
         VDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WcXiDjy33PYge8hUsXuS+/8NVEyCDj8/Q41XwHVNKcw=;
        b=LtxuIWkB7jA7iRBbH6itoPJdHforyXTj/PopdN5BWPKOWqc8XqIXJ/ZbsznIscN52q
         cR7aDVeZm5wYrXIhEz/9IigxyWt0MSBq+tTAN9ujucnvE2HAsLaU2wxwvtLBGDZscEJH
         0UhyZrANerWSeYWlm+wohZI6muLvDxCigOj5hfdn3oxXGMI8s8lypbvwJC0bp6NJIQyH
         XcwAp5PqVG1+4L2nb8rEPSR4da95/AP+m15hr0ujyQC8iGuhzVA5AAmFeHKzFIAawdFx
         TINtFEQPeRZrbdhXUH2CQ3siRsRvvq2+/cewYI9mgyjKNuzlZBQ7Qj9EGVgzb/hk59yI
         AeeA==
X-Gm-Message-State: ANhLgQ369ya3bfrbkODjHrg40I9W6sxjFPb9gJ8ZEL3P8TsbSAbjx2/N
        zLHijcR3W8Lw+KE51x19E7o=
X-Google-Smtp-Source: ADFU+vv+Df31P92V8d+K3fXU/m2exn8CF+UTDgAxezww+iG60GrEAezFnJETx5JbDF0id9d06IG8bw==
X-Received: by 2002:aa7:91d7:: with SMTP id z23mr1179323pfa.160.1583341714250;
        Wed, 04 Mar 2020 09:08:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h8sm1192994pfn.59.2020.03.04.09.08.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 09:08:33 -0800 (PST)
Date:   Wed, 4 Mar 2020 09:08:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, avifishman70@gmail.com, tali.perry1@gmail.com,
        yuenn@google.com, benjaminfair@google.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] dt-binding: watchdog: add bootstatus reset type
 documentation
Message-ID: <20200304170832.GA22914@roeck-us.net>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
 <20200303100114.87786-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303100114.87786-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Mar 03, 2020 at 12:01:12PM +0200, Tomer Maimon wrote:
> Add device tree three bootstatus reset types documentation.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> index 6d593003c933..65e24a80ee70 100644
> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> @@ -17,6 +17,33 @@ Required clocking property, have to be one of:
>  
>  Optional properties:
>  - timeout-sec : Contains the watchdog timeout in seconds
> +- nuvoton,card-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the card reset type for checking and indicating
> +  the last card reset status (WDIOF_CARDRESET)
> +
> +  If 'nuvoton,card-reset-type' is not specified the default is porst
> +
> +  Reset types:
> +       - porst: Power reset
> +       - corst: Core reset
> +	   - wdX : Watchdog reset X (X represante 0-2)
> +	   - swX : Software reset X (X represante 1-4)
> +
> +- nuvoton,ext1-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the external 2 reset type for checking and indicating
> +  the last external 2 reset status (WDIOF_EXTERN1)
> +
> +  If 'nuvoton,card-reset-type' is not specified the default is wd0.
> +
> +  Reset types are the same as in nuvoton,card-reset-type property.
> +
> +- nuvoton,ext2-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
> +  Contains the external 2 reset type for checking and indicating
> +  the last external 2 reset status (WDIOF_EXTERN2)
> +
> +  If 'nuvoton,card-reset-type' is not specified the default is sw1.
> +
> +  Reset types are the same as in nuvoton,card-reset-type property.
>  
>  Example:
>  
> @@ -25,4 +52,7 @@ timer@f000801c {
>      interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
>      reg = <0xf000801c 0x4>;
>      clocks = <&clk NPCM7XX_CLK_TIMER>;
> +	nuvoton,card-reset-type = "porst";
> +	nuvoton,ext1-reset-type = "wd1";
> +	nuvoton,ext2-reset-type = "sw2";

This set of properties maps chip reset types to reset types defined
by the Linux watchdog subsystem (ie WDIOF_CARDRESET, WDIOF_EXTERN1,
and WDIOF_EXTERN2). It is neither a hardware description nor a system
configuration.

It is up to Rob to decide, but I personally don't think it is appropriate.

Guenter
