Return-Path: <linux-watchdog+bounces-2369-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFC89B4072
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 03:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F301C2187A
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 02:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D951DD556;
	Tue, 29 Oct 2024 02:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="TWSkmTAX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020088.outbound.protection.outlook.com [52.101.128.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC8EEEC5;
	Tue, 29 Oct 2024 02:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730169168; cv=fail; b=X7TxRDUHeOnPGlQX6tulwGuoxtduDvJqiApa3S2BTM1AQqhqcrgY4sDGBmeeX7LVpsUAxK2rzahkDKlfzt9kf4Wgnx9GdzjKTYCk+yWh1eu7Lc0zpuRAXM9bWiUMnOtzkavYwnu8Vwx97HDCi2uEpj5Y51EZx7vFcItH3nrFAgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730169168; c=relaxed/simple;
	bh=5JeOBF+XzrrYpbEFAmmx8snLaeQTTGRMH5vZAN4RClA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=URBIH12jAwyjeUUHxteFDumecL2hqEht4WgK5OfbvDoizGbuIGO/gnG2/4ge2RwALpOYZayzw+Kg8iVLgIJUM+gNwXGE8JCbF0fzWUHJE2twAxxOFBQTLS52xDQK6jT88RkUZvO0UVlmG4sBwQwvShRs814hreicl/EDBJRctaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=TWSkmTAX; arc=fail smtp.client-ip=52.101.128.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL8weCH5CNY91n06yLpqIFTS3peaR+YN/brS8biClOFqMMyB+aeTt7FuHZzRDoUXqJsPzEkuWLTO349DGCLD6p8sQG4y9QfLOdOVSC7M6ENYGNtgfVdS9zLr+WGVYH5e8Ogt0ZdWBWbXR83bTDN3iccRPc0Alu2nYTGnDwW0O6jc4RxD68bjnd/U6I8wcyhCxLDEQI0IRJco1k0kCpRLZW8l2tBATL8cWI/0Kh9PYd766SnghlKfBai4A2HPrz114JdJfLU9burprEiMq/DnKD05Lm5pWVia+FzYXuPLVqOCMBMvtOfVTbNeUMxKOYPxUef0f+tiHgTjQzSOdcZ5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JeOBF+XzrrYpbEFAmmx8snLaeQTTGRMH5vZAN4RClA=;
 b=wXnXuhalzig9hXIm89M6n/1Er8t3miYifri+XMEmi6jwzW1ZylOm4ZzO+8CupGsZpG9xI7pAbA1Z5sTDDWtz32/m2eT5rcML2oJzV4QAXPkNY1+oCDeXv+SxHPne6BqAFjcmQKAAHC5YMuoBz7l2yc7stV2F9I8LpZ5uWHgH6MDHEbR2mQE8h6I7Ug4/8QxxOFDcsur9Zd5+iQLMuD5DXTgxr9MTTfwVl4NkvKR29vXl9rBCHI/53J890FnjmHVOxO3Ui7KAG8Qarg3ycUdIvX2BN2Yi0tWpUGbALtgTGTIYdyetnSC65Y64+Z4ClTPeUCKel74zZ9PbUy6xntFv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JeOBF+XzrrYpbEFAmmx8snLaeQTTGRMH5vZAN4RClA=;
 b=TWSkmTAXCRpexqz+lRbM1S5fi53f4aS/a1rp8ubTI6UeTKIhP6iVsOKbec7mg/Gm4hxXV6tBwWYAKmjdbDwukVm1A0Q17lnbzGN8USO0zfSy4SU3OKITqVInhZF9cweFSm7L56w/Nf/2m1xZt0l9evxvLUBLY3C3rFsMQyxZ5eVFVQyQjwGl1xBgvOns8dv9iO5SQ5siEbsfEPQG6Sd1qbR4GqXfr0E4o8pa61t4Rj0rHDR/Hwv87ZCJgndZDWdcN0E1TAMfom57xNu3axzIwe/1IsD8fWwqh4sik1FuUlHyoGEM2hsZhbT8rDN3asPXlEErLdSOygMR8WWZ+HhFBA==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SEYPR06MB5301.apcprd06.prod.outlook.com (2603:1096:101:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.12; Tue, 29 Oct
 2024 02:32:39 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8114.013; Tue, 29 Oct 2024
 02:32:38 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "patrick@stwcx.xyz"
	<patrick@stwcx.xyz>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>
CC: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
	"Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
	"Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>, "DELPHINE_CHIU@wiwynn.com"
	<DELPHINE_CHIU@wiwynn.com>, BMC-SW <BMC-SW@aspeedtech.com>,
	"chnguyen@amperecomputing.com" <chnguyen@amperecomputing.com>
Subject: RE: [PATCH v2 1/3] ARM: dts: aspeed: Add WDT controller into alias
 field
Thread-Topic: [PATCH v2 1/3] ARM: dts: aspeed: Add WDT controller into alias
 field
Thread-Index: AQHbKOPYfWUSBJpvg0q+MQLJrT5VTLKc1+kAgAArETA=
Date: Tue, 29 Oct 2024 02:32:38 +0000
Message-ID:
 <TYZPR06MB5203A2F48CDDB1D80927021DB24B2@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241028024813.2416962-1-chin-ting_kuo@aspeedtech.com>
	 <20241028024813.2416962-2-chin-ting_kuo@aspeedtech.com>
 <0b51600b1308d64e362b771f1bf8adde2fa0fc19.camel@codeconstruct.com.au>
In-Reply-To:
 <0b51600b1308d64e362b771f1bf8adde2fa0fc19.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SEYPR06MB5301:EE_
x-ms-office365-filtering-correlation-id: 0699384e-f91f-4619-d210-08dcf7c1f4d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ri90M1ZMUmdRU0FidWJ1MTBXblVFU2JPWDZaWThaN09hNlJGTTJoajB1WHN1?=
 =?utf-8?B?V1RDZktFYnlKUjBqRHpwS00ya0hyMHN4V0JiZVZDL3hVVi9KOUVueXIrRGo4?=
 =?utf-8?B?RmJSb3cwWEh5SUIrYk5WTUJzMWVWSWhORHVRVG9ESXM0a3FCYWJvT3d6bTRO?=
 =?utf-8?B?c0FNR0h0Q1V3STAzRldCL0ltNHVqUmp0dWhNMDR4S2hYMGdEb3dQRWNjdnp6?=
 =?utf-8?B?Mkk1S3VaY0hVbVRCTHBoR1lFZkJFL3pJdzgzUXNST0hXQUdUanpaMTI3YUhE?=
 =?utf-8?B?bllBb3JNTjNWd0J4TGE4ZWlSd2pwQzhSeU5FNVI3NXV0M0psR1BHRHg0Smkr?=
 =?utf-8?B?bmphMHJjNUFKRXdSZ1l6QVdmZ3ZHSDdoSEdtRUlaMmR3aHhIeVdSZ0Fad3Vu?=
 =?utf-8?B?NktRYUgvLzZmOXpoNkNQYVJiQmRtTmFVM3hGSW8vRlF3RjdYajZBNFgySzNJ?=
 =?utf-8?B?ZTdFNWY5OXZBR1FBSkxsc0VhL0o1dWdVMHp5WFFFSzFLSGhSU1c3N0JiWUJi?=
 =?utf-8?B?aE5kMnJwa0NUMVZLT2hQL3QyUGxzaXh5WkhsWVJsdnBjNm9XNlRaQ1ZPeDNn?=
 =?utf-8?B?QzcwQ0l4L0FqbE9aTUpiV1BEZTdnblgxUElkeVRQdWNXc09GRGhrVlE1KzFy?=
 =?utf-8?B?QnlZRHJMbG9lQlBUczUzaXBwdWhSY084MGo1Mk1ncE9QUUY0NUFPN3lXclZF?=
 =?utf-8?B?WlpqYnZFSFQ5aXM0Z3RUck82UWFOaCtTNVNFWVFyRWQ2UlIxeGorS0pUcmFa?=
 =?utf-8?B?N1NUUytiQ3lzVko2T3B5d3l2YWZmUk5KZjh1OGYwZjhQUGJSWTJkNGpyd3dX?=
 =?utf-8?B?aDJ5M2lTdzZFaEFUNitkSGRjNDd6VU90ci9JNVl4YVdoTjBqN1ZQTm52RDBx?=
 =?utf-8?B?eXRpQTRabXhwNUtxbGNoNUFUOFJQNlpLdVptSjdGcHFySGxRRGVZempOUHVz?=
 =?utf-8?B?K05Sb3JuMnBhTHl0VWs2cDJ4MTBXVUpEaG1lK3FRRGRLbWwyajFDNXdFM09x?=
 =?utf-8?B?S1p0UlAwUUFwVFRaNUVqYzVPOE01RlJEcG1BeFpGSnlXK2tCQUREMFZSQXFm?=
 =?utf-8?B?bmZGUDhEK09TYVFPN2tWeEpJb1Y1aTExUExmTERaaEY0L2Z1dWtHdjVaRmw2?=
 =?utf-8?B?N005d3ZvaXFuTHRzWGdKUndWUkVUL0ZmVi9lcHVzbFBnOFN1K05UeXpLT0VM?=
 =?utf-8?B?VzZPQVFMVEl4aW00VGdmLy80YmJFZFk0UnJydTcwUVRSdmpwbHJoa08wcUxS?=
 =?utf-8?B?a2Z1eWNocjdxaDNxcHc5Mm1nUyt3azJkUmdwTFpNQzR3ZGxzbFRaWUx3WEMx?=
 =?utf-8?B?Z1NOTW9oU29sbzZEbi9JQThuWGdHdVZtZ1VpZzNRdnRZQ0FiZ1FtN2ZKS0tW?=
 =?utf-8?B?OGRIMTVaZ0g5VGhLQ053UFlhai9DME9LT3h1ck5kelExSVdaRk9BS3pNWmtO?=
 =?utf-8?B?NC9ySjd3SWRFd2k4WXcxYzByOFpRYlpnK3lPWVpsZmJ5b3NKQXcvc0VaTGpp?=
 =?utf-8?B?M3VMVzByWlJLZG5BWDVrWXRuQWg0UnpTRVpRdGdHNDQ3eUxOdi94R0hHSFVL?=
 =?utf-8?B?cVpVOElhdjVqNG8yRGJycTFiZmpQNHlXcjhUaUdZaWhhOWRHNFl5L0pEbWdN?=
 =?utf-8?B?ZGZieDAyVk13dktvTUZZNDJCb3ZtRGRPUTZCcnlvMkNuMmU1eGZnNmJFMzVT?=
 =?utf-8?B?TU9tNkFyY1NWbHQrVk1oR3E5Q3RWczRZUkRWdVllbXdUTm1PNURlUVNqN2dP?=
 =?utf-8?B?aVdheXBDNElMM2VQVTg2c1RRWUg2V2JWRldvVkRDc2l5RlpoRllUc3R4NVF4?=
 =?utf-8?B?aFljUEFkQjRIYmxEa3ZIYWVrZ1dQTTZjZjA2Y0VUbmgwK2hxekNmL3dNa0Iy?=
 =?utf-8?Q?+oipgiivgwsQh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkN6M2FLWWErZTk1Zis5SEh2YytmaTJlZ0MwU2FPcndRazJKc0lYMGtRaUpC?=
 =?utf-8?B?ZjhRR2Q3L0ZieG9jRmRSZUFZSjBKejhzOHNld0NOQm9JVnB6U3hLMDhEckho?=
 =?utf-8?B?bjlyU0lOTktpWXlNNkhwM0wycldNM005K2RGaXNSVUNHbER6NlVzRTFsWmxF?=
 =?utf-8?B?emFNREoyRHNlbVlpUzMrVjQydVFUbFplSHFNcVhMZDdCblY2VjhrWkw5cWQ1?=
 =?utf-8?B?b3RObHdnLzhveDVsa1BPNDdVUHpuOUFPRm1kWHgreDh5OG1wOEtCWXJoS01s?=
 =?utf-8?B?a2NLSEJrUWlyN0QxV1gwaGtlMnNDL0VZZTF0cm5DQ09GVzR4YnNxNEpZUkdW?=
 =?utf-8?B?UDh5cEcySmIyMHY5S2Nsa1g3S0R1bVA2R3BxZ3FnbmZKUm8rYUk2K0FoMk52?=
 =?utf-8?B?aWl0ZGNxd0F2Q00xTWovZXhZeFdscW9sK2ZGc2J3ODd0aVpDUHpsY0x1eTgz?=
 =?utf-8?B?UklIQXZNd3M0ajdidmNTNVVJYThYU2w3Z0lzalJsMHRKM2o5dmZlQUErSlVq?=
 =?utf-8?B?by9qcEx6eDNCWW5TRlo5c3NEakljSnBLQk1uQzhxRTA0a1N1SXJWY1J0Rnk5?=
 =?utf-8?B?STJZcDZyY1lkWHBQMEduZUZ2RGM0a0pQdFkvd2xyMHlEK2dBdmJiZ2FLbHJM?=
 =?utf-8?B?WHpYRis5TndEbHZGS0pwRXREM05SdFBLajZsSlUzbFlyeWxrZmdac3daOHQ0?=
 =?utf-8?B?TmlVSWVJU0JINFYzUFhta2EyOWh1QzBMdXRjUk1hMVlwTTBXZnkyNzhXbDZt?=
 =?utf-8?B?U2dJVUhjd3lUb09sbFc4bWUxcXFkZnZuTHpZVmNVeG0yTDFZb3ZLZmdlalB3?=
 =?utf-8?B?bVF2N3ppOTNsRldtSTJQQklsVzcrZkI0M2poSUY0S0UvVmNWeDVZRk9SQmxj?=
 =?utf-8?B?VFRTTDVLeEJGdW4yVGR0aW5oTFBsakcwUnNZSWFrNC9IRkE3Y05Dd3B4S2JC?=
 =?utf-8?B?QlJjUHBKYWZBVlJ4QmxjM2hVVEZYNUU1bnA1VUkxR0llOWQzTm9mem42RUdN?=
 =?utf-8?B?eE83WEgwK1lEWWZSdmIxTVloaU9mVzFZaHhnUDBMQXhkcGlsSEtMR1ZtWHBD?=
 =?utf-8?B?andVODhCMU9RQURpUjQ2WTVpZTJkek5QZWdtalEzTlJZTHl2bEJjc0lNZTNu?=
 =?utf-8?B?K3ZPdmVGNEZwWmhsQjMzTGZGQUl0QUlua2pIUVF0OUFBWEJ5eW1PWnpLMzBH?=
 =?utf-8?B?Y2FJK0M3Q0J2Um9UYUZVZm00YStjV05ib0RyK0Yxa0RwZGFhS1B4V2g3YzBj?=
 =?utf-8?B?NXgzbk91TTVNWndnSGRBYzRGSnlDQ0RsMFhsb1c2M0lNOFhmUW1QRFlQVEs0?=
 =?utf-8?B?U1dFZ1F6Y1JOMy9mbHp5NWh2RjNGRVVJSXlxOC9FZUVScDhSeTU4aEVHa3Fs?=
 =?utf-8?B?OU1WYlNJTEhZMElTVE51MFZqc0htRGJaNE5JRGc5bDVkc1ZzWkxCeWdqSCsz?=
 =?utf-8?B?d3dpRU5UelBKTE1CVUM0UFRaaXJuUDF4QWZMMnpSTXRhRDlRKzgrbnQxVkt6?=
 =?utf-8?B?dkN1Q2JZUVlVRUtzV0pzSGhFekNnM0JyaTB1bmZxVi9lZDArU3ZKYzRiSjhE?=
 =?utf-8?B?ZlhackJQZjZqYzkvR2NVOXFpSXdvWXNZd1ZmaUMrTVpQYWE1OERUN1RoSk9H?=
 =?utf-8?B?Y2MvcHUvK3FnU0hNd0pSaTFDS3JiV0NvSzhUYlFRbmZmampBK2xlSE91SmRW?=
 =?utf-8?B?cUt2YTdLZ1N5akt0VFZjTDU0RWFENTZrbGdua0piSlVzZ3p5aTB2N09xY0xh?=
 =?utf-8?B?V0Fra1lMZE9HT0V2ckNWWE1WZGl6aGZ5NE4wQ3dCZk1rVm56T0E0aWhQVENp?=
 =?utf-8?B?STdNMjBNOGFnSkdVbmhCOTJVc2k2ZGhteWtOeEFLSEZVdDlhVU1vOTZSMVAx?=
 =?utf-8?B?TU5xV2E0bXJPaUFhbHZBNE5GUkpORkhqNVd6T1ZPcFlSTnEwRzRpKzNzWXZv?=
 =?utf-8?B?V0RsbVFTQjlTRHB5S3J2U1NZUzM1OXBBZ3Mva1h0cmZIWjZCcjB6QVQ3cHpX?=
 =?utf-8?B?OWk1bDNxSHZaTzFMWVppZm9FRXd3MDkzbHd6ekg0QWVzZTZwQjR0M3ZQNFlN?=
 =?utf-8?B?ZHcvWGdqTVVDbHNPL2QxVjd1UEwxK05TNUdHaXpmWlIrZkg1RjR1eGozNy9w?=
 =?utf-8?B?WTU5L2NVQ2pFVGJPM2ZHYVJHUzIvRnN4ZGZKQ3BrSkZrTm52UWpWVGlQWHpN?=
 =?utf-8?B?QXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0699384e-f91f-4619-d210-08dcf7c1f4d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 02:32:38.7901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RKLgmy1L5rJjzAQDIYZkGm7Tm1PEegUJ6218P/fa1ioDimpW5sSCNDasdIKqNh0I/1bPGcR+A7wAVtq1CB8dMdUz1wF8Irffb7VdySdLiQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5301

SGkgQW5kcmV3LA0KDQpUaGFua3MgZm9yIHRoZSBjaGVjay4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3Qu
Y29tLmF1Pg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI5LCAyMDI0IDc6NTUgQU0NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIEFSTTogZHRzOiBhc3BlZWQ6IEFkZCBXRFQgY29udHJv
bGxlciBpbnRvIGFsaWFzDQo+IGZpZWxkDQo+IA0KPiBPbiBNb24sIDIwMjQtMTAtMjggYXQgMTA6
NDggKzA4MDAsIENoaW4tVGluZyBLdW8gd3JvdGU6DQo+ID4gQWRkIFdEVCBjb250cm9sbGVyIGlu
dG8gYWxpYXMgZmllbGQuIEFmdGVyIHRoYXQsIFdEVCBpbmRleCwgdXNlZCB0bw0KPiA+IGRpc3Rp
bmd1aXNoIGRpZmZlcmVudCBXRFQgY29udHJvbGxlcnMgaW4gdGhlIGRyaXZlciwgY2FuIGJlIGdv
dHRlbiBieQ0KPiA+IHVzaW5nIG9mX2FsaWFzX2dldF9pZCBkdHMgQVBJLg0KPiANCj4gSSBmZWVs
IGl0IHdvdWxkIGJlIGxlc3MgYnJpdHRsZSBpZiB3ZSBlbmNvZGUgdGhlIG1hcHBpbmcgaW4gdGhl
IGRyaXZlcj8NCj4gQmFzZWQgb24gcmVnIHRoZSBkcml2ZXIgY2FuIGRlcml2ZSB0aGUgd2F0Y2hk
b2cgaW5kZXguIFRoYXQgd2F5IHRoZXJlJ3Mgbm8NCj4gY29uc3RyYWludCBvbiBob3cgdGhlIHBs
YXRmb3JtIGFyY2hpdGVjdCBhcnJhbmdlcyB0aGUgYWxpYXNlcyBmb3IgdGhlDQo+IHdhdGNoZG9n
cyAoaWYgdGhleSBkZWZpbmUgdGhlbSBhdCBhbGwpLg0KPiANCg0KSXQgaXMgYWxzbyBhIGZlYXNp
YmxlIGFwcHJvYWNoLiBJdCB3aWxsIGJlIGNoYW5nZWQgaW4gdGhlIG5leHQgcGF0Y2ggdmVyc2lv
bi4NCg0KPiBBbmRyZXcNCg0KQ2hpbi1UaW5nDQo=

