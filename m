Return-Path: <linux-watchdog+bounces-2577-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 804FF9F22DC
	for <lists+linux-watchdog@lfdr.de>; Sun, 15 Dec 2024 10:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BA2F1655FB
	for <lists+linux-watchdog@lfdr.de>; Sun, 15 Dec 2024 09:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E676C4437A;
	Sun, 15 Dec 2024 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vNdbqXC1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1456228FD;
	Sun, 15 Dec 2024 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734254155; cv=fail; b=lLpR9Qo77XAC2cHl4pnrmNWLmFZkPdAjqoXHwZi0cO1lu2XxiRiRF6qo/BACfp04HbDeP76g4Dig9OSNjY5ZWDhQmwYvy5CBFvTxpo6UNDcRYtLtbO/2Z4anAIersRVD2xJg8YCQ4F6QRf/visTo2U2Mgam67jMWiFU/UMBedV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734254155; c=relaxed/simple;
	bh=h3ZRjcp0BzhgQGyfYY2KhYbaQJ6q/EYxKcOhJ2pCkh8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nVqA5tA8GFbgrAxbBsMQzmPI0ora07M0/Z9A/UJ+ZEYnYP/PgSaRc2aVnidCkTqDVtmldLif9HE8Mw/abHRdgBGpsBahzZH/oeb4CZZx992cRuvE71QPPcN8glPOPbaqQNNNHFZ7lGYMq4AzOJdlqOWONLGgTn7p8LRnHUpc5NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vNdbqXC1; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEpvmmP52GkCU/Qrr5KP4vJOY9BOXG6IUEh+H+12mTNHTQto/o1/cDWokOebLoHcGQgrOqtr5KafJxPcUaHatxUYCuyuD3axNM3ybeBECOmPO9wcndWLk+lgfgDty2syQ4uObgzgB32vHYPlQ2ieyKIGXNksHLtPNRv3gVJ30bb99S8N0vhPqK36TznvmLbhAAGwWW58I1EGgztI6Xe5ybwaSC6k2TODxEyVRuISCn7XjIKBFRho16PYGFGTtXBz9RK+P6XeyoEl8+6oO1alJswJLvpyI+tZ67xEB3/Nkkm1ZI3d1tSJJ6J7JQix0yTEFmMmAOGPA5aDOdGm7NwiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3ZRjcp0BzhgQGyfYY2KhYbaQJ6q/EYxKcOhJ2pCkh8=;
 b=m3fgYXJr3heRJkjkOoPYT0PaK+qTFlZfh60JjWZyqEvrQkVFj0bdHtq6rr4vuFlVJ9589iz07qKrJiSW/avVplb9gjYsZB9iKmG6XfgvBMjbdx/rcL4Gx+fyHYk7JRTWPR+Q4ZXJ0L/6SRJkgryzOdisWRjcNvdxgL0QbPeBkEq9CkoykLIJRXkWEhrK/NymVpRnGdG4UmRneeN1+o030lqnmzQ98Z3fuwSge+LMpnWZI9xJZM1DQhEKIL0iYmlqFEQQN5kruSGbl9i9j8Ll4zTyXn6TPBmb77rH1eyJ7AiwSfw+vLCU8GsrMvrYzKOt97fnaVk+EkQrXgqgRk4ZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3ZRjcp0BzhgQGyfYY2KhYbaQJ6q/EYxKcOhJ2pCkh8=;
 b=vNdbqXC1e3z36I1QTANmfHsgTLgy0ASOQUT5VAT0lGShNhmdu2cTVAYq0nOvJwocjZkm1nbv3WjOU1g7Fnrcgv3H0IWYxKqs7Ma4SQgDfaGZm8xDMa03hBX528dftdip+bVCzj+k3Xmp7pDB3AjFt2YhlPKlCQQB3tADQ99oouY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9592.jpnprd01.prod.outlook.com (2603:1096:400:19b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Sun, 15 Dec
 2024 09:15:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Sun, 15 Dec 2024
 09:15:48 +0000
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
Thread-Index: AQHbTYaq6u/GJ/L6eE66j97mKEiQ2bLkd4EAgAASKICAARJo0IAAqUSAgADB8LA=
Date: Sun, 15 Dec 2024 09:15:48 +0000
Message-ID:
 <TY3PR01MB1134664B737514AEAECA960D9863A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4d3e6f12-7cea-45ce-b1e2-c1fda94b92cd@roeck-us.net>
 <CA+V-a8uasq+E+_7rk+o729hRp6PwYSgTcUQYbTe44CkXfSE71A@mail.gmail.com>
 <TY3PR01MB11346774419BA8D51043C762986392@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8srdDkdAss2okuyfGYBwU5b9cF0aNw+KOSGR1wPquqNdQ@mail.gmail.com>
In-Reply-To:
 <CA+V-a8srdDkdAss2okuyfGYBwU5b9cF0aNw+KOSGR1wPquqNdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9592:EE_
x-ms-office365-filtering-correlation-id: ebf355a0-6a69-4b75-f17d-08dd1ce9108f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RUpvcnRHeWlRK1BSVXdpYUVXbXZYUDlIOGJhbUtrWDlDM1BVS3ZWWEo0dGN2?=
 =?utf-8?B?SlU4TE1UWE5xemRWaHVIZHJwTXJnbFQ4MDNlZEF5MXQ3NmdleDVQblI4L0Vs?=
 =?utf-8?B?NnVQQ2RUUThOVGZneEJGYTF0TElhRmlqQXU2aVV6OXpHSmphT0NqSTlMeGZH?=
 =?utf-8?B?MjUwTitiNkF4Z1l2eWJjOThBampnOGt2TmZ4bXFPSEhaTVF4aVFYV0NjQk8r?=
 =?utf-8?B?R256Qm1aQ2paNEJxc3UrL254bnB4QkljYTJITGVwVlYyQjhMd1ArekYyb1JD?=
 =?utf-8?B?VU5QcURDZlVaRkc3QXY4S0t3YVFDaldLM0tzMm91S2RWVWF5clR0TkI3eHg0?=
 =?utf-8?B?d2hxWko2a2plWUhXZDNReDlIcUxZQ2VSVExuUHRtNm9BeFNGb0wzdmFTcGZk?=
 =?utf-8?B?MzRWWkVUcTdyS0ZYSVBESVpDeE5UemNRTThOSjFuSXBydHlzN3A5allMQlNq?=
 =?utf-8?B?S3owTkNRVHBWamoyUStwckhOL3RwLzNaQVJoREVNVkFETjVhVVNOZVM3TFhs?=
 =?utf-8?B?TEpybTZ0L0FJUHlubVkzVk5xVVVRMC9ONnh1Rnpkc0hDZU5BL3o3M1dFc3R0?=
 =?utf-8?B?eXo4dGg1RDJyaDQwU2JIUjVoeGZwNmJwQkI0QTJYT1luMTAyUlFIanIzeFpz?=
 =?utf-8?B?SzZTcHdDZzZoWDBCZDRscG5SNWlLaGVyQnJ4L3A2akdyYXZyMlkxTVRHR0t4?=
 =?utf-8?B?L1pvUkdMMGJRbHR0Tm4wUnVnemR4S3Qrbmh0dDhMNW5Zc0kwRkkzcVE5cUtD?=
 =?utf-8?B?Wkl2azNrV2d2bUw2eW82NGhkdmRvdGRVZFpYYmQvTEJSN0FFNkZCWkxhbVhU?=
 =?utf-8?B?cXpiVStLQlB4cmgzMmFCSS9QTUZMRHcrbHFibGFlQzYxbGNWdi81NG01MlJF?=
 =?utf-8?B?SUlrQlg5M0RSMVJOZ3kzTmtQUGRTZ2NRcmhqV05LbXhXU2hZWGtoa0dlRmwx?=
 =?utf-8?B?L2RvMFo4dGYwWTRYbmhwTDBsVldIdmNOSXBOU08zMFlodlZMdmZUNXZkdktY?=
 =?utf-8?B?ai9Ca05HSDBmYWxSZTFxQXF0emZVZi9mVmZzV0xOUFJmYk5NNjJITGkxbDdX?=
 =?utf-8?B?U094MDVVbUVJcFZZQk5xZnhYMnZRWGhnaWRuaHFXT0V3K2NPWWc5dnFYckt5?=
 =?utf-8?B?SEwyUm44dlRPK0tEdGp1aFlzMzU3bXp3MlJ1WDg4WkFtaUhHYVhpSXVVVVdY?=
 =?utf-8?B?UmZONnZDWEpBc1hyeUwyUkpOTjZBT3lMZmd3TUNkRGZpTHlONGlNckNZRUE5?=
 =?utf-8?B?STdxYXNOU2pLb3BmNUN1T3dHcUNBLzZQRzlyd0FWQmVoZFBDbUpadkExNjNO?=
 =?utf-8?B?RWxxaTl6Mm1Zc2VxVjBZQnpFOGxubXVvTWhzZDBTSzVoaENzVVRiTmpxZGdp?=
 =?utf-8?B?WFBlZWFRcVl1L05sSXRJUEw4Y3hVQy93cWdyZUtUclpXRUxjM1I4ZkNCUURS?=
 =?utf-8?B?ZVZ6dUVLMjlybVMrbW5Gd3hsN2lDV1cxZ3gvTTFjcU1seG1CcWtOU1lTOTRV?=
 =?utf-8?B?RW1rbllCRWZYQmJWV2YvMmlOaGhLZ3dtSGpCbEdoTUF0bXJzRTQ4TzVJa2dF?=
 =?utf-8?B?YVYvUXB5OVk1alZIVTk2QmlIN3BSRDdONWsySDV1akFmRndyR0NKMW45WEt0?=
 =?utf-8?B?aHJBNEdLUUdRczdkZ0QzOStJY2kzcjVPZStMTHMzN1QycENtbi9ENGRmWC9W?=
 =?utf-8?B?Y0w5aHVvaU1ieWowMkhIOWxwSjdMSDhhcmFZMVdoQU9FVm1lc2JpdEVyS3FY?=
 =?utf-8?B?aDVyTDBqN1orVnJZdWFDMFc3cW1JTXFkY3pkT2ZKZmxHVHN1YlRSb3pDS1cz?=
 =?utf-8?B?aldRdWVMK005c2Q2T093MklVYU52Z1pxc295RmZCTTR6M3VGYjY5ZjFFQXdE?=
 =?utf-8?B?cDhzTjBFT2VWMzd6V2VvU0o1L3hyYUhhU3dEckNGckQwT1piM3BKeUZzQWEz?=
 =?utf-8?Q?9WijSxGTDeS0xu1XWB5BYqKVrkbPZWR/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEZWTEdqL1ltdHo0TmRwdCs3bGVncXhCWVNsSU1IcWNCN0gzQXlUVFNHdTl1?=
 =?utf-8?B?VFlJZTFacmtnUTJ5djhCMTJhbnBTSkVDVERqSWRUQmZ3UGJKV245NkNqdXFs?=
 =?utf-8?B?eWhSOHA0RUYxSmpOS295RTBLWjV2VlUvRDZ2Rmx0SW5DT21Oa0FZc09iMXN6?=
 =?utf-8?B?aThTNEh2eHM5dGtCNWtMa0l0Z003b2V3RnMyZkpKTU83VGc5K3k2Y0ZRczFl?=
 =?utf-8?B?eldwNW1BRSthWnUrN0QvaXltQXlCbUI2Q0VLNS9Kc09mbUxJd2FKTHBvVThh?=
 =?utf-8?B?aEVPOEVpd2JNNWZ2dDUwYnBiMFF0UEpzemFsQlR6cUtZdHRhdzh4b2VvWGVD?=
 =?utf-8?B?Vk1mMnFXYVlJQkExRkV0VGtneG5hbVBCdXcyLzVlRmZybDNqY2k1djJTb1Bz?=
 =?utf-8?B?dGdWcmJ4Ny9lS1AyQjBiREh5QzAvemRkRzhmNWwycXhKMzRxSTB6YzQ2aUJx?=
 =?utf-8?B?YUxkYzdrMXRuOWN6a0Y4YXArS3pSQ1ZZcUJhRnFLRGo4NWUrbHE0WVN4SW1p?=
 =?utf-8?B?YlZMQnpEbEV3Vi9kVTVyeUFYMUhOMjFTWkFRK3RYZ0FlWmU4RUN4OXZMZFVM?=
 =?utf-8?B?bFRFazlueW1GWDkvVWpGVCtjVU0rVkVSK1hhZC9zZldZV1g1cWhYREovNlpt?=
 =?utf-8?B?YlM5cUlpeS9Ta0Q0b0RPVS9YTnR3WXBkMnhDb3A2L2tHdzlMeFpFTStXU20z?=
 =?utf-8?B?VkdlcHRGYkhkNmJ3S3pUTEQzU0JpRzZHZWpQWkZlOERNMDlVYXhQWjFjNWNj?=
 =?utf-8?B?WkhlY1BiYW04OHl1NFNyVVdSbGtoTnBMM0VYMzkvd0M3cTREeC90ait1UUw0?=
 =?utf-8?B?NlIyU09uZ1NNL1J1bklOU2hzNCtJak51aFFvVHI5ZFQ5TjFlYytIY2pwL1dB?=
 =?utf-8?B?RElFYmJHMGEyMTBldU1zVFR4aVdwbEUvcW1XSmY1VDN5UkRXbjNkNWluS3F5?=
 =?utf-8?B?VGErRTd0eVJYTnJwTnNBcFUrQVpEeEFuY2ZpQW5wQWdpMXRzdFljaGIxNk1E?=
 =?utf-8?B?Z0JLckQ2WXNGRHJySEVJRSt2T3Q3bmtIUWNMVXVpdXlvYnFJcUpqck9mSm4w?=
 =?utf-8?B?VjVacmtFalBMQ29HaW5VeW5ZOFBvSWJ6dVNTdFZDR3FhKzJ1Y3dhN3pmMHl3?=
 =?utf-8?B?NXpWNWdqcTFNbks5dURrMnpTdFVHWm5VK0t3RmtDNkhHa3V5bDFmdHdnK1NL?=
 =?utf-8?B?dWh3T05qcFFFQnJ6c1hNRTBKU0hjd0RjL3c4MHo3Q3NzakxUVW9iZlVzUE5F?=
 =?utf-8?B?N2RpNUdWVlRBM0pwdENyaU1Od2RVY3Q1d3c0UVpMSW94VnA4SVo1SElrQW53?=
 =?utf-8?B?aG5QalFkekZyeDlGNXVJTFdMalZwTEYyYkZNaTlpVW12M0x4VTdnYmljRkM1?=
 =?utf-8?B?V1h3SkxDOUYrc0ZpcW1TY2hhV3I3NTN1N2YzSEgwODBvNWU1MGUxbWVINkoy?=
 =?utf-8?B?cVZEWC9SbmRsZVloZ1dYZ1ZLanVwRWVJMVh2MW4yRzJScEphVnhIdjd6Yk9v?=
 =?utf-8?B?S3c0TEZublJDc2NNMmt4WmduWEtqM1BBTmY1RWNBeEIwVkJjUUJXRy80RFZi?=
 =?utf-8?B?Z2VMY0R0MGxJakJDV2k5SFRZV2orQ1hXSmFFdFBtK1JJQVNjcjFtU1VCbnRI?=
 =?utf-8?B?QWtVb1RpMkgyQXVyQkNBRWNPMkRPZDBLWWRzRTRRVXQrYk1PcGtwR25IT1Q3?=
 =?utf-8?B?VmtPM25Bb04zTVF2aU9OV3ZzeUVpV0QwdmpNeE4vVUZNNEVhYXRQNnVrR1BY?=
 =?utf-8?B?Z1VjeU9SRjVsbUtzMElpWU91SXZVY1FVWElaK0hRRS85S2I0Z2hFMzRBa0JI?=
 =?utf-8?B?bWo1eGR2bkcyL0VoRHhqL0l6Q0l5VTJYdEQ1STdNYVNVc3NLNU1ybGs5WmI2?=
 =?utf-8?B?UGFyY1JCY2kxU3hPSHJ2OTVjbmdZNWh2VHRzaVgrcXpCd0czMVNWZmRKTXVr?=
 =?utf-8?B?dW4rRUtVR0d5TE54cmRWejNJSnFNZlRPY1BCem1kcDl1aGFDMlJ3enVWNTBx?=
 =?utf-8?B?TWduemVWN3pvV3hvck10USt1QlJMVnRqQWpldDJ1TGJyRHBMVXQ1TmxyYlNR?=
 =?utf-8?B?bE90WnAxaS90YmM4b1ZML0IxemR2WVhZMGlKQmhjRktma243ZEM4NktwWlVo?=
 =?utf-8?B?dng3aSt0cGZqR1ZMRCtaVmV5amN0TnlSNElxODR3SjRTZjdkMFhLOUwyaml4?=
 =?utf-8?B?UUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf355a0-6a69-4b75-f17d-08dd1ce9108f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2024 09:15:48.6927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fs1Ohj9ftMonFpAYLRcalKRS37bhZSjhrXnew/sSr3xNnzQ9OcDusnB/CrQocqwucO3ErSjRzH71JX03GTZzIDy44tIZFAR2hB57zbyKdjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9592

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMTQgRGVj
ZW1iZXIgMjAyNCAyMTozNg0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSF0gd2F0Y2hkb2c6IHJ6
djJoX3dkdDogQWRkIHN1cHBvcnQgdG8gcmV0cmlldmUgdGhlIGJvb3RzdGF0dXMgaW5mb3JtYXRp
b24NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTYXQsIERlYyAxNCwgMjAyNCBhdCAxMTozMuKA
r0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiBIaSBMYWQsIFByYWJoYWthciwNCj4gPg0KPiA8c25pcD4NCj4gPiA+ID4gVGhhdCBpcyBhIGNo
YW5nZSBpbiBiZWhhdmlvci4gVXAgdG8gbm93IHRoZSBzeXNjb24gcGhhbmRsZSBkaWQgbm90DQo+
ID4gPiA+IGhhdmUgdG8gZXhpc3QgZm9yIHRoZSBkcml2ZXIgdG8gd29yay4gSXMgaXQgZ3VhcmFu
dGVlZCB0byBub3QNCj4gPiA+ID4gcmVzdWx0IGluIHJlZ3Jlc3Npb25zIG9uIHN5c3RlbXMgd2hl
cmUgaXQgZG9lc24ndCA/IEFsc28sIGlzIHRoaXMNCj4gPiA+ID4gZG9jdW1lbnRlZCA/IEkgZG9u
J3Qgc2VlbSB0byBiZSBhYmxlIHRvDQo+ID4gPiBmaW5kIGl0Lg0KPiA+ID4gPg0KPiA+ID4gQWdy
ZWVkLiBJIHdpbGwgYWRkIGEgZmFsbGJhY2sgbWVjaGFuaXNtIHRvIGhhbmRsZSBjYXNlcyB3aGVy
ZSB0aGUNCj4gPiA+IHN5c2NvbiBwcm9wZXJ0eSBpcyBub3QgcHJlc2VudCBpbiB0aGUgV0RUIG5v
ZGUuIFRoaXMgd2lsbCBlbnN1cmUgbm8NCj4gPiA+IHJlZ3Jlc3Npb25zIG9jY3VyLCBhbmQgdGhl
IGJvb3RzdGF0dXMgd2lsbCBzaW1wbHkgYmUgc2V0IHRvIDAgaW4NCj4gPiA+IHN1Y2ggc2NlbmFy
aW9zLiBBcyBtZW50aW9uZWQgaW4gdGhlIHBhdGNoIGNvbW1lbnRzLCBJIGhhdmUgbm90IHlldA0K
PiA+ID4gc3VibWl0dGVkIHRoZSBEVCBiaW5kaW5nIGNoYW5nZXMgYmVjYXVzZSBJIHdhbnRlZCBm
ZWVkYmFjayBvbiB0aGUgc3lzY29uIGFwcHJvYWNoLiBUaGUgbmV3IFJaIFNvQ3MNCj4gaGF2ZSBy
ZWdpc3RlcnMgc2NhdHRlcmVkIGFjcm9zcyB2YXJpb3VzIGxvY2F0aW9ucywgYW5kIEkgd2FzIGV4
cGxvcmluZyBpZiB0aGVyZSBtaWdodCBiZSBhIGJldHRlciB3YXkNCj4gdG8gaGFuZGxlIHRoaXMu
DQo+ID4NCj4gPiBTZWUsIHN5c2NvbiBjb21wYXRpYmxlIG5vdCBuZWVkZWQgd2l0aCBbMV0NCj4g
Pg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTIxMS1zeXNj
b24tZml4ZXMtdjEtMy1iNWFjOGMyMTllOTZAa2UNCj4gPiBybmVsLm9yZy8NCj4gPg0KPiBBcyBw
ZXIgbXkgdW5kZXJzdGFuZGluZywgYHN5c2NvbmAgY29tcGF0aWJsZSBpcyByZXF1aXJlZCBpbiB0
aGlzIGNhc2UgYmVjYXVzZSB0aGUgQ1BHIGRyaXZlciBkb2VzIG5vdA0KPiByZWdpc3RlciBhIHJl
Z21hcC4gV2l0aCB0aGUgcGF0Y2ggWzFdIChsaW5rZWQgYWJvdmUpLCB0aGlzIGFwcGxpZXMgdG8g
ZHJpdmVycyB0aGF0IHJlZ2lzdGVyIGEgc3lzY29uDQo+IHJlZ21hcCwgd2hlcmUgdGhlIGNvcnJl
c3BvbmRpbmcgRFQgbm9kZSBkb2VzIG5vdCBuZWNlc3NhcmlseSBuZWVkIGEgYHN5c2NvbmAgY29t
cGF0aWJsZS4NCg0KSSBndWVzcyB5b3UgY2FuIHVzZSAic3lzY29uX25vZGVfdG9fcmVnbWFwIiBm
b3IgdGhhdCBhcyBvZl9zeXNjb25fcmVnaXN0ZXJfcmVnbWFwKCkgaXMgZm9yIGV4dGVybmFsbHkN
CmNyZWF0ZWQgcmVnbWFwcz8/DQoNCnN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoKSBp
biB0dXJuIGNhbGwgc3lzY29uX25vZGVfdG9fcmVnbWFwKCkNCg0KQ2hlZXJzLA0KQmlqdQ0K

