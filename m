Return-Path: <linux-watchdog+bounces-2919-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45BA32FCA
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Feb 2025 20:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4961188AE89
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Feb 2025 19:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C571FECA2;
	Wed, 12 Feb 2025 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4BnvrUb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651411DC07D;
	Wed, 12 Feb 2025 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739388797; cv=none; b=mhlcWa7TPHZpp2+M2c0SrXiMRbpeuoSPGH/STVtXwzxF/JHqCy5yI/MOOa/ab9/ze+7Y0tGAH7BAjc5U0gXSHB4cz8mqclQ8ZXszWI1KV+7aN2yS31QOWFSbZ2P98TkEzeGt7txektcdppVk8aA5oEF1A+iKHPChQ3xtrDgFBSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739388797; c=relaxed/simple;
	bh=DA8aW6TC91af7qZ599ujgZGfby8bu3yyXCCl/yeb3Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVHCvSPoyNfulxyQvLfOY+MI3DmXYzDJz3RCc9rL5gR0Azwi/jkwuAIiU15IxKPoxJvh2Xiev2RnsY8HXYXfAfgpmp+3npNN3sktCzHOkkfx0YE2t/rNf6G01QfTVxefMv8CeBaPEe5gGt3obQAa3UID3jTOZ8NgEuFeHpVf5po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4BnvrUb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C5AC4CEDF;
	Wed, 12 Feb 2025 19:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739388795;
	bh=DA8aW6TC91af7qZ599ujgZGfby8bu3yyXCCl/yeb3Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o4BnvrUbuKt991EKanNsBOItVAGsM6PWGCh7sTdEonDfyh/BCF8oLxPYtgnnGAp4K
	 B664GQwZwUzlCy0U3Igue+7lF0xzMIlbi2twjdxobGT5gDs5im3ir8lc5b5rAf1Ras
	 IjJnEME07Et62oxLoX3sbhm6rgPQd6WPwoWwXSE0pryqmwJvOf+scUMY0sU4q7efnw
	 eZ8OJDMTiGf8QTdZ7pVQAmXNtgQDT/NQqv1T6rFsLQQ+vV+TZIUtqswu6vJyUp40Uw
	 ehxX5ZUz4uBREJmIvDdReeoT5QHtBo0HL5dqNz2mM2T8m7w/tQ+qycL2b+kJ1xaJCP
	 lFZ9DHVjhcYJQ==
Date: Wed, 12 Feb 2025 13:33:14 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 03/12] dt-bindings: crypto: Convert fsl,sec-2.0 to YAML
Message-ID: <20250212193314.GA4134845-robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>

On Fri, Feb 07, 2025 at 10:30:20PM +0100, J. Neusch�fer wrote:
> Convert the Freescale security engine (crypto accelerator) binding from
> text form to YAML. The list of compatible strings reflects what was
> previously described in prose; not all combinations occur in existing
> devicetrees.
> 
> Signed-off-by: J. Neusch�fer <j.ne@posteo.net>
> ---
> 
> V2:
> - several improvements suggested by Rob Herring:
>   - remove unnecessary multiline markers
>   - constrain fsl,num-channels to enum: [1,4]
>   - constrain fsl,channel-fifo-len to plausible limits
>   - constrain fsl,exec-units-mask to maximum=0xfff
> - trim subject line (remove "binding")
> ---
>  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 142 +++++++++++++++++++++
>  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
>  2 files changed, 142 insertions(+), 65 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0b82f3b68b5f82e7fb52d292a623d452c1cdb059
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> +
> +maintainers:
> +  - J. Neusch�fer <j.ne@posteo.net.

missing >

> +
> +properties:
> +  compatible:
> +    description:
> +      Should contain entries for this and backward compatible SEC versions,
> +      high to low. Warning - SEC1 and SEC2 are mutually exclusive.
> +    oneOf:
> +      - items:
> +          - const: fsl,sec3.3
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec1.2
> +          - const: fsl,sec1.0
> +      - items:
> +          - const: fsl,sec1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,num-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 4 ]
> +    description: An integer representing the number of channels available.
> +
> +  fsl,channel-fifo-len:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 100
> +    description:
> +      An integer representing the number of descriptor pointers each channel
> +      fetch fifo can hold.
> +
> +  fsl,exec-units-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 0xfff
> +    description: |
> +      The bitmask representing what execution units (EUs) are available.
> +      EU information should be encoded following the SEC's Descriptor Header
> +      Dword EU_SEL0 field documentation, i.e. as follows:
> +
> +        bit 0  = reserved - should be 0
> +        bit 1  = set if SEC has the ARC4 EU (AFEU)
> +        bit 2  = set if SEC has the DES/3DES EU (DEU)
> +        bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
> +        bit 4  = set if SEC has the random number generator EU (RNG)
> +        bit 5  = set if SEC has the public key EU (PKEU)
> +        bit 6  = set if SEC has the AES EU (AESU)
> +        bit 7  = set if SEC has the Kasumi EU (KEU)
> +        bit 8  = set if SEC has the CRC EU (CRCU)
> +        bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
> +
> +      remaining bits are reserved for future SEC EUs.
> +
> +  fsl,descriptor-types-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The bitmask representing what descriptors are available. Descriptor type
> +      information should be encoded following the SEC's Descriptor Header Dword
> +      DESC_TYPE field documentation, i.e. as follows:
> +
> +        bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
> +        bit 1  = set if SEC supports the ipsec_esp descriptor type
> +        bit 2  = set if SEC supports the common_nonsnoop desc. type
> +        bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
> +        bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
> +        bit 5  = set if SEC supports the srtp descriptor type
> +        bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
> +        bit 7  = set if SEC supports the pkeu_assemble descriptor type
> +        bit 8  = set if SEC supports the aesu_key_expand_output desc.type
> +        bit 9  = set if SEC supports the pkeu_ptmul descriptor type
> +        bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
> +        bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type

Why 3 variations of 'descriptor type'?

> +
> +      ..and so on and so forth.
> +
> +required:
> +  - compatible
> +  - reg
> +  - fsl,num-channels
> +  - fsl,channel-fifo-len
> +  - fsl,exec-units-mask
> +  - fsl,descriptor-types-mask
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* MPC8548E */
> +    crypto@30000 {
> +        compatible = "fsl,sec2.1", "fsl,sec2.0";
> +        reg = <0x30000 0x10000>;
> +        interrupts = <29 2>;
> +        interrupt-parent = <&mpic>;
> +        fsl,num-channels = <4>;
> +        fsl,channel-fifo-len = <24>;
> +        fsl,exec-units-mask = <0xfe>;
> +        fsl,descriptor-types-mask = <0x12b0ebf>;
> +    };
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt b/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> deleted file mode 100644
> index 125f155d00d052eec7d5093b5c5076cbe720417f..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> -
> -Required properties:
> -
> -- compatible : Should contain entries for this and backward compatible
> -  SEC versions, high to low, e.g., "fsl,sec2.1", "fsl,sec2.0" (SEC2/3)
> -                             e.g., "fsl,sec1.2", "fsl,sec1.0" (SEC1)
> -    warning: SEC1 and SEC2 are mutually exclusive
> -- reg : Offset and length of the register set for the device
> -- interrupts : the SEC's interrupt number
> -- fsl,num-channels : An integer representing the number of channels
> -  available.
> -- fsl,channel-fifo-len : An integer representing the number of
> -  descriptor pointers each channel fetch fifo can hold.
> -- fsl,exec-units-mask : The bitmask representing what execution units
> -  (EUs) are available. It's a single 32-bit cell. EU information
> -  should be encoded following the SEC's Descriptor Header Dword
> -  EU_SEL0 field documentation, i.e. as follows:
> -
> -	bit 0  = reserved - should be 0
> -	bit 1  = set if SEC has the ARC4 EU (AFEU)
> -	bit 2  = set if SEC has the DES/3DES EU (DEU)
> -	bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
> -	bit 4  = set if SEC has the random number generator EU (RNG)
> -	bit 5  = set if SEC has the public key EU (PKEU)
> -	bit 6  = set if SEC has the AES EU (AESU)
> -	bit 7  = set if SEC has the Kasumi EU (KEU)
> -	bit 8  = set if SEC has the CRC EU (CRCU)
> -	bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
> -
> -remaining bits are reserved for future SEC EUs.
> -
> -- fsl,descriptor-types-mask : The bitmask representing what descriptors
> -  are available. It's a single 32-bit cell. Descriptor type information
> -  should be encoded following the SEC's Descriptor Header Dword DESC_TYPE
> -  field documentation, i.e. as follows:
> -
> -	bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
> -	bit 1  = set if SEC supports the ipsec_esp descriptor type
> -	bit 2  = set if SEC supports the common_nonsnoop desc. type
> -	bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
> -	bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
> -	bit 5  = set if SEC supports the srtp descriptor type
> -	bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
> -	bit 7  = set if SEC supports the pkeu_assemble descriptor type
> -	bit 8  = set if SEC supports the aesu_key_expand_output desc.type
> -	bit 9  = set if SEC supports the pkeu_ptmul descriptor type
> -	bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
> -	bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
> -
> -  ..and so on and so forth.
> -
> -Example:
> -
> -	/* MPC8548E */
> -	crypto@30000 {
> -		compatible = "fsl,sec2.1", "fsl,sec2.0";
> -		reg = <0x30000 0x10000>;
> -		interrupts = <29 2>;
> -		interrupt-parent = <&mpic>;
> -		fsl,num-channels = <4>;
> -		fsl,channel-fifo-len = <24>;
> -		fsl,exec-units-mask = <0xfe>;
> -		fsl,descriptor-types-mask = <0x12b0ebf>;
> -	};
> 
> -- 
> 2.48.0.rc1.219.gb6b6757d772
> 

