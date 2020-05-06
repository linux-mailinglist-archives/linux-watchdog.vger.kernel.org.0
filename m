Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05FFE1C71FD
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 May 2020 15:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgEFNpu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 6 May 2020 09:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725966AbgEFNpu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 6 May 2020 09:45:50 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17521C061A0F;
        Wed,  6 May 2020 06:45:50 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d22so1127304pgk.3;
        Wed, 06 May 2020 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S3Lwm4AKo+YF745y2UjeT2m8wwH3bfZOap41uVObmhM=;
        b=pXhbgeR1QKrcPuSNZiwXRMXBdl17dvD867jNinBv+BMnTfkH+cnwt6kgaa4T1nVWmr
         dbVKmBxjQ6N4NedamQUDQ50Svb0TpHEJBzeipLe6/Iq2TXy3gO+zCawrOtQlDl8m8egc
         mbRIqbVy6H/5NvRqUvX8al1LFclAmY/LxwOQdw/nrNWZtFQBqczvoSVsmpmbc4lmHU3h
         0zMFzmCgITU412brnVgu51qHXBllle1mA7ynClUazyt+yRHNQQW9/pyqe57JXMcVvidd
         WaTA9Qx8e4ZfYIU4rJtjXAqsSxotlAXImNgdpP0F0uy9YZUGkOScAUhr0PG0wSQBXpwb
         hZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=S3Lwm4AKo+YF745y2UjeT2m8wwH3bfZOap41uVObmhM=;
        b=ahIU9+u7xBzQN2rOBFM9t1TNSObrM0WfX6P1QIObqTLeDJnoSbMt/ci+V3UBlnSQU1
         yeChp7biTmwL5tkitSQOea8iUQEUu3v0O3o3QLL2SaX+R+fH0tDEjp289O8B2U6GQsio
         HMBzZT1BYnAaKPPT3IqcHVhnNX9U8GbWv66L5mR43RgDC2/oaacVqxy+SimSe1WkNQvs
         4aq48p2cPOqeTk2POMkAZX1Hg0PYq3xykkvE3JRQuf2LyM3oP58MvYtNEEPHroAO5h18
         RuG8CSKCkWfPxgveNpKtrssNfM/HE7j+b1pdJZpVk5HXH+QyK5gTW4DVv6lflsUjtN+0
         zj5w==
X-Gm-Message-State: AGi0PuYibTQ9TF9tGqoapGx8GQhyVd/JuwxkjT+1OU4329W9XjWazkfS
        76U8uSYsi0royBFYC9gaSHc3IHYG
X-Google-Smtp-Source: APiQypINpwMfiEoPsVfPVR3/1u/QrlIjA9AJighlTYyj1K8cdQyo3P+Dy7P9kv5Pnuns6elfp4Wx/A==
X-Received: by 2002:a62:343:: with SMTP id 64mr8265734pfd.47.1588772749363;
        Wed, 06 May 2020 06:45:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 3sm1905650pfo.27.2020.05.06.06.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 06:45:48 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] dt-bindings: watchdog: Add ARM smc wdt for mt8173
 watchdog
To:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     jwerner@chromium.org, xingyu.chen@amlogic.com,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20200505031331.122781-1-evanbenn@chromium.org>
 <20200505131242.v6.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <adbf700e-20e6-47db-a674-f965f65818c6@roeck-us.net>
Date:   Wed, 6 May 2020 06:45:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505131242.v6.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/4/20 8:13 PM, Evan Benn wrote:
> This watchdog can be used on ARM systems with a Secure
> Monitor firmware to forward watchdog operations to
> firmware via a Secure Monitor Call.
> 
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> 
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v6:
> - Don't use dt default
> 
> Changes in v5:
> - Change compatible to arm,smc-wdt
> 
> Changes in v4:
> - Add arm,smc-id property
> 
> Changes in v3:
> - Change name back to arm
> 
> Changes in v2:
> - Change name arm > mt8173
> 
>  .../bindings/watchdog/arm-smc-wdt.yaml        | 37 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> new file mode 100644
> index 0000000000000..bec651541e0c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/arm-smc-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Secure Monitor Call based watchdog
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
> +  arm,smc-id:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The ATF smc function id used by the firmware.
> +      Defaults to 0x82003D06 if unset.
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    watchdog {
> +      compatible = "arm,smc-wdt";
> +      arm,smc-id = <0x82003D06>;
> +      timeout-sec = <15>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b816a453b10eb..0f2b39767bfa9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1457,6 +1457,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
>  F:	drivers/irqchip/irq-vic.c
>  
> +ARM SMC WATCHDOG DRIVER
> +M:	Julius Werner <jwerner@chromium.org>
> +R:	Evan Benn <evanbenn@chromium.org>
> +S:	Maintained
> +F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
> +
>  ARM SMMU DRIVERS
>  M:	Will Deacon <will@kernel.org>
>  R:	Robin Murphy <robin.murphy@arm.com>
> 

