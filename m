Return-Path: <linux-watchdog+bounces-5049-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAgJKr4Kp2kDcgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5049-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 17:22:22 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A78271F3A5B
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 17:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 104E9300E6A4
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2026 16:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473804D8D97;
	Tue,  3 Mar 2026 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i7WDHu9r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958344D8D83;
	Tue,  3 Mar 2026 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554793; cv=fail; b=YjKVHOeODoYY3dUdtkH8HUO80th/rIE2o+OJAFDGqUOQOf7urKqoT/mtx26ZY5omjU/RUDJ5OmqLLR4Jl3bYRGsKtr22jYd3/M6m43+iPOW+tkyhCVQEPzlHKKwIK46HfEGqbt9u9sUCYkcLzLNfUx4uzdnDbN2FEhErvclFn4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554793; c=relaxed/simple;
	bh=Jy3Nv+xk1ryEGXYrJ0qUwv8loSVwGjtn0roZY2STiRc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ngoIiMJ16zo8mWHGeccSR1bLqJ7AEWtLv5l0amcZIhicdtvxzDSSqVCYdMT4EHuiaBKtMDdsOFJ+EEi5OBa+L1SZCkuv6licw423HZsJB85UD6devJm43SKK6Jwjn9NskAMCs3yogPt1RpkU/FtdKsYDYZkYJELSx1CIpKulbss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i7WDHu9r; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWliF4x0O/ZjKnDbRp+HXMVRnnowHXBhHMlAO5bKcyf/SsrHlbjqjQ4DuUJ1H1zCCZo6zUAa06C3hAGdnSq9h7MwEep1ft8c6cl0pXQDaibsdQG5Y6hiU/gpSaguExThfIa9a62+B7pm5oUpfDJMivGGq7yEHKvsZ2BDEenAo5SoyplK3OLBiTTlxPfrJcAfn4f6tIIy6ywMCVrPBmcpYEOSoK9s/DJDbft+VBmi66/owQzcUR5BQ9Ak+A9399/Vj8z0y/q53NB3VUmRGFn6wDmnDWbLkQlCYyI8OaHvEUILNFvpIlNDOWMDZznqbvJ3dium4ncY/eOkAGvtK3MjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jy3Nv+xk1ryEGXYrJ0qUwv8loSVwGjtn0roZY2STiRc=;
 b=bsJrCT30rWWJABDor8IYTrw61crVIhvn+syntQlTIzQVIGda1LlAyIFhWOc7pmrr22OhL5B0BnpxavECROgvKKIhrh3quwRV9oWuj+gwIeCZOU5Q+Fl2vuzmEdI6k5230ny6LSpiSPT+kfiw8+0MO8HXOOtw6UcAJT/uPvFO+n4qsAWuYAoaNcitFUa9SLI5kun4D9qLHaTZzqc1NlhBu9+XozW7lcO2CtR1YMxv/UGhWxfq5TSshsEQ/nGLmE9xqtxyEzJ9Lwu+GE8JLgFGGDo4QkefN6CmuKWGkHi00rWwIpwlS/p7Li21zMY/fiEpBktayZWM6MjFcNTg2OcqoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy3Nv+xk1ryEGXYrJ0qUwv8loSVwGjtn0roZY2STiRc=;
 b=i7WDHu9rf/RHhK6e3PhmZbhK/VbcnvnTpdQQXoK0anNu3xYz/hr7ia9bM3yKk8DSiYfF1EcpqQsH2Eao9DOqETGxeOatSJOhwY9pXrvbyxHDBkNMjL43NvRJwQGuReuiHk3AlnPiy72axxA+cosaJdflrrTTIT/z0to8xZMCWDI=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS9PR01MB12485.jpnprd01.prod.outlook.com (2603:1096:604:2f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:19:48 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 16:19:48 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] clk: renesas: r9a09g057: Remove entries for
 WDT{0,2,3}
Thread-Topic: [PATCH v2 3/3] clk: renesas: r9a09g057: Remove entries for
 WDT{0,2,3}
Thread-Index: AQHclQsaMiKhvKXhGkmVwzyoa9mhALWc+ZGAgAAulJA=
Date: Tue, 3 Mar 2026 16:19:47 +0000
Message-ID:
 <TYCPR01MB12093C881179A8429FBF4A91AC27FA@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com>
 <20260203124247.7320-4-fabrizio.castro.jz@renesas.com>
 <CAMuHMdX+X77ydYhvGJUmXqBWE+mOsJA3n+drz-9DOYopUFAW-g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX+X77ydYhvGJUmXqBWE+mOsJA3n+drz-9DOYopUFAW-g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS9PR01MB12485:EE_
x-ms-office365-filtering-correlation-id: a4ed22e6-99a9-4600-b7ab-08de7940b08e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 9exCespk/CZiW5FoJz4meL4aUsBRWvze9fY0fFdfpCf3YZCTD/IGVekQoSBjZNKOOxcDIWqeSZmib+8+xVbBiysYnQBbeSOlgT+I/wbmvIaKnOYs7hPdqwc6IKY3jb00joTbl3tiV7VZbaZSFyRiQFEiZem9XajK1feaNgoCH4Sg+VFW8xK8XBQJS19WayDRc0O9dOzetOOTzge5kRkMm5ssu13GukH4CcrzRWIeK0GX0vxpDsOUD1+1RFGa3n5S12xR93iYKrvIpbd/gAGVvS47k6ObG1mzOwl6Hp7MgZKSTa6duHC0TuKCAkKYyWbkTxMEU829j/cn4ynvctXoBweIM5Xz8LU2wA+2THX9emuhLfOcMLPdL+JmiGeB46CWRoOmFhBkijyfHZFDMutrRWeSblQhrgC8tkXEwsni36L2m6dmxGOCa1uOPdTAmHiRlgL39bGJcSX5ai0PO2wnkoli+swkLuXZUw9p1Aj758/+qeZABXPkv6hQY2mA1cU8VBl0fn9fQP2d4knV7lxl5YHnOL23JzTFbu5X5xo26A0rTM9kjHcCHkz7vkgmRoW7/c3Lt3DOxf3q/9y971AiqFqZyF4P4eCP9atZgqJ6E5zJFqLEsDYIbgr28N0AtUIcaJAfa88c9kbrp4ZgpmCnEW1MNSctaI7Wx5/H6FKN9NaHakB+jS1kkZABnMZ9JbRsdToGJGjC0NqAc7dW7vTjSduvLHqaLAM5GQljo8fkB0xvQ1zMtW+m5CB0SFYBW1zh+hcI7uUW/7rHDJDDxilP7bSaASgHCZ47pf89GbAnCWQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmowWHJXeXgxVFNHcUhsM016Q2dsQmZycmd0VVo2SnYwaWh5N25sYnZnS0xt?=
 =?utf-8?B?NXpyS0h1bVVmYlVZWjg1SnNPeVZJek0wb0FyektzNnpadWtSejNzczlRYXBW?=
 =?utf-8?B?WVQ0RTVaV2FIMWtsOUJmYjh2R2JmMWJ4VUhuSTkzY3BpVzlLbTB4UGJzcFRZ?=
 =?utf-8?B?eUtGcEZtZG83bDlyM0VxTWpBQmEydm5OeWpHZXpLdHIrQnYydGQrOEhQYzQ3?=
 =?utf-8?B?RHMwKzRKZjRlMnk0dU01MnF5M1pEc1ZrdUo4dXdhejRiL1htMTFrV3ZvOVB4?=
 =?utf-8?B?U1R0aEh2MmVCZ3NsS3lSWGN3TzNEY0ZyTzFGMGJ4WmVENVFXQlpyL25iV1pi?=
 =?utf-8?B?R1ltMVo2bnNYZjhEdW5BNi95M0tDUHowQzk4cXJVSk8vRXBwNWpuRDRSL080?=
 =?utf-8?B?S0VubDFYc2doenBGZFRlRnY5RjNTeFkyVkkrLzY2Q0ZwdGFVK2lCcHJIeVNZ?=
 =?utf-8?B?K01vT3o4WVA4anVUREhmejQ4cktkWnNUVllZU3Blc253Y09hbldJSlNxeW9D?=
 =?utf-8?B?TWdwQVFCaElBcHZKZEZXOHpjeHpRNEhSdWhBSm4wYkJzeHdsUjNON1NqZWRZ?=
 =?utf-8?B?UDRmUExaVG9FR0MxdFFRSmM3Rk9qUTdXOGlkMlRCcW8wa2xtbWxrYUVUdXV4?=
 =?utf-8?B?TUVmRWJzNE1keGsxZ0Y2OEpVNkRONEl1ZVhRc3p2SWdneTJUMkNDdXVaS1hj?=
 =?utf-8?B?V0FkMTUwcFJiU3dQTDhSSlpHT1hTM25Mc3lleFdwZTU2TmxwN2ZLSmI3ckJG?=
 =?utf-8?B?UVR2TytVb1BNWHNnaTErS0ZXanNsZTNiMXlkc3ZvNENHSFh2Q1hpZFhybEZs?=
 =?utf-8?B?TUE5dEZESTAzbXR5TjBGcEdCQW53M0VLU0dlY0dyQmY2U08vZkl5a0p1a1Mr?=
 =?utf-8?B?b1MyRE9jMVc5ZnJrZnJLWTR3TXhtZk0ydUNDUkRzZWd6MnVkQ3NETUlhcFlz?=
 =?utf-8?B?UFNIbWJJZ0c1ZlQrQlF4WStRZmpIVFFac2hzejR4RVdZOHVzK2ZjSG9pNG5L?=
 =?utf-8?B?cGs3d25zTDFUVDJROWdxaTJLTGVrZjZvUC9Sa1FIQTg3ZzRPTFJMVDVQN0x1?=
 =?utf-8?B?a215STJ5d0pZTXpwNjNGT3FIcXQzVU9OVXFJQ0ZyODlZSnpiaXV3YXdmWG5Y?=
 =?utf-8?B?Vmg1cHMxR2F4RENTYTY0SmZSeGFzWVlaaWREeXBFR1BlZHh3N0FYeERwYTFt?=
 =?utf-8?B?ZTlUVVhpL2twN2lJSCtwQ2ZJOHhNdHUxaGwrMndFSUxGbEc5SVJJYUJHU3dx?=
 =?utf-8?B?V1owdTlNRTdFY2lCQUtMZ1NDdWJkNUhCblNxMHZVYWZpMWtRdjc0MHh2NThi?=
 =?utf-8?B?TmtaYXdNOWx4VlRBYVd1aWg0YnFtS0ZtRTNiY1RHMFNDNHUxK2c3QzUwWmxs?=
 =?utf-8?B?eFo0U0dOTFpvVXBRbVdYL0VrUjNVbnd2NmxiaWtBNWJLUXZjZFNyUk41WllZ?=
 =?utf-8?B?dEwzU0lxcWp1VnU5bnpFWXFqeW9NK3NpU2I0RjVMMFhkRkpKZEprNjZGdm9s?=
 =?utf-8?B?dlNOQ0lrRFdLK2FXUlBLdXRWaUtWTk5qOHRTQXRJS1oxREptNWNuZ05ocGJW?=
 =?utf-8?B?c1lqcGgxZy8zSE0zNjBsQis4N3JKVUhYM01RbG5NaEhnRmRUNHh6dUJxa3cx?=
 =?utf-8?B?ZHZrVGJZcjRyQlpMN1pBVkhubnhNMkFSN3IxR0FLeWlGdWZ5dGhMcjkySm9C?=
 =?utf-8?B?NEUzTVcvNzVEam5ZcDJQeUdNOWJ1SGc2bGNGdUl3dE4xa0pxbE8yaThaM3p0?=
 =?utf-8?B?VFkyaFBYaklUdkJjREswS3JYdUxYNnRCeURwbnhzLzZ4RDVSeXA1b3VJQzNr?=
 =?utf-8?B?aGN6dWFYbkVQbEVLWTNOcmlZMTN4UkJGWlhHTUpLWDFienFBUmtoZzNNaDNN?=
 =?utf-8?B?cFcxTnJlSmlzK2RFYVRqTXdHNXJaV1lPRHNISkJDbVRpK2g1N21ZWHRvNm5N?=
 =?utf-8?B?RzBKQnBjbUEzbnBZcHNxQUVJWHFUUDNGTHJrT1cxb2g2NUE4K2xwM01qRGw1?=
 =?utf-8?B?d3JtdGU4TDlNV0YzeFc0bWZkbHROQUFvWHJENEIzZDNKV0ZTOGkzRWpSRi9D?=
 =?utf-8?B?OVQxdis0VmJZb1FXUEtpV2JDSTdPNTRkUHZ0MlJIT0FxN0RGWjlRUjcxNTJD?=
 =?utf-8?B?WnBzQmQxSTk5MlFaWFNZTDRSTnl6KzV2bFVVVEthZWZ6VlFLdzZ1aG1ZdlMv?=
 =?utf-8?B?MG82TjI5VjhHTkRSTTY0c21yNW5WRGhUejVybzlScDd2d0pxSEtBQ2pTVmhn?=
 =?utf-8?B?SkRwaFk2cDlTakQ5QkdaYUlyYTB2TnVvdjF0ZFZsWGpDYmk2enZOOWhHbVMy?=
 =?utf-8?B?TXhtcEZjOTY1cXQwbzhheldmaGJBejNaanZ2VURhWkVHWWMvd3paK0MzL2dv?=
 =?utf-8?Q?euRUG8kgMLOn1Xks=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ed22e6-99a9-4600-b7ab-08de7940b08e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 16:19:47.9751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sRgNCKQCP9XHc7xNldLoUz9aXntL/sQQOarOSBIWKydw2sPZHHfL4bFMr35yge0XzU18Fa32hotOPV+W5i0jUAEiR6k3vsxeduyx+rdq6KU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12485
X-Rspamd-Queue-Id: A78271F3A5B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5049-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXBseS4NCg0KPiBGcm9tOiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAwMyBNYXJjaCAyMDI2IDEz
OjMwDQo+IFRvOiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNv
bT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBHdWVudGVyIFJvZWNrIDxs
aW51eEByb2Vjay11cy5uZXQ+OyBNaWNoYWVsIFR1cnF1ZXR0ZQ0KPiA8bXR1cnF1ZXR0ZUBiYXls
aWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBXaW0gVmFuIFNlYnJv
ZWNrIDx3aW1AbGludXgtd2F0Y2hkb2cub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgbWFn
bnVzLmRhbW0NCj4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFByYWJoYWthciBNYWhhZGV2IExh
ZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgbGludXgtDQo+IHdh
dGNoZG9nQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvM10gY2xrOiByZW5lc2Fz
OiByOWEwOWcwNTc6IFJlbW92ZSBlbnRyaWVzIGZvciBXRFR7MCwyLDN9DQo+IA0KPiBIaSBGYWJy
aXppbywNCj4gDQo+IE9uIFR1ZSwgMyBGZWIgMjAyNiBhdCAxMzo0MywgRmFicml6aW8gQ2FzdHJv
DQo+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoZSBIVyB1
c2VyIG1hbnVhbCBmb3IgdGhlIFJlbmVzYXMgUlovVjJIKFApIFNvQyBzcGVjaWZpZXMNCj4gPiB0
aGF0IG9ubHkgdGhlIFdEVDEgSVAgaXMgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSBMaW51eCwNCj4g
PiB3aGlsZSB0aGUgV0RUezAsMiwzfSBJUHMgYXJlIHN1cHBvc2VkIHRvIGJlIHVzZWQgYnkgdGhl
IENNMzMNCj4gPiBhbmQgQ1I4IGNvcmVzLg0KPiA+DQo+ID4gUmVtb3ZlIHRoZSBjbG9jayBhbmQg
cmVzZXQgZW50cmllcyBmb3IgV0RUezAsMiwzfSB0byBwcmV2ZW50DQo+ID4gaW50ZXJmZXJpbmcg
d2l0aCB0aGUgQ00zMyBhbmQgQ1I4IGNvcmVzLg0KPiA+DQo+ID4gVGhpcyBjaGFuZ2UgaXMgaGFy
bWxlc3MgYXMgb25seSBXRFQxIGlzIHVzZWQgYnkgTGludXgsIHRoZXJlDQo+ID4gYXJlIG5vIHVz
ZXJzIGZvciB0aGUgV0RUezAsMiwzfSBjb3Jlcy4NCj4gPg0KPiA+IEZpeGVzOiAzYWVjY2JlMDgx
NzEgKCJjbGs6IHJlbmVzYXM6IHI5YTA5ZzA1NzogQWRkIGNsb2NrIGFuZCByZXNldCBlbnRyaWVz
IGZvciBHVE0vUklJQy9TREhJL1dEVCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2Fz
dHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4NCj4gaS5lLiB3aWxsIHF1ZXVlIGluIHJlbmVzYXMtY2xrLWZpeGVz
IGZvciB2Ny4wLg0KDQpUaGFua3MhDQoNCj4gDQo+IEFwcGFyZW50bHkgdGhlIHNhbWUgYXBwbGll
cyB0byBSWi9WMk4uICBTaGFsbCBJIGp1c3QgYXBwbHkgdGhpcyBwYXRjaA0KPiB0byBkcml2ZXJz
L2Nsay9yZW5lc2FzL3I5YTA5ZzA1Ni1jcGcuYywgdG9vLCB3aXRoIHRoZSBTb0MgbmFtZQ0KPiBh
bmQgcGFydCBudW1iZXIgdXBkYXRlZCwgYW5kDQo+IA0KPiAgICAgRml4ZXM6IGUwMThmOWY4OTcz
NzYwZmEgKCJjbGs6IHJlbmVzYXM6IHI5YTA5ZzA1NjogQWRkIGNsb2NrIGFuZA0KPiByZXNldCBl
bnRyaWVzIGZvciBXRFQgY29udHJvbGxlcnMiKQ0KPiANCj4gPw0KDQpUaGUgbWFudWFsIGZvciB0
aGUgUmVuZXNhcyBSWi9WMk4gaXMgbm90IHN1cGVyIGNsZWFyIG9uIHRoaXMgbWF0dGVyLA0KSSBh
bSB3YWl0aW5nIGZvciBmdXJ0aGVyIGNsYXJpZmljYXRpb24uDQoNCkknbGwgc2VuZCBhbm90aGVy
IHNlcmllcyBmb3IgdGhlIFJaL1YyTiBpZiBhcHByb3ByaWF0ZSwgdGhlcmVmb3JlIGxldCdzDQpr
ZWVwIFJaL1YyTiBhcy1pcyBmb3Igbm93Lg0KDQpUaGFua3MhDQoNCkZhYg0KDQo+IA0KPiBHcntv
ZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0K
PiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0
DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQo=

