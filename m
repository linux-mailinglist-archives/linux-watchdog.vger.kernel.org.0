Return-Path: <linux-watchdog+bounces-218-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB380BBE5
	for <lists+linux-watchdog@lfdr.de>; Sun, 10 Dec 2023 16:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A1A51F20FBF
	for <lists+linux-watchdog@lfdr.de>; Sun, 10 Dec 2023 15:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E074E15AE6;
	Sun, 10 Dec 2023 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTTXU7oC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFB9F2;
	Sun, 10 Dec 2023 07:20:42 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d2f1cecf89so7478365ad.1;
        Sun, 10 Dec 2023 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702221641; x=1702826441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I5BNZyJBLBAtxYbKcnrAr3C7HJ9Y4YDOmJvXVGJ4zvs=;
        b=hTTXU7oCApjtvRtbP079vrYMOwlrpivqYyPWZH8VTL6tUv9KUaF/IqV4IEPAlJX9Fs
         spPqaOvn032psliB3sbWgmS6vowcyth8/FaZWLQEA8uKMoV9QKWNeK1Y7ZeTMivWGpkF
         xSiMg/fUpZNruXsgbvDVrcXAdSIKFREGmosoK9wd1BfGeIAo/aRh2yyAUby0hGUgAKRS
         wMo+qkM2u14au0OxHOKjqoTDTPA4jBQmxdmdZ0U+Paeitmrt10o5oAW3jcgfJteq0mpR
         sSdvGoCl0o0+43JHNE+RlAIwCVDbiGvs7ZnRy4TOlBUccLvGWuyZeWzdGXsMr3eKyMeN
         juSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702221641; x=1702826441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5BNZyJBLBAtxYbKcnrAr3C7HJ9Y4YDOmJvXVGJ4zvs=;
        b=TDgLFAYv2h6rvLU2vKkZEBQq+TSd43M3Swx70JuOgi7aiKweF/Aj4w4eAZE5/bcVCk
         MQQwWV9fNnIuOxrAeNuJ4ZV3mvAkbH0JzFqnDhd65SAwsoCxNPPUoji6g6eZG5U2N7Fh
         xl8ORiHRm7iDdh4QDyi1cH+i+hiBL8nmwZm3F5k6h5f41Xf7GwPpi+6BZHLrK86clQzm
         +4altZInKUxF/HBkRp655eFKljeo6WEicWR+CbIT9K02ZxMjTbt815TfsPawV/yCx7pw
         8MdGucZ/CjFGXotdbgctTH67bPnIBq0oXXzacO1EjFXIMi0tpKpOMcTZZPl3wfUt+8cl
         ik/w==
X-Gm-Message-State: AOJu0Yx9qY9Z0hoyzGoCp/8QU5Pu6mT9JbLYcATIaKkH5wu9QQUNwpvU
	UBcH0FQZwbBXB0cRLpg5romqoFV4yxI=
X-Google-Smtp-Source: AGHT+IGs6gycjkov1g0J3a26ISu7HZqUmgavgCSTtH5V5n/zkC9H1FbUPhxFQuoc2PgCAUQ1XbISPw==
X-Received: by 2002:a17:902:c40d:b0:1d0:6ffd:837d with SMTP id k13-20020a170902c40d00b001d06ffd837dmr1397860plk.136.1702221641464;
        Sun, 10 Dec 2023 07:20:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001d0696e9237sm4867108pls.118.2023.12.10.07.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 07:20:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0edea4d9-a498-420b-b01c-bca51c619fb7@roeck-us.net>
Date: Sun, 10 Dec 2023 07:20:39 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
 Steve Twiss <stwiss.opensource@diasemi.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231210134717.94020-1-biju.das.jz@bp.renesas.com>
 <20231210134717.94020-3-biju.das.jz@bp.renesas.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231210134717.94020-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/23 05:47, Biju Das wrote:
> The DA9061 watchdog is identical to DA9062 watchdog, so no driver changes
> are required. The fallback compatible string "dlg,da9062-watchdog" will be
> used on DA9061 watchdog.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v4->v5:
>   * Added Rb tag from Geert and Ack from Conor
>   * Drop items and just use enum as it is easier to read for compatibles.
>   * Retained the tags as it is trivial change.
> v3->v4:
>   * Dropped comment for d9061 watchdog fallback.
>   * Replaced enum->const for dlg,da9061-watchdog and its fallback.
> v2->v3:
>   * No change
> v2:
>   * New patch
> ---
>   .../bindings/watchdog/dlg,da9062-watchdog.yaml           | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> index f058628bb632..9192315e559d 100644
> --- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> @@ -14,9 +14,12 @@ allOf:
>   
>   properties:
>     compatible:
> -    enum:
> -      - dlg,da9061-watchdog
> -      - dlg,da9062-watchdog
> +    oneOf:
> +      - enum:
> +          - dlg,da9062-watchdog
> +      - items:
> +          - const: dlg,da9061-watchdog
> +          - const: dlg,da9062-watchdog
>   
>     dlg,use-sw-pm:
>       type: boolean


