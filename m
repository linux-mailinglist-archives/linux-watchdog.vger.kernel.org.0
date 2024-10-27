Return-Path: <linux-watchdog+bounces-2342-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB149B1F26
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 16:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 017301F21537
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 15:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C48917279E;
	Sun, 27 Oct 2024 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bzVK4fTD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6661678C9D;
	Sun, 27 Oct 2024 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730044612; cv=none; b=PPRHXgL9J6iL8NHRy7Q0bLNgGJZudfqF9hb/HTe1o0d60r2VWx3yXdc2xdro+dp21vlaCo2CgW2sHyXlBzLt2Olc+9CHyZDzVMWEHe+WSpTS9pfFatkHEALcmv1jxvwrW6Id6sKcWt/hMsASFiKOkRrkT/AH3yoUznFKJ+dFr6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730044612; c=relaxed/simple;
	bh=L0qDBAArgMaITShLaQbn3eqNAsZRpwfqjIR/eK3UYyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9nThc9lA1+wjkyNvAo3vZzg7MEMyCGxci+x1NggJf3c6VYBfpzJnOg+IsxHcpYMWW/092ge8qMTN6w/kKbOhDgz6dPTNAdSjdmY9cZ8JGl84It08rpJgkwiSrVChkr936FLOPYzgaZaoTPxw9PbAyhwaz7k6zVOGp9IJDTDRl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=bzVK4fTD; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730044584; x=1730649384; i=wahrenst@gmx.net;
	bh=L0qDBAArgMaITShLaQbn3eqNAsZRpwfqjIR/eK3UYyM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bzVK4fTD6NyNxrrIn+R4OHJakvYwE2xHyFRgYlLqFObW2PibCXidP5B8DsCDbF14
	 O/xho/EjI4QQROQPSokhJA0t2OM4hyrXCl8foj8nBlxOlFslRSB/HxNsRrvZbsNUZ
	 nDK7xgIoVNMzpYJjAIfhMCgQzioZMojZUo3NEtyFdjuHHPm/ghWoSFCk88LbzLEjT
	 tYN5hKHJ+5ekrYvXCXOi4kL5GeLYBKwFlhgHzcC1dVGzifTHrd1FESVzZXgDAID2r
	 qFxZlDXjlUQepvtsGQS1sAjewX0BqwR4cM0KvoOBPWEX+0++VqsL7B0UJNcNgqMEs
	 P8/9QUDPf3zGuvajdw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf4S-1tmdZV3YLS-00qKPr; Sun, 27
 Oct 2024 16:56:23 +0100
Message-ID: <711294ea-9bed-44a1-9b1a-38e63c76be01@gmx.net>
Date: Sun, 27 Oct 2024 16:56:23 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: imx7ulp_wdt: Clarify timing units
To: Guenter Roeck <linux@roeck-us.net>, Alice Guo <alice.guo@nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241027105323.93699-1-wahrenst@gmx.net>
 <20241027105323.93699-2-wahrenst@gmx.net>
 <fb93ba0f-d414-4f7f-aff9-cd958c715e23@roeck-us.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <fb93ba0f-d414-4f7f-aff9-cd958c715e23@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q3BIhw96rpvrmXPmv/Ty+pdzXp8z9vyV6KRFkdRhyMqiDG+HEYN
 9ff2yOsP8AGxJR4GNXQbtFLwD7j3u5big1RRyzuHiHdzzMxcnHt1xztJEs6kZaEETrV/Xbf
 N5D/MIh4bfJqG20hw89GfgsbI17p7SumThynNeurmoTbKWtUUFXT6oxRlA9AAihOeKWzfzf
 xLnwR6rpJI//M9EVnpxxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iZCAP0iGeQM=;O1Mpjpr657CpvZER8GJiey98Wgp
 C6gqKDJxJitZZ6zDjIBO+HTcJifeS0usODjuH20CRlZL0EcjfS8O61pVSB79QgjWDo5Xkuv9k
 YN/co8T6LvzQuIAol4TItISt0X5VZ/ydZCYNiowdR45VuOMrp0eybqRidRfTUhlZ5lUj5KvyV
 2vSB+ix3AtQK8N9nskkJ5fAEga6KsXnCCoGe0ro1GbUDPGD/EGwIRRwjfw812BUehGGtoMskk
 dYAMK0VKXUQmcB5z3XZ8dlbKOpuUmFSNhySLlnOpb6bcFAhvoGkk5RFBf4nyVVSWLKk0he3lK
 5eW4/pB5fryvsnirVwbvOMDfK/TLQXF01L8dA3SD1AMt+ErgdhynwATqVKmQEN+qTxgvUBkVY
 jyyfYHVc6EgmCv9+bKQzRY9Jyj6Lb351tnMVPFvw6WKQkEmIlqfiD2kBHjLt4VOxARWudW8l+
 SkF4K9TEL8VhyLID7/bhh1vx+ddMLM6rivHFdni3cvVXCfJsYeK12i2xoTV9V9hZQfz9IEjaJ
 o6hceWzOFoRDWR1FEBkFos7vD33MuxbKGEkmnaiaqj3qDQnQGj3L2QJlqbqlE7oxiXcBCxm4L
 GnNnWXlIULLMpP4vPN6f4NB/RyVFx2KFFS1CChmEj5svtfBBctm0t4V0U1MQavLd5jyZ9OToB
 oDUrHjVgphDYUk3VoTR6JVmTD5UVv9zpPiB0CsoWCaVCyKUAqdiiiRVk6ThX+5X/BkljvHTFt
 Hq0ZMJSgbR7Jx1UOL0YggKP7xKqTDqIsm3kRINbvK0t0xuVnCQf1KjEm22qWFzhMd1P6Mzeyh
 ksYIob/0MsAgok1KXlhrjBFw==

Am 27.10.24 um 15:28 schrieb Guenter Roeck:
> On 10/27/24 03:53, Stefan Wahren wrote:
>> imx7ulp_wdt mixes a lot of timing units (frequency, clocks, seconds)
>> in a not obvious way. So improve readability of imx7ulp_wdt by
>> clarifying the relevant units.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>> =C2=A0 drivers/watchdog/imx7ulp_wdt.c | 18 ++++++++++--------
>> =C2=A0 1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/watchdog/imx7ulp_wdt.c
>> b/drivers/watchdog/imx7ulp_wdt.c
>> index 0f13a3053357..0f92d2217088 100644
>> --- a/drivers/watchdog/imx7ulp_wdt.c
>> +++ b/drivers/watchdog/imx7ulp_wdt.c
>> @@ -19,7 +19,7 @@
>> =C2=A0 #define WDOG_CS_PRES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 B=
IT(12)
>> =C2=A0 #define WDOG_CS_ULK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BI=
T(11)
>> =C2=A0 #define WDOG_CS_RCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BI=
T(10)
>> -#define LPO_CLK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x1
>> +#define LPO_CLK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x1=C2=A0=C2=A0=C2=A0 /* 32 kHz */
>
> This configures the clock source to be the LPO clock, which according
> to the
> chip datasheets is a 1kHz clock for all chips except IMX93. It is only
> 32kHz
> for IMX93, and the prescaler is enabled for that chip.
>
> The comment is not only misleading because it selects the clock source,
> not the rate, but wrong, because it only selects a 32kHz clock for IMX93=
,
> and that value is then prescaled.
Okay, I will drop it
>
>> =C2=A0 #define LPO_CLK_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
8
>> =C2=A0 #define WDOG_CS_CLK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (L=
PO_CLK << LPO_CLK_SHIFT)
>> =C2=A0 #define WDOG_CS_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(7)
>> @@ -39,8 +39,8 @@
>> =C2=A0 #define UNLOCK_SEQ1=C2=A0=C2=A0=C2=A0 0xD928
>> =C2=A0 #define UNLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((UNLOC=
K_SEQ1 << 16) | UNLOCK_SEQ0)
>>
>> -#define DEFAULT_TIMEOUT=C2=A0=C2=A0=C2=A0 60
>> -#define MAX_TIMEOUT=C2=A0=C2=A0=C2=A0 128
>> +#define DEFAULT_TIMEOUT=C2=A0=C2=A0=C2=A0 60=C2=A0=C2=A0=C2=A0 /* seco=
nds */
>> +#define MAX_TIMEOUT=C2=A0=C2=A0=C2=A0 128=C2=A0=C2=A0=C2=A0 /* seconds=
 */
>> =C2=A0 #define WDOG_CLOCK_RATE=C2=A0=C2=A0=C2=A0 1000
>> =C2=A0 #define WDOG_ULK_WAIT_TIMEOUT=C2=A0=C2=A0=C2=A0 1000
>> =C2=A0 #define WDOG_RCS_WAIT_TIMEOUT=C2=A0=C2=A0=C2=A0 10000
>> @@ -240,7 +240,8 @@ static const struct watchdog_info
>> imx7ulp_wdt_info =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 WDIOF_MAGICCLOSE,
>> =C2=A0 };
>>
>> -static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
>> unsigned int timeout, unsigned int cs)
>> +static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int timeout_clks, unsigned int cs)
>
> I don't think "_clks" adds any clarity because the value doesn't set a
> "clock".
> "_ticks", maybe.
I'm fine with _ticks

Thanks
>
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 val;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> @@ -263,7 +264,7 @@ static int _imx7ulp_wdt_init(struct
>> imx7ulp_wdt_device *wdt, unsigned int timeou
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto init_out;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* set an initial timeout value in TOVAL=
 */
>> -=C2=A0=C2=A0=C2=A0 writel(timeout, wdt->base + WDOG_TOVAL);
>> +=C2=A0=C2=A0=C2=A0 writel(timeout_clks, wdt->base + WDOG_TOVAL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel(cs, wdt->base + WDOG_CS);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_irq_enable();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D imx7ulp_wdt_wait_rcs(wdt);
>> @@ -275,7 +276,8 @@ static int _imx7ulp_wdt_init(struct
>> imx7ulp_wdt_device *wdt, unsigned int timeou
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 }
>>
>> -static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned
>> int timeout)
>> +static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsigned int timeout_clks)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* enable 32bit command sequence and rec=
onfigure */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 val =3D WDOG_CS_CMD32EN | WDOG_CS_CL=
K | WDOG_CS_UPDATE |
>> @@ -296,11 +298,11 @@ static int imx7ulp_wdt_init(struct
>> imx7ulp_wdt_device *wdt, unsigned int timeout
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D _imx7ulp_wdt_init(w=
dt, timeout, val);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D _imx7ulp_wdt_init(w=
dt, timeout_clks, val);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 toval =3D readl(=
wdt->base + WDOG_TOVAL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cs =3D readl(wdt=
->base + WDOG_CS);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cs &=3D ~(WDOG_C=
S_FLG | WDOG_CS_ULK | WDOG_CS_RCS);
>> -=C2=A0=C2=A0=C2=A0 } while (--loop > 0 && (cs !=3D val || toval !=3D t=
imeout || ret));
>> +=C2=A0=C2=A0=C2=A0 } while (--loop > 0 && (cs !=3D val || toval !=3D t=
imeout_clks ||
>> ret));
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (loop =3D=3D 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EBUSY;
>> --
>> 2.34.1
>>
>
>


