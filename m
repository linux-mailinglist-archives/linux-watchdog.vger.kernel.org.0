Return-Path: <linux-watchdog+bounces-2019-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B331F98468D
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 15:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7761F20C98
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2024 13:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0A01A7067;
	Tue, 24 Sep 2024 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QSRdj1N1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8B1B85DD
	for <linux-watchdog@vger.kernel.org>; Tue, 24 Sep 2024 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727183541; cv=none; b=J3MoF14rMpD6hhISmkD7CwFLCHiH0dbWJLPl0sI2kPhuDSnmhUPS8jQdU+mWBDhcpzTdXGJBI8YbGlK9qpayOp1OS5EkJ9ZS5AMbxNNxCzmWH3Bq9jyaU/7xhBCkMqF8oSiKdNuykrsCYvX2+gYv93TfmuxOZ1VZneo+bLEX7O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727183541; c=relaxed/simple;
	bh=OI1lHGN/8rq7Cy4rK+rxZTZJzs4W6CxKJf57L0o5NGU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kz9QvOUPXnQ9Wy/OczdBZdLEF8wnZdgYo4yGa/q9ZF9zJ6bubJQJI/+U75ppqXWJKyBdad0POcqmnxaP2XlIkOVTee4AImUoIojZPjuC+b7IniGQwKXX0kM3lxpYF9HAOZ/86b8lcvdRn+l6W+2rUo/yCtY5wJA0RyPFFaZjsb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QSRdj1N1; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 787498814D;
	Tue, 24 Sep 2024 15:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727183532;
	bh=n7OBSndBBjC1EH1IxTFK9YvGedMJTiLcAZ4olyfRRL4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=QSRdj1N1dqWU09ThEOU0wk+gZf3USpIPkoTD+TdjRYTaF7Dlivvdko/69HoLChu1g
	 TXIIJPEDLifzIinOxw7xmg0RVZWyScGHzR0H5hYeTrLIwn5klvrsQQ85AylRFX5BHP
	 ex80ArMi0kh1qaOkgMXLbmXcVhZICIRHteNyPwGeU8Hacre1+8Xe4eFqmh2Nz9jxh/
	 +WnoqchZSlPL8ZK5enPaEOlJhHM4kuhjyn2MXhP318HVUB04mSOZjlRqtvSnT/hDCg
	 7e217uoxQciUje8evEHavzYy1s0hfn9G20JqokEGUf6R8amNhCthO3sa3ybgjmgjte
	 cCP5PuDVMCDhw==
Message-ID: <20d9dfe7-44a1-4f92-92bb-9b760a735e60@denx.de>
Date: Tue, 24 Sep 2024 12:04:19 +0200
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
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240415134903.8084-1-marex@denx.de>
 <f93b5a80-33fb-4708-ab86-6b28f626a186@denx.de>
 <4386a9c2-bf9e-4612-a928-dddb1adb9571@denx.de>
Content-Language: en-US
In-Reply-To: <4386a9c2-bf9e-4612-a928-dddb1adb9571@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/5/24 3:12 PM, Marek Vasut wrote:
> On 6/23/24 8:18 PM, Marek Vasut wrote:
>> On 4/15/24 3:48 PM, Marek Vasut wrote:
>>> The STM32MP15xx IWDG adds registers which permit this IP to generate
>>> pretimeout interrupt. This interrupt can also be used to wake the CPU
>>> from suspend. Implement support for generating this interrupt and let
>>> userspace configure the pretimeout. In case the pretimeout is not
>>> configured by user, set pretimeout to 3/4 of the WDT timeout cycle.
>>>
>>> Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>> Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-stm32@st-md-mailman.stormreply.com
>>> Cc: linux-watchdog@vger.kernel.org
>>> ---
>>> V2: - Subtract the pretimeout value from timeout value before writing it
>>>        into the IWDG pretimeout register, because the watchdog counter
>>>        register is counting down, and the pretimeout interrupt triggers
>>>        when watchdog counter register matches the pretimeout register
>>>        content.
>>>      - Set default pretimeout to 3/4 of timeout .
>>> V3: - Use dev instead of pdev->dev
>>>      - Swap order of ret/return 0
>>>      - Split this from the DT changes, which are orthogonal
>>>      - Uh, this patch got stuck in upstreaming queue, sorry
>>> V4: - Update commit message to match V2 default pretimeout to 3/4
>>>      - Add RB/TB from Clément
>>
>> Hi,
>>
>> Are there still any open topics with this patch ?
> 
> Anything ?

Can this be pulled via the stm32 SoC tree ?

