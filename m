Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54BA5E55B7
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2019 23:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfJYVQm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Oct 2019 17:16:42 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:47033 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfJYVQm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Oct 2019 17:16:42 -0400
Received: by mail-oi1-f193.google.com with SMTP id c2so2497107oic.13;
        Fri, 25 Oct 2019 14:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2ob0mgbIZ9FfbUUxJInfeBH4+M1B1T0PuvLRnw558ao=;
        b=ZcLoWZYGyK+S0cPZVOvmCr+AlDMaB+5fDbKk7x+DUqhKOozOe4Nn1JLYpraHk7JKJE
         gh9F1NCgX3tcNA01Ju5HTHKomWrRA2iwPzw4l8vmV+CgBIpzM6XxrH03aAkBHoR2or+a
         qz1E7ilYgXwZV8LMWTS3QGyzAYUvZzDTSAquyLVAyii+d9j4RsJY1HosEaxA5IrtVY31
         +FIwtKZTag5BZQ1jEQGHbD8uCyQbkIeUemaQXA1KoGH6SZuq7DyNzJ8j2z5rTaBMV+0S
         Y/eVuZFQRAeAzZ0NaVPgkXnS6UMWGewPmmoIBLIxeWieCL1Czc5Iq9d17stiEQnkKc6e
         4szA==
X-Gm-Message-State: APjAAAWANKudFQgZDHhBXM762MvBgFSXGBi+poqy5f3Sg8xCJOku/Vdz
        5Knz7TT5xA3a/BwmeN7ggg==
X-Google-Smtp-Source: APXvYqwHwU0Ux4uA/CF9wNerMjPJFEWBUMoPYqh+hsHSr/1CY4O7H/1VhWFahfac5Tz6bTnGpVvp4w==
X-Received: by 2002:a54:478b:: with SMTP id o11mr4581792oic.169.1572038199401;
        Fri, 25 Oct 2019 14:16:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r14sm1089669otp.23.2019.10.25.14.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:16:38 -0700 (PDT)
Date:   Fri, 25 Oct 2019 16:16:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: watchdog: realtek: Convert RTD119x
 to schema
Message-ID: <20191025211638.GA28819@bogus>
References: <20191020040817.16882-1-afaerber@suse.de>
 <20191020040817.16882-2-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191020040817.16882-2-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Oct 20, 2019 at 06:08:10AM +0200, Andreas Färber wrote:
> Convert the Realtek watchdog binding to a YAML schema.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v2: New
>  
>  .../bindings/watchdog/realtek,rtd119x.txt          | 17 ----------
>  .../bindings/watchdog/realtek,rtd119x.yaml         | 38 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
> deleted file mode 100644
> index 05653054bd5b..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Realtek RTD1295 Watchdog
> -========================
> -
> -Required properties:
> -
> -- compatible :  Should be "realtek,rtd1295-watchdog"
> -- reg        :  Specifies the physical base address and size of registers
> -- clocks     :  Specifies one clock input
> -
> -
> -Example:
> -
> -	watchdog@98007680 {
> -		compatible = "realtek,rtd1295-watchdog";
> -		reg = <0x98007680 0x100>;
> -		clocks = <&osc27M>;
> -	};
> diff --git a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
> new file mode 100644
> index 000000000000..5d92cfdfd046
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/watchdog/realtek,rtd119x.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Realtek RTD1295 Watchdog
> +
> +maintainers:
> +  - Andreas Färber <afaerber@suse.de>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: realtek,rtd1295-watchdog

You can drop the 'oneOf' here unless you're planning to add another 
entry with 2 compatible strings.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +examples:
> +  - |
> +	watchdog@98007680 {
> +		compatible = "realtek,rtd1295-watchdog";
> +		reg = <0x98007680 0x100>;
> +		clocks = <&osc27M>;
> +	};
> +...
> -- 
> 2.16.4
> 
