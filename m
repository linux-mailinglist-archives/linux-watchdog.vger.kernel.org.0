Return-Path: <linux-watchdog+bounces-1308-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5AD926467
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jul 2024 17:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E96D828C43B
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jul 2024 15:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BC917E46A;
	Wed,  3 Jul 2024 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e52F586N"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1F17FAD4
	for <linux-watchdog@vger.kernel.org>; Wed,  3 Jul 2024 15:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720019392; cv=none; b=KZQQ5lXjueFm6T0qtEejpudjh+qDb8tFHAYGvjlljtCDn87Hscbr+zOzLMYQKhSdic60LgBBiALKmExGJGLtmmvs0z+2T3M3CeN4Dy8a8L4pd+51smH+AGQWLFjsLDUtq8ZjwJjAhj56zJxfTQFZO78RCO8N4TjBe4yxrRI8kGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720019392; c=relaxed/simple;
	bh=fhpejWcF/vfLe6nwrakqQTsElpgre49BCBgEinb2+BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hy6agEkzcclMrJEADqlXH1J3rfgCXoldYrxWvASeeXYWGRQ4EalNn63JzcuAVKMPlOxHzrFYsdWaIMmEUT+wRZNBY5p+fErODgHE2iirUpNS511xngjP78b7yIRv6ShtHkRmtRNPRLwkGtIFKfG+TRJ3Oiy3irknjYlmKeG226w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e52F586N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720019388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OwJT/oF0rqnt+S31sg05vpTbadEupYIHlD2ocZCHgDI=;
	b=e52F586NIB84ITfcy2V8nSvLTtElmJHPUfmPuuDiZd9zwPiNVk1909O1xNXgGTzV8Le+fH
	NfFAbc7XZZDP6ym/1mQt81SWERqw/d1OeHPN3skISyh8yjK4EOlfgPJwLOywaShql0/OFx
	kkwLXl5vT8l40vYZifvcvwpdCCsqzEM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-3JzH4-3SPqaRtwdqV2Pbzw-1; Wed, 03 Jul 2024 11:09:45 -0400
X-MC-Unique: 3JzH4-3SPqaRtwdqV2Pbzw-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4450544eaadso69205031cf.1
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Jul 2024 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720019382; x=1720624182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwJT/oF0rqnt+S31sg05vpTbadEupYIHlD2ocZCHgDI=;
        b=wG+1HOXzcFyY9ojrqtP+BwwhKdGkpq8HyXWK8/SywIJ3JvlrWpu0FpLiAsWHeuL9bm
         tkC1iVI3qCvpLPSZCGvvoJU/yjhU7TdUAdauq/e6jXU3DuTFQ90+59ZpXYRldTe+m5Ck
         Lz69mQ+eLuJHgRUuz6MgoiChN0WQ4dy4qCyI85fOcCx2lTog4NAHhqhsHLsF+azg7mHV
         XBNBIcd66unGIp9V8GdGTJxhp2iN1f80JLD2ZUxMTjtebv6B7JzfEo7fQ29qgKFqpJcv
         VHy9YfJEDtST03giUTnsb9oFc/5NmGXdSmoENuCCQTGViKdUJxAiFDv+qO3AIMRmeQn8
         AnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFcCfgEDqYCtMXSQLcZzbcG6HQ2CefDX8Pv7S7B8Nok6UB9IPBnXXjLaH6+k/lf465uX6DS+Xzz0j0EYdMIGKJaVP9AK5fVGm4N6Ppj6o=
X-Gm-Message-State: AOJu0Yz9ub2Jpgx2+TcdZcKUgArHo+ax0WEuAASelwugkzAUFE4d+yVe
	Qk6ofeVlFUlQckj60ow+peLT8NADSk79eT2zJ6F12lAeJqzdxR+CdvkK46mCzOaRTnC4mv8oMH3
	POcfULxY1ByDpsfe080tmaYv1wrzxdxS8bkNc1qY96LP9yM852cLa8nMqFt1Ia/AP
X-Received: by 2002:ac8:7d84:0:b0:444:b495:e94d with SMTP id d75a77b69052e-44662c99f4bmr119753151cf.3.1720019381984;
        Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8jWmpy5/3+Y1qV1pkAlEofbtK+RF6spB2E3wXQKII8gdILaaxSAxoLFic14g5Q4iTwcc7CA==
X-Received: by 2002:ac8:7d84:0:b0:444:b495:e94d with SMTP id d75a77b69052e-44662c99f4bmr119751991cf.3.1720019381501;
        Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465c4bf7ecsm43222571cf.80.2024.07.03.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:09:36 -0500
From: Andrew Halaney <ahalaney@redhat.com>
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
	krzysztof.kozlowski@linaro.org, u.kleine-koenig@pengutronix.de, dmitry.baryshkov@linaro.org, 
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
Subject: Re: [PATCH 29/47] dt-bindings: net: qcom,ethqos: add description for
 qcs9100
Message-ID: <u5ekupjqvgoehkl76pv7ljyqqzbnnyh6ci2dilfxfkcdvdy3dp@ehdujhkul7ow>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-30-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703025850.2172008-30-quic_tengfan@quicinc.com>

On Wed, Jul 03, 2024 at 10:58:32AM GMT, Tengfei Fan wrote:
> Add the compatible for the MAC controller on qcs9100 platforms. This MAC
> works with a single interrupt so add minItems to the interrupts property.
> The fourth clock's name is different here so change it. Enable relevant
> PHY properties. Add the relevant compatibles to the binding document for
> snps,dwmac as well.

This description doesn't match what was done in this patch, its what
Bart did when he made changes to add the sa8775 changes. Please consider
using a blurb indicating that this is the same SoC as sa8775p, just with
different firmware strategies or something along those lines?

> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 6672327358bc..8ab11e00668c 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,qcs404-ethqos
> +      - qcom,qcs9100-ethqos
>        - qcom,sa8775p-ethqos
>        - qcom,sc8280xp-ethqos
>        - qcom,sm8150-ethqos
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 3bab4e1f3fbf..269c21779396 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -67,6 +67,7 @@ properties:
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
>          - qcom,qcs404-ethqos
> +        - qcom,qcs9100-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
>          - qcom,sm8150-ethqos
> @@ -582,6 +583,7 @@ allOf:
>                - ingenic,x1600-mac
>                - ingenic,x1830-mac
>                - ingenic,x2000-mac
> +              - qcom,qcs9100-ethqos
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - snps,dwmac-3.50a
> @@ -639,6 +641,7 @@ allOf:
>                - ingenic,x1830-mac
>                - ingenic,x2000-mac
>                - qcom,qcs404-ethqos
> +              - qcom,qcs9100-ethqos
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - qcom,sm8150-ethqos
> -- 
> 2.25.1
> 


