Return-Path: <linux-watchdog+bounces-2887-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05507A2E6BC
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 09:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B897188386D
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 08:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4FF1BEF63;
	Mon, 10 Feb 2025 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZY02NguF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688D1E4A9;
	Mon, 10 Feb 2025 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177133; cv=none; b=WOSzAmx+FdNbRKt8aJs0afrTV92+8PpLO0p8fdnsZX9fKbG1yDqRpwGTzxVop1+tkfd05oCXi97GhBZ2PlrAm6rB0RNFJv/eWAU0Dz1ZT0nue0wJVYSCID8+U20mr7skaFUcpNpuCAut5gqzamqJ+qBHtYOBmMNOqD7qa5WhUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177133; c=relaxed/simple;
	bh=8e9TvzMvnN655dD9mW3ziQ4pedVgVTCtFygXZeQGWbI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KyxgRLA/Ci3epCkfPiSGZZ3uXWW52YyNBuEfnc4EqMpXVobiGuEXG9r+99AVQV8RfEiCWqv9SkE3filo8TaDep31yyI9TBqHIWkb3ryNdvPDQlotWHJ0ordISoiYT1hX5hWztS3Mc41vKOmV+k1Hbj6AwKx5sBEshAjEgB2Ac5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZY02NguF; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 55A93582BA6;
	Mon, 10 Feb 2025 08:27:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E7EC441F0;
	Mon, 10 Feb 2025 08:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739176047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8e9TvzMvnN655dD9mW3ziQ4pedVgVTCtFygXZeQGWbI=;
	b=ZY02NguFvp2D4ou3No/QCzpfSTJ/vEq/6qT+XJ/nvm4ksYAK39lFMb0mQgDBqM0QIBRl1F
	8lQkkIF/mc8rfl0l4flqx4G6JMtztvl8iq4f4mpGpYsw9F+0rmgop6/sp/OOfQsixdP9Hn
	F5EBu6cuuY9MfhzpBOyfm3OiCFVmX2cf9gRlizM56NuNZNK60icbcTT+3/d+T/Unba6ad9
	nIAJD/b54HfwpeWm89ATdYeoXB7ZO5w+IHsHy0eoz3L543OybW2v5YkqjOB1Y1pInLZonw
	gvl82hS9MNgYZaE0ZItYKARh4AqYqBh+HH0IcpFf14eU4/gDM4YqjQJ7ekjhow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= via B4 Relay
 <devnull+j.ne.posteo.net@kernel.org>
Cc: devicetree@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,  Krzysztof
 Kozlowski <krzk@kernel.org>,  j.ne@posteo.net,  imx@lists.linux.dev,
  Scott Wood <oss@buserror.net>,  Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas
 Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Damien Le Moal <dlemoal@kernel.org>,
  Niklas Cassel <cassel@kernel.org>,  Herbert Xu
 <herbert@gondor.apana.org.au>,  "David S. Miller" <davem@davemloft.net>,
  Lee Jones <lee@kernel.org>,  Vinod Koul <vkoul@kernel.org>,  Lorenzo
 Pieralisi <lpieralisi@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Bjorn Helgaas
 <bhelgaas@google.com>,  J. =?utf-8?Q?Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>,  Wim Van
 Sebroeck <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-ide@vger.kernel.org,  linux-crypto@vger.kernel.org,
  dmaengine@vger.kernel.org,  linux-pci@vger.kernel.org,
  linux-watchdog@vger.kernel.org,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
In-Reply-To: <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net> ("J.
 =?utf-8?Q?Neusch=C3=A4fer?=
	via B4 Relay"'s message of "Fri, 07 Feb 2025 22:30:29 +0100")
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
	<20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 09:27:22 +0100
Message-ID: <87o6zaurv9.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepuggvvhhnuhhllhdojhdrnhgvrdhpohhsthgvohdrnhgvtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhdrnhgvsehpohhst
 hgvohdrnhgvthdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhsshessghushgvrhhrohhrrdhnvghtpdhrtghpthhtohepmhgrugguhieslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 07/02/2025 at 22:30:29 +01, J. Neusch=C3=A4fer via B4 Relay <devnull+j.n=
e.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> In some scenarios, such as under the Freescale eLBC bus, there are raw
> NAND chips with a unit address that has a comma in it (cs,offset).
> Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
> addresses.

This is super specific to this controller, I'd rather avoid that in the
main (shared) files. I believe you can force another node name in the
controller's binding instead?

Thanks,
Miqu=C3=A8l

