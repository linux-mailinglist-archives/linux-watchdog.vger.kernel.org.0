Return-Path: <linux-watchdog+bounces-2558-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C330B9EE50E
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 12:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B5F166B31
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 11:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86CD20E33F;
	Thu, 12 Dec 2024 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="SFjtowlV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDD71F239A;
	Thu, 12 Dec 2024 11:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734003104; cv=none; b=VhpAuQ3dS2pW4juC6BQ4fkFSz+derxyFDn2YabdoNFapqYLyCxn/DMpkqBGGx44wjf1lYYktmUecDHrOAjqyD5bEhk9acPZpdxvAR6AWOAVoLYVG2fMWBqN54BFDCUx2enPhemAX/IDyaHq72Bw9fEkxf998mgi2SDK4Up9l9QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734003104; c=relaxed/simple;
	bh=9q5AsImcI/58ImELR/8kd31JKnkbakU2CbA/pAe1L30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYlnUWevLR28JteKLGSvkLb6NUEE3xneSkeijBMp4kSP++G0rYm35E/MZxBEDr9VLpt0mKwRJtfRZQC8lo2jVjfj0ZAobzJ4xBMCBfh04UyrlrW7cMNdg0hP8up6psJ9p8MtkzQu899I2P98iDAMho+zwD8yTlGiQ2xjbTXP8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=SFjtowlV; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9096310408F81;
	Thu, 12 Dec 2024 12:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734003099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QbSLomodtXNKB8cDOH/2MSoJ6Cktb0r4jHRLsWzOts=;
	b=SFjtowlVpmvGKND9khoyTSnNS8n4mbpVDH45y4JsiKx3cudr+nM8ZVRGAoNia11+fzj/SL
	HJ0oEjXlF410ZaD2+p/HKBZRhp9ep1cMUA4TpDhjd5AjcvJu9hlZIb/9w7LpXSqq54opKe
	zKEdbU0wjqvr/OQvfFZiwQBSp+4nxp6/C3WEh+ETV0ZljfkxNhDvc/6YTB9qXmsS27HoFW
	onS68TeKgtDsDrH8AhAwUbB4Hb9nJnXW8kz97ep+y2wwEBeQMLpSVoX7wCXF/Ja3uzFYyn
	hTp+IdA0w8uVnxN4SVn2cxheRxA6NwilmdH5PMLcLbMf1krbXfw4JdsFThLI/A==
Message-ID: <51671397-3bf4-40a9-99dc-262517634109@denx.de>
Date: Thu, 12 Dec 2024 12:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: stm32_iwdg: fix error message during driver
 probe
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-watchdog@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
 <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/12/24 11:20 AM, Clément Le Goffic wrote:
> The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> introduces the support for the pre-timeout interrupt.
> 
> The support for this interrupt is optional but the driver uses the
> platform_get_irq() wich produces an error message during the driver
> probe if we don't have any `interrupts` property in the DT.
> 
> Use the platform_get_irq_optional() API to get rid of the error message
> as this property is optional.
> 
> Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>

