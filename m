Return-Path: <linux-watchdog+bounces-2425-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFAA9BFDA6
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 06:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 047F82838C0
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 05:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24831373;
	Thu,  7 Nov 2024 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="ff8rZfhA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023109.outbound.protection.outlook.com [40.107.44.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A34410F9;
	Thu,  7 Nov 2024 05:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957698; cv=fail; b=Gw7bGRxHF1QADYRx6B2hfows2Bg0unpeNZrvd0aKt4acu+BLOPgINxBHOqlSFNfvHSHNKroMrAFKtIGu++KzoALxGDjdjILAlPWaEAh+6hXdBZHWSFZT3UrtSyqOpsXzMEAxb8f4MIACX15+JTuK28fSHBUTQOdQ1e0n0cnH2Jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957698; c=relaxed/simple;
	bh=0EeWn/M/Miju6Z1AhZqitWQbWxweGubI2FdFTjSPi34=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tHKZhCv/G61dobPJ5r1HKo/St4LRRRtK/j+L0Yd/2Mptm44g7BnybA737xBq3P3zXZzxpo6TwOVXen1KWuA0LGyG3/xN4plIo52eSjMakWnheFFMfASqYxqtI4+CGDdGPaL8tl+e7WCa1Z29ZuWUE71FMsf+LoruPIw6X77rQWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=ff8rZfhA; arc=fail smtp.client-ip=40.107.44.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1KVAgs7h+Gg+vCh/0N8tyMy9eeveRFxsRP8hHkg2LJ5LFX7W7sRfz6Kh1JFPQE1RDkgaoKXoK5NpKDmVSRkD0YdXks5N4x40YpT7XjUfmNXE185Un64AHBxq//a/65h6F/ZGBYGva5bv4zmGweDwvfR61vWFUsEn3G97U5rF9cGpoQktOQiQs/VOyTAnwZANI2gaLz6OKtBVgjvmzdkGqPjDkF+53c+X9tWEfrcK7Rx4EyW16xMOosusaqelid+MLlBM/WGSs76ORjqD3aZc8RHnh+hOJ6W2TATF2Cm0dd05MRKhPWdMZewBw8+qDR8hsFfx2GV4mXyua9lRBzV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toF9EjNYE9Oaua3AvOkVvNCOdKXRYgbT57PY7LZ58d0=;
 b=v7Z9OmNINbRft6P6zcNRL2hhr4SybLrS3SvK9B3SHC9j2yvy2HredmExVJJMFiz/XqGumYTBBX4A6yH0/rsZYD3wD729jFUa5/Ec3bslUiAhQgfZDTlx53wv4Ykd7eOJSySK1Mq5A3k6X9n1xDqn6Y/BacS49QnumpdWltWoxOpK+aGuPdlqadDgye7pZRVVCLw8gKvB3JfXa16I1a5aIXUzI8xizzRHFKnX/lU89np1sc90hQ4WtEWXwXblAC4NHlXhZGvugHhisWxwhd/kQfE0Z0cTtXPK9usgcJryPgglnXsIjWNq/2aDMEy7ZVQOqT8gP1S0EyDU5QG+mCZdsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toF9EjNYE9Oaua3AvOkVvNCOdKXRYgbT57PY7LZ58d0=;
 b=ff8rZfhAmosUYhrfchrkuoxZj1kf+4yb510FYJ+RZC9Et/xqZLnrZqABZOseP94L0QqNZe9YI6Fv5CBl6YeKnQhjOTVTRJdwV73DOq8lTDGW1E1vFEaJY5ntqOUnH9IepHTpRXGRAFpk5OFEhhdpu9A8XPocLj7Y2YaPaaWR9m/d6X7AhMgkr7KY981KMn1OZGQW0PkJYQV3M8KrqfIQxyVI8qDN9HVdcrTjTJB8YO4G5+0P981VeNadJ1KyDPCe2mxs9XxW086tmahPi6HOAzgL/2ZtwDcmFPsOfi+PHk6E6xPwMHq2INCTkwHzVOSUgT8dlv8Q3htwTwOftoNE3A==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by JH0PR06MB6319.apcprd06.prod.outlook.com (2603:1096:990:b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 05:34:50 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8137.014; Thu, 7 Nov 2024
 05:34:50 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Patrick Williams <patrick@stwcx.xyz>
CC: "joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "Peter.Yin@quantatw.com"
	<Peter.Yin@quantatw.com>, "Patrick_NC_Lin@wiwynn.com"
	<Patrick_NC_Lin@wiwynn.com>, "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
	"DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, BMC-SW
	<BMC-SW@aspeedtech.com>, "chnguyen@amperecomputing.com"
	<chnguyen@amperecomputing.com>
Subject: RE: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
Thread-Topic: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
Thread-Index: AQHbLFdFSiy5MyUwCUe0YBcXjsWUGrKivQQAgAhvEgA=
Date: Thu, 7 Nov 2024 05:34:50 +0000
Message-ID:
 <TYZPR06MB520328BE1AEE561EB54F0A53B25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|JH0PR06MB6319:EE_
x-ms-office365-filtering-correlation-id: 8ebb15e6-bc52-4fd8-698b-08dcfeede626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oYa5bGKJBU+xXLn3XxQZ7JpyOxJg5B7D12E8OpTkzhARRIxFU+RK6HPNWswT?=
 =?us-ascii?Q?SuUEyZpJqMzR1xyBHK4XdmzNDtjbK46QDMibOW54583xlfFgnJGvKoPOzEUT?=
 =?us-ascii?Q?dJIAdaM/1aaEkV7fc0jv8qS4J/p8MQZVO/lyJcSRvQtziZ/6R2XMcoENTBSa?=
 =?us-ascii?Q?YMD9CcnCLg52ChuIK4jzz6peUrcJP2jhhoBU8jM6h6IUdo94aPdBjSSvO+5X?=
 =?us-ascii?Q?8nwKEQUm4pNog6i33bQjJ/gz1qGiW/tnsUSKxtaCiyBH7quIGaC2SGa2qzc8?=
 =?us-ascii?Q?yQUMwg+Ic5qREQlqI2rmHr8Hr+/nMRDyXSuOrVp13kUwfFpXsxSGyDf47+63?=
 =?us-ascii?Q?Zmqs0pzqyRAOVOb3PMiJ7CCUmeFeik+oSXm26HzWgPp+x/uS7ApqPRHtP4wE?=
 =?us-ascii?Q?1uEw0yMlQmIsPM4xzUxsVczPQ4iUx5ZxQDYx6V1PTblF4u37pXrSVt0i4B2F?=
 =?us-ascii?Q?NccZkNtpwzlmY1rxuSJ/5Us/w0966GU04AMzLFKrm+h0Eusfu/9XdffelpAq?=
 =?us-ascii?Q?uzQ4g+VYNsaAu63Zsl/S8W5mHZUdW22IyYYpOpZYQQBsswdaI1BQ6fGK9sAm?=
 =?us-ascii?Q?YBakxCluCCcl4wTfBuzOUI0Nzo+QVMsn1DdDnkQQKkfo3cQfBxTSfI00LWSs?=
 =?us-ascii?Q?SJ1HffT0kQWczt7Cbbgo4Psl4SwOxVJ7ezSu1EIhNQIvN10oFle3MmMqqqmg?=
 =?us-ascii?Q?n2MRagYgWnHKeI/dhnCdZLK7B2cxSaf7myKTZ9qzhLIa3IUY716mb9xpFUjL?=
 =?us-ascii?Q?m4luiA8OYZdCAiAAUswr3ulyxO/KO3xWUVv+4zBNmcupv/VL5KzKOAJoYgr1?=
 =?us-ascii?Q?zIebZajfqAxCf6ePyqp1Ylo5kEqDO6Dm9IE5K/yTb8BLaJxTuVYfLc9lx43Z?=
 =?us-ascii?Q?A1ouuyXzjldZEOpd9C0H8k4vvQfbWi/EmwgYyzEhhMwHPFVAUPiWGEseMTer?=
 =?us-ascii?Q?wLjXXSE/M0nXbdaQNoDKH+/dy+CCPe9xdiNuYxFwx1lzaiPlyaXcuUEf8KEK?=
 =?us-ascii?Q?A34y/hqGjyQGmnXcqBPUeA1jYx7WGX/Xcy+FLB0RcjEYvDUXWQl7Yg6Iee6v?=
 =?us-ascii?Q?+V4DUJaonO2cqEnpLPl9CK3tvreCnwonWNCDZ3bYQieFgGc4krHRcuhMVJya?=
 =?us-ascii?Q?g7N0T8Im+qvMIpx4PLJjFYXIerW77ZccoeWrCZu7eR3wgKlsrH2XgSExKiKY?=
 =?us-ascii?Q?S+ktw2LL+A9H9SznMINiGsui/Yck8FKLGsNHuqoUOhjgMR+61gd8SWdO9e1Q?=
 =?us-ascii?Q?Y8m9+vfLrC4D+dYn4Y0JxlmKISowCg1SPYn6C2L1fhD8IPq1BYj2UUxDWCuA?=
 =?us-ascii?Q?onhv2Xo+XCRVtv8X1z9mmqlr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?n7qhKhdRL1JswDEDqqYGCUEdfHw21GKOe5w79Uza3LYExeE7IKFQIV9ijk4D?=
 =?us-ascii?Q?MbbNijsTCv7tUYkDVlw0b+J/fl5C5MF1uK4tDV92qY9KFdRA5ntGziun1bS2?=
 =?us-ascii?Q?IEy9yysh93ROZ80KXBxb1BTuE11BxJ/4J6KPVd5JU/0kM+m6V53LDvhHpYOK?=
 =?us-ascii?Q?xH2BK/VAOkQWc4KO1f6GvnOYYHLoXPKYMOESOu6pDMLtjd7tynqTqR3Xe5PZ?=
 =?us-ascii?Q?qo1EuS8hHPQ4UEf2o5tgRm2GQ5+cmjtRI1Pbi0gp18Gykvj6iGNloLAqKmVz?=
 =?us-ascii?Q?/WKxsZkhXc74mwlAtEyIIeVehM7QRI9Tvsl+N5tI/3LYUNtYASLkPxIUP4qO?=
 =?us-ascii?Q?a3WYUhJnoYAcFGJFJ1+oaQXAugHbnSyIPLH3FYwTfRNUCbIOVqOPTnQqjSTr?=
 =?us-ascii?Q?voPA5mLux5rrbeP3Q7xf33yZKk1sWtVvNao6PxbETxWbQJDTwL6L68PzOawh?=
 =?us-ascii?Q?PeTmhC2LHLv7cNByzS5fm6IurNrptEq+Zna/Mzmsmtdv0elEpn+VszCmCf3b?=
 =?us-ascii?Q?9D+1JC84QJzVi48yYlj6JtBwH2mGLAECMGkuRbmznDTdoH6BKj8ZVaMLe7kh?=
 =?us-ascii?Q?2eb8VNgp3JpD4vXCq4QFf9Scgx0v9XXOxXzSrY5hTvalTNK3nw/fQA0uMFNG?=
 =?us-ascii?Q?5pu/TrmobRTd5SxSzFrIVab74or6zoS5bfrckPmrSVoYT1VQrAjqjjO201LS?=
 =?us-ascii?Q?KcqIg6T4nDHOreNUegD7fLDpFxr1kpkAid37JWBDHor5mO/fNSd8+Ps1m2WO?=
 =?us-ascii?Q?Trmtqin/57+jz1aDqmcNdkatvrf0M8sK7QsmFCn8l5wuFuXgbpNUFCrIab9T?=
 =?us-ascii?Q?Mio6zu/mejVWz7mCHIKJM9dX0hJcSwp7mCmHLIvr+usjrrY3gO2rflibnOX1?=
 =?us-ascii?Q?ld+7sD1lcwC1mLfGof7uIh70VNdzO5a25S7XvDYoE3SrngjNDyJzPylejPwU?=
 =?us-ascii?Q?MnWD3WdsminAU3fg7lYvcqj9OlIoI88AsZ5QxVVkTzjB7jKUsQ5agQzoLzSK?=
 =?us-ascii?Q?nS+OL34doNrATKISZTGWRkG+bRR1AxuTSV9FuezM1DgSCoA1qv6EJqW9TGBn?=
 =?us-ascii?Q?U5AT/jPxlBieJsBr8he6VHrza0Zbo4x/inbuY+CkYkn6xAAey6mW9CqxR8NA?=
 =?us-ascii?Q?9YkPiznzBSXgFExc0F1gtet4bT7uyF7H5dk5XsZi/arCokNGBkUaACNr5jlj?=
 =?us-ascii?Q?AdNYammHldGGkqTs07b9zqRaqItYAu+/TNIoi5CfENMe6loAWHHwlouFgQ5+?=
 =?us-ascii?Q?pRCKr9AVkqtOTvbg2U7aT3PRpePYQjBSgldcHjNN/5y1hOp7pU06FAfS2Tg/?=
 =?us-ascii?Q?tuVhskE6Uyf2yNYedzN58RAzFEiaEHJgRMeqSfoPEV5oG7LUqP0Ze+GVGmfb?=
 =?us-ascii?Q?KyM/KJRqHtwBlOfWyTT7CKFZz90KGHKp3p0tU7Hy30ptyno+Ne+gl34F+i+A?=
 =?us-ascii?Q?Gr+fpIHeunwAQmX6M5sOfvMub71RfeW6Epa/H/O53MGEda+VYce4D6Bokz1v?=
 =?us-ascii?Q?p9u++MXEdB3umZozZjcUmkdfxvuryJZiXKpiOIFfPdkv67b0AXmJmpFoKg2a?=
 =?us-ascii?Q?l/SipmPXjXJdctMOsfVYmrZn+R/X9dV4bQBoxjTdYN2FYXsMcw43+afJh1wn?=
 =?us-ascii?Q?5g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebb15e6-bc52-4fd8-698b-08dcfeede626
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 05:34:50.1545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JlkrR+C86BhUgB8oNmdXQ50wDLKiS+685Kqulo8Ug3OZRm7VPYl4xDcCnTLurV1wWDyjPLAi2GPhglD8u5g9d/ENJV4TlQyNIY3THSGN6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6319

Hi Patrick,

Thanks for the check and reply.
=09
> -----Original Message-----
> From: Patrick Williams <patrick@stwcx.xyz>
> Sent: Saturday, November 2, 2024 2:21 AM
> Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
>=20
> On Fri, Nov 01, 2024 at 08:11:59PM +0800, Chin-Ting Kuo wrote:
> > The boot status mapping rule follows the latest design guide from the
> > OpenBMC shown as below.
> >
> https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-up
> date.md#proposed-design
> > - WDIOF_EXTERN1   =3D> system is reset by Software
> > - WDIOF_CARDRESET =3D> system is reset by WDT SoC reset
> > - Others          =3D> other reset events, e.g., power on reset.
>=20
> I'm quite surprised that the above is relevant for a kernel driver at all=
.  Isn't
> "EXTERN1" a name of a real watchdog signal from your hardware (my
> recollection is that there are 2 external watchdogs).  I think the point =
of this
> referenced design document was that most users of BMCs have "EXTERN1"
> used a for software reset conditions.
> `CARDRESET` should be representing resets by the watchdog itself.
>=20

ASPEED WDT controller is able to generate an external signal, wdt_ext, when=
 the
WDT timeout occurs. However, after system is rebooted, WDT controller doesn=
't
know whether wdt_ext signal is generated previously. Moreover, whether BMC =
is
reset due to this wdt_ext signal depends on the HW board design. On some bo=
ards,
wdt_ext can affect EXTRST#, BMC external reset signal, indirectly. For this=
 scenario,
EXTERN1 can be classified to wdt_ext. On the other boards, wdt_ext just rep=
resents
WDT timeout event for specific tasks. Thus, EXTERN1 boot status can be igno=
red in
ASPEED WDT driver and just implement "CARDRESET" and "others" since EXTERN1
is not always affected/controlled by WDT controller directly. Or, an additi=
onal
property in dts can be added to distinguish whether the EXTRST# reset event=
 is
triggered by wdt_ext signal.

> The purpose of this design proposal was not to require very specific chan=
ges to
> individual watchdog drivers, but to align the userspace use with the best
> practices already from other watchdog drivers.  I don't think the kernel =
driver
> should be bending to match a particular userspace implementation; you sho=
uld
> be exposing the information available to your hardware.
>=20

Agree.

> Having said that, it was known that there would need to be changes to the
> driver because some of these conditions were not adequately exposed at al=
l.
> I'm just still surprised that we're needing to reference that document as=
 part of
> these changes.
>=20

Yes, if only "CARDRESET" and "others" types are taken into consideration, s=
ome
patches are still needed to complete the boot status mechanism in ASPEED
WDT driver.

> >
> > On ASPEED platform, the boot status is recorded in the SCU registers.
> > - AST2400: Only a bit represents for any WDT reset.
> > - AST2500: The reset triggered by different WDT controllers can be
> >            distinguished by different SCU bits. But, WDIOF_EXTERN1 or
> >            WDIOF_CARDRESET still cannot be identified due to
> >            HW limitation.
> > - AST2600: Different from AST2500, additional HW bits are added for
> >            distinguishing WDIOF_EXTERN1 and WDIOF_CARDRESET.
>=20
> --
> Patrick Williams


Chin-Ting

