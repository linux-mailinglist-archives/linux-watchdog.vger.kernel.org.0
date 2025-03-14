Return-Path: <linux-watchdog+bounces-3106-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 800DCA61726
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 18:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B903517DD40
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 17:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D0220409D;
	Fri, 14 Mar 2025 17:12:44 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1FB1FDA7A;
	Fri, 14 Mar 2025 17:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741972364; cv=none; b=JL/b0z8xN1ASncv39sv4dczRPxO14qNb+pCi97fkfMJOerpUFJsqyBx4dgs++PqICKh6j/uAtmUTXZtTM6h9UhkHk3LP9lyrB9VWUCQ80106dijkgdcqNrAJYeINSJcD80yC2Uk1O/UhqQc4bh9+MRdB5hEExv6qPZzV3yEH/n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741972364; c=relaxed/simple;
	bh=oMRf5D9xED76AloBmylBsBKYgSUDihyoTcfIWxoaKyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOprRF10kA9YpQSy6UxB6FlWPpEf+t8HxDuwatjj99yL6+7HACq+m//Py425lni87jeNilCxRT0HFID1KV//cRYKytj5O7Z2Nn3Q7TCJnrWmZ1ZX5fVvoxwWS6hRM4rDyDvLVBoFvSE0RrpoTk2swRKwdWLvHmd7JTipURqqqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B18E1424;
	Fri, 14 Mar 2025 10:12:52 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 251433F673;
	Fri, 14 Mar 2025 10:12:40 -0700 (PDT)
Date: Fri, 14 Mar 2025 17:12:35 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 03/15] dt-bindings: watchdog: sunxi: add Allwinner
 A523 compatible string
Message-ID: <20250314171235.25db7044@donnerap.manchester.arm.com>
In-Reply-To: <20250307005712.16828-4-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
	<20250307005712.16828-4-andre.przywara@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Mar 2025 00:57:00 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi Wim, Guenter,

> The Allwinner A523 SoC features a watchdog similar to the one used in
> previous SoCs, but moves some registers around (by just one word), making
> it incompatible to existing IPs.
> 
> Add the new name to the list of compatible string, and also to the list
> of IP requiring two clock inputs.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

is there any chance that this DT binding patch (and patch 04/15, touching
the actual driver) would make it into -next any time soon, and hopefully
into v6.15? From what I can see it's the only binding left before the
sunxi maintainers can merge the devicetree patches for this new SoC (most
others are in, pinctrl and NMI should show up in the next days).

Let me know if I can help with anything or if you need more information!

Thanks,
Andre

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 64c8f73938099..b35ac03d51727 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-wdt-reset
>            - const: allwinner,sun20i-d1-wdt
> +      - const: allwinner,sun55i-a523-wdt
>  
>    reg:
>      maxItems: 1
> @@ -60,6 +61,7 @@ if:
>            - allwinner,sun20i-d1-wdt-reset
>            - allwinner,sun50i-r329-wdt
>            - allwinner,sun50i-r329-wdt-reset
> +          - allwinner,sun55i-a523-wdt
>  
>  then:
>    properties:


