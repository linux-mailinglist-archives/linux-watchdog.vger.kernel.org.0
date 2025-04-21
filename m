Return-Path: <linux-watchdog+bounces-3331-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1AA956D2
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 21:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BFDA174205
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 19:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B7A1EA7C2;
	Mon, 21 Apr 2025 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2w67U6X"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1BC2F37;
	Mon, 21 Apr 2025 19:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745264591; cv=none; b=LjNGDIdVC+qqTdpWFU7RWhr81pqpYiVcTkvdBSkYFwnES+oNoadeA6Qmcx5vD2NyG1XOFapDTJqhrKXz5l9JsfWh1HIedUM8yn4Q+4+QId6YQNO8lYP4beOarY8Vgj6fD7X2SXqyxAgqhfwbLSPo1E5DMlyQgcehwp+Z8jPw3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745264591; c=relaxed/simple;
	bh=mbFRu4gB90P3Mi/FfFkSe82F4DRlvEx/uY0WdIUFdXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKzc2NtR3WcnI5Nx2S7ffdK+ULlZjbLGoAmZeP6j3bpz3kZY5DliTleE1yuNoSIgERrTbJsmd5bXC7bEUy0sdGKDDhH1q0fqUIPlzTiPMLVavYRQxcew6PWpQHuL+FKDlNTQDCq85v1op98o/eYVqZprDs/j0kJE7gYIG1EvPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2w67U6X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA69CC4CEE4;
	Mon, 21 Apr 2025 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745264589;
	bh=mbFRu4gB90P3Mi/FfFkSe82F4DRlvEx/uY0WdIUFdXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2w67U6XcmMHUD416BPDfjhkqqJz7okSxqUjZX3l+qfU7F68TQzyQ1kG31Tzr6Az+
	 ilOUiOqSld4ASOddTIJpHOmq6/MOspDY8e0vM1N3I7Vx7x7cwgScThDQ8mddB9y8mH
	 TXu/rcsN1YwSTHqqisfwtKxPuRhvECxU8k00XIp91PPDSagRP/8CIxVtz9pTMiybGH
	 tfxeDH92hrlCx7h5a2k096hM0MrWdsZDtLOknc5eOp6PEY65ZNO9IkgM5fxdveQTXV
	 5oLNmfYeVAQ77yXBy0eoVoExouOrqS4MNGE4wrZ1ARnuGY3meZ9rK2yAdrOSEZhMEm
	 WeeZyAgkz19cg==
Date: Mon, 21 Apr 2025 14:43:06 -0500
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
Subject: Re: [PATCH v2 3/5] dt-bindings: watchdog: separate out the IPQ5424
 compatilble
Message-ID: <20250421194306.GA2648051-robh@kernel.org>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-3-c65bba312914@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wdt_reset_reason-v2-3-c65bba312914@oss.qualcomm.com>

On Wed, Apr 16, 2025 at 01:59:20PM +0530, Kathiravan Thirumoorthy wrote:
> To retrieve the system restart reason code from IMEM, need to define the
> certain device specific data. To achieve that, decouple the IPQ5424
> compatible from the existing list and define along with 'qcom,kpss-wdt'.

You have missed the whole point of why there's both a specific 
compatible and a fallback. The specific one existed for a case like this 
where you need to start distinguishing the specific device. In short, 
this binding and dts changes are not needed at all, only the driver 
change is needed. Then you maintain forwards and backwards 
compatibility. 

> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> 	- New patch
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..e800f53381ef5626787eff1029bc94177e2635a4 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -20,7 +20,6 @@ properties:
>                - qcom,kpss-wdt-ipq4019
>                - qcom,apss-wdt-ipq5018
>                - qcom,apss-wdt-ipq5332
> -              - qcom,apss-wdt-ipq5424
>                - qcom,apss-wdt-ipq9574
>                - qcom,apss-wdt-msm8226
>                - qcom,apss-wdt-msm8974
> @@ -56,6 +55,8 @@ properties:
>                - qcom,kpss-wdt-msm8960
>            - const: qcom,kpss-timer
>            - const: qcom,msm-timer
> +      - items:
> +          - const: qcom,apss-wdt-ipq5424
>  
>    reg:
>      maxItems: 1
> @@ -93,7 +94,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: qcom,kpss-wdt
> +            enum:
> +              - qcom,apss-wdt-ipq5424
> +              - qcom,kpss-wdt
>      then:
>        properties:
>          clock-frequency: false
> 
> -- 
> 2.34.1
> 

