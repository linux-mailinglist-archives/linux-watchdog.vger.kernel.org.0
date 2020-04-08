Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B87F1A1E01
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Apr 2020 11:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgDHJVg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Apr 2020 05:21:36 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.5]:55533 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726754AbgDHJVg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Apr 2020 05:21:36 -0400
Received: from [100.113.3.6] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 47/51-46412-C979D8E5; Wed, 08 Apr 2020 09:21:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSbUxTVxzGOffelguh9bbAOKuUhQaNY7RrSxa
  7ZJq5D67ZNNmXRcPGyy3c0ZuUS+mLFhZNqTRLbNhwUnmxDuvKi69BUCJuaVyXTlCnq9uAli24
  UV2KI4aVQHBYd9tb3fbl5Pec58lz/jn546j4Ol+CUzYLZWJIg4yfjelfFQ3LPV3tVco/w2LNj
  1c9fM3MBX+mJuq9hWjuXfUimvlYAn2Tpz197hxPm5jdrR1ftWdq4yNF72EVPJrRNdpqeHrfpT
  gwDuTbFu+c5dlBTHQYZOOA6Edh92CCz4nvMPgk6ORxYhTAv9vXUg5GTKDw1lN/SoiJLxA4f+0
  QwolfAFx+PMuKLJxPaODRiXupVB4xBuBahxtLCpRwAnjDtw6SqVyiCsafrmBJziOq4ZfxQ2lW
  w7GAL9WEESXw8PooL8kCohIGVy6nWEww0Ov/gZ/kLGIbHBkcSnUCQgqXW8+iSUaJAhiJ9qV6I
  EFA39d3UI7zYWw+wePyFJx0zADuvgx+Px1Nswz+al9M56Xwbp8rfb8bBu1OPselsH85yONYA3
  0uJzs/znIJTASaOTTA7s+sXGIzjN//Kd1YCAO+pdSXQMKDwYWwA3QAZe9/pua4DJ786i8+x6/
  AAe9DtDf1EyI42RPFTgLsDHhdZ6Lr9ZYGkjbIVUqlXKUqlydPpYJskZMKyiqvpRiLiWRdBbnf
  rDA3N9Qa6hQMZRkB7E7VNWUwV0Br3yNFALyII7J8wY629iqxUNdY16wnzfpqk9VAmQOgEMdlU
  DDpZj2RiaqnbB/RBnYzn9kQz5HlCVY6WVtgNpINZrqes24AOd4RO3EKFWNMI0NJCgRryQ4iGd
  JbmecVz/b7LpBKcgUgIyNDnGOkTA205f/+AijAgSxXcOUY25JDM5bnLy2wQyDsEFM6V3IIC/m
  vJbEjwnLb/ndDwgHJ2z/ft5iGZVOzG14bFBeHDqyG8VMt6idvVTz6YJ9jekeFK2tVWjZU8/EG
  aV7hpbB/r7HOvHfwwabzL4xFjuw7b1Xd/Lay7I/bwmxiceronm3omR4bGu5arqzpShic+n6to
  jZKXQuZdm087nao/J+8X7N0BGw6Zty6ZV3yjkfz0q7fIglT7c7p0MTqRlv1BV7m9O1vpEV7rj
  /oLMKF5eOffyrq/jD0uKpJRxfFQ00tSpe3e8a9HYl0UqNtB+eGgheH6Z4IcCNzc0sHe9VIm+e
  NwBi9vfz3LfMHjm/dWSx5KJKXTuSXdKvHW1/u0sVOX1ZvvhiLFztuyjCznlSVoiYz+Q9fq8ZY
  WgQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-23.tower-229.messagelabs.com!1586337691!2745585!1
X-Originating-IP: [104.47.17.176]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30568 invoked from network); 8 Apr 2020 09:21:32 -0000
Received: from mail-vi1eur05lp2176.outbound.protection.outlook.com (HELO EUR05-VI1-obe.outbound.protection.outlook.com) (104.47.17.176)
  by server-23.tower-229.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2020 09:21:32 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnioYyjTI7HDNuVM2/TOOEHCyXBDA+ZMwuTTowUc2DOYU7Zubn2CfATUl86A0swFynwXY4SE2C5hZ3SJzZHdJIrgBBTKJYw+E+kDfJ625weYt82yLGs3deaWiFEGeM7MVCWdSV6YWOBrbc+xhqbKu2B3UFxrf2HJQ7oG6t6eDhOngJ0pvawnHtoZu7IWrBCoBMhXD8SxDF6RTPH2AbpAbtVcyABROt/IPUnUWVD4KM9g1YIip47YDnYIv48a/qUL8FCtOyec138aPmTdp3WJWUkGkifI7rl/jiFg5GPlEri3A3Pcr9jRkKCqAbV3/rp6bkZphiCrMqiMt4MinSkxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+39g3bFNaVEdQ3q6kw37WaIMGR4DkcTVD4DGklZX94=;
 b=XezJEHISu/idSJpAnoHVC7kMwWXp7FuS1rD3vBoWPINJttHn9aLgXU2Z7OJv8aiTDVryfJ4dH4Wcyw3t2zqI8IP1yLVOhO8hTnamXj41FubAO8+NVIirjyyJFcgPhKM86GyZLkrmLL2KElDDm3+l7dwiUU5EMCb732RsV4onXuYBNCI7IAHGmzmmgXHiezBjDat6TQ+J4qSomgqJQImY/FoEb4nKCbIGipPPb2cQBGjvFIPLwQ92ufo76TVTPzSE6iGjDpS8l2njQ+tO+ibefWPdDdLnfSOd41T5VpsqiVqozkEcP44i7+OgK3HZF/QblWnBvh0AReQp4NmbSpf02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+39g3bFNaVEdQ3q6kw37WaIMGR4DkcTVD4DGklZX94=;
 b=kjZ4RSaaR7O33NKGOZmJuvn4p608pjwBxhBYxdy+Xa6Gy2SiM+r4OH3Qq4gHnqvj/S7Q6XlOKVU5MbM4HmVxUJHCTm0YGT93lFbT/90AD3JvGkkkfcU8fEOH3ybxn+/dfqFA/8R5fxCphhXbR0t3o07ZHEUru4sKE2ch3BSytyE=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52::13)
 by AM6PR10MB2167.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:44::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Wed, 8 Apr
 2020 09:21:31 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2900.015; Wed, 8 Apr 2020
 09:21:30 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] watchdog: da9063: Make use of pre-configured
 timeout during probe
Thread-Topic: [PATCH v2 2/3] watchdog: da9063: Make use of pre-configured
 timeout during probe
Thread-Index: AQHWCbjaS1lzIu2hdECDAc5kXQHsC6hu+buw
Date:   Wed, 8 Apr 2020 09:21:30 +0000
Message-ID: <AM6PR10MB226393C2777035CF59F2FD3180C00@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200403130728.39260-1-s.riedmueller@phytec.de>
 <20200403130728.39260-2-s.riedmueller@phytec.de>
In-Reply-To: <20200403130728.39260-2-s.riedmueller@phytec.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [146.200.27.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a93ee3a-1aeb-4389-1635-08d7db9e395d
x-ms-traffictypediagnostic: AM6PR10MB2167:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB21675D20CA8C730B55185C35A7C00@AM6PR10MB2167.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(8676002)(6636002)(186003)(4326008)(9686003)(33656002)(55016002)(2906002)(52536014)(66946007)(316002)(110136005)(26005)(76116006)(8936002)(6506007)(5660300002)(478600001)(55236004)(53546011)(86362001)(64756008)(81166007)(66446008)(7696005)(66476007)(81156014)(54906003)(66556008)(71200400001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cMKxIx7ZBPZl3dsuQuBI8KymPbmDQql47ZzU8Zj3NwCxYDSlabnLA56uRg9Dxg5gpITRDfAHqIMW/UTHAFKBNCO92vwmCITUawhb8euIaO0xr7Iwch9tl5xVsH86gDN3km2t99+AVtNiHUJq5V5fPlftab2s0G4H+YPQcEVW9i/2AW5gt3oO4kb1KlAFHlxwkTeyWLNG5Z0/lyI3emGafeoXb4urFme1LTkLO2lmoAuBnkc6rs4K+cX1arO2nbKiBkRMKgc1csxReCkKdBpsetP5Vv6NokoSaNLOy/0G12kb4D0BenwoN4I2UDZ5GshpST8KpG3ElHWnnvJon5LWygLWTjo2n2Fw+86CbfT5lXuPKNOELXmlSNzksXlY7nYcsrrGGgOgHHHp8C7sL+BgVQ6FbJEnUMJgsNAKmo5lJuZkivbHk1tMn55WSbRnyHPj
x-ms-exchange-antispam-messagedata: hjBzBAC8OEdUfei1ej8VZQLubdNnE1NdAg/yO/fI63B/QOFC3sSKCsgSGbWc1Y68bfAUc+Hy+T9q1qBHMuqnkVGFGjKje0nIfn/kx4xLlxTSab6zRNOW7W/fii5Cu9Ft/0+GS5nhtPHn+67GcpqcrA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a93ee3a-1aeb-4389-1635-08d7db9e395d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 09:21:30.8822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++5GdRcYfxWS0DuQumY0JBhhoKZ2vKyVGz41W2Cw+d3PbSXQ8q+UAiNmlQvAnssNnyHzO8peAWP8nhIFG2IJc7pYALqalWo5Ck8I3OLONmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2167
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 03 April 2020 14:07, Stefan Riedmueller wrote:

> The watchdog might already be running during boot with a timeout set by
> e.g. the bootloader. Make use of this pre-configured timeout instead of
> falling back to the default timeout if no device tree value is given.
>=20
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Changes in v2:
>  - Reworked patch to use the pre-configured timeout onyl as a fallback
>    instead of the default value.
>  - Removed info message.
> ---
>  drivers/watchdog/da9063_wdt.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.=
c
> index 3d65e92a4e3f..423584252606 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -46,15 +46,16 @@ static unsigned int da9063_wdt_timeout_to_sel(unsigne=
d
> int secs)
>  }
>=20
>  /*
> - * Return 0 if watchdog is disabled, else non zero.
> + * Read the currently active timeout.
> + * Zero means the watchdog is disabled.
>   */
> -static unsigned int da9063_wdt_is_running(struct da9063 *da9063)
> +static unsigned int da9063_wdt_read_timeout(struct da9063 *da9063)
>  {
>  	unsigned int val;
>=20
>  	regmap_read(da9063->regmap, DA9063_REG_CONTROL_D, &val);
>=20
> -	return val & DA9063_TWDSCALE_MASK;
> +	return wdt_timeout[val & DA9063_TWDSCALE_MASK];
>  }
>=20
>  static int da9063_wdt_disable_timer(struct da9063 *da9063)
> @@ -191,6 +192,7 @@ static int da9063_wdt_probe(struct platform_device
> *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct da9063 *da9063;
>  	struct watchdog_device *wdd;
> +	unsigned int timeout;
>=20
>  	if (!dev->parent)
>  		return -EINVAL;
> @@ -214,13 +216,19 @@ static int da9063_wdt_probe(struct platform_device
> *pdev)
>  	watchdog_set_restart_priority(wdd, 128);
>  	watchdog_set_drvdata(wdd, da9063);
>=20
> -	/* Set default timeout, maybe override it with DT value, scale it */
>  	wdd->timeout =3D DA9063_WDG_TIMEOUT;
> +
> +	/* Use pre-configured timeout if watchdog is already running. */
> +	timeout =3D da9063_wdt_read_timeout(da9063);
> +	if (timeout)
> +		wdd->timeout =3D timeout;
> +
> +	/* Set timeout, maybe override it with DT value, scale it */
>  	watchdog_init_timeout(wdd, 0, dev);
>  	da9063_wdt_set_timeout(wdd, wdd->timeout);
>=20
> -	/* Change the timeout to the default value if the watchdog is running *=
/
> -	if (da9063_wdt_is_running(da9063)) {
> +	/* Update timeout if the watchdog is already running. */
> +	if (timeout) {
>  		da9063_wdt_update_timeout(da9063, wdd->timeout);
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
>  	}
> --
> 2.23.0

