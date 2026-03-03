Return-Path: <linux-watchdog+bounces-5050-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIwRLkgMp2kDcgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5050-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 17:28:56 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 388A51F3C79
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 17:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44A2030F62E0
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2026 16:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EA04D8DB7;
	Tue,  3 Mar 2026 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QGDidR+S"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70984A2E32;
	Tue,  3 Mar 2026 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554826; cv=fail; b=jCu6QqkachhMXrLk3BhhQUTRU1fsFIqGNnYj4KbMzWyY6HER97AAR8MQMlKzV+oD+JyCftYJBtekVQOj6k6okaGQpQaoiDlGKOC3mWUQjUUV/iIXGiiqLCny9fsTscQnSUYGvHjfbE/oA0dwyIQFZKtbRpgHBl9DE2otCyh5zNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554826; c=relaxed/simple;
	bh=k4c3ZAor4BOd+yxh9dFlSONoN+pc/ARiHEDqUn8JUrM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o2+91IT2OFpLrrtSCF9V0bo6pV0LEBU1rbXqk3gREiVzlreiaOf3XqwoZqYe9+Qqwjm23Tdir1EcixVVYCt+YdWrLcHyDA4xAn+0GvspgNlaxzleB/jWoXpgO4i3gkYXFf8IXLPjEFPGwKSowFk6XIllfyyiNJnDA2JKdmYCp5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QGDidR+S; arc=fail smtp.client-ip=52.101.229.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beV9olvSmQEI/IGxYrHQ6xsxMVce4qfZaBiagdoajtrKeMoAyeTa4zOTCDlWEEqe/UzgHTaw43p4RVxmfT648T/q9OA9DDF7GrdHfJAmEBwpFvQHYFVc1GRUY1CHQECAc8L2rK/CympAjq6Eey7iWVY0s7dnhoVRbe+eQkHv7bZMGRjtTlImoRFa/fH90xEFPEov6Cnz7+HjNDdhzM7zVPplu8+bapYPv7Y55hr4uQWJUJJ/ykzeED7AA51AmpdiPcx1yC5w3dAlZV7xHUETHAifTOmmQm02Ukq1aei1zl/9P190iF4FNzceIoFibhOUfD5IGItyfNPB05IB4cNZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4c3ZAor4BOd+yxh9dFlSONoN+pc/ARiHEDqUn8JUrM=;
 b=GXAPjKCARzoWRSXGXvPa+HNRx3K3VJLKtign4OmzharYNXLO2ceUke/43U1We7e3Uv5TBIboaSlshDmPJVqqcZDNByfYxJHACMhjY139PNPc8RhHAGnB7sKJfYInn/MVG4SVcbdrUkfFhaedi0znjKJ+AJPrWKF4nPEuyaWGqYmrHDDG7u9VIabHUOrHMfZke8r0M4MOmc2dIBsTpHoBZVopirK7eTPrZhJHIxKIoXRwDl0u7372mPwkyI7cTKD8E120ZBu/eQ1pP43iXbto7B9uBkCDOii9PiF4iWrLRdxWJ8+YNDXm01eewTeZuU8XUDNnUeapOdYbjn/j/GXh2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4c3ZAor4BOd+yxh9dFlSONoN+pc/ARiHEDqUn8JUrM=;
 b=QGDidR+Sg8pOf3xmjie3OrBB9Bg3ZJhMgaCWi4dcVhRrBb/zhgrc0Weszc+/tkftRBYXR7B7ogoQKYIvI9hFdI4ZpsdApr6QBNla2cltJeq1wYtI25w4cCXPXLJSwE7Tpf32GDQly/Y+T2X/Zqegdd29MA6jZaKT4ZSS/iwY41I=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS9PR01MB12485.jpnprd01.prod.outlook.com (2603:1096:604:2f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:20:22 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 16:20:22 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 2/3] arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3}
 nodes
Thread-Topic: [PATCH v2 2/3] arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3}
 nodes
Thread-Index: AQHclQrNPq0Oc+w4+0OH0qI6DanUGrWc+SoAgAAv3DA=
Date: Tue, 3 Mar 2026 16:20:22 +0000
Message-ID:
 <TYCPR01MB12093ADAC968E466C216F6662C27FA@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com>
 <20260203124247.7320-3-fabrizio.castro.jz@renesas.com>
 <CAMuHMdW9F48wTrhJRM-w_+4deEzJxOkGR6WttLmTmMy9DT1Dtw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW9F48wTrhJRM-w_+4deEzJxOkGR6WttLmTmMy9DT1Dtw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS9PR01MB12485:EE_
x-ms-office365-filtering-correlation-id: 242a9a19-b1d3-4cae-c906-08de7940c53b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 LQQx0dx1oRp3nQbi7t8DiQqGfv9S7jSejjjWsqkOjlGHT9fyS3H/16Z2Dnf35u1UNm2Zuto7aYykk9FgsxNkTqKCn62i9mGAI9AwTnxw7GQ6uYakikmiqtV/AZh4Pb5S9deWPYudIaTUZpRoluAt17Wevid8iWerOqRWhNdOzHGKo/2m+7iYXqDIkOfH5isX36x/9gyQqpsECGRVzVJsY6f6VIoCizidv0WIe32VlV0flZjNzqPR9RDwMC/ahMwys5eVfj6R9THs4xG1kgke9gwec2O2iFcT+BarBu3hsP4RA2qbO7LNm7KdsCqnHNvCBrDFMPts3bhjRb6amCJbSR1ekiKHWIPSATmU93ujueNt9OrRbaaPd7zyi06Lv5kY1fF4UxCb80JeHRDsOFAqTptWv5NHOKAUDUAufJqnZ2TiYQ6B5M8pM1fiNja0TePgkjHxrwdrNhsuc7Z0/aWE/eGQjPig3nuE4J/nZkPC2pNCPkdpl7xcRuGbDS9LIhsYSuEapNL2VLX7hMovAdBDm42cQuGBKIGZ/slo2A7XqTQ1DK3jdgVr1/hlgQtMEoAl3Vd9wCiwJVSX2KA5Ci4XiYC02VCKFtdW/8pi/+SmHYD/5OcMZ/EA5Pg2npkbZQ69RbXrEkRmrLmJzhp9dTjqQahWHzy8e5LcsdxDs1J0EgZq/e7A9L+hGSK4ofjlmXgFZdk1Yb5Il9h/PvNKh92rQrLW3I3kwtUpqncwedKp28EQUHFGrUzxysmX0vWMrx6UkqVC/yAGAxlnaiGfV2f5OoVjphmbKC4OALymfNTp/B0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MU1neUJ4akczSWI2S0xabVVlaUlFcFVuMDNiTWtJWnpXMDIvS2xoN2wxR2x3?=
 =?utf-8?B?Mm5VQWxmYytTR2RWL0JTTmQ1U01yVVpqTWsrZ2tCQlJxaEtkOHNkM1grTCtB?=
 =?utf-8?B?SWpzMmFlSEpnYVErZ1ZDWFdYSEhnQUdtTWRqc2d6UDRLTVNyaW1wckl5M0s2?=
 =?utf-8?B?VjlUZGZqaXB1NldhZERhT2w5aDVMS1JzM0MvNTBBTUtBeWpTTWx2b3QyYU1E?=
 =?utf-8?B?RVRtOTZqYVV3dWt4OGQvbWk1UC9Wa0l1MmdUcll0QmIrVW94STFsNjNzcGc4?=
 =?utf-8?B?b3pKaFVhN3B1cDUvejYwVHFBbHJDRncreHVDZnBuU3F4d1lhbEEwVGRMQ3Bw?=
 =?utf-8?B?RG9rek5USm9NTVFuRjFKOXY0blNhK0dFREpkMEJ1Vk1YTWt3SDhORHR3d2Fy?=
 =?utf-8?B?L25oWTFlaWptRnUvRzI2Y2VaYzhieFk3UlFmNUFQS0kzNHFmZUlTRkNUZHZn?=
 =?utf-8?B?S0FWRkF2MittYVBlTFg4NXlwN0tTNHlkY09NcExzNjgyV2lNaUJnQmt3cTFy?=
 =?utf-8?B?N0QzR1V3YjBQaXp2Z1hNR002MHZmYTFQSi93NFkwZlFqamtHdHo0K2dVajIv?=
 =?utf-8?B?MW9SQmlHdXZwUXh1ajFMNXhTZjZLcStJTGlpbWkza2lCZlp6aEoyaHFvejB1?=
 =?utf-8?B?bHEyRkNvQ1ZzVkNPSXdtQ20zc0szNFZGYTJaSm9CZkQrZ0JZTS9QaFg4bld2?=
 =?utf-8?B?TUZkUjFQemRJeVZRd3NIeTJreEsvd2FBZ3BDcVhidjdTV2Myd1oyQ0I2aVVh?=
 =?utf-8?B?bmE4U1pEdHU0RUhFUG8wOFFIaURDTGM1alRmTk43cDBpTS9uWWxCSWtoQnpE?=
 =?utf-8?B?QzJNc2Z4cXNuMTJnWHo0LytzWlZ2Y2VQcnBsZUkzdnpacDIwUFVTWkQzZ3h0?=
 =?utf-8?B?bWE3UXIycnpmRG05WHVhWnFLQTgzT2gzYjNzb29iSnZKSElIdUxjVlhkNkJo?=
 =?utf-8?B?Ym11bDlza3dmTS9TbngxL0R2VTZqZzR1enRIWGtvcnRzbGU1aXNkek5Bcmlp?=
 =?utf-8?B?TjJvdW1xOEpmVFBVdE0wT2FkZWZqVjRQeHAzMFNjSWtpZjF1QVJEUmdmOWRi?=
 =?utf-8?B?VkliVWFUQ3hmdnpwZVJSY0x5SUJnMVlhS2pNZHFheS9kKzNWejNsa3lwRk1M?=
 =?utf-8?B?WW5iZzlVU2FoVGp2bytUNGJyenl4Nmg4RHFaaW1wNTBjZStXcUgzSkRvU2FZ?=
 =?utf-8?B?WXAzc2l3UDgrT29va1QzTWIxR1RtRGlBdWM3bkhhSE1vMmtlRXRSSEJwWUw4?=
 =?utf-8?B?ME1hZTdtOXhYOEVzM0RXcWtORzJvMTJrajdlM2U0Wnh0N0Z5a09nTDFZZzlj?=
 =?utf-8?B?UUNraVA5WnA3SjdlcmpBOW1SZ0l4N0NxdlF2c2hzdWZ5eTBYdDM2ZWtRTkFX?=
 =?utf-8?B?RnRPVWxOZmZNRWJWdG0zZUU3VVh6ei9HSjhHYUtLM1pJYWR1VWd0cUVaQTlB?=
 =?utf-8?B?R2t6aU1ibG9uclo4eHBqQ2ptL2hPRy9xd25TUGZlRkJXcC9tdC9RTFNwSDdp?=
 =?utf-8?B?cHZ6UTJVRTlUNGpNR0pGSFRscW0vcUo0bitkZDhoWWNDSitiQ3ZJZ00vaWtL?=
 =?utf-8?B?Y2JVcENJVDBERmdSMHNodk9INHhVNGhIRG1wbVkzR2N1M2Qxc1pWenlCYmc2?=
 =?utf-8?B?enQyZVdBdGVjRHNJdWlmQzVoaDZOR25JWEdnbEpvR1YxNTdOVmpHZ01zQ3p1?=
 =?utf-8?B?VXNhTFJUQW50dkhMYWRXR2tGTDAwNjh5ckR4ZE9LY05zQzhLbmpDUGJ6U1dR?=
 =?utf-8?B?ZUMxSkU4LzF6Rjd3OTlKNTFrd0FIVXc0UUI2SnpSb1JDVlZtREF1OXVGRTZB?=
 =?utf-8?B?MStucHJiU0JNbG9QaFFsM21BZzRYaHY3NVFqMjl2TElCYnNUR1N3ZkJudjNH?=
 =?utf-8?B?Zm5TSWhYSTNPRnJiWHNHK2dZdTY2R3ljZ2pGaGZDMjB2NjBRLzUxK1BIWEwz?=
 =?utf-8?B?eEk2bTRRK1hZQXdmeVBpSjBQSi8xYm9MRTlqNU9BaGpWcUhvV1BkT2xSV0VR?=
 =?utf-8?B?L0xQcnVIclRBTG1yeHBEREJWbkE0TEY3ZW5jcEVuUmo0Q3FPbXFRNHlTT2hz?=
 =?utf-8?B?dmhkakI1bU1rdlhTa0NCekdqbWFTRzhSelM2d21ka1FEMldDeXJqTkdjNlJ1?=
 =?utf-8?B?cllNWFlqUmN0Mm04TWdaZENZejEvOFEyTHB5QUI5VGx4TEdPSkpDYzM5NVBs?=
 =?utf-8?B?Y0pXc2JyU2R2YTYvaWF5ZW5NS20yOXZ4cEdCUGxtVnZsNFBVajJTZG5NSDBw?=
 =?utf-8?B?ZEdjc0YzWFd1SGkyTlRVNFE1emlzMlE4MmRPZkk1cjZKb1RudldXQjNRQS90?=
 =?utf-8?B?RUZ3bEF3WVoydGk1QUVKWjBCcjNRTkpXRkdlWnFEYzQ3bkErUWhNK3JuMzRl?=
 =?utf-8?Q?TlmyNRnmDJx37By0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242a9a19-b1d3-4cae-c906-08de7940c53b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 16:20:22.6739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HM2QktpHAa1xdxruJzUrfXV16v4/DnN7MOMJmzkDjmcr/RPL3Tmc55OeTK1eHiympUn3FYAO4iEf/C4KBhoSiHu4Scrh+bAEwZbGlzGHh0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12485
X-Rspamd-Queue-Id: 388A51F3C79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5050-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXBseS4NCg0KPiBGcm9tOiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAwMyBNYXJjaCAyMDI2IDEz
OjI5DQo+IFRvOiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNv
bT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBHdWVudGVyIFJvZWNrIDxs
aW51eEByb2Vjay11cy5uZXQ+OyBNaWNoYWVsIFR1cnF1ZXR0ZQ0KPiA8bXR1cnF1ZXR0ZUBiYXls
aWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBXaW0gVmFuIFNlYnJv
ZWNrIDx3aW1AbGludXgtd2F0Y2hkb2cub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
aytkdEBrZXJuZWwub3JnPjsgR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT47IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IG1hZ251cy5kYW1t
IDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJoYWth
ci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+OyBsaW51eC13YXRjaGRvZ0B2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMt
DQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1jbGtAdmdlci5rZXJuZWwub3JnOyBCaWp1IERhcw0KPiA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8zXSBhcm02NDogZHRzOiByZW5lc2Fz
OiByOWEwOWcwNTc6IFJlbW92ZSB3ZHR7MCwyLDN9IG5vZGVzDQo+IA0KPiBIaSBGYWJyaXppbywN
Cj4gDQo+IE9uIFR1ZSwgMyBGZWIgMjAyNiBhdCAxMzo0MywgRmFicml6aW8gQ2FzdHJvDQo+IDxm
YWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoZSBIVyB1c2VyIG1h
bnVhbCBmb3IgdGhlIFJlbmVzYXMgUlovVjJIKFApIFNvQyAoYS5rLmEgcjlhMDlnMDU3KQ0KPiA+
IHN0YXRlcyB0aGF0IG9ubHkgV0RUMSBpcyBzdXBwb3NlZCB0byBiZSBhY2Nlc3NlZCBieSB0aGUg
Q0E1NSBjb3Jlcy4NCj4gPiBXRFQwIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgYnkgdGhlIENNMzMg
Y29yZSwgV0RUMiBpcyBzdXBwb3NlZA0KPiA+IHRvIGJlIHVzZWQgYnkgdGhlIENSOCBjb3JlIDAs
IGFuZCBXRFQzIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQNCj4gPiBieSB0aGUgQ1I4IGNvcmUgMS4N
Cj4gPg0KPiA+IFJlbW92ZSB3ZHR7MCwyLDN9IGZyb20gdGhlIFNvQyBzcGVjaWZpYyBkZXZpY2Ug
dHJlZSB0byBtYWtlIGl0DQo+ID4gY29tcGxpYW50IHdpdGggdGhlIHNwZWNpZmljYXRpb24gZnJv
bSB0aGUgSFcgbWFudWFsLg0KPiA+DQo+ID4gVGhpcyBjaGFuZ2UgaXMgaGFybWxlc3MgYXMgdGhl
cmUgYXJlIGN1cnJlbnRseSBubyB1c2VycyBvZiB0aGUNCj4gPiB3ZHR7MCwyLDN9IGRldmljZSB0
cmVlIG5vZGVzLCBvbmx5IHRoZSB3ZHQxIG5vZGUgaXMgYWN0dWFsbHkgdXNlZC4NCj4gPg0KPiA+
IEZpeGVzOiAwOTUxMDU0OTZlN2QgKCJhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNTc6IEFk
ZCBXRFQwLVdEVDMgbm9kZXMiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+DQo+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLWZpeGVzIGZvciB2Ny4w
Lg0KDQpUaGFua3MhDQoNCj4gDQo+IEFwcGFyZW50bHkgdGhlIHNhbWUgYXBwbGllcyB0byBSWi9W
Mk4uICBTaGFsbCBJIGp1c3QgYXBwbHkgdGhpcyBwYXRjaA0KPiB0byBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjlhMDlnMDU2LmR0c2ksIHRvbywgd2l0aCB0aGUgU29DIG5hbWUNCj4gYW5k
IHBhcnQgbnVtYmVycyB1cGRhdGVkLCBhbmQNCj4gDQo+ICAgICBGaXhlczogN2RiOTU4OTgzYzhk
ZDE0ZCAoImFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA1NjogQWRkDQo+IFdEVDAtV0RUMyBu
b2RlcyIpDQo+IA0KPiA/DQoNClRoZSBtYW51YWwgZm9yIHRoZSBSZW5lc2FzIFJaL1YyTiBpcyBu
b3Qgc3VwZXIgY2xlYXIgb24gdGhpcyBtYXR0ZXIsDQpJIGFtIHdhaXRpbmcgZm9yIGZ1cnRoZXIg
Y2xhcmlmaWNhdGlvbi4NCg0KSSdsbCBzZW5kIGFub3RoZXIgc2VyaWVzIGZvciB0aGUgUlovVjJO
IGlmIGFwcHJvcHJpYXRlLCB0aGVyZWZvcmUgbGV0J3MNCmtlZXAgUlovVjJOIGFzLWlzIGZvciBu
b3cuDQoNClRoYW5rcyENCg0KRmFiDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQoNCg==

