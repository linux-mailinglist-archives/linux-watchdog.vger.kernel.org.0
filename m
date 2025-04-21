Return-Path: <linux-watchdog+bounces-3332-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B639A956D6
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 21:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B322F7A4E30
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 19:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D68D1EF389;
	Mon, 21 Apr 2025 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ja3DSu2u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D431E7C25;
	Mon, 21 Apr 2025 19:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745264646; cv=none; b=UtA+9CoqwSDzM1dEcZ/aRyFHZr4ZTZtBj4vmPAqJy7ClZK3OOMI16ybqL0BSu6kTOhRipezaudVOcu4sBSuDw2Ae864Cp3ifPRuKNmrivQFQzt7J6E+o/r8PQln941oOYgfaBsjIcfbcetvvnBR37P8WESqiO4S4VNX4YI/00og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745264646; c=relaxed/simple;
	bh=OQPd287Xqaz5BKCPqxpAWyeo8nqSBSiCzbKGCNX3e/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4d/LoOnod0dPVBZ3BvJ7+zFdlrEcOkmOrx4whjCN1gGN8qZz6PrxGDYuUP6F9cYBA1mka+DN0ibhl5UiURfzQfN7j9zVwHSa1NvIF2ZsRZi+xmm0bHoVM3tdgkirq5FZdp0bJTCY8O7XzRJ4cWtYtABopGkCeIT/qY5b7whMY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ja3DSu2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FB5C4CEE4;
	Mon, 21 Apr 2025 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745264645;
	bh=OQPd287Xqaz5BKCPqxpAWyeo8nqSBSiCzbKGCNX3e/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ja3DSu2uajyCRUi5DOTo++HYxnIuapNJcsC2X+ZL41UanqjfwezkE/D6Uh+suOAV+
	 IsgDsgF1miayazfOwHo10++SehOBlL6bXMtC0diMFTm/0/dmP5Dn5q06LSK7LjqIDj
	 p2q3E1hBela8/i0eZLxBZDzrZv/d2V6E9Zimr9LFCgpXH6EP1ofcHzPYOUCuiSKu+B
	 PQZNI1cuyODAPZi3LaZzfH/xjNab/qrtehsorSyauNs90adE9gSrhZDRIRdYQyitXU
	 6EBGM0D9Al+6JZ0dxEmy48lx0e/XAOjGFN3X2ZkvJFLBvOxf5TeC55yQf7e3vIiM2n
	 S/BYG/5Gr4IgQ==
Date: Mon, 21 Apr 2025 14:44:03 -0500
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
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: ipq5424: drop the fallback WDT
 compatible
Message-ID: <20250421194403.GB2648051-robh@kernel.org>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-4-c65bba312914@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wdt_reset_reason-v2-4-c65bba312914@oss.qualcomm.com>

On Wed, Apr 16, 2025 at 01:59:21PM +0530, Kathiravan Thirumoorthy wrote:
> To retrieve the restart reason from IMEM, certain device specific data
> to be used. To achieve that, drop the fallback compatible.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> 	- New Patch
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Just so it is abundantly clear. NAK.

See my reply on the binding patch.

> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf..21252352b7328e4a1b7ba6ca7080f73722f097ad 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -376,7 +376,7 @@ intc: interrupt-controller@f200000 {
>  		};
>  
>  		watchdog@f410000 {
> -			compatible = "qcom,apss-wdt-ipq5424", "qcom,kpss-wdt";
> +			compatible = "qcom,apss-wdt-ipq5424";
>  			reg = <0 0x0f410000 0 0x1000>;
>  			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>  			clocks = <&sleep_clk>;
> 
> -- 
> 2.34.1
> 

