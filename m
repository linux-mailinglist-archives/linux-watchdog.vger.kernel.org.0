Return-Path: <linux-watchdog+bounces-2584-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 654FF9F3407
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Dec 2024 16:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC87F188187B
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Dec 2024 15:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9479A126C0D;
	Mon, 16 Dec 2024 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BQ2/UEXI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2ED80C0C;
	Mon, 16 Dec 2024 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361693; cv=fail; b=AbxqiXFqrCLH34lSnMnXurHxaSOzi522KtTfnDReNoNxvEX+hmDki6giyd3Wv0+XQXt7GBabO3PfSUFLfSILuzWxo8c6wUFGW7BmlHt/PV/kw01Az2z2Th8km9HCvUWzwnPQO7OlxeSHmhjWoX6Gn98rk4MikQPoQj1l8WDT1j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361693; c=relaxed/simple;
	bh=Wjsqurv8Q867F9DlrmD8y4NNJJErBhuryh5bdVUEA8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BHUhh8A+TCCJatop56FHAj4vvN1CR3F39d86FrsJFA+D+2iw5W5peFJQw5Zioe76FDn9hYHpy/5aKFf5IgEwU0xYtTituA5l5nY4y5ybN1P3dNPrRYE6MzHbmmxnIXIpo+i2+AatQBleTJAo+YrNLeyZCSYnIjknPaqN+HqlR3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BQ2/UEXI; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICpm/FdMoPkEMr9dPpr4tg4rbv6tDj2PR6G2G4ESxiltvCzvhgIuBJgklCYSX9zkKhLhIIS+HfUHMUPOYNog7MhSmw/+kOj97sNg2jKVFgcQy63wDhVou+Ybcdl38uvNDPh7UnxiQICfcgJjLcrEbVr2lKgVlOF8rrcV9lASHKqEw3AxM8Fa8dm0jjPOg/g/I2Guq0ZRp6puiK4phfObBmQOStQwC0j82UXg7bHlE7jZ8P3zNsgE1LALbMSxM+zuRwmU2v1pt841QQs9xJYMMKHcjfxefkMQCi7vr8d1xb8llU24lWI0OK3LnXJgeQ5ZOUaWDwlzM8tsbtdcXCrltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjsqurv8Q867F9DlrmD8y4NNJJErBhuryh5bdVUEA8g=;
 b=qGxZ2s9VAu60QUPlpxOAGwqcTw27o2Mn7Gux8sJuU7i+5UKn7ASTsgyBWy3+ycl8QTJz+hCJu7WndqC5G/4v9NN11EP0lFa88AVc7J+PKHQ5bWJqjtHJhHv8u6ya2WU2ulqM4oiVu3gJ+/rkJZMKE6uRKzUn33Ca+XCdMu3vH9r6+6jhqyk3qO8gvo7SlI50IR34hPHqytKquNtMg7nneUEcYWqeFTEtW21ocNJ2Akz6tCVGlkKI60MjuFuhNb9rQP+x56qW2J1o9PWVB+E6ONZYad0DutiPePZfMgRMXiiYqe9SZsGt8peIV5zkt9pwM8BYfSAcAe0gs9WO+EYSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjsqurv8Q867F9DlrmD8y4NNJJErBhuryh5bdVUEA8g=;
 b=BQ2/UEXI4oSGRHnjdK2yQ4eULospPqdWBCbUnJgR/U1GHlDtkGCJ0zDtm5+BvUHATCE6hXVt7/Eh8VxOrX9FEtZ8F2Ivv8/zRuxSjN3jK/n7BOLBsGxtyhg7W7CbRq8T9Marby9dq1xZn7iq3NNBN6qC2GugtXS6mXLzoWucseo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11667.jpnprd01.prod.outlook.com (2603:1096:604:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 15:08:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 15:08:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
Thread-Topic: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
Thread-Index:
 AQHbTYaq6u/GJ/L6eE66j97mKEiQ2bLkd4EAgAASKICAARJo0IAAqUSAgADB8LCAAdaEgIAAHeIw
Date: Mon, 16 Dec 2024 15:08:01 +0000
Message-ID:
 <TY3PR01MB11346643236A64D41150E4CC0863B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4d3e6f12-7cea-45ce-b1e2-c1fda94b92cd@roeck-us.net>
 <CA+V-a8uasq+E+_7rk+o729hRp6PwYSgTcUQYbTe44CkXfSE71A@mail.gmail.com>
 <TY3PR01MB11346774419BA8D51043C762986392@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8srdDkdAss2okuyfGYBwU5b9cF0aNw+KOSGR1wPquqNdQ@mail.gmail.com>
 <TY3PR01MB1134664B737514AEAECA960D9863A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tWFSwajUSObZstvuBfL__j4EFdtOzSYs4U-aMBacwnLg@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tWFSwajUSObZstvuBfL__j4EFdtOzSYs4U-aMBacwnLg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11667:EE_
x-ms-office365-filtering-correlation-id: a6cec0c4-a503-4876-9c4d-08dd1de36f2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?alhlbGYyTEdYYkV0bHZxbytvYTBkTGZNdjBaeW5jYThMQk9BQVFVT211UmNv?=
 =?utf-8?B?MWxmSytaZGxjcDhUYlhid21lbEM1RkxCR0w5dlhjSmczajQ2c1VGSlpLRmRt?=
 =?utf-8?B?SXlQOE1nRnZVTTMvWlBWS2lPd0pob2RMd2tlT3ROQjhaeXoweFhMeFFwblRV?=
 =?utf-8?B?VVBWa3dsQXRvYjNqT1RqeXFHQzFVZjRNQzdTQ1drRU9kSlBtd0JwQzM0WlFa?=
 =?utf-8?B?WlNodTJoWlhiT2Vac3pkMFhNeGpxL2NrMHBFMEVBbk5QOUp1NkllNFlOYnk2?=
 =?utf-8?B?a2lSSEtBUjlsdGdCOWFxakNLckNFaitzZGhGZkhsUkthcE4velgxd2dSNkV1?=
 =?utf-8?B?NVlxUU1EbERJZUdMdEMyNGRoc3RmczN3UUx4UXFqc3JncWtZMmpUY0ZRR0w3?=
 =?utf-8?B?QjVkWVpkdUZWZW9tc2k3dFFLNzBSekpaMlNuaGNGVE5tWGdoTk0wNm9MRlpl?=
 =?utf-8?B?NkFKU1pLYTA4QVNRcjNKZEszaGdRMDBKWENHNVJHZXJOSVRLSVQwM1Q1NGty?=
 =?utf-8?B?aFNWSFp5K0QzSW8xSWVBNDRUZVRXWUFjempONStXTEVUeU9PeXBRYVBuY3Nv?=
 =?utf-8?B?K3dkSEY2bVhpNlRzMjIxMmRmeGN3anFOM2hjSzRwQ1c4L1Y3TXRSRjFEUjc1?=
 =?utf-8?B?R0Z2L0poWEFUMDVKZXA4amRKd1VUOXpQaHJzbCtPMnhpeFRMWVlFWjFMYy82?=
 =?utf-8?B?cHRoRk9WRFNtenhxc3UvRnpMMzgvNndjYVpDcmRwVTdCZDQ5aTFFbXpBNmhN?=
 =?utf-8?B?MUM3Vm8zOUd2UlFOOUtRQlRtUGdxdTlFMlRtRmpnMkRBRVhoY01LaUM4c1hp?=
 =?utf-8?B?bGNLOTVvV3F6ajBNdmRnQnpkZEpVc1lSeG1saGZFZEV3b2p6SXlZRkJRSDY3?=
 =?utf-8?B?R0VpbE10dkhvaGl2S0MwYVBvUy9DakdDZ05UVVRTOUkyK0Q4eFpUc01xK2Z3?=
 =?utf-8?B?N1g5blNiR3ArbjFhdkdhaDBvTklwTVhsQmFocnVvWGdzWXhPZXcvRk1hS2Nu?=
 =?utf-8?B?K2VXN2NEalJoM2J1ZllHa04yNmc1K0ZGajBadmdzOHRSeVkxVmRxRlZkVldU?=
 =?utf-8?B?NU1SbnA1cjdLNFdXRGhQZ1REdmhMN2E0Nkx3UXBVNGVhZlV5MVQzMkdkZ2pH?=
 =?utf-8?B?OHNPc1VXNi8xNHh2eG1DZ2JOUXM2NnlJdVI4RjMwQjU5Um1KQXVCYlpsUWM0?=
 =?utf-8?B?SUlQT1hzdjVwMW05YjFuSlcza3QyRTFJcFd1TkwrRXdKNEhlUzYzRmZLVWVV?=
 =?utf-8?B?RllqTkFMZEtpTUpYcllnQzhkYng5OHF4bHBkMXZJRXUxaHA2TGx1NUh2dUdq?=
 =?utf-8?B?ZmZWeHZXc3lvTnlXZFA0N0M3TTRDd0FXZjJaZ01vZVFIcHJKOHdZYTNaNUVo?=
 =?utf-8?B?YVJOTGxzMEpYNzYzVmxrcCtoTHJ5ZVdURkRUdzAyZ2FuTFJ3dGh6THhoZGxm?=
 =?utf-8?B?Y2dnVXoyVFNMYkRQaHZjQWdTK0JxQk5DaHJhc2tKTiszaklIRFAxM0dNR1lz?=
 =?utf-8?B?ZXo1MVBRSHpiMzBnb0ZPQzcva1JLSFdST24xK3FZTFhxZ2c1endUK0dDU0Yw?=
 =?utf-8?B?dXRBSFJLWHVnT0NRUi9RYjcxZmpnRXlIMUhKM0NWaWFxTWdXa1ZkMVBjUkpw?=
 =?utf-8?B?YjV1aTAxeWFjNXBNWll3WmFDdTRyWTJrL0NSbUxVdDJ3d1hmNHdqTS9sQVFm?=
 =?utf-8?B?Z0d0ZlZtbUJrSC9mSG8xT3JPeHpLeEVaalhNdkgwTC9IMHd3ZThBSU1RWkcw?=
 =?utf-8?B?VWVjYTZXNnh6aFZtSmp2WUhDV1BTV3dxcFlpR1hIcE1jZi9ld0ZNdXRlclVQ?=
 =?utf-8?B?aFptUW1mcmlhalRMbXJxTWJWUkR2ZUp2R0xGTEhKd21ORVN4OHBkcm9lT1hC?=
 =?utf-8?B?MnB4RVhVQ1gxTk00YjM0OEZBUVk1RzZZT3h0VVNhY0tUcDNhb2gyVEs4RENP?=
 =?utf-8?B?NFV6YjFvZjBWbXhwYmVlSU05MFduMGE3bW1hTWFwNHFxMk5xU2dRbXhHdXV1?=
 =?utf-8?B?QVJEbzZhUVV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajRLK24yQVE4SGxvMVhDMVZpRjJpUFhLOE11WlVrTzBUdjNoZlAzOGlEcXZh?=
 =?utf-8?B?bTNpRUx0a2g1dlNSUlJ3MjRWbWxBNjVCc3p0TmRCWDMxdi9Mb3BnZEdxRmtt?=
 =?utf-8?B?M3lXYU1qQW1kenVrcW9tQy9mSFhWN3lJSlBmc0VWMG9xc2NxUWRFN0hIbjUr?=
 =?utf-8?B?R20zUkJXOUJPbU5tYzU1TGdmcEJlWWVxNFdJczIxRmQ1VmJFWXJ6SWR5Zm93?=
 =?utf-8?B?OTJMRkg0SzlZVkY2Z0Q3NU1zMzRmZVBFTTVlOW1VVnFOTnc0cHYxanhxblJt?=
 =?utf-8?B?cnlDdHhJZFk0V2pwK20zc0d0QytTNjJoL2NXZ01Ga280amgzeVEwSlB3VENn?=
 =?utf-8?B?ampWTTlQVDFyNjJkMmJmNmJrdlphekhwR044TEdOdWVkWTdvaDdiTHc3ZGFC?=
 =?utf-8?B?NnZySHhISHRJdkN3V2dLdWNhSTFFOEkzRjlJclF1UG81Q2VRdEFiVnpJOFBW?=
 =?utf-8?B?d2kxZ2NwMjVOVVBwaEtjclNpeEF0RDJwVGpaZVdaQThLdCsrbDhVenNVK3lx?=
 =?utf-8?B?Zks1SXRNTzI1RTVOM3czcTBMTCs1eHdORjltVFVGMWZ3OVRhSVdaQnV0NXky?=
 =?utf-8?B?MEttNEV4ZG1FUEJQNEZKVXFZekRzdStFbGZVajFKMUJ2NGhZcEJ4ZmNJNFI5?=
 =?utf-8?B?T2NpUkRnbDVkYlZJM05kaEdzQkFORG9XNUt5M3U3N2dGOU1RSkJma3dDUlIx?=
 =?utf-8?B?V2o4NExkTEpxZ1hLWVZUWUlVb29mcDVFUGU3eVcvMUhOVFZLMnROSVJvWEZj?=
 =?utf-8?B?Mm5JUE43VFoxc0swOXlUVkFIS3ppUUw5QlpjMzBwejlTNk1iVDdBWERvMEZD?=
 =?utf-8?B?dWZOalpwVSt1anNINk00WUx4UDRZQ3drZkJMYlJQY2JNZWN1cktacHJMSCta?=
 =?utf-8?B?UmFMeTJiNDE3aExIcmo4S2F3WjNEdUpvdGtzMEVkUDRXYmppR2E1TzJ4TFhj?=
 =?utf-8?B?ZDV4ZGh4SjR6SXluNEN4KytUVjZZQmxkdmp2ZWhSOTRQMDBGT3ZaTERSdmUr?=
 =?utf-8?B?QU9VQ29maldpODF4KytRelZSVEsra0FXUW81Nm1uOUZidE5sazlxVVM2V0ZF?=
 =?utf-8?B?Q0JHaDY2eDY4SWhkQUtBbEU1YmYvVjZ5bTdnQWtmS1BKSTR2Wnd5ckxzMDZY?=
 =?utf-8?B?dStMRFl2by9lMWpqSDNWU3Bac0tyZE16MXRSL2pNckFSRGtwdmFNZlZ4QWxB?=
 =?utf-8?B?eXk0b0F5S0w3ZndMU1pTNG1LakE0Z0cycVQ2RGFBazcxRWZNdGo3R2xtMThK?=
 =?utf-8?B?amU3NUV0UDB2RW9pdFJiT2o5enk3LzlNUE1BVS8ycERIVStETGEzZHF0dG4r?=
 =?utf-8?B?N2pkakVhU21WblNrM3JNNGNaSGlaS0lTVVdic0FGY21aRFRLWkRoTXZCY3dO?=
 =?utf-8?B?WmlGbVNYUGtRZG1GU09mbDlQbmRmQXZjbEVESUtsODUzckpuZjFBTERYaGY0?=
 =?utf-8?B?Z0RKcmQxKytmWVRkdzJ5VDJKZzhxeE5sZ2ZXZUNNL1JrY2xnbGI2eDZBYS9F?=
 =?utf-8?B?YUFsV3Nwd04vN1dCYjQ0dCszQ0xLVFNXN2JSVHYvOWhCWVo4TXRrZ1BlM2JU?=
 =?utf-8?B?R09Ib2crbnhVOGlkUWVTVTRoRnhjNnFTeFU5QmRMcmp2YnBSa2o4NjVoMWVV?=
 =?utf-8?B?ZUJyazlpOWZMNGo1czRENXF3cmVpWHRXN2xQNFNReWhpK3V2K2tmajQ0VlA0?=
 =?utf-8?B?Z2s3cENnZEJDaTJHaS95TFY2Y0szT2VCYTc4WW1mRVBHdVFqT29kRmpUcXpF?=
 =?utf-8?B?TDJFNWJSWlhVYlUwbnlOa3ZiWFFpRmh0NXQrSnNTZi9GNXZkcnJmalhFaWpy?=
 =?utf-8?B?d05rQzFwWGR2a1BmdGQxQWluVGIreUd5dUxDa0pFbENBU2d3ZW9nWDBITFcr?=
 =?utf-8?B?dlVHYjVIbktXQ3hLZ0pyRE1rajdUUHRSSExUQWlDai9sZURBWFhTYmVxbndU?=
 =?utf-8?B?NzcwSUJIcDdWVDI4WEMxWlo5VmZ6OFpBNGMrajVHTjR2ejhLdjJHaW5xZ05n?=
 =?utf-8?B?WG9FQytPS1NWVjZQU1J2Q1lKc24vTjVlZzZkb2llL3E3UW9USXFmZHM1RkZL?=
 =?utf-8?B?a0oybG00SDIvM0pRdlJHSEh1K21pL3pOdTBjc1p5cmF1bTlFSFBZZmJxemNX?=
 =?utf-8?B?NWVxT3NIKzNvMTFBM1A1dy91TU5Bd3NnNXY5WGR3NHR0d1RnNnp6eHZWZTRs?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cec0c4-a503-4876-9c4d-08dd1de36f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 15:08:01.6510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tixDqkYtd7VQFC6igIqrAsK8yin4xDQnADmGP3+biqw5fdMf3GHQGA8hmD7MiO9WOTD28RVGeJ4vfnzVjI8RXnC/x3nn8Vi/EvOvvH0M5U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11667

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMTYgRGVj
ZW1iZXIgMjAyNCAxMzoxNA0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSF0gd2F0Y2hkb2c6IHJ6
djJoX3dkdDogQWRkIHN1cHBvcnQgdG8gcmV0cmlldmUgdGhlIGJvb3RzdGF0dXMgaW5mb3JtYXRp
b24NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4sIERlYyAxNSwgMjAyNCBhdCA5OjE14oCv
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+
IEhpIFByYWJoYWthciwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4g
PiA+IFNlbnQ6IDE0IERlY2VtYmVyIDIwMjQgMjE6MzYNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUkZD
IFBBVENIXSB3YXRjaGRvZzogcnp2Mmhfd2R0OiBBZGQgc3VwcG9ydCB0bw0KPiA+ID4gcmV0cmll
dmUgdGhlIGJvb3RzdGF0dXMgaW5mb3JtYXRpb24NCj4gPiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+
ID4NCj4gPiA+IE9uIFNhdCwgRGVjIDE0LCAyMDI0IGF0IDExOjMy4oCvQU0gQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gSGkgTGFk
LCBQcmFiaGFrYXIsDQo+ID4gPiA+DQo+ID4gPiA8c25pcD4NCj4gPiA+ID4gPiA+IFRoYXQgaXMg
YSBjaGFuZ2UgaW4gYmVoYXZpb3IuIFVwIHRvIG5vdyB0aGUgc3lzY29uIHBoYW5kbGUgZGlkDQo+
ID4gPiA+ID4gPiBub3QgaGF2ZSB0byBleGlzdCBmb3IgdGhlIGRyaXZlciB0byB3b3JrLiBJcyBp
dCBndWFyYW50ZWVkIHRvDQo+ID4gPiA+ID4gPiBub3QgcmVzdWx0IGluIHJlZ3Jlc3Npb25zIG9u
IHN5c3RlbXMgd2hlcmUgaXQgZG9lc24ndCA/IEFsc28sDQo+ID4gPiA+ID4gPiBpcyB0aGlzIGRv
Y3VtZW50ZWQgPyBJIGRvbid0IHNlZW0gdG8gYmUgYWJsZSB0bw0KPiA+ID4gPiA+IGZpbmQgaXQu
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+IEFncmVlZC4gSSB3aWxsIGFkZCBhIGZhbGxiYWNrIG1l
Y2hhbmlzbSB0byBoYW5kbGUgY2FzZXMgd2hlcmUNCj4gPiA+ID4gPiB0aGUgc3lzY29uIHByb3Bl
cnR5IGlzIG5vdCBwcmVzZW50IGluIHRoZSBXRFQgbm9kZS4gVGhpcyB3aWxsDQo+ID4gPiA+ID4g
ZW5zdXJlIG5vIHJlZ3Jlc3Npb25zIG9jY3VyLCBhbmQgdGhlIGJvb3RzdGF0dXMgd2lsbCBzaW1w
bHkgYmUNCj4gPiA+ID4gPiBzZXQgdG8gMCBpbiBzdWNoIHNjZW5hcmlvcy4gQXMgbWVudGlvbmVk
IGluIHRoZSBwYXRjaCBjb21tZW50cywNCj4gPiA+ID4gPiBJIGhhdmUgbm90IHlldCBzdWJtaXR0
ZWQgdGhlIERUIGJpbmRpbmcgY2hhbmdlcyBiZWNhdXNlIEkgd2FudGVkDQo+ID4gPiA+ID4gZmVl
ZGJhY2sgb24gdGhlIHN5c2NvbiBhcHByb2FjaC4gVGhlIG5ldyBSWiBTb0NzDQo+ID4gPiBoYXZl
IHJlZ2lzdGVycyBzY2F0dGVyZWQgYWNyb3NzIHZhcmlvdXMgbG9jYXRpb25zLCBhbmQgSSB3YXMN
Cj4gPiA+IGV4cGxvcmluZyBpZiB0aGVyZSBtaWdodCBiZSBhIGJldHRlciB3YXkgdG8gaGFuZGxl
IHRoaXMuDQo+ID4gPiA+DQo+ID4gPiA+IFNlZSwgc3lzY29uIGNvbXBhdGlibGUgbm90IG5lZWRl
ZCB3aXRoIFsxXQ0KPiA+ID4gPg0KPiA+ID4gPiBbMV0NCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjQxMjExLXN5c2Nvbi1maXhlcy12MS0zLWI1YWM4YzIxOWU5DQo+ID4g
PiA+IDZAa2UNCj4gPiA+ID4gcm5lbC5vcmcvDQo+ID4gPiA+DQo+ID4gPiBBcyBwZXIgbXkgdW5k
ZXJzdGFuZGluZywgYHN5c2NvbmAgY29tcGF0aWJsZSBpcyByZXF1aXJlZCBpbiB0aGlzDQo+ID4g
PiBjYXNlIGJlY2F1c2UgdGhlIENQRyBkcml2ZXIgZG9lcyBub3QgcmVnaXN0ZXIgYSByZWdtYXAu
IFdpdGggdGhlDQo+ID4gPiBwYXRjaCBbMV0gKGxpbmtlZCBhYm92ZSksIHRoaXMgYXBwbGllcyB0
byBkcml2ZXJzIHRoYXQgcmVnaXN0ZXIgYSBzeXNjb24gcmVnbWFwLCB3aGVyZSB0aGUNCj4gY29y
cmVzcG9uZGluZyBEVCBub2RlIGRvZXMgbm90IG5lY2Vzc2FyaWx5IG5lZWQgYSBgc3lzY29uYCBj
b21wYXRpYmxlLg0KPiA+DQo+ID4gSSBndWVzcyB5b3UgY2FuIHVzZSAic3lzY29uX25vZGVfdG9f
cmVnbWFwIiBmb3IgdGhhdCBhcw0KPiA+IG9mX3N5c2Nvbl9yZWdpc3Rlcl9yZWdtYXAoKSBpcyBm
b3IgZXh0ZXJuYWxseSBjcmVhdGVkIHJlZ21hcHM/Pw0KPiA+DQo+IE5vLCBpdCBkb2Vzbid0IHdv
cmsgZWl0aGVyOyB0aGUgQ1BHIG5vZGUgYmxvY2sgbmVlZHMgdG8gaGF2ZSBgc3lzY29uYCBjb21w
YXRpYmxlIHdoZW4geW91IGFyZSB1c2luZw0KPiBzeXNjb25fbm9kZV90b19yZWdtYXAvc3lzY29u
X3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZS4gU2VlIHBhdGNoIFswXSBpbiBgZGV2aWNlX25vZGVf
Z2V0X3JlZ21hcCgpYCB0aGUNCj4gYG9mX3N5c2Nvbl9yZWdpc3RlcigpYCBpcyBvbmx5IGNhbGxl
ZCB3aGVuIGl0IGhhcyBhIGBzeXNjb25gIGNvbXBhdGlibGUgb3IgZWxzZSBgLUVJTlZBTGAgaXMg
cmV0dXJuZWQuDQo+IA0KPiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMjEx
LXN5c2Nvbi1maXhlcy12MS0zLWI1YWM4YzIxOWU5NkBrZXJuZWwub3JnLw0KDQpOb3Qgc3VyZSB0
aGUgcGF0Y2ggc2VyaWVzLCBpbnRlbnRpb24gaXMgdG8gc3VwcG9ydCBvbmx5IGV4dGVybmFsIHJl
Z21hcCANCmZvciB0aG9zZSB3aG8gZG9lcyBub3QgaGF2ZSAic3lzY29uIiBjb21wYXRpYmxlPz8N
Cg0KSSB0aG91Z2h0IHRoZSBpbnRlbnRpb24gd2FzLCB3aXRob3V0ICJzeXNjb24iIGNvbXBhdGli
bGUsIHN0aWxsIGl0IGNyZWF0ZXMgaW50ZXJuYWwgcmVnbWFwLA0KYmFzZWQgb24gcmVnIHByb3Bl
cnR5IG9mIHRoZSBzeXN0ZW0gY29udHJvbGxlciBkZXZpY2Ugbm9kZS4NCg0KQ2hlZXJzLA0KQmlq
dQ0K

