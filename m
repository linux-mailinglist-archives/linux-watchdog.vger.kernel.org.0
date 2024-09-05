Return-Path: <linux-watchdog+bounces-1761-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656B96DA8F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2024 15:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35726287FBA
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2024 13:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA88A19D890;
	Thu,  5 Sep 2024 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ZAQCHdNn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD8F19D09B
	for <linux-watchdog@vger.kernel.org>; Thu,  5 Sep 2024 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543694; cv=none; b=k3R0yu4MHF+VL4bKaA67BB+JgUSuD1ZigguT/WMhGGeFR7kEj0Aa3Ds6cJ9mf74yoCWXtIZ80KzysbTUw+MjUXiu0buhszRQPpIvQHUNk86DWU9/bqyRK2fLq+C/Wr8TxwMG0pJpvl3bmhQmifBTUhNJVg5EzGrfXYIUUlTLMuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543694; c=relaxed/simple;
	bh=V/Lt7QDJyPGvRo0/Jz6FAgImTDCFHOVOjeMmXatM71k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CRsR+mgwZ7aaPzPB7Pj8Y5J7WxWRGR7PLlnSvMwecbMW+eSqXPh9XwbX+jW6H+OZ0QbTGeyArU94dUrBA2BBtQhtz0soCgBV/kLh2AiXKL9gFcYX6IcBKLKjsajhmNOXyUPgdRPZvNTI8cXw6QPRWS4wESRDzM0yExDluvuLR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ZAQCHdNn; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 938C988BF2;
	Thu,  5 Sep 2024 15:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725543691;
	bh=pswdXcqPStl0HoZQrt/FxfgDt4teRCM2NhpZPLEY5rc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ZAQCHdNnEwIQcjtofN1rEt3GQEmMSXTSz2pdfO5r/STfUzh56l1xIoEAfEwkxM2Yi
	 Hgkslb9S8R71lh/sLVxVtD4nFJTql2/6ku56g5OTA7pHB7YUDrIwUU5a7CnW8neJ9l
	 pyYyCaUmEIfB0NS1RieX0WmcBpBZWkj4tLV3XRu2/obnezsQW/toSoaRlLll8+zVqC
	 VV6OGKBtThxuK3U8mfgXn1agy/iu37fKtAoq9P5pFu0Nd6wCj04hce2FGs6J6pc3p8
	 7m9bT8WK5bqKj+JdYtVQtQdlrNAdASDYaOEimGkwNkYbMNQpZYWoy+Xeqs2cw8k9e3
	 0KgzZJOq6FMjA==
Message-ID: <4386a9c2-bf9e-4612-a928-dddb1adb9571@denx.de>
Date: Thu, 5 Sep 2024 15:12:20 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
From: Marek Vasut <marex@denx.de>
To: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240415134903.8084-1-marex@denx.de>
 <f93b5a80-33fb-4708-ab86-6b28f626a186@denx.de>
Content-Language: en-US
In-Reply-To: <f93b5a80-33fb-4708-ab86-6b28f626a186@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/23/24 8:18 PM, Marek Vasut wrote:
> On 4/15/24 3:48 PM, Marek Vasut wrote:
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
> 
> Hi,
> 
> Are there still any open topics with this patch ?

Anything ?

