Return-Path: <linux-watchdog+bounces-2362-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 433D69B371D
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 17:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21561F22254
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 16:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738661DED59;
	Mon, 28 Oct 2024 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UQQyaMxi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657051DED42;
	Mon, 28 Oct 2024 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134356; cv=none; b=EQFMcdRYqoWLJsQS8D8yW780Ufkj0fKI8AUPM9YdzYVsqHPBeAQhonT9xrFTxZWkxXwXReME6ITnQs0f7DSF2cxRNQUeOOT97ovoPJcvIv8jtD80ahGUiLZk/Q+vHQQ7064tHNicDW2JsRuUjk27DmJhwhaWjVlSR7BaCMZo3Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134356; c=relaxed/simple;
	bh=GhKQEalQq5DhqXZjp2nVcnuYVrHx6DAoEyqeJ8d+4hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyt7aRSxnvmfFwp9G+U6hHoTQl+fzbA6mPgy8uKwEq1HmcflpZBNqm6kWxjWNtAyp/iQ62U24QZn2ObhTla/dzxg1WJa60RwnplEQi1OKjxv0QHUfgTSdFXqtDDI/8QwPI2FCiRTX1tEVPtUdL/pb4vVdajpsvPPRJqtScQ1bY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=UQQyaMxi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730134325; x=1730739125; i=wahrenst@gmx.net;
	bh=GhKQEalQq5DhqXZjp2nVcnuYVrHx6DAoEyqeJ8d+4hw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UQQyaMxiQO7Q4b41H0HfESW7Mu1BFb81cidVwRD+yI2pIAddr9k1WhCPQ4PrRgZk
	 TFPnbwm/pwrkbjo9/0bDrWDfayHxkb4M8zMsvW1h1hITteSUScOlPjTyA1j8pZNJF
	 EQCgVyaCcaXCoijIY8Rog9sTLuiDTlQSlxxS+ouU/9RY1e5ybbP9Y5mbT/qPlN6Xr
	 dVEK9Q+bQUmW+HJ5J8AXU0PFFXpzw2IWDizJjnh1NYF1uTtYBNmtbrE4FzcRFynJo
	 oK2rNWjQaT5lmsWktg1Dyybi5ggUfadiLRyO4gpYu9hefoqXgMh8fBaiTKzo1/p7Q
	 P02vDoz/XEgZdCfLSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mulm5-1tvEXv3UtH-00zMj7; Mon, 28
 Oct 2024 17:52:04 +0100
Message-ID: <7f175303-b7e8-4d49-ad17-9cb434721bd1@gmx.net>
Date: Mon, 28 Oct 2024 17:52:03 +0100
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
 <686d128c-ce02-421e-9af5-6c418e82071d@gmx.net>
 <016f25b9-58ec-4b51-81d7-4a573a4cc18a@roeck-us.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <016f25b9-58ec-4b51-81d7-4a573a4cc18a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7XdQT3hLhRr9ALXESZ/YWfwjV+ddX83sIaU4FF5eHKFEb/hlLC6
 JiGDIRp1mTanuohRfhCtrOWRgE1ds1ZX86VKINdnZrVJqoB9jFr/P6QkO3LnjUTmYKTeGmo
 eA8nAThKn5rjoKLWrB0j53wGeqLpXocXPL4+EMXlQP01M3Ns1aUqbBaqTWPRae40sWk4Avx
 7rrLdswy5aI4amw5xFMhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SFlAgT4Oyxc=;Np0jtOdDNzlQoExMBs5gBffx/iw
 F1j7m0F467Gdelbf6LkLnr8jxsKH+lApkOAyuy82iooGeqP5VhsvkGoSHp0x+DtLRoONj/alp
 17lmZVH6qhMJP4wElRH3kFwqbyIEAAoVqYafGXQAkOp/MOKkB+B8KHY6269kgNH8704HX+TsE
 Eejm/ElutIQgUjvq/kHF3DzFtWH7w5GQAKVzc/YPzxiaPw5zhu95EKvOMAAMdD+hD0G1rvmgT
 nbdfkaHiHyXaFlDKQLlqC/4bxy0Xel58LOz5EcbnPg5HtN/+bGS4hkF9rPiALasj31qNqI5i3
 DQlzf/Pb0jTfewhhzLNHNdrYuZ0gxr7GgWJAUWgIafvBSmevt7B74ERcSvyFEvElAlpB3D7Wr
 AeG2acZ8AkBxhBwMvNMzAr0IMFV8BJjZqFmlUiOGHmYDJOoHwT+sqPpkw/chx+nkIRGtBdxGh
 xbsp3SgJyMKYinsN2ttQqtQdSwYVXDXTFHiAdOrIVubmFOkt74XvypRpP/rpGdUtZhXS8puux
 SYw79W7SwX5mvqaKyJGbZBrBBLKGMoDO+5X+ILOlr+SR3OsXrTnNmdQZIyiJerylRZMwiTfwP
 Q/40osCuocieAuQaDQZjCre+mSzwyZS9pAfK8CXlBqkGD7KGAYNHshDd67pIel7QUV4xqnsOu
 RBcw7Pt1i1AYQaNrRcPBYfnM6DnWaCWlCIMYwwZBI4nvsdrGXndo4bdKUeCZM42NO+9YQ0bGr
 kmRj9Y2qV+rD5RK8BKWWGJbofglEU1boGNrSjFy24NHBxljeby6SVfAVPsQIEqaaUV9Vvu24D
 g9yjPVJjXGpG0y7OEynflEdQ==

Hi Guenter,

Am 27.10.24 um 18:35 schrieb Guenter Roeck:
> On 10/27/24 08:54, Stefan Wahren wrote:
>> Am 27.10.24 um 14:36 schrieb Guenter Roeck:
>>> On 10/27/24 03:53, Stefan Wahren wrote:
>>>> The WDOG Timeout Value (TOVAL) is a 16 bit value, which is stored
>>>> at the beginning of a 32 bit register. So add a range check to
>>>> prevent writing in the reserved register area.
>>>>
>>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>>> ---
>>>> =C2=A0 drivers/watchdog/imx7ulp_wdt.c | 8 ++++++++
>>>> =C2=A0 1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/watchdog/imx7ulp_wdt.c
>>>> b/drivers/watchdog/imx7ulp_wdt.c
>>>> index 0f92d2217088..a7574f9c9150 100644
>>>> --- a/drivers/watchdog/imx7ulp_wdt.c
>>>> +++ b/drivers/watchdog/imx7ulp_wdt.c
>>>> @@ -48,6 +48,8 @@
>>>>
>>>> =C2=A0 #define RETRY_MAX 5
>>>>
>>>> +#define TOVAL_MAX=C2=A0=C2=A0=C2=A0 0xFFFF
>>>> +
>>>> =C2=A0 static bool nowayout =3D WATCHDOG_NOWAYOUT;
>>>> =C2=A0 module_param(nowayout, bool, 0000);
>>>> =C2=A0 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once st=
arted
>>>> (default=3D"
>>>> @@ -192,6 +194,9 @@ static int imx7ulp_wdt_set_timeout(struct
>>>> watchdog_device *wdog,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 loop =3D RETRY_MAX;
>>>>
>>>> +=C2=A0=C2=A0=C2=A0 if (toval > TOVAL_MAX)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>> +
>>>
>>> The whole idea of having max_timeout in struct watchdog_device is to
>>> avoid the need
>>> for this check. max_timeout should be set to 0xffff /
>>> wdt->hw->wdog_clock_rate.
>>> It is currently set to 128. With wdt->hw->wdog_clock_rate set to
>>> either 125 or 1000,
>>> it can indeed overflow. However, checking the value above is wrong.
>>> max_timeout should
>>> be initialized correctly instead.
>>>
>>> Even better would be to set max_hw_heartbeat_ms and let the watchdog
>>> core handle
>>> larger timeouts.
>> It's funny because I tried this on a i.MX93 board but it didn't work fo=
r
>> me. But I must confess that I didn't spend much time in the
>> investigation.
>
> I can't test it, but something like the diff below should do.
Thanks, I will give it a try but it will take some time.

Regards
>
> Guenter
>
> ---
> diff --git a/drivers/watchdog/imx7ulp_wdt.c
> b/drivers/watchdog/imx7ulp_wdt.c
> index 0f13a3053357..e672d27af63e 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -187,11 +187,16 @@ static int imx7ulp_wdt_set_timeout(struct
> watchdog_device *wdog,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int =
timeout)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct imx7ulp_wdt_device *wd=
t =3D watchdog_get_drvdata(wdog);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 toval =3D wdt->hw->wdog_clock_=
rate * timeout;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 toval;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 val;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 loop =3D RETRY_MAX;
>
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (timeout > 0xffff / wdt->hw->wd=
og_clock_rate)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 toval =3D 0xffff;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 toval =3D wdt->hw->wdog_clock_rate * timeout;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ret =3D _imx7ulp_wdt_set_timeout(wdt, toval);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 val =3D readl(wdt->base + WDOG_TOVAL);
> @@ -338,7 +343,6 @@ static int imx7ulp_wdt_probe(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wdog->info =3D &imx7ulp_wdt_i=
nfo;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wdog->ops =3D &imx7ulp_wdt_op=
s;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wdog->min_timeout =3D 1;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wdog->max_timeout =3D MAX_TIMEOUT;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wdog->parent =3D dev;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wdog->timeout =3D DEFAULT_TIM=
EOUT;
>
> @@ -348,6 +352,7 @@ static int imx7ulp_wdt_probe(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 watchdog_set_drvdata(wdog, im=
x7ulp_wdt);
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx7ulp_wdt->hw =3D of_device=
_get_match_data(dev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wdog->max_hw_heartbeat_ms =3D 0xff=
ff * 1000 /
> imx7ulp_wdt->hw->wdog_clock_rate;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D imx7ulp_wdt_init(imx7=
ulp_wdt, wdog->timeout *
> imx7ulp_wdt->hw->wdog_clock_rate);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return ret;
>
>


