Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E3F1689D3
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2020 23:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgBUWLy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Feb 2020 17:11:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:50688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726725AbgBUWLy (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Feb 2020 17:11:54 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 212962467A;
        Fri, 21 Feb 2020 22:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582323113;
        bh=bf2RsaSvZhMI79nHgHionWDyrsV17B3qT+29dL6QM30=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uLjEhdPGfBBs8J8kMdI9gKpPjMd/M6RazcBBvo02LI5gk5BBFs1us7fw56ebDGrNr
         hDqGewgjxff4DzdXTjm8dNTCjRJxHnGbNdbxaZF/ZCJqBbS4adXiRUSQWuVIIS7L26
         e7yPR4613FuK8IHfzY0sRp0MoZGPOYUofpaCd1UI=
Received: by mail-qv1-f44.google.com with SMTP id ci20so323874qvb.4;
        Fri, 21 Feb 2020 14:11:53 -0800 (PST)
X-Gm-Message-State: APjAAAVivR2353AR4kVorgtpB2nMIOumPz2X2wA3uQbFRmriV7WZGve4
        1JONzwQhqHQM0bOzzn/vpgDpF1pWc5bNzb6XjA==
X-Google-Smtp-Source: APXvYqyYbXN85xYUMFaOgLv6Q5mUpNeZ8NyF/CcoNZ4CxdRu4RUYJEOgtcn8M4e8AKdcB5TiFQMt27ZRzzmiMvhInMw=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr31162876qvn.79.1582323112146;
 Fri, 21 Feb 2020 14:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20200221053802.70716-1-evanbenn@chromium.org> <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
In-Reply-To: <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 21 Feb 2020 16:11:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
Message-ID: <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173,smc-wdt watchdog
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Feb 20, 2020 at 11:38 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> This watchdog can be used on ARM systems with a Secure
> Monitor firmware to forward watchdog operations to
> firmware via a Secure Monitor Call.
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
>
> Changes in v2:
> - Change name arm > mt8173
>
>  .../bindings/watchdog/mt8173,smc-wdt.yaml     | 30 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
>
> diff --git a/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
> new file mode 100644
> index 0000000000000..ff45e13bc548b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/mt8173,smc-wdt.yaml#
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
> +      - mt8173,smc-wdt

compatible strings are in the form <vendor>,<device>. 'mt8173' is not a vendor.

> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    watchdog {

This should be a child of some Mediatek firmware node. I assume
watchdog is not the *only* function.

> +      compatible = "mt8173,smc-wdt";
> +      timeout-sec = <15>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e48ab79879ace..59e8779363c12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1421,6 +1421,12 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
>  F:     drivers/irqchip/irq-al-fic.c
>
> +ARM SMC WATCHDOG DRIVER
> +M:     Julius Werner <jwerner@chromium.org>
> +R:     Evan Benn <evanbenn@chromium.org>
> +S:     Maintained
> +F:     devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
> +
>  ARM SMMU DRIVERS
>  M:     Will Deacon <will@kernel.org>
>  R:     Robin Murphy <robin.murphy@arm.com>
> --
> 2.25.0.265.gbab2e86ba0-goog
>
