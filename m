Return-Path: <linux-watchdog+bounces-2758-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C77A1B6C4
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 14:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C53E1882978
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 13:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA5435942;
	Fri, 24 Jan 2025 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jXv8dr6J"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70387C8DF;
	Fri, 24 Jan 2025 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737725061; cv=fail; b=Z1ToNkBO6fZIk/fjJZ+8FFb0vqNuVH9hf/x9Q84MkbabS+YN4xwZrg8M4FWumfR4lmIJ1U9PKxHPHA/5vrpQyGKV4Zvgjf2cQ414FFNg7/Uy70TrIGR380M39APrUdzc2JDLFcZo6NL82ubOux3FxIFGtFc/w5t+/YuBvBtuOFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737725061; c=relaxed/simple;
	bh=AkSKee/xMvkM73c5EjbWMaAd0XzOXc6CEtI8vmfs/iI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jReUBnPeGzDnEk6PRHCwK1+SI7klhNj1AOAwjOigQyPSpzUnDBfiuQlLuHf1GJKjzTRGIZ6/FFLuVMSqPEjbLGITFgRLc5uoE09HSqTTfzlbXabCJJQnf9xQ1n2w7LWwjgJ/8PT2l9hky+ttqyMs1AtiNVxhhQyllvI95vIG/yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jXv8dr6J; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpHAo2jBtHnm18SQEPyLdZZQORmW8RyJOs5Todju2xpT/Y9j6CzbtuyTPi3rEXtVBTfrcNmksLnnZzPK8QeywkL1w2pOL05IeaE3OQvKMq+0k0xmzMFHMO6Ej7f4RmdsI4nIp23HihySveJoXoWG8j3lQMjFBj2HwRxU5htWwOXARnu0a2A6mnhC9c+B6/8JrZeWsNq0azPPVcPtPqFr+hRJsLEHNXTFir7ExpqTVN1Vbvcv7TX5gOfqcOJtr/5+yCQWrMKiwPK9Qj1rHakVOKCkF095wyioJ1Vw2I6QxpuTLJSCtlkD296HXDgQ7U4gFdl6Nbn8GEBJZgHKrvNf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkSKee/xMvkM73c5EjbWMaAd0XzOXc6CEtI8vmfs/iI=;
 b=g9srHmJZzzGgel21j8kj/IQY9qkdT61vLXySuua+aVNLBaAlHaPE6+p0FZ//gwk9IHSpXPElZD+bIDATxV5at15/GaFdKqN1rzPuhpyCgL4P9NgWKd0sGWzd4D29YondI3w1lDVcOmBPk4WXgcs8IjzVUbCAxt7YR+ztEB3yBrfziVpR0MtohVupF4NiakoDJpBqQvtdIwLsHi8Vl4RWLrcJZ6o//AHZvZ/9hs1lr4Y0gMKfSN4hiDdTubfx3mt9i8MaeVeX+5XwhHWDSV9Gn4W/HZpNzF50EEsfKwyorCN/kFO8X6K9Eyb2MqCqYKGSkch9/JqKxUtJz8QjXHaxXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkSKee/xMvkM73c5EjbWMaAd0XzOXc6CEtI8vmfs/iI=;
 b=jXv8dr6JCCCQbNh8RfYq9Y3z5KlzQ7zH/kokYYUIGZMtHgNTwm0ogeWlHZ3bgB51SLF8Kd792zBkja+qmY/r3KoPDu6MWQ1O94FI9CD4heWp0EbqYpZQUSSy9eOb2Fxlbf7aCaYZuIoEabwCaNcGevMOQIsZUPbdq9M5G/LdIIg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8215.jpnprd01.prod.outlook.com (2603:1096:400:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 13:24:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 13:24:14 +0000
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
 AQHbZznBkfvGK/9M9kaeTTHwnLvzBrMcszgAgAkPAuCAAAaOgIAAA5vAgAAfvgCAAAGDMIAAA7kAgAABYZCAAAQnAIAAADyw
Date: Fri, 24 Jan 2025 13:24:14 +0000
Message-ID:
 <TY3PR01MB113467480CA16AED12555117D86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
In-Reply-To: <80bedf6c-ff2b-45e4-93e1-a05f4d3416ec@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8215:EE_
x-ms-office365-filtering-correlation-id: d0761a7c-0c1c-4193-32f1-08dd3c7a6586
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXlKZ1R4dzJqVEZWMktiSEtzVlNTbDgyK2JqK1EwMGtULzFjS1lkWTRVUkcz?=
 =?utf-8?B?OXhESkZZaStTNzhvSldnb2EvaHhjSTZndDdETHhTczdOOXhFa0tLSHhyeldX?=
 =?utf-8?B?MU9DYithRGg3NDdGTlNzS1YvZW5DSGQ3WExoWnVpTzlHNnREZUV5NzNndTg1?=
 =?utf-8?B?VzUzNkpudDE2Y3R1cXJIUTFJdEVkZVdGNkZOb29ZaEo4YW5OcFN1ak9uOXQx?=
 =?utf-8?B?Vk02eTEzbHdyaklpb3M0L3dpMGEvMDUzYTJuaEh6MmtVeWVUZDZTRWJ4ODVI?=
 =?utf-8?B?b1BMcENsTmgzUUF6Skd6eG95KzlpMEowdmIvUUdUcXVYQ2w0SFFTNm5ZbHQz?=
 =?utf-8?B?YkpnZ2VuWVY1V2VNUEY4NCtUeER1Z2FldGxhTXg1TE1mQlBINjY1Z0tGMGxk?=
 =?utf-8?B?YWdvU3pWanp5NkpnMkJDUGNPMURCR0oxdzdobllTV3FNQmlibFZBQ0VnVllz?=
 =?utf-8?B?U040cTl3c2RwMFJ0Zk1UM1hRREJ5cnRYQ0FlM1E2U2tNSlQyVmVYWDBWV0Jl?=
 =?utf-8?B?Zlo1Y2JOU1BSRnMwdVpwdkZaTkE1VEJVSFFZSjZWNVRpVEZDNFMveFdValRp?=
 =?utf-8?B?eS9TZ1p4ZURXekh2TVByRFlvVlJqNE4yYTN6SnZYVGcyNWlObGYyc3E3ZE1D?=
 =?utf-8?B?NnFpLzRhVlBXd3dyMEdmc01zUXNTbThGejk5Y2swOUFHS3hncHRCREJsMUd4?=
 =?utf-8?B?MzNwRGdmSSt3OGhXeE9CUnBNWU9za011MWVHSVV1L295TEc1Tk01dmJSdzFM?=
 =?utf-8?B?N1hWODlnSXpValRHekhWcVdPcTlnTmtia1Y1N1FjcjNMQXlsdTVFUTVOUSt6?=
 =?utf-8?B?SzhFTXBuMWVrWm9PbEd3V2I3Qjd4TVViTkc2VVBVcEVCTjBCa1orODRRckta?=
 =?utf-8?B?QjgwdlgwSURFNlRqQUR2cHZIam52YlJPdGJDZklDV2pHdVp0QlE3My92N2R4?=
 =?utf-8?B?R01uUGhWNFdCeU0rN3puZ2FrS2VkbkJuMU1VZUVVZlNMNmlkRDhmU3FpYkhQ?=
 =?utf-8?B?dTkrZGQrTi9qM0dDcGhkYXZTZldKUWRlQjg0dzBSZmJoUFlWd1c3dVhlMFEw?=
 =?utf-8?B?N2tua0N0WW9EM2QxQjJsdmN5dXVaVzJlMVBoa2lTZmdXMmZ4RWVNMGYxQ2Fa?=
 =?utf-8?B?UlZtdmdzU28yK3M1WHRuTk5rMFE0TmpiTDZ5eDhIMkNVUGQ0anZ6NlNDZlF0?=
 =?utf-8?B?S2t5bnVaamd4V1VnZmpCQ2doZGREWWdsYzV2K3BoNWt6SzkrYVNGanF3NXhy?=
 =?utf-8?B?a0dxckQ5K1R4djNjVzRjY1dqeG93ei9jdzc1OHBodGxuMno1Qk5Ua2ZxcExy?=
 =?utf-8?B?V1FMMVNnZUowM1pDTzR2Ukk2VmpVbGFvbS95TWhRVFJsYjFOUjNtTVROZGd3?=
 =?utf-8?B?SDVUMDBvQkx3ak5IQjFhUnhHUmRVQTBONE95QTFHaHdYdWxLZHBncFZqQnpF?=
 =?utf-8?B?TXhCOWdST0RNMUdFcFAwU3lVdEg4TkJ4bVJaN0hJeU1yZDlYUjlqWHdpQmgy?=
 =?utf-8?B?SHBPRGMvbHdWS1ZUbTYzL1QrWFc3ZHE4TTFrd1hVVTcrNllCUTBFQ0tjaVZE?=
 =?utf-8?B?ejlmOUxPYWliZERaeXp2Wk5sSXZ1WEhCS3g4RmpLSzdxTHdGR0YxalZnTlZX?=
 =?utf-8?B?NEMwMXFoYi9nQllRMlRqS2kyTTdHV0U4ZDhQcFUzQXhRczlhS216ejd6d3F6?=
 =?utf-8?B?dG82UER2U0hQbzVGNGlZYnhCWGZtSDFHeU5GVXg3R2RFWjE2MjJBNlM1aHdY?=
 =?utf-8?B?RDE3MlExd0lwZ1B6Z1FIQW5GYjVYQ08zZVRmSGlxTmd3aDI1OXBlcWh0eSs2?=
 =?utf-8?B?VW4rWnNOZDRrTExTS3hXU0JVRTZhZ0RjS2RqdzBlRGNQaVVJVEdGckdsbUJu?=
 =?utf-8?B?Tys1ME1EeFNuc2FaS05oVkE2alh0WW1YWnk1dW4wK3B5dFdRNkRrQTlnOFRy?=
 =?utf-8?Q?iuPB+NhpPpMjvV3sfwXTz3wKEeZEVfvq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yi9OQnRzNU5WZEZTcmFiSityTjdOSUh5T0pPMUpBYlFKNkxuenJ1b0M3b2dN?=
 =?utf-8?B?M0w5TG9DcWk2bXdMdVV3NGFlT1FCOEVDSmYwdTdVOWZ3VmZUbW5nN3Vicll1?=
 =?utf-8?B?RjZ2SFFReVBWY0RHbTFRNUVxTVVLMG1ZUHl6ck5JME1YbWI2NHJ1ZGdwdUhT?=
 =?utf-8?B?M2oybmdOSS9HaThsNkQyUGYxVnNCTXJHWHcrK1JRaTU2NnJhZjlaUmVaNFRJ?=
 =?utf-8?B?S2NXeDVNUUF0dDBlT0NBV2FXR05YdFVGa3QyMHBmVDk1ei9nNU9KaHI1ZWVB?=
 =?utf-8?B?dmJwMWwreHBMK1RVMnNZTjh5cjR6TjhMTlFzTXFIZm1pUFJ3VFd4U21vNWp6?=
 =?utf-8?B?YjFsSFJsNjUvTkZ1T3lZR3RtOFp0VFYxajMybFpmQW1rbFFGd3pPenZkUkVm?=
 =?utf-8?B?T0NVUk1laGJFTGQ3K21lWnhaVXhzNDk2dEFOeDE5aHBDR2MxODhZMGszTmN1?=
 =?utf-8?B?MWFYZys5ang3b1V4ZytHWWs5NlU1N2kvWmxEanIvZTlPOE5lOC9vSk5CeldO?=
 =?utf-8?B?TzgwRjgwdnJId0NuaHZyUUxhWUtINlpHSkdheThGdmZlMEEzZHFXU0cvazdy?=
 =?utf-8?B?K1VWYWZtTzhaM3lRYm5QQXAzNStMazkwQlZNMGJlTWFMWVVEdDhXak94SDdl?=
 =?utf-8?B?d01tVWpBNWc1bUMxaXVVTm9zSUZVT2E0YUU3WHNZTC9NYmxkVFRBK2NVUmUv?=
 =?utf-8?B?VmphZE1NL29PWjE2V0xVSC9WTEFRRUxVaHJrQ0RVWlh5cXltRlkxblZ1czIv?=
 =?utf-8?B?VWpqbkN4NDRUSkFUSzhPdk1iQ0pBZittTFJTQVYyam5hMFpNdlU1YnFBd0Z2?=
 =?utf-8?B?MnlXbFJrZ096RnJjR252Y1ZkVmk3R2NSRVVWd3FuN0JRampsZTEweCtaMUNI?=
 =?utf-8?B?bXJFTENjMnJGV2d0OVgzY21UeEJ2Yy9QSjIzTzhaNGcvSEZHL0pwZFJZVUQ4?=
 =?utf-8?B?OGV5aGlLYUhzSmlVWWR5QVhFYi81ckdoaGx3eGJVaEhyNVU4R2trbXkwUGw0?=
 =?utf-8?B?Sm42U2dHRXU4Ujh1RFBTd0dEZlBxaVpaWXpGOUF3SHcrZWdqNXE5dzdGSzAw?=
 =?utf-8?B?aTAyVlJHU29yVzVCdEwybnh6ZjB1MXNXNXUwenc2SmI5SGhLYys5cGx1SGFp?=
 =?utf-8?B?U1l2QklvdkZHVUxLa1RBL1ZaTTlXSWYwM0xyalVldGkvY1NLNjhjaTlNQXV4?=
 =?utf-8?B?dGc5RWpMTTBJY1lRdTdTRGFIRXpFZjJycnhSeE5KWGRwL0h2SUg4aGNQcElV?=
 =?utf-8?B?SnFIYkJOdGhXR3lLK08rUkhVck8wWGpVTTJHWW5ucEtzdjV2SFFudnVQTnBp?=
 =?utf-8?B?c0k4ODlvTTNQK3drSUxCRVNiUEtpaHZZcWhDdkhWLytteU0wa3FRazVxUGZT?=
 =?utf-8?B?akNjc1F1ZG1yRnVEK2VZUDB0L0ppeXQvZVBnZmpZcHhuOTByQ01RUjVOb3RP?=
 =?utf-8?B?WEJ4SjkxamZxMmpnYmg2VFdKNlZCekFSWm5GSzFHeE5nN055SmlzUlJJa3Va?=
 =?utf-8?B?WFF6UkRwMkgvdHVqY3hSOUFWaSt6SHE0M2EvVlVCUlppQXhGN25hYXU0Q1hk?=
 =?utf-8?B?REZRTmlGUS85MnlxcWxTbFMxNVhwZGtDbFdQanhWNjlkcGtpWlU1dWVRUDNK?=
 =?utf-8?B?aHlZc3R3cEdhSTlOaXBpa2lCeUJkOTdCRVNMOGU5YXVuUzBzaEVuU2dwOWhk?=
 =?utf-8?B?MWQzRXZJbjREMXNDa0RPeUhVV2xCZmlNQ2RNZ0o0cHpBZjNHSS9WTnp2SmZJ?=
 =?utf-8?B?YWF0UEJ2REpKY1cvdkhMaEltSkV6WjB0RGQzeDJqYWRrNit2Wms4UzFxTjFz?=
 =?utf-8?B?OHRZL0Ryb1lSeFhoYVQ5TnlQT2FqVGhzYnFhV21ENktzOHlSWm05VFBOd1gx?=
 =?utf-8?B?UDB6SkhVbWlXTkFyUloyK3MvZ1JHR1JOUk85aEpxSnNZYThEaFhPRlQweWFV?=
 =?utf-8?B?RzY3b1FPTVdBMkJFeC9NV21teEVkTHozc3JmMkhtelJ2dDlRRmRZSTZKV0hv?=
 =?utf-8?B?WVFLQVpHTHRmSDkwZmVTN0dSeldNdmVNYzRUd2tkZDR6K3grbi9qNGY3Njlw?=
 =?utf-8?B?Sm4xblVPV2g1Y1d0ZE1EdUZGS2pkZUd3VmFzWkRjbXUxU0tlWkN6RSs1ZVdD?=
 =?utf-8?B?U1M3WTdIYVJzY3E4aDFrVmhiSjlRRnZBUGRyZEZQekhRRHBaeTRqczBxajU1?=
 =?utf-8?B?Z0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0761a7c-0c1c-4193-32f1-08dd3c7a6586
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 13:24:14.3060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+FurOIc5SD1oRsYeLqtcu6u/FK3R8gloWXLUrZO47/pYH9If4MvcbQ6k4gT2SjORd61cCH8JLCr8BSlaymG8fvRSu1NezWFecS5x0Kf5PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8215

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0
IEphbnVhcnkgMjAyNSAxMzoyMA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNV0gd2F0Y2hkb2c6
IE1ha2UgUlpWMkhXRFQgZHJpdmVyIGRlcGVuZCBvbiBBUkNIX1I5QTA5RzQ3DQo+IA0KPiBPbiAy
NC8wMS8yMDI1IDE0OjEwLCBCaWp1IERhcyB3cm90ZToNCj4gPj4+PiBSYXRoZXIgdGVsbCBtZSB3
aHkgdGhpcyBpcyBzdXBwb3NlZCB0byBiZSBkaWZmZXJlbnQgdGhhbiBvdGhlciB2ZW5kb3JzPw0K
PiA+Pj4NCj4gPj4+IEl0IGlzIG5vdCBkaWZmZXJlbnQgZnJvbSBvdGhlciB2ZW5kb3JzLg0KPiA+
Pj4NCj4gPj4+IFNlZSwgZm9yIGVnOg0KPiA+Pj4gY29uZmlnIFMzQzI0MTBfV0FUQ0hET0cNCj4g
Pj4+ICA1NTcgICAgICAgICB0cmlzdGF0ZSAiUzNDNjQxMC9TNVB2MjEwL0V4eW5vcyBXYXRjaGRv
ZyINCj4gPj4+ICA1NTggICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfUzNDNjRYWCB8fCBBUkNIX1M1
UFYyMTAgfHwgQVJDSF9FWFlOT1MgfHwgQ09NUElMRV9URVNUDQo+ID4+DQo+ID4+IFlvdSBzZWUg
LSBvbmx5IG9uZSBBUkNIX0VYWU5PUy4NCj4gPj4NCj4gPj4gVGhhdCdzIHRoZSBhcmNoIGFuZCB2
ZW5kb3IuIEV4eW5vcyBpcyB0aGUgZW50aXJlIGFyY2ggZm9yIGFybTMyIGFuZA0KPiA+PiBhcm02
NCBjb25zaXN0aW5nIG9mIGFsbCBvZiBTb0NzLg0KPiA+DQo+ID4gSW4gUmVuZXNhcyBjYXNlIGl0
IGlzIEFSQ0hfUkVORVNBUy4NCj4gDQo+IA0KPiBTbyB0aGF0J3MgeW91ciBkZXBlbmRlbmN5LiBT
YWlkIGluIHRoaXMgdGhyZWFkIGxvbmcgdGltZSBhZ28uDQoNCk9LLg0KDQo+IA0KPiANCj4gPg0K
PiA+Pg0KPiA+PiBTM0MgYW5kIFM1UCBhcmUgZW50aXJlbHkgZGlmZmVyZW50LCBtdWNoIG9sZGVy
IGFyY2hzIC0gdGhlc2UgZXZlbg0KPiA+PiBjb3VsZCBub3QgYmUgY29tYmluZWQgaW4gb25lIGlt
YWdlIHdpdGggRXh5bm9zIHNvbWUgdGltZSBhZ28uDQo+ID4+DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+
IDU3NSBjb25maWcgU0ExMTAwX1dBVENIRE9HDQo+ID4+PiAgNTc2ICAgICAgICAgdHJpc3RhdGUg
IlNBMTEwMC9QWEEyeHggd2F0Y2hkb2ciDQo+ID4+PiAgNTc3ICAgICAgICAgZGVwZW5kcyBvbiBB
UkNIX1NBMTEwMCB8fCBBUkNIX1BYQSB8fCBDT01QSUxFX1RFU1QNCj4gPj4+DQo+ID4+PiBhbmQg
bWFueSBtb3JlLg0KPiA+Pg0KPiA+PiBBZ2Fpbjogb25seSBvbmUgU0ExMTAwLCBvbmUgUFhBLiBO
b3QgcGVyIGVhY2ggUFhBIFNvQy4NCj4gPj4NCj4gPj4gU28gdGhlc2UgcHJvdmUgbXkgcG9pbnQg
LSB1c2Ugb25seSB5b3VyIEFSQ0gNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+DQo+ID4+Pj4gfHwgQVJN
NjQgaXMgYWxyZWFkeSB1c2VkIHNvbHV0aW9uDQo+ID4+Pg0KPiA+Pj4gSWYgeW91IGFyZSBjb3Jy
ZWN0LCB0aGVuIGFsbCBzaG91bGQgZGVwZW5kIG9uIGVpdGhlciBvbiBBUk0gb3IgQVJNNjQgb3Ig
UklTQ1YgZXRjLi4uDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTaW5j
ZSBtb3N0IG9mIElQJ3MgaW4gUlovVjJIIGFuZCBSWi9HM0UgYXJlIGlkZW50aWNhbCB3ZSBjb3Vs
ZA0KPiA+Pj4+PiBpbnRyb2R1Y2UgYSBuZXcgZmFtaWx5IFNvQyBBUkNIX1JaRzNFX1JaVjJIIHRv
IGNvdmVyIGJvdGggb3IgdG9wIGxldmVsIEFSQ0hfUkVORVNBUz8/DQo+ID4+Pj4NCj4gPj4+PiBZ
b3Ugc2hvdWxkIG5vdCB3cml0ZSBkcml2ZXJzIHBlciBTb0NzIChvciBldmVuIHR3byBvciB0aGVy
ZSBTb0NzKQ0KPiA+Pj4+IGFuZCB0aGVyZSBpcyByZWFsbHkgbm8gbmVlZCB0byByZXN0cmljdCB0
aGVtIHBlciBlYWNoIFNvQy4NCj4gPj4+DQo+ID4+PiBJZiBJIGFtIG5vdCB3cm9uZywgVGhlIHdh
dGNoZG9nIHN1YnN5c3RlbSB1c2VzIHNpbWlsYXIgYXBwcm9hY2guDQo+ID4+Pg0KPiA+Pj4+DQo+
ID4+Pj4gT3RoZXJ3aXNlIGNvbWUgd2l0aCBhcmd1bWVudHMgdG8gbXkgZmlyc3QgcXVlc3Rpb246
IHdoeSBkbyB5b3UgbmVlZA0KPiA+Pj4+IGV4Y2VwdGlvbiBoZXJlIGZyb20gZ2VuZXJpYyBrZXJu
ZWwgYXBwcm9hY2g/DQo+ID4+Pg0KPiA+Pj4gSXQgaXMgbm90IGRldmlhdGluZyBmcm9tIGdlbmVy
aWMga2VybmVsIGFwcHJvYWNoIGFzIGxvdCBvZiB2ZW5kb3JzIGFyZSBkb2luZyB0aGlzIHdheS4N
Cj4gPj4+IGVnOg0KPiA+Pj4NCj4gPj4+IGNvbmZpZyBPTUFQX1dBVENIRE9HDQo+ID4+PiAgICAg
ICAgICAgdHJpc3RhdGUgIk9NQVAgV2F0Y2hkb2ciDQo+ID4+PiAgICAgICAgICBkZXBlbmRzIG9u
IEFSQ0hfT01BUDE2WFggfHwgQVJDSF9PTUFQMlBMVVMgfHwgQ09NUElMRV9URVNUDQo+ID4+DQo+
ID4+IEFueXdheSwgdGhhdCdzIGFuY2llbnQgT01BUCwgd2Ugc3BlYWsgYWJvdXQgbmV3IGRldmlj
ZXMuDQo+ID4+DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+ICBjb25maWcgREFWSU5DSV9XQVRDSERPRw0K
PiA+Pj4gICAgICAgICAgdHJpc3RhdGUgIkRhVmluY2kgd2F0Y2hkb2ciDQo+ID4+PiAgICAgICAg
ICAgZGVwZW5kcyBvbiBBUkNIX0RBVklOQ0kgfHwgQVJDSF9LRVlTVE9ORSB8fCBDT01QSUxFX1RF
U1QNCj4gPj4NCj4gPj4gRGlmZmVyZW50IEFSQ0gsIG5vdCBTb0NzIQ0KPiA+Pg0KPiA+Pj4NCj4g
Pj4+DQo+ID4+PiAgY29uZmlnIEszX1JUSV9XQVRDSERPRw0KPiA+Pj4gICAgICAgICAgdHJpc3Rh
dGUgIlRleGFzIEluc3RydW1lbnRzIEszIFJUSSB3YXRjaGRvZyINCj4gPj4+ICAgICAgICAgIGRl
cGVuZHMgb24gQVJDSF9LMyB8fCBDT01QSUxFX1RFU1QNCj4gPj4NCj4gPj4gRGVwZW5kZW5jeSBv
biBBUkNILg0KPiA+Pg0KPiA+PiBEbyB5b3UgdW5kZXJzdGFuZCB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIEFSQ0ggYW5kIFNvQyAoQVJDSF9SOUEwOUc0Nw0KPiA+PiBpcyB0aGUgU29DIC0gaW5kaXZp
ZHVhbCBvciBmYW1pbHkpPw0KPiA+DQo+ID4gQVJDSF9SOUEwOUc0NyAtLT4gSXMgYSBTb0MgKFJa
L0czRSkNCj4gPiBBUkNIX1I5QTA5RzU3IC0tPiBJcyBhIFNvQyAoUlovVjJIKQ0KPiA+DQo+ID4g
OTAlb2YgSVAgYmV0d2VlbiB0aGVzZSBTb0NzIGFyZSBzYW1lLiBTbyBjYW4ndCB0aGlzIGJlbG9u
Z3MgdG8gc2FtZSBmYW1pbHkgb2YgU29DcyhlZzoNCj4gQVJDSF9SWl9HM0VfVjJIIGZhbWlseSk/
DQo+IA0KPiANCj4gV2UgZG8gbm90IGRpc2N1c3Mgd2hhdCB0aGVzZSBTb0NzIGJlbG9uZyB0by4g
SG93IGRvZXMgaXQgbWF0dGVyIGlmIHlvdSBjcmVhdGUNCj4gQVJDSF9SWl9PTkVfVFdPX1RIUkVF
X1NPQ1M/IFlvdXIgZGVwZW5kZW5jeSBpcyBBUkNILCBzbyB1bmlmaWVkIGtlcm5lbCBpbWFnZSB3
aWxsIGJlIGVhc2llciB0byBjcmVhdGUuDQo+IFRoaXMgaXMgbm90IGhlbHBpbmcgaW4gdW5pZmll
ZCBpbWFnZSBhbmQgR3JlZyB3YXMgdGFsa2luZyBhYm91dCB0aGlzICptdWx0aXBsZSB0aW1lcyou
DQoNCk9LLCBJIHdpbGwgdXNlIEFSQ0hfUkVORVNBUyB0aGVuLg0KDQpDaGVlcnMsDQpCaWp1DQo=

