Return-Path: <linux-watchdog+bounces-2929-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E5A35482
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2025 03:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE8B41890A62
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2025 02:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7B981ACA;
	Fri, 14 Feb 2025 02:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Nm3LODJX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA8132111
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Feb 2025 02:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739499049; cv=none; b=nRRAq+U5TTDzd4mDPxnNpZFJLkoy4bMFly3gzoHBAkK6K8ZQwEGHo9O+IQyVhw/eFK3X7bLvDWj0mmxsoBPf4SGRtnTMJBct0STgqBnpoOjDhJtiNqCu2mkr9ci2aycAfAYHmC+6h2R/8f2ZvQY+tJfB+NyfnfIASj7GgIJWsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739499049; c=relaxed/simple;
	bh=WhJmekLyQeapuWa9J6WUco9/aFXXshTQJPKudksd1Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atH6Vr1dUeOpKvSN/VYAd9AGqD01qcUFqAgQSbLDkRzIpCMcxwHrQLPpoKBFgAx4EP4vq4Rk+K7vhvTMYaEiTffl8UMjmu4t2mwhcmrCOZnccdbeUbBcvfNcP4fFvudOLn8QRJKX8xaL9XcLjkfeqqcuAkknsGdRDEMSeo9rE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Nm3LODJX; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C5331240029
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Feb 2025 03:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739498648; bh=WhJmekLyQeapuWa9J6WUco9/aFXXshTQJPKudksd1Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Nm3LODJXhqQCCv69Zz1N9FqongFoJT3V0NUa6zSUc6NA8FVuLeDXb1gY6jUNVQHk0
	 za741AL0WLueAGlA/BFA+QKYt3CF9TzSKV5uIWL7ZRmYG65M75ziCewHvxV5bFjNvF
	 iazMruPIDK5iKbKAZ/b3L7MbUm8urNpdqjf+7oZ+ilPu+gH9g8Qi0ILU6wPJ9jr/f2
	 88Oy6Dd1u/V7CrpE27zO9e3Rst0yJX5xnoQo7GnAyMla0eUpw+1+/KNjIMvlu9JPTk
	 Vkmt2BtBE48By8yPb8A9xA3GJCSUKi5lFDCACraCv2ZCkP4OvojLM4EmP/9XViOo53
	 4Xmtf91bi8dMw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YvFhy67kgz9rxF;
	Fri, 14 Feb 2025 03:04:02 +0100 (CET)
Date: Fri, 14 Feb 2025 02:04:02 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH v2 03/12] dt-bindings: crypto: Convert fsl,sec-2.0 to YAML
Message-ID: <Z66kksKzsknmOy5Q@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
 <20250212193314.GA4134845-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212193314.GA4134845-robh@kernel.org>

On Wed, Feb 12, 2025 at 01:33:14PM -0600, Rob Herring wrote:
> On Fri, Feb 07, 2025 at 10:30:20PM +0100, J. Neuschäfer wrote:
> > Convert the Freescale security engine (crypto accelerator) binding from
> > text form to YAML. The list of compatible strings reflects what was
> > previously described in prose; not all combinations occur in existing
> > devicetrees.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > 
> > V2:
> > - several improvements suggested by Rob Herring:
> >   - remove unnecessary multiline markers
> >   - constrain fsl,num-channels to enum: [1,4]
> >   - constrain fsl,channel-fifo-len to plausible limits
> >   - constrain fsl,exec-units-mask to maximum=0xfff
> > - trim subject line (remove "binding")
> > ---
> >  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 142 +++++++++++++++++++++
> >  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
> >  2 files changed, 142 insertions(+), 65 deletions(-)
[...]
> > +title: Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> > +
> > +maintainers:
> > +  - J. Neuschäfer <j.ne@posteo.net.
> 
> missing >

Good catch, will fix.


> > +  fsl,descriptor-types-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The bitmask representing what descriptors are available. Descriptor type
> > +      information should be encoded following the SEC's Descriptor Header Dword
> > +      DESC_TYPE field documentation, i.e. as follows:
> > +
> > +        bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
> > +        bit 1  = set if SEC supports the ipsec_esp descriptor type
> > +        bit 2  = set if SEC supports the common_nonsnoop desc. type
> > +        bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
> > +        bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
> > +        bit 5  = set if SEC supports the srtp descriptor type
> > +        bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
> > +        bit 7  = set if SEC supports the pkeu_assemble descriptor type
> > +        bit 8  = set if SEC supports the aesu_key_expand_output desc.type
> > +        bit 9  = set if SEC supports the pkeu_ptmul descriptor type
> > +        bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
> > +        bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
> 
> Why 3 variations of 'descriptor type'?

The reasons have been lost in time, I suppose. I'll normalize the spelling.


Thanks,
J. Neuschäfer

