Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5965A39C26F
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jun 2021 23:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhFDVc2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Jun 2021 17:32:28 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:34568 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhFDVc1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Jun 2021 17:32:27 -0400
Received: by mail-ot1-f42.google.com with SMTP id v27-20020a056830091bb02903cd67d40070so7361488ott.1;
        Fri, 04 Jun 2021 14:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uPmck88W/M4wuf9C9X0fQJ2ET0+qI2iV7KMjK3PkVSw=;
        b=LVz/POa/sROMTbquH899GLMQuWgCmqpyYa9YVrMab39G+ET8rjQaSj3+faeIKCDsOs
         XhacPCu9DnWvv5QaEQiuxcgo+ML3o/Lxy1kJOWgmJSXegfIuE8xJsIp50dzLZsAEWOOD
         SczHwOi8fU8ZcRFusu01m8uip48gN56p+fNA4MweqymnQW5bUxe884Sm1FNIzt40cnFt
         oKbSa0FdUVRJCwO1JGa08dET/6UUDN26N9Vr8hC3dYTpAo5vyaLpdQ6kCXiID0UoM0kG
         6fLL8wq2W20FRAJcFJ+t5p4QVNWZAIj3tzh32HNzMvy0L0TzBqYytjiDGbF/hUhkWbyv
         X0ZA==
X-Gm-Message-State: AOAM533Wd7R4IEpumyV1WQ4XqwQwpeOuLUqQ/oN3f2ATIpchXAxLPE2w
        mgcV9evEr4dkEXB8G7+bsQ==
X-Google-Smtp-Source: ABdhPJzbC82F9wfKCu/p/rdRvJ2GLyRXyue9H82h6ArpHMhtBu3Szmn28MTSI0J3sGmpYx9yfjAhhA==
X-Received: by 2002:a05:6830:1e37:: with SMTP id t23mr5215835otr.318.1622842230119;
        Fri, 04 Jun 2021 14:30:30 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l9sm669637oou.43.2021.06.04.14.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:30:29 -0700 (PDT)
Received: (nullmailer pid 3954312 invoked by uid 1000);
        Fri, 04 Jun 2021 21:30:28 -0000
Date:   Fri, 4 Jun 2021 16:30:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Documentation: watchdog: Add Mstar MSC313e WDT
 devicetree bindings documentation
Message-ID: <20210604213028.GA3941849@robh.at.kernel.org>
References: <20210530072645.10379-1-romain.perier@gmail.com>
 <20210530072645.10379-2-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530072645.10379-2-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, May 30, 2021 at 09:26:43AM +0200, Romain Perier wrote:
> This adds the documentation for the devicetree bindings of the Mstar
> MSC313e watchdog driver, found from MSC313e SoCs and newer.

'dt-bindings: watchdog: ...' for the subject.

> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  .../bindings/watchdog/msc313e-wdt.yaml        | 40 +++++++++++++++++++

mstar,msc313e-wdt.yaml

>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml b/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
> new file mode 100644
> index 000000000000..70b8e1be5e8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/msc313e-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MStar Watchdog Device Tree Bindings
> +
> +maintainers:
> +  - Daniel Palmer <daniel@0x0f.com>
> +  - Romain Perier <romain.perier@gmail.com>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mstar,msc313e-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog: watchdog@6000 {

Drop unused labels.

> +        compatible = "mstar,msc313e-wdt";
> +        reg = <0x6000 0x1f>;
> +        clocks = <&xtal_div2>;
> +    };
> -- 
> 2.30.2
