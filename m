Return-Path: <linux-watchdog+bounces-2573-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C659F1E43
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 12:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71386161C1B
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C58187FE4;
	Sat, 14 Dec 2024 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hn3Bwv2P"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B116DEB3;
	Sat, 14 Dec 2024 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734175949; cv=fail; b=TY966Pzr2W2t2mozDRolvIYQyN9es/IL81rwNUA/WwYZREGOIvyoIpDXhR1MNl20JhPIOQp5owWGozx7EykIvICNz9apUaMR6k29idlNK+h0M++1nGKh+UpelxTVjKn023jvL5wnvqFGJ5V9jPH5cKq/woOscC8vPWhLtyyvXvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734175949; c=relaxed/simple;
	bh=6FlF+bkkhzCIcV/y4Y2ikmZvDyyQVG3JtAvjBzCWmNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h7E5mVZyJd/TiNo0wN0P7hMh/50KkbQmbwPjpqo1IEbEEwNFFUFWeOkWWYfmg5DNS92hPOtvzPhcnyZyisQj0Z7AgOqw9qjnyUYuAFMcpdjOo+C1Lo7urJ88H+mXzQlFnvGW5Nvfi5Jdxjfa85EfjD5gED8EbdlwMR9HzIS62UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hn3Bwv2P; arc=fail smtp.client-ip=52.101.229.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHV5eu+pIhMf27pOn9uYBD/YyQvEGNGXRtAVU43KVEguudraXyRzZQ4ptK4Lvnpis3yPE2c9hR8lf8Ep1xOSKqsaZ/PDLej1nuBjbjGKlFkUOpHzB9NFgwjpa2bDlnHzjEZQNikXZbJX8iovms0IcaqC6D7CzbQqIB+uWELWizl2aXEwV/0IXvnL8z3M+OnROftmiPUMPg5v5dHEYS7rXtArUL2c5+xZBgbuoTF+1xcHAJQ5LvbQnZt3i0o3xtfusAppOjoWbSJfsEPbydai4BSXxr1FM3o7WSc2h2eV3uhhw02LEZpfaD1c71Lkm348ZRyFNgD9ODHAvnya03Ap4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FlF+bkkhzCIcV/y4Y2ikmZvDyyQVG3JtAvjBzCWmNE=;
 b=oYbL2kuUmFR8GwJGPR3kT1Od2vlR6Lpu+HllWphDfGcmtksjeEVIh1wJ6fCtYhK+iqlLfqwP6DZljxY+3G8mwvJfsRj6BXxLqX3Apemzgzod0hp+LXHCxNMyJxPfNI5jGHfMijq6FTqkoAJAEgfNb7y6tv9s5BKbxJYW2oqegTffrZ5z8RsDQON7VIZUulypfOJITfpk6i+mBqYzSPIODy5qBNZYN6JFkZ5uMVl/SjAFYH3BD1UqrhNBrvDjkBcq8UnV6fVyGM9IgzYBj5MwL6y7Voblb5l0lz5nA+26/i26zXQUlYBpRQvGpiPZmXZTVlH4sHu59KvG5bXpzZ60mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FlF+bkkhzCIcV/y4Y2ikmZvDyyQVG3JtAvjBzCWmNE=;
 b=hn3Bwv2P0YtjGF/J9DT58umhK8EYYe56KXHZwom48KTliKGqIJAbHUcMcamT8Mdlzar2bGiLdhl2kTPSm5zhd1D/zOSZXIHE9SbqFN9BKWZMrftmd1R5ZBGbahCQ0eYcwkxVzPTHNudaroYDNIR27OZ45UiHzfiKAdcXs7gqpQ4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6123.jpnprd01.prod.outlook.com (2603:1096:402:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Sat, 14 Dec
 2024 11:32:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Sat, 14 Dec 2024
 11:32:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Guenter Roeck
	<linux@roeck-us.net>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
Thread-Topic: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
Thread-Index: AQHbTYaq6u/GJ/L6eE66j97mKEiQ2bLkd4EAgAASKICAARJo0A==
Date: Sat, 14 Dec 2024 11:32:17 +0000
Message-ID:
 <TY3PR01MB11346774419BA8D51043C762986392@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4d3e6f12-7cea-45ce-b1e2-c1fda94b92cd@roeck-us.net>
 <CA+V-a8uasq+E+_7rk+o729hRp6PwYSgTcUQYbTe44CkXfSE71A@mail.gmail.com>
In-Reply-To:
 <CA+V-a8uasq+E+_7rk+o729hRp6PwYSgTcUQYbTe44CkXfSE71A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6123:EE_
x-ms-office365-filtering-correlation-id: 1512f7cf-1b52-44cd-3b74-08dd1c32f72b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cGNHOXBPSHk1OG14aUMzVDhLa1NUck5lajZKUXFjakNacFNiL3cwdVIzSlcw?=
 =?utf-8?B?KzJqNys1UFQxU2ZaWVIvUWNKcFFSVXQxVmltbXkzY0lpUmFySU1DbjZyY1Zu?=
 =?utf-8?B?WHZWNnE4RzJEQVU0U005dEFhK3pQNnhvVVQrRUdYb1VBcWhOaFk0bHc1Zytw?=
 =?utf-8?B?ODE3bWx2bmJUTktKTmJDRCtsci9JT2ZuMkR0aUpFOHpNY3JvMjNHc2ZPSVpO?=
 =?utf-8?B?MUJXb3BkM01rTTBIdnF0dlpuaC8yQ3VOcm1LT2ExdzE3MGVlM2lMRnl6ckdo?=
 =?utf-8?B?TDRETlRBUzJVd1JPc1JNV3N6MWhTT24rQjJEYmw1dzRyays3VXBxZVlXbkF3?=
 =?utf-8?B?ZDlaTTdkVkxITFlGK0NpS21vNnRzalVIM1VrZE5qU256MzJ6T0ljcXlwV1lJ?=
 =?utf-8?B?TjdkWlB2SFMxVW5LVWpMeWlqVnV5a0lGdERQc3FMWWYrbTVvSURiR0t4NGZv?=
 =?utf-8?B?dURHVGVPclMyZ2ZTc1F3V21NZGxmSk9PMnZuUmg2b3JQeVBOYUVmRWJ6QTBZ?=
 =?utf-8?B?YWR1R1JvdHlsbnQxMUpmT3oyTTZKZzZWUUxvVC9XVHlibUdBUmlqQ3RCeC9n?=
 =?utf-8?B?dmJiSXRjRnlnVlNnbnBjanIzSWxBcjg3L3k0Wk1NMFJONkwvMlpmaUtDakRS?=
 =?utf-8?B?S0VOQmltd3NHY001SFlmN29veE9laVBueGJxZEtSUHdtQTlNdGFGdjI0WmFl?=
 =?utf-8?B?UmVZWGNpRWIyTjV3VXVoTWtzU2gyUStvazQzSE1TVXlEOWRxejJtRUgrMVds?=
 =?utf-8?B?Z1I5SzBKT25qRDlRSy82MFB1U0d1MGwwc3BrUURQMW1UQXdLVlgrYm92YUpP?=
 =?utf-8?B?c3luN2Q4eFZGb2V1cXJKajc1MnNmdUhlVjUxeXNmd0c3aXZ1eUQ1U0xWeXhv?=
 =?utf-8?B?cUZjemRLNVozZjZzclYyYmF0bUFOVlFIanFpNHN1Z1lzd1B3ZjZnTjBNWHIx?=
 =?utf-8?B?SUJtTjJIdXM0U2ZQalpiem05NFhIajVjSHFIY2tUYkdMTTVVVjQ3REw2YXVC?=
 =?utf-8?B?UlFmbmFaZlc5OUpTTlY1SnYzd1VnVWF0NCtNOGVqbktseUtEZkpITHZmbXNS?=
 =?utf-8?B?d0ZKa3dGU1RpeDVpVmFiVFdUSUVhckxJb0YzVUZacTNsUjdHZ0ZvVklLeUNJ?=
 =?utf-8?B?cGpQQk9lVHVJaHM1VEJVU3YzNFA3Z0VkTlBpUTBEc0MvMGpYRWhoM2JEUlFM?=
 =?utf-8?B?Z1hybHVXakFEOUNwTkh6VUxHck5QdE5sT1JWaVhuNEFCdUpFODNxbVlneVpE?=
 =?utf-8?B?Z2pzZU1RMjZvVkR6ZlJlQjh3L1VFZWtwTExFYjNRUzRDSlo4NGJFb1NTYVJE?=
 =?utf-8?B?Y1JwUHhkYUJuQW9FREFudHhqWElEL0hwTHBRcWs3TGdna3hWakFGUUU3aisw?=
 =?utf-8?B?SDhud1lqT0tOWVQzMERNTWJ0bVZjNFo5U3p1NlRmOU5MSU9hZUtFdGR5bDhL?=
 =?utf-8?B?ZkpOTEN3UFgvaVQvYkFFT1lDV2l5UW5qZmExOHVzdDRTNWxtWHJzdU1WY0s5?=
 =?utf-8?B?VU5BUnBpdmsrOFRIbURuMDIyYnZtTUltZ1ZuUktXN3d2ejZnRnd3Z0NpVm8x?=
 =?utf-8?B?VjhjRDZjeTR3MHRaWVJCeWVxYSt5eTh2TzJXTGEzTkluSE9BQ3hLRXY4KzNp?=
 =?utf-8?B?VjVGQnRkNEl1bE41ekZLdGd2ZWpxY1lPSHozbHVyYXhLa0lldy9Xc1NpS0tI?=
 =?utf-8?B?RlVDUmhFbTE3TFdlYVBBdnpRdjZyZWUvT3hsVjNLQlNZbGxHU2lKZERXVUlt?=
 =?utf-8?B?TkdOcHZxZFV4NG9VV3ZMZklralFBbnF6bjlDL3ZvYmlCM2JDb3ZQd21aMUt6?=
 =?utf-8?B?dTkrYjJWOXV5eVQ2bHhuY3pzUWI1MmdidEdzd3dkRnpCaXJrWiszWStrMnVn?=
 =?utf-8?B?MXIwSzNlUGw2MmhpNVAzdWlhbVc4ZWczem9RUExuMTBEMGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFpYM0ZzSWRoWXRmWU9EN0lrSU9CVE5VUzRLT3dOS1ovZnlwZ0xQZlVQTmpw?=
 =?utf-8?B?MysxeGo3RWFZNG9nVnUzelRxcTNEekhBSDZQTFdOOVg3K05sMkt2aFhWZmho?=
 =?utf-8?B?ZWJqMHB5V2l5VS9SdzdPMSsvQ2dtYjhvVHNGU05EaXU1TDhTSVhta2RIczFH?=
 =?utf-8?B?RkpYK3Z0S29CYWd1WlRHQitCaTk2aTNFb0k4Q3JZYVRzRk16WlVaWUlYRFl2?=
 =?utf-8?B?VlUyZUpQNSthU1JHVzN5VEJtQ0xRSjhlY0lid2FhTTVNMFYrdWx5SSsvbDY5?=
 =?utf-8?B?VU5tQ2FQdVQyWmd5VDh0SXd5S1NlbnB2cEhpVlk2cXk1UmVsalVCOUYwTEhj?=
 =?utf-8?B?TURteFdoY0tqbEdqeW5BcjIxbFdUOGFxWjFRaWtGTWJaZktCTXpjNHNxS24w?=
 =?utf-8?B?RVIvRDlBQ09odHRWYXZOQ2Nkako3MG1BL0pYTFlrZzNBTWpjZGNLbThTajdw?=
 =?utf-8?B?WTJOWlUxYzN0Q04veFg0OCtYMWp5RlJaQlN3NitySUIzWFJxNEg1NHdHVjdM?=
 =?utf-8?B?UjNCTkFUQWtxYm5MV0xlUGcxMlZFbktZOG5BRkxXQWROcjdZZWYrSnh4aGpu?=
 =?utf-8?B?S0tyOW9seVBhelhCdWJmWFY0SzB3b1JNaXp4N1REZFJRMkFyaVdjNlVTZTJ5?=
 =?utf-8?B?eGQ0cTF3bDVVc0tTMFJvUG1tQ2R5Q3dBTS9mMFpTdlNUc2daTDgrZXJIS3lh?=
 =?utf-8?B?S3d0d3kyNG5QZE8yV2ZFbVZ3b3hqb1J3N1Uxelc1VkIwNm83TlplczJiY1VC?=
 =?utf-8?B?REJvOFBiSHdUczFiQ0hibmxvVkJudjVmZWVPd29xMkJRcEFEei9VNTNHd2hV?=
 =?utf-8?B?RlZDRzI0c1hsaG8xTzFYZ2F2L2wxSGlCb2YvSGZZZGZNaHZjSmE3RWVJbGl3?=
 =?utf-8?B?ZGlmWTVpRlJTZXc5dWQweGUxRXdENXYzbmpHeUVvWXZYVmFiV2tWZTdYbWd5?=
 =?utf-8?B?cUN3TTVNaUxGUE9PS0Q0RUtTUHFDSHdHOEJMRFZER1NKaTdORFljS0RrUHJx?=
 =?utf-8?B?S1BOODlLZzd0L2NXWURpbHRSZGpHQTJ6SkFKTkJIOFdKdk1hRVZpS0Z6RTF5?=
 =?utf-8?B?NXNnK1FjV2EvUWtqa1FPeFRJZjZWSzlMVmt5UE04b3JhK25HZWFESTdRdSt0?=
 =?utf-8?B?Sm8wRGFic3VWV2w2a3BadXNZWDJ1bDE4aXJNTWdQTkRqcjNscFE5cWppeW1P?=
 =?utf-8?B?YkgyZVU1M3dBd0ZVS085SG04K2dVYlo4ZzQ4c2cyY3c0ZU5ENmp5SE15QXVQ?=
 =?utf-8?B?TzFqZkYwYTZBMEVSdVRJOU9oaDdTMTVMYzQ1VkRCYXhQZ1Fkc05nZzMrTlMw?=
 =?utf-8?B?TCtNZzY1Ty8wK2dKenF6RThvem02aWFXRXRXOEk0NlVlYytNOXZJRFBKdTR1?=
 =?utf-8?B?bmtlUWEwSnhpMXByem9MZVlNWnNjOElOeFJGcXdmNm0ramU1aEJ4OENXcFMx?=
 =?utf-8?B?TW0xMkM5R0xDS2toUG9KWUVhQ0VLL0djS3k3QUMvYTBQL3Z4b2IwTTdFZnVj?=
 =?utf-8?B?STRCcFc1ZDh4dXI0SW15RWdBMW1VNU55SVZQbktHSjhlUDRtbm5td29IM0xG?=
 =?utf-8?B?d0huZU80R3dJNnJWUlh6M1JDdmlWdkswd0RhTVc5RVd5QWV3a2xPelB2Q2NK?=
 =?utf-8?B?S2EyQVRiLzJ6d3kvZGdMZWRJY0QxS0gyQVF0TG0vUDA5Y0FnR1VmZDVRNEJo?=
 =?utf-8?B?REI5RTFxK3dHWkxFVkoyZzk5TUlzY3hCR1dFUlh0TDhmb3FsbnN5QmI5VlVp?=
 =?utf-8?B?bHE1VmV4K2h3ZXJQMXh4aHdEYUVGZ2RQRXJJWkxHYUoybGZvNStBVm4wdXJC?=
 =?utf-8?B?LzJ4MHVGcmlFYVJzVU4wWnZXVVRCVy9lOG5QNUdOOGplTkRYTENxRmxBSFVR?=
 =?utf-8?B?cjlXeURxME5hR1kzZUlDdjF2MW1KbExXcXVobWFSSkRDRDYvQUUvaVZVUmxH?=
 =?utf-8?B?TE1CTDZqTzV1STFMZlFlblBnZm5KdTFraWlKcjVLRnJlTDFIY1JwdW9vR3k0?=
 =?utf-8?B?UC93U3RyRDNLeE1Qem1Bdm9lZ1A2VDhud1NOaklCL0hFaXFBT1U2OW5HTGxE?=
 =?utf-8?B?SVM3aUZVbEFnYS9ibnRWb0NFQ0RBS0FmUGlWNlFJK0tScE53aXBYR3U2MXVC?=
 =?utf-8?B?OStxQTViTXdQUlk4WC9YRmR3OTBnQ0R5S2F0eUIySG1Gc1BNQTdLR3RzcEFj?=
 =?utf-8?B?Ymc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1512f7cf-1b52-44cd-3b74-08dd1c32f72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2024 11:32:17.6923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xBlqxYoEAS0275BXvzlietlnFt0hh9CszgU9d1u+5t+pDLN1SxnSXj8gHcfMpqvA2VqxN0JW39Ef+4cfS4CjuaYmluoKLqloO1b3a20NvdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6123

SGkgTGFkLCBQcmFiaGFrYXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiAx
MyBEZWNlbWJlciAyMDI0IDE5OjA4DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIXSB3YXRjaGRv
Zzogcnp2Mmhfd2R0OiBBZGQgc3VwcG9ydCB0byByZXRyaWV2ZSB0aGUgYm9vdHN0YXR1cyBpbmZv
cm1hdGlvbg0KPiANCj4gSGkgR3VlbnRlciwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmll
dy4NCj4gDQo+IE9uIEZyaSwgRGVjIDEzLCAyMDI0IGF0IDY6MDPigK9QTSBHdWVudGVyIFJvZWNr
IDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOg0KPiA+DQo+ID4gT24gMTIvMTMvMjQgMDk6NDQs
IFByYWJoYWthciB3cm90ZToNCj4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBPbiB0aGUgUlovVjJI
KFApIFNvQyB3ZSBjYW4gZGV0ZXJtaW5lIGlmIHRoZSBjdXJyZW50IGJvb3QgaXMgZHVlIHRvDQo+
ID4gPiBgUG93ZXItb24tUmVzZXRgIG9yIGR1ZSB0byB0aGUgYFdhdGNoZG9nYC4gVGhlIGluZm9y
bWF0aW9uIHVzZWQgdG8NCj4gPiA+IGRldGVybWluZSB0aGlzIGlzIHByZXNlbnQgb24gdGhlIENQ
RyBibG9jay4NCj4gPiA+DQo+ID4gPiBUaGUgQ1BHX0VSUk9SX1JTVG0obSA9IDIgLTggKSByZWdp
c3RlcnMgYXJlIHNldCBpbiByZXNwb25zZSB0byBhbg0KPiA+ID4gZXJyb3IgaW50ZXJydXB0IGNh
dXNpbmcgYW4gcmVzZXQuIENQR19FUlJPUl9SU1QyW0VSUk9SX1JTVDFdIGlzIHNldA0KPiA+ID4g
aWYgdGhlcmUgd2FzIGFuIHVuZGVyZmxvdy9vdmVyZmxvdyBvbiBXRFQxIGNhdXNpbmcgYW4gZXJy
b3IgaW50ZXJydXB0Lg0KPiA+ID4NCj4gPiA+IFRvIGZldGNoIHRoaXMgaW5mb3JtYXRpb24gZnJv
bSBDUEcgYmxvY2sgYHN5c2NvbmAgaXMgdXNlZCBhbmQNCj4gPiA+IGJvb3RzdGF0dXMgZmllbGQg
aW4gdGhlIHdhdGNoZG9nIGRldmljZSBpcyB1cGRhdGVkIGJhc2VkIG9uIHRoZQ0KPiA+ID4gQ1BH
X0VSUk9SX1JTVDJbRVJST1JfUlNUMV0gYml0LiBVcG9uIGNvbnN1bWlnDQo+ID4gPiBDUEdfRVJS
T1JfUlNUMltFUlJPUl9SU1QxXSBiaXQgd2UgYXJlIGFsc28gY2xlYXJpbmcgaXQuDQo+ID4gPg0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthcg0KPiA+ID4gPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gQEdlZXJ0LCBJIGlu
dGVuZCB0byBkcm9wIFdEVDAvMi8zIG5vZGVzIChhbmQgcmVsYXRlZCBjbG9ja3MpIGFzIEhXDQo+
ID4gPiBtYW51YWwgc2F5cyBXRFQxIGlzIGZvciBDQTU1IChJJ2xsIGZpcnN0IGNvbmZpcm0gdGhp
cyBpbnRlcm5hbGx5KQ0KPiA+ID4NCj4gPiA+IEhpIEdlZXJ0L1JvYiwNCj4gPiA+DQo+ID4gPiBJ
IGhhdmVudCBpbmNsdWRlZCBhIGJpbmRpbmcgY2hhbmdlcyBhcyBwYXJ0IG9mIHRoZSBSRkMgYXMg
SSB3YW50ZWQNCj4gPiA+IHRvIGdldCBzb21lIGluaXRpYWwgZmVlZGJhY2sgb24gdGhlIGltcGxl
bWVudGF0aW9uLiBDdXJyZW50bHkgQ1BHDQo+ID4gPiBibG9jayBkb2VzbnQgaGF2ZSB0aGUgInN5
c2NvbiIgdGhpcyBwYXRjaCBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBiZWxvdw0KPiA+ID4gZGlmZiB0
byBTb0MgRFRTSQ0KPiA+ID4NCj4gPiA+IENoZWVycywNCj4gPiA+IFByYWJoYWthcg0KPiA+ID4N
Cj4gPiA+IENoYW5nZXMgdG8gU29DIERUU0k6DQo+ID4gPiBAQCAtMjQzLDcgKzI0Myw3IEBAIHBp
bmN0cmw6IHBpbmN0cmxAMTA0MTAwMDAgew0KPiA+ID4gICAgICAgICAgICAgICAgICB9Ow0KPiA+
ID4NCj4gPiA+ICAgICAgICAgICAgICAgICAgY3BnOiBjbG9jay1jb250cm9sbGVyQDEwNDIwMDAw
IHsNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxy
OWEwOWcwNTctY3BnIjsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAicmVuZXNhcyxyOWEwOWcwNTctY3BnIiwNCj4gPiA+ICsgInN5c2NvbiI7DQo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMDQyMDAwMCAwIDB4MTAwMDA+Ow0KPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmYXVkaW9fZXh0YWxfY2xrPiwg
PCZydHhpbl9jbGs+LCA8JnFleHRhbF9jbGs+Ow0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGNsb2NrLW5hbWVzID0gImF1ZGlvX2V4dGFsIiwgInJ0eGluIiwNCj4gPiA+ICJxZXh0YWwi
OyBAQCAtNDU1LDYgKzQ1Niw3IEBAIHdkdDE6IHdhdGNoZG9nQDE0NDAwMDAwIHsNCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJwY2xrIiwgIm9zY2NsayI7DQo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgMHg3Nj47DQo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmY3BnPjsNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHN5c2NvbiA9IDwmY3BnPjsNCj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ID4gICAgICAgICAgICAg
ICAgICB9Ow0KPiA+ID4NCj4gPiA+IC0tLQ0KPiA+ID4gICBkcml2ZXJzL3dhdGNoZG9nL3J6djJo
X3dkdC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvcnp2Mmhfd2R0LmMNCj4gPiA+IGIvZHJpdmVycy93
YXRjaGRvZy9yenYyaF93ZHQuYyBpbmRleCA4ZGVmZDAyNDEyMTMuLjhlMDkwMWJiN2QyYg0KPiA+
ID4gMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL3J6djJoX3dkdC5jDQo+ID4g
PiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL3J6djJoX3dkdC5jDQo+ID4gPiBAQCAtNCwxNCArNCwx
NyBAQA0KPiA+ID4gICAgKg0KPiA+ID4gICAgKiBDb3B5cmlnaHQgKEMpIDIwMjQgUmVuZXNhcyBF
bGVjdHJvbmljcyBDb3Jwb3JhdGlvbi4NCj4gPiA+ICAgICovDQo+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L2JpdGZpZWxkLmg+DQo+ID4gPiAgICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gPiA+ICAg
I2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gPiAgICNpbmNsdWRlIDxsaW51eC9pby5oPg0K
PiA+ID4gICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4
L21mZC9zeXNjb24uaD4NCj4gPiA+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ID4g
ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPg0KPiA+ID4gICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+ID4g
KyNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4NCj4gPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0
Lmg+DQo+ID4gPiAgICNpbmNsdWRlIDxsaW51eC91bml0cy5oPg0KPiA+ID4gICAjaW5jbHVkZSA8
bGludXgvd2F0Y2hkb2cuaD4NCj4gPiA+IEBAIC00MCw2ICs0MywxMCBAQA0KPiA+ID4NCj4gPiA+
ICAgI2RlZmluZSBXRFRfREVGQVVMVF9USU1FT1VUIDYwVQ0KPiA+ID4NCj4gPiA+ICsjZGVmaW5l
IENQR19FUlJPUl9SU1QyICAgICAgICAgICAgICAgICAgICAgICAweGI0MA0KPiA+ID4gKyNkZWZp
bmUgQ1BHX0VSUk9SX1JTVDJfRVJSX1JTVDEgICAgICAgICAgICAgIEJJVCgxKQ0KPiA+ID4gKyNk
ZWZpbmUgQ1BHX0VSUk9SX1JTVDJfRVJSX1JTVDFfV0VOICAoQklUKDEpIDw8IDE2KQ0KPiA+DQo+
ID4gSSBjb3VsZCB1bmRlcnN0YW5kIEJJVCgxNykgb3IgQklUKDEgKyAxNikgb3INCj4gPg0KPiA+
ICNkZWZpbmUgQ1BHX0VSUk9SX1JTVDJfRVJSX1JTVDFfQklUICAgICAxDQo+ID4gI2RlZmluZSBD
UEdfRVJST1JfUlNUMl9FUlJfUlNUMSAgICAgICAgIEJJVChDUEdfRVJST1JfUlNUMl9FUlJfUlNU
MV9CSVQpDQo+ID4gI2RlZmluZSBDUEdfRVJST1JfUlNUMl9FUlJfUlNUMV9XRU4gICAgIEJJVChD
UEdfRVJST1JfUlNUMl9FUlJfUlNUMV9CSVQgKyAxNikNCj4gPg0KPiA+IGJ1dCAiQklUKDEpIDw8
IDE2IiByZWFsbHkgZG9lcyBub3QgYWRkIHZhbHVlLg0KPiA+DQo+IE9LLCBJIHdpbGwgc3dpdGNo
IHRvIHRoZSBhYm92ZSBtZW50aW9uZWQgbWFjcm9zLg0KPiANCj4gPiA+ICsNCj4gPiA+ICAgc3Rh
dGljIGJvb2wgbm93YXlvdXQgPSBXQVRDSERPR19OT1dBWU9VVDsNCj4gPiA+ICAgbW9kdWxlX3Bh
cmFtKG5vd2F5b3V0LCBib29sLCAwKTsNCj4gPiA+ICAgTU9EVUxFX1BBUk1fREVTQyhub3dheW91
dCwgIldhdGNoZG9nIGNhbm5vdCBiZSBzdG9wcGVkIG9uY2Ugc3RhcnRlZCAoZGVmYXVsdD0iDQo+
ID4gPiBAQCAtMTM1LDcgKzE0Miw3IEBAIHN0YXRpYyBpbnQgcnp2Mmhfd2R0X3N0b3Aoc3RydWN0
IHdhdGNoZG9nX2RldmljZSAqd2RldikNCj4gPiA+ICAgfQ0KPiA+ID4NCj4gPiA+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB3YXRjaGRvZ19pbmZvIHJ6djJoX3dkdF9pZGVudCA9IHsNCj4gPiA+IC0g
ICAgIC5vcHRpb25zID0gV0RJT0ZfTUFHSUNDTE9TRSB8IFdESU9GX0tFRVBBTElWRVBJTkcgfCBX
RElPRl9TRVRUSU1FT1VULA0KPiA+ID4gKyAgICAgLm9wdGlvbnMgPSBXRElPRl9NQUdJQ0NMT1NF
IHwgV0RJT0ZfS0VFUEFMSVZFUElORyB8DQo+ID4gPiArIFdESU9GX1NFVFRJTUVPVVQgfCBXRElP
Rl9DQVJEUkVTRVQsDQo+ID4gPiAgICAgICAuaWRlbnRpdHkgPSAiUmVuZXNhcyBSWi9WMkggV0RU
IFdhdGNoZG9nIiwNCj4gPiA+ICAgfTsNCj4gPiA+DQo+ID4gPiBAQCAtMjA3LDEyICsyMTQsMjkg
QEAgc3RhdGljIGludCByenYyaF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gPiA+ICAgew0KPiA+ID4gICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsNCj4gPiA+ICAgICAgIHN0cnVjdCByenYyaF93ZHRfcHJpdiAqcHJpdjsNCj4gPiA+ICsgICAg
IHN0cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4gPiA+ICsgICAgIHVuc2lnbmVkIGludCBidWY7DQo+
ID4NCj4gPiBUaGF0IGlzIGEgYmFkIHZhcmlhYmxlIG5hbWUgc2luY2UgaXQgc3VnZ2VzdHMgYSBi
dWZmZXIsIG5vdCBzb21lDQo+ID4gcmVnaXN0ZXIgY29udGVudC4NCj4gPg0KPiBBZ3JlZWQgSSB3
aWxsIHJlbmFtZSBpdCB0byByZWcuDQo+IA0KPiA+ID4gICAgICAgaW50IHJldDsNCj4gPiA+DQo+
ID4gPiAgICAgICBwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tF
Uk5FTCk7DQo+ID4gPiAgICAgICBpZiAoIXByaXYpDQo+ID4gPiAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOw0KPiA+ID4NCj4gPiA+ICsgICAgIHJlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9v
a3VwX2J5X3BoYW5kbGUoZGV2LT5vZl9ub2RlLCAic3lzY29uIik7DQo+ID4gPiArICAgICBpZiAo
SVNfRVJSKHJlZ21hcCkpDQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJlZ21h
cCk7DQo+ID4gPiArDQo+ID4NCj4gPiBUaGF0IGlzIGEgY2hhbmdlIGluIGJlaGF2aW9yLiBVcCB0
byBub3cgdGhlIHN5c2NvbiBwaGFuZGxlIGRpZCBub3QNCj4gPiBoYXZlIHRvIGV4aXN0IGZvciB0
aGUgZHJpdmVyIHRvIHdvcmsuIElzIGl0IGd1YXJhbnRlZWQgdG8gbm90IHJlc3VsdA0KPiA+IGlu
IHJlZ3Jlc3Npb25zIG9uIHN5c3RlbXMgd2hlcmUgaXQgZG9lc24ndCA/IEFsc28sIGlzIHRoaXMg
ZG9jdW1lbnRlZCA/IEkgZG9uJ3Qgc2VlbSB0byBiZSBhYmxlIHRvDQo+IGZpbmQgaXQuDQo+ID4N
Cj4gQWdyZWVkLiBJIHdpbGwgYWRkIGEgZmFsbGJhY2sgbWVjaGFuaXNtIHRvIGhhbmRsZSBjYXNl
cyB3aGVyZSB0aGUgc3lzY29uIHByb3BlcnR5IGlzIG5vdCBwcmVzZW50IGluDQo+IHRoZSBXRFQg
bm9kZS4gVGhpcyB3aWxsIGVuc3VyZSBubyByZWdyZXNzaW9ucyBvY2N1ciwgYW5kIHRoZSBib290
c3RhdHVzIHdpbGwgc2ltcGx5IGJlIHNldCB0byAwIGluDQo+IHN1Y2ggc2NlbmFyaW9zLiBBcyBt
ZW50aW9uZWQgaW4gdGhlIHBhdGNoIGNvbW1lbnRzLCBJIGhhdmUgbm90IHlldCBzdWJtaXR0ZWQg
dGhlIERUIGJpbmRpbmcgY2hhbmdlcw0KPiBiZWNhdXNlIEkgd2FudGVkIGZlZWRiYWNrIG9uIHRo
ZSBzeXNjb24gYXBwcm9hY2guIFRoZSBuZXcgUlogU29DcyBoYXZlIHJlZ2lzdGVycyBzY2F0dGVy
ZWQgYWNyb3NzDQo+IHZhcmlvdXMgbG9jYXRpb25zLCBhbmQgSSB3YXMgZXhwbG9yaW5nIGlmIHRo
ZXJlIG1pZ2h0IGJlIGEgYmV0dGVyIHdheSB0byBoYW5kbGUgdGhpcy4NCg0KU2VlLCBzeXNjb24g
Y29tcGF0aWJsZSBub3QgbmVlZGVkIHdpdGggWzFdDQoNClsxXQ0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjQxMjExLXN5c2Nvbi1maXhlcy12MS0zLWI1YWM4YzIxOWU5NkBrZXJuZWwu
b3JnLw0KDQpDaGVlcnMsDQpCaWp1DQo=

