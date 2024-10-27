Return-Path: <linux-watchdog+bounces-2341-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C21089B1F23
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 16:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682E71F215EE
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 15:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171D913A265;
	Sun, 27 Oct 2024 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="NDogIxbn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D5378C9D;
	Sun, 27 Oct 2024 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730044475; cv=none; b=qBQa5POqZOGStGtPRTcJoTkmy25mDD5S8HFpwiTkQIPTBoY8XzRKONl2bQmBzGvZLCO29iADuhl8KBY81JPFIi4zDQhVofCUYSKr+set2DeoQUb5akKf4dFtdWDrS6SwXB/6sLgVUDLdBWTlogjZUxuh0RAqhGiPC7t/+LbfJSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730044475; c=relaxed/simple;
	bh=S52TV53JYVw4ssB8apb8QpRsCbB5Ll6Prp5SvUoLNv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5YXoOtRVGHjw223tx8X/yQUCCcVLuJti0jh4QGOCcw89R0DxRXyL0xrxPqKWlWJDkeDKIn5Z/4g3FetHZ3kvEiJMSNP/cqvIvGHuJuX9mggIfO0E1MMDOLPs3meoNVKjVrj7E5UrlMhp0zdqi1sbqGdnTobsoFndNzVlbLDj6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=NDogIxbn; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730044445; x=1730649245; i=wahrenst@gmx.net;
	bh=S52TV53JYVw4ssB8apb8QpRsCbB5Ll6Prp5SvUoLNv4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NDogIxbncmRPVdih/3caGPpkAwbhLpDLgVyxD9T4llzJviJRagVvfh+v4wyaJB09
	 oqCfsF+zAnxHLbw0ax3iZKEKT5vvk9CzEpMXKkq6VAlBgfTIMMVpqaRNnyFr+EWSi
	 9D+3o6WK9r1CWze2mKBwyfB+dAK+hkJhI7f/kkE2XKOjjfndk1JMKTLzXkTe3FB1r
	 rk4P8a44Ynbpv3sJN0OVoKGFu6jWYa8ZCamy9FDxfbWl/pfyD2aVmJXcMgly8bsgo
	 9+DObDY0LPCRZxHj0F0Eq3H/wauaxcaJdf54zrLb5/wAXWYH3uqhjSCXtgVBQMO7b
	 86FDM4e+6z5b0AhgdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sHo-1t09de3Zly-0047OO; Sun, 27
 Oct 2024 16:54:04 +0100
Message-ID: <686d128c-ce02-421e-9af5-6c418e82071d@gmx.net>
Date: Sun, 27 Oct 2024 16:54:03 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: imx7ulp_wdt: Add TOVAL range check
To: Guenter Roeck <linux@roeck-us.net>, Alice Guo <alice.guo@nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241027105323.93699-1-wahrenst@gmx.net>
 <20241027105323.93699-3-wahrenst@gmx.net>
 <33721072-6ff4-45bd-b20f-cc0a213e3aae@roeck-us.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <33721072-6ff4-45bd-b20f-cc0a213e3aae@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ddXs+8wjTNEs+IMlPWyG2xgLyVyw5OMmDdi9zc/aCnPov5BFN4I
 edgV7Yzx8e4r+6Fp5077g4/uvmrv+Q15YWXI/O5wKKFP0dIl4hh9v05mu3VRwRKIHMcsQMF
 4T3AZO6p9ZnDgXhBua7CcHsekJYcwE1E5yAD+VzQn7Ug0Go1uC6f6tw5c75DcNtCFYCzZbj
 XXiE9LbP3sFxgECF+QG9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6w/mAcG88Kw=;TlJu9eOKkpqPo7CziDcShLo73b0
 yvWgFYOzFlV0eSuv5xprGGznT9tk4voDXZ9SAqZVjeUstwxNC3fuzO2BGo1nJEAmaMKItzii5
 GK/yKIaQ2YY64FUS6rRKqSFnbfHiSws75kTh0oujuqkXTjMCEmLyIuHQ0aJbV7gI1xZUv9T+8
 YTHDTJzy+4Iuam2ITFmgXUWpIUVr/7PJi5w6umFMysbS784wuwv4KxPO2MqqKqoDjmJ3QYfAm
 o3vlNNoX1j1nIOGN6fK0H4VjRtQylyBQB2utB/+gAh6GXijgj4bLtjj9p8282Cl9prOihLecf
 Ael8vyZ4uNJJK9RwOdjtqLAdZW/sOc5yvphgzz3SA0qTAB48KlqVRQ+2axxyYUcpHGF1b9S+y
 sCe6J2iXufTNbO0XXgAHT806OHXlIQIKop09DItsPvXBDb/3nWp5Q1Pnoss+qUm1f3sjtF8yG
 JvMOrYpxhp3VkFHfAVdsklOYduRZjzjbtdrU26Yi7TKCRCH4gI2DMnhsQFrJAzSAM5zjGD79w
 g84ctygoGZuzvMNxY7LzL4MsL2wOjoRUP1sOSteoqhCdgNNaC5eyUMkhqteR5QUjy7cH1NTiT
 YPFcQzRREDl9aCsRi6DVHgEf2xR6DjOqkMBNwXby0CzxcPp6vQF/Oi65zm2xR0ERQUchqbaK8
 /Cm8zxcmhXBTaHvIGGgJoVK6VpAtwTPgMOqP/HmwFD1MU01e/U7+gZATEheDctoDczEgy4FhN
 K5WM36oVRkugSQ6XEaYU0v2kkm10nys1mfe42lhFSvTsEgi2yGWxBHhzZdl8X1pO20br49ocL
 XTCADH3+vCYRQ/07XrjRZCbQ==

Am 27.10.24 um 14:36 schrieb Guenter Roeck:
> On 10/27/24 03:53, Stefan Wahren wrote:
>> The WDOG Timeout Value (TOVAL) is a 16 bit value, which is stored
>> at the beginning of a 32 bit register. So add a range check to
>> prevent writing in the reserved register area.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>> =C2=A0 drivers/watchdog/imx7ulp_wdt.c | 8 ++++++++
>> =C2=A0 1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/watchdog/imx7ulp_wdt.c
>> b/drivers/watchdog/imx7ulp_wdt.c
>> index 0f92d2217088..a7574f9c9150 100644
>> --- a/drivers/watchdog/imx7ulp_wdt.c
>> +++ b/drivers/watchdog/imx7ulp_wdt.c
>> @@ -48,6 +48,8 @@
>>
>> =C2=A0 #define RETRY_MAX 5
>>
>> +#define TOVAL_MAX=C2=A0=C2=A0=C2=A0 0xFFFF
>> +
>> =C2=A0 static bool nowayout =3D WATCHDOG_NOWAYOUT;
>> =C2=A0 module_param(nowayout, bool, 0000);
>> =C2=A0 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once star=
ted
>> (default=3D"
>> @@ -192,6 +194,9 @@ static int imx7ulp_wdt_set_timeout(struct
>> watchdog_device *wdog,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 loop =3D RETRY_MAX;
>>
>> +=C2=A0=C2=A0=C2=A0 if (toval > TOVAL_MAX)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>
> The whole idea of having max_timeout in struct watchdog_device is to
> avoid the need
> for this check. max_timeout should be set to 0xffff /
> wdt->hw->wdog_clock_rate.
> It is currently set to 128. With wdt->hw->wdog_clock_rate set to
> either 125 or 1000,
> it can indeed overflow. However, checking the value above is wrong.
> max_timeout should
> be initialized correctly instead.
>
> Even better would be to set max_hw_heartbeat_ms and let the watchdog
> core handle
> larger timeouts.
It's funny because I tried this on a i.MX93 board but it didn't work for
me. But I must confess that I didn't spend much time in the investigation.
>
> Another question is why the driver enables a clock but doesn't use its
> actual
> frequency.
Yes, this would be better

Regards
>
> Guenter
>
>


