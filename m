Return-Path: <linux-watchdog+bounces-4714-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3331CCB4DC
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Dec 2025 11:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6C48300D14F
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Dec 2025 10:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88472DECCC;
	Thu, 18 Dec 2025 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vh8DhXGI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF400231845
	for <linux-watchdog@vger.kernel.org>; Thu, 18 Dec 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052386; cv=none; b=Wq7r/qo9huPhZhDSU1ceivpgW3XQPAQtpr+U1u18x0lEtjnKu2yALwY5xfy/3MgGDergNlee3nnD02zbRp+BD4WmjcPfb7sY6v6UMbxXDJyNaaFShnRBUKPttjR4mVmcDNCNLC0UsP7pybdcPAlyIIKaMwTtacg7KxFUm/e7uzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052386; c=relaxed/simple;
	bh=00v3kzAV4duY2v2/dB54DflNOIbH5D4CPWqrg3MyJZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPJGBaoRrZ0a8FBH/eOTruVcbw7FrI8Fi3vVDgX6VCNfQv3HLjLDKx+XuYwbSqlEAaL2nsnb9IQsUnMEVfjohE8iLw9mES6wtlrT8UyNLUhz1uZrFPsURiCnHEUdp2Osq0Kj8Y0mIoU7Dxd8H+hkGpryDJYcYyDFzJFH6KLP5Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vh8DhXGI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so619602a12.0
        for <linux-watchdog@vger.kernel.org>; Thu, 18 Dec 2025 02:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766052382; x=1766657182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eMH8wF/DkKC3kkFwo7pbjYWtxpqsSiixfrTZUtPLmDs=;
        b=vh8DhXGIpbMLGAmpNGkUa7l6mHdGkn8ZsVxvEd36/X86Y2beLx949ux1oGWOJe8GXU
         URjI2s/ClwZbTIfZlPP/vFWf7SpVch8hP6d1XLItq+kTOfW/bbhSY4gFGCR+g6szQP4Q
         rTtQ+fXe09cEn5ilYaQcoLcMogJ2TsXSupfCVktcH/LuhkognN+ClT0vtMA9TgTfEQ3S
         TIkBH1rliLYIDUS394VepaJOkx2y/l8H0zWAoMWIvzdQqO0z4nJ2JeoYduieWlsDjwbL
         3norY9qTI8w43dcP0XUz6r6XV34Ll/mhPsCnnEE0fZkyz5qlIGKx6pFLoVF1/jWu7Rl5
         juyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766052382; x=1766657182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMH8wF/DkKC3kkFwo7pbjYWtxpqsSiixfrTZUtPLmDs=;
        b=DfBN107RZoywEjjzoOx38MvQ+YhscyC8QEkI6VORpZcG/tHjDrbE97d67mRzTAhlbJ
         bbwYUmRd4QXtAWQMTsHMDBdr2gBU7QBe1MBPl+tCKv8gJaEga2en5cTe9PZU6wn2mflb
         izzyQ9/5f7w0lk6Dg0FoiPT+5cBAgQNryfiveG6QOVO4+KHASLtk9EdtJM3XxbdKujWa
         q0OM62oVB/JUrjZL/9OvW5AQg/5Wkw9ZZKMMIj6gDSRE9OJsffHBsQxcWFVOeztgSu4t
         tGMctEwc8UAy/PThOHcUPxHgdWsgqaCMy8VeEYOykAWvL2j9agqRWwxeumBzHDB8EA86
         AShQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfTU7SOw4QAAgL/XkNmStIJca+eksehSNnSwcGURHLcU9cmHMp8Km8+XhhU8LL2msa6JZ4y5mGSTHgPTiLKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXpZ5AbDFJQPdHSPeWVfqmdEHnmiwFCJ3YFOmchO+JELWju7ZP
	FD8OlKOG3kN1BOjnfwVhRuN7y93tvDBAhPV0Wi30vAqboZxxdjQ9WlbzjLv80qV48BA=
X-Gm-Gg: AY/fxX6kQvlgBHIivgYt0mKg8y8aQS+IKDeqrNuxAIFhe7we2MzWxJGJLMzPO9mCgNA
	NuCpJRroWfAzcinv32FEgEQZJhrvTfTfymJDpiKk2GHpIgkNoHXLpgWdJ3LY1X4ZmIQsdZzO+A5
	RElYP7lHavS3pKGUinhRiq7mht7g6bHd12sSpHG8MPxiogu5D0mPR+wp7XSFH/gpwIVSvCBCM3o
	3U7zxuhvvNG43btcS4ncPiI3aKWqN470Ac9mQ7o1RLze5S91ER+0TPDE1Uo6TMUUviaeSDPIsCj
	qJzitAWpj3E3VHL71B/n5BJCqRuZr0jCqVOEfdDOwE5nnOsQ6mLQ6sBcjgjnENG0lbulZGIg3Cg
	cVKXs0TjN3d4tVJRPDj5uJs/NRpz9KLq7/nMF5N/h9bA+jGkoSGbcrcYtvevbtbkX0CvYaowkc2
	cRhouc3CbTH00PWacOmSWw3fU=
X-Google-Smtp-Source: AGHT+IFA6SS4YOPlrBDtk9PjM8zZe1pqVrSvNV8OpH8V3h+3nAk0ughsiQ0KfmvcLkZxgEp6dOM4bQ==
X-Received: by 2002:a17:907:7ea5:b0:b7c:e3ad:cd17 with SMTP id a640c23a62f3a-b7d237756edmr2384134066b.32.1766052382145;
        Thu, 18 Dec 2025 02:06:22 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4410:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f93e8esm185717366b.11.2025.12.18.02.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:06:21 -0800 (PST)
Date: Thu, 18 Dec 2025 11:06:08 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-el2: Add the APSS watchdog
Message-ID: <aUPSEM2AFPTmQLtv@linaro.org>
References: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
 <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-2-94ee80b8cbe7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-2-94ee80b8cbe7@oss.qualcomm.com>

On Sun, Dec 14, 2025 at 10:49:59PM +0200, Abel Vesa wrote:
> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> block, same as older platforms. So describe the APSS WDT node in the EL2
> overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-el2.dtso | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> index 2d1c9151cf1b..404174a15659 100644
> --- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> @@ -7,6 +7,8 @@
>  /dts-v1/;
>  /plugin/;
>  
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>  /* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
>  &gpu_zap_shader {
>  	status = "disabled";
> @@ -55,3 +57,17 @@ &pcie_smmu {
>  &sbsa_watchdog {
>  	status = "disabled";
>  };
> +
> +&soc {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	/* The APSS watchdog is only accessible in EL2 */
> +	watchdog@17410000 {
> +		compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
> +		reg = <0x0 0x17410000 0x0 0x1000>;
> +		clocks = <&sleep_clk>;
> +		interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-parent = <&intc>;
> +	};

For consistency with &pcie_smmu, I think it would be cleaner to put this
into hamoa.dtsi, mark it as status = "reserved"; and then enable it here
in the overlay. That way, we have a full hardware description in
hamoa.dtsi.

You should also be able to drop the interrupt-parent if you move it
there.

Thanks,
Stephan

