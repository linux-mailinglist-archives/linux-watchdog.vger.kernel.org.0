Return-Path: <linux-watchdog+bounces-1203-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE691BA65
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2024 10:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DCD4B2305E
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2024 08:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24F4147C85;
	Fri, 28 Jun 2024 08:50:54 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2102.outbound.protection.partner.outlook.cn [139.219.17.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B62139D4;
	Fri, 28 Jun 2024 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564654; cv=fail; b=RUs2PyE7YwbJW0oSKWIJJ9Xf8upAIWypWhoR3AW0NzG1b7h6kUflEgVOsFtw4Dui3LqaJ2rO1A8+98EMRuaTHOnEOAWgl57RRkra0uA37nc7qwxNZvtYUNoGFA5OpXNKb/odrngTCsFKJSiwOL6L/TQxD2LlYLMKYJhg8XmvF9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564654; c=relaxed/simple;
	bh=hGE99M1Lgq3iE+crM3hmPWGIAWMSpl3UYsrBIz2gdok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=heXNzFwXkX2zv6lpxDYWfMDh8+bk7+WDZMJYr08ovOYJcKtxv8FQJYTdTNS68YcEhrRG+871vA2EJNRUDJw8GXK/13O5xcgqyTApGwqlmxmlJzWK4ayHx1ZhhVS0dYf6WgBgCO/C8H1niONGA3dMyIDUbv+brz9mB4lJ7rMa6po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAGgDpWD/TC9psDgTu2xCuCjXHt9F2EjJWQUbJU8s47Zouj310iy2U4cQjhkb1kBVBCjOzllOGg2lygfPBZ1/m0k43fYO4H++T1RtQ2dwyasm6iQuPJbG2Yh8NHUE4UUBXONM8G9vSyxt83FBdCW8MM2k6UICeVu5J2gkqWiR9DIQ9k0jLvDqE05+GXlDpY85Yr3ocETFYNW8RZqby5ctANw+ZJieq5BUf7zSwC43QGXjqWllUHagNES+OtrzMccR9GFWYXNB7rVDJO0VJ+XH/78PO4y1Yr0ju4P+iPKGW9phFw5aCtlgBlW+Ya5LNTDe00+3tdT+pXdxu7+oT7TwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hYxebCzXmQlRFwI4kWleyCm76/ntNaGzEqXTDxscfs=;
 b=gsWTqABBI71HbDqYXJiVnmgp9QEOQKbcWPMWwgKs1PVG47sPcI6l5Ht2JElb6qackNC/opK/Is07fXegRaWKZk7ydt2QXNxDud4E1it4YR5mQXV87ub2ZOZaPRRZvULu1CQlHMel6Jc33P9XrbSqwVAlAoVU/pJOEDpcXK2TbclY298vFXvyTLH3g+CRjRaoehrhdvgps4FrS97LPfHzdG+5qv6MPRTHcTsJQ0KXmvylw0t6lIySEnTsWu5NZakmz1ZpDdIAGp1Zvu7WhqECFGzfblCvjtTSzfq7vn+2QgtedypRU4os82e+GpGp8pONj9sfg6Vh2hQj1J8SYiazRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1116.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 08:50:42 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::a25e:ab43:d741:7538]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::a25e:ab43:d741:7538%4])
 with mapi id 15.20.7698.032; Fri, 28 Jun 2024 08:50:41 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Chen Ni <nichen@iscas.ac.cn>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] watchdog: starfive: Add missing clk_disable_unprepare()
Thread-Topic: [PATCH] watchdog: starfive: Add missing clk_disable_unprepare()
Thread-Index: AQHayQxEFY6084V3l0KF4kTfFC9B7bHc3QvA
Date: Fri, 28 Jun 2024 08:50:41 +0000
Message-ID:
 <NTZPR01MB09566E4706676F5F0DE547159FD02@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240628033508.281058-1-nichen@iscas.ac.cn>
In-Reply-To: <20240628033508.281058-1-nichen@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1116:EE_
x-ms-office365-filtering-correlation-id: 82321968-27c0-4cf6-1bc5-08dc974f642f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|41320700013|38070700018;
x-microsoft-antispam-message-info:
 AftzK3Xlpe4RoqEL4utyn/cAP04n+4USLFR/H/RlxzhvR9EhFcaa/BJqbRbw3RGob3mS0P3acemdfgaCFa2Mq5Nz0Vw/+wmrkcQB7kByPTum1O7yhsfTe7/Jobmzr+2b7GnP8vsL7bFIkgZSK/iJAHk/2oZlpaJxM9suisOt2/66zgEy7LsCvdd5q9Hu+MlDBQpr6VAY6FDc+Ds/pihPYP0ACoYUChYa7tnGciEMe8zs9Rt1MRo5FTsZVZtJmXLnfxPsFt7DM1izr7y3peQ3hcre/Je9YcDYGU9Wyzpm/jJJPQFMWzp4zO8Zkqrgx7ihw3kTYZvoPlizHdqcVuu5RwWry4yzyZ9J5ANubQJxnQl/VxbXkYXq7YQckKRpxYjxERVijsFvq20hDY7n9i47q+ly0a5MAuBXJKXuHYmpPfzA8W274EaDGTGTKPF99Ag9+TbQToo79vIfImUtgY80QCTysUvEtj5uAzk8RwDDWcRX1cHLfCQSSZOWRqd0RMs6WcRSOtHDPBOeJFPzrtHuFOiDe6N5De6n7GPM4x3KUDsRkjAHRy5a9Uit4VuCRNlUGIlWD/pSHWqgkubDzddJ9BSkiIziiYTM0MegshCs9jIBUjKiOgPpgNRX+qCqOtbt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BMH8O0YIZAYEmS43cyGludjAo6AX3XSx0fKYKOyWakOWXLdpFknL2O+SkE/r?=
 =?us-ascii?Q?9l1GbNGpD5O0TKAFAofp6MNe1o7fIBdmm8itsu5eMLrRuAChDhFmg8AmR62b?=
 =?us-ascii?Q?510wF8QrC5GPlYboZcY3owdJnfVNNR/gJAwnRExyJnD7ZtQytpqe7hU75LWX?=
 =?us-ascii?Q?R9qUH/9Qap6qlfw5g05aP9HZZ2OQY0J2bnUMQ4mimuJwx6EisDfZBGo/Yp7n?=
 =?us-ascii?Q?ybRZxKXFsNyiX054xkaKD3DEjqb7SEXk7pjJ/tzmkbUJ7fBxE44oc6q2B02W?=
 =?us-ascii?Q?70TqwWTEfKtVuazAOjNowzCePbIXEMhBUnVlY892xol2AtTZuz4eEfYQzZkg?=
 =?us-ascii?Q?8CpsPrHZyuKHQHFoEPgURu+sd+OgU5yv5H98ioGpY6oCaElY1X2qkv+kpDDd?=
 =?us-ascii?Q?sebywWMEkG6w+PYfrGakJ5GSE13aYog6TMOhADULJZvx6whr0USB5R+j9k7x?=
 =?us-ascii?Q?onDh7ayWWScZYMBGC8SbGJHMbBJYvl5IRFjCwwfUkVk0Q0DFt6KanxHdtvGi?=
 =?us-ascii?Q?pgeuWEl6tjOTz+cMIioDLO0avPW3juxTcozVbdR+Y/Ltg0QhJziElZLv+xb7?=
 =?us-ascii?Q?Km/67g8L6ZNpqTKDuTlijA+LknbE0D1cTmMGuZdKiPD6usVSc9FIbvyhQIT1?=
 =?us-ascii?Q?HT6sc0/271rkVrql/iNnjnWgcooB12vaAW5SuVp5AghkbXN2vv1ZW58n7rfd?=
 =?us-ascii?Q?AGdlVD26tQUkdAx0Xv4uUqm+R270m8DzE+c4lG4otALdXntheQ9daZhqxdBv?=
 =?us-ascii?Q?93ix533q2o81xv5Ng9jZOC7RQq2e+qF7DKgtrgBcqCMFosURDhIYv6ggbIM+?=
 =?us-ascii?Q?sUUTCN8EkRRBAO5shBhqKTDQZCSSb3a4zlwVFOP7FPKWVTw1B93gyvnOTQhk?=
 =?us-ascii?Q?bYwI4Lq6b6Y/wleMvDXFK29sZ61hTJaHsdtOsueq83ttTl4IJyedb9BGtBSN?=
 =?us-ascii?Q?aR2GaAQ47JcJwmww13B3U6vIq7GGUgmYTGC5gp/QD0MvMIO+CxyK9ovl29b5?=
 =?us-ascii?Q?Mxwoesk5iUbYGzr4B3J4/o3dF7pM2NdkXVizHvAZfcqinLxgcUF5X1KrlgK4?=
 =?us-ascii?Q?BtXaDXCyaRh4uGlzjSOr8P7EGY6f+F76Dmhgmvm4nctjxWacAxCbA0qsmtN8?=
 =?us-ascii?Q?ZHGA4Tpmb2qUZ9KvfpQ4pCPjHae8rRYDAbr1ptBTSh/sztUnQavDCI3dn2HG?=
 =?us-ascii?Q?SJgZjUx87IkmsXQlNcSOzDkAddBHlD7emkJAq0u5BjE7SQI7xLhuoWdeeLUP?=
 =?us-ascii?Q?vCldX59Vnzh5lrX1SV+lQAisQgsTg1MOvxxFBnTZwGa6FKO2iK/T+Pu0qmnj?=
 =?us-ascii?Q?RTbs0mQp2FPXBpkQtqxB4md6IQTWq4C+MZdNmDMgk3sCzKwTeAo7wT/pr0I7?=
 =?us-ascii?Q?X6T7acrVFs3ejAd5MsyAaxpeYDQWecpQn9s8oRRzEV+kSNT2sdqJktwN+tqT?=
 =?us-ascii?Q?TcP8rxymSESwYMQ4gBQTvVnkR8rN2j3Zy5SYUNG5GckQv77HJAGE+I4wyqRA?=
 =?us-ascii?Q?WPcS0S8SYJSLbtPouxCKvn02QwqP4DoZKeRMBok1JknM8ZATQ7CJFwiy5vUg?=
 =?us-ascii?Q?XduuD5DFb0sc26X5XBvoy5jUop+Q9DKJ0LDRMg/J2XsHNHtMm/7QFnkseJ0E?=
 =?us-ascii?Q?/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 82321968-27c0-4cf6-1bc5-08dc974f642f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 08:50:41.8297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wcam3vh09IjjonVfFUgUHeEEI4iHhQyBYWV5ByylJTdDFeX6NUBErI36QMNeXe3/DNo2JluQ3YyRp0pq3NF8RhVyksYpswcSxTEV1UohC0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1116

On 28/06/2024 11:35, Chen Ni wrote:

>=20
> Add the missing clk_disable_unprepare() before return in
> starfive_wdt_enable_clock().
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/watchdog/starfive-wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-=
wdt.c
> index b4b059883618..19a2620d3d38 100644
> --- a/drivers/watchdog/starfive-wdt.c
> +++ b/drivers/watchdog/starfive-wdt.c
> @@ -152,8 +152,10 @@ static int starfive_wdt_enable_clock(struct starfive=
_wdt
> *wdt)
>  		return dev_err_probe(wdt->wdd.parent, ret, "failed to enable
> apb clock\n");
>=20
>  	ret =3D clk_prepare_enable(wdt->core_clk);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(wdt->apb_clk);
>  		return dev_err_probe(wdt->wdd.parent, ret, "failed to enable
> core clock\n");
> +	}
>=20
>  	return 0;
>  }

It looks good. Thanks for your patch.

Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Best regards,
Xingyu Wu

