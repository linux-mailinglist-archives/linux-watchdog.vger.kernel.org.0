Return-Path: <linux-watchdog+bounces-278-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEBD80F3AE
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 17:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A39A5B20765
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 16:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5067A23B;
	Tue, 12 Dec 2023 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU3Wsj/t"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43CDB7;
	Tue, 12 Dec 2023 08:55:17 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b9e07690ccso3568853b6e.3;
        Tue, 12 Dec 2023 08:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702400117; x=1703004917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR8CM1l7mSjgUX5ysimVK0uN3n/6IwTT58FYQEEeKZg=;
        b=NU3Wsj/tExHYpbepLmzHLgVMs1ADmd1ox8iu53AP93W8wrkLE50dkmjNzB7r9BWpHp
         z2pb/IGUVgdIdbrhnmRBiy4BqARveJkXvKPWprGIBOE4grAQXXi3zCcYwq2TvG8muToC
         oSePfNRnkr+yStsOvkQVT0k62m2+4wvyTUJuJo6vWxzryun9K9aiHV9E78rX2rs2d7aB
         46vSXbyp//i1JW5xa3B8Ni8UUal0Xam8zzKxRlGyBETMMtzQunwZZ4/nIJczHyR730Go
         MMiUebG7K0TpRrzqykjC7vZVXBXz1QNBsAh5DKl2tvfqoV8iUl31Jq/w+zHpJIBthbco
         FP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400117; x=1703004917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR8CM1l7mSjgUX5ysimVK0uN3n/6IwTT58FYQEEeKZg=;
        b=KqH78ZOYImIimhPH8LCKZd7zlLD0xfCl9hbqHmDLrjMReDTcFa8cKpNO3CLNnwQ7XX
         JS75n9X0d3tjG+IKgcJwh8ytdJpFfmmNPLhj1BDyFALQYfOKMYfjIM6TX3tgjTkQWj97
         TDKAJ6NNQQehERwaIUKjbtvkvRs/AiZa1zpL0HBGYJiqqOc+ubeafkXfe1YV0VjzJ68f
         0UsSMEaJGo7cKGkGQntf06AhEcNa8x264ijwoXjBX9WHA48LolZyLTGh9HtCjbE/NMUy
         6KJ8mhcApLofdzc+4YfSNEaPAWgoduqy8zNzJOzgsfR8IIqJMxv88UfR+K+6M1VHgyFc
         klWQ==
X-Gm-Message-State: AOJu0Yy8zrjPNUfEd/DNTvGDvPTsje++LBMlGLyhzKq9ayptQRnKFwnC
	b9wITqc93NEI+1/yxuxcjaA=
X-Google-Smtp-Source: AGHT+IEx+wh7QtzF3FIi6gsB7OMnp5P8qxzEDYPpvY5u2XUrX1jUBOgX8clMwoVfj3aqq6UQzLghvw==
X-Received: by 2002:a05:6808:1492:b0:3b9:e317:ec55 with SMTP id e18-20020a056808149200b003b9e317ec55mr6844124oiw.44.1702400117042;
        Tue, 12 Dec 2023 08:55:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a23-20020a056808099700b003b9f6ecb222sm1936175oic.6.2023.12.12.08.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 08:55:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Dec 2023 08:55:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT7988 watchdog and toprgu
Message-ID: <17ece724-95d7-48d6-a95a-41c667df9fd7@roeck-us.net>
References: <e26a98fd0b7b7b431922405732275bac01eaf220.1699890006.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e26a98fd0b7b7b431922405732275bac01eaf220.1699890006.git.daniel@makrotopia.org>

On Mon, Nov 13, 2023 at 03:43:24PM +0000, Daniel Golle wrote:
> Add compatible mediatek,mt7988-wdt.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2: Drop adding include/dt-binding/mt7988-resets.h as that header is not
>     actually a binding header.
> 
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index cc502838bc398..8d2520241e37f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>            - mediatek,mt6735-wdt
>            - mediatek,mt6795-wdt
>            - mediatek,mt7986-wdt
> +          - mediatek,mt7988-wdt
>            - mediatek,mt8183-wdt
>            - mediatek,mt8186-wdt
>            - mediatek,mt8188-wdt
> -- 
> 2.42.1

