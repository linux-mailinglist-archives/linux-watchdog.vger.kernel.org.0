Return-Path: <linux-watchdog+bounces-2882-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC371A2DF5C
	for <lists+linux-watchdog@lfdr.de>; Sun,  9 Feb 2025 18:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F6E164E1E
	for <lists+linux-watchdog@lfdr.de>; Sun,  9 Feb 2025 17:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DE21E0DF5;
	Sun,  9 Feb 2025 17:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="DEFQtUiK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480BF1DFE06
	for <linux-watchdog@vger.kernel.org>; Sun,  9 Feb 2025 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739122105; cv=none; b=UYIKROIl6x/LSxmJ3ULyL26wQwm/GjsHM5UkhjlECPVpr0Nu8hlgIa7oxoAz+wUn2OB1xs703vuRz/QawXWyk4i4u0wB7fYFFjyUx/vAek74Y32XhdStFNHHnPlYstZSVEPdjpUoeSgfD78TpxSkBogalxWV1sRQ76qJpFhvBmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739122105; c=relaxed/simple;
	bh=3qpw2bQ12DB6YGamFBnTxyKWuhTs/kDLk94p3S330Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebv0CXzUjrLf0ngiGn2m154YKJ0npNZBbN8ARopMmVqsxAehEakp5CCelZ4qAFUhoP8z1uLM2VQrIz+B/259I61TNVCsLh7QDSWkHE1mHhzs/Ap2+EF+sSD+1CrznQrqpKqYpSbyuXI4XWRq82VN7nlLy+utnbRslYAdsKYHVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=DEFQtUiK; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9CDDC24002D
	for <linux-watchdog@vger.kernel.org>; Sun,  9 Feb 2025 18:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739122100; bh=3qpw2bQ12DB6YGamFBnTxyKWuhTs/kDLk94p3S330Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=DEFQtUiKJm5vlOa1GTPCXPF27DnFWHBlk7j6BJxmhPr+BHctH1I+zcCB7eBQiWVu6
	 87lwMuWwycUq4ixaM34aO1Ucm5K4K1+ziP7f0pISDsbiRVUy0gC/xdaJOOE2o9Q0Yb
	 X595KTyRc/yE5sIh61qT6RvDUOyUTvbUHUE3y32N5/ZW9UYjCThSgRoyzDYVVkmU78
	 d9esqsr3mDlHVgaE0tGNS43EdnpnxkCNC3RfqI1ZG45V/S2Kvb76R7ftTK4QQWc+O6
	 rJdICsqhEXcMaPKbt2gO0tnHVNVTAMILCcI2iozqeUxqIHG/Sp/3NKGjbwuz1vqG3I
	 9qjpjuKymt1VQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YrZRd3h87z9rxG;
	Sun,  9 Feb 2025 18:28:13 +0100 (CET)
Date: Sun,  9 Feb 2025 17:28:13 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Mark Brown <broonie@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linuxppc-dev@lists.ozlabs.org, linux-spi@vger.kernel.org,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>, Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <Z6jlrU7EPeATjK8s@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <173897189669.2630636.11579554304003668196.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173897189669.2630636.11579554304003668196.robh@kernel.org>

On Fri, Feb 07, 2025 at 05:44:59PM -0600, Rob Herring (Arm) wrote:
> On Fri, 07 Feb 2025 22:30:26 +0100, J. Neuschäfer wrote:
[...]
> >  .../bindings/memory-controllers/fsl,elbc.yaml      | 146 +++++++++++++++++++++
> >  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
> >  2 files changed, 146 insertions(+), 43 deletions(-)
[...]
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-0/localbus@f0010100/simple-periph@2,0: failed to match any schema with compatible: ['fsl,elbc-gpcm-uio']
> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
> Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dtb: /example-1/localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']

I think this is due to how the patches are ordered in the series.
This patch uses fsl,elbc-gpcm-uio and fsl,elbc-fcm-nand in examples, but
comes before the patches that define the corresponding bindings.

