Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22173017AB
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 19:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbhAWSgv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 13:36:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbhAWSgt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 13:36:49 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C753C0613D6;
        Sat, 23 Jan 2021 10:36:09 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id q205so10009781oig.13;
        Sat, 23 Jan 2021 10:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ItoMLXE2qEE4kruDNMdVDPu9neEQLYaZYrZXcHLnvn4=;
        b=i554GOlBBGDXstaVUKaUwKdjOrjOOTJEvVyZ73dfJ9it/FF3RP2E//KBg1RTdlrfNo
         a+IPsEBD2HlyfFyu228qDOLDnG/nXtqq34rawAEypmzYWxXnpOaLQE2NEB7w4VIazLFX
         4B/gUvFd2PCr2/IE3Zs1Ezc3q90c0jhi2rTu8HwrulrXDePPm38/pgi3ROwgEi9/Wti9
         UnaI6WaLGAOSe4jBzU/VEnX60eyfbLstdJlDRLc+QVBgvmKNrtrsSucQSdPmOcWrh3VR
         srN9I1fSaQNhaRfpXGmVSRaG/7vkFsFide5wToOX2yYlpAs15xvRhRzB/DgR+I57BaFE
         1P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ItoMLXE2qEE4kruDNMdVDPu9neEQLYaZYrZXcHLnvn4=;
        b=COri4QfBQAWzeBsfYUAOrxeZoBDYv2aU+00jyAKc2Q2puSl+8QVe16q0PXjP4SKCzn
         pPHpBzm+r7uv4YreVLaPkqrYBxs8fan8n3EnpWH79EFTTdPkCPg/V9gFOuOStaqJV03Q
         cRV6ToAIAZthSTdK9zUD8wB6sY9XEF/PTpK3X9NoMXOOzI4CyjVIo+agqTEf86csAYv5
         NOtEO06s1U1lc6T453WDhd2lYD7xcfMKvfYcyyB5+AcbqjXpLYDvj5NHHJ+kOcUPAw3U
         PNZD8tJZfXKKDoEyQqm36zGmiYJZl43ZbvfJjvorxiVYK4tjvCZs8sAWq5hDsSSJrXSh
         YR7g==
X-Gm-Message-State: AOAM533t0lt4ZWoG0fEqrWRuewrpzV/iLtoNygI2f3wfqn9KIVhKwgEx
        DksYUlzHPEflMJW4N8NncQI=
X-Google-Smtp-Source: ABdhPJwKpCizBfiTvJfhVhw0EIuISprqmUO/0Er7f8LTpeU7bHbjQAAch0rtr2m3FhZraSv+NPy+ug==
X-Received: by 2002:aca:c394:: with SMTP id t142mr1796144oif.44.1611426968802;
        Sat, 23 Jan 2021 10:36:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f20sm2446310otl.21.2021.01.23.10.36.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 10:36:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 10:36:07 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: watchdog: Add binding for Qcom SDX55
Message-ID: <20210123183607.GA60896@roeck-us.net>
References: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
 <20210118051005.55958-5-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118051005.55958-5-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jan 18, 2021 at 10:40:02AM +0530, Manivannan Sadhasivam wrote:
> Add devicetree binding for watchdog present in Qcom SDX55 platform.
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-watchdog@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 8e3760a3822b..b8e4118945a0 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -18,6 +18,7 @@ properties:
>        - qcom,apss-wdt-qcs404
>        - qcom,apss-wdt-sc7180
>        - qcom,apss-wdt-sdm845
> +      - qcom,apss-wdt-sdx55
>        - qcom,apss-wdt-sm8150
>        - qcom,kpss-timer
>        - qcom,kpss-wdt
