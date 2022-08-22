Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFF459BA1F
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Aug 2022 09:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbiHVHUH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Aug 2022 03:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbiHVHUE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Aug 2022 03:20:04 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3B714D35;
        Mon, 22 Aug 2022 00:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7+mq6ag6PZy1Dw/dfvONliBwMlQdXeHqc4gIMKJOoqiu+mMqGxk7ATv9S+IJDtH4HYElvJTRsnWeqWsLLTOx/q/Img7i3X+CODY5KLaItCBPZfKNhi8ZM178nTseVkhHpTC/41tWMKnFN2Myvq2OYpEZ+Oyw5EEN7j7rq2Viv6lxKHjWt4aqtiL3ivgYrJWIDcn9sPN+qmIXJSyxckMAy1A+52OodzD4XfyvihjDXIZz7TGpecd8MI45XOmJt7X2is5UaBsI7kVudxrIWAhc+pT3pSHK1kMuch9Nyf7qp7o0va/rJiNNc2AYioiGcYYDjBDXCoZtDZSlklUQjlD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl3jwIhzq6BakdPq9zrquAL15FYvA1hZv+tkyfzACMo=;
 b=We6TCi9vifnpFcHN1q8T+S8n2cUiHo5YCOorBwuw/DN5UZ1C5csbNw6b6DDnCLJBp+BvzpmBmknfobLlgb96nN3n1SGuewpg4A6mbLjbWYuZAEHZeLz+TC5ksZUYHMFBfSDxuBHt+phPGSE1+rWwwO6zSqCdlnruNSur10O1ECmJ1k63MIvAr92gfI+XrGhRokuqMIwOzU1I3G//0pUWfakx3cOYLr6JE6skpcVn46uyqEmWInljcy/GkqadgPjoFP6VAQ0hta9y3wDqBk5hMFS4J3PY+hyBC0WMUqDc4DCN+GLyX772QJ+qkwqSWKrrFWpLvbpv8aGZHKvMDY73YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yl3jwIhzq6BakdPq9zrquAL15FYvA1hZv+tkyfzACMo=;
 b=aeJ0SAe6ycj08Q1rhgUwhm6RTpI3t3UK4d3pDPpDl+897lGPelCpkF5jOy2f0GVkrcy+Tmkjg8KBv8+s9uZFSB3MDahQSbIUtyBuu1YI7C05IY/h4UItkVd/j6G3eRney9zvF5JEFV2zO3MyWt2ehPFicB1RXgNXEdUYiSNBKfg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY1PR01MB1514.jpnprd01.prod.outlook.com (2603:1096:403:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 07:20:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:19:58 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Thread-Topic: [PATCH v3 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Thread-Index: AQHYhJA2Ddcw8LgfS0OngJOVr0DQTa265XXQ
Date:   Mon, 22 Aug 2022 07:19:58 +0000
Message-ID: <OS0PR01MB59223D1D19D25783050A875F86719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220620102600.52349-1-phil.edworthy@renesas.com>
 <20220620102600.52349-3-phil.edworthy@renesas.com>
In-Reply-To: <20220620102600.52349-3-phil.edworthy@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0777752-8135-4fa6-54fa-08da840eb871
x-ms-traffictypediagnostic: TY1PR01MB1514:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qd18E/HqkmFRoWfgds35z6V8i5tpls7Mw+l0FmWS5l/xHYLSVfFd9r0jbZoQ8ZKmGMUIhE7uUOgpLrr4i6sFR/IMYa/5ebA2s6c0oT5POliZFJ4cZwXiCnhWWrmtFulFU0Vl4DxzMj+gQUoBrMnO14tYG7Oh7SZ5Pboj9XOjyazFXQ5OG+zUFsaW++Gx+Ux029+oVA/TFdYqck+94mUcApeS+NQc+jS84eol6uuKNMghRWQTvgsmFR/cnbPgB6tazplgu5RXBh1RNQ2zHxtaSuKcwCTZDnTEODOfXCxVk+5SymssH3nWMxByKRhaq3NDFsbe8bksbF64eCO3GNPXacSaAWO5YPJCg4b35E0w1Ngn/Gy0R/qLZYI85se0K5N9qp3E2iLYKNG00P4Dd/np6K6UVbKYGi4ghGqAJ7Xq83BBSpzMP86pEPMyCTXEERMEcfF3v/5Uo4YhF0XQLCFbmNP7hODdKMEqUNhwkthDLKOsHNP2XXdYmI7w36wt/TUz27BY3FOE1IYy9HGCZYBB2B50CnTHVCuGxNV60lMxpCxGIwz814C5g+EbjH/tKHQBd7T1d6BRh4YPk2EvYcJDbc2EXejIx3YnwpPEA1/tvUtbVYLMHSvYTsZYU+kJInDnebXt6l1KMKwNtBhljhoPAt5x5+0BiKqBrIOuYPualtxJZsGwr+NJN/u7WcAEbtNFYbnEtBaX4y+TcLOvy91yFl7Tpigdc8GZpoBFFFM5XNV4wcL83eI35jtZ/Qrt7Nj5G/o1EleBQU1Wl+nUMmhd4w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(2906002)(8676002)(52536014)(4326008)(66476007)(66446008)(316002)(66556008)(64756008)(54906003)(110136005)(66946007)(76116006)(55016003)(38100700002)(8936002)(122000001)(5660300002)(86362001)(33656002)(41300700001)(6506007)(7696005)(38070700005)(71200400001)(186003)(83380400001)(478600001)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Crsb7KKwm5qUVTteffIyRy/r4D5KrezmmayDQxIeGn8qyklycvgYrwoNuKln?=
 =?us-ascii?Q?6ByY3EPt8BAVwmCTnai8nPOvbsYw91SrMu7FNlCmwB908RM2NedcCt/aZXo7?=
 =?us-ascii?Q?J2HRuqrB9K9UoH+DTnIPP/btqcDV5sYusQ3Q+7hOACs+hueKEcsYoUQ69PIZ?=
 =?us-ascii?Q?5t4OeIXJorVy2xFxjmsFdhGqcWe84G7R63Vi7EzBFZOPDbdmtiDPNPU/1GYy?=
 =?us-ascii?Q?mLdoltahLlSc8kDpQCLXlYemU1hq/GD+JMEPUz1h5NsnxHOEkzV63MnoOo+/?=
 =?us-ascii?Q?KWEVLAgi3w+O+gsGuAGKB6SaUEH7SsfsNtHiosiZJy0DpKY2t8ZH2a4Qtxbg?=
 =?us-ascii?Q?rwRdga2RSgXRnIi8b+606TFJf2oCpgDcmxAwm426VKlWwGRqJRxv8z5AwtWO?=
 =?us-ascii?Q?Y7sRKA51kuhwe98w2OPddwKigYSy8oSUvsXJHYU8VIMwcf8eQ8B4ObHLfPrF?=
 =?us-ascii?Q?ZoFJHUhZ1JINgq47k2T0ZhDQHPpeAXgsa8+2mRb2PLwUmliud+ClotfHT9Ac?=
 =?us-ascii?Q?ouq8kNgTnEN2Dh0ZUdmVfi+lQ2M1L5mARkpDNJJ89+yjMLCNGj1dG0a9cgQh?=
 =?us-ascii?Q?ylRrHsIsZvKXpmi994wi0ivkWkvtit3CBDCwNfURpgiNbWYVTTymoWCurI+E?=
 =?us-ascii?Q?piGWxJURAfwO/yuHxTdl+tUJyp8EwUIYUQhzpwaDW/7a7/pNzszZixHDFBUG?=
 =?us-ascii?Q?8PQAmjS0p9zX8O7k33ml4eqmE3iaWGl5pH/2v7tMtZjBlFMXumRXW4JEilUq?=
 =?us-ascii?Q?wML98fmAuKct3F47kaWDjIlCsXDazH7/sNW7zevnI9ydqxyF13EXGGuKInQC?=
 =?us-ascii?Q?6fIr6nRiOZRjtwJ/MQGfjb1snSsPUzMyob1Ri+pfnbG4Oq7ZgBKaPzDfo925?=
 =?us-ascii?Q?OWdGVkNfG53Hbl5AjFLyqsfkNipzNoX00u+cAvE0XXFffd3Mi9FTCRplfead?=
 =?us-ascii?Q?jEkIrmz4pJLiQ1LNVjy02kXd/FlxoYUDbE6/H7BOqyGDsQT1mR30ytlNhv/W?=
 =?us-ascii?Q?oJcnfhL1G6w5DxnnL5D97/aO7eYXURcrQ9XH3ePGy/ZUWiNLpurvQcNtCYSI?=
 =?us-ascii?Q?8KHWkeTH5dL92yBL38fDnBG8wlU8fyABQCitlGWlK3eaP8u/UurdOOATxCa6?=
 =?us-ascii?Q?ACQlmmKk7xtzsFPrcagZQMyW7Ob7Si8pYu3uGlSVT+mkOazuSElU6ibRyNuy?=
 =?us-ascii?Q?C2rlNrsXIMomZXb7PlRpvqfSxTcq74grlzN4ttjXM3IADsRLA2UhoqzPaZdS?=
 =?us-ascii?Q?TLX2h5+nU0YHGregva1gpoarEi5QVQkt89Xg9a2xhCRLtnbcvKf93SF5wLUI?=
 =?us-ascii?Q?6Sov3rCRPMg2SwyYImE/YCmG1g/VRu0HgyYKKtozsp6u6r1I8nVvB5voNyBg?=
 =?us-ascii?Q?/09VUigIg5kJb/DhGOyHZGfDbmteI8mCtLvn4hGxJTgQ+F0wJzrYVR+o6Vr7?=
 =?us-ascii?Q?25fNQnY3KyAoRmhd4k++FhSo3dFpeuB/PqIXfM56m25Mw/rGfwDgfABy0Gkp?=
 =?us-ascii?Q?8AIhzARTJot4UOB26ZGfQHkYVjlpDQEngAlsEbXwD64HOYxdCrVg1rzeqBeQ?=
 =?us-ascii?Q?jRUt7eK8Qj2NBQ0K/ksSsczqOCbJTApOLO6cGrYp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0777752-8135-4fa6-54fa-08da840eb871
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 07:19:58.4877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pUl5xwlG0hCAFq9T7Okf6ycFhjkhJmHBj69zQxNB+X9pNYcfXadRKHanb+smy8KrFxzDP1uxHQ3pQE959Lg4l3rm++jhCeGTuaJ5+GEyf1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1514
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Phil,

Thanks for the patch.

> Subject: [PATCH v3 2/2] watchdog: rzg2l_wdt: Add rzv2m support
>=20
> The WDT on RZ/V2M devices is basically the same as RZ/G2L, but without
> the parity error registers. This means the driver has to reset the
> hardware plus set the minimum timeout in order to do a restart and has a
> single interrupt.
>=20
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Don't call pm_runtime_get_sync() in restart()
>  - Use mdelay instead of udelay, avoids DIV64_U64_ROUND_UP
> v2:
>  - Replace use of parity error registers in restart
>  - Commit msg modified to reflect different contents
> ---
>  drivers/watchdog/rzg2l_wdt.c | 39 ++++++++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 6eea0ee4af49..70cbd9ba01fe 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -10,7 +10,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> @@ -40,6 +40,11 @@ module_param(nowayout, bool, 0);
> MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started
> (default=3D"
>  				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>=20
> +enum rz_wdt_type {
> +	I2C_RZG2L,
> +	I2C_RZV2M,
> +};
> +

May be I2C_* to WDT_* ??

>  struct rzg2l_wdt_priv {
>  	void __iomem *base;
>  	struct watchdog_device wdev;
> @@ -48,6 +53,7 @@ struct rzg2l_wdt_priv {
>  	unsigned long delay;
>  	struct clk *pclk;
>  	struct clk *osc_clk;
> +	enum rz_wdt_type devtype;
>  };
>=20
>  static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv) @@ -
> 142,11 +148,29 @@ static int rzg2l_wdt_restart(struct watchdog_device
> *wdev,
>  	clk_prepare_enable(priv->pclk);
>  	clk_prepare_enable(priv->osc_clk);
>=20
> -	/* Generate Reset (WDTRSTB) Signal on parity error */
> -	rzg2l_wdt_write(priv, 0, PECR);
> +	if (priv->devtype =3D=3D I2C_RZG2L) {

Same here.

> +		/* Generate Reset (WDTRSTB) Signal on parity error */
> +		rzg2l_wdt_write(priv, 0, PECR);
> +
> +		/* Force parity error */
> +		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> +	} else {
> +		/* RZ/V2M doesn't have parity error registers */
> +
> +		wdev->timeout =3D 0;
> +
> +		/* Initialize time out */
> +		rzg2l_wdt_init_timeout(wdev);
>=20
> -	/* Force parity error */
> -	rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> +		/* Initialize watchdog counter register */
> +		rzg2l_wdt_write(priv, 0, WDTTIM);
> +
> +		/* Enable watchdog timer*/
> +		rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +
> +		/* Wait 2 consecutive overflow cycles for reset */
> +		mdelay(DIV_ROUND_UP(2 * 0xFFFFF * 1000, priv-
> >osc_clk_rate));
> +	}
>=20
>  	return 0;
>  }
> @@ -227,6 +251,8 @@ static int rzg2l_wdt_probe(struct platform_device
> *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to deassert");
>=20
> +	priv->devtype =3D (enum rz_wdt_type)of_device_get_match_data(dev);
> +
>  	pm_runtime_enable(&pdev->dev);
>=20
>  	priv->wdev.info =3D &rzg2l_wdt_ident;
> @@ -255,7 +281,8 @@ static int rzg2l_wdt_probe(struct platform_device
> *pdev)  }
>=20
>  static const struct of_device_id rzg2l_wdt_ids[] =3D {
> -	{ .compatible =3D "renesas,rzg2l-wdt", },
> +	{ .compatible =3D "renesas,rzg2l-wdt", .data =3D (void *)I2C_RZG2L },
> +	{ .compatible =3D "renesas,rzv2m-wdt", .data =3D (void *)I2C_RZV2M },

Same here.

Cheers,
Biju

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
> --
> 2.34.1

