Return-Path: <linux-watchdog+bounces-2060-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92598AC15
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2024 20:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BE0D2849D2
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2024 18:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D80A197A7A;
	Mon, 30 Sep 2024 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="IciaZ6Xe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A62B9A5
	for <linux-watchdog@vger.kernel.org>; Mon, 30 Sep 2024 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727720915; cv=none; b=nKVMR8HILJtgJ8SSyH91AYgalHK3OuBpsPdPXyltUfuA1JBnvtNluftRPCZKVFZwMEu5BE/dGfHh/0SHrrgorp/t1Ez9asE/x0nZ1gKEx6QFC/XB0R56ojl9YiWzCh5KopzkOF5kxpI4/fV0r4EFHt4Pxk7HoWpkFbb+Mdd/nGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727720915; c=relaxed/simple;
	bh=qNJjJcqU51Rj44D6y28ZD/nHqFULx33BN80S2JvD3VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XR4BlkVHFTTCps0CczQvFp9UxbrRmbTbXoQEd3WKnRBN8itr+1H6oX9TdwX/wHtIed2frdkcghuERscrFh5KyBnv8jObR5TFlQMw/NcPfBNYLGhaCrnQoqqiPQI8WUPd6GMht4RCehfVoWEQtAliiNDvTI60a37AxG7lF+vl05U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=IciaZ6Xe; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6526488670;
	Mon, 30 Sep 2024 20:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727720910;
	bh=v8W0AftGD5WCKt0vquLj4HDVyAid7m6TozrgpAGchU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IciaZ6XevgcyexP0Jru4yixkH+pXJ2Dz9p2ZpYi8xncRZWg0limeMGCwB2S2EDn8E
	 LqGzW5LfCDUN4pHOzg0R7Mt8w6n4X6ON45+9uEgt47Dh8aoJ7p8uQs+zRsDqrfl1q9
	 70x0UMNbDaeuvwP5CKTnn64pD2KASjS4KjaMnMiRA5y9UESwPxt09q7fruRrd98gdU
	 DB5VUpZT7oWY1ZIjPf429ebR0Ks/SpnQ2H3syCrXXHSTaEl5VUYNj1Q3c2JdMGx8OO
	 g0MhV6vRxLn3jhw3dCN28CeSjB3sdtNwTSArifpCUC6YoRSOZhvoHtipZuezkKiB7Y
	 cynR/fDnZxWBg==
Message-ID: <a556f3f9-467f-4c8e-aed5-e1e318376b31@denx.de>
Date: Mon, 30 Sep 2024 20:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
To: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240415134903.8084-1-marex@denx.de>
 <eb0ab015-57bc-4aae-b518-dc12392f3ea0@roeck-us.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <eb0ab015-57bc-4aae-b518-dc12392f3ea0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/30/24 8:23 PM, Guenter Roeck wrote:
> On 4/15/24 06:48, Marek Vasut wrote:
>> The STM32MP15xx IWDG adds registers which permit this IP to generate
>> pretimeout interrupt. This interrupt can also be used to wake the CPU
>> from suspend. Implement support for generating this interrupt and let
>> userspace configure the pretimeout. In case the pretimeout is not
>> configured by user, set pretimeout to 3/4 of the WDT timeout cycle.
>>
>> Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Thank you

