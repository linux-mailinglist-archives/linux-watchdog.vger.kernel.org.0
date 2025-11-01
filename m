Return-Path: <linux-watchdog+bounces-4497-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77205C28590
	for <lists+linux-watchdog@lfdr.de>; Sat, 01 Nov 2025 19:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF7B3A1F48
	for <lists+linux-watchdog@lfdr.de>; Sat,  1 Nov 2025 18:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8B81624DF;
	Sat,  1 Nov 2025 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5fsJpIU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7B01DF258;
	Sat,  1 Nov 2025 18:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762022512; cv=none; b=Ax/Y3qgayQorMFVj1FRoCpdJBj2T74616TQ5VIQme7SwCih6pNta3fMW/HBUL/y6xHonBQ12C7BCG+pg2xgfinKPYvaqWGtPe8Xgc1w2W4Uw8xGkH66wlvJZWzbgVYCWe4C+STh/aualVcc30pTXiQfmW2ZgOmGKiYBwxlGl6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762022512; c=relaxed/simple;
	bh=ambZ3XidKfQZ3Fn30uXYRJ1wi7YZbsUP7d5PN8J+beo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJ/qcus1Rjms88ILHiVDLcKTP8JUckmFc/6ZAD4LVeYbrkfA8tLnbdFFDtAejrevthVJgU1ehCl+8rLBWoZbRVJLP1sLqP3TjCMad2vPM3VvAzgsvAstM46u3iXbwpxvGZ67rUExNGD9UMiiZA1tTDul9jBT0dG1vo5PNHQFn8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5fsJpIU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D20C4CEF1;
	Sat,  1 Nov 2025 18:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762022511;
	bh=ambZ3XidKfQZ3Fn30uXYRJ1wi7YZbsUP7d5PN8J+beo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5fsJpIUJtCDah+w5WNNoRcXjdcdunO8gLfdH9aOrFSFNQaeTk/1+GI6m2tCmmrzP
	 E4/ZLTplxBh9jKXZBiH5RN//ASQZKrRoi9WJ6NTs39pKf2d9agXK1BomYq5T2zbduJ
	 /DC4qQUUfaGPbTVdVx3oX+T7Mqs/3NbDa5R9ACGzxArHPugeaQMqac36kEDxSh5O1q
	 uZJtgq6+Yu9mWK3PeK1QwIpDEx6Pw+Ku0qvvc6A9ctfkRx6yPiVGHER1hcjR6+nP3H
	 DuJ0GJzHGDAAp3whukZ0KoB45BhdsWqF+uF/YZwKNH/6cwPDYLztuEIjS4ACepayvs
	 3/DaeA0fEYiTA==
Date: Sat, 1 Nov 2025 13:45:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: hrishabh.rajput@oss.qualcomm.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> To restrict gunyah watchdog initialization to Qualcomm platforms,
> register the watchdog device in the SMEM driver.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based
> watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> present in the devicetree. If none of these device nodes are detected,
> we register the SMC-based Gunyah watchdog device.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index cf425930539e..40e4749fab02 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>  	return 0;
>  }
>  
> +static int register_gunyah_wdt_device(void)
> +{
> +	struct platform_device *gunyah_wdt_dev;
> +	struct device_node *np;
> +
> +	/*
> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> +	 * the case.

E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?

> +	 */
> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> +	if (np) {
> +		of_node_put(np);
> +		return 0;
> +	}
> +
> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> +	if (np) {
> +		of_node_put(np);
> +		return 0;
> +	}
> +
> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
> +							 NULL, 0);
> +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
> +}
> +
>  static int qcom_smem_probe(struct platform_device *pdev)
>  {
>  	struct smem_header *header;
> @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  	if (IS_ERR(smem->socinfo))
>  		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>  
> +	ret = register_gunyah_wdt_device();
> +	if (ret)
> +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
> +
>  	return 0;
>  }
>  
>  static void qcom_smem_remove(struct platform_device *pdev)
>  {
> +	/*
> +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
> +	 * watchdog device is not unregistered.
> +	 */

Why? I don't see why the code needs to encode such policy, please
explain.

Regards,
Bjorn

> +
>  	platform_device_unregister(__smem->socinfo);
>  
>  	hwspin_lock_free(__smem->hwlock);
> 
> -- 
> 2.43.0
> 
> 

