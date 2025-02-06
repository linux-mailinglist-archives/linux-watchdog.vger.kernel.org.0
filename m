Return-Path: <linux-watchdog+bounces-2843-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C589CA2B510
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2025 23:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC941888815
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2025 22:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B744223908B;
	Thu,  6 Feb 2025 22:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="c5FRc5Z1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5494722FF5F
	for <linux-watchdog@vger.kernel.org>; Thu,  6 Feb 2025 22:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738881028; cv=none; b=FXoNJgNX+quvi0p7iofFcVZIacu5vCNUT3ty64xlgd3hhcrknBzyOs3DNZvKyKlfck2Tinrp0vaqFd2TeCElLfKh5LYUvwJxhjRyL/5roDSZUODuOz3Il4Ky4T/arp8fQ5tyE2Llec/EEl6tTDoWkY23vloMlmBs8K0dTGIVEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738881028; c=relaxed/simple;
	bh=u6G1eD2kmbp6domphDX7910Spwzkgf3Yjk2DeO59O7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icdq9MZtI99or+pmzrACVL98CJRz7MyAuMMlYWQIYpa/jl5HKp6nxodoZ+/ne1lKpFDUGZjwNGuA39uxbcKn4KKwQY8q0VS2qZ2sTsCuAVNUpyEbweI0KDRtYWFWkX2dy5KLLuuvYHohgcOtytmTwm4Vig16KKO++0hfHspUYnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=c5FRc5Z1; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 13F7D240104
	for <linux-watchdog@vger.kernel.org>; Thu,  6 Feb 2025 23:30:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738881024; bh=u6G1eD2kmbp6domphDX7910Spwzkgf3Yjk2DeO59O7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=c5FRc5Z1mSvp/+GCXMNE/IhAPZJPUhNCYYX+mJ4OZDRmFYvr77ONBwgyfDjabWym8
	 J3R7Vn6RjOIBg1T+9npW9jo/GTAlTFB6zYiZZXCtkjgjsdD3eX/321vxjixKycER4X
	 ldhoBl66cDDVV9/S4iQpVUpCAseJDQ12l71btksfBWSO2xCPXULCHoUsmicZ/NkhXS
	 PDFAKli6NF8+T02xOfQVnS6BPA1dz0fo3UaNgiMl6g3yz/ty5x0sZ/J1L4oQ8gLdaT
	 IheY4kW8KHreJBW7qy3EjK2YOZ9Q57k9R58tgrFZgyC2gU0oyFUfFDACdvuHB2+5tT
	 l2Lb9a3j+JjpA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YpsHY0mq5z9rxF;
	Thu,  6 Feb 2025 23:30:16 +0100 (CET)
Date: Thu,  6 Feb 2025 22:30:15 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
 YAML
Message-ID: <Z6U39wKiLO2I6vrI@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
 <20250127-cuddly-dalmatian-of-saturation-5f1ae2@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-cuddly-dalmatian-of-saturation-5f1ae2@krzk-bin>

On Mon, Jan 27, 2025 at 09:37:32AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Jan 26, 2025 at 07:59:04PM +0100, J. Neuschäfer wrote:
> > Convert the Freescale localbus controller bindings from text form to
> > YAML. The list of compatible strings reflects current usage.
> 
> simple-bus and 20 other compatibles you used were not present in the
> original binding. Does above "list of compatible strings" mean you just
> added them?

Ah, I should make this clearer:

 - by "list of compatible strings" I mean the list as it is after
   applying the patch
 - by "current usage" I mean what is found in arch/*/boot/dts

> 
> > 
> > Changes compared to the txt version:
> >  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
> >    appears in this example and nowhere else
> >  - added a new example with NAND flash
> > 
> > Remaining issues:
> >  - The localbus is not really a simple-bus: Unit addresses are not simply
> >    addresses on a memory bus. Instead, they have a format: The first cell
> >    is a chip select number, the remaining one or two cells are bus
> >    addresses.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 +++++++++
> >  .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++++
> 
> Please split the conversion from adding new bindings. For example above
> file and its compatible fsl,elbc-gpcm-uio was not documented in original
> TXT.

Fair point, I'll split them.

> 
> ...
> 
> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..6bbceb82c77826499abe85879e9189b18d396eea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
> > @@ -0,0 +1,150 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale Enhanced Local Bus Controller
> 
> What sort of bus is it? Memory bus? Then place it with others, see
> memory directory.

Yes, a memory bus controller with explicit chip-select lines, for
various kinds of memory (flash, RAM), and possibly other peripherals.
I'll move it to bindings/memory-controllers.

> 
> > +
> > +maintainers:
> > +  - J. Neuschäfer <j.ne@posteo.net>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^localbus@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,mpc8313-elbc
> > +              - fsl,mpc8315-elbc
> > +              - fsl,mpc8377-elbc
> > +              - fsl,mpc8378-elbc
> > +              - fsl,mpc8379-elbc
> > +              - fsl,mpc8536-elbc
> > +              - fsl,mpc8569-elbc
> > +              - fsl,mpc8572-elbc
> > +              - fsl,p1020-elbc
> > +              - fsl,p1021-elbc
> > +              - fsl,p1023-elbc
> > +              - fsl,p2020-elbc
> > +              - fsl,p2041-elbc
> > +              - fsl,p3041-elbc
> > +              - fsl,p4080-elbc
> > +              - fsl,p5020-elbc
> > +              - fsl,p5040-elbc
> > +          - const: fsl,elbc
> > +          - const: simple-bus
> > +
> > +      - items:
> > +          - const: fsl,mpc8272-localbus
> > +          - const: fsl,pq2-localbus
> > +
> > +      - items:
> > +          - enum:
> > +              - fsl,mpc8247-localbus
> > +              - fsl,mpc8248-localbus
> > +              - fsl,mpc8360-localbus
> > +          - const: fsl,pq2pro-localbus
> > +          - const: simple-bus
> > +
> > +      - items:
> > +          - enum:
> > +              - fsl,mpc8540-localbus
> > +              - fsl,mpc8544-lbc
> > +              - fsl,mpc8544-localbus
> > +              - fsl,mpc8548-lbc
> > +              - fsl,mpc8548-localbus
> > +              - fsl,mpc8560-localbus
> > +              - fsl,mpc8568-localbus
> > +          - const: fsl,pq3-localbus
> > +          - const: simple-bus
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    enum: [2, 3]
> > +    description: |
> > +      The first cell is the chipselect number, and the remaining cells are the
> > +      offset into the chipselect.
> > +
> > +  "#size-cells":
> > +    enum: [1, 2]
> > +    description: |
> > +      Either one or two, depending on how large each chipselect can be.
> > +
> > +  ranges:
> > +    description: |
> > +      Each range corresponds to a single chipselect, and covers the entire
> > +      access window as configured.
> > +
> > +patternProperties:
> > +  "^.*@.*$":
> > +    type: object
> 
> And probably you need 

  ?


> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    localbus@f0010100 {
> > +        compatible = "fsl,mpc8272-localbus",
> > +                     "fsl,pq2-localbus";
> > +        #address-cells = <2>;
> > +        #size-cells = <1>;
> > +        reg = <0xf0010100 0x40>;
> 
> compatible, then reg - see DTS coding style.

I'll clean up the various style issues in the examples.
(These examples are quite old, either from the old version of this
binding or from existing dts files.)


Best regards,
J. Neuschäfer

> 
> > +
> > +        ranges = <0x0 0x0 0xfe000000 0x02000000
> > +                  0x1 0x0 0xf4500000 0x00008000
> > +                  0x2 0x0 0xfd810000 0x00010000>;
> > +
> > +        flash@0,0 {
> > +            compatible = "jedec-flash";
> > +            reg = <0x0 0x0 0x2000000>;
> 
> Well, here it is correct
> 
> > +            bank-width = <4>;
> > +            device-width = <1>;
> > +        };
> > +
> > +        simple-periph@2,0 {
> > +            compatible = "fsl,elbc-gpcm-uio";
> > +            reg = <0x2 0x0 0x10000>;
> > +            elbc-gpcm-br = <0xfd810800>;
> > +            elbc-gpcm-or = <0xffff09f7>;
> > +        };
> > +    };
> > +
> > +  - |
> > +    localbus@e0005000 {
> 
> compatible, reg
> 
> > +        #address-cells = <2>;
> > +        #size-cells = <1>;
> > +        compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
> > +        reg = <0xe0005000 0x1000>;
> > +        interrupts = <77 0x8>;
> > +        interrupt-parent = <&ipic>;
> > +
> > +        ranges = <0x0 0x0 0xfe000000 0x00800000
> > +                  0x1 0x0 0xe0600000 0x00002000
> > +                  0x2 0x0 0xf0000000 0x00020000
> > +                  0x3 0x0 0xfa000000 0x00008000>;
> > +
> > +        flash@0,0 {
> 
> compatible, reg
> 
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +            compatible = "cfi-flash";
> > +            reg = <0x0 0x0 0x800000>;
> > +            bank-width = <2>;
> > +            device-width = <1>;
> > +        };
> > +
> > +        nand@1,0 {
> 
> compatible, reg
> 
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +            compatible = "fsl,mpc8315-fcm-nand",
> > +                         "fsl,elbc-fcm-nand";
> > +            reg = <0x1 0x0 0x2000>;
> > +        };
> 
> Best regards,
> Krzysztof
> 

