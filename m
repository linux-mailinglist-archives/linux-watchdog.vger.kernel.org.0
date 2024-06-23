Return-Path: <linux-watchdog+bounces-1182-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AE913D9B
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Jun 2024 20:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BADE5282D65
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Jun 2024 18:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA32181322;
	Sun, 23 Jun 2024 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="IK7meZvg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5EC138E
	for <linux-watchdog@vger.kernel.org>; Sun, 23 Jun 2024 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719169123; cv=none; b=hAWxA2PYPMnGGrXDRKJ4BrPWktdRE6vJBdfPN4UcUmdODuXVwqH8HVvQvvhR/Tql+tcIisB4LLDaB9JKMdJKlKMKRbK3fAFSHokX9t3PywsT7gN+SJW72artNzdPiWfXB2YyeVang4lQcNbJAd8DllsCjVT5KjGIhmGF4Akc6a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719169123; c=relaxed/simple;
	bh=wurJp+90xCV6ESUHwS7UX4Ra9rWOKHWupG2TBIyssCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivCkb5TTokzxWXh5egFznR0SGBePjL5oNt4ZEHG3X9rBrg5CHH3teE9N7QXryGtxNuE99Geh2cwMQT+o8IHWngZW8eJHOCoJDs1JwphNIb1LCv1K4i9piKG3DTRlTHX8pJQVV9BemjxFLRDcdRtCpeUazt7KXCQpnMkiS43EK6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=IK7meZvg; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 47E1F88271;
	Sun, 23 Jun 2024 20:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719169119;
	bh=n8C7e0ABfIei1PXo0lkdQWQ9ovwX2ZdSBGfBtoz2Of0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IK7meZvgDCVrkUyKdcKeyYtEVeadL20Vur0ju0AHEoVD+qfd52JSIgKku5I9pPtMX
	 v6nrF5aRJvqD84RkNxV/xOaZ7/UMSx5DT1/rjZo1I2RG8xO/AtXjWjOMjV0MeFCJUb
	 bbwF1OSSJz/pAQYFPdXMMRuQFOZEYf5eFH3ciOue11Gx/oYO3Ok8zskLHg5RrprF/Q
	 X9o1EGIpyJOuJUaXLg1y29vh+srDEG6B5zDQ9ZD25R2nUatxsIkC0HxcA7wipm9Beo
	 LJUCBSV4DWxoWqKM14mp1zcWRYBybK7woCjI9AOIN2UrSbx+K/gWV7Bjhep4mHnXfO
	 +w2wNNszlvfzg==
Message-ID: <f93b5a80-33fb-4708-ab86-6b28f626a186@denx.de>
Date: Sun, 23 Jun 2024 20:18:50 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
To: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240415134903.8084-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240415134903.8084-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 4/15/24 3:48 PM, Marek Vasut wrote:
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

Hi,

Are there still any open topics with this patch ?

