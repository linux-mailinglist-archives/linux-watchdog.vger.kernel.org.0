Return-Path: <linux-watchdog+bounces-2703-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38921A10501
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 12:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 378E91887602
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 11:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63ACB1ADC9B;
	Tue, 14 Jan 2025 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pdoVP4Rd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B2B1ADC98;
	Tue, 14 Jan 2025 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852952; cv=fail; b=p9JJh/Ymb9QvFmAfgpT46DyM4CkuYgP2eEMus9rDvhlXqFJYFn1FBc6IqtHEp2+nndsB4ZLe4vA9ueceLqGQTX0RnUDKW0R5FsH+QXll3u4T9EOxpyrx0JbDg7TNcbrIq9IkuqlFYy33tlivZI1EtAN2GX2zRBouaxCHcUxH3/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852952; c=relaxed/simple;
	bh=X4knvGn7NjYPluER2ThZxfQPSPQWP5Bsawp9aVIjaxw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NFBApIXAj9zYzpd5Q1tfT6wh1/0Lxgwdd3GRVTMhKTRi1Vs6VokICAoyfPoAj4CPOsteHQDJOOLvrSNx3IblRNZ/7As/4JXbX0sEzSny9cIp9vEKksvJZDvHQSw+/7/f45yuICB6IiPUHvQkYH62tjdNwV0HgsMLJmbFU1QU2II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pdoVP4Rd; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8Q0DZ3laOQ8e3YdfEAIuIitpV6G54f8zX2psgNHff+SgG7y/h9DJsLUOAYh3lTHjWhrX92TxtsZFxoIzJ6czpKsAeBVAV//LzWVhWn8ULSDG1w2JqhKkPL2L2ZgAg5TT8IftKO3EPfpUdmUAmCpKx+T0D0aiSgxaUaL5YpPXaXhYZCPWslAUr1OXtR56FIdc4eZ5BZU9gGnF8G6tVsPCUMTWFxKQcZKJ35064UUMRJOzoj/a7C5FIuyHK6SqwfG+maNt6vmF8Kt9TWl4N4ddhgBRviZIcq1FMybVvv2Y2EOFA8vdvwlBeu37NLCpRqeZyliwhPHpoiUBJ+YsRvxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4knvGn7NjYPluER2ThZxfQPSPQWP5Bsawp9aVIjaxw=;
 b=sooi/wpwv/el8af7UAkXncg1VhOTCD4QL7tlLhvXmqsAI4yuFfexCbGqieZwASiB4Qyiv7gEulODvMz91FlEerl++Iq8fr067/yZm4agebwoS7sxXuMDHhkIAc+BNJGnAn9i43Y1w92o7oSMsNtJ80kXGMEsYihbxW5mnaM8kDa/T1pqjgKiER0W+5s5pdGOuzn6Nu+UWmDFRo+E0Ty5EWz4rGri91jIGXZumVf4bJnHy8ycCvU1CJCCrC1zTIyCN+GmjkazvY50j/iRtjqFnRgcvRXzyTLzI4E6sVXL92A7+usayWwFvJnwHhHH1xFDuCHll7K/iGb80S1l3pTrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4knvGn7NjYPluER2ThZxfQPSPQWP5Bsawp9aVIjaxw=;
 b=pdoVP4Rdnk4tlXCyBBXOs/wvtPxcnSogy4/Yx5JPlkS2/qjiwZFg0EU9OpMb7wLrkKgZj75Yv2VvjJg8M1e6wmz7PWRx+k34s3pjlV73lAPsNkflbr0rF5fN3rC0Y51xIJaN7yZaptXPT6OwDNTcXw+2WvXJkNuu5GBCjP/gC48=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB6214.jpnprd01.prod.outlook.com (2603:1096:604:e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:09:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:09:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter
 Roeck <linux@roeck-us.net>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 5/6] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
Thread-Topic: [PATCH v3 5/6] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
Thread-Index: AQHbZa2pJcErpOPUlkmwa7Z9oLDIg7MWB25ggAATYQCAAAKZgA==
Date: Tue, 14 Jan 2025 11:09:05 +0000
Message-ID:
 <TY3PR01MB113464F4DA8BEB9041395904F86182@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250113112349.801875-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346890814785C2150BB484D86182@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vrhb7Wt4RwQJ1wpDYfiy8-jiT0Dej7UYcRszyS9cKx4g@mail.gmail.com>
In-Reply-To:
 <CA+V-a8vrhb7Wt4RwQJ1wpDYfiy8-jiT0Dej7UYcRszyS9cKx4g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB6214:EE_
x-ms-office365-filtering-correlation-id: 280955da-8579-4a48-36cb-08dd348bdc4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGJqSTlteHEvbGw5OG5nUTdlU0l2ZkNmSXZvWXV3T0lzZ3JNcEsza1BPSlhY?=
 =?utf-8?B?azl2UWZiYlZFQmZUUzFmRXNiaDJlTDVUYjZKbm1tL0xGQW90Nkl5TW13dDM3?=
 =?utf-8?B?RVRadVNZZnphL0FtYitJUlp2TStHMXFqTUlpTjY3cjNuTkYvdWQvMTdSekZU?=
 =?utf-8?B?K3UxUnB4dURLakVSaHdBODZvMmZhdkFoTE5PTWprTjFqcytsd1BxVGZ4NzR1?=
 =?utf-8?B?S2V4czljd2ZBdExBVkU3cjV2cUtQamJDeDVCR2hhNzNTQ21PSlJPMGVYMWZm?=
 =?utf-8?B?UitsLys0L09WSDVrYmxLVjlITDhrRjA5b1QyREU1SzFKdEpreU94dW13UFVR?=
 =?utf-8?B?NHRRS25PZzFlSktGTTVlOUVWRDVTaDdGcGlHbGhqNkU1TlhPTnM2bHFOWGRR?=
 =?utf-8?B?ZW94NTBIVXA2bklXMjd5MHJhRk0rdWtUMXRoTlBWd2J0YmREZlN1M2VyQnZF?=
 =?utf-8?B?V1ZGK0dESit1dFFySUQ1NnFJZWZUNTcybXFpenZ2WXdsZThWTkJyRlVDWmNB?=
 =?utf-8?B?OFU4bDZvZWkwRHAzamVqWWVzeTVqTS8vQWdEUFpwVDZoeVNCVytTTU5WMEx1?=
 =?utf-8?B?azM4RGIvdm5iZDVnRWlHS09QOTdrekNPcjNxbnFrSnVoQUttdkVTQjN4UFQv?=
 =?utf-8?B?ZDBabWNaeHFBaWNNNjVaRHZQN0R0ZzhDdVQ1LzFXS2xlbHM0RjREVzRKK2pH?=
 =?utf-8?B?OHh5MVBoczlvMGpJRkdaMFZWVHU5VlhOSFBiVDQwOWtrWVdRUld3ZjRHVERR?=
 =?utf-8?B?ZFJHMjVMWTNaRDBTVFlzNENDV0xJUEtJVUxZS0dUQjFxcXdqbkVWRExHTEto?=
 =?utf-8?B?YjdBY1pOWDJjVHZ6bWRXdFVlc2NJbG93QlRLMzFQYXF0SkZxMS9xbzJXNm5G?=
 =?utf-8?B?TW1tQjhPcTlxRUJJQkE2ZysrVTFZOXdHeWtnS0VOcnd5L1FyaG9rbjZlTmdu?=
 =?utf-8?B?OEx6aHRGZ05qdHRsSVFWbk1wenV4UXR0V3VaSVFSVnJSeVhESXJzZWhJa0ZQ?=
 =?utf-8?B?eEZSUGt1N0RxM1NWSFFmZU5Rait6bnh1bXY5aFJNMFhxNys3RlB3UzQzR1lH?=
 =?utf-8?B?dVN6QzVDWFpsS2Z5UkpkZk4zL1lqczdITWxkK1ZsMThaNTdGS1FkMGcrdldV?=
 =?utf-8?B?RDBjaVpWeEYyOWxNMXJXK1Bwc04vQjRCbkJNTHZsdkEvT1FNVjRFUnpUY1BY?=
 =?utf-8?B?SlF0Q1hoVGQ0cDU1ZFJpVTM0ZG5SN2lUb2hXa2V6MGQ5YXptc0g2Tlg4UE9i?=
 =?utf-8?B?Y3l0NWMrUVVZWDkwS3RYd1ZIbGIwTVJyZTNobVlaM3FWOTdhVERtc05EZG1H?=
 =?utf-8?B?cXRvNmlzM2tRRHg4VlpUWmt2SnN1cDAwN2w5WFYvWDlLdlRSdzVJRFQ2K2dO?=
 =?utf-8?B?KzcwZ2cwWUxUT296NURURXYxUjlMZ2MyUWs1Z3k2eVpUWGFIbkxRTitvemsy?=
 =?utf-8?B?RkFXb2V5WmZNbEVpTGxHdzAyeWpwM0RLL1ZEUGV4enUybkFNTzBUMVJlMnpF?=
 =?utf-8?B?ak5idFAxc0xTUzNlQ2MySmVlY0I5RlhvMlo3aEZ3ZTIwUGRJNy9vNi9Fd3lK?=
 =?utf-8?B?dVlNWVQySGlvZjJKR0F2QjlNNkYxSTFwc2hGYmFSbW11VEJzK1BJODBuNGhl?=
 =?utf-8?B?MDVqcnZIdlJLeVEyM3Q4TTVkLyt5TWx5SlN2aWpXNnZoY0owQ0o1MTh0cHJo?=
 =?utf-8?B?NDh1ckRPQjNhbjByeU96WjcyKzVWRTBpNHluZ0NtZmdhajAzN1JnMzAxTVVX?=
 =?utf-8?B?V3N5NXlaSkpnWkEwZjVYbHNTajVNU1FzYS8wUFFFY3FZczNYeTFTOHc4aGho?=
 =?utf-8?B?NFRUSVpWSSs4L1lmY3VFaWw5elg5dmVCbnpML3R4dmNMMjRaSDZGOGpaTDhC?=
 =?utf-8?B?VHB6cjk4cHMxWGFIYW43VjdFelJuQmEvVGZqdmFEeFNVTWNHckY4SFJXTG93?=
 =?utf-8?Q?HGjjEADa+ML/zBulCbr3NQbxAXEgdn+u?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djR5Y2hJQ2VCYmRuRGIreERvcEFrMXIxSkVkSURLWVY0S2xubHpBRnBKZ0dM?=
 =?utf-8?B?NUVkTGpoZld6WkR6SmtjMXY5Q1VoK3NkUmdncjF0ZExWZzd2NHdpTHRCakRk?=
 =?utf-8?B?SjQ0dVViWWI2VEZWa1pzR3hPZExFRlJjTDd5NXBNbGt6RG9vZEhWZzRnZ25E?=
 =?utf-8?B?NHdlUzN5VEFhdU5tL3ZEY1BJVEhreUczdE80TlRJQXltUWt6bmJ6RU5Wbmwr?=
 =?utf-8?B?N3laY0VNa0krM3FFNFo4TEVpSDRvdTY5SWZLSlJFMFNxNzEyMjVRK2RzTGVI?=
 =?utf-8?B?NnNSeXp5TmltdG9nMVdWenB5eFJVTUVUb3ZqWTQxWFp6L3g5UGJWOXpTTkZI?=
 =?utf-8?B?VGlFbC9iTU40ZEhWdlJwV2UrVUV4VE41STdTVjc5N25TcmhPUk0xRWhINlBB?=
 =?utf-8?B?V0svS1VvaWtrU2ZXSGxlTEQ4YW5pcmd5MWF1UTZxZ2x1NUIwSUtZdit6SzlK?=
 =?utf-8?B?a0orZlJhQXYrOWlkb1hzV3JBaGtJNDhmSER3d2dIb1dqd0FBOWZzOWVQZWVn?=
 =?utf-8?B?bnBXbnZNL01zMVc0b1RScmRQMU14Mzd5elhVbEtleXRIdnl1NWZvUGttQ0Zq?=
 =?utf-8?B?ais0ZmM2NElaRHNsMWovTGpFRmc4QVBnR004OEdQbGZ6V2tlYVJwTEFHT1M4?=
 =?utf-8?B?TWwvU3hRYVFYeENERkdTWUVxUTJuR3VWcy90elF1Y3NST1JyUHRqMWY0bXBu?=
 =?utf-8?B?RGJ2OHlGaHJCTFFpeU1BV1B5SEZxYk9xUkZ2UmxVMEdDNlFZRklDd2twVmF1?=
 =?utf-8?B?ZWE3T3RZYVovdExpaURNSmUvVytQQ2E1L3BUUDk4V0VxSnZ1aFMzYXZzYThW?=
 =?utf-8?B?YVlzWXUydUNwQXNhNnZVYmY4WlUzNUtPL0luSTNzb0JEeXVLbXRHc0RiS2xF?=
 =?utf-8?B?T0pXak1QVzZBV2NGdDU2NG5teXVXQXV0bE9hY1FNSVdRNXdoKzl0Wlh3YU84?=
 =?utf-8?B?c0hYQzFVd2VkWGd6YVE5Y0FhY0dpRk0yZmxHdlJacnNqd2hQazZVOUlPcE5a?=
 =?utf-8?B?VXB3ajJ0L1BzcDlmbitxK1duczhRQzRVUGhTWlBMVGtQQXBNRlpTSHVHQ04w?=
 =?utf-8?B?dUoxMnB5b1JrMUtXMUpnZFFsbkgxZ2RhV2h3amZ1RUtsZExSeWpqMDNtNllT?=
 =?utf-8?B?ckFTRllRczMxb2dYTFg5OTA4T2RuY1RoOTF5eS9xLzVyR3JoaUlpSHlQMUZW?=
 =?utf-8?B?VVpoYWhCVzBITzFYWndpbmZiSUxaL3ArRFRoWmIvUjBBOTNLVlFYaU01WDVE?=
 =?utf-8?B?RjRQcStwbTd3R3NheUdJQzVNWjZMRHhySGYwaEZRVXdPQlYwQUhLUTV2T3hO?=
 =?utf-8?B?cldBOFVvS0xLMkJmOHZ0Rkp0WVlMYUw4R0JQZWZmd25JQXpaQlkrTTdxT2Nz?=
 =?utf-8?B?U1hPYXFkQUM4RTB4MThXeUNuM3M0TnplWm9DcEdQU2EyYnFScC9LOEx5OTFJ?=
 =?utf-8?B?WkQ0L29HK3lrRmc4WjFhdHBWTVA0YVUrc1pKc3NCTUwvaklDUHZ3M0JtR3NG?=
 =?utf-8?B?Q2hQUms3YVoxWEhYZll0dFhESmRjRFB5S05zT2JkS3htbEF4VzhRbHc5SVFW?=
 =?utf-8?B?dmpQdGVIeWRNZloyMC85VTlmek1OWWR3Qkc4TC9ka29VZ014dkNoTjZ3SWxB?=
 =?utf-8?B?dlBScWxKTmY5NGl2ZFFhQTRxcTc3VlEydE5xTkpMZG94T2VQRzlQeFhTZVhX?=
 =?utf-8?B?ZkpsdWZ1SmxVRmpKYjNCb0w5OU9NaWNaWEw5dDRyWVlPZlVBRW9zbmEwd1A1?=
 =?utf-8?B?dWI0ZkJINGlocTJjbFRuRlpTV2Q0dWZERWtnd3lLL0pFcWVGZ3EwUXJ5VG16?=
 =?utf-8?B?eXpXTDI4MkdSRmlUMXJQaWk5MzhhR3VHT3AwbUYzNmwvZk5CNzV5WGhJdnc2?=
 =?utf-8?B?QjI0bGp4Sm5LSWdQcGgvOTlTaGtRVWc1d1lRSVRMQTh1STZaTEpUODQrdzNB?=
 =?utf-8?B?WExGMkhNamVvTGFkeDJmNWhOT0lIYWJxTmZlMFBhZDVwa2FoenVtendvcFpN?=
 =?utf-8?B?ZFNleE05ZVdHZWNmcWwxNFBObzhtb0oweEFxTzZTbWZkSkFIa1pqemk2bnU4?=
 =?utf-8?B?cVpDaXY3TzRoWTFLUUhsWUpRZjJyZUl4NzJPZDFtU0thZGhUMkZlQWVhZ0FL?=
 =?utf-8?B?RE9QVHNqcmQ5U2ZWWnRGTFFSRDFoSGJQaEVrb2wxYzBDMkRYNTIyandCOTQ5?=
 =?utf-8?B?VWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 280955da-8579-4a48-36cb-08dd348bdc4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 11:09:05.7243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYgM8MFkn373UUJmoG6xb7w9p4KNIn+nMMPGAhZPQuew2Xjd5KmuMKJDpoY+Ei6/He/mw/GnT9wSxu4dpTUIyxD6nkY/b5zcfGo0RJa8VUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6214

DQpIaSBQcmFiaGFrYXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
TGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiAxNCBK
YW51YXJ5IDIwMjUgMTA6NTcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1LzZdIHdhdGNoZG9n
OiByenYyaF93ZHQ6IEFkZCBzdXBwb3J0IHRvIHJldHJpZXZlIHRoZSBib290c3RhdHVzIGluZm9y
bWF0aW9uDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgOTo1
NeKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBIaSBQcmFiaGFrYXIsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPg0K
PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFByYWJoYWthciA8
cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiBTZW50OiAxMyBKYW51YXJ5IDIwMjUg
MTE6MjQNCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MyA1LzZdIHdhdGNoZG9nOiByenYyaF93ZHQ6
IEFkZCBzdXBwb3J0IHRvIHJldHJpZXZlDQo+ID4gPiB0aGUgYm9vdHN0YXR1cyBpbmZvcm1hdGlv
bg0KPiA+ID4NCj4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBPbiB0aGUgUlovVjJIKFApIFNvQyB3
ZSBjYW4gZGV0ZXJtaW5lIGlmIHRoZSBjdXJyZW50IGJvb3QgaXMgZHVlIHRvDQo+ID4gPiBgUG93
ZXItb24tUmVzZXRgIG9yIGR1ZSB0byB0aGUgYFdhdGNoZG9nYC4gVGhlIGluZm9ybWF0aW9uIHVz
ZWQgdG8gZGV0ZXJtaW5lIHRoaXMgaXMgcHJlc2VudCBvbg0KPiB0aGUgQ1BHIGJsb2NrLg0KPiA+
ID4NCj4gPiA+IFRoZSBDUEdfRVJST1JfUlNUbShtID0gMiAtIDgpIHJlZ2lzdGVycyBhcmUgc2V0
IGluIHJlc3BvbnNlIHRvIGFuIGVycm9yIGludGVycnVwdCBjYXVzaW5nIGFuDQo+IHJlc2V0Lg0K
PiA+ID4gQ1BHX0VSUk9SX1JTVDJbRVJST1JfUlNUMC8xLzJdIGlzIHNldCBpZiB0aGVyZSB3YXMg
YW4NCj4gPiA+IHVuZGVyZmxvdy9vdmVyZmxvdyBvbiBXRFQxIGNhdXNpbmcgYW4gZXJyb3IgaW50
ZXJydXB0Lg0KPiA+ID4NCj4gPiA+IFRvIGZldGNoIHRoaXMgaW5mb3JtYXRpb24gZnJvbSBDUEcg
YmxvY2sgYHN5c2NvbmAgaXMgdXNlZCBhbmQNCj4gPiA+IGJvb3RzdGF0dXMgZmllbGQgaW4gdGhl
IHdhdGNoZG9nIGRldmljZSBpcyB1cGRhdGVkIGJhc2VkIG9uIHRoZQ0KPiA+ID4gQ1BHX0VSUk9S
X1JTVDJbRVJST1JfUlNUMC8xLzJdIGJpdC4gVXBvbiBjb25zdW1pZyBDUEdfRVJST1JfUlNUMltF
UlJPUl9SU1QwLzEvMl0gYml0IHdlIGNsZWFyIGl0Lg0KPiA+DQo+ID4gQXMgc3lzY29uLWNwZyBp
cyBhdmFpbGFibGUsIGNhbiB3ZSBnZXQgcmlkIG9mIExpbnV4IGFzc3VtaW5nDQo+ID4gVEZfQS9V
LWJvb3QgZm9yIGNvbmZpZ3VyaW5nIEVycm9yIFJlc2V0IFNlbGVjdCBSZWdpc3RlcnMoMHgxMDQy
MEIwNClmb3IgdGhlIHdhdGNoZG9nIHRvIHJlc2V0IHRoZQ0KPiBzeXN0ZW0/DQo+ID4NCj4gQWdy
ZWVkLg0KPiANCj4gPiBBZnRlciB0aGlzLCBlYWNoIHdhdGNoZG9nIGRldmljZSBub2RlIHdpbGwg
aGF2ZSwgc2VsZWN0aW9ue29mZnNldCxiaXR9DQo+ID4gc3RhdHVzeyBvZmZzZXQsYml0fSByZW5l
c2FzLHN5c2Nvbi1jcGctZXJyb3ItcnN0LXNlbCA9IDwmY3BnIDB4YjA0IDE+Ow0KPiA+IHJlbmVz
YXMsc3lzY29uLWNwZy1lcnJvci1yc3QgPSA8JmNwZyAweGI0MCAxPjsNCj4gPg0KPiA+IE9yDQo+
ID4NCj4gPiByZW5lc2FzLHN5c2Nvbi1jcGctZXJyb3ItcnN0ID0gPCAmY3BnIDB4YjA0IDEgMHhi
NDAgMT47DQo+ID4NCj4gQXMgd2UgYWxyZWFkeSBoYXZlIDB4YjQwIHdlIGNhbiBkbyAweGI0MCAt
IDB4M2MgdG8gZ2V0IGAweGIwNGAgaW4gdGhlIFdEVCBkcml2ZXIgYW5kIHRoZSBzYW1lIGJpdA0K
PiBudW1iZXJzIGNhbiBiZSByZS11c2VkIGZvciBDUEdfRVJST1JSU1RfU0VMMiwgIHNvIGJ5IHRo
aXMgd2F5IHdlIGNhbiBhdm9pZCBhZGRpbmcgYW5vdGhlciBwcm9wZXJ0eSBpbg0KPiBEVC4gQW5k
IEkgdGhpbmsgdGhpcyB3b3JrcyBmb3IgRzNFIHRvbz8NCg0KWWVzLCBhcyB0aGVyZSBpcyAxOjEg
bWFwIGJldHdlZW4gQ1BHX0VSUk9SUlNUX1NFTG0gYW5kIENQR19FUlJPUl9SU1RtIHJlZ2lzdGVy
cy4NCg0KQ2hlZXJzLA0KQmlqdQ0K

