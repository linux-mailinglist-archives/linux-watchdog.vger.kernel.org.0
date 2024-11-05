Return-Path: <linux-watchdog+bounces-2413-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6499BC881
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2024 10:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E4ED282E3C
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2024 09:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D38C4317C;
	Tue,  5 Nov 2024 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="HsbnN/Tx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253FA1C2450;
	Tue,  5 Nov 2024 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797216; cv=none; b=jetOdhnxVFTMHv04iCJ315eOomdKCz4pDotcnr6jlu/jI6RslY5ho5dqkG640afrrkW40LWnZa8K0k3q8TEWrVhzMBuEtP0yttl9XUKj71Nu0R6iREuQRSycLiVjOpC8OY9PYQ8y1RKIKHK7ng2m6/qf0Zkj07Ey3CP8VJuySiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797216; c=relaxed/simple;
	bh=b+cUcGREjwIVOb8iVPWQ1xX9l5pWIaGxnqXDOFCzuIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zaaza3EFjqrVLIb7Iw6K/9XAavIwhNQLBfHyjN4T5bGdYXvprVw6c3Ba8WE28i8vPrAHLIVmEn5xOMHVKa1aTz9gE9VCjigk9nbY1SembOQmGeN4dZ6S1vfJKGnjoyzz5Fi5CpYoZSeRRYUI69Yi53l1RIZnYRxx+21q2yFoP00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=HsbnN/Tx; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 80D2540A06; Tue,  5 Nov 2024 09:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 80D2540A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730795575;
	bh=b+cUcGREjwIVOb8iVPWQ1xX9l5pWIaGxnqXDOFCzuIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsbnN/Tx+/Bvj8KL+ri+wWbTFp5C/N3vOAEZg0J4qoqhzSNsjJG1yl0RT1yU7xkvV
	 3QOwZ2PWKt8zKELSK5Q699hFHBLRUkxAQrUh37XyMjN8cLi7UEYNNfOUixdIpCAAKr
	 Ct0C2dZFrEG7Ytszd9Io//ao6Y3TMSBIQfV6PUzo=
Date: Tue, 5 Nov 2024 09:32:55 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
Message-ID: <20241105083255.GA24194@www.linux-watchdog.org>
References: <20241007212434.895521-1-Frank.Li@nxp.com>
 <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Frank,

> On Mon, Oct 07, 2024 at 05:24:33PM -0400, Frank Li wrote:
> > From: Animesh Agarwal <animeshagarwal28@gmail.com>
> >
> > Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. Only
> > allow big-endian property for ls1012a and ls1043a.
> >
> > Fix dtbs_check errors.
> > arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
> >     Unevaluated properties are not allowed ('big-endian' was unexpected)
> >
> > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Wim Van Sebroeck:
> 
> 	Any update this patch? Kyzy already acked.
> 

Acked-by: Wim Van Sebroeck <wim@linux-watchdog.org>

Via which tree will this go upsteam?

Kind regards,
Wim.

> 
> Frank
> 
> 
> >
> > Change from v1 to v2:
> >   only allow big endian for layerscape platform.
> >
> > previous post at:
> > https://lore.kernel.org/imx/20240806103819.10890-1-animeshagarwal28@gmail.com/
> >
> > check spec, and dump watch dog reset value
> > at ls1043a platform.
> >
> > 0x02A80000:  00 30 00 00 00 10 00 04 00 01 00 00 00 00 00 0
> >
> > It is big-endian. imx2_wdt.c use regmap which call regmap_get_val_endian()
> > to handle endian.
> >
> > So this change is corret.
> >
> > big-endian for wdt is necessary
> > ---
> >  .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > index 36b836d0620c9..0da953cb71272 100644
> > --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > @@ -48,6 +48,8 @@ properties:
> >    clocks:
> >      maxItems: 1
> >
> > +  big-endian: true
> > +
> >    fsl,ext-reset-output:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description: |
> > @@ -93,6 +95,18 @@ allOf:
> >        properties:
> >          fsl,suspend-in-wait: false
> >
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - fsl,ls1012a-wdt
> > +                - fsl,ls1043a-wdt
> > +    then:
> > +      properties:
> > +        big-endian: false
> > +
> >  unevaluatedProperties: false
> >
> >  examples:
> > --
> > 2.34.1
> >

