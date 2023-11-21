Return-Path: <linux-watchdog+bounces-10-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD87F2A73
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Nov 2023 11:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A1DAB213C9
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Nov 2023 10:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D24882B;
	Tue, 21 Nov 2023 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k88kGO99"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E46B9;
	Tue, 21 Nov 2023 02:32:34 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BFF2066072F1;
	Tue, 21 Nov 2023 10:32:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700562753;
	bh=6QRCpa+LpHtt2e+x4B/bsyiQHgeK35mHv9WQjcBnRjQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=k88kGO99Z3VLxoAXkOj+GxGNP0Tb/RSOiUBHLx6iwWzYROeFzsjZxFK450FWUuBte
	 Z5xbwcbOATBnOl9VnDU8SF2VoVAe1W3yq+mPMdGpOrrfDszxxXrPuTC4iTBHakI1WV
	 iyGICGqNcsL02NkiVR2hjbk+TwZIvGtKbwsyCI0o5CkU+/8WzHXm0j2I8I5gOzBbnr
	 F4FEzlLRMTrB9TKSHFQvjz1j84t59bZhhGRLjvySkfrOyPQp3mwUaZH2fzXEB7+Dp7
	 mcGN5D3lIg5ReDQxpyE6l6+sUcfxDi58qJCVLn4PYe9l+94OY7Wa7r2rvUQEigIQ7M
	 YIbwtv5wVyKKA==
Message-ID: <318d602b-12ba-4af8-9cb3-24498559c254@collabora.com>
Date: Tue, 21 Nov 2023 11:32:32 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT7988 watchdog and toprgu
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <6478f8d2af59736d23a96b52891bb541de33870d.1700504385.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6478f8d2af59736d23a96b52891bb541de33870d.1700504385.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/11/23 19:21, Daniel Golle ha scritto:
> Add binding description for mediatek,mt7988-wdt.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v4: no changes
> v3: no changes
> v2: Drop adding include/dt-binding/mt7988-resets.h as that header is not
>      actually a binding header.
> 
>   Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index cc502838bc398..8d2520241e37f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>             - mediatek,mt6735-wdt
>             - mediatek,mt6795-wdt
>             - mediatek,mt7986-wdt
> +          - mediatek,mt7988-wdt
>             - mediatek,mt8183-wdt
>             - mediatek,mt8186-wdt
>             - mediatek,mt8188-wdt



