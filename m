Return-Path: <linux-watchdog+bounces-2203-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411CB99BD9E
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 04:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA660281D7F
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 02:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABD51BC2A;
	Mon, 14 Oct 2024 02:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="ajpm2h8t"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2129.outbound.protection.outlook.com [40.107.117.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060F83A1B6;
	Mon, 14 Oct 2024 02:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728871682; cv=fail; b=oLUMZnUy3QOuLGWhsUHS5GdPGOHmplvzOqVMmo5FF+9UeQ/DSLEoyivbmwwNoblW/8f1leGw2tSF+4herNNtDeyHCHrg7o5NaRL2alHbN8Y2qeNrCeCNG9eai8XegDyUWpes/UPPz3hoVbUnM8lf0JvSHMd0zWj76dEnjxUWjPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728871682; c=relaxed/simple;
	bh=/aMgGQ8sPuP3bxW1Fk0IKrNEf1cofFNmkB0/3Weknr4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XA0nqrS5/z5OS3cV7JyGZ2w3aeMoQcc1F8DrZI3TDrjL1AwLlON7SrqQhkkWRGhOlz3ctxaHQ5ETCu+gZKOVFfdkira8jIQTBdcw+gdsZSe50BSkY//M2m3GLej+EcHbyfEgQ0L5xUyjTFRNqd+hwmI3uvjO+YU/xyYDFFlYjE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=ajpm2h8t; arc=fail smtp.client-ip=40.107.117.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQxVsz8x2s2S7q2/iYL4pAv2iKdHtgpLRpP5OsFaZcxLS2mYKPldA4JhybCSjv6XPjPLxhuAV29N13xj4jgSplHjJqvfNphJfl7uZd7/WC7UHJshhYMWWgfWWIYbVC8h7vjGnOgaGlUh4k0V4Bpr2ZlOG1AwB3QM5SL1pWP3xVhdJIVbWNCpWi63b8vVAzM1TxeJuKcyw6aZ2RkgOFzBP1UOzyEvZjNcuOaO7w3UDA9vbYD8kmEw/tA9JZxmwWnGuLCSpx3icWTmkni4l8Lb7XOigbksvq9PuBqgZn4Esipsv/2B9eV9+FXS0xhCBw4ju4lrRTa92CwXxBaj8uZirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7ftviA8XTp2sMKrOQcMNvVlvzmQ5d6WUD8HGw3XDw4=;
 b=hDraxxMcZsoTvxs+jJFysHATbi6CcB1rV0rEA8Oz08bJsGmGKh9tY+738lxnN3rTBauAS8FqSdduceNF0Vt6cG7ZikXaavF6W+M9igAp7v0mm+n50IFD8kQtZGMZLAvg0X+uPATe3KI4klLh2QZ5IMLeG7CbFQ7sz9k1f5qyY1Z5t1ksbwgDgnqJBTl/2z42JmBPaiR5hu24D/pgjIgoxtcyJohMEv0JMneOyB7FcW+zH/xLylmFK7UNANK8ET5hlrZpSm1MJeHgeQOFTZqCaWH1hSo4SMJIBzEvDqKgs7pjqFaHwCrEyu9k7XwR0eFqg2NfFwKfTmCzA1ry8B9Zlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7ftviA8XTp2sMKrOQcMNvVlvzmQ5d6WUD8HGw3XDw4=;
 b=ajpm2h8tCMFnbcHTSSJtbSUwMUrNnRYIizLsD9m81fpJXNG0yYP7Gfk1Ctzn5W/YdCDfzYYRUT5ia1gXoAxbiPL7rEU9ekbw8yPWRnlpA7mmDnRcW2eJV3y2tty8xYmVRU+gckjOe3CsHp4YC649l0QU412CgqCzLR4wUSytjOYFdOwWweonCfHHqdHQm3BfT63IUcPCbeLhY+cVdjOEkLyaDCO4wMuUbWyYuQQ9/KUw3m4isCeK2ZjCYElZgV6MosV4QXvicoeBFJqBN/AY51xu85ADrSeiead9U9dYaezNtcFB5ymXOurHXTFCHgPnXT1vA4AcbTcMOUPHISMLfA==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TYZPR06MB6356.apcprd06.prod.outlook.com (2603:1096:400:41b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.13; Mon, 14 Oct
 2024 02:07:58 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8069.009; Mon, 14 Oct 2024
 02:07:58 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Peter.Yin@quantatw.com"
	<Peter.Yin@quantatw.com>, "Patrick_NC_Lin@wiwynn.com"
	<Patrick_NC_Lin@wiwynn.com>, "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
	"DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Thread-Topic: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Thread-Index: AQHbGILwQgrDNDHU9U+K+QITBzViybJ7lGGAgAn06/A=
Date: Mon, 14 Oct 2024 02:07:58 +0000
Message-ID:
 <TYZPR06MB5203FD3066CCAD07405CAAACB2442@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
 <20241007175949.GA1738291-robh@kernel.org>
In-Reply-To: <20241007175949.GA1738291-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TYZPR06MB6356:EE_
x-ms-office365-filtering-correlation-id: 5434a52d-b02c-4412-dab6-08dcebf50658
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HsvZDhnrmdd91V3DI9GuPRb6Y8MOHaZcyh/ph3AEkDaSW9LqeIlen3oJIvb9?=
 =?us-ascii?Q?Sn0czI2u5fJ7Xb36nF6qwCOgT5CkhMpV8Hbqbt4Fe5YfZel+pIz+0CbKAEGR?=
 =?us-ascii?Q?Hl9AAgMZPLShl9wF71EJQUKhkPYsZUCEHGyr9loWCTPlDXgsvwjV8ISXNKAj?=
 =?us-ascii?Q?5B7dtgRhFs4Dq1wa0rbpy6KrDrFQXZoTlyHL7tHy2cJ34edpp7a2yx0aXqgB?=
 =?us-ascii?Q?uIiXv0MPhPZbXgmkWFbkiXq70TaQNTl8cmA+ow8+7EjvwC/EKwvlxGlUEL3G?=
 =?us-ascii?Q?RpoK1WmWLvlvwPXsXGBpWfzd7s8NDhuH9x1Tgm5x5iCn+BxHJnIHTT3hWdwm?=
 =?us-ascii?Q?24fULbXCzgJ6EmYqfl5QQ2SGnzTIIAeUgQfn7n7TPI6xpJsP7K9L6Wjv9Mzs?=
 =?us-ascii?Q?Lz1dtBaoniM9y+zq0ejSaJXvrrGNmBJQ1q+GppZOGHvCdFcdz56k6gsPGH60?=
 =?us-ascii?Q?i3/6lGlGmn64yVxJvcvrKJEs9xQXbwtaCj2epfYkKnMNdXkoDE84wHxUnaT4?=
 =?us-ascii?Q?F8spvjuSJRAW6sw+DWnpivmrj2gfbf84Hqe7qqbv9JHgySVPt37KtFz93eIa?=
 =?us-ascii?Q?3D4MuR9Vqp87YvInabrhmRfUAm/zbmr9AhV7fcORCYZDd7lLdKjTZY6L692q?=
 =?us-ascii?Q?ncasxFg6QrdHwTMCfUxB06WQeeFdVthB0EMNx7aiNnJTLhGbK4B3F/hR2uPV?=
 =?us-ascii?Q?AVRKDCzX+jFMqm/9yXxc4Zrvofr+sOs8cf8JRnp2quouVYfrMLoY5z2ESZiZ?=
 =?us-ascii?Q?BQ7kv1NtXyAKI6uJ5ZMY80X9XHJsijyI+hwidteT4AxQIL11KF/YB2YSDYfb?=
 =?us-ascii?Q?ZoZbUV/tMdm6d/GaEc7J1+c56/qqPS38HeIej+xh3Dz8qDY1KpimLHbSJ578?=
 =?us-ascii?Q?3ttKYanchacaWbBCqYQDa0w9DLIDL+9omDUVnWkUAh/O39fXehqL6awocdWm?=
 =?us-ascii?Q?v4YBOIfmHl3Bg9w/f95rO/KF4YmNKjsnH4uguGpYHBVZk3eJQISgxDOqhQej?=
 =?us-ascii?Q?6RASieFynX5Q1uhSvTei/4rWg6FTiG6PGcsaNK0b208MU9QKWW+tNLYBRQ3s?=
 =?us-ascii?Q?uHDTomY1l665ebln8npWEOTTJz5vc616JEZETnVmkHTuhwPd9QKFcmvCBFSg?=
 =?us-ascii?Q?ibflt4/deSWfB2zsTTbLPR3Qw2tsZlcAZW0ZIB3EHYJtLbFbuJyWyHO6b/XX?=
 =?us-ascii?Q?0ymhfGfpyd1t7GCIlw5LczHvK3bYl+JHIvTlMwvISxT79ngc6lrrBnlY43si?=
 =?us-ascii?Q?dI9jFPV+NVu3bJsNk/tOZMd9uH8IYgd5obqILwU/9jXpqrhIvlRiPQ1SJWiv?=
 =?us-ascii?Q?1soXUFJxfq0UK/ylnGHqvlK9GiFYklJaBlu0FIEQr5mRqA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Iendq1WdrSNG/ULJ7Nniv/TVs1Q1qcdE6N12hsvor2oQgNbP64U0SYR2B2Jj?=
 =?us-ascii?Q?dyxJ0V7YfuDdiMTykEwLHS/WwOPJLkn3HT+7nES6ImLWdUwPHsHvDUNzco4/?=
 =?us-ascii?Q?42sErHydI8+MDDs5eIWaUKJshKARLN2Swf7ambljjGsgcOwaqJskfiP1tFzK?=
 =?us-ascii?Q?U5Aw86zPyuIrc5hqXq5Piv5sRYoqpiRrUoLlJRPAqF4bwZB+k+KPPsEqwmzK?=
 =?us-ascii?Q?h2V6UxtTnvIzZbl5pHVmr45PNep6pp9ifgUwV9eGm1MwoEqppF8M8Qt9Cdes?=
 =?us-ascii?Q?Xn7GZ4SKJgemKb/jDzXLIQjA1pxV3kFOdsgZRCK/q3SI3nyKhYCnnjmP5WB5?=
 =?us-ascii?Q?W71dUMIbjfc0WxHW9SQc83RRZ/yO134Jvdzl7ireC6K4NFRfIM70nVkOletp?=
 =?us-ascii?Q?1SxrHHiMx9YFsHLGwCEj1/Yv6Rf7+M/U0/HO34jKx655toNPayv6d3vALQEg?=
 =?us-ascii?Q?UHLs6WAGhoxuAcu36fSwkQsMIWrr+OlBb2a58bfZ+DrAngduWEwOx08t6JjP?=
 =?us-ascii?Q?U0GFDT9NSp6VhLPm5kWUYZJRCpEZJAlYbOUblxpPsf4aMFeeu0tcCco4xgwl?=
 =?us-ascii?Q?392VH7V9WLoO7ziP/4ewaqb4Zr1O6o/WjMZEfrFoI2jfpjsID4RGCk5dSQjT?=
 =?us-ascii?Q?MSWd7rmOTBnzSHuMfM3j/BHNd52SnDmtKmo0tKDZ9hRXJ/s7m//adGu2ysqj?=
 =?us-ascii?Q?IZZlhx12XP0cZ22XVJVZRHKxU6kwvX3QQMPNQ+pSFSpfKggbk6xU7YNCvtaY?=
 =?us-ascii?Q?dredI8A7a84e+zkXRvNvnGI0SYTn7Zy3l25vmRTh5njIdxk2K/6VvDF9Y0td?=
 =?us-ascii?Q?mlkZgbJRFVxCJVUzpaRxVNIxMWlSjCbOzzVH8dJjH1lBVHUFiRlB7igbxz0e?=
 =?us-ascii?Q?5Cn8rv4FbMF1UQBSsxXVCeuF20mlnchjmPwLMZmMjRNDptQuVBZ92yAN9ATM?=
 =?us-ascii?Q?LYghEiGe4GCtinhLUc4xE9qHbWSPaaalVv47qOmYcLTW76z0FTGj5yv8Emby?=
 =?us-ascii?Q?m+/fbKr1G2XM6D52KQju+svaCf9Mng4ZUIh7DJ4L8zjA9QRESwT6qqrG1zfI?=
 =?us-ascii?Q?GBeE/DOhYrfHi6s9p1aEdYfpNeepqFwfrJJVOYDCvx1j5lsjhoWZ8VRCjsNA?=
 =?us-ascii?Q?y9pHEnprj/b6/RDtED7nEkZ5FAZFD8PeAFymhqx0PtwO2LIuG6zdWJMD2owj?=
 =?us-ascii?Q?4gAwQZbFaK6oQrLI/sevsMaTGeud0viDay2YVlCqwk0w2uIITv7qFmZeYgpF?=
 =?us-ascii?Q?7vF3/ExXJlwG8cvWHCiABr5q6nJiZOKFbseXvzrjbMCOZVJL3Xal3cexyNuH?=
 =?us-ascii?Q?zoI4O0gUN7lhS/Yw5fXuvoSOnVENzpdssTBPoM/UcJSSzHpH2Ocx2Kga5gvx?=
 =?us-ascii?Q?q5IHGD3v8a+F/zh/rdik+rQs7RBdIfVyBwWsYq9GsJRUqCVYmj0U1ETI25gd?=
 =?us-ascii?Q?y/WVQx+KTmebTPhkxESuptBYCAlHAWeyTS1BeT7+3tfJho+3wRdQZytnEvxY?=
 =?us-ascii?Q?/TJyK6KhR8FTMTHYqQW8e3zF78bUue6IkEvMUEcsBohqgwnjRI8TJuskGWLn?=
 =?us-ascii?Q?rAum1m486KuVO93kAbouhU+jkSYcstx7pxZSMa/y0avqZO/8/OyKZh3qKKA4?=
 =?us-ascii?Q?eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5434a52d-b02c-4412-dab6-08dcebf50658
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 02:07:58.5228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FAc98kNs8oCIqXDLAuqvJWC1iQGbG8fPTYJNuwGnSrFgyIDSiHVEwdo7YZM+OaGoFtueL1aPF82N1HjP0kfQlwMCQZ39YdBoW37CE5ksdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6356

Hi Rob,

Thanks for the review.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, October 8, 2024 2:00 AM
> Subject: Re: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for =
WDT
> SW reset
>=20
> On Mon, Oct 07, 2024 at 02:34:05PM +0800, Chin-Ting Kuo wrote:
> > Add "aspeed,restart-sw" property to distinguish normal WDT reset from
> > system restart triggered by SW consciously.
> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > ---
> >  .../bindings/watchdog/aspeed,ast2400-wdt.yaml         | 11
> +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> > b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> > index be78a9865584..6cc3604c295a 100644
> > ---
> > a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.ya
> > +++ ml
> > @@ -95,6 +95,17 @@ properties:
> >        array with the first word defined using the AST2600_WDT_RESET1_*
> macros,
> >        and the second word defined using the AST2600_WDT_RESET2_*
> macros.
> >
> > +  aspeed,restart-sw:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: >
> > +      Normally, ASPEED WDT reset may occur when system hangs or
> reboot
> > +      triggered by SW consciously. However, system doesn't know whethe=
r
> the
> > +      restart is triggered by SW consciously since the reset event fla=
g is
> > +      the same as normal WDT timeout reset. With this property, SW can
> > +      restart the system immediately and directly without wait for WDT
> > +      timeout occurs. The reset event flag is also different from the
> normal
> > +      WDT reset. This property is only supported since AST2600 platfor=
m.
>=20
> Why can't this be implicit based on the ast2600 compatible string?
>=20

Yes, this property will be implicit based on the ast2600 compatible string
in the next patch series.

> Rob

Chin-Ting

