Return-Path: <linux-watchdog+bounces-2375-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BCC9B4D9D
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 16:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E727CB253C8
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 15:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAED3194137;
	Tue, 29 Oct 2024 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KxG/93OG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43204194AEB;
	Tue, 29 Oct 2024 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730215213; cv=none; b=Iea3lgnH5EcC7waW4ji19d8zRiyg5V08dyBiTphxyzb5TcXz0QNWNJRJbUSmm6ID49MNi7b6LmxPWJ2fJa/eZO1hhUQUPOdBO66mIOB02N+wE6FQZDf9QRBTSYm8aLr5+lnbOJG9L0mur6TrfkfD2TMQYWQmMLsBX2H5nDJ7jLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730215213; c=relaxed/simple;
	bh=jWuJhmtZFlyHTasQKwjpYMmMNwzP77Re8TC3NJZyTcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DsMdvFUPwH4BeqrLsgfGowreSvOFzixm1i1is/pOHpC37VsRNTZROBdZR3py01rdbFpu4v7dnDT8mlFtWRdVHUjpHY1k7iPi4PfMBd7vDxFM9rDozZDrBc2jmIlrJfMuj+vV9GCw/eHbaSEVUzjRKacOU209pn03/wujN0tCkvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KxG/93OG; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCdqNt022607;
	Tue, 29 Oct 2024 16:19:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Z8XNKjRmmoSHtbnT+B047583tz490Iz4vVOFdtNZoJY=; b=KxG/93OGMT0y3/HC
	7uLC6mepBHlev9qb+A1+0+nlA/pBdVdCFbM5nrX6u/iugpMtuqVJUi+JBWvup6rL
	KEUcHHzfpjQpRihICT3xQUavnBK8L+nBjfN99qzNDGlzw5VrTmeiEg+w08PtOFbx
	XSQR3EM0xJVd81al77bI1tf6qMFpVJlYoyioe5gDR3U+Dcjpx5KTDJ/RMhrQvhzt
	MYIHDjb9+izNsnEYfM0G0LSvotGvjLXVG3c10eVmv9iykRDHrpfHQ+yec7dRgD+N
	XO/K6ttmdJ5yjfhLUni862l+IuZUYQbxSXx/JZR2qR+PbUJrrLVme1EjqVSeMh+8
	wPMQ5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gnj4fhxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:19:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4D3114004B;
	Tue, 29 Oct 2024 16:18:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE10C270D44;
	Tue, 29 Oct 2024 16:16:11 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 16:16:11 +0100
Message-ID: <43c2cd64-2c70-43f3-9470-b6f8bcaa8027@foss.st.com>
Date: Tue, 29 Oct 2024 16:16:10 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: stm32: Add IWDG2 EXTI interrupt mapping and
 mark as wakeup source
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Guenter Roeck
	<linux@roeck-us.net>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Richard Cochran
	<richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-watchdog@vger.kernel.org>
References: <20240623195136.81522-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240623195136.81522-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Marek

On 6/23/24 21:51, Marek Vasut wrote:
> The IWDG2 is capable of generating pre-timeout interrupt, which can be used
> to wake the system up from suspend to mem. Add the EXTI interrupt mapping
> and mark the IWDG2 as wake up source.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-watchdog@vger.kernel.org
> ---
> V2: No change
> V3: No change
> ---
>   arch/arm/boot/dts/st/stm32mp151.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
> index 1804e202eb425..68846699b26fd 100644
> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
> @@ -355,6 +355,8 @@ iwdg2: watchdog@5a002000 {
>   			reg = <0x5a002000 0x400>;
>   			clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
>   			clock-names = "pclk", "lsi";
> +			interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
> +			wakeup-source;
>   			status = "disabled";
>   		};
>   

Applied on stm32-next !!
(late but applied ;))

Regards
Alex

