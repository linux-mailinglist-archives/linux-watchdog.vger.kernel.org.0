Return-Path: <linux-watchdog+bounces-3399-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C38AA58E0
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 May 2025 02:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 319DD7AD00B
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 May 2025 00:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5305B8828;
	Thu,  1 May 2025 00:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="O3pPO1pp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43EB20EB;
	Thu,  1 May 2025 00:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746057698; cv=none; b=Vu0XDhmh9CuHrInfWP3wA7PWdCzwk9mehXxVV4zBxkjOatA2WkDy0xdhwAb0Oa0wryQxLmAmRHgw5el7jyXexF7kNiw83Z1PDKwW1eIBMFOyLDnoFtwM6AJY60M/xoIagHoSc52EwNdezpll3mlFhGYokAzkOO7epjSbzWyNOis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746057698; c=relaxed/simple;
	bh=6DutjieBTw1k9nX95zPq4+lTgdnVF+22GvaEAgrv4nw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nzbov/36pINczUrKzsbSa+GV07LGwqCdRr1OU14l2cwmNAhRWpEwvwn4oX+KePS7KF2EDi5PYYEHJny5t9eoG5VN9g6KI74hLb0fxw9GYZxX14Pxip4AQTU1ZW11fuI+3TdyYee9n9icoWF/ScYYb9J/bWJW9uTAZq8ik3oTQtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=O3pPO1pp; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1746057685; x=1746316885;
	bh=R6uit6FwYVHi8jDba0Uckfj3WNxEuuaM6Qop+tdviJM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=O3pPO1ppr7BeXWj4cs1+XQ5+pWMcduoTpy35QXvKjT234I1w8yXUqYDAWzytRksk0
	 0feTtvlbtbYxMtj1mkbp4H7rrKqUqoKdl1uA1iBASgJZSGkSQ1EjsBBk/GJs0kwjWd
	 Y7f5qzOnqcdojik0xMZoEdvfjMiJb94spQiCoYi0NF7/GE+640vuU5tQtb3oLZURuO
	 MKk8DrpVDxayEffi87TekBfpu/Xye7ozNj3+OKcy0w2NytjEyNGo4UAwsf2XJ0cIvu
	 lJIUTMX/RqwkwGlf68KkVSkzM+4bnzqZmnjRqvL3kDdSvtQtvqdQlE0//bG3OHxTbj
	 IXhX+txTiv5LA==
Date: Thu, 01 May 2025 00:01:21 +0000
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rajendra Nayak <quic_rjendra@quicinc.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 5/5] watchdog: qcom: add support to read the restart reason from IMEM
Message-ID: <ebd4790b-e7aa-45b1-b7d7-9d1b331ee842@nxsw.ie>
In-Reply-To: <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com> <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: cbd4046600d18c5333c1cc2f748723c9886f437b
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16/04/2025 09:29, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was restart=
ed
> due to WDT expiry, bootloaders update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.

Which bootloaders ?

Do you mean bootrom or one of the subsequent phase bootloaders ?

Please be specific about which bootloader populates this data i.e. if I=20
switch my bootloader to u-boot do I loose the added flag ?

> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
>=20
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualc=
omm.com>
What I'd really love to see here is an example of reading out the data=20
from sysfs.

How do I as a user/consumer of this new functionality parse the new data=20
it provides ?

Ideally do this in the commit log and recommend doing it in the cover=20
letter to, as people don't always read both when commenting on patches.

> ---
> Changes in v2:
> =09- Use the syscon API to access the IMEM region
> =09- Handle the error cases returned by qcom_wdt_get_restart_reason
> =09- Define device specific data to retrieve the IMEM compatible,
> =09  offset and the value for non secure WDT, which allows to
> =09  extend the support for other SoCs
> ---
>   drivers/watchdog/qcom-wdt.c | 47 ++++++++++++++++++++++++++++++++++++++=
+++++--
>   1 file changed, 45 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..94ba9ec9907a19854cd45a94f=
8da17d6e6eb33bc 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -7,9 +7,11 @@
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/watchdog.h>
>=20
>   enum wdt_reg {
> @@ -39,6 +41,9 @@ static const u32 reg_offset_data_kpss[] =3D {
>   };
>=20
>   struct qcom_wdt_match_data {
> +=09const char *compatible;
> +=09unsigned int restart_reason_offset;
> +=09unsigned int non_secure_wdt_val;
>   =09const u32 *offset;
>   =09bool pretimeout;
>   =09u32 max_tick_count;
> @@ -175,6 +180,15 @@ static const struct watchdog_info qcom_wdt_pt_info =
=3D {
>   =09.identity=09=3D KBUILD_MODNAME,
>   };
>=20
> +static const struct qcom_wdt_match_data match_data_ipq5424 =3D {
> +=09.compatible =3D "qcom,ipq5424-imem",
> +=09.restart_reason_offset =3D 0x7b0,
> +=09.non_secure_wdt_val =3D 0x5,
> +=09.offset =3D reg_offset_data_kpss,
> +=09.pretimeout =3D true,
> +=09.max_tick_count =3D 0xFFFFFU,
> +};
> +
You should separate the addition of your compatibles and their=20
descriptor tables from generic functional extensions.

i.e. add the compat string and the above table in a subsequent patch.

>   static const struct qcom_wdt_match_data match_data_apcs_tmr =3D {
>   =09.offset =3D reg_offset_data_apcs_tmr,
>   =09.pretimeout =3D false,
> @@ -187,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_k=
pss =3D {
>   =09.max_tick_count =3D 0xFFFFFU,
>   };
>=20
> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> +=09=09=09=09=09const struct qcom_wdt_match_data *data)
> +{
> +=09struct regmap *imem;
> +=09unsigned int val;
> +=09int ret;
> +
> +=09imem =3D syscon_regmap_lookup_by_compatible(data->compatible);
> +=09if (IS_ERR(imem))
> +=09=09return PTR_ERR(imem);
> +
> +=09ret =3D regmap_read(imem, data->restart_reason_offset, &val);
> +=09if (ret) {
> +=09=09dev_err(wdt->wdd.parent, "failed to read the restart reason info\n=
");
> +=09=09return ret;
> +=09}
> +
> +=09if (val =3D=3D data->non_secure_wdt_val)
> +=09=09wdt->wdd.bootstatus =3D WDIOF_CARDRESET;
> +
> +=09return 0;
> +}
> +
>   static int qcom_wdt_probe(struct platform_device *pdev)
>   {
>   =09struct device *dev =3D &pdev->dev;
> @@ -267,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pd=
ev)
>   =09wdt->wdd.parent =3D dev;
>   =09wdt->layout =3D data->offset;
>=20
> -=09if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> -=09=09wdt->wdd.bootstatus =3D WDIOF_CARDRESET;
> +=09ret =3D qcom_wdt_get_restart_reason(wdt, data);
> +=09if (ret =3D=3D -ENODEV) {
> +=09=09if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> +=09=09=09wdt->wdd.bootstatus =3D WDIOF_CARDRESET;
> +=09} else if (ret) {
> +=09=09return ret;
> +=09}
>=20
>   =09/*
>   =09 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
> @@ -322,6 +364,7 @@ static const struct dev_pm_ops qcom_wdt_pm_ops =3D {
>   };
>=20
>   static const struct of_device_id qcom_wdt_of_table[] =3D {
> +=09{ .compatible =3D "qcom,apss-wdt-ipq5424", .data =3D &match_data_ipq5=
424 },
>   =09{ .compatible =3D "qcom,kpss-timer", .data =3D &match_data_apcs_tmr =
},
>   =09{ .compatible =3D "qcom,scss-timer", .data =3D &match_data_apcs_tmr =
},
>   =09{ .compatible =3D "qcom,kpss-wdt", .data =3D &match_data_kpss },
>=20
> --
> 2.34.1
>=20
>=20


