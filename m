Return-Path: <linux-watchdog+bounces-1305-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577C9258C5
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jul 2024 12:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C78301F28995
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jul 2024 10:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431E61741DC;
	Wed,  3 Jul 2024 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tTSCYIFC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13894172760
	for <linux-watchdog@vger.kernel.org>; Wed,  3 Jul 2024 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720002798; cv=none; b=awm9HbbSbJioHeAGcwG7C4setck/feQudDVDB7l5+B3Qr64MZ55xAg+qOLiYVK245P61Z9ZVpg4HXtyjumFFjOy1D1qMI3zM7hDuwtX8uOoins7pyryry5nE99LH46n8w2BVbW8gykp0Xq75xd4IreAnsNaC47NFau/hRknv2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720002798; c=relaxed/simple;
	bh=4H5haDE7k64EWfuCw7wYQ8GiPFESg0dfVMdT8ZwOa9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueqsg6lJNa7Ob70MhSfS3TPlZkIxE3Ly2723xuk/ty56YwN3iodGW48otJdXO0QaOORGrbHkSK/u8z35Uy8Q1b/dshugA78UsBHoEwJKr8XoKtnd9R5J2ObeTZ465ppAom1pcOAp2uhGmGWSK+Idos4OZJVM5pO503KvZzSEOw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tTSCYIFC; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so58192541fa.0
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Jul 2024 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720002793; x=1720607593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrB2TnPNBgt+WbBBIM4+5QWbIuhtFAqbg6qcHUZxaco=;
        b=tTSCYIFCM9x8KJGViFEBb8Yb5gQu4qmjLgpYZIcAL+qddS7kr1YwE08ziXob92ubaN
         jxwD7gNYXoEj3AeZROLmWOwijpOpfqfBXc2P+7Dht3CxYPwt5vhIgE43AFlyaK07WbxK
         TRFYQ9/ANP7dDnvh5t9BZ8XTSbhu29pRLUA1RiRPZ/iCaFwjuCpzi4/1zo+lFAlUc2K3
         plULoOR7vKDyLMKkjdHppqmbIhlsuapIo/NEcwnCqu+RY+Bo5OoBm/6++/W4tCQbVgfv
         Q6iUhl4RNXmOAskcjO2HChzJOSHudruVGwoOSq7Fu0Ib6liCFbyS3zkuviBR0ja5g3iz
         n4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720002793; x=1720607593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrB2TnPNBgt+WbBBIM4+5QWbIuhtFAqbg6qcHUZxaco=;
        b=sr4UyYV+ym1EDa+OwRnCp0xhKodL5hbbfpWk/blhBfyhu0ceU6P/7ZId4C41+JK6l2
         i5vYmpVIyU3weAKRwrLu/aU2/LyATMXZwUWmIANO96UMvjv0KZHblPerd8YO/HO8GAT7
         hDbzXWfilxKuGr3j4B3QkbJ/8/E1yL+oeya0NlfmgwKty02gr/K4EO8/jh4DnNIsIazT
         /FdCesoxanfCHx0Q0MqJgiv4mIs+e+B28MhGqwlQ0meQv807wyHpTkVEpPT2IEJ4rRwI
         LvrBoujbbpw70UYHBmf9qcdGP35N2Ca4EofrWSNvknoDhmdvRgSdYSjrX47IsNTtJ8fS
         aGGw==
X-Forwarded-Encrypted: i=1; AJvYcCUPM3wPxoXYGJ8sgA3ZsRnpg1psbN5TLOTlG0eTVaGdkMzYtcTEpTUoOxTBg+99+VggDjExHYV4teVbLbMtT6USPWwRa/xpeN80oW4u6L0=
X-Gm-Message-State: AOJu0YyX9saHM3Z/+NX62DoKwndspwlOdrI21BAM89tCtHyeA2yuaddY
	Cwh15g0XGewjQLyPCYmnMrGZmOI6293qugDpTeSITB2rjRpEBYCKiw3Fo7XslwQ=
X-Google-Smtp-Source: AGHT+IEgLYgf/SDysaV48RHAuwJ+VgK2M5e2XinMD5byEgw07GiQwTlTQD6QPmY0VgdHWS5AezImMg==
X-Received: by 2002:a05:651c:49b:b0:2eb:d9a3:2071 with SMTP id 38308e7fff4ca-2ee5e6c9cd8mr61398201fa.50.1720002792033;
        Wed, 03 Jul 2024 03:33:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee51696991sm18684511fa.136.2024.07.03.03.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:33:11 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:33:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, jassisinghbrar@gmail.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, manivannan.sadhasivam@linaro.org, will@kernel.org, 
	joro@8bytes.org, conor@kernel.org, tglx@linutronix.de, amitk@kernel.org, 
	thara.gopinath@gmail.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, rafael@kernel.org, viresh.kumar@linaro.org, vkoul@kernel.org, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	robimarko@gmail.com, quic_gurus@quicinc.com, bartosz.golaszewski@linaro.org, 
	kishon@kernel.org, quic_wcheng@quicinc.com, alim.akhtar@samsung.com, 
	avri.altman@wdc.com, bvanassche@acm.org, agross@kernel.org, 
	gregkh@linuxfoundation.org, quic_tdas@quicinc.com, robin.murphy@arm.com, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	quic_rjendra@quicinc.com, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, luca@z3ntu.xyz, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, bhupesh.sharma@linaro.org, 
	alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com, 
	netdev@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	ahalaney@redhat.com, krzysztof.kozlowski@linaro.org, u.kleine-koenig@pengutronix.de, 
	quic_cang@quicinc.com, danila@jiaxyga.com, quic_nitirawa@quicinc.com, 
	mantas@8devices.com, athierry@redhat.com, quic_kbajaj@quicinc.com, 
	quic_bjorande@quicinc.com, quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, 
	quic_tsoni@quicinc.com, quic_rgottimu@quicinc.com, quic_shashim@quicinc.com, 
	quic_kaushalk@quicinc.com, quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, 
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-crypto@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com
Subject: Re: [PATCH 00/47] arm64: qcom: dts: add QCS9100 support
Message-ID: <43nktnqp6mthafojiph7ouzfchmudtht634gtxwg7gmutb5l7y@a5j27mpl7d23>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703035735.2182165-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703035735.2182165-1-quic_tengfan@quicinc.com>

On Wed, Jul 03, 2024 at 11:56:48AM GMT, Tengfei Fan wrote:
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.

Your patch series includes a second copy of your patches, wich have
different Message-IDs:

20240703035735.2182165-1-quic_tengfan@quicinc.com vs
20240703025850.2172008-1-quic_tengfan@quicinc.com

Please consider switching to the b4 tool or just
checking what is being sent.

-- 
With best wishes
Dmitry

