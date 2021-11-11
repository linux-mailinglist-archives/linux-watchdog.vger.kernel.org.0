Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8391F44D408
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Nov 2021 10:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhKKJad (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Nov 2021 04:30:33 -0500
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:8352
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232203AbhKKJac (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Nov 2021 04:30:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XspUrqU6ccpAp1fYoB4HhxxxbNnyo3cKkQL3XoR2arkYWNNDPg62/IC4dFhzpC4gGJprqnj+Jtnf2ao/gvkOP+hP7hWT9SY3a66B/E2Ad5VrqU0SLn9m1a+s9pbueLfW2z8NVE9WYfj0bfpGNSG9iljqGg3S/u9WQuk+3nn2c+qe+C5JuwDkLmmbu4Q9heDP4yOxd45xv8YQVAb+S6MV2f0S0NAvDhU7TFPlPFW71R0y8+pMp/sVeszLbPIFLxJ80kh89BmS2q/6KNXTuAp66bcBQxToHP11zThImBkfyDUCI4SOSKQRKuI/HzV6ZEUnOEtf6jxmu0wBrUs15cA1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfWtomkJt/OO8IPugKKUDOv/UwZ4MckaL9e/QSwh8jg=;
 b=foyMQaiqMVUZ7Z5166znA2phFE7LAGiicyJQx1MuZy1DUxltco0t0BVH2AeeBCSbmQoIU9GWW8gsTbrR6ui4K9iW6smFXUdNp/q8TNOHJ7/mfCbKDjIZM33E/B0MbaYtGQaJptgOkiL8IA/tF1gKFzlvYuoOZNGYknMPkAePNTfm+V2FUzigBLqoxZLJ2FrqszAwBMXkQc7LZAuHyoY6GuVFr/1AphNyXCilPoS7a/SL2zlamhemE9RygQK6/577eiUOBzrOHCwkWnapTg/wWje7Vx9LVaXdWeToA14ach2CCSkvMDW1b26h2vS3Mv49lVSDLXPDjynDKvIBF8l5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfWtomkJt/OO8IPugKKUDOv/UwZ4MckaL9e/QSwh8jg=;
 b=P0DWrTwfaLFV691dYnlNazRi8CoJT4bhZn6svAu13zaWgN6VL9z1ZeqHDmBXkjHC+ubYSB9jbKFW7DUCfn9dmbGlEch9ruQ/G7KROBOwlopNF+ceBUb5DDbq/VwpBS3KIbcAuwBf6LkK/HMzup0sR64yiPV+zDR1e4EbhijDu+E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4518.jpnprd01.prod.outlook.com (2603:1096:604:79::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 11 Nov
 2021 09:27:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4669.018; Thu, 11 Nov 2021
 09:27:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Topic: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Index: AQHX1tl7QLhEj0vVq0e6tkxn8lBWSKv+DfpA
Date:   Thu, 11 Nov 2021 09:27:33 +0000
Message-ID: <OS0PR01MB592251FC7FEF650DEE5B946586949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211111085225.7090-1-biju.das.jz@bp.renesas.com>
 <20211111085225.7090-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211111085225.7090-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf5e5d89-0a3e-4d8f-cc64-08d9a4f57e3e
x-ms-traffictypediagnostic: OSBPR01MB4518:
x-microsoft-antispam-prvs: <OSBPR01MB4518C1EDD4347B0F8289C01086949@OSBPR01MB4518.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xR2nkkOVnsVWGP/WaVBmaJNUzoQbjHrUPkcPo7HOs//ANVph+R/5rvRIDiBIw7A8NY9IH3RXt89bgOrT2OTkLrQofVUqLlIEvH9eElUcV8ZeQofA3uy44qY0ut444VuoA7meOdHzYd1uEtL44zx9VZ7W0W5w6z6pfwh+uduMcS8zGh5s95Sy9MoAbdrXFFitP6OkJIHzg7UFdo7ocD5kTWeLKdrrBi98Rcku7byfzHYVCoz2JUB38RDPLMtRQbaJa0CD0sDFePgX8I9eAI7JnZMu9Fmvx1xk1ZXCvtfyybdlrMsffbHmUtUcDmj778L9ceV1GWpq04ngZZpJD9cNrIK/9y45Rzct76KxHmQMDLDZSJgO9kUGnF5B6TxHBRKA+DE49WJToPkRCmC4CAmEHyF4kou4z8QA0ddQi+Iy1RAw+vRELVlt2T0genH3a7UJC1aCutDYBt9DjJofBz7uQ1sa8Y4hRd6hH3V8AqYDPn0pMzzNOylCPUPJSZZaYC9XrOtx+R4HiUtxDNQKiyRJYlLPyL+9/Z1iIBn4jBT8fSx1djVYWQNOqTCwlTvh6PyEG1xdHxsQaollGIyoU7Fs+FXBEG+MkUAJ8ijNzS8nP/fTP5Bi0FLjDlrP3cfh0Y0ohqRj7s8r6uKfhgHBaWQXmBkb+/NJy7Cu3t4JQqs+CwpnJF7sAKB0J4oZCn6DojG2XlSMk3iYjXuE0+jMLjQGSg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(54906003)(30864003)(186003)(2906002)(110136005)(66556008)(316002)(66446008)(52536014)(33656002)(76116006)(5660300002)(6506007)(66476007)(66946007)(38070700005)(64756008)(508600001)(8676002)(9686003)(83380400001)(86362001)(26005)(71200400001)(7696005)(122000001)(38100700002)(8936002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IbRnOp5q09kW10/5N/n/MaPKnidVBz6MEpX4gCglayhsMV4gCASBDd6QqQtz?=
 =?us-ascii?Q?f6lechmR0GH9WqbfAng+oKPyDYdMeOnIjD+vARzdTUdka7IBDoiawAknFqxF?=
 =?us-ascii?Q?PQ+ptAAk7pKm6qvGIQJg2Z5HoPl9sTQNaI8F+VsA8BISs0/xS7UKd8EGjegf?=
 =?us-ascii?Q?K19vsVn/zrExS4YVweRhXpmSBy2Yb6aIdRulinX6KzjHhtJU6G3st8Htvs8s?=
 =?us-ascii?Q?Lgdw4zbE4HEmt8U37IkD9Z3vcF5n3lFNstz5wXeWKuM8DM+6AaZhK4BGiPNF?=
 =?us-ascii?Q?wgMEk7qpqrmUrKHmaoxEGnyGqhSUw1ZLqNc78fTjU0IiYda2YKOLNoHhRyCb?=
 =?us-ascii?Q?9ydSGsRCcWjhtgPJ/p7dnUPGl5Gk4QPdpLet1+pRYp3ml/B0g3ChwIbs87d2?=
 =?us-ascii?Q?1yzesFmkiZBhu7lyuvpDrcFtLONYCPPpL7AZRzwKxov2FVD7rHo2r2+5H3bf?=
 =?us-ascii?Q?l+9SBER02NA7cYmXWnUyQj6yugqbGA1lTkOXvCqCQaznNiJhHYncOjedHjIC?=
 =?us-ascii?Q?sAVjn4kK+f2ZOMOO+I8X9spltQn+tkEsVayT7fBxZwAAWAws8r85wSMaS4L5?=
 =?us-ascii?Q?2cvN5z+1CU0nbec1hFyNBmswehVfPx6madOMEVGeOkb3QcFue3QRJ35SuwoG?=
 =?us-ascii?Q?qQKVJwrau+Th/RnBWOzn0FGVlAIgdMBBWvx0cVzsQRFQkOYlqNrY4GO2VGU2?=
 =?us-ascii?Q?tLrrBUU1e0TfiLfNNgpP6/X5/CFjOIfule+lssuN1s535Gf2pDP/K2mY9XAg?=
 =?us-ascii?Q?nNHOyUZTK3byhi9CAQJ7WvomJbw4xya/z9SyW8w2ddHBfxhN+OGdhUyHgfIi?=
 =?us-ascii?Q?NCXnDGe7LHIMUv4v5/3XkKMVeQ6g0a0A5WSaN1KuU7NKvVTYFIHVtopnT9MO?=
 =?us-ascii?Q?H38ZIhTTV0vGxrnhGZcuqMYzD4gm3LyEa8e3fj0Ql+GdKh29/0bOrTixEUoB?=
 =?us-ascii?Q?EJBlN3IMRHxiUzUUHlhL2zOBrqxSLoy2NHfRulwo8c9MAfPZpxniwJsAW5au?=
 =?us-ascii?Q?8hxVSBXvPaPYlo09aZ3O8dPor3QKh5uT2BQLQliGoLJY0c4ExMkj9BLmmHlV?=
 =?us-ascii?Q?hgv6iUyhgMVFngfgzI06liX66kR0TzlgfLpmcOQYs8Shi6wAHsR5mpbnSPct?=
 =?us-ascii?Q?dZhrh55MLkidYCYjqlOfuzWBDMLBcp35XtNXLsG37Mtb4fDvQImyJP+Fcn4v?=
 =?us-ascii?Q?vRb18lC1Bt9dRPDMscViOYFPeZsYU6/p4ujW8Ua99Fdc0JIrAmu8qMfOobGD?=
 =?us-ascii?Q?mibUGOGXgY2COU4EdXVhFlL38oK0YDYwSqkZNGOlNt709DDmmlWj89yFb4nP?=
 =?us-ascii?Q?42uSdxS5uP+o5WIVMFgOt+dtFtmkZRSChB7zSEN/tJSIFlctH0HNPWqH4Bst?=
 =?us-ascii?Q?EnKnr7ILKW8gLwuvN9xdSAN1Xgcy5kvAeT5FrBj/XOAcJ38gnNdikTr7vmb4?=
 =?us-ascii?Q?WzmDf4KsmEUfTEv4zaRHIjn0xMNwl3b1EzbA58pJ2qIHcXlxWggHENpY/Hst?=
 =?us-ascii?Q?ckTHSuj/e1JSfjaic2je/Il9rqIHLGdHfVdznTHlvKQnbzXyhfFUUi/AbXOm?=
 =?us-ascii?Q?pLdHjANi7GNtC7I745nXeGVNSCJk2bgc7GLthQCtJXTXssJwNlRbszzBPwHe?=
 =?us-ascii?Q?MAREzusssE45AIKoePlYLjFN9z9A99OPk31Nh8h8LW7wiSFPcJJMt+nkq8U2?=
 =?us-ascii?Q?xbJj+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5e5d89-0a3e-4d8f-cc64-08d9a4f57e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 09:27:33.9213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cDzlf7EBA7FgMKSlMfzvSdTb/fORJjGrTeZJGLH/MJ8Y4o4H7kMAJQ8O+TGdmCBtrpydWEw7zc+n3o4yR7DjLOMq+PZLhYY4RyzheYnqBT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4518
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi All,

> Subject: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
>=20
> Add Watchdog Timer driver for RZ/G2L SoC.
>=20
> WDT IP block supports normal watchdog timer function and reset request
> function due to CPU parity error.
>=20
> This driver currently supports normal watchdog timer function and later
> will add support for reset request function due to CPU parity error.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->V1
>  * Removed pclk_rate from priv.
>  * rzg2l_wdt_write() returns void and Removed tiemout related to register
> update
>  * rzg2l_wdt_init_timeout() returns void and removed delays.
>  * removed set_bit(WDOG_HW_RUNNING,..) as we can stop watchdog
>  * renamed reset_assert_clock_disable->reset_assert_pm_disable_put
>  * started using devm_reset_control_get_exclusive()
>  * removed platform_set_drvdata(pdev, priv) as there is no user
>  * removed watchdog_set_restart_priority(&priv->wdev, 0) as 0 is the
> default.
>  * removed remove callback as it is empty.
> ---
>  drivers/watchdog/Kconfig     |   8 ++
>  drivers/watchdog/Makefile    |   1 +
>  drivers/watchdog/rzg2l_wdt.c | 262 +++++++++++++++++++++++++++++++++++
>  3 files changed, 271 insertions(+)
>  create mode 100644 drivers/watchdog/rzg2l_wdt.c
>=20
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig index
> bf59faeb3de1..34da309a7afd 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -895,6 +895,14 @@ config RENESAS_RZAWDT
>  	  This driver adds watchdog support for the integrated watchdogs in
> the
>  	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
>=20
> +config RENESAS_RZG2LWDT
> +	tristate "Renesas RZ/G2L WDT Watchdog"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This driver adds watchdog support for the integrated watchdogs in
> the
> +	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a
> system.
> +
>  config ASPEED_WATCHDOG
>  	tristate "Aspeed BMC watchdog support"
>  	depends on ARCH_ASPEED || COMPILE_TEST diff --git
> a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile index
> 1bd2d6f37c53..e7e8ce546814 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LPC18XX_WATCHDOG) +=3D lpc18xx_wdt.o
>  obj-$(CONFIG_BCM7038_WDT) +=3D bcm7038_wdt.o
>  obj-$(CONFIG_RENESAS_WDT) +=3D renesas_wdt.o
>  obj-$(CONFIG_RENESAS_RZAWDT) +=3D rza_wdt.o
> +obj-$(CONFIG_RENESAS_RZG2LWDT) +=3D rzg2l_wdt.o
>  obj-$(CONFIG_ASPEED_WATCHDOG) +=3D aspeed_wdt.o
>  obj-$(CONFIG_STM32_WATCHDOG) +=3D stm32_iwdg.o
>  obj-$(CONFIG_UNIPHIER_WATCHDOG) +=3D uniphier_wdt.o diff --git
> a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c new file
> mode 100644 index 000000000000..75102310796d
> --- /dev/null
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L WDT Watchdog Driver
> + *
> + * Copyright (C) 2021 Renesas Electronics Corporation  */ #include
> +<linux/bitops.h> #include <linux/clk.h> #include <linux/delay.h>
> +#include <linux/io.h> #include <linux/kernel.h> #include
> +<linux/module.h> #include <linux/of.h> #include
> +<linux/platform_device.h> #include <linux/pm_runtime.h> #include
> +<linux/reset.h> #include <linux/watchdog.h>
> +
> +#define WDTCNT		0x00
> +#define WDTSET		0x04
> +#define WDTTIM		0x08
> +#define WDTINT		0x0C
> +#define WDTCNT_WDTEN	BIT(0)
> +#define WDTINT_INTDISP	BIT(0)
> +
> +#define WDT_DEFAULT_TIMEOUT		60U
> +
> +/* Setting period time register only 12 bit set in WDTSET[31:20] */
> +#define WDTSET_COUNTER_MASK		(0xFFF00000)
> +#define WDTSET_COUNTER_VAL(f)		((f) << 20)
> +
> +#define F2CYCLE_NSEC(f)			(1000000000 / (f))
> +#define WDT_CYCLE_MSEC(f, wdttime)	((1024 * 1024 * (((u64)wdttime) + 1))
> / \
> +					 ((f) / 1000000))
> +
> +static bool nowayout =3D WATCHDOG_NOWAYOUT; module_param(nowayout, bool,
> +0); MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started
> +(default=3D"
> +				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct rzg2l_wdt_priv {
> +	void __iomem *base;
> +	struct watchdog_device wdev;
> +	struct reset_control *rstc;
> +	unsigned long osc_clk_rate;
> +	unsigned long delay;
> +};
> +
> +static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv) {
> +	/* delay timer when change the setting register */
> +	ndelay(priv->delay);
> +}
> +
> +static void rzg2l_wdt_write(struct rzg2l_wdt_priv *priv, u32 val,
> +unsigned int reg) {
> +	if (reg =3D=3D WDTSET)
> +		val &=3D WDTSET_COUNTER_MASK;
> +
> +	writel_relaxed(val, priv->base + reg);
> +	/* Registers other than the WDTINT is always synchronized with
> WDT_CLK */
> +	if (reg !=3D WDTINT)
> +		rzg2l_wdt_wait_delay(priv);
> +}
> +
> +static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev) {
> +	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +	u32 time_out;
> +
> +	/* Clear Lapsed Time Register and clear Interrupt */
> +	rzg2l_wdt_write(priv, WDTINT_INTDISP, WDTINT);
> +	/* 2 consecutive overflow cycle needed to trigger reset */
> +	time_out =3D (wdev->timeout / 2 * 1000000) / WDT_CYCLE_MSEC(priv-
> >osc_clk_rate, 0);
> +	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(time_out), WDTSET); }
> +
> +static int rzg2l_wdt_start(struct watchdog_device *wdev) {
> +	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +
> +	reset_control_deassert(priv->rstc);
> +	pm_runtime_get_sync(wdev->parent);
> +
> +	/* Initialize time out */
> +	rzg2l_wdt_init_timeout(wdev);
> +
> +	/* Initialize watchdog counter register */
> +	rzg2l_wdt_write(priv, 0, WDTTIM);
> +
> +	/* Enable watchdog timer*/
> +	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +
> +	return 0;
> +}
> +
> +static int rzg2l_wdt_stop(struct watchdog_device *wdev) {
> +	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +
> +	pm_runtime_put(wdev->parent);
> +	reset_control_assert(priv->rstc);
> +
> +	return 0;
> +}
> +
> +static int rzg2l_wdt_restart(struct watchdog_device *wdev,
> +			     unsigned long action, void *data) {
> +	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +
> +	/* Reset the module before we modify any register */
> +	reset_control_reset(priv->rstc);
> +	pm_runtime_get_sync(wdev->parent);
> +
> +	/* smallest counter value to reboot soon */
> +	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
> +
> +	/* Enable watchdog timer*/
> +	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info rzg2l_wdt_ident =3D {
> +	.options =3D WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
> WDIOF_SETTIMEOUT,
> +	.identity =3D "Renesas RZ/G2L WDT Watchdog", };
> +
> +static int rzg2l_wdt_ping(struct watchdog_device *wdev) {
> +	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +
> +	rzg2l_wdt_write(priv, WDTINT_INTDISP, WDTINT);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_ops rzg2l_wdt_ops =3D {
> +	.owner =3D THIS_MODULE,
> +	.start =3D rzg2l_wdt_start,
> +	.stop =3D rzg2l_wdt_stop,
> +	.ping =3D rzg2l_wdt_ping,
> +	.restart =3D rzg2l_wdt_restart,
> +};
> +
> +static void rzg2l_wdt_reset_assert_pm_disable_put(void *data) {
> +	struct watchdog_device *wdev =3D data;
> +	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +
> +	pm_runtime_put(wdev->parent);
> +	pm_runtime_disable(wdev->parent);
> +	reset_control_assert(priv->rstc);
> +}
> +
> +static int rzg2l_wdt_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct rzg2l_wdt_priv *priv;
> +	unsigned long pclk_rate;
> +	struct clk *wdt_clk;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	/* Get watchdog main clock */
> +	wdt_clk =3D devm_clk_get(&pdev->dev, "oscclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no
> oscclk");
> +
> +	priv->osc_clk_rate =3D clk_get_rate(wdt_clk);
> +	if (!priv->osc_clk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
> +
> +	devm_clk_put(&pdev->dev, wdt_clk);
> +
> +	/* Get Peripheral clock */
> +	wdt_clk =3D devm_clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no pclk");
> +
> +	pclk_rate =3D clk_get_rate(wdt_clk);
> +	if (!pclk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "pclk rate is 0");
> +
> +	devm_clk_put(&pdev->dev, wdt_clk);
> +	priv->delay =3D F2CYCLE_NSEC(priv->osc_clk_rate) * 6 +
> +F2CYCLE_NSEC(pclk_rate) * 9;
> +
> +	priv->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> +				     "failed to get cpg reset");
> +
> +	reset_control_deassert(priv->rstc);
> +	pm_runtime_enable(&pdev->dev);
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed ret=3D%pe",
> ERR_PTR(ret));
> +		goto out_pm_get;
> +	}
> +
> +	ret =3D devm_add_action_or_reset(&pdev->dev,
> +				       rzg2l_wdt_reset_assert_pm_disable_put,
> +				       &priv->wdev);
> +	if (ret < 0)
> +		goto out_reset;

Oops. I should call this after watchdog_set_drvdata().

> +	priv->wdev.info =3D &rzg2l_wdt_ident;
> +	priv->wdev.ops =3D &rzg2l_wdt_ops;
> +	priv->wdev.parent =3D dev;
> +	priv->wdev.min_timeout =3D 1;
> +	priv->wdev.max_timeout =3D WDT_CYCLE_MSEC(priv->osc_clk_rate, 0xfff);
> +	priv->wdev.timeout =3D WDT_DEFAULT_TIMEOUT;
> +
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_stop_on_unregister(&priv->wdev);
> +
> +	ret =3D watchdog_init_timeout(&priv->wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout invalid, using default");
> +
> +	ret =3D devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +
> +out_reset:
> +	pm_runtime_put(dev);
> +out_pm_get:
> +	pm_runtime_disable(dev);
> +	reset_control_assert(priv->rstc);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id rzg2l_wdt_ids[] =3D {
> +	{ .compatible =3D "renesas,rzg2l-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
> +
> +static struct platform_driver rzg2l_wdt_driver =3D {
> +	.driver =3D {
> +		.name =3D "rzg2l_wdt",
> +		.of_match_table =3D rzg2l_wdt_ids,
> +	},
> +	.probe =3D rzg2l_wdt_probe,
> +};
> +module_platform_driver(rzg2l_wdt_driver);
> +
> +MODULE_DESCRIPTION("Renesas RZ/G2L WDT Watchdog Driver");
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.17.1

