Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA8647364B
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Dec 2021 21:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243044AbhLMUzA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Dec 2021 15:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242827AbhLMUy7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Dec 2021 15:54:59 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08A9C06173F
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Dec 2021 12:54:59 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id u74so24770124oie.8
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Dec 2021 12:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jguWMiGl6ZGi+BO1IebD5fWZun+vWwss72hQqPIFu5I=;
        b=Opmh49RT26HjFCsKMvJlWpHjFxLA8ox38iEp02a9sdd63FM9VjoxEBuUor++TAND4c
         GsggUST7S009eJOKj+d/TUjQrhPG1f3cpnATtz6cFK05iT6Yom5jIHgrNojUqIV6SeBb
         iFZSI3nUtKr3hK1BP6UgJlefajIWVuJnauVhRKwx5G6mTTEfr6339lBeWWXo7RcDfY3M
         DzM/OHkKzDRkUO6YUgGmRXPPdyrp7TAyr75DJRjuvXUgP6ORXLUHBPZvNJjubi8PdbHe
         29bfgIRhydPNta0lAy2+ZUMMjIf3SLA6usGjGiWLxeEGA4Ks4XI+wUtlo4l+phfvlwSC
         ILUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jguWMiGl6ZGi+BO1IebD5fWZun+vWwss72hQqPIFu5I=;
        b=nsnL6e6lowczpLbOcogrAMHQ9ToiSGixMTlxuoDpr7CujWcc7M2qHQJw2+c3rGIXHJ
         +wTl4rRZypPljM6QntbKqbiwy4zJJRJyPFIo7HUL5Q5LcYT2frxGkm6ibC247DfI4SWo
         qApUUOOuWySmi2tQ6lwhsQHxj1tigFlV2an9UPkO85kRzoFKI7f7j+Mb1Arzg35D8dVh
         7SVY5ABzHtWY8Xb0t/i5In2VoJe2xd625sLKY3lrhhJSkjQ74UML8kCVX9htqYEjbfn4
         Cc8fidJ8tl77Q+qisFBPb0Q6chbT/1jggQZ7CPw2+CwOY465r38wEECcwhgAieEDdsgU
         WNsg==
X-Gm-Message-State: AOAM533DUsE2yhORTmmV2tBUVWl29/4owDAbt8wVnkawrKG32wSaFFDv
        hx4DU+Ulm5NfNPhQSB+cQHt/2w==
X-Google-Smtp-Source: ABdhPJxsuFYML0R2VTHGQUbcR534UCDJetQulo6sC0GB0fdTX8iM2g+AUUisWK/E7vMRyPdGND9Aog==
X-Received: by 2002:a05:6808:1802:: with SMTP id bh2mr920360oib.142.1639428898635;
        Mon, 13 Dec 2021 12:54:58 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j187sm2822648oih.5.2021.12.13.12.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:54:58 -0800 (PST)
Date:   Mon, 13 Dec 2021 12:56:15 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: improve QCOM compatible parsing
 for modern chips
Message-ID: <YbezbxxFvfDQqaEB@ripper>
References: <20211213203710.122708-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213203710.122708-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon 13 Dec 12:37 PST 2021, David Heidelberg wrote:

> Parse compatible as expected for modern QCOMs.
> 
> Fixes warnings as:
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: watchdog@17980000: compatible: ['qcom,apss-wdt-sdm845', 'qcom,kpss-wdt'] is too long
>         From schema: Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: watchdog@17980000: compatible: Additional items are not allowed ('qcom,kpss-wdt' was unexpected)
>         From schema: Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/watchdog/qcom-wdt.yaml           | 33 +++++++++++--------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index ba60bdf1fecc..71cd392d298b 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -14,20 +14,25 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,apss-wdt-qcs404
> -      - qcom,apss-wdt-sc7180
> -      - qcom,apss-wdt-sc7280
> -      - qcom,apss-wdt-sdm845
> -      - qcom,apss-wdt-sdx55
> -      - qcom,apss-wdt-sm8150
> -      - qcom,kpss-timer
> -      - qcom,kpss-wdt
> -      - qcom,kpss-wdt-apq8064
> -      - qcom,kpss-wdt-ipq4019
> -      - qcom,kpss-wdt-ipq8064
> -      - qcom,kpss-wdt-msm8960
> -      - qcom,scss-timer
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,apss-wdt-qcs404
> +              - qcom,apss-wdt-sc7180
> +              - qcom,apss-wdt-sc7280
> +              - qcom,apss-wdt-sdm845
> +              - qcom,apss-wdt-sdx55
> +              - qcom,apss-wdt-sm8150
> +          - const: qcom,kpss-wdt
> +      - items:
> +          - enum:
> +              - qcom,kpss-wdt
> +              - qcom,kpss-timer
> +              - qcom,kpss-wdt-apq8064
> +              - qcom,kpss-wdt-ipq4019
> +              - qcom,kpss-wdt-ipq8064
> +              - qcom,kpss-wdt-msm8960
> +              - qcom,scss-timer
>  
>    reg:
>      maxItems: 1
> -- 
> 2.33.0
> 
