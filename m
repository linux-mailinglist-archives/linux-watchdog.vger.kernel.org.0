Return-Path: <linux-watchdog+bounces-3542-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADC7ABD06B
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 09:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97F8C3B172D
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 07:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7269F25D53E;
	Tue, 20 May 2025 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kP6NyI9+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE491C7005;
	Tue, 20 May 2025 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726130; cv=none; b=g3Vio0KfEDDtHDZAbb2wXQAAQyjiUnW/N6qpSh7ahs413n7V5XK/TAgsGanwBw52pKMgKd84dvEnz5tVAGnR9eezKcBv+0p8xcjFR4vKAxMhyLPRjmhGHj3/ai3t4teYeN1/ALkepp36Qie8pa+UfP/w0tFGmfY3oBS50kZ1zK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726130; c=relaxed/simple;
	bh=HO9ucwhaXUkQzu0JUUQ+zvwKfyL2gfVKVZ7It02K/wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkMC76aNiYlNj/qsf/B3f+cb1br5iB37E7QSEh2uopG3YdVMP9H7Z3IIkq1MBPnLBzZdcyk3yJWQ4nuXI143M5Djd7kELjkGb4xwRi7HAQzbraTyPCLT4s2/fweLQyDQC8U4/2IcHGWanbQsrZXCJYBekWBOKRECWH2lGKtW3TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kP6NyI9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C4EC4CEE9;
	Tue, 20 May 2025 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726129;
	bh=HO9ucwhaXUkQzu0JUUQ+zvwKfyL2gfVKVZ7It02K/wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kP6NyI9+gZBW6FupwR29H2NIsMpS4aeoTiDMpVU+h3yixnuPNViNpkXnkc+R1CqRD
	 MK+ttYirreI+kM0NhKbrPkrXJC3Ixkx10o6fZUwJHP71OYDQiWrze307LLDjh2rf5f
	 7/FhYYMf7NRDiHIgSHoJurIRkHs9jM5FbSgAJEjK6eWKTLx6MyKTH/Zeskem9AqPSZ
	 /402BLjf2Fzg9hhglue04hzbBAG5hlIbcfx31yR1jYdc4o/s1XMxr/eOO7SUDtl1rX
	 QMNcJdmFUsX+xWeUz2ClWubHISudd2QY5FV/XfVhMYc9D5cSiMXI29s7BajlTKiL5A
	 9QdqlJox7faGg==
Date: Tue, 20 May 2025 09:28:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
Message-ID: <20250520-delightful-aquatic-woodpecker-d854f6@kuoka>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
 <20250519-wdt_reset_reason-v4-4-d59d21275c75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519-wdt_reset_reason-v4-4-d59d21275c75@oss.qualcomm.com>

On Mon, May 19, 2025 at 02:04:04PM GMT, Kathiravan Thirumoorthy wrote:
> +static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt)
> +{
> +	unsigned int args[2];
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,imem",
> +						    ARRAY_SIZE(args), args);
> +	if (IS_ERR(imem)) {
> +		ret = PTR_ERR(imem);
> +		if (ret != -ENOENT) {
> +			dev_err(dev, "failed to lookup syscon: %d\n", ret);

Syntax is: return dev_err_probe().

> +			return ret;

Best regards,
Krzysztof


