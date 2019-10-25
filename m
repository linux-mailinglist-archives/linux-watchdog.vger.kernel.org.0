Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73D5FE552D
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2019 22:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfJYUae (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Oct 2019 16:30:34 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33376 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbfJYUae (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Oct 2019 16:30:34 -0400
Received: by mail-oi1-f196.google.com with SMTP id a15so2478219oic.0;
        Fri, 25 Oct 2019 13:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DjnUodnaL6w0elyh2CsGwsstDrRTdxNuqmD9G+YqUd4=;
        b=cEdmt9X0RedGeE58QLRAjUCtEpWlXbZoqwElE2jizOvUrKkArrwEDToYVzdXpzeqGd
         UaG2X+U0IGq1dj44GLHKcogyV80hGl59HTzT6U+yjk3jQ3qMAGuFNPf5KnpNmpyJYoaT
         RZABGN8ldGvQ3fINoyxhF3d/Qp2daeCKeYdD7U1Jf1l0aegpObAuGg9AfyWThowB/NEh
         N1IdGwWZ4+kkLh9r76wqXnXeI5RroruqvM7BiH1jGKX3exKeX1FDpRsq/Gs3kXMWwO45
         e6SvSTQ5IXZPxjCm52llzZjGh9MQtTTC9wmyWxZE67Kdu09CTlOJ2UKFnGL82I783oQ4
         RpYg==
X-Gm-Message-State: APjAAAV7BIFwowKm8CM8Ui03BwKk79+myEPLfg5YuP9vDYsa/3Ist7wI
        y+x/mlwpUjM2amliLXMM0Q==
X-Google-Smtp-Source: APXvYqy/fDo5GIME57rCCB5sn8utMkgqqWQkRouqjcMDQCu4olP7uzs9etttYKNKUcq1tCCeLd1KXQ==
X-Received: by 2002:aca:b256:: with SMTP id b83mr2268898oif.101.1572035431991;
        Fri, 25 Oct 2019 13:30:31 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l19sm842018oie.22.2019.10.25.13.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 13:30:31 -0700 (PDT)
Date:   Fri, 25 Oct 2019 15:30:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Xingyu Chen <xingyu.chen@amlogic.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>, linux-watchdog@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
Message-ID: <20191025203030.GA28391@bogus>
References: <1571983984-11771-1-git-send-email-xingyu.chen@amlogic.com>
 <1571983984-11771-3-git-send-email-xingyu.chen@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571983984-11771-3-git-send-email-xingyu.chen@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Oct 25, 2019 at 02:13:02PM +0800, Xingyu Chen wrote:
> The binding targets the Meson-A/C series compatible SoCs, in which the
> watchdog registers are in secure world.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> ---
>  .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
> new file mode 100644
> index 00000000..0bbc807
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +# Copyright (c) 2019 Amlogic, Inc
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-wdt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Secure Watchdog Timer
> +
> +maintainers:
> +  - Xingyu Chen <xingyu.chen@amlogic.com>
> +
> +description: |+
> +  Secure Watchdog Timer used in Meson-A/C series Compatible SoCs
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-sec-wdt

If there are no other properties, then you don't need this. Just have 
the secure firmware driver instantiate the watchdog.

> +
> +  secure-monitor:
> +    description: phandle to the secure-monitor node
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - secure-monitor
> +
> +examples:
> +  - |
> +    watchdog {
> +          compatible = "amlogic,meson-sec-wdt";
> +          secure-monitor = <&sm>;
> +    };
> -- 
> 2.7.4
> 
