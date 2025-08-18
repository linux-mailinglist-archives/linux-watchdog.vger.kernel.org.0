Return-Path: <linux-watchdog+bounces-4009-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62304B2AF13
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 19:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D83D1BA2913
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 17:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCF932C316;
	Mon, 18 Aug 2025 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukN+n/GX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C0832C300;
	Mon, 18 Aug 2025 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536945; cv=none; b=u57wTXl7lE6IRRTQnNgXcGtjGL1Kd14gJIsME7mb0s146L4O6qUnUgPD9mFCHWwc4ZG4e+XtXIhboSsRkRGoTyK1cQ+FeKgVxhbADeqqSDsOlX3D1uvZh/z3HsWCpMN7a8sYPa1DlwEa0wbCR2vAdxEPYAEAtuKFZGPBowsg1g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536945; c=relaxed/simple;
	bh=Hyw53ZDx364pKmLbo4gCQTxyQwdoGy/IOG7eSwG74Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtzXkP03CGe0tdy1ZM8kYNuu4SLMaf2Ry1NViCc/BpuGUK0E+JsUQr2rSOzwD1scF/ajTY3SeayXXOJTOIZDlgmXOB8uMH7keLxHWXmEUv+cTesAjWcnah3b73Wts45EvSdGldOmkYk2wwFtYg2P08Wx63D9ZFTE9dCQtcRW77U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukN+n/GX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C177BC4CEEB;
	Mon, 18 Aug 2025 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536944;
	bh=Hyw53ZDx364pKmLbo4gCQTxyQwdoGy/IOG7eSwG74Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukN+n/GXzklqVJkTZne+d5giZDpSaa18ONEWXelzNI9h/TiFDmr5VPh5xVQUWmkc/
	 KWmA/NbSPEVHpIPxy4tkwEIqirz4obvDRTc3+KaHTnBradG09dGa2p31WeDMO8vXhg
	 sEMXVQFaXI0r1IReF0FXjCRgd+svrakkcEZvjXdGZkd6812sS9BX3VTRHHXDUTsdOx
	 4NDJj9x7fckyP0glb57uRmro3ix6/33rTryeMLE4hdd3oWtsoYHIUubIBl03WYmh7w
	 FC2OyDlHhwSj2tpvmlhmr4pd+jAmxV5hvKSNUXDipLL4EZwYh+piiufJaqUFF6wtx3
	 dUDhOVNgevt6A==
Date: Mon, 18 Aug 2025 12:09:04 -0500
From: Rob Herring <robh@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, krzk+dt@kernel.org,
	conor+dt@kernel.org, hauke@hauke-m.de,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: lantiq,wdt: convert bindings to
 dtschema
Message-ID: <20250818170904.GA1477625-robh@kernel.org>
References: <20250811131104.837210-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811131104.837210-1-olek2@wp.pl>

On Mon, Aug 11, 2025 at 03:10:54PM +0200, Aleksander Jan Bajkowski wrote:
> Convert the Lantiq WDT Watchdog bindings to yaml format.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../bindings/watchdog/lantiq,wdt.yaml         | 50 +++++++++++++++++++
>  .../bindings/watchdog/lantiq-wdt.txt          | 24 ---------
>  2 files changed, 50 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml b/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
> new file mode 100644
> index 000000000000..f1102fff2d92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/lantiq,wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq WTD watchdog
> +
> +maintainers:
> +  - Hauke Mehrtens <hauke@hauke-m.de>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - lantiq,falcon-wdt
> +          - lantiq,wdt
> +          - lantiq,xrx100-wdt
> +      - items:
> +          - enum:
> +              - lantiq,xrx200-wdt
> +              - lantiq,xrx300-wdt
> +          - const: lantiq,xrx100-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  lantiq,rcu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the RCU syscon node (required for
> +      "lantiq,falcon-wdt" and "lantiq,xrx100-wdt")

Express the 'required' as a schema, not freeform text.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog@803f0 {
> +        compatible = "lantiq,xrx200-wdt", "lantiq,xrx100-wdt";
> +        reg = <0x803f0 0x10>;
> +
> +        lantiq,rcu = <&rcu0>;
> +    };

