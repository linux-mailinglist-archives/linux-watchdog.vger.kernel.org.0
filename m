Return-Path: <linux-watchdog+bounces-2427-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C49BFDAD
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 06:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89EC72827C5
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 05:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909BE192D68;
	Thu,  7 Nov 2024 05:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="WJfSuWPH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023103.outbound.protection.outlook.com [40.107.44.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE79191F92;
	Thu,  7 Nov 2024 05:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957762; cv=fail; b=CZznb4ZXqljnOOzUIpwsfrU3dh1RvIEaYJbyJSKbISAZp47fYL9AVLRBTCymFaqUS9GCKGiqkn50rbzo33WXuOzjpGXhqLYvNtCOuoH38mSk9zVMtnRg9ecHVAyyUwmuJ7N2gjr3EuBvOKqc0fEpRw8VltCMLf9P07eSTNKH7Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957762; c=relaxed/simple;
	bh=fkUNPfcq47czZsJT5BPUMGBYta7xiyALQ1rlWEUCIpE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FRx4IBuT7M+b6BxQ7hsqdXnJu8M65AiVzmnqQcnNR7IkC1CfeaVeYALHxSolLALxxApJn6/vMAW82vf1uNjKHeqwlTb4YxYFzTprqinMPrMqQ+l9XX7sFSbMEg+Rkd1SfK8p/3FkxMaPS5DLKxr3qjX7jxbZvlSUz109LILJrq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=WJfSuWPH; arc=fail smtp.client-ip=40.107.44.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUpspROfZorGeP9xacgid2kziZmkCuiZQ2epppbdLrVoL1mPxJmDT+FsfvvsJwvO06rdRIdWv8B5vwHawswOwdM+fjA+19C4r8NBexrONcxTolXnFT9jSkK5ffnUN3KiFQ+dSc0hNCwNqIYq0hV4rj+a5PzVjf/NA8CoemP2E7SMAe0pRr//Dxzbb1yWVMNPkyAvri0aJCbpv0VpB1IV0Dmmkgip4TJjgOOvIziGV/dhxi4rgbeEW//v/loea76khR0L8r1jZ+yhKUZzjP5MOhhwBjg4U206LDn9p//xjrpAJpijoy29Hp3E7dycQeTyr3DkHQI5Pzehgz9XQkDuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkUNPfcq47czZsJT5BPUMGBYta7xiyALQ1rlWEUCIpE=;
 b=P3ikUmX0ThNzN4PPQoKXWkwKZqBMIc9fE7Wvvr174PY+zfOc9EEypiBl7O9PTVw7r1ixizvzKILg+6C0V8szgomsGQ7AybZF/quyKW/ilvDh4DBGlh7oQUxGdp6V8dnYj1I+8DlTuBf1knv6VQrZFyV9AOi6dutxUU1imgqY3rBQkVLU7DL46ttT173lVjdB845AUlilgU/D90WH94OYgiVrD3qkwDUD0M+2ntQUL6jqXf6WjH2ZRfFb+WeuK7rzJnANmQSHAQ5Hgz+vQRVnWICIb5YprQWsqHXl0O9G8KRG2bt8tG/tAxZq59DRzdUaqGlfdhS+7v/SlS90c2a3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkUNPfcq47czZsJT5BPUMGBYta7xiyALQ1rlWEUCIpE=;
 b=WJfSuWPH7t7gHSKC4X3eat4iq/DgaqpSh1Nq2QF3p30WMY2rl/MLMe+mXeysP+9Y4faLCeTt9vsRxQmcJNsPHOY5rcckmPapI59WCxovHv/Vl3JH5B5z/ZQEL800xNMb5Ldvo2tjPPVICXHiNyr+WZZ7acV6gwLYyPjRKvufudASytAiOcFSIhAilwDNt6x7GSWQolfhDkIPxsN75YdbYz2nesFR/Wt3yDiR4XCBD+3rsVl4IaKKhA/r5xZKnIpJHQBG76CMcq/EOKjJIKRLwVkUP4wFa5o3aFbpIDwYyyUSL4RnZ1HM3EgZIgROafbqAJ4Ewhylgd3kcVplKNfTvQ==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by JH0PR06MB6319.apcprd06.prod.outlook.com (2603:1096:990:b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 05:35:31 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8137.014; Thu, 7 Nov 2024
 05:35:31 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Patrick Williams
	<patrick@stwcx.xyz>
CC: "joel@jms.id.au" <joel@jms.id.au>, "wim@linux-watchdog.org"
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
Thread-Index: AQHbLFdFSiy5MyUwCUe0YBcXjsWUGrKivQQAgAOD0oCABQ7T0A==
Date: Thu, 7 Nov 2024 05:35:31 +0000
Message-ID:
 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
In-Reply-To:
 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|JH0PR06MB6319:EE_
x-ms-office365-filtering-correlation-id: 52cd5c05-5482-45b5-b6c9-08dcfeedfea6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UVU2N3JYNXl4dFFDQUFaZjdHSU1lNmxFdTJJZ1BtZEhZWkpId1h0ay9hSjR4?=
 =?utf-8?B?SFZMcXJsVGVTZ1I5cHRldFhMSXZ2Q0ZXRFhCZXpnd2JtK21HQVFjNGFzQVlP?=
 =?utf-8?B?TmVuTzFiZGZOa0l6NCt5TFRERDBqZE5HTzEzK3ZrYS95eWYwVFNoR0JYQ0M2?=
 =?utf-8?B?NFprbEhFSk8wWG9Sd2greDJ0WURqQzdGNU5kOS9WWCtQUVZ0QUxIdUpYSDlD?=
 =?utf-8?B?OEp2MittMHRHUUZkbk5qRnVFMUs1RTlvakNlOXlsczU0c0Q5dzJwY1JNMWVp?=
 =?utf-8?B?Y0huTmRpdlh3bEI1QlA5c3lsTmo3YTkxVE9pZ3FiV0U5M2NPS2N1Z2FXMldt?=
 =?utf-8?B?ZXFUdEtGeDROcWQvY29Nc29FNlQ2UkZWN2tIcG1qU3J6WlprdUhYdUJlaCtu?=
 =?utf-8?B?TTZzUU1RaEcxOXhFc1lIZERTbkE0c1FyVFBNOGpVU25BUjVnbkEzZVJGRzcr?=
 =?utf-8?B?ZFZtc3RZTjBUZE9ESDVmbnV0eVZ2eTFNRnFKUENqMXkyTHdpMVRaWGVSSlZo?=
 =?utf-8?B?djZWWEZIcGdZVTJHRWdvMmxVNTh5WEluNlFyQ3VXZytCbENYbHkwV2xxK0dz?=
 =?utf-8?B?QWQ5cjdyR1RiR1lqcktWQTl6RWp3OE4xYmFZSWJmME9EQWdoRS85bE84MWpP?=
 =?utf-8?B?SmhLMk43RmcyTVhFaEhuZ0lCR0EyTUVMd1NnVldrQUVmR09tcFNlZUtoOFRG?=
 =?utf-8?B?aU5ZMnZOU20rYURxWHBEVzE5aUk0KytjWTZabE9ZOVR4VzBGVU5TcmhPNjFq?=
 =?utf-8?B?NDl4RU9jc0ZSTXp4UmlqTlI0am85aUM2L295UmRsZloyN25IQUJ5eUxTdFlp?=
 =?utf-8?B?aTF2a3h0U1BZUWRIQ2RuYXI2Z0lKWmJIR0diczgyYTFPQXUvd1pxaC85S203?=
 =?utf-8?B?ZTFubkxwN2U4MFN2MThRdFg0Z3hpTjBzOXdXS1JDVnRpNjZVQzVJVUhsQ0ZZ?=
 =?utf-8?B?SHYyZEVVTnF4THRwN1RKbm9kYkFZdEVxQzhKUWhmc05wVWFsNFZUYlRHNTNS?=
 =?utf-8?B?cm1mbGpXcEVCWk4wVlJOajFPRzB4MFkrcS9pdXBTTmI5ekFPaDNoOUlOU3lm?=
 =?utf-8?B?NlJ2WFA0SHZQb2U5aHJRRUM2ZHdzSWNqVkNPNGFsZHgwWTZFeDdmMVFkUVRa?=
 =?utf-8?B?TEdPbVQrU0xRa0FXeGZ6c0l5bzdXd1ZPbUx6SXA1K0FkREJ0WjNlcW1UK29E?=
 =?utf-8?B?b1lFbkROdHBIYjVlOFd6bDR2THJpcTBjM2FkMkVuWkpsZHlISU9HUEhqNldq?=
 =?utf-8?B?amdqQlZlb2xMcVNHODhyUFl3UC9OQzA3SFF0Vk50emw2ZEV5bmViZDU4OWlB?=
 =?utf-8?B?M1FtRlJtZlU3bWtrZ1RpRG9KZHpBMXJCY1ZHZlFxbksydnpEZE1tM3N4ZTIv?=
 =?utf-8?B?bHh3Y1M0aFN4KzMyME5BS3ZobHlwWVpXWlJPT0xRZ0RGaHJFcGd4Z1JnTUl4?=
 =?utf-8?B?d3YwVHFiaXZQK1RQSi9DeWE2ak05TWZ0QmlhaUNUeXNmM0lEU1BsQ2pWYXMr?=
 =?utf-8?B?bStXYTVjSnJTOVVsSEhWUUJoL3BYN3RtMEw4dXdsMWtyRldwcFY1SmNzdkZq?=
 =?utf-8?B?bVhITTRMNWRhV2hwUE9kekJSRlMwNzNCQm1aVy91WlMxeGNHQ3p5MEIxWFp0?=
 =?utf-8?B?bEFIcUNDZ1RrMkthNnp5bE5OMy9DWmhwVDVHdGEvZGV2ZHpZNzRFcTBaYncw?=
 =?utf-8?B?Wk5BekthcXZvckdsRlVUQVdodHNjUUhldytLdUp3M0ZqTS9SNEVoOFdPdG44?=
 =?utf-8?B?YXFXNmx0azJEdWRVVFFsbTh4MVJTN2hPdElnSFpvMFJNenlHR2ZMYUkzTGM2?=
 =?utf-8?B?TktRMHNpdmpHRFdjZFJvQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHo4RFBtRnlrcWRpbjg2aU1mMUJTTmpMckh2OUtuVm5vVnJ6OWVROE01cFF5?=
 =?utf-8?B?aWhTQWNnUkFvNnplZTZUeWtFeGN6Z2JZWXFISXIxa3M2Qjhvck1NanNueEhE?=
 =?utf-8?B?UEdzVXdUallGSndmZHJlbkRlZGNWdUJiVzdtL2pEMkRzUlJuLzNyVHFkNUJ4?=
 =?utf-8?B?Y3d0VHA1YlNXbjhkc0tZcTB6K1VQc05SZnN0cVdvelNYaDNBa090Zkg3cUdS?=
 =?utf-8?B?WUIzYW5SU1M5RmpFb1djUlFiOWwzMUErZnY2OUdYa1BUZ0FaNHI2ZThkd3Yw?=
 =?utf-8?B?bUNlUmc1TUJQZjFiNk1pOWcvWlZwRjRPOVFoYlR4NlpMbWRmQ3BFWFdxR3Fu?=
 =?utf-8?B?QXQ5SzNjWnlpVGdSRm13eWNBMlZ2YTZyR0RqblNNbWN2QWNOMFhIOWIxQTNX?=
 =?utf-8?B?MkZEYWJ4SXVnVDQ1clpsV2pmQnlURWprMUZkdjZHT2ZZaTdJU09lcXZzKytB?=
 =?utf-8?B?QWtHbU1mdERsY0RPUm9kcWdIUjljSm1NaWNTdEpkYmdLLzJQQXhKVlQ1Umkx?=
 =?utf-8?B?SE1semJVUjdyb2R1SEJtYjQ5Y2JlNVI3dmNpM1RFbVhYR2lpekdzNm42NE5Y?=
 =?utf-8?B?eVkxbTJxYmVyUjMzc3FhdG1iTy9xZ2tHVWhyWDR0ZE04RHhma0RrUHM0VWtn?=
 =?utf-8?B?YklrYlAzNTNqQ3VrRGtIVkJEM3phWEk4Tkl2T2Q5NXIyTFFlZUZ6eW5hSUxX?=
 =?utf-8?B?NzA0YmRBTkN6K0pvUklMbXhjV1I4NFpiQ1ladjhnSXRFSExvNmVGVVUvWHdH?=
 =?utf-8?B?U3FEbnUxakpxakt1UWhGMi9FMER3ZnYrK2UwUnE0dDd6bENpSlJKam9WWm5K?=
 =?utf-8?B?T3NaVzF2YjFpNjVlenhFTkNDMUZRb0RzNlJPK3JUdUI3V3BRbW1uQ1FUQnlw?=
 =?utf-8?B?ZnViSjBUZVJQRkQ5VXQremp4MWRvNU9hK0xyRWJwYUl5SVRXZXhZazlOTjUz?=
 =?utf-8?B?emxIMDlLd0llRW54VENZTnlicnZsTWdHN2xybi81M0pPb2VxNDNKQWxPeEJi?=
 =?utf-8?B?cFN0bzN5NU52Mis0SEU3NkpwUlRwZGY5eFpoWDZDZEdKRlRNejBZeWJYZTUy?=
 =?utf-8?B?ZlI4cjhKWTNXd0dIeXcwQmxWSmJLbHZVU3dwaG5vWlhaN3E4YXRiMWdZQ3lG?=
 =?utf-8?B?UkRZM010cnFCOU9HL0htWTllcEFCeWpWcHNRemhmdS84dUxxTnczY0tkQVRC?=
 =?utf-8?B?SEFUNTIzakp3Q0JJTjRrM0lMSUh6VjU4TkFwSTNYb2RmcGZlYzN6V0crMmZh?=
 =?utf-8?B?UVEvNXJrRUdNTmdzeFJxTHpVdUtDTjljVFBicm8rdmxDODZxNDZ0aFBlNDY3?=
 =?utf-8?B?SmxucWVhRzNYbjk5ODZqRlJzQVU0b25tSG9ubFR2ZmhPamdCc3dBaHNiNmV5?=
 =?utf-8?B?cUI3WTcvM3BjYnlTRHJpUTJkTXNZejV6Z3JsdTZqTTkvS2VUbTRhN3lORHdi?=
 =?utf-8?B?Uko1MGEzNEs2My91eUpKVVpLKzhtemlBVVNjdjdnb2hSWVJxbWNBTEhWanoy?=
 =?utf-8?B?c3loaUplUnNhN042RkhpbE5zWTAxaXJWMkRNRkh5UndvS0VDVDgrTG5hM2o4?=
 =?utf-8?B?NlVJMUF1NHN5MzB0NkdVOXEvVTVIcXpBd3RWd2dVUXFLTTA1cHNvWURZazd5?=
 =?utf-8?B?TWJCaE5YcnlmZGZtQldCd1FJYzdXUDNLRUw5bGlhdVBNaDFhY29vRTd5OTlk?=
 =?utf-8?B?aHBsK20rMk1mMVN2d3h1bG50cVNkTkVFa2tOZVpBZ1p6Zncrc3lVT2wrNTBl?=
 =?utf-8?B?b1l6YTA3cUxPQkRaa25wUCtiYlhKTWpLVmdQbGoyMGcwWWxVL2dIclYzU0dT?=
 =?utf-8?B?SFJLa0FaYkZZQzJzcTVPcGtwNnE0UVN0dnp1dVY5NUdmT000NEIzd2Q3Nzlt?=
 =?utf-8?B?V29mOE5aa0xrVlNzREhUdmYyZEFMZVk1ZkhFOVp6S0tPVXlCNHhMZ0hZanhM?=
 =?utf-8?B?RFVSbHNnSDlBM2hvRERkTlZlY0NZR01FaC9kU2IxbEJUeHYzbUJYc3U3VFcr?=
 =?utf-8?B?d3l0dmppckNQc1BmcXkvOGNrc2t3MldBM1dBZTZhUWJaOXZETkVaRDJxc1Ir?=
 =?utf-8?B?cmg1UW1JdktuVFZMRFpCSEF5Zkt6bTV3RXBWbFdPdTZBd0tlblU1Mk0xR2pv?=
 =?utf-8?B?RlJ4dXJ1TmtjOG80S1NmbE9HekY4OXdMQnNTUWhUalpPZXRZMHd1WjNUcElj?=
 =?utf-8?B?TWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cd5c05-5482-45b5-b6c9-08dcfeedfea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 05:35:31.2710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wosp7fyog8WHCKNfh/yMM2YrnIzwvWOoT3vgfLjFH90wm1KmxLZ4yul5NzYS9ABDmIV2Ykr6ggnf6Zt659Z9g9mMO2kfHH+2Vp6ksDWKqMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6319

SGkgQW5kcmV3LA0KDQpUaGFua3MgZm9yIHRoZSBjaGVjay4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3Qu
Y29tLmF1Pg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDQsIDIwMjQgODowMiBBTQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY0IDEvM10gd2F0Y2hkb2c6IGFzcGVlZDogVXBkYXRlIGJvb3RzdGF0
dXMgaGFuZGxpbmcNCj4gDQo+IE9uIEZyaSwgMjAyNC0xMS0wMSBhdCAxNDoyMSAtMDQwMCwgUGF0
cmljayBXaWxsaWFtcyB3cm90ZToNCj4gPiBPbiBGcmksIE5vdiAwMSwgMjAyNCBhdCAwODoxMTo1
OVBNICswODAwLCBDaGluLVRpbmcgS3VvIHdyb3RlOg0KPiA+ID4gVGhlIGJvb3Qgc3RhdHVzIG1h
cHBpbmcgcnVsZSBmb2xsb3dzIHRoZSBsYXRlc3QgZGVzaWduIGd1aWRlIGZyb20NCj4gPiA+IHRo
ZSBPcGVuQk1DIHNob3duIGFzIGJlbG93Lg0KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvZG9jcy9ibG9iL21hc3Rlci9kZXNpZ25zL2JtYy1yZWJvb3QtY2F1c2UNCj4gPiA+IC11cGRh
dGUubWQjcHJvcG9zZWQtZGVzaWduDQo+ID4gPiAtIFdESU9GX0VYVEVSTjHCoMKgID0+IHN5c3Rl
bSBpcyByZXNldCBieSBTb2Z0d2FyZQ0KPiA+ID4gLSBXRElPRl9DQVJEUkVTRVQgPT4gc3lzdGVt
IGlzIHJlc2V0IGJ5IFdEVCBTb0MgcmVzZXQNCj4gPiA+IC0gT3RoZXJzwqDCoMKgwqDCoMKgwqDC
oMKgID0+IG90aGVyIHJlc2V0IGV2ZW50cywgZS5nLiwgcG93ZXIgb24gcmVzZXQuDQo+ID4NCj4g
PiBJJ20gcXVpdGUgc3VycHJpc2VkIHRoYXQgdGhlIGFib3ZlIGlzIHJlbGV2YW50IGZvciBhIGtl
cm5lbCBkcml2ZXIgYXQNCj4gPiBhbGwuwqAgSXNuJ3QgIkVYVEVSTjEiIGEgbmFtZSBvZiBhIHJl
YWwgd2F0Y2hkb2cgc2lnbmFsIGZyb20geW91cg0KPiA+IGhhcmR3YXJlIChteSByZWNvbGxlY3Rp
b24gaXMgdGhhdCB0aGVyZSBhcmUgMiBleHRlcm5hbCB3YXRjaGRvZ3MpLg0KPiANCj4gSSB0aGlu
ayB5b3UgbWF5IGJlIHJlZmVycmluZyB0byBXRFRSU1QxIChhbmQgV0RUUlNUMikgaGVyZS4NCj4g
DQoNCldEVFJTVDEsIHdkdF9leHQsIGlzIGEgcHVsc2Ugc2lnbmFsIGdlbmVyYXRlZCB3aGVuIFdE
VCB0aW1lb3V0DQpvY2N1cnMuIEhvd2V2ZXIsIGRlcGVuZGluZyBvbiB0aGUgSFcgYm9hcmQgZGVz
aWduLCB3ZHRfZXh0IGRvZXNu4oCZdA0KYWx3YXlzIGFmZmVjdCB0aGUgc3lzdGVtIHJlc2V0LiBU
aHVzLCBFWFRFUk4xIGJvb3Qgc3RhdHVzIGNhbiBiZQ0KaWdub3JlZCBpbiBBU1BFRUQgV0RUIGRy
aXZlciBhbmQganVzdCBpbXBsZW1lbnQgIkNBUkRSRVNFVCIgYW5kDQoib3RoZXJzIiB0eXBlcyBz
aW5jZSBFWFRFUk4xIGlzIG5vdCBhbHdheXMgYWZmZWN0ZWQvY29udHJvbGxlZCBieSBXRFQNCmNv
bnRyb2xsZXIgZGlyZWN0bHkuIE9yLCBhbiBhZGRpdGlvbmFsIHByb3BlcnR5IGluIGR0cyBjYW4g
YmUgYWRkZWQgdG8NCmRpc3Rpbmd1aXNoIHdoZXRoZXIgdGhlIGN1cnJlbnQgRVhUUlNUIyByZXNl
dCBldmVudCBpcyB0cmlnZ2VyZWQgYnkNCndkdF9leHQgc2lnbmFsLg0KDQo+IFdESU9GX0VYVEVS
TjEgYW5kIFdESU9GX0VYVEVSTjIgaGF2ZSBhbiB1bnJlbGF0ZWQgaGlzdG9yeToNCj4gDQo+IGh0
dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibGFtZS9tYXN0ZXIvaW5jbHVkZS91YXBp
L2xpbnV4L3dhdGNoZG9nLg0KPiBoDQo+IA0KPiA+IMKgIEkNCj4gPiB0aGluayB0aGUgcG9pbnQg
b2YgdGhpcyByZWZlcmVuY2VkIGRlc2lnbiBkb2N1bWVudCB3YXMgdGhhdCBtb3N0IHVzZXJzDQo+
ID4gb2YgQk1DcyBoYXZlICJFWFRFUk4xIiB1c2VkIGEgZm9yIHNvZnR3YXJlIHJlc2V0IGNvbmRp
dGlvbnMuDQo+ID4gYENBUkRSRVNFVGAgc2hvdWxkIGJlIHJlcHJlc2VudGluZyByZXNldHMgYnkg
dGhlIHdhdGNoZG9nIGl0c2VsZi4NCj4gDQo+IEkgdGhpbmsgdGhpcyBpcyB3aGF0IENoaW4tVGlu
ZyBpcyBwcm9wb3NpbmcgZm9yIHRoZSBBc3BlZWQgZHJpdmVyPw0KPiANCg0KWWVzLg0KDQo+ID4N
Cj4gPiBUaGUgcHVycG9zZSBvZiB0aGlzIGRlc2lnbiBwcm9wb3NhbCB3YXMgbm90IHRvIHJlcXVp
cmUgdmVyeSBzcGVjaWZpYw0KPiA+IGNoYW5nZXMgdG8gaW5kaXZpZHVhbCB3YXRjaGRvZyBkcml2
ZXJzLCBidXQgdG8gYWxpZ24gdGhlIHVzZXJzcGFjZSB1c2UNCj4gPiB3aXRoIHRoZSBiZXN0IHBy
YWN0aWNlcyBhbHJlYWR5IGZyb20gb3RoZXIgd2F0Y2hkb2cgZHJpdmVycy7CoCBJIGRvbid0DQo+
ID4gdGhpbmsgdGhlIGtlcm5lbCBkcml2ZXIgc2hvdWxkIGJlIGJlbmRpbmcgdG8gbWF0Y2ggYSBw
YXJ0aWN1bGFyDQo+ID4gdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uOyB5b3Ugc2hvdWxkIGJlIGV4
cG9zaW5nIHRoZSBpbmZvcm1hdGlvbg0KPiA+IGF2YWlsYWJsZSB0byB5b3VyIGhhcmR3YXJlLg0K
PiANCj4gSSBhZ3JlZSB3aXRoIHRoaXMgaW4gcHJpbmNpcGxlLCBidXQgSSdtIG5vdCBzdXJlIHdo
YXQgZWxzZSBpcyBtZWFudCB0byBiZSBkb25lDQo+IGhlcmUuDQo+IA0KPiA+DQo+ID4gSGF2aW5n
IHNhaWQgdGhhdCwgaXQgd2FzIGtub3duIHRoYXQgdGhlcmUgd291bGQgbmVlZCB0byBiZSBjaGFu
Z2VzIHRvDQo+ID4gdGhlIGRyaXZlciBiZWNhdXNlIHNvbWUgb2YgdGhlc2UgY29uZGl0aW9ucyB3
ZXJlIG5vdCBhZGVxdWF0ZWx5DQo+ID4gZXhwb3NlZCBhdCBhbGwuwqAgSSdtIGp1c3Qgc3RpbGwg
c3VycHJpc2VkIHRoYXQgd2UncmUgbmVlZGluZyB0bw0KPiA+IHJlZmVyZW5jZSB0aGF0IGRvY3Vt
ZW50IGFzIHBhcnQgb2YgdGhlc2UgY2hhbmdlcy4NCj4gDQo+IEkgdGhpbmsgdGhlIG1haW4gcXVl
c3Rpb24gaXMgd2hldGhlciBhbiBpbnRlcm5hbCwgZ3JhY2VmdWwgKHVzZXJzcGFjZS0NCj4gcmVx
dWVzdGVkKSByZXNldCBpcyBhIHJlYXNvbmFibGUgdXNlIG9mIFdESU9GX0VYVEVSTlsxMl0uIE15
IGZlZWxpbmcgbm8uIEkNCj4gd29uZGVyIHdoZXRoZXIgZGVmaW5pbmcgYSBuZXcgZmxhZyAoV0RJ
T0ZfUkVCT09UPw0KPiBXRElPRl9HUkFDRUZVTD8pIGluIHRoZSBVQVBJIHdvdWxkIGJlIGFjY2Vw
dGFibGU/DQo+IA0KDQpBZ3JlZSwgYnV0IHRoaXMgaXMgb3V0IG9mIHRoZSBzY29wZSBvZiB0aGlz
IHBhdGNoIHNlcmllcyBhbmQgY2FuIGJlIGRpc2N1c3NlZCBhbmQNCmltcGxlbWVudGVkIGluIHRo
ZSBvdGhlciBmdXR1cmUgcGF0Y2hlcy4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBzZXJpZXMg
aXMgdG8NCmNvbXBsZXRlIHRoZSBib290IHN0YXR1cyBtZWNoYW5pc20gYmFzZWQgb24gdGhlIGN1
cnJlbnQgcmVzZXQgcmVhc29uLg0KDQo+IEFuZHJldw0KDQpDaGluLVRpbmcNCg==

