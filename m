Return-Path: <linux-watchdog+bounces-1201-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4991A40A
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 12:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 450FBB20CC7
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 10:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7FD13E41A;
	Thu, 27 Jun 2024 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WtUu1cdh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B5C13C831;
	Thu, 27 Jun 2024 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719484699; cv=none; b=dRvhC0UWQSkSzkOmxwCZVV6ttu9KlVMTR+HuWxP9c1eMFPq/mAxxmkXkbMOuwTYqTGAUx/QgSvQRTsVLptlsAKY6ydpBA2WIBbr7lL4bPoHCPlXo7tRgT2DD+8NsGAKZnkX2D0Ynb7yd38T3sMZLT/XoU3KBT1jwBi4OXzs3SpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719484699; c=relaxed/simple;
	bh=blg5AQRINgzDYB2M+iU5BJ2iQ6WA8Das//y1GF975sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IXF0UXR4YyUFcME7nY1+BTDNwRNX5RfvDhCi8Q4zLQUm1mlM29IuCEtAJp1BITE4Edi2HYxqgmN/6/qQn5KFtFVOYdarlmt/HrfDw8ygDJwMIcU97gB5FO0nuE7HZEJseMtszQ/htE+PsNss0AfvXAMy62XLQ7dr/65Ky16v1eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WtUu1cdh; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R7m8Ph031056;
	Thu, 27 Jun 2024 12:37:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pN++2ujzdbFJwZfUqOV3yOY6BX5oEhjCHKWQP0tE4Zs=; b=WtUu1cdhoWfx5rCv
	fwouGVfCGu1j/kwIPGWRoNGxyqsLcwIkih/FjN69IAtjw1uZzh3VGWmhoeFxdELo
	lXIlfKKKnvcHNG8KH0yXfOhU/egSxEkPxs4yHZlSdCZok4t6vvuu6MR5AXpG3Nn7
	d7rwsNct5LaIgqmYAZriFCPxtD5vFBSiZ6So4W3EyAWcX6Jxg4AmgVNbsiEYXyX7
	Y+VMZ1ABt51cizO8cQhmCxW8kKqP2nigS1TleAOyOuiPTvVr3mvPMFgk0tkPQUxQ
	6WxRjTawDKt+lsWlyCwxOw9Z7MyfmueX8I1W9uwGhrvOcAL9+m5xE/M3Q1bPV3jH
	sf3KAw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywkr5mqgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 12:37:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C46B04002D;
	Thu, 27 Jun 2024 12:37:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34FF821685E;
	Thu, 27 Jun 2024 12:36:24 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 12:36:23 +0200
Message-ID: <0edad233-3884-4de3-9bfe-a2c0a10b6353@foss.st.com>
Date: Thu, 27 Jun 2024 12:36:22 +0200
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01

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

Nice feature. Applied on stm32-next.

Cheers
Alex

