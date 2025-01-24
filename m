Return-Path: <linux-watchdog+bounces-2749-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F75A1B364
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 11:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6313A3ADE32
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 10:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C08C14A4F3;
	Fri, 24 Jan 2025 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Prvpl4xE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB4A13D520;
	Fri, 24 Jan 2025 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737714012; cv=fail; b=XMGTVLeZ0Czn2F1dnfj4GiZhiT/q1SOcIcTQQF66LTEz/hQZT7PL07SJvXvLZebyS72kY4DI3n9qjsjXPaSAGncbR2Bzbn0ksSefhuYbLSeH1qvY3WqWVyYFsfbpmmWm20gdrMCfm+SvEa9aHoJXekMFb1FfjigY5CzAlT6s8q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737714012; c=relaxed/simple;
	bh=1kqEw4i/f+Ej32Olt68o77hvQVwyNfVUvUsDX3RRM4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mI94/MqOnWmHbLk8IUToY5U+H8JC2HsXL3tz80BjAxbM/TaYzEyiiKsBwww3dCR4PnKf3F8uWw+Wee0LyCn/4zs17wLreXHbveu1ouLRsWshXLBkp+rx1KvK2mkUSjJgCYgeJ3V+i0e5J6n6QDh/O+s3fe61QcwCPVmhfLiIVPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Prvpl4xE; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaCXwgRbfZDLQmrqOltAmIsRA/gQOBfEBg88NWhmB2du4Iv1bLhdTbPAv5gMAq5VHUKbW8yz7zfXHnvGkD73btss8diiCPslrqGkCrHPgWkzlVYI+6WweepeIHUdAc986/oOZdybJ+hG6c1beDoEweHKh7KyVEOEJ3QxDbyTzEbiWsEyzVDEDZccyLjf1VCu/vzhOP3GLdChtxToQoz6dKPbvUZxJPOQuG+X69BHOQr2t40Zemna5NSlyzypGnLJq8D+UdNFDfAAQyO2hqKK+yPOzbp8H+Cid8hRoZXfvmJt6ZZFsfc8Zpig8vngqO7xcDxsHcjE61scGD0PSh7kVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kqEw4i/f+Ej32Olt68o77hvQVwyNfVUvUsDX3RRM4Q=;
 b=TW5I3Mw0OQsIB2hpkYJ6KALgJq8oKIfaAGRK96Ehf8PS9EpD13rVySzXZUrW6J+/belRbhLLqcOR8XF76miXisxdNQxCanxg1N6JjLhXexrd9Iaau5AryyqfULymi79FWt7NwkEFwK167oboHKKwyHJz9HOMLO/Am0VYLVRyuZI43Y4o36hfNaf4EahTAf7wRM5iWs9Yp3pw3216Vd/lnibLeGh7FdlX826/Z4/5csjwXaxNjV2PQsnggs9l6jn1jdpzgjyR9ndCSrHVK1Q3RqLVSCMg4pAORW2V9Catj8nFID7wmPkRH3/WF/YR6xw7/mwNXmHoKbINBrqiNa039w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kqEw4i/f+Ej32Olt68o77hvQVwyNfVUvUsDX3RRM4Q=;
 b=Prvpl4xEEQVKmPQaug4A/3QaR6nXYlBZNjnqkVsuRePcp6SxLlsXc0Ll5ac+m7GG14CGgg3c11+O/a1Rdn/GJIHQL0PyuqaHjcfWVjDUyrblJWh1gsKonV9fFQerbrUapX5kba3r9fex+0Khed4MtlMRiWhQL7U34Wj3HpAcSUQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB5606.jpnprd01.prod.outlook.com (2603:1096:604:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 10:20:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 10:20:04 +0000
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
Thread-Index: AQHbZznBkfvGK/9M9kaeTTHwnLvzBrMcszgAgAkPAuA=
Date: Fri, 24 Jan 2025 10:20:04 +0000
Message-ID:
 <TY3PR01MB11346DC4A22A2EC0CB0DAF61186E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
 <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
In-Reply-To: <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB5606:EE_
x-ms-office365-filtering-correlation-id: a5d309e0-a1a4-47d1-0169-08dd3c60ab81
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R0x1d0hzTmQ1VGJ4dXNraHhsQjdkUXV2S1Vpc3hwRG1tR3QyQnhZanZsRW10?=
 =?utf-8?B?ejRBSFdmRFp0ZWhyR09WZEpvb1BUbVo3MGJKSnEwcjlMT1JaTGRPc0RsZmd6?=
 =?utf-8?B?cXd0cVNNSVA1UWZCaitwaWFkYXBrenZoM3NqQVQ4TmhSUTdXVnI2V3ZtZ2dR?=
 =?utf-8?B?ZCtrVkRvKzA0dEpSRTc0SkcxT3FMa3pWcW1IeVlyU3JaYUwvWW90TlVRRjFw?=
 =?utf-8?B?SEd3RUtmbXljS2p0d2c1aGdId1djcGUxSEc2K0hYUE1IT2dxNUNoanVQcHZl?=
 =?utf-8?B?WS9mbGJPcSs0a3M5Y21KY0JJNnJQM2J2ZVBOQVNYSFFEcytsM1NTZUQzUmtK?=
 =?utf-8?B?TGMvZkJHWTFRKytzMTVLTEN0YUJmRXpNVFBaNFdHNmJPTXUzQzJOY3BIUjJh?=
 =?utf-8?B?WUZmKzdlMEIvMzVzVC8xclV2MEtlNnkxTzkvRnArREZaaktnZCt1ZWhsUDdo?=
 =?utf-8?B?VHVBV0hqK2psdlYyQlNoQ3drV2M3cUM4YzJkb0VOZU9mSHQ4NWZlekEzV1hR?=
 =?utf-8?B?TVM3OGE5Ymt2OTArc21FTlNKdW1lUVo1UlJISnJ6SjExVmY3UWlQMzM4UDFF?=
 =?utf-8?B?aVpQbUJGVndRV2hFWnRrRi82MjFFdU1pMzZpYVhTTDR6S01HZzIvOENyNDhu?=
 =?utf-8?B?UmdFTnowekpOTWdlWmt4SWJuRjlyenBIeHAwM2JOclB1MHdvSUFOZGlyTTlh?=
 =?utf-8?B?bzRRTkVaVUVld0IrcWx3cnRuaDVCRm92MG1KSnZ6ay95RHlsWnFFQW5CZVBl?=
 =?utf-8?B?bWI5cFc5cmx2WHErVGZ4UG5kSmVxSXNXRWZiRnRRT3hEdXFiYkRhSmdhaVVK?=
 =?utf-8?B?V1NNTTBURUpWV29WVlczSFdCQnZobHR4NVpPQnkxNEZwZUl3MExVS3grbmFT?=
 =?utf-8?B?cCtza0U1cGY0VTFnVFhucU1adnVyVU9HUVRQMmR2Z1V6KzdNdVlOWXl3bWIx?=
 =?utf-8?B?alI1eitldFVGTlJ1ZEJTNUw1ekZqMFpsWXhUaXcwbm1CY29MNm5zYVppd0Rv?=
 =?utf-8?B?NFk4dERsRXJRZjhSRGx6ZEpqcTBzOXlpbjJTYmlhclljVE53OHpyUWNUM1VS?=
 =?utf-8?B?RDFkTllEWll6UlJDaU9OcENBYnlIQzZnczlvMFJYWE0zbWtOcWtSb3JCajgv?=
 =?utf-8?B?V0g3YzhqZmVJVzNvaFo3WldzbHlsdk95TUk5b3c1ZUJUczZYenp4STg3Zm9X?=
 =?utf-8?B?SHFFNWY3aHJZbnp1bVB1WFU4MnE3ZzlvRm91elJESmhYcVg3UVdmQzEzTGkz?=
 =?utf-8?B?cUUxTm5XSGhxclZ0TWlNRVU1V0NNOHZ4TzIxbmlIMlNyVGZsMzNXSFhjVFJD?=
 =?utf-8?B?Zm1tNS9uaUlGbWs2UkJDdURLRDZpRGpkTGEwR243dnltS2x4aG1hM2xWL29O?=
 =?utf-8?B?YTlNSjZFeTA3UUxxZ0RIV1VrOGRUdlJ0cXhwcTZxSGh1MjlNNHVubldVNGxh?=
 =?utf-8?B?Z0lFZ29ic1pUbS9ESEtFWkhYV2MrdFVMQ1VoVW9SY0FSM3pzeC9DTmcyMkFr?=
 =?utf-8?B?VEgvcVJqWnN6a0thMTVNeHlEMDVZUmw2dHl3MGlIVTFJOVJLenBhRnM4TnU1?=
 =?utf-8?B?a0k3MEIyWE5pRE1kTGlHTG00d2l6NmwxeWZyZ29JQ0tBRElWTjJqRVBRZi82?=
 =?utf-8?B?eGNXTFV2Nk1GSDNSVVpNeUw4clk1QjBHQmFOVnZuQ1I1UWMzNnhTSE93RDlW?=
 =?utf-8?B?OEdFYmpRUlgvR3kzVWZxM2ZmYnppNkZNYllmZUg1WXVGQzk5Mno4cXMxVEtB?=
 =?utf-8?B?K2k1a0N4SVFvWW8xdjFwTFZTVnNtNGNmcFdWK1Y1NDA3TlIxNDlHSWNWeGEx?=
 =?utf-8?B?SjBvM01KMWgrdXRDUTd4ekRMYVMvZmkwUCs5U3dLQkFxU2dhZjZtUHFKTHRF?=
 =?utf-8?B?c1p0eEh4RjBJMWxZdnBFc1NXUlh6LzBYbUxHbTZ0RkpxOFIzNjB3YTdFYllJ?=
 =?utf-8?Q?IzOKcJce5baJ+xXrnKDHSx6vtphJblA8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QTRTUmtHTWpXei9ZcHlPYjEwTVczaE9RZlNxdWRKK1ptS3Y3cS9VRTBOTUpM?=
 =?utf-8?B?eWs0Q1o2clFPMkRMTHlQQmx3S1JIT092N2lSekcxaWh5ZGZDcHVkZXVsSjZP?=
 =?utf-8?B?RzhUenBMaWczNUF1UGN0T1FpYitwRjc3c09qMEh3WTlySCtUaWtrbVJxRkFS?=
 =?utf-8?B?NGVvQzZZZEREeEozNDBMQkIzV1NqYnBnOFloQTVvUEhyWm9PcTZEUEpKQUg3?=
 =?utf-8?B?ZEVld2h6SWxwWHE4RTc5SVh1L0h5Q2RRUjhVTHg2NllxNnFhN00vRXhMRnVQ?=
 =?utf-8?B?alZLZ2RwUWtxQ0NsdFJ1aGJ2b0JUNjU5MkVnalNGb1NQM01iZGU0SXpoVmlh?=
 =?utf-8?B?K0JtS244Tk9ZREFVbWMybkxRbDd1cU1XZnFzUGNJYTRtbUkxcGZuRzBQT0Ur?=
 =?utf-8?B?ZWdNT0tmZ2RQSXFPbFd5a09haTE5NzFCZW1mbmRGSVlUL3hsaGhXZ2VGYS9w?=
 =?utf-8?B?a0g5bjR2eERxVlBPNlZscHAzTFVhK0RmR0J6R1RyTWN6RUJ1eTR5RFRveGFi?=
 =?utf-8?B?TlkyY2MwbFNiM004d2FvNkx2L1QrUG84ZVNmQTVlWXZNS3F4TTFFenZvdEpJ?=
 =?utf-8?B?dnZBR1FzYlZmbU85dnVEb21KcUlZZUNjZTBYenpPaUxyREdBZHptbi9pZlF2?=
 =?utf-8?B?d0VrUUpXOUc3QzQ4SVFZRWdldXhVcnplbk9LNlR4eWxFMEw2KzY0YmUzd2NT?=
 =?utf-8?B?S2tJYmN5Z3NuWERGbGJGU1JDQXplVENKc2ZPcERxWkdvN0ttWEl3VWdnY3B3?=
 =?utf-8?B?RjBibUpkTWpVZGZwMnlVMEpXc0ZBU1Q5QjBPWGtKQUhqMkFTWGRxTGE2Snds?=
 =?utf-8?B?WHNFWXFNQ25yNFRPQWZyeThVeTBvRVdhWW1nd1VodGovbTllRDJ3U2ZZRENH?=
 =?utf-8?B?V0tnelBtbDFXN0pDZ1M0MFA1ekFhVk4vVkc0OG4wNEowVDJwN1M2YndZaFgr?=
 =?utf-8?B?VnhaSnc0WW9SejFXb2tMSzVOQWw0RklwVEVXUnlPM1d5Kzg5QVRucmtnbUJj?=
 =?utf-8?B?WVJ3MEQxTTREdjhGQzhHeklKNFJMRU0wZWd6MTNVQlQxU2U5WXVLeDNwVnBZ?=
 =?utf-8?B?ZGY1U3hyTmMzRXdFS1VIRzJRS3dsOXdOQnNhQURUdStoeHlHeXZaVzc1YXJz?=
 =?utf-8?B?ZGdHZ1VSQ0FwNXoyL3dWSVJaaXdyc3BWVXIvMnNRTVN5a2tsWUxlTE5jNHkv?=
 =?utf-8?B?QU8rSnZOU3MzRWdDK1dMNVFoaWlZVUNBcTU4VmhGZ1AzSnBSRWtRTlVQTXho?=
 =?utf-8?B?cVJsZGFqS3hSTHBLd29MUDl0c2tqclZKMVQ1MDZOcytXKytQOXdhNVU3eU1B?=
 =?utf-8?B?a2thUUJ6cTlLaTNYWmpvdkhsSFJmME5XMDFlRkZKSDZUWW9FbkZKekt1Z3k1?=
 =?utf-8?B?UkpTMURzaEhlR1l0R25tWnBDWEd6b2N4TmdpZ1hGdFVXMXhqamtKV2pyYlBW?=
 =?utf-8?B?d1d3d2grcDNyempoc3daRXpEZGxSRkRlcmRZcjhsc3NKNmoyUkUyN2dLd284?=
 =?utf-8?B?bU81aXNibktQd0FRdlhYcXRnWmRNZi96OHNzNnljY01UWXVaMnVOaEdUb01C?=
 =?utf-8?B?TXBySkVNWElINHBjQ0lLUmNxYjF1Qm4yUHhrTnNzYVc4ZkkxNE1ZT285WmRy?=
 =?utf-8?B?TUVkd3h2VlNOZDRRcE5zSU1YN3krOWg3VmwwQ0hydlE3K1BuMEl1dkszSDB5?=
 =?utf-8?B?VjhKa3h1TW9MLzV4dFBzM3RJcUZQVGJ1RUcwYTU1bUxINjlyVFFaUnFERS9h?=
 =?utf-8?B?ejA0VTBtMHV3RU1ab3JwbjZHYm9XbFE0d2Fjeng3V0NTcGkxS0Rvb29ENUk2?=
 =?utf-8?B?bEdQa3JMNFZlV3o0T0ZrZklNN3hSdHZyakQ3cXM3Z1kwSklINy9hQUcyYUVG?=
 =?utf-8?B?Szd0aHUvekRVbEJtTkQwb1Z1cVVDTjZTNUdaTzZNekJpQ09HOFMxQTZlMW81?=
 =?utf-8?B?cmNnY2UwSjQyVjBNSUZ6ZWxPT0dxUkQySXZoTGxHSnZZWUxYdE1oVDNGZUE4?=
 =?utf-8?B?eitMeFAzWGtWSWFBUXgxVUUrZ2Jva3o1dC9JbVRzaEVsdmlJSjZFUEVkOVpz?=
 =?utf-8?B?UUQ3V3ZuUmZBWkc1K0tQamFiY0JHcGZpQ3ZEa3l4OTFaWWJtbEh6NkNPUHlx?=
 =?utf-8?B?dG1XZnNJY3BUanFWNDQwMnRiNlJMSi8xZXJuOURaVW9NZHFlL0E3RHZPUGU4?=
 =?utf-8?B?QVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d309e0-a1a4-47d1-0169-08dd3c60ab81
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 10:20:04.7858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30GqHm3Tjkb01ddvdWzigo53bRv51FgWZ4EU873IXnd/OzuLa8FbyLxfOJiArul2EesdMjGL0HJbUzwMv1yEhb3u4ij0NdgIiSVl0YdWHUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5606

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAxOCBKYW51YXJ5IDIwMjUgMTU6NTENCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAzLzVdIHdhdGNoZG9nOiBNYWtlIFJaVjJIV0RUIGRyaXZlciBkZXBlbmQg
b24gQVJDSF9SOUEwOUc0Nw0KPiANCj4gT24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMTA6Mzg6NTJB
TSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gUlovRzNFIHdhdGNoZG9nIHRpbWVyIElQIGlz
IHNpbWlsYXIgdG8gdGhlIG9uZSBmb3VuZCBvbiBSWi9WMkguDQo+ID4gQWRkIEtjb25maWcgZGVw
ZW5kZW5jeSBmb3IgUlpWMkhXRFQgZHJpdmVyIHdpdGggQVJDSF9SOUEwOUc0NyBhbmQNCj4gPiB1
cGRhdGUgdGhlIGhlbHAgZGVzY3JpcHRpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
d2F0Y2hkb2cvS2NvbmZpZyB8IDcgKysrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
d2F0Y2hkb2cvS2NvbmZpZyBiL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZyBpbmRleA0KPiA+IGY4
MTcwNWY4NTM5YS4uNjQ2YTg0Y2MwM2UzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hk
b2cvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZw0KPiA+IEBAIC05
NjMsMTMgKzk2MywxNCBAQCBjb25maWcgUkVORVNBU19SWkcyTFdEVA0KPiA+ICAJICBSZW5lc2Fz
IFJaL0cyTCBTb0NzLiBUaGVzZSB3YXRjaGRvZ3MgY2FuIGJlIHVzZWQgdG8gcmVzZXQgYSBzeXN0
ZW0uDQo+ID4NCj4gPiAgY29uZmlnIFJFTkVTQVNfUlpWMkhXRFQNCj4gPiAtCXRyaXN0YXRlICJS
ZW5lc2FzIFJaL1YySChQKSBXRFQgV2F0Y2hkb2ciDQo+ID4gLQlkZXBlbmRzIG9uIEFSQ0hfUjlB
MDlHMDU3IHx8IENPTVBJTEVfVEVTVA0KPiA+ICsJdHJpc3RhdGUgIlJlbmVzYXMgUlove0czRSxW
MkgoUCl9IFdEVCBXYXRjaGRvZyINCj4gDQo+IFRoaXMgaXMgY2xvc2UgdG8gY2h1cm4uLi4NCj4g
DQo+ID4gKwlkZXBlbmRzIG9uIEFSQ0hfUjlBMDlHMDQ3IHx8IEFSQ0hfUjlBMDlHMDU3IHx8IENP
TVBJTEVfVEVTVA0KPiANCj4gQnV0IHRoaXMgaXMganVzdCB3cm9uZy4gWW91IGFyZSBzdXBwb3Nl
ZCB0byBkZXBlbmQgb24gcmVuZXNhcyBBUkhDLCBub3QgeW91ciBpbmRpdmlkdWFsIFNvQyAoYW5k
IHRoaXMNCj4gaXMgd2hhdCB5b3UgY2FsbGVkIGhlcmUgIkFSQ0hfUjlBLi4uIikuDQo+IA0KPiBH
cmVnIG1hbnkgdGltZXMgZ2F2ZSBzdHJvbmcgb3BpbmlvbiB0aGF0IGV2ZW4gZnVsbCBBUkNIIGlz
IHdyb25nIGFuZCB3ZSBtYW5hZ2VkIHRvIGNvbnZpbmNlIGhpbSB0aGF0DQo+IGl0IGhhcyBhIG1l
YW5pbmcgKG9yIGhlIGRpZCBub3Qgd2FudCB0byBrZWVwIGRpc2N1c3NpbmcpLiBCdXQgcmVzdHJp
Y3RpbmcgaXQgcGVyIHNvYyBpcyBwb2ludGxlc3MgYW5kDQo+IGltcG9zc2libGUgdG8gZGVmZW5k
IGluIGRpc2N1c3Npb24uDQoNCkN1cnJlbnRseSBmb3IgYnVpbGRpbmcgUlovRzNFIFdEVCwgSSBu
ZWVkIHRvIGFsd2F5cyBoYXZlIFJaL1YySCBTb0MgY29uZmlnLg0Kd2hpY2ggaXMgcG9pbnRsZXNz
LiBNYXkgYmUgQVJDSF9SRU5FU0FTIHNob3VsZCBvayBpbiB0aGlzIGNhc2U/Pw0KDQpDaGVlcnMs
DQpCaWp1DQo=

