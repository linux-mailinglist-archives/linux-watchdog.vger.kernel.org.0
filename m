Return-Path: <linux-watchdog+bounces-2813-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C148EA23EED
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 15:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E2F8188A124
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 14:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6011CEAD5;
	Fri, 31 Jan 2025 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="rtUqgxeJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620471C5F32
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Jan 2025 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332196; cv=none; b=LAXcbOR+TZSQvzCPxs4WxLX0mygnJ/Ja8TS11mDvfqMplB83XhoR9Az+aznlQT+EhTWKPIPghpaUBGri99Y9LWnwnS8VWx/uN5r/4n4tYeIsDMScYcn+sTmMUlLFgmcIp85KVf2P719dqMLt9tSEi5jGS3fHJm796OXbtc7VZTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332196; c=relaxed/simple;
	bh=k6iepJ3khtCHe4wAP+Co9RM2WKV6wPbtel3+iGpB+ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iH6T3L915C3OWm6EEaiQ8JvXHMgzqsor5gHflYjNb+1+qmWGpz2aq25+8RVWKGdUZSKYawHTwLGvaovsU8qNvAmf7MUDlhxyB3rIh59NVeDXCWhyPWwhBrAddnAhKGNU99IW/yZjPziaX/rrssRJtBko84kwmdXyGNC+9DwKN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=rtUqgxeJ; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9D91B240028
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Jan 2025 15:03:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738332191; bh=k6iepJ3khtCHe4wAP+Co9RM2WKV6wPbtel3+iGpB+ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=rtUqgxeJqyjfeci389WwyVR3ezEklT/hG71YuMEM/th4+OQ59ErBQRc/+lh1XpvEE
	 ARpoFnYEIaLOsT8bfAf2MGITZGJJJnBqvY+i1tSSxHXmLoebinLWZIrjXBgSAUj3du
	 UPFDJr+mS6r4SeVtaBKT7Y3I7HRaKADOT88LsZoSnGmZ9QZNYhd9ZLxg5GejJbaMj2
	 rObowSmd9hkyrWs/4LhJj3LxbDSkWXNkeF/oty1/5J9X2CTACIl7pLuuGb1/Ql1nML
	 eDRmowT95Q+BGvmfr9bEhksCP3PjPZk/SuM2qbQd2uouOpsET6v60CmGEvE/PVyKLh
	 VqP7g55lON8xA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YkyK53T11z6v08;
	Fri, 31 Jan 2025 15:03:05 +0100 (CET)
Date: Fri, 31 Jan 2025 14:03:05 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <Z5zYGdZU-IXwIuR6@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
 <20250127044735.GD3106458-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127044735.GD3106458-robh@kernel.org>

On Sun, Jan 26, 2025 at 10:47:35PM -0600, Rob Herring wrote:
> On Sun, Jan 26, 2025 at 07:59:00PM +0100, J. Neuschäfer wrote:
> > The devicetree bindings for Freescale DMA engines have so far existed as
> > a text file. This patch converts them to YAML, and specifies all the
> > compatible strings currently in use in arch/powerpc/boot/dts.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
> >  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
> >  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
> >  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
> >  4 files changed, 354 insertions(+), 204 deletions(-)
[...]
> > +patternProperties:
> > +  "^dma-channel@.*$":
> > +    type: object
> 
>        additionalProperties: false

I'll add it.

> (The tools should have highlighted this)

With dtschema 2024.11 installed, "make dt_binding_check
DT_SCHEMA_FILES=fsl,elo-dma.yaml" does not highlight this.

> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - enum:
> > +              - fsl,mpc8315-dma-channel
> > +              - fsl,mpc8323-dma-channel
> > +              - fsl,mpc8347-dma-channel
> > +              - fsl,mpc8349-dma-channel
> > +              - fsl,mpc8360-dma-channel
> > +              - fsl,mpc8377-dma-channel
> > +              - fsl,mpc8378-dma-channel
> > +              - fsl,mpc8379-dma-channel
> > +          - const: fsl,elo-dma-channel
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      cell-index:
> > +        description: DMA channel index starts at 0.
> > +
> > +      interrupts: true
> 
> You have to define how many interrupts and what they are.

Will do.

(and the same for the other two files)


Best regards,
J. Neuschäfer

