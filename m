Return-Path: <linux-watchdog+bounces-3656-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A37AD4190
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 20:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59E8A3A7DF2
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 18:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15094245035;
	Tue, 10 Jun 2025 18:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOUNcMY6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D277224502D;
	Tue, 10 Jun 2025 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578631; cv=none; b=Osk/EyPU/PxPWQYwbliHJo4vNV9sn6rr4Lrdr/LTNDLKedta83rS4f4Bw4vpANnGhhrS1LUvmtdbzArhKNVPapRSKbZnoFmTOeMHhiGsP5mISfudVRocyuuKwGwFFM4He9CkXy4Qy3NOTWEiBpxm3jY0hpOnTlbVTBgBj00BpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578631; c=relaxed/simple;
	bh=0FXesdT16ll5VQqpd28F2AInYnlkgcAfr92ynhKJufg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfzJ4dVs/i7ob1DwFJRLPmlSNQ4SxAwqBqF2DE7gU9TJfOyz3Oa36mwrrSNFhCnzr7j9UjXYzkwHTwXtIVKou5QuzCTYGF3GsTMdDm+CKdOZf9GFxhWUbg9z8YXli/KWdpTxNkLepNXIUahyQ3aEqDFGRhLb1i5AObyso8mhfHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOUNcMY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CD5C4CEED;
	Tue, 10 Jun 2025 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749578630;
	bh=0FXesdT16ll5VQqpd28F2AInYnlkgcAfr92ynhKJufg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOUNcMY6omd0mtCJhwQ42RVrLJ2AJQcHKKDp9J+zSDTTqhTq+2TJI/ikHULQuSgee
	 ExXK296xCTqwclHLkF56pS41NW3G+ph1ytOfJJXcMs/JZofmtIuxKwfhxS316Psc3V
	 rAMwzl0x4/3KUs9VhNbhiIRwC8jBnSnDPWHk2blS2Limqp+3Hg3CNkIRe0a9qXsJyt
	 pGtYmIrx1YLwoa825lK4JvnnrQCImI4TkePAw7e3ovdMHLv1BaetfG7WDnqTpTCIIX
	 EDKe3s3OmIiXf6YL4GM+KO1UF5qJyMDtUlniKMGU08kcNRwyh+kNJFOwyoZgbrcfQT
	 2WNOopJyqgvLQ==
Date: Tue, 10 Jun 2025 13:03:45 -0500
From: Rob Herring <robh@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Message-ID: <20250610180345.GA2382213-robh@kernel.org>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
 <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>

On Tue, Jun 10, 2025 at 07:15:19PM +0530, Kathiravan Thirumoorthy wrote:
> Document the "sram" property for the watchdog device on Qualcomm
> IPQ platforms. Use this property to extract the restart reason from
> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
> entry with this information, when the system reboots due to a watchdog
> timeout.
> 
> Describe this property for the IPQ5424 watchdog device and extend support
> to other targets subsequently.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v5:
> 	- Rename the property 'qcom,imem' to 'sram'
> Changes in v4:
> 	- New patch
> ---
>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -81,6 +81,16 @@ properties:
>      minItems: 1
>      maxItems: 5
>  
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      phandle to the IMEM syscon node that exposes the system restart reason
> +    items:
> +      - items:
> +          - description: phandle of IMEM syscon
> +          - description: offset of restart reason region
> +          - description: value indicate that the watchdog timeout has occurred

A 'sram' property points to an SRAM region (see mmio-sram binding), not 
a syscon and offset. 

The 'value' should be a separate property or implied by the compatible.

Rob

