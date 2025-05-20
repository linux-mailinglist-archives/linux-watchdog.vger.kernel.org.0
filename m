Return-Path: <linux-watchdog+bounces-3541-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC95ABD065
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 09:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC8A4A3A27
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 07:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9240725DB1C;
	Tue, 20 May 2025 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8TUJdxo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06C25DAF0;
	Tue, 20 May 2025 07:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725958; cv=none; b=qOYT8T4uyWEqACqxk9UNbVAtKCt+ze6h9IE7hd29xg9id6rC2ID6lQcPY56+tkJRWFGMoE3FqM70xZEu/oSXqWcJZf5kQPAbrIAHAZumxTO9o0Opk8/AU19udcDQoT3JEo1wjfn7oZSDXHD4sf5tcwfVt7YleYa3dl1gEY4ywSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725958; c=relaxed/simple;
	bh=K5wAkRXQ6Y9YIkM2Og3UgpGW6RiiXr/vFZyOrfao/ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBZm4xSI3inchm24SS4YBIQOo9gaAsitIYkT60NLH3IQ4sYXavRXzOXDuqvvDspvG07C4R8ev/tVMG2fHCY0cKKSn30uxZEAua3VCnktEg9LnnBug1HEN330ul6AMLSNf4yZCL4215L4fMP7yvBVcn3GGhP3jFVNmhTYIp9rz84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p8TUJdxo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5B8C4CEEB;
	Tue, 20 May 2025 07:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747725957;
	bh=K5wAkRXQ6Y9YIkM2Og3UgpGW6RiiXr/vFZyOrfao/ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8TUJdxoO/40TAgoljI4rPhypmnrk7l25LgWBnolz2rR6XJbwwSsdbnGeboZet2WI
	 61pOngRl32zng+ZZIgV4inWhBug7/d/une7jmJLn56vuKhe9db0ZEYpCdvkx6vMJPz
	 DH9s0FixRZRGjruTGuaRVzokdzK77aGCMKH85fQe/ctw1v8Ja4ebgCBtDoaiVnljfS
	 HDj/S0EzNobZomuDo33q61mWIKhg8VBaCNyRUVEWJQasWEESC3Rp4O2tTcMD+Q11UG
	 h3kQaQi6tq9trsyE60+dW/mlzJzXu6kIEqgnOE2eKwEGO5t2y8Ync/9/q/rUO6mWs8
	 K5bm5ysUM4u/g==
Date: Tue, 20 May 2025 09:25:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document
 qcom,imem property
Message-ID: <20250520-portable-anteater-of-respect-c7be5c@kuoka>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
 <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>

On Mon, May 19, 2025 at 02:04:03PM GMT, Kathiravan Thirumoorthy wrote:
> Document the "qcom,imem" property for the watchdog device on Qualcomm
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
> Changes in v4:
> 	- New patch
> ---
>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -81,6 +81,16 @@ properties:
>      minItems: 1
>      maxItems: 5
>  
> +  qcom,imem:

Shoouldn't this be existing 'sram' property? If IMEM is something
similar to OCMEM, then we already use sram for that.


> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      phandle to the IMEM syscon node that exposes the system restart reason
> +    items:
> +      - items:
> +          - description: phandle of IMEM syscon
> +          - description: offset of restart reason region
> +          - description: value indicate that the watchdog timeout has occurred
> +
>  required:
>    - compatible
>    - reg
> @@ -117,6 +127,16 @@ allOf:
>        required:
>          - clock-frequency
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,apss-wdt-ipq5424
> +    then:
> +      required:
> +        - qcom,imem

No, drop this. That's an ABI break.

Best regards,
Krzysztof


