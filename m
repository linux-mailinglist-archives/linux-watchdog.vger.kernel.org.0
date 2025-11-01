Return-Path: <linux-watchdog+bounces-4498-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5FFC2859F
	for <lists+linux-watchdog@lfdr.de>; Sat, 01 Nov 2025 19:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29DDB348F5A
	for <lists+linux-watchdog@lfdr.de>; Sat,  1 Nov 2025 18:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2F12FB990;
	Sat,  1 Nov 2025 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXVTB8Pc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C76329B77E;
	Sat,  1 Nov 2025 18:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762022848; cv=none; b=AiCCX1/JvcHmEpiN2CkemgXuWmjUHOLxLSX3nDtB+uZc72WJGAxiD9GtiRjDk8612aKdsOKBIQUZXqFHUONRXzUurgwjO9KYq+qjTgGLvBuHDcRPacrfE/VQG4cN2oA4WDzUdAG6sYZIw/9mIDMEA6mj025OCwN8Jru8s1lkeV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762022848; c=relaxed/simple;
	bh=TiX8ImpAffhxwcl2lLYi7G98G7M+eAjT59rE1akZGKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAzaZXXQxGUe46UVKcaNHynrWnTLQ+PiObW+d0xP6CAQLghtVsbK73oc+IarD//VqeXT4BzOUWuV04Qm1khC0juAG+o+6zWrvCdX2suK/3hE7iBH+BQGRh/+XrKWzIlwkLpKcjqMmmX7mxlJhy1MyLlzME33IJBPf5lcjUQ/RZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXVTB8Pc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF76C4CEF1;
	Sat,  1 Nov 2025 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762022847;
	bh=TiX8ImpAffhxwcl2lLYi7G98G7M+eAjT59rE1akZGKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXVTB8PcMP7p1J/9rvKEDadY9ExbUEtbqkzQGRiGn71BKwV1cF3la5KKFu5JLDC3L
	 URzeG3dQKwi9EM8Crft09ddYkocbqKWhvI7oDfZnBbaO/5cl1Bg71IaIeBQiYA1Cpv
	 8WjCo3Oai4b3RGb1lxx4myzifDDwVcUs0Dn9+C+aappBNrpvtoQNNXrYcJmBVytoTI
	 sLG/oup/ISzAngPbTIM3DFMQh3nW9xhCYTv/DRR1UzfRu4gSBuLV90NOKoQKxDW2Wd
	 ItiOjLGoXq6FMxX+yVZHJsNIaPp0+SV6T3Vaw59tPXzbCgW8g7J6NhTKhdYvIFm33q
	 kHZpHsvo0gClg==
Date: Sat, 1 Nov 2025 13:50:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: hrishabh.rajput@oss.qualcomm.com, 
	Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <wxdglhtsss4it6gfm3d7nngi6aezcvpcs44oa5mlmdwe34d5o2@qlkri6oknnpe>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <9421ff80-bd86-4b29-baca-c86da90c91aa@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9421ff80-bd86-4b29-baca-c86da90c91aa@roeck-us.net>

On Fri, Oct 31, 2025 at 08:24:44AM -0700, Guenter Roeck wrote:
> On 10/31/25 03:18, Hrishabh Rajput via B4 Relay wrote:
> > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > 
> > To restrict gunyah watchdog initialization to Qualcomm platforms,
> > register the watchdog device in the SMEM driver.
> > 
> > When Gunyah is not present or Gunyah emulates MMIO-based
> > watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> > present in the devicetree. If none of these device nodes are detected,
> > we register the SMC-based Gunyah watchdog device.
> > 
> 
> There should also be an explanation why there is no "qcom,gunyah-wdt"
> devicetree node, both here and in the file.
> 
> > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > ---
> >   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
> >   1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index cf425930539e..40e4749fab02 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> >   	return 0;
> >   }
> > +static int register_gunyah_wdt_device(void)
> > +{
> > +	struct platform_device *gunyah_wdt_dev;
> > +	struct device_node *np;
> > +
> > +	/*
> > +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> > +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> > +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> > +	 * the case.
> > +	 */
> > +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> > +	if (np) {
> > +		of_node_put(np);
> > +		return 0;
> > +	}
> > +
> > +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> > +	if (np) {
> > +		of_node_put(np);
> > +		return 0;
> > +	}
> > +
> > +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
> > +							 NULL, 0);
> > +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
> > +}
> > +
> >   static int qcom_smem_probe(struct platform_device *pdev)
> >   {
> >   	struct smem_header *header;
> > @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
> >   	if (IS_ERR(smem->socinfo))
> >   		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
> > +	ret = register_gunyah_wdt_device();
> > +	if (ret)
> > +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
> > +
> >   	return 0;
> >   }
> >   static void qcom_smem_remove(struct platform_device *pdev)
> >   {
> > +	/*
> > +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
> > +	 * watchdog device is not unregistered.
> > +	 */
> > +
> 
> Odd explanation.

> I would assume that the smem device is supposed to be
> persistent as well.

Yes, but it's perfectly possible to run a modern Qualcomm device without
SMEM, with a fair amount of functionality. So, the reevaluation of this
decision is grinding in the back of my mind...

Regards,
Bjorn

> Since  that is not the case, what happens if _this_
> device is unregistered and registered again ?
> 
> Guenter
> 
> >   	platform_device_unregister(__smem->socinfo);
> >   	hwspin_lock_free(__smem->hwlock);
> > 
> 

