Return-Path: <linux-watchdog+bounces-2534-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8A89EC84B
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 10:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B043C188859F
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 09:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2A1240368;
	Wed, 11 Dec 2024 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="b0A9E4Au"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7706E240361
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Dec 2024 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907910; cv=none; b=j+RpLOx5zc3+NMQUEECVQOissKipzyOvjYy+lwlA8NLalx8qYU3SOV4TWOvsLlttxmKUhAvcLJ/Eay69X6TMkznPzo+v0/KXyOKvZcm6mOvXrgJWxw9Qq5B/wkhomSlSOOLlxQYvOwaWpt8MnXZrwMSQ9YGWbr2SHIRVSPI3fLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907910; c=relaxed/simple;
	bh=WL2P57lkmxiXWvEy1Jdf1FwHRUaE+9DsiA0dIlTkkOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HZ1rionz9x6nfvtXVLpzdZLFXQmiyDjiv9Z0JJ06jLP+jRyijmrP0e/VjLYzgDoX95sJaXYeGI5Mv4gXfQVOmB6Tcn68SnAjZW1WooXyEGke6UAreueswf94o5iDQUuvABP/nIg1jxnPo423h3p9uRhaZrZoshYKP6ikjjYyfcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=b0A9E4Au; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8NwD6022707;
	Wed, 11 Dec 2024 10:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JVWhcdluQn/FeGJzOFzMGBVEMEf9xzbqzGk72elgCUI=; b=b0A9E4AuMNTnvg0I
	wkXfLf5kOc1qMYjpI+7kMEvKiCLeWQ/tTfDobuCf8sJiWEzTcSvlIe4c6/Y6m60j
	+8H64t25TQsnAYMDPAhDFtdoUX+fYSW+8sEHjUyPZzQEqy8lsD/zN+dW4+n4RDN1
	yh0Gzt0r50ahgltqWcfUL93VHZNLuZ6j7nyCag/Ewn+gDA5qhow+UDvyDPsJB8Ei
	z/Pu78ZlxuZN8ZbUIJCm7EVUI+9j1y87d6ISz+lv0p0ulFgg0EfEn/O4WAUoDHB8
	IGv9C6nxkj6MqS1XlJZOPXlXS+mtsoEyPCsxMxH69uDpZjPh724dpIAGjrVGO+/I
	ra/fCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43d0t5f4b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 10:04:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 93AC640074;
	Wed, 11 Dec 2024 10:03:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDF5227FEF5;
	Wed, 11 Dec 2024 10:02:18 +0100 (CET)
Received: from [10.48.86.108] (10.48.86.108) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Dec
 2024 10:02:17 +0100
Message-ID: <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
Date: Wed, 11 Dec 2024 10:02:17 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
To: Marek Vasut <marex@denx.de>, <linux-watchdog@vger.kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Guenter Roeck
	<linux@roeck-us.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Wim Van
 Sebroeck <wim@linux-watchdog.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20240415134903.8084-1-marex@denx.de>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20240415134903.8084-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

On 4/15/24 15:48, Marek Vasut wrote:
> The STM32MP15xx IWDG adds registers which permit this IP to generate
> pretimeout interrupt. This interrupt can also be used to wake the CPU
> from suspend. Implement support for generating this interrupt and let
> userspace configure the pretimeout. In case the pretimeout is not
> configured by user, set pretimeout to 3/4 of the WDT timeout cycle.
> 
> Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-watchdog@vger.kernel.org
> ---
> V2: - Subtract the pretimeout value from timeout value before writing it
>        into the IWDG pretimeout register, because the watchdog counter
>        register is counting down, and the pretimeout interrupt triggers
>        when watchdog counter register matches the pretimeout register
>        content.
>      - Set default pretimeout to 3/4 of timeout .
> V3: - Use dev instead of pdev->dev
>      - Swap order of ret/return 0
>      - Split this from the DT changes, which are orthogonal
>      - Uh, this patch got stuck in upstreaming queue, sorry
> V4: - Update commit message to match V2 default pretimeout to 3/4
>      - Add RB/TB from Clément
> ---
>   drivers/watchdog/stm32_iwdg.c | 95 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 5404e03876202..d700e0d49bb95 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
>  
>  [.....]
>  
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq <= 0)
> +		return 0;

Hi Marek,

After re-evaluating this patch, it seems it lacks of a dt-bindings 
update that tackles the 'interrupts' property you are adding.

That said, the interrupt line should not be mandatory for the driver to 
probe. For backward compatibility with existing DT, I recommend to use 
the 'platform_get_irq_optional()' API to not fail during the probe of 
the driver.

Best regards,

Clément

