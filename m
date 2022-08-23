Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F2059D238
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Aug 2022 09:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240610AbiHWHbP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Aug 2022 03:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240747AbiHWHbM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Aug 2022 03:31:12 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8FC63F01;
        Tue, 23 Aug 2022 00:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYhLZHrdSeomZkvvJBlFl5E8sZAmrSS2OIwv+84Q7RVq96iSMhkpdUDPBsP8TrEWZ6vKBl2H+vsDMIVIkMOIrMBZYA4ZH7wD0AA07RJoDiL7ZjeXpWILFNcv4/ssZWRnsvMueWDcswtVRnAqKVUYROIPdi+eNAs2CNNH8udtHkgTzZi3XYn5sdPUrkoYeVoqN2pg5MjqnPYj60OcaOxYVJ0A9e3KPa6EMKT1BJmrGd0ofxPq5R6oMzaiV5LwCzrmZkhqsOgQ/SDLQP+Hp4lmBQ+7aNk/jSKWBNK07VHm9pgMVeiRxUQYOHls7DxeuyeB6dDKMyvJdUK+JbBoxQK95w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0dQIG61G/mmHkstNJLwPiQ/HNeOcpzrcangmzBQXww=;
 b=BYD40afar0BjYpqT1sZKL+8EdYUJcYjsWkxO5Ytmm1M/gJahrFbwKTtDp6hFMLdOQP1TEWP6Y1s8n1+35xYNoqOYGO04tuZ7nWp/D5uG1nh21eMoAGkPTsj6ACRq71cqgfPSmidqowQ09LfLVU83bZRfhOb3BVDXCzp61pW8NMAQ3qw7T7XfnTvDKcmPP/0vTZP6Sw7xj/OL7ECcTTx2rAbuCtHjQowPngGMtgW1KjRlSmHivO/0T8Jgd9RIpHCKSXPrEa4GS89A8rn6wmki7M6scScg2NXDsZbbee9F5HubR+H1RfwIPCtclvr9bZJ+ERGLtKFu0mjLKRfzKaxRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0dQIG61G/mmHkstNJLwPiQ/HNeOcpzrcangmzBQXww=;
 b=Jt1YdE6UIY9gH6c9yPytVKpeh27Iu3I0/OcHwxRhsKwtQEM+N2jLZMjOkMPLhNVCB2ZhaPsCyFre0hTyZfW1UjufjD85rM460x52pbEo6SMS9i81snHXhO5zeGs3Y6sL06eqReHGFybxkiU9ke9IOd5f4jeb5zOTxvLkhL2hWFs=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSZPR01MB8203.jpnprd01.prod.outlook.com (2603:1096:604:1a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 07:31:08 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::75e4:2ec3:b82e:10c6]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::75e4:2ec3:b82e:10c6%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 07:31:08 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Thread-Topic: [PATCH v3 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Thread-Index: AQHYhJA2c0CerNW+FUqClRcuEx7dqq265goAgAGVKzA=
Date:   Tue, 23 Aug 2022 07:31:08 +0000
Message-ID: <TYYPR01MB7086A18A2404C8B80FF01614F5709@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220620102600.52349-1-phil.edworthy@renesas.com>
 <20220620102600.52349-3-phil.edworthy@renesas.com>
 <OS0PR01MB59223D1D19D25783050A875F86719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59223D1D19D25783050A875F86719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa7a15cd-e540-49ef-4c56-08da84d97200
x-ms-traffictypediagnostic: OSZPR01MB8203:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zDhQIlvrfGPt6szGo0MMrxCcNaGi4YQJUHm8mI/drNRk9o0PsrSITrQwj+GMTbf2AkNyRalnyd/oD7kRhv0U8XzHrGph9nNk99F3992HeauNbf+UGnnZC2mBLD/cKb8NVjfZpeDwuj76W5kDu845TzfeCphpQvF+gzIDfAiqJ/p8Tv1ItY+URx946MxYvC/31RvS8DYt+0v2VMSlYRInFMJiKW9z8QTP6SPUOVPYjnb4TZk4VmmdUpofk5fylWcFQkG0BukGOPUgu8IcfSJ7e15rQc2XHKVxtvmb1mggAN32umdx3kjD10vvqIZNV5nQbmVcaRnF8m4g/8LdyvBNcBAMkord8pgmWsDqnlApwzhitXgOQUf9oy0ZkG9Q4bzDosa91woIxwB6nZBMpbXB1VCl3PkqigyHvgDU3c55MHik5UBj7I22nv6O91e/JHmImneRDV/GdcXhHSqs92ZcBX9nI6GQZ9GWQDGNOxjCxoPjM61LSrhEh52aDzz9ogoS7Hza1SUJOFIoqPgGYF37lDCgK0t9UB0mpho3g0YII0C/2EdDj9v2UIbm56b+B8ZU/91AsiFmKrCz/WSEE8bHlnSE/DvBi0C6xmrKVNIzX5RFXH4jnTvyfTDYwk+et0Ak7e9nU8eyxeidKQqdYpyHJdffds2nJaXStvK5RkpufT1rwtqQ332GjwhMYJ35adJd/YEEeG0aXRKigLbT8nA6jP8ykY6R4L7xtsYxd8B4gzp7oqsKFvMoNpWEWP5Awxr4iHAK+La3rIj1C86WxEP5xg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(122000001)(86362001)(71200400001)(33656002)(66946007)(55016003)(8676002)(76116006)(4326008)(64756008)(66476007)(66556008)(26005)(66446008)(44832011)(41300700001)(9686003)(7696005)(6506007)(38070700005)(478600001)(53546011)(2906002)(38100700002)(52536014)(8936002)(5660300002)(186003)(110136005)(83380400001)(55236004)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4zauJRu0ZI45oAed9/wCLZxleMf/HSxrwHfhGMsQgE05RnXp8sfA2k9NNEFK?=
 =?us-ascii?Q?160nFquL9Egzqi/w7TnFnDcwgSaKl0g3uTVyf90/6vdMJPSPrfYL/UwTR8FW?=
 =?us-ascii?Q?/eNaZ8Y+ETMo4Kyoip0s1ZPeAowY3V0XRoJLJNLH705JqOsaQcmKufSRr3/0?=
 =?us-ascii?Q?xlRzH+pg70g4ayT24VECqbfQuuRItgDC97S6m+k2DN3rUyi9jz5m5zj6whw7?=
 =?us-ascii?Q?OaRfjlxZcatrE7WhJ/HCCstnj5FkVNCblpGcA98fnqn18RuoOLXigN9hf/fW?=
 =?us-ascii?Q?dTLJs8lgBVSifgHaQJpAbx6KN8VZ4tm6VTOPLH/C1nWthWrbY+SNiSednC1u?=
 =?us-ascii?Q?gqKUct7SbbVYhydZzoUuc8xO6XDhiVomx0VhXPt4tzZYr0QQFfOyPKvRjNlG?=
 =?us-ascii?Q?dfv1hspo+bvOxHeD0ZoKTGIXzi+Kedt+8ZLY5gaGfPdipKPXVLF/JuJ+Z+RM?=
 =?us-ascii?Q?wwthi5RWF4Xhvwx1ZcjfMILrIlYMBCz/jKo0nFDkhpxZG0pjo1fuqOxKFiOE?=
 =?us-ascii?Q?fOTctXhCBycdjGRHqj/zigG65NEXYwLPVI4QRVMqQcsrIVhWRZ2NQgRtMbyJ?=
 =?us-ascii?Q?Fc0Gjvq7kmmpcAdEiTDxAg+d/yl3CSnYs/D4pZuK9lHJXmZ9l61Ab3eVJ0EY?=
 =?us-ascii?Q?XJSnfUbyAPc+EFdHWFdpZ1sjDTuVU/clX9eSlmpWPilzhiIl9OhMG84jv3pU?=
 =?us-ascii?Q?dvVhdaj7WRkUTfqUaQAodGyvEJ/SC34MyGJeYX7CKesrC+kX/fvKyYxd/ZsR?=
 =?us-ascii?Q?dsYVT+Vujx6Cs5ySdfAZZAlgcOObw7hum601l4TeDaDj/r0LqGX3xnRoNl1I?=
 =?us-ascii?Q?THcC2f7owWa3BVIgQwG9G5+U4C1Llb/Sfg+faXzZTEo/F41w4LuhjgaQIXj+?=
 =?us-ascii?Q?vWFTHc4frVouN5Hy75QSoGdBuY7bFYL59ozKGcWcVO2VFQzT3aO953ewfWdM?=
 =?us-ascii?Q?cOXoMU92/ril8/UGsHv8/DuZP9bxowyOJ9A/G9hWgSoWd4GfP7jNXxknUz0K?=
 =?us-ascii?Q?xyr+6x7IVB2DrByRjdSw2yMActGYiCAAJky24H655DCA+w7G35gTOSSndANv?=
 =?us-ascii?Q?RasquT+PeO1dsbWtWQvFwHyermKM3rDZ3E14rz8FLlTbSapSOmFRInPvpxca?=
 =?us-ascii?Q?0FHlhLKh0OmZ9/1ZGrtNMM3U4rq5bMaCn3ZTrlPbyKQXOfQhMSwd66KsaIxb?=
 =?us-ascii?Q?2kvHBwx4wh1KD5DtkUBV/w1bjcFji3lOKLsND6ng2XnhELSUsxeN4LqWbJdc?=
 =?us-ascii?Q?+ZF/YTF8gfVbm2VjE6sM9irsdHd4KgfZK7B4cxTzD0qdsp6T3o92vYUt38eu?=
 =?us-ascii?Q?moejBciHHDkLXeZ/6C4TELBOA2pXFUGul8z1Bdmwa1n6ou8c7Bk/wg81qHbo?=
 =?us-ascii?Q?sGcDp4trT7OkwiyGbJq5H1yNqbsX+z8mrdUcwfRZsxlbRisDy2jZ4DMW8Jp7?=
 =?us-ascii?Q?c4kkjPulxzi9Z5sCZn+4t8BVejBrQ2BaIS3iEz/uUioB/vhg+4B0CBRB41F8?=
 =?us-ascii?Q?bTlp330UM0Zr0YgY167DKhVjLxZcxj7cIbdQ84aD0yQIDnvsxYNbwEt8p1zv?=
 =?us-ascii?Q?MT4SK09NDjAErvqI1gOybglSHXGS08xV6KQQ7qh5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7a15cd-e540-49ef-4c56-08da84d97200
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 07:31:08.1269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRCQyz3C0HJ+th2M9vFHMamNSEIB1sF0nIY5Jh08PCjkTPb/BtGiNeSmcFUdJpzVUMVp0zkUpR1wD/He73s426m+nZ445TbD1E0DgoUIKvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8203
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

On 22 August 2022 08:20 Biju Das wrote:
> > Subject: [PATCH v3 2/2] watchdog: rzg2l_wdt: Add rzv2m support
> >
> > The WDT on RZ/V2M devices is basically the same as RZ/G2L, but without
> > the parity error registers. This means the driver has to reset the
> > hardware plus set the minimum timeout in order to do a restart and has =
a
> > single interrupt.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v3:
> >  - Don't call pm_runtime_get_sync() in restart()
> >  - Use mdelay instead of udelay, avoids DIV64_U64_ROUND_UP
> > v2:
> >  - Replace use of parity error registers in restart
> >  - Commit msg modified to reflect different contents
> > ---
> >  drivers/watchdog/rzg2l_wdt.c | 39 ++++++++++++++++++++++++++++++------
> >  1 file changed, 33 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.=
c
> > index 6eea0ee4af49..70cbd9ba01fe 100644
> > --- a/drivers/watchdog/rzg2l_wdt.c
> > +++ b/drivers/watchdog/rzg2l_wdt.c
> > @@ -10,7 +10,7 @@
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > -#include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
> > @@ -40,6 +40,11 @@ module_param(nowayout, bool, 0);
> > MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started
> > (default=3D"
> >  				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> >
> > +enum rz_wdt_type {
> > +	I2C_RZG2L,
> > +	I2C_RZV2M,
> > +};
> > +
>=20
> May be I2C_* to WDT_* ??
Oops, yes I will fix this.

Thanks
Phil

> >  struct rzg2l_wdt_priv {
> >  	void __iomem *base;
> >  	struct watchdog_device wdev;
> > @@ -48,6 +53,7 @@ struct rzg2l_wdt_priv {
> >  	unsigned long delay;
> >  	struct clk *pclk;
> >  	struct clk *osc_clk;
> > +	enum rz_wdt_type devtype;
> >  };
> >
> >  static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv) @@ -
> > 142,11 +148,29 @@ static int rzg2l_wdt_restart(struct watchdog_device
> > *wdev,
> >  	clk_prepare_enable(priv->pclk);
> >  	clk_prepare_enable(priv->osc_clk);
> >
> > -	/* Generate Reset (WDTRSTB) Signal on parity error */
> > -	rzg2l_wdt_write(priv, 0, PECR);
> > +	if (priv->devtype =3D=3D I2C_RZG2L) {
>=20
> Same here.
>=20
> > +		/* Generate Reset (WDTRSTB) Signal on parity error */
> > +		rzg2l_wdt_write(priv, 0, PECR);
> > +
> > +		/* Force parity error */
> > +		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> > +	} else {
> > +		/* RZ/V2M doesn't have parity error registers */
> > +
> > +		wdev->timeout =3D 0;
> > +
> > +		/* Initialize time out */
> > +		rzg2l_wdt_init_timeout(wdev);
> >
> > -	/* Force parity error */
> > -	rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> > +		/* Initialize watchdog counter register */
> > +		rzg2l_wdt_write(priv, 0, WDTTIM);
> > +
> > +		/* Enable watchdog timer*/
> > +		rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> > +
> > +		/* Wait 2 consecutive overflow cycles for reset */
> > +		mdelay(DIV_ROUND_UP(2 * 0xFFFFF * 1000, priv-
> > >osc_clk_rate));
> > +	}
> >
> >  	return 0;
> >  }
> > @@ -227,6 +251,8 @@ static int rzg2l_wdt_probe(struct platform_device
> > *pdev)
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to deassert");
> >
> > +	priv->devtype =3D (enum rz_wdt_type)of_device_get_match_data(dev);
> > +
> >  	pm_runtime_enable(&pdev->dev);
> >
> >  	priv->wdev.info =3D &rzg2l_wdt_ident;
> > @@ -255,7 +281,8 @@ static int rzg2l_wdt_probe(struct platform_device
> > *pdev)  }
> >
> >  static const struct of_device_id rzg2l_wdt_ids[] =3D {
> > -	{ .compatible =3D "renesas,rzg2l-wdt", },
> > +	{ .compatible =3D "renesas,rzg2l-wdt", .data =3D (void *)I2C_RZG2L },
> > +	{ .compatible =3D "renesas,rzv2m-wdt", .data =3D (void *)I2C_RZV2M },
>=20
> Same here.
>=20
> Cheers,
> Biju
>=20
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
> > --
> > 2.34.1

