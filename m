Return-Path: <linux-watchdog+bounces-2688-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D7A0BDD6
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 17:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E657168B33
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 16:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B931C5D7B;
	Mon, 13 Jan 2025 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dOONbDn0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E3024024E;
	Mon, 13 Jan 2025 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786639; cv=fail; b=EMwpXo5csL7i+uo+tCssYHuYINBE9cJP7eWpJ2lhRdp24ECbMTXOXS0+6KTFPtbcumvkkwWYx5cG8gVbDBrVsKflDNcsiCX031t3tqACBFB2gIX5Ch31x+eRNoJvMegJJghvvRLGeX9ch/QBPeLqeFUJymbOiQM7g0MZVpun4bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786639; c=relaxed/simple;
	bh=qVp3ynuE4onSU9JXrKEdAu4/C+4/MuTEfydEg8rztQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bKqHEez8suATP4Ou1FKQQRjQ/I3Ldf96uGY6MmNJegbZkJoyeAULxXmAEZPdsib7T9B/G+d7uUOa7E8wnQH7Jxu7w2Zdd/Km9PHPoRvM12Cck0R0VHcaTm6aFtz42RVlbfLeFiFXSzzbFGvAxtsTCu6+wn5YeEbh/pWipRGI/4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dOONbDn0; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQXiYApCbWBhhGKrhVvxpHRoIzdT0OkdXis452CgF2r8dMvFOSPHQDYeRXQspa5d2Pvq0LAQBU7eADHOXDOQgIYJ68FHDfGWVlUOn9qZzdEBMmmuartAInuwHgzvIkUiuLCTMnrlW/IFW6xVZ4TpnnqfGVx4i6m8T47MqWEponWKiIPwI+DSx6I18RomItUcup9b7Eug+ixFkyByWNTdMhOh0RrBgr3Q0zsVo0OjnonVerphyGlz27UqSfDV2HZ4EbMGM6h6lbyMEJG9hiNjZzK/6VnZT7EA0XppzmSlXBDm8odcbbIUfxfxKK+jNSv/KBJEh1hS6w1cv1BiZro2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVp3ynuE4onSU9JXrKEdAu4/C+4/MuTEfydEg8rztQU=;
 b=UBpcMLJkUDSRcGELUTKMvLV/qrhPiAhA0c5hAjiFRRq3uCQ6ZKHLEAaDx4jugm8ysfqIW0TRiiD6pf1Y8Zx1u7z4li0tDfEc1G+9qBeaQNmWrQQkaJRS1V/5aR/zMgMaBu4ctmyZq/NlXfkxZ0b96JAHk3X7/Z3rufFNkUZhtvfi0ko2KlnCmKyl6qLWFHsEpy8nlfeMb8lK/hSAtWvSl5c4JF3pVYkzpP+NK1wHhRfrAjbQFNzaGjgss2lX0x2C5cHhAq7H19nKMvaGt1bNGDMP4wFAWOqXnrw1OSFThrzKMfLXFeRRYOc1X8R9TQklxUUx8+p4hq+/kWvV92FDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVp3ynuE4onSU9JXrKEdAu4/C+4/MuTEfydEg8rztQU=;
 b=dOONbDn0El4U+G2sB7mN+tVojVyHncd447ZUISw+SiNjm5OPWj07Tfxcn8GBFnJl9ipLfLZ6Tgpof+RsGk/4SaWLBnBVavi7lmTAAynQxApf7evLLApkvMPbyyF15K+mlRYYs0VSfzkJjm8s0hGAbc9Fkmd5KXiQWml7mY4uk3U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:43:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:43:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Guenter Roeck
	<linux@roeck-us.net>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
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
Thread-Index: AQHbZa2mzHd3tjC1ZUuh3r0qDg28ZLMUkSHAgAAUMoCAADovAIAABbKAgAACMKA=
Date: Mon, 13 Jan 2025 16:43:52 +0000
Message-ID:
 <TY3PR01MB113464848E24FE536C7088D95861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tQ_tyxPn2pO=mSPVW2RffVhFz=CPCxR2pxXP1FLkcQcA@mail.gmail.com>
 <5cb9f4c9-c1b2-477c-9c6a-797a4e60d30e@roeck-us.net>
 <CA+V-a8sCTNdoxNksd_N-j7i_VJq-qL9_cv22HT7DXE-M39XLmA@mail.gmail.com>
In-Reply-To:
 <CA+V-a8sCTNdoxNksd_N-j7i_VJq-qL9_cv22HT7DXE-M39XLmA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11995:EE_
x-ms-office365-filtering-correlation-id: 1f89923e-a2a1-4667-a607-08dd33f1767e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cmFnaDdrYjI2eEM0QzZjaUptTW9PU3lzSGNVTUlSaWJtL0ZyTXRWdTRQSndp?=
 =?utf-8?B?djNGTktRdmNFQWRjem5KOHk3NnU3aTRDT3duWGZnc09zcjdzVWhtY0lLaG8x?=
 =?utf-8?B?OWFZRVVNakRUVGdEd1VnZUhQajNFMy82Rk8va3ZIUzZFQjh2SnhVelZOalBX?=
 =?utf-8?B?aXUrUGVDYzVkbDZDTXdXOFFTNFZlZlk4a2R4cnV5a2hVNHNaRERaUTBFRjEr?=
 =?utf-8?B?WjNXU00yMHhENnA5cnRuL0lpS3R2a1dDMHV6OVI1ZS9TTUhRbndZS05qdEpx?=
 =?utf-8?B?N0IzNnhBVTdCaFRvUHAxamtJc1lFeVJ4dzFiOXJxYjNYY3V3UkIrS3VVTHFy?=
 =?utf-8?B?bFNxRkRvOGZGN2hySlNIaHR2aFRBNndDcmk0dkwwS05pVFhNQy9ZdGFIWWFS?=
 =?utf-8?B?YktIRTVFdWhRUlZQc2ZkdWVoMXdRMk50MElNRkErR1FkRmFjRXF0LzFKZjRj?=
 =?utf-8?B?ZzRmL2VlMkVzOURWWXBaVGJNbThkUzZYMktLM0R0a3NiclBHSVhKWkZ1UDho?=
 =?utf-8?B?ZnJHb3FiOFo4cnZCTkZJM2lMQWtZZWdFZDVoMDNqS1JrM1VLYUVsVU4rQlhC?=
 =?utf-8?B?U2ZyUnd1aEV3ZU53dGYwV2Uwb1RVeHp2SlJhcnZ3OUhsM2t0QUVXL1h4ejU4?=
 =?utf-8?B?OVN1WGxGd0srb3poZFJ1R0I0VXFBYnN2R3l5OEkrQVovVFBFMHg4bzkxbENB?=
 =?utf-8?B?czd1RnNHVlRZUS9OU0pnY2IvMmgvU0NQSDFPZEdRLytmNWkxUjY2YjdpMHdJ?=
 =?utf-8?B?RWFVTnR1MUxsWldkYTU5KzlaSDVJT1J1UHUvcDNvbFVmWU84MXNQTm5xb1la?=
 =?utf-8?B?bzNHMGpTVHdoT2hWRkJuelZPRDNVYmcrU3hDR3R6eXRQZmtKN2QyWThzb3Uy?=
 =?utf-8?B?bXl4ODNLc0I3WVNoVGNXSXdDYUg5dndYbHR5NDNDYWRxVmJseWl5WUtKaEIx?=
 =?utf-8?B?VHE4U1A0VkpTK2U5N2xNQ2M1LzFjMElxcEUrRXBwcUpRWTlKY29kUzZiZXc2?=
 =?utf-8?B?aHpyK3cyV0VDeFhYUC9DMVBKb0RUVGNYbll2NE02Ri9DdzlHWFJabVFZdEQx?=
 =?utf-8?B?NU1PMk00M2NNWjV1Y25PQmg5eGozRmM1MkhicUx6a2VJQW5nQ2JRUW10LzMz?=
 =?utf-8?B?dysxWGRLcUZHQ0huMW5NTkpNNSs2TUNoK01OZHAvT3JhZC9mcFpMeFhDTXp0?=
 =?utf-8?B?a3QrRGFESzQvOTV5TzM3bUQ4RUNYSmlRUHhaNkJKVDRGc2hwUkEzTXNVQVEy?=
 =?utf-8?B?ZWRTaVc3QTUxQVpmV0RTUXlzM3FwWkNsTTMreEFHQi9XN3NweTZscTJvOHd1?=
 =?utf-8?B?UFFncFh6ZWMvTmNHM0ZIUkd2c2NHOGNLSFFtN3FvVDVHeUZZSjhJanJPdzN5?=
 =?utf-8?B?MUlNN1dMaTFnNkkxcXBvbXFXYmFsUFVWRDBlSjN4dmgwRmZ2K3FGWnFIcFE4?=
 =?utf-8?B?ZlVzNWg4cWNFbTd6RUYyQS9laVlDeHg4NFhLUU9xMytoUGpvYlpnWHIvVnVU?=
 =?utf-8?B?blVrUElZaTkyY2E0eXVmTHdiSm83YXd3RXBmYzRUMUxXQ1dubDRJclNrOW02?=
 =?utf-8?B?Y3JuNURLNUFqVkNlU29kNnF5YWVoRTIxamROZE5sLzlzdXBxV2xlQVlsM001?=
 =?utf-8?B?c29hcUFwZmZjbEtFaE0rOE9oa282S2NWb0sySXB6cENxWU1lTlEzTnFYanVH?=
 =?utf-8?B?N212OGlPVkJKYTM2SVQxZ25SSmRUbG9qWVhIWDU5Y05idlFmZ3Y0U2NGK3Bu?=
 =?utf-8?B?aThSbCtpM0c3cnJkU1plUTRDOUxsQU5jV3E4TUE5SHJqei80VmRXL0J0YmlP?=
 =?utf-8?B?OXh5UE1SVEtUY3lvcTR4K2tMZGRVY0tWYmpPN0lEaE9VeXBkclBWZDk1dnpW?=
 =?utf-8?B?T1pUaXhSYmp2cnh3MmV2K2dKbjhvOTVVYzMzc2hvblRsWDY4bzAzTDZpWjc4?=
 =?utf-8?Q?7UGo4dnMjvUv1V9i2Zlqauy5dMOJKOSQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1BiZ0dCd0o2TGlOb251aDA4Z3Y4TmpUTnVzTkxuRUFtVXltSmsrVnVoaCsx?=
 =?utf-8?B?eGhRK1J5bFNqZDZvNHRHWkR5RFMveUFVVWVwblhHTFB4aUJwTDJaN1A3SXpD?=
 =?utf-8?B?R0p5SXJvbTBFK0wxVVZmWHhUdEttcmtKQmhzQkRJZFhtVjhENWplSHdvcTlV?=
 =?utf-8?B?eDVXL0t5Mm8wUnNoa05ZQzhhZlU2OXJvc2h5VTh4SVRmWU1HRkZWSHg4R0lt?=
 =?utf-8?B?cmE5K0IyMlk5azVlcUVGTzlLeEI2R05Xd1RSRGR1dUlKc3lNQVBVcVBmTkdr?=
 =?utf-8?B?bE5SOFAxMlhtTVNzcUp1WktISnhWTDgzYlJjaWlDb2xZYTNSYW1jKzJEOVVY?=
 =?utf-8?B?QUZZOU02SFROMTVuelFrUnpTYzZWelFzT2U5TmVCN290SmUzR3dhbnNCeVI2?=
 =?utf-8?B?aTdhOG4zY0VUdXB1UEhiZHRKV2ZEUWZpYVE3cHRkRUdxbGNiT256TUdKYk5R?=
 =?utf-8?B?QnVjd0FwKzBKNC9Sa0JSWlF5WVpnampWSmFRMHZTS1dDdXBCcFRHQ1lteWM2?=
 =?utf-8?B?eG01MkdiS0lkUFZ6RmFYSlh3dU1QQXA1dWF6NC95NTJ0eXdyQkUrWDRRNmFL?=
 =?utf-8?B?VnhkUnBqWStIK1g5NFE0WkYwc0w4UHFZckVRdUFYRUNhcWVvenNhaElTKytk?=
 =?utf-8?B?T09MbjhadWhkTEpRY1dHK1VWdlIwUzRsSmdKaHhXSlJmZnQxWHVLVmY3cUJ1?=
 =?utf-8?B?SGtSclptOTVzRmxWV2dwSzl0bm8zUjFibUNqeTlUM2cyT29lN2J2K21ydG9H?=
 =?utf-8?B?bWplWit0bFRURDRlRm9xK29Uclp4bEFHdmxkOWpiR0ZlOTkxV2llQjRPdjBH?=
 =?utf-8?B?VFlwZkxZbDN5Q2hEWmpML2JUWWplZEtSNFhqT09WSHdDNW8vOHk3MHc0akYx?=
 =?utf-8?B?d2V1Y3Vyak9aNTdsS2gxMTEzUFBsZnJiczdqVjdpUjRkS25uVDVsNGRvNjZh?=
 =?utf-8?B?ZlpFY1VMbWdacFJWZEF3TTk5dXl6b1gya3dpdFlIOWRjem9GM2lRazlReXZl?=
 =?utf-8?B?N1ZQNzVaSDV0cXAwbnhnS0RlNTIzQkl0U0kzeVFqRDBSL0xwR2djQ2dlWjB0?=
 =?utf-8?B?N053dzIyR3ZiYUxLeDBlaVZJSng5MlBndG5oWktRbWFCY1d1Kzl1dnRPdEpB?=
 =?utf-8?B?eFRreXBNZmd0OGJqdUptRFMvd1ZhdlRvN1FSY1psMFFTa3pIQVAxc3ZEbi85?=
 =?utf-8?B?NnFJNUl0bGRKQ0E0UHV3K1VmNFRwRDhHbncyQS82R3ZZZ3o5c3dEbFJHZG5j?=
 =?utf-8?B?RDBKTHFLV2toYVFoTHY5V3ZzWGUrUWNza09mYlQ1cUdRMXo4M0Uwc3JmVFRl?=
 =?utf-8?B?QjRYeGVybE9RUXpNZjJKekxyd3pPNkJENmhuTzFUOFVwOWZLY1ZRSjJZYmR3?=
 =?utf-8?B?a2ZVV2FGVWdieVV5SUJFb2FESSt3UGdwU0dEVWtUZ1h5SE1hdGdlaXlUZ05D?=
 =?utf-8?B?OXdRdkpsKytpTkdyc1JoczVkdmJyMmQ4RDEyYVVJVnUxVUkvVEFIZUd6eWk1?=
 =?utf-8?B?WGVETXJUclZwM0IxamtaVDJtc28zV3dGYk8rNWl0S0FGUndzVFJvcjdyUUEr?=
 =?utf-8?B?Q3NnVFNhUXRtL2RUZ1paUmM2cXN5VGxkMXdscUlCRFVYdm9yYTRSeldYRlBq?=
 =?utf-8?B?Yi8vdmZHRlg4QUZaMlRUcUpaWmQzRkwrRHNCQng1UGxuanhtZnpFczUzQzMy?=
 =?utf-8?B?N1dxU1FlRlVIbS85aUxrcVQ0OGJRa0tRTmZEWU8wdjlmTkRFWEdMK2lUVWpl?=
 =?utf-8?B?enFsNVlsTldiS1d2SHVlNWJMd2xNUjcxT3hRMU9LY3lGWWptbXlHd08veE4z?=
 =?utf-8?B?bGF6M0l1RGpXTEZLWVEycjl3TVBVU2VVVFB2ZDVPTDcvdFJwUTJHMjY5bXNC?=
 =?utf-8?B?dG9CUXBNV25yOCtZalU0OTVPQldzK090bEZFeTFmZzZ2MmVJNzZtWnhnU1R6?=
 =?utf-8?B?WEdsS1A2QWVCcXg5dzl1TWxXMUJxWDNBYjVFWUd3VWZ5czZnNHpERVN1UE5S?=
 =?utf-8?B?cndsNyt2NzZRcTArWDRVL2lRT29zdU5wM21ZU0YveE1qajJKL3B4cVlyVHo2?=
 =?utf-8?B?aEpUSEZzbW41d3Y3T3RJZnQvZ25zbnBmM1NsUCs2NUtuZ2dPNDVwalN0c3FY?=
 =?utf-8?B?bENCNkd0YVlkNFNsZmN0UVg1MGk5Mkx5cTFkemZPaGJlTTRPQm9sU3pQQ1BF?=
 =?utf-8?B?c1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f89923e-a2a1-4667-a607-08dd33f1767e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 16:43:52.4149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/NIhgQX5QyKgm1Njamx2Aoku7Epr+/oHv3UrsNrN+uCR8QPpqJuLS/mrZHwkveGdcC2FDJI5fWmzX+rggkeGhR5dQ7SmjVGrj5d7ejWc2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11995

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMTMgSmFu
dWFyeSAyMDI1IDE2OjI5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMC82XSBBZGQgc3VwcG9y
dCB0byByZXRyaWV2ZSB0aGUgYm9vdHN0YXR1cyBmcm9tIHdhdGNoZG9nIGZvciBSWi9WMkgoUCkg
U29DDQo+IA0KPiBIaSBHdWVudGVyLA0KPiANCj4gT24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgNDow
4oCvUE0gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToNCj4gPg0KPiA+
IE9uIDEvMTMvMjUgMDQ6NDAsIExhZCwgUHJhYmhha2FyIHdyb3RlOg0KPiA+ID4gSGkgQmlqdSwN
Cj4gPiA+DQo+ID4gPiBPbiBNb24sIEphbiAxMywgMjAyNSBhdCAxMTozOOKAr0FNIEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPj4NCj4gPiA+PiBIaSBQ
cmFiaGFrYXIsDQo+ID4gPj4NCj4gPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+Pj4gRnJvbTogUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+
Pj4gU2VudDogMTMgSmFudWFyeSAyMDI1IDExOjI0DQo+ID4gPj4+IFN1YmplY3Q6IFtQQVRDSCB2
MyAwLzZdIEFkZCBzdXBwb3J0IHRvIHJldHJpZXZlIHRoZSBib290c3RhdHVzDQo+ID4gPj4+IGZy
b20gd2F0Y2hkb2cgZm9yIFJaL1YySChQKSBTb0MNCj4gPiA+Pj4NCj4gPiA+Pj4gRnJvbTogTGFk
IFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+
ID4+Pg0KPiA+ID4+PiBIaSBBbGwsDQo+ID4gPj4+DQo+ID4gPj4+IFRoaXMgcGF0Y2ggc2VyaWVz
IGFkZHMgU1lTQ09OIHN1cHBvcnQgdG8gcmV0cmlldmUgYm9vdCBzdGF0dXMgaW5mb3JtYXRpb24g
Zm9yIFJaL1YySChQKSBTb0MuDQo+ID4gPj4+IFN1bW1hcnkgb2YgQ2hhbmdlcywNCj4gPiA+Pj4N
Cj4gPiA+Pj4gICAgICBDbG9jazoNCj4gPiA+Pj4gICAgICAgICAgQWRkIHN5c2NvbiBjb21wYXRp
YmxlIHN1cHBvcnQgdG8gdGhlIENQRyBibG9jayBpbiBiaW5kaW5ncyBhbmQNCj4gPiA+Pj4gICAg
ICAgICAgZGV2aWNlIHRyZWVzLg0KPiA+ID4+Pg0KPiA+ID4+PiAgICAgIFdhdGNoZG9nOg0KPiA+
ID4+PiAgICAgICAgICBEb2N1bWVudCB0aGUgcmVuZXNhcyxyOWEwOWcwNTctc3lzY29uLXdkdC1l
cnJvcnJzdCBwcm9wZXJ0eS4NCj4gPiA+Pj4gICAgICAgICAgVXBkYXRlIHRoZSB3YXRjaGRvZyBk
cml2ZXIgdG8gZmV0Y2ggYW5kIHJlcG9ydCBib290IHN0YXR1cyB2aWENCj4gPiA+Pj4gICAgICAg
ICAgRXJyb3IgUmVzZXQgUmVnaXN0ZXJzIChDUEdfRVJST1JfUlNUbSkuDQo+ID4gPj4+DQo+ID4g
Pj4+ICAgICAgRGV2aWNlIFRyZWU6DQo+ID4gPj4+ICAgICAgICAgIEFkZCB0aGUgc3lzY29uIHBy
b3BlcnR5IHRvIENQRyBhbmQgV0RUIG5vZGVzIGluIFI5QTA5RzA1NyBhbmQNCj4gPiA+Pj4gICAg
ICAgICAgUjlBMDlHMDQ3IFNvQyBEVFNJLg0KPiA+ID4+Pg0KPiA+ID4+PiBUaGVzZSBjaGFuZ2Vz
IGVuYWJsZSB0aGUgd2F0Y2hkb2cgZHJpdmVyIHRvIGlkZW50aWZ5IGJvb3Qgc291cmNlcw0KPiA+
ID4+PiBsaWtlIFBvd2VyLW9uIFJlc2V0IGFuZCBXYXRjaGRvZyBSZXNldCwgaW1wcm92aW5nIHN5
c3RlbSBkaWFnbm9zdGljcy4NCj4gPiA+Pg0KPiA+ID4+IFRoaXMgbWVhbnMgdGhhdCwgd2Ugc2hv
dWxkIGFzc3VtZSBVLWJvb3QvYm9vdGxvYWRlciBzaG91bGQgbm90IGNsZWFyIHRoZSBXRFQgcmVz
ZXQgc3RhdHVzIGJpdC4NCj4gPiA+Pg0KPiA+ID4+IElmIHRoZXkgY2xlYXIgaXQsIHRoZXJlIHNo
b3VsZCBiZSBhIHdheSB0byBwcm9wYWdhdGUgaXQgZnJvbQ0KPiA+ID4+IHUtYm9vdC9ib290bG9h
ZGVyIHRvIGxpbnV4LCBvdGhlcndpc2UsIHdlIGdldCB3cm9uZyBib290c3RhdHVzIGluIGxpbnV4
Lg0KPiA+ID4+IEJ1dCB0aGUgY2xlYXJpbmcgb2Ygd2F0Y2hkb2cgc3RhdHVzIGJ5IG9uZSBvZiB0
aGUgY2FzZXM6DQo+ID4gPj4NCj4gPiA+PiAxKSB1LWJvb3QgaWRlbnRpZnkgdGhlIGJvb3Qgc291
cmNlIGFuZCBjbGVhciB0aGUgc3RhdHVzIGJpdA0KPiA+ID4+DQo+ID4gPiBJIGFncmVlLCBpZiB0
aGUgdGYtYS91LWJvb3QgY2xlYXJzIHRoZSByZWdpc3RlciwgdGhlIGJvb3RzdGF0dXMNCj4gPiA+
IHJlcG9ydGVkIGJ5IExpbnV4IHdpbGwgYmUgaW4tY29ycmVjdC4NCj4gPiA+DQo+ID4NCj4gPiBJ
IHdvdWxkIHJlcGhyYXNlIHRoYXQ6IFRvZGF5LCB0aGUgYm9vdCBzdGF0dXMgaXMgX2Fsd2F5c18g
aW5jb3JyZWN0IGlmDQo+ID4gYSByZWJvb3Qgd2FzIHRyaWdnZXJlZCBieSBhIHdhdGNoZG9nIHJl
c2V0LiBBZnRlciB0aGlzIHBhdGNoLCBpdCB3aWxsDQo+ID4gYmUgY29ycmVjdCB1bmxlc3MgdGhl
IGJvb3QgbG9hZGVyIHJlc2V0cyB0aGUgc3RhdHVzIGJpdC4NCj4gPg0KPiBBZ3JlZWQuDQo+IA0K
PiA+ID4gQWx0ZXJuYXRpdmUgc29sdXRpb24sIHdvdWxkIGJlOg0KPiA+ID4NCj4gPiA+IExldCB0
aGUgVEYtQSBjcmVhdGUgV0RUIG5vZGVzIGZvciB1cyBhbmQgYWRkIGEgcHJvcGVydHkNCj4gPiA+
IGByZW5lc2FzLHI5YTA5ZzA1Ny13ZHQtYm9vdHN0YXR1c2AgYW5kIHByb3BhZ2F0ZSB0aGUgV0RU
IG5vZGVzIHRvDQo+ID4gPiBMaW51eC4NCj4gPiA+DQo+ID4gPiByZW5lc2FzLHI5YTA5ZzA1Ny13
ZHQtYm9vdHN0YXR1cyA9IDwwLzE+Ow0KPiA+ID4NCj4gPg0KPiA+IFRoYXQgd291bGQgcmVxdWly
ZSBib3RoIGEgcHJvcGVydHkgY2hhbmdlIGFzIHdlbGwgYXMgYSBjaGFuZ2UgaW4gdGhlIGJvb3Rs
b2FkZXIuDQo+ID4gSSBzdXNwZWN0IGl0IHdvdWxkIGFsc28gYmUgaW5hcHByb3ByaWF0ZSBhcyBz
dGFuZGFyZCBwcm9wZXJ0eSBhbmQNCj4gPiB3b3VsZCBoYXZlIHRvIGJlIHBhc3NlZCBhcyAnY2hv
c2VuJyBwcm9wZXJ0eSAoaWYgdGhhdCBpcyBldmVuDQo+ID4gcGVybWl0dGVkKSBvciBhcyBjb21t
YW5kIGxpbmUgYXJndW1lbnQuDQo+ID4NCj4gPiBFaXRoZXIgY2FzZSwgaWYgdGhlIGJvb3QgbG9h
ZGVyIGhhcyB0byBiZSBjaGFuZ2VkIGFueXdheSwgd2h5IG5vdCBqdXN0DQo+ID4gdGVsbCBpdCB0
byBsZWF2ZSB0aGUgYm9vdCBzdGF0dXMgYWxvbmUgPw0KPiA+DQo+IEl0IGNhbiBiZSBkb25lLCBJ
IHRoaW5rIEJpanUgaXMgY29uY2VybmVkIGFib3V0IHRoZSB1c2VyIGNsZWFyaW5nIGl0LCBtYXli
ZSB1c2luZyB0aGUgYG13YCBjb21tYW5kIG9yDQo+IHRoZSBMaW51eCBDUEcgZHJpdmVyIGNsZWFy
aW5nIGl0IGR1cmluZyB0aGUgcHJvYmUuDQoNCklmIGVpdGhlciBURi1BIG9yIFUtYm9vdCBjbGVh
cnMgdGhlIHN0YXR1cyB3ZSBoYXZlIHByb2JsZW0uIFdlIG5lZWQgdG8gcHJvdmlkZSBpbnB1dCB0
bw0Kc3Rha2UgaG9sZGVycyBvZiB1LWJvb3QvdGYtYSB0byBub3QgdG8gY2xlYXIgdGhlIHdkdCBi
b290IHN0YXR1cywgc28gdGhhdCBsaW51eCBjYW4gcmVwb3J0IGNvcnJlY3QNCnN0YXR1cy4NCg0K
IE9yIA0KDQpUaGV5IG5lZWQgdG8gcHJvdmlkZSB0aGUgYm9vdCBzdGF0dXMgYXMgY29tbWFuZCBs
aW5lIGFyZ3MgaWYgdS1ib290L3RmLWEgY2xlYXJzIGl0Lg0KDQpPcg0KDQpJZiB0aGVyZSBpcyBj
b21tYW5kIGxpbmUgYXJnLCBwYXJzZSB0aGF0IGFuZCByZXBvcnQgYXMgYm9vdCBzdGF0dXMsIGVs
c2UNCnJlYWQgZnJvbSBjcGcgYW5kIHJlcG9ydCBpdC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

