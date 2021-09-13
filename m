Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF77A408391
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Sep 2021 06:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhIMEee (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Sep 2021 00:34:34 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57172 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhIMEee (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Sep 2021 00:34:34 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18D4X234102717;
        Sun, 12 Sep 2021 23:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631507582;
        bh=69WhAtP/XV2lc3VDriRBaF77eUBDt+20lz9YeiUgYXo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=V/Ed3+V9Mfi4Lo3Yk2sjcpbZ98c+KrgEXKFp4pfczIfLPZ4SqyCaNnT7g9xlGmBYY
         jn3omaqTNz1HQ4QC+abxwIy8wheZ0FpCeGCEvU0S0w9bhLooxDUjoVJP9U2oQxyhE4
         MKoCk7026w/mywpXI9DyDjK4G6eLhFWiUWQXhoX4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18D4X2Qj005183
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 12 Sep 2021 23:33:02 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sun, 12
 Sep 2021 23:33:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sun, 12 Sep 2021 23:33:01 -0500
Received: from [10.250.232.51] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18D4WuO2118326;
        Sun, 12 Sep 2021 23:32:58 -0500
Subject: Re: [PATCH] dt-bindings: More use 'enum' instead of 'oneOf' plus
 'const' entries
To:     Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>
References: <20210910165153.2843871-1-robh@kernel.org>
From:   Aswath Govindraju <a-govindraju@ti.com>
Message-ID: <b56ee1c2-ce2d-a3ed-ff54-7b0d956f959a@ti.com>
Date:   Mon, 13 Sep 2021 10:02:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910165153.2843871-1-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/09/21 10:21 pm, Rob Herring wrote:
> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
> is more concise and yields better error messages.
> 
> Fix a couple more cases which have appeared.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Aswath Govindraju <a-govindraju@ti.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml          |  8 ++++----
>  .../devicetree/bindings/spi/omap-spi.yaml          |  6 +++---

For omap-spi:

Acked-by: Aswath Govindraju <a-govindraju@ti.com>

>  .../bindings/watchdog/maxim,max63xx.yaml           | 14 +++++++-------
>  3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index 4265399bb154..c851770bbdf2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -14,10 +14,10 @@ allOf:
>  
>  properties:
>    compatible:
> -    oneOf:
> -      - const: qcom,dsi-phy-7nm
> -      - const: qcom,dsi-phy-7nm-8150
> -      - const: qcom,sc7280-dsi-phy-7nm
> +    enum:
> +      - qcom,dsi-phy-7nm
> +      - qcom,dsi-phy-7nm-8150
> +      - qcom,sc7280-dsi-phy-7nm
>  
>    reg:
>      items:
> diff --git a/Documentation/devicetree/bindings/spi/omap-spi.yaml b/Documentation/devicetree/bindings/spi/omap-spi.yaml
> index e55538186cf6..9952199cae11 100644
> --- a/Documentation/devicetree/bindings/spi/omap-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/omap-spi.yaml
> @@ -84,9 +84,9 @@ unevaluatedProperties: false
>  if:
>    properties:
>      compatible:
> -      oneOf:
> -        - const: ti,omap2-mcspi
> -        - const: ti,omap4-mcspi
> +      enum:
> +        - ti,omap2-mcspi
> +        - ti,omap4-mcspi
>  
>  then:
>    properties:
> diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> index f2105eedac2c..ab9641e845db 100644
> --- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> @@ -15,13 +15,13 @@ maintainers:
>  
>  properties:
>    compatible:
> -    oneOf:
> -      - const: maxim,max6369
> -      - const: maxim,max6370
> -      - const: maxim,max6371
> -      - const: maxim,max6372
> -      - const: maxim,max6373
> -      - const: maxim,max6374
> +    enum:
> +      - maxim,max6369
> +      - maxim,max6370
> +      - maxim,max6371
> +      - maxim,max6372
> +      - maxim,max6373
> +      - maxim,max6374
>  
>    reg:
>      description: This is a 1-byte memory-mapped address
> 

