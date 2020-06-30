Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9AF920FDCE
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729770AbgF3Uh5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729704AbgF3Uhz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:37:55 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0ED5C03E979;
        Tue, 30 Jun 2020 13:37:54 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id o22so4947321pjw.2;
        Tue, 30 Jun 2020 13:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vik1wDMns4lHXvZGrHxJ8AhRkA4fYb5uyHi++Y4drwk=;
        b=HZhRENCMeqqegrLyoxvhQutm1GVjjQNldim8H8To9sUK4VK1oWZahUq2Xx6LLQugiV
         dK7a8xKc4SaMxPBuRCX42qHkXPoBzzv91sadC5A5/vgBw4IaX/yDmvIu1T83Hf5r2U01
         rIGJriM7XOIgHN6oARwT11Mli76jnKkGrKS2KSg8azZkdmx8h56dN9W7YMJB1KDYaqZP
         s591dEgU0STrc3aL3/f/7qHJ1d3PyftYSPYHffChphin/md7+hvyl30VtZubKabv9RIt
         hRaiK7riIycPehcuPzm3sZeVo9lESYJJ2xnOoNelO9i7YcqhQ7MvyZNIHBuXjiDsOOEI
         lgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vik1wDMns4lHXvZGrHxJ8AhRkA4fYb5uyHi++Y4drwk=;
        b=oUZOsGrJspjpZotYEBra47A3FqNGw1GcA5QQ1YwkuAcTBENSsASaksyQEw13tlcYzr
         rzBkooyFGEOxhhL91dz2UQhMFdEn+/UPH6JaBNMeItc+Djsesf5tyvN1dFUwBiLUgSEu
         +gAPt2PMi3ZsyFzh9+84hVcpvswMnEcOBvKkCvnJC0b2cDTbom4JfrN3tNVatKCwAhMS
         lQ2fOQ2aiOw83aXb5u67GtkZ/9g2tipZ8uwiO8x81Hn/hTEQwkVv6NGO2TT3UD3qL1Vz
         Tk5eRcp9Vj+C0xcqD9j3DYAUJu1Ehl5Wg1Q5I5o+RZgcWrB9EwiEIfJ5A6guN/dHX2s3
         x89A==
X-Gm-Message-State: AOAM530eDQzKY2rMcEARenBh2AMWAGfJVFY2Ark1GaqZykpU/g01Ij92
        1hfEZ8sR+IIioaaeT9P0mQ4=
X-Google-Smtp-Source: ABdhPJwDv8rmd9PxDGb5EKo1dKzsyH4tuN76FCWm9Uv2Cw1ODUe85eR8mvo86Iveb22sEm+F16siiA==
X-Received: by 2002:a17:90a:987:: with SMTP id 7mr22502303pjo.186.1593549473444;
        Tue, 30 Jun 2020 13:37:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f2sm2397939pfb.184.2020.06.30.13.37.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 13:37:52 -0700 (PDT)
Date:   Tue, 30 Jun 2020 13:37:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCHv3 1/2] dt-bindings: watchdog: Convert QCOM
 watchdog timer bindings to YAML
Message-ID: <20200630203752.GA20330@roeck-us.net>
References: <cover.1593112534.git.saiprakash.ranjan@codeaurora.org>
 <77b47aad9d17cb4ec8359bdbbb30c33d818117e6.1593112534.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77b47aad9d17cb4ec8359bdbbb30c33d818117e6.1593112534.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 26, 2020 at 12:59:04AM +0530, Sai Prakash Ranjan wrote:
> Convert QCOM watchdog timer bindings to DT schema format using
> json-schema.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 ------------
>  .../bindings/watchdog/qcom-wdt.yaml           | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> deleted file mode 100644
> index 41aeaa2ff0f8..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Qualcomm Krait Processor Sub-system (KPSS) Watchdog
> ----------------------------------------------------
> -
> -Required properties :
> -- compatible : shall contain only one of the following:
> -
> -			"qcom,kpss-wdt-msm8960"
> -			"qcom,kpss-wdt-apq8064"
> -			"qcom,kpss-wdt-ipq8064"
> -			"qcom,kpss-wdt-ipq4019"
> -			"qcom,kpss-timer"
> -			"qcom,scss-timer"
> -			"qcom,kpss-wdt"
> -
> -- reg : shall contain base register location and length
> -- clocks : shall contain the input clock
> -
> -Optional properties :
> -- timeout-sec : shall contain the default watchdog timeout in seconds,
> -                if unset, the default timeout is 30 seconds
> -
> -Example:
> -	watchdog@208a038 {
> -		compatible = "qcom,kpss-wdt-ipq8064";
> -		reg = <0x0208a038 0x40>;
> -		clocks = <&sleep_clk>;
> -		timeout-sec = <10>;
> -	};
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> new file mode 100644
> index 000000000000..5448cc537a03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Krait Processor Sub-system (KPSS) Watchdog timer
> +
> +maintainers:
> +  - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kpss-timer
> +      - qcom,kpss-wdt
> +      - qcom,kpss-wdt-apq8064
> +      - qcom,kpss-wdt-ipq4019
> +      - qcom,kpss-wdt-ipq8064
> +      - qcom,kpss-wdt-msm8960
> +      - qcom,scss-timer
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
> +    watchdog@208a038 {
> +      compatible = "qcom,kpss-wdt-ipq8064";
> +      reg = <0x0208a038 0x40>;
> +      clocks = <&sleep_clk>;
> +      timeout-sec = <10>;
> +    };
