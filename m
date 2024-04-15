Return-Path: <linux-watchdog+bounces-962-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 870128A512B
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Apr 2024 15:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EF4B1F21E56
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Apr 2024 13:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E2C74E0A;
	Mon, 15 Apr 2024 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Lxuy+YW/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFACD6FE0D
	for <linux-watchdog@vger.kernel.org>; Mon, 15 Apr 2024 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186691; cv=none; b=V8NKRfPYCDLzTYTt691EmRZIqykDmj5jw62ytSIxLP+DJ44RxXeRqlgYA9uh4cfGehjikuMbEri7cPxsv6K/aN7yjTl1dxCcZ6560xxY59rU0JAmbjmnY3EVIm3l16AvusMAEAJOte8zzVVQjR8lHy41wr9rvQPf5CaCsNZpN2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186691; c=relaxed/simple;
	bh=muZDCyD7x3s87GkWdC161Hmp6t9t6nIy7KkgNZsbxWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b8wVWlBC3xrHG+aUYuURG5cJpiLUFPNKc+N7ESzzBVJpkV/zPkCSQdzyUZQBYSd0l/0+p6feE0lYb3CSxt47l7HSQq3WKUKL2j9CgiibSqmxKj1VMCRcZ6vUaozT61OwqP+qeebe13hAIDcTasaH1g6bJY0BSvN48MhXX10y7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Lxuy+YW/; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43FC9XOS025032;
	Mon, 15 Apr 2024 15:10:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=uGQbqktQLTz+NMhP0izBTeN658aw+zWIfZaPtqfijk4=; b=Lx
	uy+YW/FHxcbqJdIdwGLP/rglp+bz8tDG1QNBGbfgrQ0zYVFOh9eLkh1BJOMCnkyV
	p+yGzDGn0JacWO4UH4wRH3qLsU4NNsm4GGm6TBz32WzI19m9dsE14faKv7aw5JAE
	3ERc3Fhv0AifNvpuswnwbySlmaK3PHdocW7JFCN+xdgIjpmVuKCykTdtapXbWlzA
	TH9lTFXDdsJ3IGSaw0OOLx1Jwrq0mnrVvHMvktdooGJkXvD4/ALScM6L4PF5/0ta
	83ewU16afGt5rAxGVePrQxF3jByXLn+/GTGvWPnhBUACxCBGZassvG+wF+PJCJYu
	kNDil2465UClSpJ9r6LQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50hnaqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 15:10:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E16B94002D;
	Mon, 15 Apr 2024 15:10:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 433D9216EFC;
	Mon, 15 Apr 2024 15:10:16 +0200 (CEST)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Apr
 2024 15:10:15 +0200
Message-ID: <90faea2e-1795-4303-a20f-e1fcef9e0e00@foss.st.com>
Date: Mon, 15 Apr 2024 15:10:15 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v3] watchdog: stm32_iwdg: Add pretimeout
 support
To: Marek Vasut <marex@denx.de>, <linux-watchdog@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Guenter Roeck
	<linux@roeck-us.net>
References: <20240321011207.45388-1-marex@denx.de>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20240321011207.45388-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_10,2024-04-15_01,2023-05-22_02

Hello Marek,

On 3/21/24 02:11, Marek Vasut wrote:
> The STM32MP15xx IWDG adds registers which permit this IP to generate
> pretimeout interrupt. This interrupt can also be used to wake the CPU
> from suspend. Implement support for generating this interrupt and let
> userspace configure the pretimeout. In case the pretimeout is not
> configured by user, set pretimeout to half of the WDT timeout cycle.

 From the code below I see that the pretimeout is set to 75% and not 50% 
as you said.
For the rest you can put as you want :
Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
or
Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>

> ...
>   
> @@ -88,13 +97,18 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
>   static int stm32_iwdg_start(struct watchdog_device *wdd)
>   {
>   	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
> -	u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
> +	u32 tout, ptot, presc, iwdg_rlr, iwdg_ewcr, iwdg_pr, iwdg_sr;
>   	int ret;
>   
>   	dev_dbg(wdd->parent, "%s\n", __func__);
>   
> +	if (!wdd->pretimeout)
> +		wdd->pretimeout = 3 * wdd->timeout / 4;
> +
> ...
Here is the 75% pretimeout.

Best regards,

Clément

