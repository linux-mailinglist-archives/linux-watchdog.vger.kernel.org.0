Return-Path: <linux-watchdog+bounces-3183-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B7A76497
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Mar 2025 12:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF8A167629
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Mar 2025 10:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235771DE3A8;
	Mon, 31 Mar 2025 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e7lAF4ZL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228801C84AA;
	Mon, 31 Mar 2025 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418555; cv=fail; b=X6JKb1gCvDphoDCDdTZZldFdxusIyy/4eROQU+w64lwK+h5I8IBBEp1ZLBE5wJ7uBoUmdeTsv5Jc8cKcuPFtV13oaXRNhlzE5Y5NSwZOVBG9qs2RLXwh7XinRm+diaDO0CqJ7+i4Fe0bQ25QkTmNIDNlgLmB1rZAGdC3Fqh0xQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418555; c=relaxed/simple;
	bh=fjGNCXTsihS+4ID+VPJb983MAB/ZyA+YiowYERS8J1Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HxEBqsqYt2yWjK9sd7Z/CPu3ajE873ox1iBdywWY047FWKr3dYwWbVTzujEcw4HZG0immgEgi4ymbZf8wRUOCswnuF7fvXPvXkIzCMZMc3wUfGAsPEfJbymJLKn57hzEvlOgBvFAtiRtixhxUls9gfe6s1OBRu5a9/mjMAH4J7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e7lAF4ZL; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL5unRF7OTgfpwmfwTWkpFy/1lBn1D1eSdLS9F0d1lYmvLfqK3ZYHL8K2mx83vR31oIqDJGe0YzfBk9MOeGgO6qo9WPlU/tBrNilFjIhGpzSOBzF6A40VzJCGr6KXpiBLj9/Oqp6Njl84HlxGnaA3wDWuM5p+uPmWQcDWPaUKTRfB4BeoGfLt5XLt+hrXaot2YBsOnO2kDLdvZr8x+JsWRYo0mAJqGTAOFfWNtLMRQBVFL6GgIooaXJg4m0x/BYkXTUBxk/9X5pAWA8vBrZnYDSnEjp0RxwYfA0Q5nFI+btJFB4xKa4wL4tSFG0yPtsp+OQpiVYI7tCfwrZAp89dgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ko23p1A9Pq4hh30mGMMUOycci3gR9lw3S9ibUl/+Hk=;
 b=jFbcAgowlFjkgMQJQyywgJDDt7ubC9Sugg3VgVvR8zut1aifiq/oi9WMHym1wf8toKXoDdjpuSA8fkiywr/arex19ZSoQe8gFZHiqt+XmHzywWYXmSTUIRXtMJFKDpE5bguM5lxPnmLZqAVoVzEIFsnDmnjhJDxjiCPD9dtg0Cj6JPrieTuMl6okQGSivd5xHEgvZj03HKb3qQCyn6S5PcbX3ZY4IilzEScM7Xj1duZaNCj34RIlB5wIqGCSDeN3JQgZQgQ+HvN/SOgyep9lilDKOmPWYfgB2GMCTqp6B6RBw9mCLzY4ItLaPHcIFNn0WjlHm2h/RKWspqGOJkTRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ko23p1A9Pq4hh30mGMMUOycci3gR9lw3S9ibUl/+Hk=;
 b=e7lAF4ZLWgNDQuQd7C9PwAc7vJ9SVnn7d72mzpuK0ynBIItuvV3eDRcDOaX4Qx13/PUybp1ftsEMDDO87nfJDkAay7KIUqw3wOieDgnsVIP4moqXbJIBSrV4469qgD/6zljlQIpbsi4Fvy/capFAB3/3z4O6cAMk/pNjcAn3w9d7s4uqDyQStbuwWpeWijiwupIqWZlA4gvcuK5mSqi4n1IiviswpeMaGWrdzeOqzpa/rd0As4h99tOXvtiGC8zOSDwbYR3O3zwDmoy3a2yL/JcwOWos3wO79YZEtuTK8nPCDId7exrMqiTLtKfD4VlZzMUfe0jtTH7YwbfwlT3JJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by GVXPR04MB10491.eurprd04.prod.outlook.com (2603:10a6:150:1eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 10:55:49 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 10:55:49 +0000
Message-ID: <4267a636-d858-55f0-01fe-c5d7265ed3c6@oss.nxp.com>
Date: Mon, 31 Mar 2025 13:55:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::16) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|GVXPR04MB10491:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a114d8-1421-41eb-170b-08dd704298af
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmFXdmo2bys0N3BORk5zNWsxajV2UVUrMjBhU2RPK3E4dENMYWV4NVRRbEov?=
 =?utf-8?B?dHNPa0dIL1dCeWNTamo5bVUrTkJsdEpaYlQwTmsrTWU0Ty85TytpTms3NmZH?=
 =?utf-8?B?WEs2Y0RiV2ttQyt1ZnpqNnhieHZJY3hGU1FnUytHSWxSelFTb1dKcEo1eUh0?=
 =?utf-8?B?S2VZSE5TNUNxQlVwRGRKOFQ2QzdWU1g5eHd5bVZSZHJNYnIzWG9xUmJsT21X?=
 =?utf-8?B?eXBnOGttdUdKemhtd0ltWVBVcGdtNlIyRk5iVlBUdGlyWC9FU1BoK2dERUxl?=
 =?utf-8?B?SDlVeDg4Y1dNWCtyTHNtMVJjMEpkbHhHcXdiNVNqNHUvVU12VkJCVGNOTGFi?=
 =?utf-8?B?RUY0cWFmZE1lRmIvRGJtaERTQjBxb3IvRGM0Y3hWblEvT25XOFpOSVBtTW1j?=
 =?utf-8?B?NXY4dHF5VmpOU0pieTkyRTdEZlp5TnlTQ1hWcVArVkZLRDJqM0xqV1ZrQ05t?=
 =?utf-8?B?aHNMaTdYTHd3L3U5ZjhZTVJSRXJWN2RJZnZIYVBFWHFJSUtDelc4R3FHdHlY?=
 =?utf-8?B?eSttWmNmTHR0a1VUM2FnTEJkUkMvRmx5SjBYRE5XMWo3RTZwQTE3azlaS3Nq?=
 =?utf-8?B?YUczT0VoN1NIWTc4N0FpZnorVFlaMENpTUdHOUpXN1lVdHRDRGtWUlp5ZThX?=
 =?utf-8?B?UUhhY2MzVG5LMk55cVVCTlBXSlp6M1A2RTdiMVNRNHNvR3Rpd3RtZHJ3VVBq?=
 =?utf-8?B?b0NjWlp3RUVsaVZqQnNTVk5QRlU1dkJibGJPbDZMenJ6TVN4RXFHSHY3c0JX?=
 =?utf-8?B?em01c2pYQWRBQU96aVlvSVlyY2l5cHV3S2craDJIbHJoTjdmRkE1MjRoOG10?=
 =?utf-8?B?a3pyOVJHZnYwOUdXQ1NMVjRtWmd6RGV2ZmRZRWRnZlUyS1Y0dkVkVGFKM3JR?=
 =?utf-8?B?YU5sYkZPeWx1UDJUYXc2SThTbm55QllXdEhYUHAxNWV4b0pnZnVIYkloZGQx?=
 =?utf-8?B?YjZCcFZ2M1hZc2tjQzFNVnF1M2o3KzRxQyt6ejdhR0tORXptdHNzY0s4NmhU?=
 =?utf-8?B?VmFVRFdBci9XTHlPMCs1cEZiN3I1REtVNzBib2IyNjFjbUV6L2hsWjl6MCt0?=
 =?utf-8?B?eTU3MnRWaVRGYTNHY281V2ZKK210M1VKSEtwMW1XZ3g1YmxmM083MmFGa0Vh?=
 =?utf-8?B?NXNvZmVmMEdmRXk2eUJwRnM1SkhrazhZRkJDSExIUUg3S0tDczFoLzIxYzhJ?=
 =?utf-8?B?VGFaWmZYUUdEODNLcHVsazNQUldndnpHSm5xd0FHTkNEekwrSkJKTkFUMGdz?=
 =?utf-8?B?dGFTZkJLaWtXUTFuNDh4ZU5YaHRLMFRaZkNXYW9xMlVmbStkRTFVdm0zNXIr?=
 =?utf-8?B?U2syVjRaeWJ3QlpqdjNnT09Na0pBdlQybmc1REF6ZCtiTnBURi9zamNoUzc2?=
 =?utf-8?B?cnFKQTZJZTRTd01XK2pEc1FxOE5ydG9kaEFxUHIvbEN6K0pkNTVSOUVLS0Vm?=
 =?utf-8?B?R3ozTXFyRkVQbVhRZ3JRNmdVQ0FxVFJHR0k4cGs0YVJBUHRVYTRUVlQ5clJr?=
 =?utf-8?B?YkRuUTU3ZTZ6bm1YZjA5dldmdU9wV3FPWFd5YTErUkFjbXNrcUtGT0s2YzE5?=
 =?utf-8?B?Sm9BMENzMlpaQmhKbGFwN1RCQUlBWVdVdVVET1VMakJ6b2JkZEVLaTdCWVl6?=
 =?utf-8?B?T3gxc2crTnovUTJ0REE4Q3BRWEZBZ0NVcEpIcHdQRmxjMERFRk5BNTIzeFRa?=
 =?utf-8?B?Q0d0Y1YrZ3RLZzFaNkYyVWRQakxWSDlySWR4Tld3YTJ5MWYveUkxdTZhZnJu?=
 =?utf-8?B?WVJPdGJOWjltaVZQOHBQbktCcXR2K3JmZWlFOGpqeGp5MjQweGlkMXdicXVQ?=
 =?utf-8?B?TEErcUNJdXZoL3pGeTBxdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M096dHZuN1k2djUwV1RhaExXL0hZN3BnZ3AvaThWWklJRUJZOGE5NHh4NUZx?=
 =?utf-8?B?ZjFLalp6S2R3QUlXc2ozazIxWHdRbzdLSGx4QVZMQ3RBQVFhMkxLTloxT1Az?=
 =?utf-8?B?ajlqRi9yOGZIOGJUZnRVVWNXTXROUEs3bGgvRnh0R3RmeXNHWVhVWklKdFFK?=
 =?utf-8?B?UWZoeTh2dFI5eDhkZDh6UEV4bklWakpPeWJNdW1TL3lRd3NSeHh5MnJLK2tl?=
 =?utf-8?B?dmJJaEdEVzQwUWt2SmttWmpOYmVTQXd5cSt5dkhjSzd5Q0FiU0hUNkc2Z091?=
 =?utf-8?B?eGpoc3g5YzlVV2ZYZGxhT1lmbmZ5czlBRmVMTGlPZm1vNGZyUzhYZjkrRWFH?=
 =?utf-8?B?bkN0NWdEOGhQQ00rVmJPOEloWTZIemhhV3BqNXpTZ1BvLzRTZEhGUkpyV0NG?=
 =?utf-8?B?dTAyNkRZU2pvWFR2bC9tVm10K1F3bnk5V0g2UHBMTkVsNWM2SVNRTS9BRUlE?=
 =?utf-8?B?VDZwaG1Cc3c5TXRBa1V4ZTB1cDJMMEV2M1RPbzJ0SnF0Z3NwenFxckNYSnk0?=
 =?utf-8?B?Z1hRVnJ6My9EOUdVTkUrWVNJT2QrSDZ1NmZZQUNkazNraEFES3JnVWxib08v?=
 =?utf-8?B?TExEbzd4bEszWk9hNEpyclFVUVpaemVxdC90S1UzMGdzS0E1d0d6QkdWRHFD?=
 =?utf-8?B?UVNaUkJncURlNk1OVllzbldqaDRsc3lJZzZGQW4wbEVMRUF1cUUyQXUvYW1q?=
 =?utf-8?B?b3RkM3hKd2hDRnR0T1Uya0JoWDlNZlU4MmlvaVlOOW0xZDM1OWVDcXQ4QzRV?=
 =?utf-8?B?ZGJIVzNNbk52RUhRU1l4ajQyc2tSczZnTUozd01CY1FaWkIzY1FENkgyZ2VY?=
 =?utf-8?B?WWljTm1uZkV6OHhIbFpSalMweVhRRW4vbk94Z0VuWmhJQm12eGRMU2wrTEl0?=
 =?utf-8?B?cU82VkVKYkNKZk9ocEZpM3p4VzFxQThzYXhhNy9Fc0lKVTdmT2t1UjNsY2xB?=
 =?utf-8?B?dDNxMDc3aEZMSFliekhMMnZoRjE5b1k1d1FaRmppelIya3JqRWU2ZnM0V0ly?=
 =?utf-8?B?RGxoRlVDRDF2Nm96eFpUOWpRaG1zd2JtNnBQdEQ3VEhYb2g4RVZZZW1qaUxF?=
 =?utf-8?B?SlphM0ZGWmRqcXZ4YWZpZFVXOG80aFQwTCtkTm5yOGtkOVJOVjhGN3pZeWEr?=
 =?utf-8?B?L3NKYXNmemxkZFRrU1VOa3dweXQwdWVoK1FVR3VwVktzeWJqTHNWYWZkYjJ6?=
 =?utf-8?B?ZHRzbkFQY29oSG9Ib0tGZEFrNmZobHg1RS9Ea3B3OXFQOG8rZEFTMDQ2dFJS?=
 =?utf-8?B?clpBczUvcWgxL09LTW15OFkwdnZNZmdRZEJ2ZXdVNFUycVF4Z1RwajA2d0I2?=
 =?utf-8?B?MFRWdmFKMHpXY0lsVXF0cjkrUjdNMmd3RjBPMU1nUFZYQldvTHpqZjdiMjZo?=
 =?utf-8?B?dEhKTlBDVW9rdFdXaFQxbmdsSzJBLzJ2dUJORnpDUHB5N3FKcHpUL0ZGcG02?=
 =?utf-8?B?N1VCK25ONXpkaEhFRjlUUEpiaEJ6TkREcnVINDk4blBNakQ1NmJLT1ZBa2dQ?=
 =?utf-8?B?bmN1RWo1SVBJWHh4Y2tKbGFIUHZCT3hLUVpJc09INlRCSzhnSEliOGhRallC?=
 =?utf-8?B?TDF4RUFXR1lVSm5jVzBseHR5di9Wdnpaa1dHQXkvQnlURGo4RzM4UWl1ZG1j?=
 =?utf-8?B?MW1aQnQvQzVhZDlXYmlSZDF0eTdsS1ArK0svSTZtVUZxbG9KTHR2THdpYWpO?=
 =?utf-8?B?SWNJL1FQOTd3cm9TOTZRblMrVjdiNGE3NG9Yb2ZlbUh2clhlcXIzbUFFRGJY?=
 =?utf-8?B?WjNzMmpTbU9zYTRpNXQ2KzViYUhudHNKS0s2c1hkb0xQYnNuR0VsOUFQUGZM?=
 =?utf-8?B?ZVhvQ3VvVEVncm5zZmZXeXpSMXB3bUptLzRLdGx1ZXhhY3hZVTUwQ0dtTVpI?=
 =?utf-8?B?WlMxREJ3VDJlczc1RzNVV2xjVXNoT25DbklVYUJLNHFzaWw0ckgrckI5V3hi?=
 =?utf-8?B?TkxxM2hhTHYwOTNJdTlGeGcrTVhqSlhncnkwSVhYNnZQelNuWVBrR1JIMzBX?=
 =?utf-8?B?Z21mTk9rU01HbXFpME5vVFFOS0RWbW1FdjFxbmxLc2hPeDU0ZFpTQnk2Q2hM?=
 =?utf-8?B?NHNNd1BTamd2WVZMTnUzTXZRbU8weGg2SW5lRDdCajFQblVXTHJaRGNLZzA4?=
 =?utf-8?B?dlZRTHpOZXNxTjA1bkVQa3NQUjFRNCtXT0s3NlFIMk9acWJRSXlxelJ4dEpx?=
 =?utf-8?Q?pHkvaB3ZY1bcSWmCr0VKTCc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a114d8-1421-41eb-170b-08dd704298af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:55:49.0416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJq8K3+nndk+MuZc096vK4eK2WwTvuRfMVwuq6tXQKrQcMmTo0NoLgteiWITxWV/peEZPztAVVnT3OmV4ItXPzgDcxUKU0teklA470NSld0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10491

On 3/28/2025 5:15 PM, Daniel Lezcano wrote:
> Describe the Software Watchdog Timer available on the S32G platforms.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/watchdog/nxp,s32g-wdt.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
> new file mode 100644
> index 000000000000..06ead743d5c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/nxp,s32g-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Software Watchdog Timer
> +
> +maintainers:
> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
> +
> +description:
> +  The System Timer Module supports commonly required system and
> +  application software timing functions. STM includes a 32-bit
> +  count-up timer and four 32-bit compare channels with a separate
> +  interrupt source for each channel. The timer is driven by the STM
> +

Please update the description, as this one refers to STM instead of SWT.

-- 
Regards,
Ghennadi


