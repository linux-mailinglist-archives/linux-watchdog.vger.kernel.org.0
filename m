Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DFE233B8D
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jul 2020 00:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbgG3Wsr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 18:48:47 -0400
Received: from mail-eopbgr40079.outbound.protection.outlook.com ([40.107.4.79]:10685
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728588AbgG3Wsr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 18:48:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVeunS1OVZRIHmrEgtkfHxzIihebFEjyHGs4H0wn3nZFQhzhXX42bYY1FJbsYPt72tVSqN1NLmVIQtGdN/0SbEhM1u1hjeJq5+h/ZdI/N5jgoRpq1pKoTv8DJEpqghUD5mnCd2pdz7X2ENlYu11cA1NpfQYZBOuAp1fE9CiKuicD/3xUTEmLiS+m+NNWoVenJOJE++s9C0tZ3dngGMJtMXCCPVKTmjO+j6TN3I1fWZMbncNhMgwJc9TtVlAcl50N7RIoWgieA0/gqLebzuHUEsmNRc3UWwQmd1bX3iZ/C7j26fsWKKca9BYftepk2LzSEqFExLWvGGi0FUEt51uDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9lNnIsrUcmQH8FcyhSTL3gacJxgG61op5KEqGE7VI8=;
 b=nCCDszJwk55Nt59jzO6tujljkpqwmJ4xyLlsl5l3D0Z8ABTQ0WuVqkZJtrmlZ87exm4nE2VIsUfYFTMdaKjIEa5rVZemdWw5e5JHb6iQnc8sDw0AqbPzYyOkjJL12WqR37G/jpuKALfho9ROV5haRwPcEXqDHIDvHXKOmmc9rp6rrWdeOPnh9Lq1Eev0MJHgmtjyO984JHkj6F6hU+em97uboT/ZuwlrBPOz3BJsbTrJf1uS81zzXdWw2+GsnKmJXGACnX3r7QPhKQPzGokMbQ0QQsrkDJgSd072FqbymsoWxybUk0yc+pLSrYjODUFdFijT2Vpfn5gpJ11iyddRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9lNnIsrUcmQH8FcyhSTL3gacJxgG61op5KEqGE7VI8=;
 b=dSkNioihNpBV0x0z60LoKrbeTgjeh0IFwwDPvs+rPSP0Ml7Ld2/jD9L5EBqTlBCqLYUJaS1lmvj6CThZruYElvIdQToIARwh9mgKpThiwAnTMHTA71ENd06iyDlu4Z+7qq7TLw9huvnGwbaXAna3GxjqZV8S+FLtYEYSh1cjpVY=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB8PR04MB6860.eurprd04.prod.outlook.com (2603:10a6:10:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 22:48:42 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 22:48:42 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Thread-Topic: [PATCH V3 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Thread-Index: AQHWZhYvIsu3X7R3l0CXWRnCv98krqkgV38AgABjQnA=
Date:   Thu, 30 Jul 2020 22:48:42 +0000
Message-ID: <DB3PR0402MB391669AC8C63D32F5AC65136F5710@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1596074591-4207-1-git-send-email-Anson.Huang@nxp.com>
 <20200730165240.GA178323@roeck-us.net>
In-Reply-To: <20200730165240.GA178323@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 07c2dee4-4d59-4957-d2d8-08d834dab5ba
x-ms-traffictypediagnostic: DB8PR04MB6860:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6860378D0803B12F66B17D15F5710@DB8PR04MB6860.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lsxy/zewhTIL1ocz7G0LpiSP9sr0zwKZulvhWtL/IoTr01C8xQq7FUxOmwLhIVmOCU2OK0d8aA+wukffhlc3bQzFB6ww7d2OQc3p4faWhyrnI+INTwTaYMWxF4zmtNjgVsOaErU/4oHSHDmZ/ULIEkFKC/z7Y8znRwV1VyxGFCF2T7TRcKclUhxbdoJTxmbaEceHCPrWW7IsKFXGoLtTkplzdCZeL3cd/gESQ/CM1n+4G0NT3Yvg8DQJJp2d54LZq5mh2vREsCsCI2RPsx2sCfCCmCXMrMgsvYM4FCACIulaNL/YHeePJDPJpN8070pordWuVh1/zvSiHWc3ZNJG4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(44832011)(33656002)(2906002)(66556008)(66446008)(66946007)(66476007)(64756008)(76116006)(71200400001)(86362001)(4326008)(83380400001)(52536014)(316002)(478600001)(26005)(6506007)(7696005)(55016002)(9686003)(54906003)(5660300002)(8676002)(6916009)(186003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GqsTyubpLKH2eBtOnlYklVQhtM1Ugplk/b2jBhagQs4ySJqayCUDM0uZzBtejtFTcQ8My98fHJo2m8xIjCMCzghlLdf5bn6ULG9QqynX7dGhM6IsA53aUXuairoeoDS8B/wIahrfs39zGgN8KHaCNPNpIomV4FNL3ZWhuPcWPjJTMdcWJHXvtyxFBcYXCfWvG4+TEGv2+c7wF5WvyfbhcgqLYz9o/aSYS5bLtmGYWKhMFyCcd7KuQQKd+al3CsaD9LN19abCvt6rp2dOv3IIlIfK6oENr4LRFAEI3Rb1qUQE+QELkD0IyqYawe3YvpC3XxxhKFBFpDr6mERkXprgfMVjYQaEt8vSd22Lu60cf/jw+qS1TpDpRhSOXjAQBgVfoeAJq4c1OWK7p5BmKvwN6FZrN6H7oWjkGTyUTqKletEjSGnbkDazJyj3CcKJBbfgJS8xqfa5g4tgUICcLBUeApMXsMoUSjzWKk9ClDLcHdTlbmOUoJ4CdLa/C8ZfdAnTS7TEK05FCVYchyG103Xm+RbkQaSYedfN07PcS85tZm38FAooYU3/hGMnUIbdQmLOWs8hxUBStFrFGhnpbZVavwwS9fSyc1s2bDGvPhgFk/zGfcxudoLkDPbTjeWkhRNkRoVv0Z0RyHpep84qmBTV3g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c2dee4-4d59-4957-d2d8-08d834dab5ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 22:48:42.7510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQJ8KtvyWqG6nym/k8g6TJsYcISFzfVziIogqP13sXO4BHaLt2g9d8Kg/RP/ObXIaQi6badnInzu+G53JcUg1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6860
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Guenter


> Subject: Re: [PATCH V3 1/2] watchdog: imx7ulp: Strictly follow the sequen=
ce
> for wdog operations
>=20
> On Thu, Jul 30, 2020 at 10:03:10AM +0800, Anson Huang wrote:
> > According to reference manual, the i.MX7ULP WDOG's operations except
> > refresh should follow below sequence:
> >
> > 1. disable global interrupts;
> > 2. unlock the wdog and wait unlock bit set; 3. reconfigure the wdog
> > and wait for reconfiguration bit set; 4. enabel global interrupts.
> >
> > Strictly follow the recommended sequence can make it more robust.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> > changes since V2:
> > 	- change the wait timeout to 20us according to experiment;
> > 	- drop WARN_ON when timeout, and check its return value in each caller
> for
> > 	  unlock wait, no need to handle the return value for reconfiguration.
> > ---
> >  drivers/watchdog/imx7ulp_wdt.c | 74
> > ++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 61 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/watchdog/imx7ulp_wdt.c
> > b/drivers/watchdog/imx7ulp_wdt.c index 7993c8c..010ddd1 100644
> > --- a/drivers/watchdog/imx7ulp_wdt.c
> > +++ b/drivers/watchdog/imx7ulp_wdt.c
> > @@ -5,6 +5,7 @@
> >
> >  #include <linux/clk.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -36,6 +37,7 @@
> >  #define DEFAULT_TIMEOUT	60
> >  #define MAX_TIMEOUT	128
> >  #define WDOG_CLOCK_RATE	1000
> > +#define WDOG_WAIT_TIMEOUT	20
> >
> >  static bool nowayout =3D WATCHDOG_NOWAYOUT;
> module_param(nowayout,
> > bool, 0000); @@ -48,17 +50,40 @@ struct imx7ulp_wdt_device {
> >  	struct clk *clk;
> >  };
> >
> > -static void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool
> > enable)
> > +static int imx7ulp_wdt_wait(void __iomem *base, u32 mask) {
> > +	u32 val =3D readl(base + WDOG_CS);
> > +
> > +	if (!(val & mask) && readl_poll_timeout_atomic(base + WDOG_CS, val,
> > +						       val & mask, 0,
> > +						       WDOG_WAIT_TIMEOUT))
> > +		return -ETIMEDOUT;
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx7ulp_wdt_enable(struct watchdog_device *wdog, bool
> > +enable)
> >  {
> >  	struct imx7ulp_wdt_device *wdt =3D watchdog_get_drvdata(wdog);
> >
> >  	u32 val =3D readl(wdt->base + WDOG_CS);
> > +	int ret;
> >
> > +	local_irq_disable();
> >  	writel(UNLOCK, wdt->base + WDOG_CNT);
> > +	ret =3D imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
> > +	if (ret)
> > +		goto enable_out;
> >  	if (enable)
> >  		writel(val | WDOG_CS_EN, wdt->base + WDOG_CS);
> >  	else
> >  		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
> > +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
> > +
> > +enable_out:
> > +	local_irq_enable();
> > +
> > +	return ret;
> >  }
> >
> >  static bool imx7ulp_wdt_is_enabled(void __iomem *base) @@ -79,17
> > +104,12 @@ static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
> >
> >  static int imx7ulp_wdt_start(struct watchdog_device *wdog)  {
> > -
> > -	imx7ulp_wdt_enable(wdog, true);
> > -
> > -	return 0;
> > +	return imx7ulp_wdt_enable(wdog, true);
> >  }
> >
> >  static int imx7ulp_wdt_stop(struct watchdog_device *wdog)  {
> > -	imx7ulp_wdt_enable(wdog, false);
> > -
> > -	return 0;
> > +	return imx7ulp_wdt_enable(wdog, false);
> >  }
> >
> >  static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog, @@
> > -97,22 +117,37 @@ static int imx7ulp_wdt_set_timeout(struct
> > watchdog_device *wdog,  {
> >  	struct imx7ulp_wdt_device *wdt =3D watchdog_get_drvdata(wdog);
> >  	u32 val =3D WDOG_CLOCK_RATE * timeout;
> > +	int ret;
> >
> > +	local_irq_disable();
> >  	writel(UNLOCK, wdt->base + WDOG_CNT);
> > +	ret =3D imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
> > +	if (ret)
> > +		goto timeout_out;
> >  	writel(val, wdt->base + WDOG_TOVAL);
> > +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
> > +
> > +timeout_out:
> > +	local_irq_enable();
> >
> >  	wdog->timeout =3D timeout;
>=20
> This needs to be moved up - the timeout did not get changed on error.

Ah, yes, will fix it in V4.

Thanks,
Anson


