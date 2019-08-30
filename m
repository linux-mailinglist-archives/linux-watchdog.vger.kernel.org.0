Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DDEA3C7C
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2019 18:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbfH3QsY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Aug 2019 12:48:24 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33221 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3QsX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Aug 2019 12:48:23 -0400
Received: by mail-pg1-f193.google.com with SMTP id n190so3833799pgn.0;
        Fri, 30 Aug 2019 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X7EDJjP3/P5ucP5sd8p8wuc1drYUxSpuIcMdq/6dO0M=;
        b=Sddob+AJCKGltY0Zsrisq3Z1TRnqs0+05kJFI4B56UHJuVOSilol58uW+WFEBOjc5m
         W8aV5M/V5Sl2Jl+w/HGeek+X4CpCFoXvfyYd2lY5dNnJDhDfN9IRI5pq+MgGa5xaKvv6
         nCh9ja4loFd0AZwPpLePl+oIiTlwFwSWc5gMqa9IYSblkDtCtRpmu9NopAepr5hg0g+K
         O4LPrd1EhLbsJ270lkPEPWjrsl9vhVsYXsc8JzZTQFEkCVZzN+Xyzpgq7hpckewbiGIC
         EjA+391h5NZlNiX5C6k7y44+xV/82NDK+G7Sts48BBNMm5SQeY5Lfp5ERBj0iGEPy9Ny
         Fdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=X7EDJjP3/P5ucP5sd8p8wuc1drYUxSpuIcMdq/6dO0M=;
        b=nTMyrT6XgZU2aOwc9ZSrRTlEAW+uPuBaxz/ibvQ8/rahCQ5J4+4ie12gbj3/qfOfPM
         W7Kn/84IwFtLd3U5LC8d+/to3WOWGl3tVZezKZRuCweFNtPSILbmtWhk9M3b4MkEb3Xd
         pWfizOj2vGLohZEG6sOXVzyZ7OYioYSgk3NSX08FBH05oO7dlrZ+qyRisVGpgIQKdSGJ
         fpb1iJdWtA6z73/jeas85XnJ8TvrT7U/QVRwQqozSJIDwFbC3oot7df0Iawmz9Rt41LR
         GWleEp6lqM9xBcrYUDlMkx2smKz6cKegNbnvTAIBeCGvTl5BdGQ7HWbWioYys+D7xM+X
         bE7g==
X-Gm-Message-State: APjAAAUumA+jobEmeSoULJyTGPo/W2wNMzhJ9fQGDLkRSsCdQas87eyE
        6EQiPDJZNNqW7XDXeYEsdII=
X-Google-Smtp-Source: APXvYqzPPf2dUoFRMdmXRU3rc61sMZX9+mXPDGqgD+nEdBzoVzjxT08cS8auaqYT6Wxdf0dEv0wl+g==
X-Received: by 2002:aa7:9524:: with SMTP id c4mr19821409pfp.225.1567183703055;
        Fri, 30 Aug 2019 09:48:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q4sm6952325pff.183.2019.08.30.09.48.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 09:48:22 -0700 (PDT)
Date:   Fri, 30 Aug 2019 09:48:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/6] dt-bindings: watchdog: Convert Allwinner
 watchdog to a schema
Message-ID: <20190830164821.GB7911@roeck-us.net>
References: <20190821143835.7294-1-mripard@kernel.org>
 <20190821143835.7294-2-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821143835.7294-2-mripard@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 04:38:31PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner SoCs have a watchdog supported in Linux, with a matching
> Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> 
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes from v1:
>   - Use generic watchdog schema
>   - Use unevaluatedProperties instead of additionalProperties
> ---
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 48 +++++++++++++++++++
>  .../bindings/watchdog/sunxi-wdt.txt           | 22 ---------
>  2 files changed, 48 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> new file mode 100644
> index 000000000000..dc7553f57708
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/allwinner,sun4i-a10-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 Watchdog Device Tree Bindings
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun4i-a10-wdt
> +      - const: allwinner,sun6i-a31-wdt
> +      - items:
> +          - const: allwinner,sun50i-a64-wdt
> +          - const: allwinner,sun6i-a31-wdt
> +      - items:
> +          - const: allwinner,sun50i-h6-wdt
> +          - const: allwinner,sun6i-a31-wdt
> +      - items:
> +          - const: allwinner,suniv-f1c100s-wdt
> +          - const: allwinner,sun4i-a10-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    wdt: watchdog@1c20c90 {
> +        compatible = "allwinner,sun4i-a10-wdt";
> +        reg = <0x01c20c90 0x10>;
> +        timeout-sec = <10>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> deleted file mode 100644
> index e65198d82a2b..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Allwinner SoCs Watchdog timer
> -
> -Required properties:
> -
> -- compatible : should be one of
> -	"allwinner,sun4i-a10-wdt"
> -	"allwinner,sun6i-a31-wdt"
> -	"allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> -	"allwinner,sun50i-h6-wdt","allwinner,sun6i-a31-wdt"
> -	"allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
> -- reg : Specifies base physical address and size of the registers.
> -
> -Optional properties:
> -- timeout-sec : Contains the watchdog timeout in seconds
> -
> -Example:
> -
> -wdt: watchdog@1c20c90 {
> -	compatible = "allwinner,sun4i-a10-wdt";
> -	reg = <0x01c20c90 0x10>;
> -	timeout-sec = <10>;
> -};
> -- 
> 2.21.0
> 
