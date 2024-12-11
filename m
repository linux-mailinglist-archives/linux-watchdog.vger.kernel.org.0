Return-Path: <linux-watchdog+bounces-2550-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5BA9ED62E
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 20:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B373166534
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 19:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE19243B7E;
	Wed, 11 Dec 2024 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="hAQqBamG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F77243B7D
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Dec 2024 18:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733943483; cv=none; b=L0AuDkyAMJsMIfJNXKF4qhtA9Nwz+NRQL4JpXvrfPFki7i0H4L+AOe9l2qTNhzkOYJWuIgNUpgxb0P9A7+HETaGIwaiBUn9f0JWRqK/oNqj9JE3+/2x20dlEEIHl8tYIWakDksk/ZbJpbs8y23/DX5ph6yaxii3BKQ8AvkG7FTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733943483; c=relaxed/simple;
	bh=0lT8pOSzsTfLSLeDK8jffdSSYhZh0SvUCiOtP8vkv+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOf1GFNLXXWKgfMxtF+jQRq9POpiOw0kI7BCY+EzxhxbC1bYkdFj/SkkhnUz0rwVALsIe+SV6Lk1zQ37VtolykhaHjRVARxJPr60HnfnIJIf8sNmTj5vdQJlVqnkIXhWGSSZjpwtbbplxEKDROzGf9m/WgGAYJRuNaDDykGckcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=hAQqBamG; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98E85104858A3;
	Wed, 11 Dec 2024 19:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1733942965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9mka/6c02zAmTI1ZuaE51LtWLUrXwWytHmmGzjhbNio=;
	b=hAQqBamG3pG/60OscjZ3vfrjvNpj8m2HS9Zx7PKHxstCe0cPTn1Kz88hdPZOjjJXnyMXvY
	MyGNptqZYZqEi5F4DE3oHVQcLFeyfti/6HozoSH3JxhY8unkYCNQJ0x6XeVo3BLiGFU0Rl
	hdMdymft3iQw4qqb9Fln6SRL9AFz7dR9BZXchMNErvo6t3j93Gvy50dBFbxSqBIr7NOC0f
	M8B+Xrk2Hav1kYt05ETxgTFfRdvHyz8qfEanldZffnWaXKZPO9/IS5262On9RwKR0KgBHM
	bisr4YXq01XNNtPoi6FvbUjR4WJ+lsCe5OXUrf91kIy0+6ohxZfSXsJfWIzyfg==
Message-ID: <656838f1-40e5-44de-aaba-d8f5ba496af7@denx.de>
Date: Wed, 11 Dec 2024 19:31:12 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 linux-watchdog@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240415134903.8084-1-marex@denx.de>
 <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/11/24 10:02 AM, Clement LE GOFFIC wrote:
> On 4/15/24 15:48, Marek Vasut wrote:
>> The STM32MP15xx IWDG adds registers which permit this IP to generate
>> pretimeout interrupt. This interrupt can also be used to wake the CPU
>> from suspend. Implement support for generating this interrupt and let
>> userspace configure the pretimeout. In case the pretimeout is not
>> configured by user, set pretimeout to 3/4 of the WDT timeout cycle.
>>
>> Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Cc: linux-watchdog@vger.kernel.org
>> ---
>> V2: - Subtract the pretimeout value from timeout value before writing it
>>        into the IWDG pretimeout register, because the watchdog counter
>>        register is counting down, and the pretimeout interrupt triggers
>>        when watchdog counter register matches the pretimeout register
>>        content.
>>      - Set default pretimeout to 3/4 of timeout .
>> V3: - Use dev instead of pdev->dev
>>      - Swap order of ret/return 0
>>      - Split this from the DT changes, which are orthogonal
>>      - Uh, this patch got stuck in upstreaming queue, sorry
>> V4: - Update commit message to match V2 default pretimeout to 3/4
>>      - Add RB/TB from Clément
>> ---
>>   drivers/watchdog/stm32_iwdg.c | 95 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 94 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/ 
>> stm32_iwdg.c
>> index 5404e03876202..d700e0d49bb95 100644
>> --- a/drivers/watchdog/stm32_iwdg.c
>> +++ b/drivers/watchdog/stm32_iwdg.c
>>
>>  [.....]
>>
>> +
>> +    irq = platform_get_irq(pdev, 0);
>> +    if (irq <= 0)
>> +        return 0;
> 
> Hi Marek,
> 
> After re-evaluating this patch, it seems it lacks of a dt-bindings 
> update that tackles the 'interrupts' property you are adding.
> 
> That said, the interrupt line should not be mandatory for the driver to 
> probe. For backward compatibility with existing DT, I recommend to use 
> the 'platform_get_irq_optional()' API to not fail during the probe of 
> the driver.
I saw the fix
[PATCH] watchdog: stm32_iwdg: fix DT backward compatibility
Thank you for that. I'll wait for V2 with updated commit message .

As far as I understood the problem, the goal is to remove error message 
printed by the platform_get_irq() in case the DT interrupt property is 
missing, but this is only an esthetic fix, not a functional one, because 
the driver probes even if the interrupts DT property is missing, it only 
prints the error message while at it, correct ?

