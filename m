Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C3327B478
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Sep 2020 20:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgI1Sa1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Sep 2020 14:30:27 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43351 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgI1Sa1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Sep 2020 14:30:27 -0400
Received: by mail-oi1-f193.google.com with SMTP id i17so2397988oig.10;
        Mon, 28 Sep 2020 11:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0tAkhf1RldbeWFhn2x3MO9yyntaKm1tb0wG5hkp+puo=;
        b=czN5sHHM8WTKTIa6QQwt8CHL3mqdfA/lm4hR/su/8Na54Uung8SN1vxJR7ciYSdk65
         goLdRo7veQF6RIWwoTooEJ/Lj77uzDppmK8fzENAssZOlj3jz/abDD+CAp36sgkLyjnN
         hviKDxtHm1/cxr+5hl24r1heUq6rPwEkb4FqGKSDaaG4YOlH1ssplNpDea8YZpVoI59r
         wh3HoLhITKnA0eCJk12oEPtyEyQfNKTQ4xys5krhn480SzJI02ljnxxyqFHm5AkZJVU9
         0eDUXL385RJL6UxdZpjujNtsG0MDBy2g2DmnYSDdV1Vjrxxo8/MZv3caTmiZSWpe3gq1
         J1gg==
X-Gm-Message-State: AOAM531dEP5wo0ErWJtRnUCWNcKYZ+Cz0ILb/5fynQ8svlMN4WeyJgNa
        2P/rs/t1fP+BK21Hg0OlKin6xcSSHCRV
X-Google-Smtp-Source: ABdhPJyqcfic5TCgx1kj4meJ3c2g809wARd56UN6yy4NZ6cmnUgfbEBRyIKJnBQhsUN4coPUAmWzIg==
X-Received: by 2002:aca:fd93:: with SMTP id b141mr101965oii.153.1601317826033;
        Mon, 28 Sep 2020 11:30:26 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h14sm414468otr.21.2020.09.28.11.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 11:30:25 -0700 (PDT)
Received: (nullmailer pid 3040863 invoked by uid 1000);
        Mon, 28 Sep 2020 18:30:24 -0000
Date:   Mon, 28 Sep 2020 13:30:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 1/2] watchdog: bindings: Add binding documentation for
 Toshiba Visconti watchdog device
Message-ID: <20200928183024.GA3038976@bogus>
References: <20200921091235.299774-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200921091235.299774-2-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921091235.299774-2-nobuhiro1.iwamatsu@toshiba.co.jp>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Sep 21, 2020 at 06:12:34PM +0900, Nobuhiro Iwamatsu wrote:
> Add documentation for the binding of Toshiba Visconti SoC's watchdog.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> ---
>  .../watchdog/toshiba,visconti-wdt.yaml        | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> new file mode 100644
> index 000000000000..345e8b308e1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 Toshiba Electronic Devices & Storage Corporation
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Toshiba Visconti SoCs PIUWDT Watchdog timer
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - toshiba,visconti-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
