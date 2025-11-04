Return-Path: <linux-watchdog+bounces-4508-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F785C2F31A
	for <lists+linux-watchdog@lfdr.de>; Tue, 04 Nov 2025 04:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2DE5188DCC0
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Nov 2025 03:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39E229D26E;
	Tue,  4 Nov 2025 03:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dscBfDOy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711B71F95C;
	Tue,  4 Nov 2025 03:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762228133; cv=none; b=kADXQz/UM6Yc14FDGJlT4JxRMIMdGovU1ezpsHxjsf76st5HXg12FDhvZgP6N8l02fU1G9Mk0pta76oPc6zG/V/jhBN7UDaIsNuSvZpEpQtQuSzVc2+TWE+uFvipYggybY5kNBbW7xOX4GQ1Jiyjuyx8vRNRrmegfoU0hH82U9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762228133; c=relaxed/simple;
	bh=4fd36kFSzK2zF+aZMt2KGz5BuxWOO8k8M8dS6Bg0+Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpAsi+CWbgjnLyZpvGrbIr8Qct/aDndf6dBIrDQDaupl2L5SyIx5zK2qfZyJMy1RwvouUI23aTpJLqEhhs8S4JbYQ1XOYGzze52LPh4yBgK9yJSrXav5xoAv2uHlOu/GXs/yFm//t9QWuDnkiFrYsLKZhQs6WV9obqpg/DFGxeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dscBfDOy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8982C4CEF7;
	Tue,  4 Nov 2025 03:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762228132;
	bh=4fd36kFSzK2zF+aZMt2KGz5BuxWOO8k8M8dS6Bg0+Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dscBfDOya9aSEXlAulVpZpGjUC6EAD0oWCZJeT3dq05Nv1Fqkf0XAEhWuG5fGoyd7
	 nKRyTM6aw5j0XJu5UmDAaMwgSNGsVm3+Rh8j8kifgFs9oOmFobZfmKIYxbn25bYwtI
	 6Ys+OYe4DP0VwTx55xs+1irVcMIrWTjqRX0VonnjAyESqnJ3RwqAN4ty1uIImUJc9R
	 qmkp0hDvo5q4XZ0LmheJwueysyd0SVWBIGS8+ecBMxq/+cr9QwRFcJEw2Ur+D7Ckdp
	 OcyM0Pjliby4hrSiuItHMiwXRtTE1mVUNNCxjyiJjC7XqVvrDpUB3Ag5/aYYn1CfA6
	 RZtbq0Pn9G6Mg==
Date: Mon, 3 Nov 2025 21:52:25 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <ykg7mwgncmvdap6xzyhmgxu6ur62zzfk5nd3tqrkivugn4w474@rkazrlhwbhtj>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
 <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
 <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
 <599188b5-cd2e-4667-a91d-04cbdd62cecb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <599188b5-cd2e-4667-a91d-04cbdd62cecb@quicinc.com>

On Tue, Nov 04, 2025 at 09:00:27AM +0530, Pavan Kondeti wrote:
> On Mon, Nov 03, 2025 at 07:01:51PM -0600, Bjorn Andersson wrote:
> > On Mon, Nov 03, 2025 at 04:03:44PM +0530, Hrishabh Rajput wrote:
> > > 
> > > On 11/2/2025 12:15 AM, Bjorn Andersson wrote:
> > > > On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> > > > > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > > 
> > > > > To restrict gunyah watchdog initialization to Qualcomm platforms,
> > > > > register the watchdog device in the SMEM driver.
> > > > > 
> > > > > When Gunyah is not present or Gunyah emulates MMIO-based
> > > > > watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> > > > > present in the devicetree. If none of these device nodes are detected,
> > > > > we register the SMC-based Gunyah watchdog device.
> > > > > 
> > > > > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > > ---
> > > > >   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
> > > > >   1 file changed, 37 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > > > index cf425930539e..40e4749fab02 100644
> > > > > --- a/drivers/soc/qcom/smem.c
> > > > > +++ b/drivers/soc/qcom/smem.c
> > > > > @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> > > > >   	return 0;
> > > > >   }
> > > > > +static int register_gunyah_wdt_device(void)
> > > > > +{
> > > > > +	struct platform_device *gunyah_wdt_dev;
> > > > > +	struct device_node *np;
> > > > > +
> > > > > +	/*
> > > > > +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> > > > > +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> > > > > +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> > > > > +	 * the case.
> > > > E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
> > > > arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?
> > > 
> > > 
> > > It doesn't implement Gunyah watchdog. For platforms like these we've kept a
> > > STATUS SMC call in the gunyah_wdt_probe().
> > > 
> > 
> > I think it would be good to make that call before registering the
> > platform driver.
> 
> Did you mean platform device here? Becase we don't want the gunayh-wdt
> module to do anything other than registering the platform driver on
> platforms other than qcom.
> 

Yes, device, not driver.

So in SCM driver (I think that's a better match than SMEM), do a:
  if (are_we_running_under_gunyah())
    platform_device_register(gunya-wdt);

The Gunyah WDT _driver_ should based on that be autoloaded by the
platform:gunyah-wdt alias.

> > 
> > > The SMC Call is expected to fail on platforms which do not have support for
> > > SMC based Gunyah watchdog, which in turn will fail the probe.
> > > 
> > 
> > Perhaps I'm missing something, just looked quickly and it's been a while
> > since I looked at this code, but you're making a HVC (or SMC) call with
> > the function:
> > 
> >   ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, ARM_SMCCC_OWNER_VENDOR_HYP, 6)
> > 
> > which doesn't look unique to Gunyah in my eyes.
> > 
> > If I read correctly, the ARM_SMCCC_SMC_32 is the only bit (literally)
> > that differentiates this from being a __vgic_v3_get_gic_config() call in
> > KVM, just as an example.
> > 
> 
> Yes, you are right. This SMCC falls under ARM_SMCCC_OWNER_VENDOR_HYP
> space, so it would behave differently on different hypervisors.
> 
> Please let me know what you think about this **defensive** approach.
> 
> - Move the Gunyah platform device registration to SCM driver.
> - Checks to be done before registering the device
>   - Make ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC [1] to verify that we are
>     running under gunyah
>   - check for the other wdt devices like kpss, sbsa in dT
> 
> ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC will not be supported by all
> versions of Gunyah, but atleast it would confirm the definitive presence
> of Gunyah.
> 

Yes, this looks good.

I presume if we determine that Gunyah is present, and we haven't put
sbsa wdt in place (e.g. during bringup) Gunyah and Gunyah WDT will
handle the outcome gracefully...

Regards,
Bjorn

> [1]
> https://lore.kernel.org/all/20240222-gunyah-v17-4-1e9da6763d38@quicinc.com/

