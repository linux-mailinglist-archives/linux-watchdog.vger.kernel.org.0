Return-Path: <linux-watchdog+bounces-2756-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BCA1B6A4
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 14:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B937716C8BC
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 13:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF12513AC1;
	Fri, 24 Jan 2025 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JXTht7CS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9135481AF;
	Fri, 24 Jan 2025 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737724230; cv=fail; b=riRuGd0s6fscsHztAqzs6qGuMxJ4UF7QblKRPoPL1UVqB3mpVIFmMb5b/HlK+ixO3yzHqegJRaCsGQELCFa9G6B7ZAIHCh1kEC+T11juJnNWdeWqb/9mQZ+y+z6IJGmWbAJmPthtW2o3aQ4qZCFFLsA5E7tJHnrahEd2B2HiydQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737724230; c=relaxed/simple;
	bh=+qBBHwNUHi7FK18pAWsYHRL0KAKFSaEnblJMxnzeGl4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JDw2fUNz++LuS3uV67c9ZAXH6gPBy906qUV/2ZjI0WWrgcBf5qEbL0Y8ex0XjWzCQVjMUTpBnDrFKwn7KC41cdKGfn0kV4UZ+ACebYqC+i+dnHcQD2XoszuQr3zLtH/EUmxkrcdInfL5hkaEUBKeWIzwaVcuRze4oDER6sealCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JXTht7CS; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlKfGBzOv5izmAL5Tkbs/lXzbugQ92EGQl8XXJ77tvXXQ1sIDvl90yHKHuXCK6IRGC5aqF9mmbpAQ9lelYYuW5D1sFcZy5jw2a7SBBpzKEx9v9BC1zmGIxVZeyx+r3QuNZPgXu9og00Jx9KY6WS7fgIzddBLo0zxuvYMFmS64Q4+hMRdqm39AEzHAvZPYax/uxyzRr3lF+z6U2GjeFQ6A12Cx3nKlF56QJd8gMhmRIaTVyv9E8+DmHaiZrEwlOB4dWz4UgRosAwss04ByyhlVrudjUg+bOiJHM7sYpboWPmXqSWZr3Jckr7eg/lLRIqfY4s3OnKrgawTUXop/cgIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qBBHwNUHi7FK18pAWsYHRL0KAKFSaEnblJMxnzeGl4=;
 b=oe8y9tCprsFWBKD6HS/ZcVD8rWmNzGKt2bJsvqBR6wI9c4GQQUiK9rw2J5RcuPxsqj6zb4xYY52oopACqw20q6BQKFyhQh/QtLdGsl+eJilNS4rP4tMhkk58mcexmkOV1k7a/Y5ABPHfLS4tdGvgPDhBZcK2TFOr1ovwLWpllutLnF0kIQKVhqFj6CTPB6OMlSAS5coj6YNMQ5g2L7M/XBfzH4Gpp7T/fNhtOLv2GJLOQPR4voFx9P26AGBoABu7DZRXEYOo9Jtr4xY9pXDY7NhFG3hBTP1Hpcq4oVJDbMVu2hDKm0QkPShRWFBjiEXop4h00f+TFW5pfuXSmn53+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qBBHwNUHi7FK18pAWsYHRL0KAKFSaEnblJMxnzeGl4=;
 b=JXTht7CSJXhgCOG7oYpcUzAn4eu8Ce2tZWSVb9pbhvmuaBy5+kbd2jt2Mdxtbfa0bak7KtJ1rWEb8dq1YL65c1ZxDlR/M6HO2D+Q2tb4/FrzY1I4F9kn+xXK5rigNq0Dh0MI02lJZo3WcleMGLcJ5fJPLKDVjOPwZFpbbZb0WWw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10168.jpnprd01.prod.outlook.com (2603:1096:604:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 13:10:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 13:10:23 +0000
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
 AQHbZznBkfvGK/9M9kaeTTHwnLvzBrMcszgAgAkPAuCAAAaOgIAAA5vAgAAfvgCAAAGDMIAAA7kAgAABYZA=
Date: Fri, 24 Jan 2025 13:10:23 +0000
Message-ID:
 <TY3PR01MB1134676CABA2ACBA48395491086E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
 <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
 <TY3PR01MB11346DC4A22A2EC0CB0DAF61186E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f4cdcb9e-ae30-45ad-87f4-7395db0ab995@kernel.org>
 <TY3PR01MB11346D1E5B190101E7F474BEB86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <305ba07f-e5f3-4d2e-b017-8a817418f16c@kernel.org>
 <TY3PR01MB11346BADEA961847B84D911E986E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <8bdb2cdf-92cd-46e8-b795-7d5d412a4e07@kernel.org>
In-Reply-To: <8bdb2cdf-92cd-46e8-b795-7d5d412a4e07@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10168:EE_
x-ms-office365-filtering-correlation-id: cd1ba48e-7083-470b-88c8-08dd3c787677
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWRGOWs0Z3huZlZ1R0QwM20zRm93S1JuaHJWY25ZVHlzYVYyYXcxSW53T01D?=
 =?utf-8?B?cEJMajJCNTdRSjJRdGhTUGpGY3NHcmx5V3BzaWMrWGhKNEU1bldmaGpaRTR1?=
 =?utf-8?B?azdMUmxobHZVdTI3VWNKeWtaMTRYMVdPZXJ1eFRhNUI5d0VKRHY2bjY3NTFy?=
 =?utf-8?B?aUp1MURCcjNwemdmVTFWR3NmZGlKMnR4dHRZc3AyTDNMNnhSWCtNbVQ4NXVD?=
 =?utf-8?B?M3ZXTCt6RDRBZmhhbW9vdDRBeWxHTkJSSkNGcmp6OFcwVXI5NmhITEdIa3pY?=
 =?utf-8?B?QXBiK3VBK05MRVA1Z094NUZqTk94LzIxV01rbTVZNjlGR0tRSzZKNlBwR2l0?=
 =?utf-8?B?THNaenovUzBMcGY1L2NOcHJBNTRvSkFzeDl6QkJsT0hqYnp4bHMyRysvSVpy?=
 =?utf-8?B?VGsrcEZDUmJFcWVFQWpzamlGb2RDU2lua3FWcGdrbkl2bDNBTzhicmNqOTBj?=
 =?utf-8?B?Y1l5U2dqSjdDQXNERC9JUEhKOWxjZkkvNENtamxVemdXUVR2NzBQdG9MWDNr?=
 =?utf-8?B?d0F1MlFQWmxUdFEzVVhWblF2cWdTK0lYR2VMYk4vaWFRQnlSTEJic0pjSjhW?=
 =?utf-8?B?bVVwQnpKVVJhLzJsTWFtWGJwYlNpRUdsWjE2VmMvYUkrMm1LNEZva3VKVDhi?=
 =?utf-8?B?b0RMaGxJRGtRWTdNY0FIcXBLelZuZllocjlMMktnRXdaYll6TzJaUUxvcXJz?=
 =?utf-8?B?WWJ0OW9HZkg3c0RQUzJPMGRFcUtISnp3ZzFYTXpuWVYwdGtmWjdKK0ppMDgy?=
 =?utf-8?B?K1R5ekI5dmU5N0h1Mm5WVUpXeXpvVVB1WjFORmhrQlVNdTlJaEFjTHFVaHFt?=
 =?utf-8?B?QlhjRUNsa2lXYzFkLzczNmRycURBdkd1Qmg0ZHdJVHl2OTlCYTNWMTA2VFd2?=
 =?utf-8?B?RVU3VDhTNlFpdzdMTEp2WXF1cUhKdFM5QnE5cHhwZldSVXpERHFJRTVhaDgx?=
 =?utf-8?B?QmtxSzNzZ09kK0dXRnFBT0NQVHNweldPN0NjSWdwMml3OWZZZlZ4U0ROZndw?=
 =?utf-8?B?N0VaTU1lR0h3ajN6ZElkckQyd24yakduczRrWVJsMklLRVFaYS8xcFJkU2w1?=
 =?utf-8?B?MkduL1NqRVMyR1J0Ym5lT0o3Q1k4RDZocUhRVXVIN3M0bDJnNFhGL3VKSGll?=
 =?utf-8?B?ekFrRCtyWFA1ZDYrcWlFN1NveklNd2tLVzFka1FPM256a1NEenRudEFMRUN4?=
 =?utf-8?B?RThPdER2d0QvMWduZlBpTmpoWDZsUEZaRzVMWUdVQ1FKbGlRdWhVS0tMK1Qv?=
 =?utf-8?B?M296eS92L2hsYW40MjdVaWdXTWVCOUY2OUI4SFMrKzVyRXQ3RnRGQjBLekN2?=
 =?utf-8?B?RDNRcVpLU1FQeDhMK1VQWlloQkw3Qzlya1pHWGJWYnJjdWZmTHlwTWt2Nzg4?=
 =?utf-8?B?OVk3ZEl0ekI0cy9uU2pEREdzZ0lzR2hWOTFCSnJuOVVZQng2bXVuNVlFSnV6?=
 =?utf-8?B?ZkdsTGVXYmhIRzFEOXl0SHFMUUtmWHcxZEFRT0d6V1BkQXhHU0ZTK2tqZGFw?=
 =?utf-8?B?cEFwbE45eTV0U0JkSWFoKzl2SDNVWEZHbkcwR29HYi9HRkl6SU9iTnFSdTlh?=
 =?utf-8?B?M1dZY3Q1Yzc0UG9hVGJncGdXWVVLNVFhb0Y1RFhmbXIrb0tUY0QzL1J0UVdY?=
 =?utf-8?B?UXpqcjFjdGJUQVhMYmI3MmJPaDJPSVFpSzNEVmZYUFNOWmtMYUJVNys5TGNY?=
 =?utf-8?B?TVlySWhCZmlhTHE4THB0ZmVFcndGOUd5c1d5enJ6OVowdU02L0YvSlFUSS9T?=
 =?utf-8?B?TmkvMHVDK3NTcTl5V3c4NTJQcXFQOHQvVjRxYWZVaHBMZU1KTFQ0Nm1ma2NG?=
 =?utf-8?B?VCsyUmpCbnIxbmxjcThCQkxlQzNSNFN4cU5IVXZlUktJL3lBSHltV0J3NjE3?=
 =?utf-8?B?UllLSDJKeGpOb1ZKL28yYXp5M1JQZ2R1S2k5S2N2QmxhaFR0UTNseEhFdG1H?=
 =?utf-8?Q?ZOSsFPyiVf9Dn4QL8I5cYco4XDY7fvmk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SU1zeEtLOENHejUwOWFoR000c3BrUTNMODk4Z3pvbmJYSjVVMFNmQ3NFWDRp?=
 =?utf-8?B?QW9ZOGcxR2doVncwM1orN2pGQlpLOHY3MVlQaTROWTVtb1NOaVFvV0ZlWEpl?=
 =?utf-8?B?K2NmdFNaU2tpdGFYamhvVTZWdzdVQ0FSZ0lDSWVYY3hNVXBKSTMxM1VUZjBN?=
 =?utf-8?B?SVFIcDVhLy85Wkp5YnQ1VmpmZVhwTXJXU0JkZkh5eVh4OTQ5VE0xSGw5Y28r?=
 =?utf-8?B?YWdEdXdEMTlPQWUyR2Ntb2QvS2EwOE5WcmlyQS9uRmFwMlB4dEorMTh3RGQ3?=
 =?utf-8?B?aHZVd2xtcnFZZFRoY2ljWXFubnd5S1UyUEtrOHg0R21ZK3V2V1pweUV2dllk?=
 =?utf-8?B?TlFWaUUrYlFPZ3FFS2czQzRaM201VDh3K1BUSFR0N0ZKcWVvalZXSHZZenRZ?=
 =?utf-8?B?Um5HNHV1L3VpV1AyWXo5T2YrYzAzM3pZOTJuMHdhcTI2QXdqRW9kMmFtRnhL?=
 =?utf-8?B?Q29QQVErWlMwOXhoYXpNZjF6OUdzVk1SV3RoUXNscnNRdTlWL2wyTFdaSCtI?=
 =?utf-8?B?NlZTWlU3dWszUnJMRUQ4VVV2d1c4ZUlXUTdmN3hvcHNpUGpxejRUbEJQTFQ0?=
 =?utf-8?B?aXB4d1NJZm9WRnh3dzB3aGMvdEJjQmJ5Tk5ZM2tIdmhCWmUySllabk1GYTVQ?=
 =?utf-8?B?Z3dFYTVCZU5ibEF3UmlIWkZjYTJwK1N4bUxDWjNLRWszQkhCanVnN1pSOWw0?=
 =?utf-8?B?dzZjZUVyTUNzUUZUcU4wMEgwU3VoK0dsYUxCQmQzQmh3a2x4TFBNTk1GOERq?=
 =?utf-8?B?OEYwNU1LeG9vaU1LSkJHdDh6Tm1LRVFzUmRyZkY3QlNsazdWT0lIMUtjSzRE?=
 =?utf-8?B?K2JEd2FsOTBFRnFpbGVrWkFiaXAzYTlNaFExaG1Ld1VrblBZeHRVbkM1VEN6?=
 =?utf-8?B?a0kzcmIwd3JQN1RzOEdzZGtneUF5WFkxYTFXWENjMkk0TGFRd2lwWkYvMnQ2?=
 =?utf-8?B?NFdnclJRam5nOXlydG5mSjh6OUZWZ1greDZISE5SUkYzbVJiTSs0dCtjeGJl?=
 =?utf-8?B?N2h3UzJzbWhWRUtGL2xsaHh3T0FnMEJ2aEozalRZOGh4ZzJlSGpETTFBQmUw?=
 =?utf-8?B?WFhYZEdmeGpiVFFCdEc3U1FXMGxveGxwcDJLRzA4Qml4eHJ3bHR2aS90R001?=
 =?utf-8?B?eGNoenRLdUVhQnU5aWtsUzVGZ2dmMlRqdWRWTkJ1OWVIK2hGL0c3V0owSmdZ?=
 =?utf-8?B?RGl1R0F1Z1R0bjIzVGFIRmJFV2xHOHlUdFFKVnJ6RjFPTlNWK1VoK2V5UUpC?=
 =?utf-8?B?V2c2T05OZTRjRitPSlRES21HeGl0SG1Dd2dReUdvbXRqWGY0Vm8xM0JJRVdN?=
 =?utf-8?B?Qm9YRzdCTjQwUUZ6TVBoeG9IRzJMbWcxZ2ZlRFNNS3EyQTNheHNQdXl4cG9m?=
 =?utf-8?B?cTNHdEZKdVdiWStHcmZnMGVrclRPWWlDaXY0ZnFFNmg0NnMyY2NWZStzQ2tQ?=
 =?utf-8?B?UGRiVXQ0RS9FZkNHZTFFbnFVZCtsT1d1QVRWNmRtaUpSQmt0dlR4NDR5VVNq?=
 =?utf-8?B?NFFnb2hmY3J1YWYyWmhtMmxFazNJTFZQeHNoN1FuRktZQjN0dSs2THhyeGVE?=
 =?utf-8?B?c20rT3c0d09FTjQ0WkhSTWtmTFN1ZlRrcHNKajFtcERUWW8yUjcyT1pOZkxm?=
 =?utf-8?B?cy9TaG9tVWJPUE9EeHJ0cWEzZERVY2pUZ1lGNHNVWFJXSkdhaGNMLzNIM0xE?=
 =?utf-8?B?YlFjRjJhYUE0VzJpS2h2bWkxNmYwck1Ja2YrMDdsWEVxSFplWUoyTHR6MDI2?=
 =?utf-8?B?WkI0ZjhxZlVuK3NobC9Gbm90UWtiRFVPT3M0dkhxb3hiZ0FWQzRjZk1HY2t4?=
 =?utf-8?B?U3hFelVpZlFqRlZ0a3Fxa3FzV3NtSEZKWDlwVHlkOXlVVXlYUktKZndqdmo5?=
 =?utf-8?B?WGdIU3Y4WU5YbXJiREppREEzRndKNTh0MVlWdWYwdmZBSW8rcC9IU0xqUlZx?=
 =?utf-8?B?dXN0Y2IxcHB4ZTFYd2ZxQXMvQWZjVU9vamY0dTNHOGxrYUJVekh5cHJPakMx?=
 =?utf-8?B?N2dGczkzbEdWcndjaWNmRURrbHQzaXVWOWIwNFVWMmZTZmpKbVBNTDJBY1da?=
 =?utf-8?B?NGNtRDRDcEtVSkZqSUlFNlJWVjk0UGg2YnBYR0g2TjQzZTNEREQ4VHoyRjBr?=
 =?utf-8?B?NGpOVUtBOGloZXVqN2phMXZsZ1RZSUl3bmJiR1ZPWi83RmQ4Z1hDUlhhMGpk?=
 =?utf-8?B?RkE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1ba48e-7083-470b-88c8-08dd3c787677
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 13:10:23.7576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dzk9mG//OxjGX3uoGnmSNKSA1Luy4N1/fcLOhucmjIUgxv+ColOYlaosnU0DyR00nHkSOPzekJX9KcXB2EoDS4uCF3EGWVuUmgp+aVsFiPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10168

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0
IEphbnVhcnkgMjAyNSAxMzowMA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNV0gd2F0Y2hkb2c6
IE1ha2UgUlpWMkhXRFQgZHJpdmVyIGRlcGVuZCBvbiBBUkNIX1I5QTA5RzQ3DQo+IA0KPiBPbiAy
NC8wMS8yMDI1IDEzOjU1LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YgS296bG93
c2tpLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogMjQgSmFudWFy
eSAyMDI1IDEyOjQyDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy81XSB3YXRjaGRvZzogTWFr
ZSBSWlYySFdEVCBkcml2ZXIgZGVwZW5kIG9uDQo+ID4+IEFSQ0hfUjlBMDlHNDcNCj4gPj4NCj4g
Pj4gT24gMjQvMDEvMjAyNSAxMTo1NywgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBLcnp5c3p0
b2YgS296bG93c2tpLA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+Pj4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4+
PiBTZW50OiAyNCBKYW51YXJ5IDIwMjUgMTA6MzUNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENI
IDMvNV0gd2F0Y2hkb2c6IE1ha2UgUlpWMkhXRFQgZHJpdmVyIGRlcGVuZCBvbg0KPiA+Pj4+IEFS
Q0hfUjlBMDlHNDcNCj4gPj4+Pg0KPiA+Pj4+IE9uIDI0LzAxLzIwMjUgMTE6MjAsIEJpanUgRGFz
IHdyb3RlOg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+PiArCWRlcGVuZHMgb24gQVJDSF9SOUEwOUcwNDcg
fHwgQVJDSF9SOUEwOUcwNTcgfHwgQ09NUElMRV9URVNUDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gQnV0
IHRoaXMgaXMganVzdCB3cm9uZy4gWW91IGFyZSBzdXBwb3NlZCB0byBkZXBlbmQgb24gcmVuZXNh
cw0KPiA+Pj4+Pj4gQVJIQywgbm90IHlvdXIgaW5kaXZpZHVhbCBTb0MgKGFuZCB0aGlzIGlzIHdo
YXQgeW91IGNhbGxlZCBoZXJlICJBUkNIX1I5QS4uLiIpLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEdy
ZWcgbWFueSB0aW1lcyBnYXZlIHN0cm9uZyBvcGluaW9uIHRoYXQgZXZlbiBmdWxsIEFSQ0ggaXMg
d3JvbmcNCj4gPj4+Pj4+IGFuZCB3ZSBtYW5hZ2VkIHRvIGNvbnZpbmNlIGhpbSB0aGF0IGl0IGhh
cyBhIG1lYW5pbmcgKG9yIGhlIGRpZA0KPiA+Pj4+Pj4gbm90IHdhbnQgdG8ga2VlcCBkaXNjdXNz
aW5nKS4gQnV0IHJlc3RyaWN0aW5nIGl0IHBlciBzb2MgaXMNCj4gPj4+Pj4+IHBvaW50bGVzcyBh
bmQgaW1wb3NzaWJsZSB0byBkZWZlbmQgaW4NCj4gPj4+PiBkaXNjdXNzaW9uLg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBDdXJyZW50bHkgZm9yIGJ1aWxkaW5nIFJaL0czRSBXRFQsIEkgbmVlZCB0byBhbHdh
eXMgaGF2ZSBSWi9WMkggU29DIGNvbmZpZy4NCj4gPj4+Pj4gd2hpY2ggaXMgcG9pbnRsZXNzLiBN
YXkgYmUgQVJDSF9SRU5FU0FTIHNob3VsZCBvayBpbiB0aGlzIGNhc2U/Pw0KPiA+Pj4+IEFzc3Vt
aW5nIEFSQ0hfUkVORVNBUyBjb3ZlcnMgeW91ciBpbmRpdmlkdWFsIFNvQ3MgYWJvdmUsIHllcywN
Cj4gPj4+PiB0aGF0J3MgdGhlIHdheSBmb3IgZHJpdmVyIHRvIGxpbWl0IHRoZW1zZWx2ZXMgdG8g
dXNhYmxlIGZhbWlseS4NCj4gPj4+DQo+ID4+PiBBUkNIX1JFTkVTQVMgaGFzIEFSTSwgQVJNNjQg
YW5kIFJJU0MgYmFzZWQgU29Dcy4NCj4gPj4+DQo+ID4+PiBDdXJyZW50bHkgaXQgY292ZXJzIEFS
Q0hfUkNBUl9HRU4xLCBBUkNIX1JDQVJfR0VOMiwgIEFSQ0hfUkNBUl9HRU4zLA0KPiA+Pj4gQVJD
SF9SQ0FSX0dFTjQsIEFSQ0hfUk1PQklMRSwgQVJDSF9SWkcyTCwgQVJDSF9SWk4xIEZhbWlseSBT
T0NzIGFuZA0KPiA+Pj4gcmVzdCBvZiB0aGUgaW5kaXZpZHVhbCBTb0NzIHN1Y2ggYXMgUlovVjJI
IGFibmQgUlovZzNFLg0KPiA+Pg0KPiA+Pg0KPiA+PiBSYXRoZXIgdGVsbCBtZSB3aHkgdGhpcyBp
cyBzdXBwb3NlZCB0byBiZSBkaWZmZXJlbnQgdGhhbiBvdGhlciB2ZW5kb3JzPw0KPiA+DQo+ID4g
SXQgaXMgbm90IGRpZmZlcmVudCBmcm9tIG90aGVyIHZlbmRvcnMuDQo+ID4NCj4gPiBTZWUsIGZv
ciBlZzoNCj4gPiBjb25maWcgUzNDMjQxMF9XQVRDSERPRw0KPiA+ICA1NTcgICAgICAgICB0cmlz
dGF0ZSAiUzNDNjQxMC9TNVB2MjEwL0V4eW5vcyBXYXRjaGRvZyINCj4gPiAgNTU4ICAgICAgICAg
ZGVwZW5kcyBvbiBBUkNIX1MzQzY0WFggfHwgQVJDSF9TNVBWMjEwIHx8IEFSQ0hfRVhZTk9TIHx8
IENPTVBJTEVfVEVTVA0KPiANCj4gWW91IHNlZSAtIG9ubHkgb25lIEFSQ0hfRVhZTk9TLg0KPiAN
Cj4gVGhhdCdzIHRoZSBhcmNoIGFuZCB2ZW5kb3IuIEV4eW5vcyBpcyB0aGUgZW50aXJlIGFyY2gg
Zm9yIGFybTMyIGFuZA0KPiBhcm02NCBjb25zaXN0aW5nIG9mIGFsbCBvZiBTb0NzLg0KDQpJbiBS
ZW5lc2FzIGNhc2UgaXQgaXMgQVJDSF9SRU5FU0FTLg0KDQo+IA0KPiBTM0MgYW5kIFM1UCBhcmUg
ZW50aXJlbHkgZGlmZmVyZW50LCBtdWNoIG9sZGVyIGFyY2hzIC0gdGhlc2UgZXZlbiBjb3VsZCBu
b3QgYmUgY29tYmluZWQgaW4gb25lIGltYWdlDQo+IHdpdGggRXh5bm9zIHNvbWUgdGltZSBhZ28u
DQo+IA0KPiA+DQo+ID4NCj4gPiA1NzUgY29uZmlnIFNBMTEwMF9XQVRDSERPRw0KPiA+ICA1NzYg
ICAgICAgICB0cmlzdGF0ZSAiU0ExMTAwL1BYQTJ4eCB3YXRjaGRvZyINCj4gPiAgNTc3ICAgICAg
ICAgZGVwZW5kcyBvbiBBUkNIX1NBMTEwMCB8fCBBUkNIX1BYQSB8fCBDT01QSUxFX1RFU1QNCj4g
Pg0KPiA+IGFuZCBtYW55IG1vcmUuDQo+IA0KPiBBZ2Fpbjogb25seSBvbmUgU0ExMTAwLCBvbmUg
UFhBLiBOb3QgcGVyIGVhY2ggUFhBIFNvQy4NCj4gDQo+IFNvIHRoZXNlIHByb3ZlIG15IHBvaW50
IC0gdXNlIG9ubHkgeW91ciBBUkNIDQo+ID4NCj4gPg0KPiA+Pg0KPiA+PiB8fCBBUk02NCBpcyBh
bHJlYWR5IHVzZWQgc29sdXRpb24NCj4gPg0KPiA+IElmIHlvdSBhcmUgY29ycmVjdCwgdGhlbiBh
bGwgc2hvdWxkIGRlcGVuZCBvbiBlaXRoZXIgb24gQVJNIG9yIEFSTTY0IG9yIFJJU0NWIGV0Yy4u
Lg0KPiA+DQo+ID4NCj4gPj4NCj4gPj4+DQo+ID4+PiBTaW5jZSBtb3N0IG9mIElQJ3MgaW4gUlov
VjJIIGFuZCBSWi9HM0UgYXJlIGlkZW50aWNhbCB3ZSBjb3VsZA0KPiA+Pj4gaW50cm9kdWNlIGEg
bmV3IGZhbWlseSBTb0MgQVJDSF9SWkczRV9SWlYySCB0byBjb3ZlciBib3RoIG9yIHRvcCBsZXZl
bCBBUkNIX1JFTkVTQVM/Pw0KPiA+Pg0KPiA+PiBZb3Ugc2hvdWxkIG5vdCB3cml0ZSBkcml2ZXJz
IHBlciBTb0NzIChvciBldmVuIHR3byBvciB0aGVyZSBTb0NzKSBhbmQNCj4gPj4gdGhlcmUgaXMg
cmVhbGx5IG5vIG5lZWQgdG8gcmVzdHJpY3QgdGhlbSBwZXIgZWFjaCBTb0MuDQo+ID4NCj4gPiBJ
ZiBJIGFtIG5vdCB3cm9uZywgVGhlIHdhdGNoZG9nIHN1YnN5c3RlbSB1c2VzIHNpbWlsYXIgYXBw
cm9hY2guDQo+ID4NCj4gPj4NCj4gPj4gT3RoZXJ3aXNlIGNvbWUgd2l0aCBhcmd1bWVudHMgdG8g
bXkgZmlyc3QgcXVlc3Rpb246IHdoeSBkbyB5b3UgbmVlZA0KPiA+PiBleGNlcHRpb24gaGVyZSBm
cm9tIGdlbmVyaWMga2VybmVsIGFwcHJvYWNoPw0KPiA+DQo+ID4gSXQgaXMgbm90IGRldmlhdGlu
ZyBmcm9tIGdlbmVyaWMga2VybmVsIGFwcHJvYWNoIGFzIGxvdCBvZiB2ZW5kb3JzIGFyZSBkb2lu
ZyB0aGlzIHdheS4NCj4gPiBlZzoNCj4gPg0KPiA+IGNvbmZpZyBPTUFQX1dBVENIRE9HDQo+ID4g
ICAgICAgICAgIHRyaXN0YXRlICJPTUFQIFdhdGNoZG9nIg0KPiA+ICAgICAgICAgIGRlcGVuZHMg
b24gQVJDSF9PTUFQMTZYWCB8fCBBUkNIX09NQVAyUExVUyB8fCBDT01QSUxFX1RFU1QNCj4gDQo+
IEFueXdheSwgdGhhdCdzIGFuY2llbnQgT01BUCwgd2Ugc3BlYWsgYWJvdXQgbmV3IGRldmljZXMu
DQo+IA0KPiA+DQo+ID4NCj4gPiAgY29uZmlnIERBVklOQ0lfV0FUQ0hET0cNCj4gPiAgICAgICAg
ICB0cmlzdGF0ZSAiRGFWaW5jaSB3YXRjaGRvZyINCj4gPiAgICAgICAgICAgZGVwZW5kcyBvbiBB
UkNIX0RBVklOQ0kgfHwgQVJDSF9LRVlTVE9ORSB8fCBDT01QSUxFX1RFU1QNCj4gDQo+IERpZmZl
cmVudCBBUkNILCBub3QgU29DcyENCj4gDQo+ID4NCj4gPg0KPiA+ICBjb25maWcgSzNfUlRJX1dB
VENIRE9HDQo+ID4gICAgICAgICAgdHJpc3RhdGUgIlRleGFzIEluc3RydW1lbnRzIEszIFJUSSB3
YXRjaGRvZyINCj4gPiAgICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfSzMgfHwgQ09NUElMRV9URVNU
DQo+IA0KPiBEZXBlbmRlbmN5IG9uIEFSQ0guDQo+IA0KPiBEbyB5b3UgdW5kZXJzdGFuZCB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIEFSQ0ggYW5kIFNvQyAoQVJDSF9SOUEwOUc0NyBpcyB0aGUgU29D
IC0gaW5kaXZpZHVhbCBvcg0KPiBmYW1pbHkpPw0KDQpBUkNIX1I5QTA5RzQ3IC0tPiBJcyBhIFNv
QyAoUlovRzNFKQ0KQVJDSF9SOUEwOUc1NyAtLT4gSXMgYSBTb0MgKFJaL1YySCkNCg0KOTAlb2Yg
SVAgYmV0d2VlbiB0aGVzZSBTb0NzIGFyZSBzYW1lLiBTbyBjYW4ndCB0aGlzIGJlbG9uZ3MgdG8g
c2FtZSBmYW1pbHkgb2YgU29DcyhlZzogQVJDSF9SWl9HM0VfVjJIIGZhbWlseSk/DQoNCkNoZWVy
cywNCkJpanUNCg0KDQoNCg==

