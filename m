Return-Path: <linux-watchdog+bounces-1670-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1898D969D10
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 14:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A0D1F263E1
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 12:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620A31C987F;
	Tue,  3 Sep 2024 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQQFb0/3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5511C986D
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Sep 2024 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725365427; cv=none; b=SiMKjQewjYREo2fvR4MbGy/DiNLUbXQ28Ux78wv+W5HmVeHd76FOBKT/UVh39pHQO8OmrmBN2Y8Ja44D7/yhddPlssunL6xsWQi/svK2GOsRDLRbKgOLpjcqP8heICxLTkxoDOCRWZVGGkFIt/ZM7nCbrHaokvusRISSCB8kfeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725365427; c=relaxed/simple;
	bh=znd28+CqTJ4ghTxFrhF5A7Pb6/pnoUS7WGw5WGe/JFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prPJmwSPMetjEd+HoR4/4neLTWDul/yVbSKZgHY6aRMCOiNEKtq/A6ZOSarfL3c+XGcsAz3QBt6u7oAJYyck6BC2xaiN33D02PwJCN+AfsYfLD4RTacNIMY35kQvPWIwMDMqFaJOQiqgquiQGqZaV2R3ficWN6+9Q8gMfnK6pgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQQFb0/3; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e116d2f5f7fso4602283276.1
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Sep 2024 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725365424; x=1725970224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4An20D90YPhjOzkwF+Hg8QYD3SJoIXYWy8cZWiHm4HE=;
        b=SQQFb0/3adlLAu/pdNV9dt0/K4hdwnFZS1vR5KUwk/lQY1jXbaPD5o7B+DqPVpWI0f
         CtFcltEL1sm1k/gaGds7efULROhFaLIM2tAoGBjQHbxcrqDJDveMsS4z1UbLUy/Js0aD
         j3B7mqCY6w+HZKjlMmjqw5yXDop3IJIvdx5BCQkI5nez0BMN2Qc5msFI74KTzAdv0mMh
         VxursKcGeYWsgXgmRy/LOfOG4xyBxOA9swXLcUCxJePCGRgwqH3zG5q1Chnxk8cxgpLG
         dEpfVlS/jygBW9v4o6HvQ429OSyO/iOVJbS2HVkfENZIHqA6+t+NJTGGePVIJxJrmV1Y
         a//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725365424; x=1725970224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4An20D90YPhjOzkwF+Hg8QYD3SJoIXYWy8cZWiHm4HE=;
        b=TATz1/OTizGo7K007gPyHhO4Q5+qF+JvNQrBJCKzErNSzFEMfGMJQbeyByXBMmcxXZ
         exIaGfP0MQiBoAyZCuHL3I0DWaBjv15byIPj9iJcoDRZqaVa9Tyra6aS+7hLROl9UQq8
         OxPPsX9qeAap7FqaQiS/AKmwxoLkFaDhk06HOs6pLMRNUW6zPrtJbw3wpNCEoyZahTtN
         hvs7FyyX8qNaWygLnDDH+N/fUwL0gBSPnNcEwyX5RNGQXw8UtkyV/nkZoxN08qypcMzf
         hCD7vwMPBQlpFDAfb2Pa/bsZsApFi8vWBaMpbcU314CQlfQUrFXR91fQxvFE8sFpFKb7
         GVHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyvN5aw+dT34EJTBsOu538eooGSLeWm6FPijVmXBpoZqgc1BSXNI2fZW3IurJOTgKcvGeBVliqCPCGhI1dLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo1o1Qon4smiQH2iNRnvnfTMlRV5YsDNJ1cXqkFNO/FFVKb5nc
	ncHzSQ1GsQJN9Q7Lewvr0h2BBWt5wkEELAai2b1cqIijQ3BB2zr6HG+hDV4pGvSZX0gmgZM5U4g
	zuoDAF6xzwinTQc9n2aTKPwDl36yaPvIiSbnPEg==
X-Google-Smtp-Source: AGHT+IFX1MKd7/CniZfZMCZVstNgR+E8MEOhVGOhXHV1ehVIWPMeYpmWq3hGrzVCf5n6CzgXPAzIGrO6KiCqLNwVX0w=
X-Received: by 2002:a05:6902:1002:b0:e03:c692:c8b5 with SMTP id
 3f1490d57ef6-e1a7a1d20camr11923156276.19.1725365424176; Tue, 03 Sep 2024
 05:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828151028.41255-1-detlev.casanova@collabora.com> <01020191998a55a9-697c3a2c-237e-49bb-b3dd-45762198d74f-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020191998a55a9-697c3a2c-237e-49bb-b3dd-45762198d74f-000000@eu-west-1.amazonses.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Sep 2024 14:09:47 +0200
Message-ID: <CAPDyKFoJoqwNTKvpK93QtK1wA9vzVUTzCrP32s_HEZcrujN2Mg@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] dt-bindings: mmc: Add support for rk3576 eMMC
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Muhammed Efe Cetin <efectn@protonmail.com>, Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, 
	Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Elon Zhang <zhangzj@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
	Yifeng Zhao <yifeng.zhao@rock-chips.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2024 at 17:11, Detlev Casanova
<detlev.casanova@collabora.com> wrote:
>
> The device is compatible with rk3588, so add an entry for the 2
> compatibles together.
>
> The rk3576 device has a power-domain that needs to be on for the eMMC to
> be used. Add it as a requirement.
>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This one doesn't apply as I have other changes queued up.

Can you please re-base and post a new version based upon
git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next.

Kind regards
Uffe

> ---
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 38 +++++++++++++------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index 4d3031d9965f..aff8106ec361 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -10,18 +10,19 @@ maintainers:
>    - Ulf Hansson <ulf.hansson@linaro.org>
>    - Jisheng Zhang <Jisheng.Zhang@synaptics.com>
>
> -allOf:
> -  - $ref: mmc-controller.yaml#
> -
>  properties:
>    compatible:
> -    enum:
> -      - rockchip,rk3568-dwcmshc
> -      - rockchip,rk3588-dwcmshc
> -      - snps,dwcmshc-sdhci
> -      - sophgo,cv1800b-dwcmshc
> -      - sophgo,sg2002-dwcmshc
> -      - thead,th1520-dwcmshc
> +    oneOf:
> +      - items:
> +          - const: rockchip,rk3576-dwcmshc
> +          - const: rockchip,rk3588-dwcmshc
> +      - enum:
> +          - rockchip,rk3568-dwcmshc
> +          - rockchip,rk3588-dwcmshc
> +          - snps,dwcmshc-sdhci
> +          - sophgo,cv1800b-dwcmshc
> +          - sophgo,sg2002-dwcmshc
> +          - thead,th1520-dwcmshc
>
>    reg:
>      maxItems: 1
> @@ -38,7 +39,6 @@ properties:
>        - description: block clock for rockchip specified
>        - description: timer clock for rockchip specified
>
> -
>    clock-names:
>      minItems: 1
>      items:
> @@ -48,6 +48,9 @@ properties:
>        - const: block
>        - const: timer
>
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      maxItems: 5
>
> @@ -63,7 +66,6 @@ properties:
>      description: Specify the number of delay for tx sampling.
>      $ref: /schemas/types.yaml#/definitions/uint8
>
> -
>  required:
>    - compatible
>    - reg
> @@ -71,6 +73,18 @@ required:
>    - clocks
>    - clock-names
>
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-dwcmshc
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 1
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.46.0
>

