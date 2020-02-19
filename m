Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D9A165286
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2020 23:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbgBSWas (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Feb 2020 17:30:48 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38727 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbgBSWas (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Feb 2020 17:30:48 -0500
Received: by mail-oi1-f196.google.com with SMTP id r137so5942407oie.5;
        Wed, 19 Feb 2020 14:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wu4HYGBqerN4aCKCQ+E16577x7yAfinXWHH5tKYvb4E=;
        b=QFDZAKnz/7G32hf3DnaG3qK9sjcepac6Y4A0eRA5f+NmnonRjEpAv/YfC50M/u3qDh
         GPa9WVv3iymha8xmeJ7ItAhVXnrFLUawJMhKJezxZhdrC/tpuLjfveCvE+ys3tRXnPMO
         yEvPGEEOBvCA/cHxj5Q1Trv3Ku3dn5/oztReCCKvlkVm36mV9w7Dff8ysYuujT0zk/YJ
         xBBqYFZV5qtJnDfaBFIt6h6FqZOS/c2T+VN616lHshKanI07BK5yhAG0N03wW2obf59D
         5lMdoxs4zohYyND8Nvk8MGiYLst+ztwBokb6OSL+9eIUk4/5lNIf0wDqK2GyLpjXALWx
         TCXA==
X-Gm-Message-State: APjAAAXVC2a9/PxxEokO5AkXlWTa0/FCxgvuKNrzshvtadGjG5rg6k7Y
        Wn3FbJMlVcVmhcaXPb6eIw==
X-Google-Smtp-Source: APXvYqxxCdgrCCY3ghBEaFroq2na5pXDTn1f9hNYcEgxilsTmVqO87VbZffaVp+gF7TyRfU+vpWBCA==
X-Received: by 2002:aca:fc0c:: with SMTP id a12mr5913011oii.118.1582151447622;
        Wed, 19 Feb 2020 14:30:47 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s12sm420688oic.31.2020.02.19.14.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:30:46 -0800 (PST)
Received: (nullmailer pid 24235 invoked by uid 1000);
        Wed, 19 Feb 2020 22:30:46 -0000
Date:   Wed, 19 Feb 2020 16:30:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, jwerner@chromium.org,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
Message-ID: <20200219223046.GA16537@bogus>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 14, 2020 at 05:26:36PM +1100, Evan Benn wrote:
> This watchdog can be used on ARM systems with a Secure
> Monitor firmware to forward watchdog operations to
> firmware via a Secure Monitor Call.
> 
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
> 
>  .../bindings/watchdog/arm,smc-wdt.yaml        | 30 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,smc-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm,smc-wdt.yaml
> new file mode 100644
> index 000000000000..5170225b0c98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/arm,smc-wdt.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/arm,smc-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Secure Monitor Call based watchdog

You are not the first 'watchdog in firmware accessed via an SMC call'. 
Is there some more detail about what implementation this is? Part of 
TF-A? Defined by some spec (I can dream)?

> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Julius Werner <jwerner@chromium.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - arm,smc-wdt
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    watchdog {

I'd expect this to be a child of whatever firmware implements this 
function.

> +      compatible = "arm,smc-wdt";
> +      timeout-sec = <15>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e48ab79879ac..5c45536e1177 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1421,6 +1421,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
>  F:	drivers/irqchip/irq-al-fic.c
>  
> +ARM SMC WATCHDOG DRIVER
> +M:	Julius Werner <jwerner@chromium.org>
> +R:	Evan Benn <evanbenn@chromium.org>
> +S:	Maintained
> +F:	devicetree/bindings/watchdog/arm,smc-wdt.yaml
> +
>  ARM SMMU DRIVERS
>  M:	Will Deacon <will@kernel.org>
>  R:	Robin Murphy <robin.murphy@arm.com>
> -- 
> 2.25.0.265.gbab2e86ba0-goog
> 
