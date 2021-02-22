Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B0B3221BF
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 22:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhBVVs4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 16:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhBVVsx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 16:48:53 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4683C061574;
        Mon, 22 Feb 2021 13:48:12 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id a207so606767wmd.1;
        Mon, 22 Feb 2021 13:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=PfzaZPW6YSp2BPSDyYzKC/ggi0wSZXtlYnd1kAVU0rw=;
        b=CUjxsR6kJ6NdwpVBSa5e0Ql1z6iTbsdV4SmvM/g2S7K+wBkMbtztkY7YZzbeWyrCZU
         byJX7YNVG7vsxk2SVk2Qth9QUS5pe5PyrOIk4yteI/WjWH5CvMh5aI2ZuTGUPzSt833Q
         8s+1iFThr3NQ77c3toVco0vLFQCIpiPmh4KTPggZKJyM+GUOg69U1STxKaIr+3PDYX1+
         GoQzZOuxOBkpqCR/2h2C2zZZGPE/40icVElZH2xq8PYEkBPfn/FYs8wUu68Io4ezfAf3
         78ntKhWpP+f4BL+378nnlX73jdjA1j4a+b9/cRAyhHfJfbBt83Ngvu3t69fg2JM5lxy/
         W9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=PfzaZPW6YSp2BPSDyYzKC/ggi0wSZXtlYnd1kAVU0rw=;
        b=oVmOQepH9bdjkploEscuiSE0AhdC5JomgnblV44MYZIeG4kwcz6cjXNsXsE2nerTa4
         oFvtzx10V9oQPV4NlLC4krsN85qxYjzBuoglNtO7ytbLW1drUSL9gwrNzmx6tJh32Vgt
         CgjZIoR73ykdOFnc2j/jdOGvIzExLkpnY26pOWHXTpz5phz4ElxqGbQ2VY555k/fXx17
         zXdGUL/pluuVCSZ76NN1SYNCi3Hv4j2G8FUa6y0GaXGtCmBS4sSSqv390SXKBMdmr5cm
         1Pu8uK42mixs3cgwXGVFRC1JGX4wtDiiTXeDlQV6is8WPysWx5ccRTd/NzAlZHL/djc7
         QZ7A==
X-Gm-Message-State: AOAM533H5ParVTBAKlmSi5J3252CF/Srdo7AMc2qyGvN++5LtP8/fpEA
        fAfdGxtNrmtuHtYsJ/T3C9VlSu7fDNkWjw==
X-Google-Smtp-Source: ABdhPJxAwZ7Insl72enokBVX0iITa8n6g3WFAeIDRgXFTzOiRVMULkTMmPCEoURZOJjsaxPkXZWFJA==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr16235124wml.112.1614030491037;
        Mon, 22 Feb 2021 13:48:11 -0800 (PST)
Received: from [192.168.1.50] (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y2sm8486610wrp.39.2021.02.22.13.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 13:48:10 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] watchdog: bcm7038_wdt: add big endian support
Date:   Mon, 22 Feb 2021 22:48:09 +0100
Message-Id: <80DB1B7E-D719-4597-A2B7-7CAD592E1B19@gmail.com>
References: <9381ef9e-a569-9bcd-5546-a48922e4961d@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <9381ef9e-a569-9bcd-5546-a48922e4961d@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: iPhone Mail (18D52)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> El 22 feb 2021, a las 22:24, Guenter Roeck <linux@roeck-us.net> escribi=C3=
=B3:
>=20
> =EF=BB=BFOn 2/22/21 12:03 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> bcm7038_wdt can be used on bmips (bcm63xx) devices too.
>>=20
> It might make sense to actually enable it for BCM63XX.

bcm63xx SoCs are supported in bcm63xx and bmips.
bcm63xx doesn=E2=80=99t have device tree support, but bmips does and this wa=
tchdog is already enabled for bmips.

>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> drivers/watchdog/bcm7038_wdt.c | 30 ++++++++++++++++++++++++------
>> 1 file changed, 24 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wd=
t.c
>> index 979caa18d3c8..62494da1ac57 100644
>> --- a/drivers/watchdog/bcm7038_wdt.c
>> +++ b/drivers/watchdog/bcm7038_wdt.c
>> @@ -34,6 +34,24 @@ struct bcm7038_watchdog {                             =
   =20
>>=20
>> static bool nowayout =3D WATCHDOG_NOWAYOUT;
>>=20
>> +static inline void bcm7038_wdt_write(unsigned long data, void __iomem *r=
eg)
>> +{
>> +#ifdef CONFIG_CPU_BIG_ENDIAN
>> +    __raw_writel(data, reg);
>> +#else
>> +    writel(data, reg);
>> +#endif
>> +}
>> +
>> +static inline unsigned long bcm7038_wdt_read(void __iomem *reg)
>> +{
>> +#ifdef CONFIG_CPU_BIG_ENDIAN
>> +    return __raw_readl(reg);
>> +#else
>> +    return readl(reg);
>> +#endif
>> +}
>> +
>=20
> This needs further explanation. Why not just use __raw_writel() and
> __raw_readl() unconditionally ? Also, is it known for sure that,
> say, bmips_be_defconfig otherwise uses the wrong endianness
> (vs. bmips_stb_defconfig which is a little endian configuration) ?

Because __raw_writel() doesn=E2=80=99t have memory barriers and writel() doe=
s.
Those configs use the correct endiannes, so I don=E2=80=99t know what you me=
an...

>=20
> Thanks,
> Guenter
>=20
>> static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
>> {
>>    struct bcm7038_watchdog *wdt =3D watchdog_get_drvdata(wdog);
>> @@ -41,15 +59,15 @@ static void bcm7038_wdt_set_timeout_reg(struct watchd=
og_device *wdog)
>>=20
>>    timeout =3D wdt->rate * wdog->timeout;
>>=20
>> -    writel(timeout, wdt->base + WDT_TIMEOUT_REG);
>> +    bcm7038_wdt_write(timeout, wdt->base + WDT_TIMEOUT_REG);
>> }
>>=20
>> static int bcm7038_wdt_ping(struct watchdog_device *wdog)
>> {
>>    struct bcm7038_watchdog *wdt =3D watchdog_get_drvdata(wdog);
>>=20
>> -    writel(WDT_START_1, wdt->base + WDT_CMD_REG);
>> -    writel(WDT_START_2, wdt->base + WDT_CMD_REG);
>> +    bcm7038_wdt_write(WDT_START_1, wdt->base + WDT_CMD_REG);
>> +    bcm7038_wdt_write(WDT_START_2, wdt->base + WDT_CMD_REG);
>>=20
>>    return 0;
>> }
>> @@ -66,8 +84,8 @@ static int bcm7038_wdt_stop(struct watchdog_device *wdo=
g)
>> {
>>    struct bcm7038_watchdog *wdt =3D watchdog_get_drvdata(wdog);
>>=20
>> -    writel(WDT_STOP_1, wdt->base + WDT_CMD_REG);
>> -    writel(WDT_STOP_2, wdt->base + WDT_CMD_REG);
>> +    bcm7038_wdt_write(WDT_STOP_1, wdt->base + WDT_CMD_REG);
>> +    bcm7038_wdt_write(WDT_STOP_2, wdt->base + WDT_CMD_REG);
>>=20
>>    return 0;
>> }
>> @@ -88,7 +106,7 @@ static unsigned int bcm7038_wdt_get_timeleft(struct wa=
tchdog_device *wdog)
>>    struct bcm7038_watchdog *wdt =3D watchdog_get_drvdata(wdog);
>>    u32 time_left;
>>=20
>> -    time_left =3D readl(wdt->base + WDT_CMD_REG);
>> +    time_left =3D bcm7038_wdt_read(wdt->base + WDT_CMD_REG);
>>=20
>>    return time_left / wdt->rate;
>> }
>>=20
>=20
