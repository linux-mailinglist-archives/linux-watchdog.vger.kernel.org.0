Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7222FF474
	for <lists+linux-watchdog@lfdr.de>; Sat, 16 Nov 2019 18:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfKPRvC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 16 Nov 2019 12:51:02 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:47022 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbfKPRvB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 16 Nov 2019 12:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1573926659; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FRWQ/fXo5t1wv9SzvepviIDnjYcOVgkgSPX8UFl2H6s=;
        b=pX1odAgpr3wBWpKK/fzoJzvb/Fm8x96HARhU8hDGnPF7yvWVQprkobueR+IydgE7fMkmqZ
        e531wmimSQ2VrBuFjwB1nwYJm9+O5lZKv6XUe8YeZhth7NnnjgbBMwLoamz8+TdXxnB9+a
        pKGKpbYrc6RYLL1tLM7/Nj2Wz2ib8pU=
Date:   Sat, 16 Nov 2019 18:50:53 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] watchdog: jz4740: Use WDT clock provided by TCU
 driver
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Mathieu Malaterre <malat@debian.org>,
        Artur Rojek <contact@artur-rojek.eu>
Message-Id: <1573926653.3.0@crapouillou.net>
In-Reply-To: <20191023174714.14362-1-paul@crapouillou.net>
References: <20191023174714.14362-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

I noticed you already acked all the patches in the V1 but expected them=20
to go through the MIPS tree; could you take them into your tree instead?

Cheers,
-Paul


Le mer., oct. 23, 2019 at 19:47, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> Instead of requesting the "ext" clock and handling the watchdog clock
> divider and gating in the watchdog driver, we now request and use the
> "wdt" clock that is supplied by the ingenic-timer "TCU" driver.
>=20
> The major benefit is that the watchdog's clock rate and parent can now
> be specified from within devicetree, instead of hardcoded in the=20
> driver.
>=20
> Also, this driver won't poke anymore into the TCU registers to
> enable/disable the clock, as this is now handled by the TCU driver.
>=20
> On the bad side, we break the ABI with devicetree - as we now request=20
> a
> different clock. In this very specific case it is still okay, as every
> Ingenic JZ47xx-based board out there compile the devicetree within the
> kernel; so it's still time to push breaking changes, in order to get a
> clean devicetree that won't break once it musn't.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> ---
>=20
> Notes:
>     v2: Rebase on top of 5.4-rc4
>=20
>  drivers/watchdog/Kconfig      |  1 +
>  drivers/watchdog/jz4740_wdt.c | 75=20
> ++++++++++++++---------------------
>  2 files changed, 31 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 58e7c100b6ad..6421187769cf 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1642,6 +1642,7 @@ config INDYDOG
>  config JZ4740_WDT
>  	tristate "Ingenic jz4740 SoC hardware watchdog"
>  	depends on MACH_JZ4740 || MACH_JZ4780
> +	depends on COMMON_CLK
>  	select WATCHDOG_CORE
>  	help
>  	  Hardware driver for the built-in watchdog timer on Ingenic jz4740=20
> SoCs.
> diff --git a/drivers/watchdog/jz4740_wdt.c=20
> b/drivers/watchdog/jz4740_wdt.c
> index c6052ae54f32..72920f09f4a7 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -18,19 +18,6 @@
>  #include <linux/err.h>
>  #include <linux/of.h>
>=20
> -#include <asm/mach-jz4740/timer.h>
> -
> -#define JZ_WDT_CLOCK_PCLK 0x1
> -#define JZ_WDT_CLOCK_RTC  0x2
> -#define JZ_WDT_CLOCK_EXT  0x4
> -
> -#define JZ_WDT_CLOCK_DIV_1    (0 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_4    (1 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_16   (2 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_64   (3 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_256  (4 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_1024 (5 << TCU_TCSR_PRESCALE_LSB)
> -
>  #define DEFAULT_HEARTBEAT 5
>  #define MAX_HEARTBEAT     2048
>=20
> @@ -50,7 +37,8 @@ MODULE_PARM_DESC(heartbeat,
>  struct jz4740_wdt_drvdata {
>  	struct watchdog_device wdt;
>  	void __iomem *base;
> -	struct clk *rtc_clk;
> +	struct clk *clk;
> +	unsigned long clk_rate;
>  };
>=20
>  static int jz4740_wdt_ping(struct watchdog_device *wdt_dev)
> @@ -65,32 +53,14 @@ static int jz4740_wdt_set_timeout(struct=20
> watchdog_device *wdt_dev,
>  				    unsigned int new_timeout)
>  {
>  	struct jz4740_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev);
> -	unsigned int rtc_clk_rate;
> -	unsigned int timeout_value;
> -	unsigned short clock_div =3D JZ_WDT_CLOCK_DIV_1;
> +	u16 timeout_value =3D (u16)(drvdata->clk_rate * new_timeout);
>  	u8 tcer;
>=20
> -	rtc_clk_rate =3D clk_get_rate(drvdata->rtc_clk);
> -
> -	timeout_value =3D rtc_clk_rate * new_timeout;
> -	while (timeout_value > 0xffff) {
> -		if (clock_div =3D=3D JZ_WDT_CLOCK_DIV_1024) {
> -			/* Requested timeout too high;
> -			* use highest possible value. */
> -			timeout_value =3D 0xffff;
> -			break;
> -		}
> -		timeout_value >>=3D 2;
> -		clock_div +=3D (1 << TCU_TCSR_PRESCALE_LSB);
> -	}
> -
>  	tcer =3D readb(drvdata->base + TCU_REG_WDT_TCER);
>  	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
> -	writew(clock_div, drvdata->base + TCU_REG_WDT_TCSR);
>=20
>  	writew((u16)timeout_value, drvdata->base + TCU_REG_WDT_TDR);
>  	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
> -	writew(clock_div | JZ_WDT_CLOCK_RTC, drvdata->base +=20
> TCU_REG_WDT_TCSR);
>=20
>  	if (tcer & TCU_WDT_TCER_TCEN)
>  		writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
> @@ -102,11 +72,15 @@ static int jz4740_wdt_set_timeout(struct=20
> watchdog_device *wdt_dev,
>  static int jz4740_wdt_start(struct watchdog_device *wdt_dev)
>  {
>  	struct jz4740_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev);
> +	int ret;
>  	u8 tcer;
>=20
> +	ret =3D clk_prepare_enable(drvdata->clk);
> +	if (ret)
> +		return ret;
> +
>  	tcer =3D readb(drvdata->base + TCU_REG_WDT_TCER);
>=20
> -	jz4740_timer_enable_watchdog();
>  	jz4740_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>=20
>  	/* Start watchdog if it wasn't started already */
> @@ -121,7 +95,7 @@ static int jz4740_wdt_stop(struct watchdog_device=20
> *wdt_dev)
>  	struct jz4740_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev);
>=20
>  	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
> -	jz4740_timer_disable_watchdog();
> +	clk_disable_unprepare(drvdata->clk);
>=20
>  	return 0;
>  }
> @@ -162,21 +136,38 @@ static int jz4740_wdt_probe(struct=20
> platform_device *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct jz4740_wdt_drvdata *drvdata;
>  	struct watchdog_device *jz4740_wdt;
> +	long rate;
> +	int ret;
>=20
>  	drvdata =3D devm_kzalloc(dev, sizeof(struct jz4740_wdt_drvdata),
>  			       GFP_KERNEL);
>  	if (!drvdata)
>  		return -ENOMEM;
>=20
> -	if (heartbeat < 1 || heartbeat > MAX_HEARTBEAT)
> -		heartbeat =3D DEFAULT_HEARTBEAT;
> +	drvdata->clk =3D devm_clk_get(&pdev->dev, "wdt");
> +	if (IS_ERR(drvdata->clk)) {
> +		dev_err(&pdev->dev, "cannot find WDT clock\n");
> +		return PTR_ERR(drvdata->clk);
> +	}
> +
> +	/* Set smallest clock possible */
> +	rate =3D clk_round_rate(drvdata->clk, 1);
> +	if (rate < 0)
> +		return rate;
> +
> +	ret =3D clk_set_rate(drvdata->clk, rate);
> +	if (ret)
> +		return ret;
>=20
> +	drvdata->clk_rate =3D rate;
>  	jz4740_wdt =3D &drvdata->wdt;
>  	jz4740_wdt->info =3D &jz4740_wdt_info;
>  	jz4740_wdt->ops =3D &jz4740_wdt_ops;
> -	jz4740_wdt->timeout =3D heartbeat;
>  	jz4740_wdt->min_timeout =3D 1;
> -	jz4740_wdt->max_timeout =3D MAX_HEARTBEAT;
> +	jz4740_wdt->max_timeout =3D 0xffff / rate;
> +	jz4740_wdt->timeout =3D clamp(heartbeat,
> +				    jz4740_wdt->min_timeout,
> +				    jz4740_wdt->max_timeout);
>  	jz4740_wdt->parent =3D dev;
>  	watchdog_set_nowayout(jz4740_wdt, nowayout);
>  	watchdog_set_drvdata(jz4740_wdt, drvdata);
> @@ -185,12 +176,6 @@ static int jz4740_wdt_probe(struct=20
> platform_device *pdev)
>  	if (IS_ERR(drvdata->base))
>  		return PTR_ERR(drvdata->base);
>=20
> -	drvdata->rtc_clk =3D devm_clk_get(dev, "rtc");
> -	if (IS_ERR(drvdata->rtc_clk)) {
> -		dev_err(dev, "cannot find RTC clock\n");
> -		return PTR_ERR(drvdata->rtc_clk);
> -	}
> -
>  	return devm_watchdog_register_device(dev, &drvdata->wdt);
>  }
>=20
> --
> 2.23.0
>=20

=

