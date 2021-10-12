Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A0A429F44
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Oct 2021 10:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbhJLIF7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Oct 2021 04:05:59 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52716
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234940AbhJLIFG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Oct 2021 04:05:06 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3393D3FFD9
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634025781;
        bh=uRYagTk6MpIfpm938XTiHR//S2u2wtANBbTnjpAOHf0=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NgJCNbn3G28wne8h7IZ8PbGMusLSGskQgaUV5A+hvM53JRMJsk1GDYoKcROpljjXc
         nf6lbTBHgH56cPehzwjkT8z98Og9ZxPJithaF/R6yaNQOohbEWI5kxJLWRxCmuHFwH
         tKn9nTRHEPxEC8nn7SgL5JR2m6zuLL7q6mUrGry9qTVCb+gI7JhHYaLxbl2mO8kPMj
         uk3+TBjkKQ4ajTk2araUW/DMTwxEugtkSfM5NomedHfJuCc8I7P/VB0h5kO4HBijXr
         GaQeTk++ZuXrnukbfgppZUX1DeAUPBNuaojSZi9quoHka3SALFkcPXQTDLooRo/tFF
         PTiSIwnzj+2Nw==
Received: by mail-lf1-f72.google.com with SMTP id p42-20020a05651213aa00b003fd8935b8d6so4772199lfa.10
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 01:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uRYagTk6MpIfpm938XTiHR//S2u2wtANBbTnjpAOHf0=;
        b=1VLR6UaX8pYMwjTQsChyjmYnEBjkn5mp5C+06WKj9BOkJ5HViS9RDGH6w/d3t9cz6S
         wLS7ehAwEBo3DnVHOgY+CCRLYDSC/Y/kQVPhbkDI//8977HinVm2+0o0v/IYCAFCH9ee
         qt4CLeuUGIWT/O1ubil9p00sIqKMmnZuQ7Nvr8CrHbmt1qR4C9lCP7FIlnh7HvIxwAY1
         DP3bY76Lbdnu/f4OH7Rqnxb52dpOs3YSVLJLfu9eOipqlX1TCX2amCYujI2G5k2jYFgU
         z05MBTnj4jDCdM1YH5EUcnZvuKh/VB/Y8S3zHX/EKQcbjoiZP79UO+8xuHI0Uc/I1qw0
         UcMQ==
X-Gm-Message-State: AOAM5323KGX7cdYgM4Ar8kCIad9MpEquBaY4ErUWRzu0CAAg4BH2P5DQ
        nxcOnymhuqptc2FWD5xZwNNjaPwPYyvcsXu9xnKfnUNFl7mdgvO7rlRyC9d9C4JXt26ES60Rmsy
        PuK3zFsuCEzgqzHFJis+0nk96MbRTq4dxB5p4J8sKUbZV
X-Received: by 2002:a2e:5c43:: with SMTP id q64mr27667403ljb.224.1634025780493;
        Tue, 12 Oct 2021 01:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWblHn4Br++Rtsc1RT2izUIH3qGN0inuK9izfQk7VScP/dXcNHCxXTuwT/b4FMiYLl8dGHnw==
X-Received: by 2002:a2e:5c43:: with SMTP id q64mr27667382ljb.224.1634025780318;
        Tue, 12 Oct 2021 01:03:00 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s11sm954282lfd.262.2021.10.12.01.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:02:59 -0700 (PDT)
Subject: Re: [PATCH 5/8] dt-bindings: mfd: add Maxim MAX77714 PMIC
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-6-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8ad40ebc-8430-9fa0-ae60-88e0d486e8cc@canonical.com>
Date:   Tue, 12 Oct 2021 10:02:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-6-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/10/2021 17:56, Luca Ceresoli wrote:
> Add bindings for the MAX77714 PMIC with GPIO, RTC and watchdog.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  .../bindings/mfd/maxim,max77714.yaml          | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> new file mode 100644
> index 000000000000..2b0ce3b9bc92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/maxim,max77714.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MAX77714 PMIC with GPIO, RTC and watchdog from Maxim Integrated.
> +
> +maintainers:
> +  - Luca Ceresoli <luca@lucaceresoli.net>
> +
> +description: |
> +  MAX77714 is a Power Management IC with 4 buck regulators, 9
> +  low-dropout regulators, 8 GPIOs, RTC and watchdog.
> +
> +properties:
> +  compatible:
> +    const: maxim,max77714
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +    description:
> +      The first cell is the IRQ number, the second cell is the trigger type.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@1c {
> +            compatible = "maxim,max77714";
> +            reg = <0x1c>;
> +            interrupt-parent = <&gpio2>;
> +            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +        };
> +    };

Looks good to me, but what about regulators and other properties? Are
you planning to add them later?


Best regards,
Krzysztof
