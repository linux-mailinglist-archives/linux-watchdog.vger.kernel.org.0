Return-Path: <linux-watchdog+bounces-2690-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CACEDA0BE3F
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 18:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3D56188316A
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 17:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014CD1B4145;
	Mon, 13 Jan 2025 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="p7foJzi7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495014F9F4;
	Mon, 13 Jan 2025 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787744; cv=fail; b=Z4O81/0NBeL3oLREi6Z7uukkTKL1HLzZYxnUOwnN974qQFmLs2lTMw9foORyq6QrsiB+vPSghQ9d5eM5iBgzRW9eaEO3Zp572P+xZxOXXICR7IPdS+Pj9CDzo4po6n+xjUxeFd87pQu6Oatf9HI/J+/kJ31+rjB7rhDUOTSYvL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787744; c=relaxed/simple;
	bh=IO1L0pA+PY1x/cbQENvP+8hcY7hNs5E6YKGZHqxuOXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j7IekUeEvXAmbPtw0dbhA5DMRaPbCtbIKrSnA+Qd7grcvlAGNy5poWTuWoyyYvvatVJqpbIIYefyoxBJsjP44BE3kyYWTaIsX5nS2lwzNkRNbs5eTEgVsguWM2OAOh0p8eF+pqVwr7W4m/40csjuvxGYdgRoJ8qOhrmgjJW5w2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=p7foJzi7; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXwobfx21UUN8LQnGa+pPvmjKmMkVSpd273LPvtBmVt9mwVk3UeFsHb4agYCGWC23RAOvQAcWbCjGlNaZp6TjdRMsc/yEfrxZooQ0pE6m+TFjLp9T+iZFZqwRfDhGXHzA8FNMq2bZD/rhltd+zspap5yJq39uA/kWM93e6g/m51Zhp7F4wn5+2R3AytQwFC+9zeKfj5VuhvbvhddFEDLiGS657+S4rSUDdCN+m86nMbfMKZ/R2DEz6k21TJe0AEJSxiwr+kXbnfNzA1rVrIwGtF2BuLybVXbbUoF97S8ijAqcstY+Oq6M7PXVqZ57l0YGpdGPi++aWE2MHDC/aSnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO1L0pA+PY1x/cbQENvP+8hcY7hNs5E6YKGZHqxuOXI=;
 b=MedtLDvAJdODJvN0sIdk7Q+UyWPf7F5CCD0nnGnaysxqWuDR5DfpEWqMl57G0F9Z0w21UJiHBgB0soO/yg1lr1Xzrm5qU4bKYNKMaiXcoyoNuikshooYcbAy3TsnM8c0eOcUF9XvZPIJ8h2Zek+FDYOaoz/ADZmzT89CtyrquCD0Y0qOHI2upyB/BrKGB7Q0QswI31y5wzvTelxhfUoYFZ/OIT3hTSJwlHcjW7CxWSs0fY0kpHx7c690G6LzNZcRPW3Yi+PGrHsSc4u+joLbTrvXQtXSWiZEOp1xzZmb6gbKT2Qxda4DEQVxIR+zxEIneTnHWeOpfxoxIA8bo+gXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO1L0pA+PY1x/cbQENvP+8hcY7hNs5E6YKGZHqxuOXI=;
 b=p7foJzi7i9lqU9sHEHrdFA2DEh60OqDEFneubHSGRlZhxQJSOT8a/0SPHgqoDYJiavhp0HzkGWTWxAHCSyM/sZeOv8rpcD5VgODL4bqVUAypkyPYMdW7SHRtI2CUb0zx6nzfMIrwunQTNlJHNWSf0agbX5fWX9J05HnJ/oaOngU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6095.jpnprd01.prod.outlook.com (2603:1096:400:4f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 17:02:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 17:02:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
Thread-Topic: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
Thread-Index:
 AQHbZa2mzHd3tjC1ZUuh3r0qDg28ZLMUkSHAgAAUMoCAADovAIAABbKAgAACMKCAAAZZAIAAADxg
Date: Mon, 13 Jan 2025 17:02:18 +0000
Message-ID:
 <TY3PR01MB11346449DB24473907FA7618C861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tQ_tyxPn2pO=mSPVW2RffVhFz=CPCxR2pxXP1FLkcQcA@mail.gmail.com>
 <5cb9f4c9-c1b2-477c-9c6a-797a4e60d30e@roeck-us.net>
 <CA+V-a8sCTNdoxNksd_N-j7i_VJq-qL9_cv22HT7DXE-M39XLmA@mail.gmail.com>
 <TY3PR01MB113464848E24FE536C7088D95861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sd7OwnEduc7=apB-EeKdBMGoLLxSu6fY2zW0x5QsPMcw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8sd7OwnEduc7=apB-EeKdBMGoLLxSu6fY2zW0x5QsPMcw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6095:EE_
x-ms-office365-filtering-correlation-id: 897c31c4-d51f-427e-cba7-08dd33f4098b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjFRQmlYTEwwS1FyS0M4TDF6UHdRY3NqRzRxWC8yTFJTck13NVIvYkpPQ3Z1?=
 =?utf-8?B?Tlc1YkJTdUJ6elBZTG5YSFNQdDNpc2pxVW13aDgzU1diOGlnVkkwbFI4S2R0?=
 =?utf-8?B?N05LekRtN2g2OVo5MVV3THRQMXRFTXN3akJOZVRrZmtHMEdITkd5RCtsKzJo?=
 =?utf-8?B?NjNydkJ1dWFUQXd1aU5weEo2L0kvcWwvdy9YblJiVTM3Z01RVnZ5ZUtlOFgx?=
 =?utf-8?B?aFZLZUpZR1RLZjdUVDAvN0dWQk1kSUlrQkRaRVdMLzBqUnZRWFBZY1ptUEI2?=
 =?utf-8?B?Nkt4YkFVbnhoTCthVWhYNlUvR2VyU1dESlg3VHVqRzNDaEZiNWFWVzJYWUF2?=
 =?utf-8?B?dUhRM3p6UEVPS01RTEJzS0pnclJoVGVQUmZPcGRVMnVpZzd5c3lTQVM2Lzlx?=
 =?utf-8?B?TUFuR2hWZjkwK21OUTVQTnNsYk5BNENtRlN6MER5bHluR3dRaUhpLy9kOXkx?=
 =?utf-8?B?VE1RVThEdzhQcWVrQzIzNFRiRFN1UUhybW5MbUpJZmlmMXZLS25FV2hGS3lX?=
 =?utf-8?B?RCsyWnEvR21ERkMrNnhjb3IwSWlVUmtYdzVhSTlnamtRWVV6dmdTbVZxZUM3?=
 =?utf-8?B?am1iUURXRnh3MFdoVGY0Tk0xVFpWMUxrVThhTEpKa0VYVUpVak10UDNtSWZi?=
 =?utf-8?B?ZWl6QnppM2dMNlpDZ2VhMzdGK3hwSktnOVBsblErZkVWVk03bW9lOUhSMFEy?=
 =?utf-8?B?a3ZTUU51NU91MldOSzFuQnI2amFzUmFvdUNxeEJLZEEyd1pXNVJKWVVCMXpN?=
 =?utf-8?B?NGY4aTdRS0l3L3o2U09aZGZ6YUJJWDhwWmMvd2dsUDVQWTI1bDJtSmtTNXpR?=
 =?utf-8?B?ZTB1L1VWekFWcloxdGc3azZjOGR0Mi80SlFqSXNUSnBGNnF2UEVnb1BLcmFh?=
 =?utf-8?B?MFVjT3NKK2RvNUxlU2VkeDZDaHExMTgzTGNyNHpTMHZoanplY3YwOUtUMVg1?=
 =?utf-8?B?YU9JSmp4R3hneFM0S0RZb0duMzNUWWhRa052K0V4eTQvSGthV2tSYU9KVkdC?=
 =?utf-8?B?V1FraG5HVWVyRFM4b09xakR4RkhpYVVLdHZZbDg2VUx1TUFqYndRSVJMVU56?=
 =?utf-8?B?K3dTb3lleThraVBxelZKVjRWZzhTSGtORStFeVZrbXVNdk9tN3hhK2NrUXRs?=
 =?utf-8?B?RWNhVURZNjViNUhOelRackhud25LNjV3bDYraFlkdDJqMEFLUFBwU2g4QTdx?=
 =?utf-8?B?K24zbWhxZDZqZTFHQnJwRVlteURUR0tNeUttUjZEcmpTU3hZa09SY3ZEdlUz?=
 =?utf-8?B?VFVBcnk2MlBQN2tRWEpxT0Rvd2VhYzI2QXIrellCZG1VcVV0OFlWcFdHUHlJ?=
 =?utf-8?B?MGFWMS9ocFNDL21vQ0lnOEpNUU54akZGcFFxRWtKLzMxdW03K0VtKy93T0wz?=
 =?utf-8?B?L09Gck1LMkx1TFFHU3VTdk16TDZmOXQwTlpnZkYwU0JPdzZiZDBselNEL3pP?=
 =?utf-8?B?RVJQL2E1SGdMcVB0dkI3V0RuVW9iM09VQTNXK0J3aDBNZ3ovanlTOWswTEZG?=
 =?utf-8?B?UnpvR2orK2l1dVRkbCtDcWRsUmpoRXNDSW80SHNsZlpNUzNmWENLVXZ5S245?=
 =?utf-8?B?TkdzTWhYcis0U1NPT2ZCWEd6OEt5NkRsWHBoaHcvRlhyZDdKeFViZDBvbXVM?=
 =?utf-8?B?MXFkamkxM2htaisxTnI0VUd1Mkx6UTB0Y0VXQlRCYUI5TmliaFIwOTA4ODhN?=
 =?utf-8?B?bG5LZmFOTjErdTRsMDFkTjlORXBvOW9KL0JzNnlHb0Y0R1JHR0pPSytUS3J3?=
 =?utf-8?B?Y0lZclZNalAyazRybjNtYVNDb0JmY09HT0NoVTBUbFpKbDZYWGNJeSt1ZlhM?=
 =?utf-8?B?dy9GYmZxMkxIR2hQU0tDZXd4RmpFZEVKVnlCY0U5dUtFL3cvSFM1K2Mzck40?=
 =?utf-8?B?eEtHQmxnZ1dqRFJ3clZYVDdIdjFYVjdKbGZCQzRhRElOT3JGbHpGWXBKTFFr?=
 =?utf-8?Q?mUua1skfw36gqtk9tk7aPfe1Vn4CVXWe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVhkclJOVk01L090ZDk4KzhvQkV0dVo1ZitLMTRFeVc3MG5NcFFSUlJKdkhG?=
 =?utf-8?B?YmxQamFyTWFTdEpCY2IxOFNHS0lUaWJvQld0aDNPa1E4TmExNi9lREpWeWs1?=
 =?utf-8?B?RzJrZlNac0JVZmFPOTF5RmZ4QWpuREswUUxZWjd5RDREdGxLMUkwTmt2YjhE?=
 =?utf-8?B?TEVBOFF5SmNpSFJDSGhZOEhZZUU0N3IvQm1pYkt4RWNtWDVJakhLWlQ5WjdU?=
 =?utf-8?B?L3hmcTQyaDhrOW85azVsQTliL2d5cDRvMUhDa0Y4TlBaTXFMTEppSFFyTTd0?=
 =?utf-8?B?RHFVL05ZQkVKbm8wZS9iZGYwUVk4akZNaldJUXp2MFhpU1B6ZGg1cjhuNkxx?=
 =?utf-8?B?cjVITUhYWHhGU3JGYkliaEd0dFIxbk1POXB2VVphYkphQS8zVldneU8rb1hK?=
 =?utf-8?B?WEtkM2crUXNTS2JHcWtDMVpkcis2eUpBMkluMnpUcmNBQlRFeFJMOTJGZndr?=
 =?utf-8?B?NldmaTIzQlJSUTZGMlNIUGhUWTBjdVFKMENNcklaVjZTcVE0ZEhhSGV5bWZS?=
 =?utf-8?B?TElkWFhMTjgyK0VIRFp4RCs2Tmc1ZUhxMFR1bjAyaTVnN3YvQ2pqZS9OWDRw?=
 =?utf-8?B?VXBWcGcwaTVJNXZaS0NOTmUreCtBSzFVVVVoZUlMNDZiclgyV1hOUi85Y3Vs?=
 =?utf-8?B?RHZWaCs2R1dpS2ZvUDFUZmJEOU91SUk4VEFWdndNVDZNUld3dVZlVTVpTHlV?=
 =?utf-8?B?Nmd3QjZSbmZZdjgyVnRuL1BnaE9LMnZMRTFudEtKVGlhazJ0RFJhTk1Dcmg1?=
 =?utf-8?B?MElMRkN0WktoNlByWmtpaDVmWGJORi9tQkpyWTJuY3phSFkzakRYUDNpeXR1?=
 =?utf-8?B?UGhFdFdQMFZNU0tUa0F3Z0FEaU1qN0o0M1h4ak8ralNGL0dkTHhJZFU5SGUz?=
 =?utf-8?B?aFpYMHAwNk5ZK2EwZkk1VnJiUGVSUWtnVGlDcGRWVWhoNmNTVGZhRVlPbWZR?=
 =?utf-8?B?YXVlM3BlSnR2UGVrQmcyRjMzZXptUEhWVndXeks0S3d2ZzhFTHQ1MVJ3c0Rp?=
 =?utf-8?B?U05jQjd5N0JjZ2EvSnk5YkQ4MWFUZjM0V0FidUoxMFdyellUdkZVNUMzaEZI?=
 =?utf-8?B?YllzSzZ5NENXYThJUVQ2R0dnSU1laU02UkFNc2NCNC91RzYzb1RMVWhPZlBz?=
 =?utf-8?B?eEhNWXdjaVZvS0RmMStRajAvQzVYV3E2Z256TW9UaDcrai9KRENTWjNoVHU4?=
 =?utf-8?B?bnZFQ1pHbVJWbSswV3l5dU9MeVZuVEhJVUMvZ25GcVNLNmR1bEpZZkc0RE5H?=
 =?utf-8?B?cHBRZ2czTEttY3dYTStXUjRjLzkyb2x6VmF2d0dkeUF4dGpLYlVFYjhWVlF5?=
 =?utf-8?B?dkF0c2lEMnVOUHBoMDFUdmpXLzNwUHpYWno1c3g5eTQrZDNpYkpRM0FJdlB0?=
 =?utf-8?B?T0cxVE9VNHN0anhRK3ZMTytSNlVNKzlvQklqMXV4R1dGMDliMVkwRlJLRFVS?=
 =?utf-8?B?S1F0U3d0c2U2eUFrcmJOdHlIV1VlN1hOTlIxSitzeCt0aVdzWnBBUHEzZmV5?=
 =?utf-8?B?a3ROZzdYWEV3YXkzb2trQ2dGT0JQblQ2cEd2VE5zNnV1SXNDWTE4dkpqMmNZ?=
 =?utf-8?B?ck5FYS9zSXc3OXd0d2Y5ay94WWdxREhFbU9KNk8raHNTSEhvWWpRSThyeU1r?=
 =?utf-8?B?SndkejJYTXJSckM3OVpVNVNhd2JKb3dpeTlWcVdDSnFmMzRoQXAwWlFlajZw?=
 =?utf-8?B?RW9SSlFQazlPZzBQWnlWcTFuTWZrWVRtRHJsZjRIeWpEMDhkeTYzNTU3aGRY?=
 =?utf-8?B?c28rRGRTelNzalRoWTFVT3hFVGo4QmRVK24yUUV4RkEwWkxLZmhhU1FvUXBx?=
 =?utf-8?B?SEVwd2VHcklwS3pBWFBPRDBXMktqV1FjQ0ppdXM1U0wxR01OVUkzRGFDVkw1?=
 =?utf-8?B?VUhjbzFtMndGdmtBYkdRcXdOVlgrTnlBVnplcG1mMllEazV6SERwMlhaQlhR?=
 =?utf-8?B?NUJMdGVMT1JBdXo4RkVKVzZWVENFc2NNR3kvY1p6c1l5aHhXcllQM29FamJO?=
 =?utf-8?B?TmJNSk1FSTJBMGNOL2JneUFXd1d1L3dRKzRpK2E0Uk9lMEFMbnhwMW9pZnFo?=
 =?utf-8?B?OE5aUzAwQ00rTlZBY3ZuN3F2SSs2NU41TC9nc044VzBCblhHeVgyZlRqR3li?=
 =?utf-8?B?R2g0WnFUSkp0Ky9vcHgwWWpYSDNwbU9FV3preC9ISkhBOWdwRExVM25BazQv?=
 =?utf-8?B?bFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 897c31c4-d51f-427e-cba7-08dd33f4098b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 17:02:18.1609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ACBXweerhydy8kcj16lGklXgpR481jgG2m+OCbC+Ddk65/xAcW9mU9rJrtrv6yOgWLe5AmlPGqrKapdkPPzVHCI7tcUy5xNdGHg5X3qVE0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6095

SEkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMTMgSmFu
dWFyeSAyMDI1IDE3OjAwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMC82XSBBZGQgc3VwcG9y
dCB0byByZXRyaWV2ZSB0aGUgYm9vdHN0YXR1cyBmcm9tIHdhdGNoZG9nIGZvciBSWi9WMkgoUCkg
U29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgNDo0M+KA
r1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiBIaSBQcmFiaGFrYXIsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+
ID4gPiBTZW50OiAxMyBKYW51YXJ5IDIwMjUgMTY6MjkNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjMgMC82XSBBZGQgc3VwcG9ydCB0byByZXRyaWV2ZSB0aGUgYm9vdHN0YXR1cw0KPiA+ID4g
ZnJvbSB3YXRjaGRvZyBmb3IgUlovVjJIKFApIFNvQw0KPiA+ID4NCj4gPiA+IEhpIEd1ZW50ZXIs
DQo+ID4gPg0KPiA+ID4gT24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgNDow4oCvUE0gR3VlbnRlciBS
b2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gT24gMS8x
My8yNSAwNDo0MCwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6DQo+ID4gPiA+ID4gSGkgQmlqdSwNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IE9uIE1vbiwgSmFuIDEzLCAyMDI1IGF0IDExOjM44oCvQU0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPj4NCj4g
PiA+ID4gPj4gSGkgUHJhYmhha2FyLA0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPj4+IEZyb206IFByYWJoYWthciA8cHJhYmhha2Fy
LmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiA+ID4+PiBTZW50OiAxMyBKYW51YXJ5IDIwMjUgMTE6
MjQNCj4gPiA+ID4gPj4+IFN1YmplY3Q6IFtQQVRDSCB2MyAwLzZdIEFkZCBzdXBwb3J0IHRvIHJl
dHJpZXZlIHRoZSBib290c3RhdHVzDQo+ID4gPiA+ID4+PiBmcm9tIHdhdGNoZG9nIGZvciBSWi9W
MkgoUCkgU29DDQo+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+Pj4gRnJvbTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+Pj4NCj4g
PiA+ID4gPj4+IEhpIEFsbCwNCj4gPiA+ID4gPj4+DQo+ID4gPiA+ID4+PiBUaGlzIHBhdGNoIHNl
cmllcyBhZGRzIFNZU0NPTiBzdXBwb3J0IHRvIHJldHJpZXZlIGJvb3Qgc3RhdHVzIGluZm9ybWF0
aW9uIGZvciBSWi9WMkgoUCkgU29DLg0KPiA+ID4gPiA+Pj4gU3VtbWFyeSBvZiBDaGFuZ2VzLA0K
PiA+ID4gPiA+Pj4NCj4gPiA+ID4gPj4+ICAgICAgQ2xvY2s6DQo+ID4gPiA+ID4+PiAgICAgICAg
ICBBZGQgc3lzY29uIGNvbXBhdGlibGUgc3VwcG9ydCB0byB0aGUgQ1BHIGJsb2NrIGluIGJpbmRp
bmdzIGFuZA0KPiA+ID4gPiA+Pj4gICAgICAgICAgZGV2aWNlIHRyZWVzLg0KPiA+ID4gPiA+Pj4N
Cj4gPiA+ID4gPj4+ICAgICAgV2F0Y2hkb2c6DQo+ID4gPiA+ID4+PiAgICAgICAgICBEb2N1bWVu
dCB0aGUgcmVuZXNhcyxyOWEwOWcwNTctc3lzY29uLXdkdC1lcnJvcnJzdCBwcm9wZXJ0eS4NCj4g
PiA+ID4gPj4+ICAgICAgICAgIFVwZGF0ZSB0aGUgd2F0Y2hkb2cgZHJpdmVyIHRvIGZldGNoIGFu
ZCByZXBvcnQgYm9vdCBzdGF0dXMgdmlhDQo+ID4gPiA+ID4+PiAgICAgICAgICBFcnJvciBSZXNl
dCBSZWdpc3RlcnMgKENQR19FUlJPUl9SU1RtKS4NCj4gPiA+ID4gPj4+DQo+ID4gPiA+ID4+PiAg
ICAgIERldmljZSBUcmVlOg0KPiA+ID4gPiA+Pj4gICAgICAgICAgQWRkIHRoZSBzeXNjb24gcHJv
cGVydHkgdG8gQ1BHIGFuZCBXRFQgbm9kZXMgaW4gUjlBMDlHMDU3IGFuZA0KPiA+ID4gPiA+Pj4g
ICAgICAgICAgUjlBMDlHMDQ3IFNvQyBEVFNJLg0KPiA+ID4gPiA+Pj4NCj4gPiA+ID4gPj4+IFRo
ZXNlIGNoYW5nZXMgZW5hYmxlIHRoZSB3YXRjaGRvZyBkcml2ZXIgdG8gaWRlbnRpZnkgYm9vdA0K
PiA+ID4gPiA+Pj4gc291cmNlcyBsaWtlIFBvd2VyLW9uIFJlc2V0IGFuZCBXYXRjaGRvZyBSZXNl
dCwgaW1wcm92aW5nIHN5c3RlbSBkaWFnbm9zdGljcy4NCj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4g
VGhpcyBtZWFucyB0aGF0LCB3ZSBzaG91bGQgYXNzdW1lIFUtYm9vdC9ib290bG9hZGVyIHNob3Vs
ZCBub3QgY2xlYXIgdGhlIFdEVCByZXNldCBzdGF0dXMNCj4gYml0Lg0KPiA+ID4gPiA+Pg0KPiA+
ID4gPiA+PiBJZiB0aGV5IGNsZWFyIGl0LCB0aGVyZSBzaG91bGQgYmUgYSB3YXkgdG8gcHJvcGFn
YXRlIGl0IGZyb20NCj4gPiA+ID4gPj4gdS1ib290L2Jvb3Rsb2FkZXIgdG8gbGludXgsIG90aGVy
d2lzZSwgd2UgZ2V0IHdyb25nIGJvb3RzdGF0dXMgaW4gbGludXguDQo+ID4gPiA+ID4+IEJ1dCB0
aGUgY2xlYXJpbmcgb2Ygd2F0Y2hkb2cgc3RhdHVzIGJ5IG9uZSBvZiB0aGUgY2FzZXM6DQo+ID4g
PiA+ID4+DQo+ID4gPiA+ID4+IDEpIHUtYm9vdCBpZGVudGlmeSB0aGUgYm9vdCBzb3VyY2UgYW5k
IGNsZWFyIHRoZSBzdGF0dXMgYml0DQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4gSSBhZ3JlZSwgaWYg
dGhlIHRmLWEvdS1ib290IGNsZWFycyB0aGUgcmVnaXN0ZXIsIHRoZSBib290c3RhdHVzDQo+ID4g
PiA+ID4gcmVwb3J0ZWQgYnkgTGludXggd2lsbCBiZSBpbi1jb3JyZWN0Lg0KPiA+ID4gPiA+DQo+
ID4gPiA+DQo+ID4gPiA+IEkgd291bGQgcmVwaHJhc2UgdGhhdDogVG9kYXksIHRoZSBib290IHN0
YXR1cyBpcyBfYWx3YXlzXw0KPiA+ID4gPiBpbmNvcnJlY3QgaWYgYSByZWJvb3Qgd2FzIHRyaWdn
ZXJlZCBieSBhIHdhdGNoZG9nIHJlc2V0LiBBZnRlcg0KPiA+ID4gPiB0aGlzIHBhdGNoLCBpdCB3
aWxsIGJlIGNvcnJlY3QgdW5sZXNzIHRoZSBib290IGxvYWRlciByZXNldHMgdGhlIHN0YXR1cyBi
aXQuDQo+ID4gPiA+DQo+ID4gPiBBZ3JlZWQuDQo+ID4gPg0KPiA+ID4gPiA+IEFsdGVybmF0aXZl
IHNvbHV0aW9uLCB3b3VsZCBiZToNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IExldCB0aGUgVEYtQSBj
cmVhdGUgV0RUIG5vZGVzIGZvciB1cyBhbmQgYWRkIGEgcHJvcGVydHkNCj4gPiA+ID4gPiBgcmVu
ZXNhcyxyOWEwOWcwNTctd2R0LWJvb3RzdGF0dXNgIGFuZCBwcm9wYWdhdGUgdGhlIFdEVCBub2Rl
cw0KPiA+ID4gPiA+IHRvIExpbnV4Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gcmVuZXNhcyxyOWEw
OWcwNTctd2R0LWJvb3RzdGF0dXMgPSA8MC8xPjsNCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4g
PiBUaGF0IHdvdWxkIHJlcXVpcmUgYm90aCBhIHByb3BlcnR5IGNoYW5nZSBhcyB3ZWxsIGFzIGEg
Y2hhbmdlIGluIHRoZSBib290bG9hZGVyLg0KPiA+ID4gPiBJIHN1c3BlY3QgaXQgd291bGQgYWxz
byBiZSBpbmFwcHJvcHJpYXRlIGFzIHN0YW5kYXJkIHByb3BlcnR5IGFuZA0KPiA+ID4gPiB3b3Vs
ZCBoYXZlIHRvIGJlIHBhc3NlZCBhcyAnY2hvc2VuJyBwcm9wZXJ0eSAoaWYgdGhhdCBpcyBldmVu
DQo+ID4gPiA+IHBlcm1pdHRlZCkgb3IgYXMgY29tbWFuZCBsaW5lIGFyZ3VtZW50Lg0KPiA+ID4g
Pg0KPiA+ID4gPiBFaXRoZXIgY2FzZSwgaWYgdGhlIGJvb3QgbG9hZGVyIGhhcyB0byBiZSBjaGFu
Z2VkIGFueXdheSwgd2h5IG5vdA0KPiA+ID4gPiBqdXN0IHRlbGwgaXQgdG8gbGVhdmUgdGhlIGJv
b3Qgc3RhdHVzIGFsb25lID8NCj4gPiA+ID4NCj4gPiA+IEl0IGNhbiBiZSBkb25lLCBJIHRoaW5r
IEJpanUgaXMgY29uY2VybmVkIGFib3V0IHRoZSB1c2VyIGNsZWFyaW5nDQo+ID4gPiBpdCwgbWF5
YmUgdXNpbmcgdGhlIGBtd2AgY29tbWFuZCBvciB0aGUgTGludXggQ1BHIGRyaXZlciBjbGVhcmlu
ZyBpdCBkdXJpbmcgdGhlIHByb2JlLg0KPiA+DQo+ID4gSWYgZWl0aGVyIFRGLUEgb3IgVS1ib290
IGNsZWFycyB0aGUgc3RhdHVzIHdlIGhhdmUgcHJvYmxlbS4gV2UgbmVlZCB0bw0KPiA+IHByb3Zp
ZGUgaW5wdXQgdG8gc3Rha2UgaG9sZGVycyBvZiB1LWJvb3QvdGYtYSB0byBub3QgdG8gY2xlYXIg
dGhlIHdkdA0KPiA+IGJvb3Qgc3RhdHVzLCBzbyB0aGF0IGxpbnV4IGNhbiByZXBvcnQgY29ycmVj
dCBzdGF0dXMuDQo+ID4NCj4gSSB0aGluayB0aGlzIGNhbiBiZSBkb25lLCBjdXJyZW50bHkgdGhl
IFRGLUEgbm9yIHUtYm9vdCBjbGVhcnMgdGhlIHN0YXR1cy4gQXJlIHlvdSBPSyB3aXRoIHRoaXMN
Cj4gYXBwcm9hY2g/DQoNClllcy4gQXMgaXQgcHJvdmlkZXMgY29uc2lzdGVudCB3ZHQgc3RhdHVz
IGluIHRmLWEvdS1ib290L2tlcm5lbC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

