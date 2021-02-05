Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1553D31136B
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Feb 2021 22:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbhBEVW7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Feb 2021 16:22:59 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:34834 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbhBEVWR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Feb 2021 16:22:17 -0500
Received: by mail-oi1-f171.google.com with SMTP id w8so9025962oie.2;
        Fri, 05 Feb 2021 13:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jocZMba4zIL2h1yCNatGbik1KvXn4y8YG1xTFpkN/Co=;
        b=VYbwU+vjRnQ7LryvnO+z0mcRvOWam2Wjao4Ve3IVQO8pt2uo7BCFcAm/QujniCledz
         F/6mA8yDoZyuacvHlhZmJvWdpjphTVydip/2lVzIWi/BcJ9KMthpGjd5UPX5hoWRfPHw
         LQ7ClVsvV/jAkdX9Ril49c04Zq+NznRGU21aLLvH04O9sRnQX4PKCVW+Jz4/lFNi4/xe
         9vTJhk+ug4mSNV8xE3g2vSq4qrjcAkJOn2X44bSGka1etyOFG065bqUzeJZpyz2idYaT
         TGY4mvT6igAz0rYfer2AMduhb5KYC/KMrp/8ztfV5aMBZw9owRM4Gp1onWmGHQ8cwQmj
         9f7g==
X-Gm-Message-State: AOAM531H1OtySxBpce/jqYViYIMkWoFXQwVfyWytNTuwUzQFkjGE2OAM
        0woi7ZoVWWwYj8UtgP+qSu3iHalBAA==
X-Google-Smtp-Source: ABdhPJyBctuEa2lJbXV3As6EdaWOf8hcdJvn9AQoelXaG4VA2D6LMqtHhVNUj/qEHT7t+fAFVfQWEA==
X-Received: by 2002:aca:3b06:: with SMTP id i6mr4363448oia.81.1612560095487;
        Fri, 05 Feb 2021 13:21:35 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q20sm2040441otf.2.2021.02.05.13.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 13:21:34 -0800 (PST)
Received: (nullmailer pid 3765901 invoked by uid 1000);
        Fri, 05 Feb 2021 21:21:33 -0000
Date:   Fri, 5 Feb 2021 15:21:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [PATCH v6 3/6] dt-bindings: mfd: ahc1ec0.yaml: Add Advantech
 embedded controller - AHC1EC0
Message-ID: <20210205212133.GA3759495@robh.at.kernel.org>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
 <20210118123749.4769-3-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118123749.4769-3-campion.kang@advantech.com.tw>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jan 18, 2021 at 08:37:46PM +0800, Campion Kang wrote:
> Add DT binding schema for Advantech embedded controller AHC1EC0.
> 
> Changed since V5:
> 	- rename dt-bindings/mfd/ahc1ec0.h to dt-bindings/mfd/ahc1ec0-dt.h
> 	that found errors by bot 'make dt_binding_check'
> 
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  .../devicetree/bindings/mfd/ahc1ec0.yaml      | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
> new file mode 100644
> index 000000000000..40af14bb9c0a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ahc1ec0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Advantech Embedded Controller (AHC1EC0)
> +
> +maintainers:
> +  - Campion Kang <campion.kang@advantech.com.tw>
> +
> +description: |
> +  AHC1EC0 is one of the embedded controllers used by Advantech to provide several
> +  functions such as watchdog, hwmon, brightness, etc. Advantech related applications
> +  can control the whole system via these functions.
> +
> +properties:
> +  compatible:
> +    const: advantech,ahc1ec0
> +
> +  advantech,sub-dev-nb:
> +    description:
> +      The number of sub-devices specified in the platform.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1

You don't need this, just count the length of the next property:

> +
> +  advantech,sub-dev:
> +    description:
> +      A list of the sub-devices supported in the platform. Defines for the
> +      appropriate values can found in dt-bindings/mfd/ahc1ec0-dt.h.
> +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +    minItems: 1
> +    maxItems: 6

But as I said before, this binding is odd. It doesn't look like how we 
do any other MFD. Either we have child nodes or they are implicit.

> +
> +  advantech,hwmon-profile:
> +    description:
> +      The number of sub-devices specified in the platform. Defines for the
> +      hwmon profiles can found in dt-bindings/mfd/ahc1ec0-dt.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - advantech,sub-dev-nb
> +  - advantech,sub-dev
> +
> +if:
> +  properties:
> +    advantech,sub-dev:
> +      contains:
> +        const: 0x3
> +then:
> +  required:
> +    - advantech,hwmon-profile
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/ahc1ec0-dt.h>
> +    ahc1ec0 {
> +        compatible = "advantech,ahc1ec0";
> +
> +        advantech,sub-dev-nb = <2>;
> +        advantech,sub-dev = <AHC1EC0_SUBDEV_HWMON
> +                             AHC1EC0_SUBDEV_WDT>;
> +
> +        advantech,hwmon-profile = <AHC1EC0_HWMON_PRO_UNO2271G>;
> +    };
> -- 
> 2.17.1
> 
