Return-Path: <linux-watchdog+bounces-3215-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4562CA7D331
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 06:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D27A83AA831
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 04:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3FD221DBC;
	Mon,  7 Apr 2025 04:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AE2mhB+g"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013043.outbound.protection.outlook.com [52.101.67.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4168F224F6;
	Mon,  7 Apr 2025 04:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001601; cv=fail; b=URbz4uK6jIr2AB2/pfSH6/M8y5FOGg4gVq00PKNH+ZHnkqZvXTZc7cOr7uEC9QT8opZReA34zZzx9IB2so5oKDS/gpmcyLpmyxCMLA6cVQvGYWHMM2kHYE9Ge6D/3+k29wUGdk98LCByAjEkyIHiQ44BexEipPqb132j/gOjffE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001601; c=relaxed/simple;
	bh=AvJL2Sj62NzA3zHjwwpFn0ZRInPBZ35uz/h4KCbpx1c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eH7SbwcECJrTjLalesLHY462ouNn8Mu7xMh8OSJM4SYJ00j80cDAw3XiIVtOlxdu5dtE8sEL3dV10xi/3get6kfEspH5QzJ1UGBVYOe2u2tt+0tAdgGZENRwW/EYu1qV1NZfvSjL2kTNQMmx/kphkJJnVVQhQ25ZzWbmLp/sVDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AE2mhB+g; arc=fail smtp.client-ip=52.101.67.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=We23ImnrekwmHUmFw5Urfb08eoOlavo0ZI/mUE+RN8rng2eklRCnUE4d37ELQ8WBe4pCLyGMbzjqsAi/W+zZTi8PJdg2VXrSQIxr7jWHUj7GG7FPe4W7Ue3ask4m2vry3VrU28Bki5cFWskYkZ8uYkz8xEEbllhA9u0k5FZyPCXz1BFNhVmwfxA5uvTO/CmwLJHggWoEFg1cQDrtqqaV60aoH77fCrpVA4g2OlisfZYRRxvgaXgmvvFFjYAdUL+b6kGK5pR5ugXnFP/D2aMrnzPyO3dSnuWLXfX58lEfmD9la+/5omKoP/atpi+NmphhJuN4Ds07yoHnAVGTqEidJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJUkomkqJ4r/jYJWWNCVi6rBdFINFm+PZGG1ftdIVLY=;
 b=bBDc9Yk0G55sSrM9N4YH/OVNaw1AfvsrEmNF8GIZneLePgJu8S5NLbL8pQEskCUt1KtEPqs2Z4+ip+2aNYTU1RZ5FL23vEAWBqdDGnfzsc/Fkl61lPhCPbU+/S0C0FZrG2fxmIrIw1+z/RzzjEuvLB/uNxvfCLedu1bFK+DuKWTLOzVkLYlCpgKEm8UHpx8FB9EHaMnbykzCN/k9Hr9PSBrylbbTDXiNu5BhLL4HTY4Lz9liH8ASSDCDqvUmCNP4bG2ulJgq8OErNu5rx4a38SatMynr8YFPxabFBhWZBCfdiDw8I9Zv+iSudIKip9cJPXbL/GuBRQnrXwd3e8fVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJUkomkqJ4r/jYJWWNCVi6rBdFINFm+PZGG1ftdIVLY=;
 b=AE2mhB+g4obXV3hG26TTxQrYDOOZK73j+7u7bi7F3khyHIHF8uYgjlR00eRm3ZtMomPbbpqhKo+5ellh0LiHouTbOmARY6OIT33RlY3R00sukd01TVD9Utq1Ccq8KgGk0DNCzAOsvBOPQgHwBypQGPtguyNZjCRYrjNgv8GEdL7rAZrTB6R7Wl3V+8cHZsnGacxsce6RYmJNWXyyhPng/i/ndZrPNS4/FiVfc8mllG5+9dNofqnkFUn6fZQV+XGRNT6v0sULlfo9M0yPPdMRDjnZQqYc/MtS7Z4ygLfNcl2VFjyDaCK47FEr8abmHvtM4SyJSR597v9FnjgMWCGsCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by PAXPR04MB8126.eurprd04.prod.outlook.com (2603:10a6:102:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 04:53:15 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%2]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 04:53:15 +0000
Message-ID: <abbebdd6-a097-1442-70c7-d5b765568669@oss.nxp.com>
Date: Mon, 7 Apr 2025 07:53:11 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
 <64b6d599-fe67-586a-e4b0-73d9b73499de@oss.nxp.com>
 <c570c99d-53f5-4f77-a730-42e5a2016dc5@linaro.org>
 <93d83df2-d3bc-e32d-70a6-158571504275@oss.nxp.com>
 <60132403-d849-47a7-a11c-e829ffefc7a9@linaro.org>
Content-Language: en-US
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <60132403-d849-47a7-a11c-e829ffefc7a9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0015.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::20) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|PAXPR04MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: fade5ce0-59f0-4554-7a17-08dd75901b5b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDV6YmdkRnlYQjB0cUhqbmhYZGpoaUhjVVBpaXZKWGRFSmI3YlRxTmh0V1RY?=
 =?utf-8?B?VjE3UWwydHI2MG8xOWVDU0VKS0JLNk1EYkk3YnNwTUg5MUNCVWJVSkh4TTUy?=
 =?utf-8?B?a21ULzA2enF0M2NUK2tzYlBaSkpmYS9tOW9TbzlCOUQ5WmR1R3MzSE9YdHRj?=
 =?utf-8?B?MFUvTFNKaURGUmM4WDdkR3d6UHQxejF5eTk0R1I2REdmd2l4NUw1OWRGSzRC?=
 =?utf-8?B?aklEV0NuMmlIYU9yc2ExK21LMzJxVnkyR1JwTzFscllmWW1VUkFUaklIdjdj?=
 =?utf-8?B?NmQ2dVd4YTNhaEp3MjBmenNuNWt1RXM1WWZaOG15VGFPQVBKdHVzNVdqdEZQ?=
 =?utf-8?B?ZWVweU1BTjl3Tk9hU2hVclBUZlF5NUs0ZzlIMkRjTkY3dHR3b0t0NEJwSEVH?=
 =?utf-8?B?bjhVN3orWm9NVTRaTFVQUy9RUm1ZejdDbzMzNU5iZzBqVlRrVjlDV2pSR3I2?=
 =?utf-8?B?T1pnSDdDdHhkY0tzYndoUVBTRlhMWDErMCs2eHVRSWJhZ0RJMFVGMnhqUXRt?=
 =?utf-8?B?Ky9UZGs1cHpuMm5XZG1McGhnM2x3OVpkbnBEdkJRSDRYTnVHU2V0Zm5NZGhh?=
 =?utf-8?B?NGlyQmFsKzV4U2h2MWRXanViZkxpUk9GRWJHWUpSbHlBQXBHTkl0T3BjWDE0?=
 =?utf-8?B?R0NtQkhzZHVKRVZLME9HNjJmYWcvWGV2VTI3TDVHbzZ4NCtsWUt1ZWZzV3Zr?=
 =?utf-8?B?OTlMay9CcXJGNG4xMVFmQktyQUZPcDQwamxpa3lsMVZHWDM1MVhvQVBkbHNH?=
 =?utf-8?B?MVFLSTMrcm5jdGNzR25CTkVhanJDdS95TytBOXdlcnEvL2N4azV4Rm5mdlZR?=
 =?utf-8?B?cVI2a2dBaWJYWTd6YlluUWh0cmMrZGExbFFFQy9jUzVON0Nra0phN0RmYXRH?=
 =?utf-8?B?T2ZtS3dTdW11Zit3RG5sZzR1bEZJaWpBL1UrUDBwdGkxbkpteEc5U2hjc2hv?=
 =?utf-8?B?d1ByYjgxaHUvS09GeSs2eTVYak1wY3B2VVVIc3pZS3dJcXp5eWVEcXl2NkZK?=
 =?utf-8?B?cUtRWWtQcWRramFGaWZwM3lTVWQ4QWVyR2tBdHVUeHNOdDhBaGdtU1Z5aTBy?=
 =?utf-8?B?K0o5b2tVSU5Ualo3T1E5VDRnNjhIRnFvQ0ltQllrVFdnWHNEVlljUHpXWUJQ?=
 =?utf-8?B?NEM3R1l0N2M0RlZJVEFyMVdCS1pGOU9FL1A2cWxrN1dkVlI1bFlVaE9qWVdE?=
 =?utf-8?B?SmxhTGJWbU9PSVQrcUNzelFlNDVBeVpFc3JCbUhuKzEvbThMN3QwT1NNS0xu?=
 =?utf-8?B?cVRBOXhHaTlOUGV6K2xYK2c4YWVLNGVFalQ5dFVVNFkzREZSQnk4MmpETk5z?=
 =?utf-8?B?dXRxeFRFSVVWYkJRR2Jyc2hDQm9RcVZEYUJKQTFueXcwanJxRmR2UnAzcGxq?=
 =?utf-8?B?Yk5yRkcyazlTckwrdk1ERnpvUnVFUjdmSVFCQlB3dFl6MVM1UUxldjE3L0lG?=
 =?utf-8?B?NFZYamxIYlBnWnpCVmc2cTNrZUtUZzBDYXRocWc1V0IwTnZCRkUvdll0NzZZ?=
 =?utf-8?B?cUhCREQ3V2VQZ3VtdlA5SnhJcFMrcW9lVVlsQ3B0VGFuT0tiRjYxRkxwRTVn?=
 =?utf-8?B?Q3Q1ZTlzeThjRk1rcUEwU0MrRVh5Z1VpVlZ2azFNejI1RlEyaFZLdkpLOGcr?=
 =?utf-8?B?eXVsNGt4cDFQNGI3SWFCUHJ0MXhtUWEyVmRUUDVMRzllOEtkeCtEYlMyYy9X?=
 =?utf-8?B?azBaZ1hpYktGS2ZCNVgzR0RHVTgxNyttZVo4YXlRWWtuTkJrOVBjRno2Q2h4?=
 =?utf-8?B?SlNqQUlMc2ZjOEc2R2NoWnQyREx2Vmo3NTczYU55NmNjVFZzaE03b3pqb0Fl?=
 =?utf-8?B?T1ZyZG15YWxsTVQxNzh3ODczcVc1QUpkMHJQdmVReWo2SmE0V1h0cmd2Tm9x?=
 =?utf-8?Q?MKS2tQncGZEyq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3VhTTBVVzUrZVp0bkhTSHQzZE1wWG9ERW10UVNEOXExbUxHZHFubjBaYnhM?=
 =?utf-8?B?cVFvUEY3RVgvenZqQTRNVjcrb2VhbkI3d09vc0lpQUhaZ2dCZ2dMWFBlYnox?=
 =?utf-8?B?NHhjdGFpZnB4WkVwOEN0dSt1ZlZiRlFnejdqYUc4S29pVkxIbGNpV1Rrdkd1?=
 =?utf-8?B?ZDhoalY5ejZ3WTFpNnpqYW5yUXB0VjBjaXJoblU2ekdYUmljYTlHeFZRMEIr?=
 =?utf-8?B?aDEraDhtMlZrd2t0M2lNQmpQUkx5SGF1YzdQU2tNZHBJaERoaG0rVmZIMG9a?=
 =?utf-8?B?ekdIWlFZYUdNQ3ZvRzcxeUdzZGNDYytENENtdVVzZ0FLblhGNXozdEVURE1M?=
 =?utf-8?B?b241eE0zOVFhNmQyZDE5YnFiRlV6czA4bDF6dXgwajJLcXN2ZkxKR2lqR1FN?=
 =?utf-8?B?VTIwdXdxT3R1TlhTc29JWmJ3RjI1K2pWMEhGNGxFT01CUGJZaTlVUGtPdWRL?=
 =?utf-8?B?ZzJYVFFkTHlNOWpGZ1A5SzI5bWlJdFBtWUIxZzlYNTU5OElLQkQvRTNXZEh2?=
 =?utf-8?B?OCtqK0tJbkFzSE9USXFRZWtVRnFUYzdTVHFranVEcHhRdEgwWkN3Vm1yQWJk?=
 =?utf-8?B?VWRUT2JWS21tOVJCbWZvbktnMzV3SkNwRHZZbnZXM1NPWSt2WFdJR3EyZFAr?=
 =?utf-8?B?SFZOS2NGY2tYRlFBbFRXUjI5Nkl6b01LYW1udDNjRmlXd0RxNzI0ckh6ODBq?=
 =?utf-8?B?eVNlREhKcGYrdEN3cnRJUDlPRDJxdTdUSDJXWmU3bzV1dkRwQXNKVG1hdUk2?=
 =?utf-8?B?TnMvaERjSVozcUVBY3FZZFNNMy9mbTVTdlpVbFBEb1Z6YjE3OGtWR29mdkxa?=
 =?utf-8?B?OEhsNW43dVpETDB6MHhsZkx6cUNwenQxTXlhcWk3RnVFUVJ6bzB0UGx5MWVO?=
 =?utf-8?B?Y2oyYXNsQk91cTllRXZ5MVppZFlHYU9HeTl0aUVlYjFhQ3NQVEdRNVFuaUxY?=
 =?utf-8?B?cXBDNVZxSUg3cjJBSFpXamplcGtLR3dxTjBNUXJEZWJocThhQ0RTRU9YRWJs?=
 =?utf-8?B?dTNVWEdadEJvQ1VuK05FenZGMGlsSWdWWnBJQU1RTUgxWUE0bDlrZkczdmo4?=
 =?utf-8?B?cmNUNDMweDVuRkdEZFN5WVhOUm8zcmN4Q1E4V0RXWU9RUmxIS20zY3BTMDhz?=
 =?utf-8?B?RHdJWkJrTFRRWGxvTDFEZCt4dHNFU05qMXZwT2VBZXFJVG1KZXk2UHFnU01q?=
 =?utf-8?B?ZGh0dUFVVDFBVWMyN3NYMHIzK1p6M0U5UnJzOWhIK0tzTmE0SkRnazF2SXpx?=
 =?utf-8?B?UVl5cHgwRjZrdDRMWWg2cURqem44czBXV0EzMGlvRjVXOTNSTFJjM0VvTS9O?=
 =?utf-8?B?UVFWN09BN3oyblNtNkU2MkFzOERWMGN2K24zZldKeFYyMVB0MnJhY0UxVjhM?=
 =?utf-8?B?SXNZNkIvREV1b1hNeE5VRVAwVkVtZnl3QXdPbEF3T2ZESGZJQkF5Vk00YzFM?=
 =?utf-8?B?WmxzVmlmSXJRbWtlSzFBcTF5YlZybittZ2NSbElYZlRGOVFkRnMyREJmNXJa?=
 =?utf-8?B?R0ExUUVYb21JZ3Y2b0RIV1pWcXJ6cDc4elBMU2l1RlNCbU53MVk4dGw5N2Iz?=
 =?utf-8?B?RmwvNGxDWU4zb3pJV2UrQkZ4WVpNV0U5TjdGZkZXMGxtem4xZWhobXl4TmJK?=
 =?utf-8?B?bGpaZ3NQL04wNjlOQ0Jic29qSU9LTi9JU2w3THV3ZUg3dWJUQmE3ZGNEOWdo?=
 =?utf-8?B?L1FlS1Nma1U0QnRZa3lIVHFmL2J3eDJqMzdPZ29JMjN2UjF5MzNiK2YyVlJW?=
 =?utf-8?B?ajZLM0JmM3poQzMzZFI4R0J3T0ZVSytENUxnQmVYQld2cU1UdTNKenhaQUha?=
 =?utf-8?B?U3hnT2RoSEhPNDYzU3Vid3ppTUZxYi9mM1ZHS0Rtci81cEhwQ253bW5rT2tr?=
 =?utf-8?B?NDgxdDBKTGZBcGt1OGJ0WVZWLzNxU0xTU1BHNnZFc2MrbzhIVFV1UDNjMThJ?=
 =?utf-8?B?LzRFYTZBQkdpc1VtN3dDamNKaE4wRm9iRjlHSVllK1ZYT1FlSnhBOG0zYks2?=
 =?utf-8?B?WjVzRk03ZkhwS1lCb1RBdlZoQk1SUnE5Q2dtamtUcU1OSFBIZzZPVzI2aklF?=
 =?utf-8?B?V09ZUU5Ka1NwbzNKeDhXcllDMTJHUDJDVXZlRnkzOXZOVndYeEVqMXA0cHpq?=
 =?utf-8?B?aHN5dlkxZnVYeVpkeFVlNU5zMDYvTDlMN1RETkQwOW8vaUZhMFdVa0d1TkpS?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fade5ce0-59f0-4554-7a17-08dd75901b5b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 04:53:15.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRYORUXJ8hnu0GAjLqidO4GacyEFDKX5sw2J7rE9fqmEZirxIAeCcilp/WlDwcBYUdhxo2PCPH/xJF1UhAbZ9ooE5uxBnlzikO/A/D9UDi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8126

On 4/6/2025 11:33 PM, Daniel Lezcano wrote:
> On 04/04/2025 08:35, Ghennadi Procopciuc wrote:
>> On 4/3/2025 6:10 PM, Daniel Lezcano wrote:
>>> On 03/04/2025 08:19, Ghennadi Procopciuc wrote:
>>>> On 4/2/2025 6:49 PM, Daniel Lezcano wrote:
>>>> [ ... ]
>>>>> +examples:
>>>>> +  - |
>>>>> +    watchdog@0x40100000 {
>>>>> +        compatible = "nxp,s32g2-swt";
>>>>> +        reg = <0x40100000 0x1000>;
>>>>> +        clocks = <&clks 0x3a>;
>>>>> +        timeout-sec = <10>;
>>>>> +    };
>>>>
>>>> The S32G reference manual specifies two clocks for the SWT module: one
>>>> for the registers and another for the counter itself. Shouldn't both
>>>> clocks be represented in the bindings?
>>>
>>> AFAICS, there are two clocks as described in the documentation for the
>>> s32g2 page 846, section 23.7.3.3 SWT clocking.
>>
>> This diagram illustrates the module clocks and their connections to the
>> S32GS system clocks. From the module's perspective, there are three
>> clocks: MODULE_CLOCK, REG_INTF, and COUNTER_CLOCK. Specifically, on
>> S32G2 SoCs, the first two are connected to XBAR_DIV3_CLK, while the
>> counter clock is linked to FIRC_CLK. Based on my understanding of the
>> device tree, this configuration should be listed as follows:
>>
>> clocks = <&clks XBAR_DIV3_CLK>, <&clks XBAR_DIV3_CLK>, <&clks FIRC_CLK>;
>> clock-names = "module", "reg", "counter";
>>
>> Configuring it this way allows flexibility to reuse the same clocking
>> scheme for other SoCs where the integration is performed differently. It
>> is possible that the 'module' and 'reg' clocks could be linked to two
>> distinct system clocks.
> 
> That is something we can handle when the other SoC will be in the
> process of being upstream, no ?
> 
> I don't see how that can help with the current hardware we are
> describing. What is the benefit ?
> 

The benefit is that the binding accurately describes the hardware
module, and no changes are expected in this area over time, even if
different integrations of the module are performed on other SoCs.

Otherwise, the binding will contain a different set of clocks depending
on the SoC integration, even though the exact same hardware IP is used.

> I would prefer to stick to what is needed today
> 
>>> The module and the register clock are fed by the XBAR_DIV3_CLK which is
>>> an system clock always-on.
>>
>> XBAR_DIV3_CLK is not an always-on clock, meaning it is not available
>> during suspend, if that is what you mean by always-on. The SIRC can be
>> considered the only always-on clock on this device.
>>
>>>
>>> The counter is fed by the FIRC_CLK which described as "FIRC_CLK is the
>>> default clock for the entire system at power-up."
>>>
>>>  From my understanding, we should not describe the XBAR_DIV3_CLK as
>>> it is
>>> a system clock.
>>>
>>> And the FIRC_CLK is only there to get the clock rate in the driver.
>>>
>>
> 
> 

-- 
Regards,
Ghennadi


