Return-Path: <linux-watchdog+bounces-2760-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0081A1B77B
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 14:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1CF188F9E3
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 13:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291DA40BE0;
	Fri, 24 Jan 2025 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mzfS0ZOm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9531C4085D;
	Fri, 24 Jan 2025 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737726703; cv=fail; b=cFeG12ZufqiWfOAl1EbQrX9THnR9WkGVD/5HO8n+8WAYm+KalhMgl9WApgQ5zvjX0lQVpp0wrMw8jONrNmUiJMdzi/6vR+jrYar6GjtQwSljZkrWYJhKaeEPvUlgdX3RH59utjvjbDG26izKPNSRWIL11Sf60OApFKsbb7bEJWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737726703; c=relaxed/simple;
	bh=GCkMLgSlsuqJHpp+HWhsB1Ot9LSkORL6Dsom7j3Ml74=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WJcYxqlLINE59jrv0VKCbvymFxcfIpjPSM1VGBS01ITbiiWB4OsaSlJGgedVyz4L/zd81s2bMWWg+4ISCJCgwB81d++9y/QqyjnPBh5CADAAHqjpJl90mm50Gs4oP/xASdamWftDCaNXfXOOLwW7ONjRDOjsXag4jOudedpqK1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mzfS0ZOm; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtA6/b53ZtIkGBugnzCEUFbrAYNDNDBoK48nSwD7GJ7oNGAtLv51uhjqPnWZx+KOZ7qVsCW4gR8AtjT75+9hbHHQkZCBLndcFd+7P7l7gug8SeEzicyNCKqucbLcBJEcohXfyeBzlinBNLxzTQeL8+rPx5glxuVaSWqNsj81g06Se1voykrSXq0SlT91Mfls0NHRfmo9zJ2myWG4leURid00BkjLlKKH62nbOEjoEDaZoULnFm3giGedgfCNf8fmEYsJ6VTC0IeoQA8Kam93Cv3dASzl6l7OEnF8A7XsLSSbuq6Ptvt5WYVJhU3wQ4yNnsb6rGoZWQwkAkbkiDuSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCkMLgSlsuqJHpp+HWhsB1Ot9LSkORL6Dsom7j3Ml74=;
 b=rlAN8yRsPciNUvjKvoHrD1BCKYeUfHZ4Gzn0oaaxkU/Bb1NQ9vSG8NwnO43oHlmoEiNHRRDEE27u4fb6o+NBXFi+R9HC9tk3Ag9EgnWeXO8zrc3CR5P5LkenUR8cXHWFGK4VSb6cNMLhuheYi3KBzkBB2PkE5VSzdfyjBzU4RX31qGD97i+LE1tGeQki814l0gjaajpVXzbWIhGP8hFg+qhTbVKM+m1QubQTzJLBo4G0bdWOqe/DwIfujtY0Pk8LvMbM2OD49uiRgjckFRu/A1KcvxmPLq2GV8lCuzQMHp50YUfZyVVurrXHs8SNFVmuckVCOM9+t9caxopwDv7PNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCkMLgSlsuqJHpp+HWhsB1Ot9LSkORL6Dsom7j3Ml74=;
 b=mzfS0ZOmiw/KSLOHAog7NpF80gwgckKgbqgs2Guq2l73aANPVFc1euhlcL+TdeXf7+zhCgz+c6y5xGN1v+7x4qpMEOlUFl+mMBP1ph71YL31whEootKHjr7UsV5zq5WFBCygjEDlEAuOHusw5bnmpjLlVICKclZdPRui4FX97d4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13117.jpnprd01.prod.outlook.com (2603:1096:405:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 13:51:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 13:51:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Thread-Topic: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Thread-Index:
 AQHbZznBkfvGK/9M9kaeTTHwnLvzBrMcszgAgAkPAuCAAAaOgIAAA5vAgAAfvgCAAAGDMIAAA7kAgAABYZCAAAQnAIAAADywgAAFh4CAAAGb0A==
Date: Fri, 24 Jan 2025 13:51:35 +0000
Message-ID:
 <TY3PR01MB11346F936A829204B058704CA86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
 <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
 <TY3PR01MB11346DC4A22A2EC0CB0DAF61186E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f4cdcb9e-ae30-45ad-87f4-7395db0ab995@kernel.org>
 <TY3PR01MB11346D1E5B190101E7F474BEB86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <305ba07f-e5f3-4d2e-b017-8a817418f16c@kernel.org>
 <TY3PR01MB11346BADEA961847B84D911E986E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <8bdb2cdf-92cd-46e8-b795-7d5d412a4e07@kernel.org>
 <TY3PR01MB1134676CABA2ACBA48395491086E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <80bedf6c-ff2b-45e4-93e1-a05f4d3416ec@kernel.org>
 <TY3PR01MB113467480CA16AED12555117D86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <18000fea-223b-4e53-8f00-05cad6ceaa75@kernel.org>
In-Reply-To: <18000fea-223b-4e53-8f00-05cad6ceaa75@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13117:EE_
x-ms-office365-filtering-correlation-id: 128229dc-4427-41de-fd28-08dd3c7e3800
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlV3ZERpU2o0dm9QczVUUlZYd0o5N3E5UHozbytGMXpzczNMODRvY1RucjNu?=
 =?utf-8?B?MVgxc1ZqYmlXTWVzL3JtN1BJc1hQWEM3T240YTRMdUdHVVNaTzJIendoak44?=
 =?utf-8?B?emlFV0FTTURtSkxDYVhOR1Z3blNLNmsvVGRpT1k2S0FORXhLdFhPL3hJWS9u?=
 =?utf-8?B?bFFmYjFHaGpTWTdHSHJVYTlOVktVZEpXSWF4RTR3WEhkOHVMYllXdUh0YkpU?=
 =?utf-8?B?RnJ6bGw5c2VJVmpDdVkrV1NGYzh2ek45UWJnWFZiVGxSa2JjNnJ4Z0NILzk3?=
 =?utf-8?B?RVA0aDV2UTVZbWs0aXAzcjRmcDNUZnZDR0NjR0Iyam1LQ2hXekduRlcvTU9w?=
 =?utf-8?B?RVE4eU9udnIyRTFaRzdTSlI0WUxtQ1FKemRkODRqckxoSU9Lam9yZjdFeFB4?=
 =?utf-8?B?eXZiSUliU0ZFUXFFRDlUTkttK2R6dWt4WktNZitPc1FUSk0rcVMwWnVvSjVm?=
 =?utf-8?B?TDU5c2toK2tCUk5VTjlhRFV5b29WWHptY0g3WWJWbExRcVlGQXA0aGlUVlJ6?=
 =?utf-8?B?TW9BenY3Z2RMVEt3QVFnOVcxeW9FT0NqZXhjMElTVjJQK2IyTEk2VWxURGow?=
 =?utf-8?B?S3l6amFuSkVVei90d0dYcUhiVDhvam8zZHZGZ1B0aUdyRUhIYlZwcW91TTU0?=
 =?utf-8?B?YmpkRjNIWElzd0V3NmpEUUlCcUlOSGZJUUE0dFVnNmVJNFIrWW1nbzdtdE51?=
 =?utf-8?B?N2dqKy84ZlNpWmswUER0SXpVUVMvTEZ6ai8zMTZNNHFUQ0c4dFFBQkRWT1B5?=
 =?utf-8?B?NldlQnY1VmpmSS9EYUpYbGczSi9vbGFUYjRjNGNMUlpHZXdzRmxrc29lUFpi?=
 =?utf-8?B?MnJQWlg0UlZmSytYL1A3WTJ5YVVEd0pqemhNN0xLRjUydGRTSnVTcFhUdjUw?=
 =?utf-8?B?MElhWmFzSVlFNnA2Z0hpVmlhWUNXS0xHK3R2dnJjK2FTQ3VBWm1WaEFjYk96?=
 =?utf-8?B?dnRtS2ljRTZyclhkMW12dU9IYVBhUDBET0xBbXlta2xQL1lIMTEwVUZOejRU?=
 =?utf-8?B?SGxRZ2Q4em5KNjl4YTFOdVBpWDMzYnRPcnM1RTNSVkZpVlQwTzRzWE1PQkdm?=
 =?utf-8?B?VkxHbFkzUXJXUTFsVjhqT0VxTld1SjRJbDFYNGF2b3YrOFNEOGpKSTdZODdJ?=
 =?utf-8?B?V1lweUw3NmVnZklxOENpT0dhQSt1eGZuNnVLK1IrbFBxRGt2VTBITWVENjA4?=
 =?utf-8?B?ZFd5ay96c2s3VXZ3b2FObUFKZEZtU3o1bkF4cTB0alJKUzZuZ1Bra3hDUjJN?=
 =?utf-8?B?Qm0xcVJDbjNuVjJELzJ6dTdNR05MdmlYZXFkZjdyV1ZjQXdPZlVLZXcvNTE1?=
 =?utf-8?B?RzhaQ0NSSkZReVEwYTl5eG5EbEloVGRaSVczUjZHS0NSWm1KaXZSNmFJRjRT?=
 =?utf-8?B?Vk5VV2doTXNlUjVSckJwWEIybVVTbHBtekY2eDl4MlMwWi9JNStKaWRROW4r?=
 =?utf-8?B?TXZEdkovTU5WRVY1Tk5YMEl4RS9ZNVErQ0hRZUNIREVTWGNlaDRuRFZ0SEdq?=
 =?utf-8?B?YmoySkt1bVJrNy9aSDVsUm42QnhSMjJETXlBTDJGa1A2NDNOdHJJNElHNWdR?=
 =?utf-8?B?VHU1Q2x6eDBEbzBLL3I1Q3UrLzd0V1BlMmpBemE2TVlMcVVGR0M5M1JDUlNy?=
 =?utf-8?B?Y1U1QTNtR1ZUV012Ykw3WENDSFJSTmRUNnUrVFJrK0NtV2VibVY3ZVg1dmRW?=
 =?utf-8?B?OFQxaU10Mk5RVVJvVTVqUURETTd6RWxHYmoyMWk0MDYvMGlvR2Rxd2RHcElK?=
 =?utf-8?B?STBHbkxzOWhsNU02L0owdTQ2bndvR3VTR2s3NHRlRGMzNklKT1J2cGJuRTZr?=
 =?utf-8?B?a3puK2dsS3ZreXBZWU1GcnZhbXBLVGpaczhsWEZLM0xwSDNSRTdwWW9KcFBP?=
 =?utf-8?B?STJMYm9GaGhUd0s2K2k3d2w5TUZIQkk3ZVlzKzhYdGJFTzZxMmJ6RHZ2ZUFB?=
 =?utf-8?Q?PAANjuG63pQwhEK9knLWwsGWYkJc6LU4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZW0vVVlxUjdwK1l0MkdrQzBWQ0xoaldNQkZaWWJFMWpiNUNicnRxYVpEbXp1?=
 =?utf-8?B?U0FrRTgyREtlRzgvdmpxNm1hYVg2Q3g1ZnNwWUZHVVlJMmdGSUlQbXFQVW5U?=
 =?utf-8?B?Y2hON21IR3BOSlhLNko4ZXhtQ05Gb2V6dExySVJpR2t2cVN4WlkvdDhvMTJh?=
 =?utf-8?B?eFBEMUd1a25sQ25wMS8vNTd6OG9ZaEx3N0dESXJxT2pJTHVoc1VYdkY2UGtt?=
 =?utf-8?B?S2VIcFN3blZadnNYYkM5Wmtvd0kvdHEzMG9JQjBwdk02d1RSanc5NnZqd3RL?=
 =?utf-8?B?S3ZKUXJERmpuS09UZndQZllFc3dtZ1U4bzdqWTZmend1NzE0b2lTRy9kYkVU?=
 =?utf-8?B?d3hWc3hHdk5nbk13bFUrRDRTdDhldUk5QXRFcStnZGlXU1MvNGlydFNuNnRy?=
 =?utf-8?B?R0xYWEpsc04zWjZ6TFozU0taVkxLQ21LVTlzZEl4bGk2cm1oR2hNMlMrRzUv?=
 =?utf-8?B?Z2VQTmJ4T25FbmtrOUZTS28wQk1qYjNtMHlLR1FNNGlZV2h2Z3lDZlpqSTR4?=
 =?utf-8?B?Y1M3N0ZVV1prSjlkWThzR3lXT0hUNkFxZmZOdmxBQjVHL2VhSml0eDFtOHpM?=
 =?utf-8?B?ZDl6RVpqMmZpWCtSamNxdXRma1g3VEo1KzVKN3JmdGV6dCs4emt5MUozb1NL?=
 =?utf-8?B?ajk0bjF0VG05ZmdpWEFYS1hxTUUyUkVuT21oNFJKbkwwaTFTYnExc0VNeis2?=
 =?utf-8?B?VjVPRXMrL0NnN20vZTRBVHQyNGJIdGptWDNTWm1KYm12VzhSRU5aR2Y0WVdy?=
 =?utf-8?B?NGRHUXAzTVBCLzNyaU1VR2hGYmpXVThEYjhKS0hUYlhFYS9pNmc1czM4Sm9r?=
 =?utf-8?B?dGZpTzIwNFJhVWwwSHFFY29JWFVPK1NYalZKcVQ3aVBhRWtUSzcrQXdlSVhV?=
 =?utf-8?B?cGJXQWsrRUdDTmdZYkprVHFPWGw5b09XSEdzY3E3czZkR3Roa2JyZ1djY2lJ?=
 =?utf-8?B?bURtUklXbXFRWVhYcForVkRCZGJTV1Fwd3Y3bUhaTEVheEtlREkrMU9CcSsw?=
 =?utf-8?B?bVo0RWpoSHdmaFJRKzhZZTlTWlczQWorSXpmZXZ4eG1ZVWx5UEkwQkowNXVD?=
 =?utf-8?B?RVRHbnRPR0dmanQ3cFJpWXVDdkcwcDM4U3BFbFU0d3laOHZFdXd1MUdoUkp1?=
 =?utf-8?B?S2lHZmhDWFB3U0dzQ3hVbGtiNE5NRXZLOXV1NGYzc0pnNmpuYndCTjA5M1hD?=
 =?utf-8?B?QnhZcEJYclNHZ1V0dUhCWHhIbmx2bU04VjN1MTBsdFJOTFBVVGFvVm0yMU8v?=
 =?utf-8?B?WnppV1g4NGR4V1F5aTJjMmU2d2U3Uk50RUFFd21VcGNuZk9kSG8xTW1jSkE1?=
 =?utf-8?B?bHNFU2h5aUU4RSs3czNrRFBKVjkvR2dJWnZPN1lDL0Z5V2RzRUFQVDFlYUhz?=
 =?utf-8?B?bWhZN3RDNDQwNE9mbXNkN1QvcmNRZDMzRFA4NVU5czIzbk1oc0JDd2Nwa2tp?=
 =?utf-8?B?UW9iRXc1VWdGamlES205c0tqclpqRXZQOWljOVhDTEx2YXdzR1BFbmVDcGxB?=
 =?utf-8?B?c0g1Vi9LMWxWNy9oVGVsaW55ODlTSE9oTHlYU1JmNm54dXNDU29ud0V4cWlv?=
 =?utf-8?B?bjRTQ3NwcEZUd1JkUW1xOURwU3ljNGh1WmJPa29NYkN0NXVtVGJ6czdxSlpi?=
 =?utf-8?B?eS9WYzB0cVJqK3p4S09QS3JnWUw3T04wSC9qZ3M5c3JTWVJINHAwQ2ZvRGdR?=
 =?utf-8?B?WisxVzY2STZHZEkxTzVmUmVwVFh5OC94NUsxN1M0eUFEUHQ3N25aU202Z3o3?=
 =?utf-8?B?bEplWld2NE9odDEwVzRQeU5nMHc5Z0dNQWlBVThnSVJSbFZySE5qR1hLVWd2?=
 =?utf-8?B?cXBNMDZwUGhwajFmTmtDc3A4RlVmaE5sYWZmM3o2bzNDd1RxS1pPa3FUSEJ0?=
 =?utf-8?B?KzA1YnRmZEp3bHNETW4wMTdsTjc1cytOV2owVnFSdlFiNnJLSnRQNW05czRr?=
 =?utf-8?B?anQ0OW5ZRU1TWlpWcnRYaG9nQ3ZKZElVYXdWSDJUYnN4NDc0UGRGQk4wOXhu?=
 =?utf-8?B?MHhTSmpxQ3h3TC9VTm9IU2J0djJ2Qm5wMlFYUnZUZXByb3QzM21PL2xwNUxM?=
 =?utf-8?B?Y3FjZlVLOXJLdWxodmFNZHlWTnpEODg3QXB6N1JzQkc4Uml0c3drRDFZL1BG?=
 =?utf-8?B?YjRTb3c2b0RIQjgyaEx6K0tIWVRsLzF2V1JBb1FQNFhkOTNhTTUyQ01lbXVL?=
 =?utf-8?B?ZEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 128229dc-4427-41de-fd28-08dd3c7e3800
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 13:51:35.9244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsWtHKxGscqvT6rE1TCPDtVC5iHMq29PI8fj5/mjVon2yeRNl6oj6NksqPSyqjyrfae58NDtFISzMZZLwHTagHaD/aa7bdOd5xVGMHIXzF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13117

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0
IEphbnVhcnkgMjAyNSAxMzo0MQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNV0gd2F0Y2hkb2c6
IE1ha2UgUlpWMkhXRFQgZHJpdmVyIGRlcGVuZCBvbiBBUkNIX1I5QTA5RzQ3DQo+IA0KPiBPbiAy
NC8wMS8yMDI1IDE0OjI0LCBCaWp1IERhcyB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+
Pg0KPiA+Pj4+PiAgY29uZmlnIEszX1JUSV9XQVRDSERPRw0KPiA+Pj4+PiAgICAgICAgICB0cmlz
dGF0ZSAiVGV4YXMgSW5zdHJ1bWVudHMgSzMgUlRJIHdhdGNoZG9nIg0KPiA+Pj4+PiAgICAgICAg
ICBkZXBlbmRzIG9uIEFSQ0hfSzMgfHwgQ09NUElMRV9URVNUDQo+ID4+Pj4NCj4gPj4+PiBEZXBl
bmRlbmN5IG9uIEFSQ0guDQo+ID4+Pj4NCj4gPj4+PiBEbyB5b3UgdW5kZXJzdGFuZCB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIEFSQ0ggYW5kIFNvQw0KPiA+Pj4+IChBUkNIX1I5QTA5RzQ3IGlzIHRo
ZSBTb0MgLSBpbmRpdmlkdWFsIG9yIGZhbWlseSk/DQo+ID4+Pg0KPiA+Pj4gQVJDSF9SOUEwOUc0
NyAtLT4gSXMgYSBTb0MgKFJaL0czRSkNCj4gPj4+IEFSQ0hfUjlBMDlHNTcgLS0+IElzIGEgU29D
IChSWi9WMkgpDQo+ID4+Pg0KPiA+Pj4gOTAlb2YgSVAgYmV0d2VlbiB0aGVzZSBTb0NzIGFyZSBz
YW1lLiBTbyBjYW4ndCB0aGlzIGJlbG9uZ3MgdG8gc2FtZSBmYW1pbHkgb2YgU29DcyhlZzoNCj4g
Pj4gQVJDSF9SWl9HM0VfVjJIIGZhbWlseSk/DQo+ID4+DQo+ID4+DQo+ID4+IFdlIGRvIG5vdCBk
aXNjdXNzIHdoYXQgdGhlc2UgU29DcyBiZWxvbmcgdG8uIEhvdyBkb2VzIGl0IG1hdHRlciBpZg0K
PiA+PiB5b3UgY3JlYXRlIEFSQ0hfUlpfT05FX1RXT19USFJFRV9TT0NTPyBZb3VyIGRlcGVuZGVu
Y3kgaXMgQVJDSCwgc28gdW5pZmllZCBrZXJuZWwgaW1hZ2Ugd2lsbCBiZQ0KPiBlYXNpZXIgdG8g
Y3JlYXRlLg0KPiA+PiBUaGlzIGlzIG5vdCBoZWxwaW5nIGluIHVuaWZpZWQgaW1hZ2UgYW5kIEdy
ZWcgd2FzIHRhbGtpbmcgYWJvdXQgdGhpcyAqbXVsdGlwbGUgdGltZXMqLg0KPiA+DQo+IFJlbmVz
YXMgbmVlZHMgdG8gZmluYWxseSBzdGFydCBpbnRlZ3JhdGluZyB0aGUgZHJpdmVycyBhbmQgdHJl
YXRpbmcgeW91ciBTb0NzIGluIHVuaWZpZWQgd2F5IGxlYWRpbmcNCj4gdG8gdW5pZmllZCBrZXJu
ZWwgaW1hZ2UuIFlvdSBoYXZlIGZvdXIgd2F0Y2hkb2cgZHJpdmVycywgd2hpY2ggbG9vayBsaWtl
IGNvdWxkIGJlIGNvbWJpbmVkIGludG8gdHdvDQo+IGRyaXZlcnMgKHNvIGVhY2ggcGFpciBvZiBk
cml2ZXJzIGNvdWxkIGJlIGNvbWJpbmVkKS4gRm9yIGVudGlyZSBRdWFsY29tbSBmYW1pbHkgc3Vw
cG9ydGluZyBtb3JlIFNvQ3MNCj4gdGhhbiBSZW5lc2FzIHRoZXJlIGlzIG9ubHkgb25lIGRyaXZl
ci4NCg0KWW91IG1lYW4gY29tYmluaW5nIFNvQyBJUCBkaWZmZXJlbmNlcyBpbnRvIGEgaHcgaW5m
byBzdHJ1Y3QgYW5kIGNhbGwgZnVuY3Rpb24gcG9pbnRlcnMgdG8gYWNoaWV2ZSBzYW1lDQpmdW5j
dGlvbmFsaXR5Pz8gV2hhdCB3aWxsIGJlIHRoZSBpbWFnZSBzaXplIHNhdmluZyBpbiB0aGF0IGNh
c2U/DQoNCkNoZWVycywNCkJpanUNCg==

