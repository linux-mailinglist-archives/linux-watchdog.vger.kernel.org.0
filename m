Return-Path: <linux-watchdog+bounces-4506-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 596ACC2EAB1
	for <lists+linux-watchdog@lfdr.de>; Tue, 04 Nov 2025 01:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47FFC4E3AD4
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Nov 2025 00:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329E420371E;
	Tue,  4 Nov 2025 00:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRqjSZsj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C451FDA61;
	Tue,  4 Nov 2025 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762217900; cv=none; b=XbNgONn5QZ4k3xSLYDUka3BV9LphxzqzaJH/6s8QBmFrP+0kYiMcOh5GcPtuhldokgTdCJ2xF+0KyTP5lKQxw+WThEO6+kkiQN4jVS5gsMQSrL4IAzWfnelDozQwqZJ88AtuERqbHBb2CZEG+KwwSUIy5xKKVcqSMXFYvg3CK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762217900; c=relaxed/simple;
	bh=6oTbitokTD6YyRhJTCOr5wDh0W3/+rjIfY5mtP/G2zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqUoJXq19bD1oHwcbGugZ/LlWpFnjw5K78Y8qfWgeocWvnJYTEDBkrcTQCZnqSsOJT11kywlENIfc9+rRhxVJgXbtjLBPO4ix6uu+wvedwnRyY8jZXZWmczM1z2iy67LFsh1CEz3j+/n11pVjRZxq56wksoaSYgvDMdu9yq9jqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRqjSZsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8516CC4CEFD;
	Tue,  4 Nov 2025 00:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762217899;
	bh=6oTbitokTD6YyRhJTCOr5wDh0W3/+rjIfY5mtP/G2zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRqjSZsjoXPqnoFMOTN7kMCA7FRFcpEDVnZ96MvaeBUngIRdc9JsYfcakAt/4++iq
	 7KV44RGxpkiiyxKyZKRo2H0gm0wBv2WgYYzItqLRctKwP7wKqPG4U5xVrQL1L05Uky
	 YDwJp8XO1R5eWz13zeAjJZb4rGPRa8ogqfQiTPZ4emJG4kgvz4RUeruu/Kwx6VMMdM
	 klpeMuF21AbznuaJBMDxAO4oa1QakMkhI4NP6omNAHBB4jHFgnhLhysHlvcAeSlia5
	 Q28HDLJqpLdFIeK7ZkwLkj/Ar406QbuTuH49Qz6RYPyS+CiV749wnwHY0AS9s7EVY3
	 HHD1BbFJfD4sw==
Date: Mon, 3 Nov 2025 19:01:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
 <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>

On Mon, Nov 03, 2025 at 04:03:44PM +0530, Hrishabh Rajput wrote:
> 
> On 11/2/2025 12:15 AM, Bjorn Andersson wrote:
> > On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> > > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > 
> > > To restrict gunyah watchdog initialization to Qualcomm platforms,
> > > register the watchdog device in the SMEM driver.
> > > 
> > > When Gunyah is not present or Gunyah emulates MMIO-based
> > > watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> > > present in the devicetree. If none of these device nodes are detected,
> > > we register the SMC-based Gunyah watchdog device.
> > > 
> > > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > ---
> > >   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 37 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > index cf425930539e..40e4749fab02 100644
> > > --- a/drivers/soc/qcom/smem.c
> > > +++ b/drivers/soc/qcom/smem.c
> > > @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> > >   	return 0;
> > >   }
> > > +static int register_gunyah_wdt_device(void)
> > > +{
> > > +	struct platform_device *gunyah_wdt_dev;
> > > +	struct device_node *np;
> > > +
> > > +	/*
> > > +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> > > +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> > > +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> > > +	 * the case.
> > E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
> > arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?
> 
> 
> It doesn't implement Gunyah watchdog. For platforms like these we've kept a
> STATUS SMC call in the gunyah_wdt_probe().
> 

I think it would be good to make that call before registering the
platform driver.

> The SMC Call is expected to fail on platforms which do not have support for
> SMC based Gunyah watchdog, which in turn will fail the probe.
> 

Perhaps I'm missing something, just looked quickly and it's been a while
since I looked at this code, but you're making a HVC (or SMC) call with
the function:

  ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, ARM_SMCCC_OWNER_VENDOR_HYP, 6)

which doesn't look unique to Gunyah in my eyes.

If I read correctly, the ARM_SMCCC_SMC_32 is the only bit (literally)
that differentiates this from being a __vgic_v3_get_gic_config() call in
KVM, just as an example.

Regards,
Bjorn

> Let us know if there's a better way to handle this.
> 
> > > +	 */
> > > +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> > > +	if (np) {
> > > +		of_node_put(np);
> > > +		return 0;
> > > +	}
> > > +
> > > +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> > > +	if (np) {
> > > +		of_node_put(np);
> > > +		return 0;
> > > +	}
> > > +
> > > +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
> > > +							 NULL, 0);
> > > +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
> > > +}
> > > +
> > >   static int qcom_smem_probe(struct platform_device *pdev)
> > >   {
> > >   	struct smem_header *header;
> > > @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
> > >   	if (IS_ERR(smem->socinfo))
> > >   		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
> > > +	ret = register_gunyah_wdt_device();
> > > +	if (ret)
> > > +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
> > > +
> > >   	return 0;
> > >   }
> > >   static void qcom_smem_remove(struct platform_device *pdev)
> > >   {
> > > +	/*
> > > +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
> > > +	 * watchdog device is not unregistered.
> > > +	 */
> > Why? I don't see why the code needs to encode such policy, please
> > explain.
> 
> 
> You're right, there is no such need. We're at wrong here. We had an
> incorrect understanding of watchdog drivers being persistent. We will be
> implementing the module_exit() for the Gunyah watchdog making it not
> persistent.
> 
> 
> Thanks,
> 
> Hrishabh
> 

