Return-Path: <linux-watchdog+bounces-2944-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6CA3767C
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Feb 2025 19:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E943A1892B4A
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Feb 2025 18:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD35819E833;
	Sun, 16 Feb 2025 18:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="fRSHGNjN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00E119D886
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Feb 2025 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739729555; cv=none; b=OjbTa0qr1wrQvH/iz06kO56ts4vkOwcSoF+JMnk/BmSD7S/IfHYfh3SXYNr47ptI68wNFSNaJBQMmvbvAPT3P+IGb9IQ5RsTI6KZWMeDhAMW6ux3V2LN5XrLBQQf1Gmy92PCnwUKT76q1LUG+Kc74OifnNu2N1fLgBnWuq1KJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739729555; c=relaxed/simple;
	bh=YUqph/b4fBwdoaZ+voCpRWWS6XtVpDBsEp5ssxllxE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gu7+3hU8Gdk9JvR5W9RVmTKM1VxyAOELxsy5fOKmfwlXRI/QfrlWZFAueM+SEhaTkjzALiNI9+cesFo7fB/kcxjgd2aICnOcG7xPWoh/Ld5fFWxJ0wairG0rzFldO6aujGnA65Iq0VlfVS3XOZBFrBDFwR2qlPKPWBbB9WNjqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=fRSHGNjN; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3D4B2240028
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Feb 2025 19:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739729552; bh=YUqph/b4fBwdoaZ+voCpRWWS6XtVpDBsEp5ssxllxE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=fRSHGNjNl1cAmfChbInU63IRKQoTu0JS4Iplfwe6RMf1WKD/8cj1/It/DYf7mq3SO
	 YYOBmVZjU/UUQJtErfw/Vv/SWTzbu0/FmZcn4PFWEYFufoigcMrJ61CTy3Gy4uYAVr
	 4uv3Ys+FTeiG5ex24zqk1VNfKtgXa/Ga0Qt74Mcc4toniz1OCmFfwdFl7CoZHKfDJ3
	 C3HrXTooDAaMfAUdpm7iRMmLtB2EVfetl428iA4VwI1k2D77rjkmG+2NR0fcpU+07m
	 N2K7T2bnW27tZzoW2bN0x+LJuOe6avDzrxNt7l22CJifL2g9IzlI/a2ptu6b9mjJGi
	 0xKN+sirq5c2A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ywv5R2d3Hz9rxK;
	Sun, 16 Feb 2025 19:12:27 +0100 (CET)
Date: Sun, 16 Feb 2025 18:12:26 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, j.ne@posteo.net,
	imx@lists.linux.dev, Scott Wood <oss@buserror.net>,
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
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
Message-ID: <Z7Iqir-qaZDt6tsx@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
 <87o6zaurv9.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6zaurv9.fsf@bootlin.com>

On Mon, Feb 10, 2025 at 09:27:22AM +0100, Miquel Raynal wrote:
> Hello,
> 
> On 07/02/2025 at 22:30:29 +01, J. Neuschäfer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > In some scenarios, such as under the Freescale eLBC bus, there are raw
> > NAND chips with a unit address that has a comma in it (cs,offset).
> > Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
> > addresses.
> 
> This is super specific to this controller, I'd rather avoid that in the
> main (shared) files. I believe you can force another node name in the
> controller's binding instead?

It's a bit tricky. AFAICS, when I declare a node name pattern in my
specific binding in addition to the generic binding, the result is that
both of them apply, so I can't relax stricter requirements:

# raw-nand-chip.yaml
properties:
  $nodename:
    pattern: "^nand@[a-f0-9]$"

# fsl,elbc-fcm-nand.yaml
properties:
  $nodename:
    pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$"

# dtc
/.../fsl,elbc-fcm-nand.example.dtb:
nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
        from schema $id:
	http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#

(I changed the second pattern to nand-fail@... and dtc warned about it
 mismatching too.)

Perhaps I'm missing a DT-schema trick to override a value/pattern.

Alternatively (pending discussion on patch 11/12), I might end up not
referencing raw-nand-chip.yaml.


Best regards,
J. Neuschäfer

