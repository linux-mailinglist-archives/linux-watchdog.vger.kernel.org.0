Return-Path: <linux-watchdog+bounces-2439-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E15D9C160A
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2024 06:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED114B21FF9
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2024 05:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236FDCA6F;
	Fri,  8 Nov 2024 05:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="WDNu01ma"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2127.outbound.protection.outlook.com [40.107.215.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A387489;
	Fri,  8 Nov 2024 05:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731044551; cv=fail; b=PzXdWC1LM9f2AxszXk8s3XCBQ2B231vvRqlnqzBdcrPkgxgk1FezEIZ31IXPn7SLFAQG2uEc68M9M0pEp6T+D6xoHSTP5zr5R9+0IYP8BYZwvNr5ccDRuuH4zYUBRx6mT7acioUmMMkekXgtEgn+Y2d/neiR7CEd/2EdzseJTR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731044551; c=relaxed/simple;
	bh=li8+png9kCXsaDxQa8QvYEl9V9BKqrGbr3dh5mNb4ak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GIwub9dArGlra5l9h0etoXrhXDpfhcZNvjRZ7oc3u4L6BHt1vIeLFQnZ9vC4GBQtgNj2mNLTBblm5mqTHOon+GemAeDvAJPnZADfxrgkYYO+bAvTelKTJBpHhUS02jb+ppbNXUM2X+kklK+IevFMM1cxk0OmsVuFaWXJL4eYbTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=WDNu01ma; arc=fail smtp.client-ip=40.107.215.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnCVVslFopdgAww8cdCoOr5Zf8vNTFE9M6S7arKj6Y/YQlBdRiuzWPWd/+F4pVLNu6kgIkIRs90qwjAGztgWgzNt+L7UgpD1mGk63ojF879H2/aD/3J2i3SSQYOzvnOwdHxc16ycTXDqcoLxEchbfMUbccxrlrm/eg4lhsz49In0die8jegdVU9oqACEKvEiqR82iUDDUhX/vmPmlIx3MyJqKOhJ+rpxSnQkT8PTybr5t5geCIWl5/hddpE+QYal5qtrL7AHWaR42utDJgjBLlznX16+25ZmZP3EZNlXDMB9/AmjjdCjwrz6Ns8KKEjgvd04NaARi8TsaWT+NmnZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=li8+png9kCXsaDxQa8QvYEl9V9BKqrGbr3dh5mNb4ak=;
 b=lEmBoX3JCu7uDMuJJURdAb7ttelwfUxZWorPY/nveQ9quL+rNvvW695+ZCpaSM2Gke81wi4JUCXAti8p2HtcudriZOrlZoaJbasVyXW6YD/+wxdYL8glah1q0ZpIyIidppXcpevMiGES86/XdE/T2BAKH4Ojo7HfpuIDQx6oYjYyLSaRKqtd8E19Pm1Qc/fg3SoMhLA2/50kjEULnUqGSxlg6OUgBHtCJj5j4UFJ1fxgBuNi6lzSXeRq50tISvDvxQ6D23e51tuwIhFEZ35kZoPnU58zyietIbu4YiKc7xhHBk2ygiJiYer6cyri+hZ+Sywt6wJdSbofVl5eM9Th7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=li8+png9kCXsaDxQa8QvYEl9V9BKqrGbr3dh5mNb4ak=;
 b=WDNu01maGjk9W5As8l1kA2CIFbhsJKNKRKnZtI529/bFXqaiSGsCGgKNsrT8hp9u+3/KXdKfXKYn1CoobihbhcA4xR5fQrbAiLehtZIr0wPHgJ8CRFsXM9DJsm/gFVquz2eVKF+uvSX8wtWt3JpdCod4h0o8R4sqFfAu4uOlyQQQr+Y5jlAc6MGOsFy3SS1KgBtdK2txJdwHB6dri5vDJWqw5b74zOHrF7C6L5Mg6AJJ7OSsLMQn3+FW6mEJL6nK8SpW22H3denvaE+lqtR6aYEgB8g9G5BKY/KCso/vkXPeTF84za7H4B2UvJ1OMOqjtTEwlwQG0QycqbgRb5XsRw==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SEZPR06MB6405.apcprd06.prod.outlook.com (2603:1096:101:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Fri, 8 Nov
 2024 05:42:21 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8137.014; Fri, 8 Nov 2024
 05:42:21 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Patrick Williams
	<patrick@stwcx.xyz>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>
CC: "joel@jms.id.au" <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org"
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
Thread-Index: AQHbLFdFSiy5MyUwCUe0YBcXjsWUGrKivQQAgAOD0oCABQ7T0IABNwoAgABcoTA=
Date: Fri, 8 Nov 2024 05:42:21 +0000
Message-ID:
 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
	 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
	 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
In-Reply-To:
 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SEZPR06MB6405:EE_
x-ms-office365-filtering-correlation-id: 0a6e58f6-ccc5-431a-ced2-08dcffb81da0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZTJlWWxrVTV6U0FJZXRyMDJQME5rTnhZVGxlUVVSRlVTZlJvaWJnV2dlY1I0?=
 =?utf-8?B?bkRvakVlczBGWHZXeHdpeEM4OVNOMUU3TDI5VlV1VklQYkxKbHJUenh1b0Ew?=
 =?utf-8?B?S0YrWE51UWJDMHZacStRMTZXbHZsYVRsU0x3ODVjbXpPTk1uaFNpR0QwMHc4?=
 =?utf-8?B?bWU5WE9vTzRDSGdLK05DOW85azEyK09GNlhoRGZHTHAvM1AyUHNuYW1DYjZh?=
 =?utf-8?B?Y1RXMUsrcjVFNUNkdi9vU0Q2YzdxdVpZOFhFZHlDMWQ1cXkzRk8rcVRaQzNR?=
 =?utf-8?B?OVd3eHJhUHBiL3haOXlzYVJHam1DdnRPMzdtczNJVDN3czdNNU1kRVZiOWxB?=
 =?utf-8?B?UHpnellGeTN0RmhUMzY1dG8xcVhuSEhGRTVLRnRzeHYvQzBFNGhkS2MzL1ZJ?=
 =?utf-8?B?ZHJQWGUwV0hCSFVld1Ftc0hVY211c2U5TEFpeVhrbzBpWGgydVpxcTM3dXZ6?=
 =?utf-8?B?dUlnY1FUbS9EMy9JMy82VkM2QUFPeDBDeUlEbHNhSTVYNXpRb0xYd0ZJQ3k1?=
 =?utf-8?B?NDJJemszaGpEOFpGaEQ5TmtSSkljb3VPbEx2WmxPY3NRQy8zMW1yUllOaHht?=
 =?utf-8?B?RUxnR0ZtQXYwYXRoNmpzbUhjVzNPaUthbWRRZ2cyYjYybUVnVStaODJ0OFdm?=
 =?utf-8?B?OEUxcHF6SDRIZ1o5L3dVNDhhY0pwbE96Mm50MklvNlpud3FHQ2NRb0hHSi9k?=
 =?utf-8?B?OGloUXhkelY0RUROMys1T0tvTE1QTlNhdktCSkJQUmhjTUVkUFNONmp4WDJm?=
 =?utf-8?B?by94NzdXbGdWcFY1aWhBWmJVWVl3U0g2WHZYb3VhMlFzSzRIVVVneStxUm9D?=
 =?utf-8?B?ekxKRi9ZTUY5Y25ZUW5sMUR5ZjNIWHEzQ245TDJWOFQyQVN2MkUyZEVWQkZD?=
 =?utf-8?B?bEpOTDM1T0VObkFscDlRQmtGZml1aXlCbnRuYVVvS3ZnSG1RYjdmdzAremZZ?=
 =?utf-8?B?VWdWUlY5QjEydk5EZmVQNjlZak9uY1BGKzZnVEI1R1VFa2gza283S2JuZmcr?=
 =?utf-8?B?SW1PbHMzS1FFMkhEazB5NmFMVkdsVHZxNnpna2RmeWFoQVlrc3NGZHB2TE1U?=
 =?utf-8?B?dzdMMnQ0RjhBc3duZ3JvR21kazZLK29MOThpVWRiK05jVFlaQU9PWHNpUW1K?=
 =?utf-8?B?VVo3bjcvclNhOUlTOHNORFkyMUxkeU9UekhPaVB6RXFJMGNZRTlmYjVPR3Nz?=
 =?utf-8?B?blF4b2UxN1ovb1JkdkFXelNlc0lhUkpoL1dhRC9HMmpLYUlsMURpNXpRQTNz?=
 =?utf-8?B?azQxcXgzdjJUbm05eXN1SmszNUZaMHpKS1k5eDlOTDI1NzArMTNLS1ZKSk80?=
 =?utf-8?B?aDZ1MDhPbHorQ0pyU0FacHhONUhUUGxkWVFydU1GVW5MSUw5dkUweFBpYnEr?=
 =?utf-8?B?ei9uazI1emRleG9ZSHZLN1c5aW00amp4QlNwZjNGdUxBTmVIaE9tMUw0WlVm?=
 =?utf-8?B?T2J3K1pBNXFwaFNzRmhPZFdpUFc5K2FZMWpXSldnU1M0b3dDVmhtTDJPS1FY?=
 =?utf-8?B?NThucjhCNG44c0l4UzRvNFQzRlFucW0rWXZud24yV0JjaUJYZnBNMVNKTjFK?=
 =?utf-8?B?NnU5ZitFM2MzSHJrTUFUa3pQL2pTaHlIWmlBdnpTeVJ6UWhSZklzTjJNaDBO?=
 =?utf-8?B?S1diVE1hcGxoK2t0SE1QRUQ4ZzRqL085N1BpN1hRMWFYaFNyNXYyQ1ljcU1Z?=
 =?utf-8?B?b2ZyZW45aEtkN1ZINjgwY1g4VkwzbnFIamJZL2loQUtHc2p3YW8xa0c0OW9l?=
 =?utf-8?Q?orP/cJ0AFXKWEa1j9aSqlbJcGGCCoRaYwdkAHU3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blpJeUpPb0ZmZkVXeDVMUlJicEVGVVFnVFkyY05IY25ueEd2M1RmeVZXdjg0?=
 =?utf-8?B?Y011alZKRlErbzdXdWZzWHJuNkdNV2JIbENWeGRoMy93cUlWV1VZcm5qcWVO?=
 =?utf-8?B?enZiS2NuUmcxUWpCcE9CQ09zZDEyM0loaTBVYlRXQTFYOC9YcktKYzBhYUhU?=
 =?utf-8?B?YWl5dVp1dzJPeXhLemtLL1liZ2VJbStaTXI0YnhjSFpaTFJ6RXQ3SkRaRVFI?=
 =?utf-8?B?RUloQ1RxM3RVRUZ5LzJIQkg4VDhiVnY1bE4zRFo5WW1xdTFYQzE3U3k5RTMv?=
 =?utf-8?B?UWljczhzMllGV2N6L0Z4TExhUVFpNUxYVHNodUxRNkhFYXBvTU9vZytqcThq?=
 =?utf-8?B?d0FGMCswd1JGYWhNbm1qMWJyU0FHWTBEaXJXWmVUenpoTUkzNHN5S01nNktY?=
 =?utf-8?B?UUpnM1h0UWUyRE9wcW9WZEhRRVdtbTc2elJUZzdqU0kxOU4wYkMyTmRTdTg1?=
 =?utf-8?B?UWpDTEdRZ2g5MGo2dUNLeWFjTjZycTFwRWlKMUFxYnlQbkgwb3FNZVBISS9G?=
 =?utf-8?B?a1R5OVBiTmlWckhPVWh6aVhqUDNxczQ2RVBWam1neUlOcVp5U2YwMnlwblJu?=
 =?utf-8?B?b2kvWGN2dWI4WGtZRWhRSEVWY1IrdlF4NEVKeEFxUTQ5NGNORjZIVkdXdzVL?=
 =?utf-8?B?Nmw2aWUzM25MU0I5SzlyWmVTU1o2TG9rMWNZaHdpb1Y5NDZadjcwd2g2RFdq?=
 =?utf-8?B?UzJxaG5DNjlVemRDV2hiTkFydm4zNUVPeW1XeEJ3eGdIbmgzMXkwM2FSdVJ1?=
 =?utf-8?B?L3hySk9Id1hNbFBYR2pBY1Y0NXFJM3ZRQXBhM1BxVEVvcG02STZ0UGk0YXpi?=
 =?utf-8?B?WitSWk5udFdISzFMZmplUzZweHFYbEg5aWU5alNCUkxsWWpnOFd6YkxoSEFP?=
 =?utf-8?B?N1Q5QUNkT2JRdTRVaXB6NnpBbjZDa1N4T1U2YVlzVXFacjUwY3lyZFdScGdM?=
 =?utf-8?B?dUtYVEh2V1UyZW9RUmVKbjQrdUVCNm1TZXBUMUx6WnFHeDZvZGFieElDUkF1?=
 =?utf-8?B?VUlqQ2g4OEI5WjhLSThlRlUydkZXZkVpcHpaVFVOb1c4NFdUTkEzVlp5TWhT?=
 =?utf-8?B?VkI4S05kcTlobFYxMzZDMWVXQ0xkcElzbUEvWC9Mdm02Yi8yaEZGSnArVEJl?=
 =?utf-8?B?ME9IcDVJMWtRN3FNOHNrTDFVTE9NMG5ISzhLUEFQamhGNDJQaTRNTVV0Q0w1?=
 =?utf-8?B?SkFqQ0ZDWGg0VldWSUpOdGVNdkdaMmVoWUZLWXhoajhWZ041eVpOMXZmTnVs?=
 =?utf-8?B?VW4zK25UcnFGclBSc2FNV0d3NU9lenM4Vy9NcEk5OC9RQzVxZUx0NHZXNUQx?=
 =?utf-8?B?bk1RczNQODNXQ0Q4cWxlenNORVVrQWRxQVU2dXZUT0JaMTQxZWsrMXZ5M003?=
 =?utf-8?B?OTJzZWt3d0VNVlc2WEErdzVnZS9VaGRYY2s0RDdjRnQweUFpSzNmeVlzckRS?=
 =?utf-8?B?Sy80bkFiSUN5YzNjMXM5YXQ4cVQrVHdoT0lKRjE1WTdHNkpmQVFzWnRJVXls?=
 =?utf-8?B?aVZrN2JFVWVGRnJodUx3NUhDSnAxcEhqYlN1UlorZG1LbDlRSUxzRm16Nm9J?=
 =?utf-8?B?Vyt2djkvQ0hObjd6VC8remVmK3lkWXJab2hIVncrcHc5UTZEZEdsVmYrajFn?=
 =?utf-8?B?Um5NekVrS1lrdWhPbEd0WVMwV2xXUkk3Mkw3cU0rVGV6NHBVNXZzeU15N2tI?=
 =?utf-8?B?REhTQ3FLN2NUMHc4a1F5UmEzaVhXRGNSajU3SWp2R3RnK3ZackNjY3FLMCtS?=
 =?utf-8?B?c2hqQlVsSkVhRTZhSUVtQlo3VHNrL2hTNlNOZFRMS3pnTjJmb3lsTk9jYWc5?=
 =?utf-8?B?MEQ1VEVvSmdHdTV4M2MydkFuMWE1KytKL251TVNGQjNLYXdrRUx3TXUxUnY4?=
 =?utf-8?B?QThLYXhLcFJkWUM0VzNxU3V4OE1kRS9Mam15bStIaHk4UngwdHVTZ2RaZm5l?=
 =?utf-8?B?amNDWmswU2RrTnQweGNNdThyc0xDcWVDcjF5b2Q3NU9kZ0lkMWpVdk96RnZ5?=
 =?utf-8?B?YW5WWE5aMktVUHREaS9BOWNYcUFlK0xDQ0lsaFgwdGxsVFhnNEhxWVpYdHNu?=
 =?utf-8?B?eGo3NDMrRmt5Q2JhRkxMakRTMk1yWi9NcUNkNXh2dXc5bzZHTHhrbzdYK09j?=
 =?utf-8?B?WDlROUp5aEtRWDhodFpvckZnRGt3eXp4a2tYL0tIeUUrYm5TdTRUNC9HaFcz?=
 =?utf-8?B?cFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6e58f6-ccc5-431a-ced2-08dcffb81da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 05:42:21.5296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JU4H9VDIfMBejalKjZCfYLr/sBElURZ0/PErYE0afl4pmS7abXiwQ3IBKqv7n73Zotf2tqT6DzsbJoiSgbzfr289SrwPy9/3j2KsTOBSO7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6405

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgOCwgMjAyNCA3OjUwIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS8zXSB3
YXRjaGRvZzogYXNwZWVkOiBVcGRhdGUgYm9vdHN0YXR1cyBoYW5kbGluZw0KPiANCj4gSGkgQ2hp
bi1UaW5nLA0KPiANCj4gT24gVGh1LCAyMDI0LTExLTA3IGF0IDA1OjM1ICswMDAwLCBDaGluLVRp
bmcgS3VvIHdyb3RlOg0KPiA+IEhpIEFuZHJldywNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIGNo
ZWNrLg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTog
QW5kcmV3IEplZmZlcnkgPGFuZHJld0Bjb2RlY29uc3RydWN0LmNvbS5hdT4NCj4gPiA+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgNCwgMjAyNCA4OjAyIEFNDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDEvM10gd2F0Y2hkb2c6IGFzcGVlZDogVXBkYXRlIGJvb3RzdGF0dXMNCj4gPiA+IGhh
bmRsaW5nDQo+ID4gPg0KPiA+ID4gT24gRnJpLCAyMDI0LTExLTAxIGF0IDE0OjIxIC0wNDAwLCBQ
YXRyaWNrIFdpbGxpYW1zIHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIE5vdiAwMSwgMjAyNCBhdCAw
ODoxMTo1OVBNICswODAwLCBDaGluLVRpbmcgS3VvIHdyb3RlOg0KPiA+ID4gPiA+IFRoZSBib290
IHN0YXR1cyBtYXBwaW5nIHJ1bGUgZm9sbG93cyB0aGUgbGF0ZXN0IGRlc2lnbiBndWlkZQ0KPiA+
ID4gPiA+IGZyb20gdGhlIE9wZW5CTUMgc2hvd24gYXMgYmVsb3cuDQo+ID4gPiA+ID4gaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9kZXNpZ25zL2JtYy1yZWJvb3Qt
Yw0KPiA+ID4gPiA+IGF1c2UNCj4gPiA+ID4gPiAtdXBkYXRlLm1kI3Byb3Bvc2VkLWRlc2lnbg0K
PiA+ID4gPiA+IC0gV0RJT0ZfRVhURVJOMcKgwqAgPT4gc3lzdGVtIGlzIHJlc2V0IGJ5IFNvZnR3
YXJlDQo+ID4gPiA+ID4gLSBXRElPRl9DQVJEUkVTRVQgPT4gc3lzdGVtIGlzIHJlc2V0IGJ5IFdE
VCBTb0MgcmVzZXQNCj4gPiA+ID4gPiAtIE90aGVyc8KgwqDCoMKgwqDCoMKgwqDCoCA9PiBvdGhl
ciByZXNldCBldmVudHMsIGUuZy4sIHBvd2VyIG9uIHJlc2V0Lg0KPiA+ID4gPg0KPiA+ID4gPiBJ
J20gcXVpdGUgc3VycHJpc2VkIHRoYXQgdGhlIGFib3ZlIGlzIHJlbGV2YW50IGZvciBhIGtlcm5l
bCBkcml2ZXINCj4gPiA+ID4gYXQgYWxsLsKgIElzbid0ICJFWFRFUk4xIiBhIG5hbWUgb2YgYSBy
ZWFsIHdhdGNoZG9nIHNpZ25hbCBmcm9tDQo+ID4gPiA+IHlvdXIgaGFyZHdhcmUgKG15IHJlY29s
bGVjdGlvbiBpcyB0aGF0IHRoZXJlIGFyZSAyIGV4dGVybmFsDQo+ID4gPiA+IHdhdGNoZG9ncyku
DQo+ID4gPg0KPiA+ID4gSSB0aGluayB5b3UgbWF5IGJlIHJlZmVycmluZyB0byBXRFRSU1QxIChh
bmQgV0RUUlNUMikgaGVyZS4NCj4gPiA+DQo+ID4NCj4gPiBXRFRSU1QxLCB3ZHRfZXh0LCBpcyBh
IHB1bHNlIHNpZ25hbCBnZW5lcmF0ZWQgd2hlbiBXRFQgdGltZW91dCBvY2N1cnMuDQo+ID4gSG93
ZXZlciwgZGVwZW5kaW5nIG9uIHRoZSBIVyBib2FyZCBkZXNpZ24sIHdkdF9leHQgZG9lc27igJl0
IGFsd2F5cw0KPiA+IGFmZmVjdCB0aGUgc3lzdGVtIHJlc2V0LiBUaHVzLCBFWFRFUk4xIGJvb3Qg
c3RhdHVzIGNhbiBiZSBpZ25vcmVkIGluDQo+ID4gQVNQRUVEIFdEVCBkcml2ZXIgYW5kIGp1c3Qg
aW1wbGVtZW50ICJDQVJEUkVTRVQiIGFuZCAib3RoZXJzIiB0eXBlcw0KPiA+IHNpbmNlIEVYVEVS
TjEgaXMgbm90IGFsd2F5cyBhZmZlY3RlZC9jb250cm9sbGVkIGJ5IFdEVCBjb250cm9sbGVyDQo+
ID4gZGlyZWN0bHkuIE9yLCBhbiBhZGRpdGlvbmFsIHByb3BlcnR5IGluIGR0cyBjYW4gYmUgYWRk
ZWQgdG8NCj4gPiBkaXN0aW5ndWlzaCB3aGV0aGVyIHRoZSBjdXJyZW50IEVYVFJTVCMgcmVzZXQg
ZXZlbnQgaXMgdHJpZ2dlcmVkIGJ5DQo+ID4gd2R0X2V4dCBzaWduYWwuDQo+IA0KPiBZZXAsIEkg
dW5kZXJzdGFuZCBob3cgaXQgd29ya3MuIEkgd2FzIHJlc3BvbmRpbmcgdG8gUGF0cmljaydzIHF1
ZXJ5IHRvIGNsZWFyIHVwDQo+IHNvbWUgY29uZnVzaW9uIGFyb3VuZCB0aGUgd2F0Y2hkb2cgc2ln
bmFsIG5hbWVzLg0KPiANCg0KT2theS4NCg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gSGF2aW5n
IHNhaWQgdGhhdCwgaXQgd2FzIGtub3duIHRoYXQgdGhlcmUgd291bGQgbmVlZCB0byBiZSBjaGFu
Z2VzDQo+ID4gPiA+IHRvIHRoZSBkcml2ZXIgYmVjYXVzZSBzb21lIG9mIHRoZXNlIGNvbmRpdGlv
bnMgd2VyZSBub3QgYWRlcXVhdGVseQ0KPiA+ID4gPiBleHBvc2VkIGF0IGFsbC7CoCBJJ20ganVz
dCBzdGlsbCBzdXJwcmlzZWQgdGhhdCB3ZSdyZSBuZWVkaW5nIHRvDQo+ID4gPiA+IHJlZmVyZW5j
ZSB0aGF0IGRvY3VtZW50IGFzIHBhcnQgb2YgdGhlc2UgY2hhbmdlcy4NCj4gPiA+DQo+ID4gPiBJ
IHRoaW5rIHRoZSBtYWluIHF1ZXN0aW9uIGlzIHdoZXRoZXIgYW4gaW50ZXJuYWwsIGdyYWNlZnVs
DQo+ID4gPiAodXNlcnNwYWNlLQ0KPiA+ID4gcmVxdWVzdGVkKSByZXNldCBpcyBhIHJlYXNvbmFi
bGUgdXNlIG9mIFdESU9GX0VYVEVSTlsxMl0uIE15IGZlZWxpbmcNCj4gPiA+IG5vLiBJIHdvbmRl
ciB3aGV0aGVyIGRlZmluaW5nIGEgbmV3IGZsYWcgKFdESU9GX1JFQk9PVD8NCj4gPiA+IFdESU9G
X0dSQUNFRlVMPykgaW4gdGhlIFVBUEkgd291bGQgYmUgYWNjZXB0YWJsZT8NCj4gPiA+DQo+ID4N
Cj4gPiBBZ3JlZSwgYnV0IHRoaXMgaXMgb3V0IG9mIHRoZSBzY29wZSBvZiB0aGlzIHBhdGNoIHNl
cmllcyBhbmQgY2FuIGJlDQo+ID4gZGlzY3Vzc2VkIGFuZA0KPiA+IGltcGxlbWVudGVkIGluIHRo
ZSBvdGhlciBmdXR1cmUgcGF0Y2hlcy4NCj4gDQo+IEkgZGlzYWdyZWUsIGJlY2F1c2UgdGhlbiB5
b3UncmUgY2hhbmdpbmcgdGhlIHVzZXJzcGFjZS12aXNpYmxlDQo+IGJlaGF2aW91ciBvZiB0aGUg
ZHJpdmVyIHlldCBhZ2Fpbi4gSSBkb24ndCBwcmVmZXIgdGhlIHByb3Bvc2VkIHBhdGNoIGFzDQo+
IHRoZSB3YXkgZm9yd2FyZCBiZWNhdXNlIEkgdGhpbmsgaXQgaXMgYWJ1c2luZyB0aGUgbWVhbmlu
ZyBvZg0KPiBXRElPRl9FWFRFUk4xLiBJIHRoaW5rIHRoZSBjb25jZXB0IG5lZWRzIGlucHV0IGZy
b20gdGhlIHdhdGNoZG9nDQo+IG1haW50YWluZXJzLg0KPiANCg0KUHJldmlvdXNseSwgSSBtZWFu
dCB0aGF0IG9ubHkgaW1wbGVtZW50ICJDQVJEUkVTRVQgIiBhbmQgIm90aGVycyINCnJlc2V0IHR5
cGUgdG8gY29tcGxldGUgdGhlIGN1cnJlbnQgZHJpdmVyIGZvciAiQ0FSRFJFU0VUICIuDQpUaGUg
aW1wbGVtZW50YXRpb24gb2YgU1cgcmVzdGFydCBtZWNoYW5pc20gY2FuIGJlIHBvc3Rwb25lZCB0
byB0aGUNCm5leHQgbmV3IHBhdGNoIHNlcmllcy4NCg0KQnV0IG5vdywgSSB0aGluayBpdCB3aWxs
IGJlIGJldHRlciB0byBhZGQgYSBwYXRjaCBmb3IgY3JlYXRpbmcgYSBuZXcNCnJlc2V0IHJlYXNv
biwgZS5nLiwgV0RJT0ZfUkVCT09UIG9yIFdESU9GX1JFU1RBUlQsIGluIHdhdGNoZG9nLmgNCm9m
IHVhcGkuIENhbiBJIGluY2x1ZGUgdGhpcyBjaGFuZ2UsIGNyZWF0aW5nIGEgbmV3IHJlc2V0IHJl
YXNvbiwgaW4NCnRoaXMgcGF0Y2ggc2VyaWVzPyBPciwgc2hvdWxkIEkgY3JlYXRlIGFuIGV4dHJh
IG5ldyBwYXRjaCBzZXJpZXMgZm9yDQp0aGlzIHB1cnBvc2U/DQoNCj4gQW5kcmV3DQoNCkNoaW4t
VGluZw0K

