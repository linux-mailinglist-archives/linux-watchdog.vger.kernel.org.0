Return-Path: <linux-watchdog+bounces-5024-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GQ3EUE4pWnt5wUAu9opvQ
	(envelope-from <linux-watchdog+bounces-5024-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 08:12:01 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B255D1D3AF4
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 08:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41DFA3018284
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 07:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0367383C77;
	Mon,  2 Mar 2026 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Bo53xI6Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCE037FF72;
	Mon,  2 Mar 2026 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772435506; cv=fail; b=Zr767VAls4qp204kqu/wzfXKHDCjCRYM2qkYZLkfsVw9L1vd7KoaaKP6f3ks6V6puNV+mBCkRdqGQfSHqO5XjjxlEL1IUZIEeiB3I5x8OtNKGAG8cRxt6iNhCvV3rtJAotkP/WomJChvAGJQSq8dgQRbGjFzMz63IOMXWg2rsM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772435506; c=relaxed/simple;
	bh=m8PvLe5lvfjYcx2uWrCuIRi6lnBqGQUuVIKhc6ipsIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kwLr7PEx3hHgdsD87KVQLpWOsOmKkeVKS94MjoPsgEeXMJPlYhDKNweaSOhz82phnXHjRgUmGfHHoV3t8vzQhYp5qh7xcKz+5w238BotacyvmtW2Bv4ctV6G19oWJ1ETGhT8SElmc7zbPgdG1drDXMMK2a2Swxv40aqs7gm1+nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Bo53xI6Z; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib1HZcQ9RWu47VzbZ/o5HdSWa/h9YOE3aSxWWHFHzZaqtDfo3Nm2jgZU3KWMfcIYNqEztPtKJ8n78m4HRuCOwIoj8jjZusT2bXw0213yh2mZV2Qzp5iBvzHVeRnjlxD+shkiTUQx9W2V3yNhxKre/rHgOvb5nVcLTqPH10ci/3r6IvRdGQiDYoPHvYs3R1GGxbxZbIEXs7SCfpG9Div1ghQ2GtcL0Mzn6gIemUMdoxTGst+WVie8DKKpBhEOi4BCsRjba8QtLqFMjEo2kGQcOJ/IvdtySPtWyJbhysApM2WUojWljS+bxSB1GYT/KqeuteCufgSHgsx5MUcOACS+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8PvLe5lvfjYcx2uWrCuIRi6lnBqGQUuVIKhc6ipsIQ=;
 b=ucnIrXT98LYxaMSle74aA8h+bm7tgk2G+5K96R8O7lAJQ5TqeXY4Bt1mBKFcV5/wQ9/MHJRbzVguTsFZM81ldFLpkDcHdU80tknFXsMbUEge40bMzTOIAzrIbisyEhuL08XOO+dosdW5lxzabbT9ERcn9Box8fA8S21mhfj42AYrDexiA/Fwxtd7u9tNYlAr4LJNgM/w/SATU5mLiKto0UWT0fgfhOGmU6l0L00IkyARVQziF6QZyG+noMvplZBU2oMAYCZn2cSeCe3zPYD+ODynmfmNfY7qC/ubQp6j+CoiBSpOUjZCHd1Iwn4wjzUHmPpwiPhaZlKyhKsGphfyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8PvLe5lvfjYcx2uWrCuIRi6lnBqGQUuVIKhc6ipsIQ=;
 b=Bo53xI6ZwSybqDmA45+w7TEiA1UUwRZS15tX04sX5lgnCl8wzhP8Z4l7THBNNw0Ewxn4nL5L6PyjhqGwObBnTFJ7Cu0IpQgAzPHSFdKFFWesntEblFzpSUgIrm0nSVPAbC+8YYCRjZpqiBUthkcixZC2LP27oF6DjXey1jEZuPgkfhTibRu+FqDiNQWNpX618iajaMFr/gdjfu8uyNih2ikLxsf7vxhb4S2/1M5ThbG/iN1/WfiwyW7Uc4FDkfEvoPW6ZZ8fDZZaZcCNCG60GIxqCBXay70jvN0yF5St/7RZZrCZiAFXs7BF+7uEqyp0NwNzxKTiecGc7rIHhwmzoQ==
Received: from CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18)
 by MW4PR11MB6983.namprd11.prod.outlook.com (2603:10b6:303:226::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 07:11:38 +0000
Received: from CH3PR11MB8187.namprd11.prod.outlook.com
 ([fe80::ae7a:fa9:b654:1374]) by CH3PR11MB8187.namprd11.prod.outlook.com
 ([fe80::ae7a:fa9:b654:1374%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 07:11:37 +0000
From: <Balakrishnan.S@microchip.com>
To: <alexandre.belloni@bootlin.com>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<Nicolas.Ferre@microchip.com>, <claudiu.beznea@tuxon.dev>,
	<linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <andrei.simion@microchip.com>
Subject: Re: [PATCH 1/3] watchdog: at91sam9_wdt.h: Cleanup the header file
Thread-Topic: [PATCH 1/3] watchdog: at91sam9_wdt.h: Cleanup the header file
Thread-Index: AQHcp7so1x3231XOB0awIabZ9UuI5rWWLKCAgASrh4A=
Date: Mon, 2 Mar 2026 07:11:37 +0000
Message-ID: <4ad39929-426a-4d6c-adde-b0ebf36bc541@microchip.com>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
 <20260227073116.30447-2-balakrishnan.s@microchip.com>
 <202602270752399219b90c@mail.local>
In-Reply-To: <202602270752399219b90c@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8187:EE_|MW4PR11MB6983:EE_
x-ms-office365-filtering-correlation-id: c635300b-da83-4250-c904-08de782af211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7142099003|38070700021;
x-microsoft-antispam-message-info:
 z7AWU/ornrsG4vfwZcCpR3/kd5BL7NWzBAMl4xxqbJSsj3oVvUv7C/NNXRRjdsbKDac398itBXU7ArhF9qnUlCaqtHLB4RYxXgbn5LZdV03gxgFUKDpVa0J7UiTnrBmX2nQpSU6GCbP0l0dbjtVZp2EVx5LTvGO+bxSQLqcKLZ5bP+MQlXNqyqijKOO8hbMnRBY+TnstLWjzm31dAQOFK1ArIWFekL+Lad5KqUDi9VGw30h0tLL+DtEzgU3w+bymz6AbObas/q0eddWBOqDAinxjEfFQMeGZPVBmZs8NebI+luPvD3E7MUkmz7ooPGto/QtsfLIuzuX4zXVgBCYvJidIIte7fpEMsYQYzWMvY6jYLpRSKL/NzETOHVpZXk5dodO7tsanZ4J3MCxECPVdDeq3itWA2jTrq0tIfdNPtZqV4byQMsPboGmI9GDdhQe1/1wZjwJjJ0xMxSLctJPl2Fee0z/UMwRm1daQDVWpQrxD0pr1aiYxUAYJ6bF9Uz6fzkqO/UbZrm6fQIp6ASwt+3d8H+LzxeH31V093BlC9OsSZc8VT282HAy3JhHcEhpyyaGnMRy/cNHDM0y7jqsheQbro43M+IBayWr8/vg6xrWo1DMLXN9ez2O7ugxu8ujo+btKjf/kn4wR6qlL2Iw0Vp5nlL8NpcThxkwZ8r+1oxBn4raga35Mw+UN+5tKWInQ0FZ62l+89zZm+Jd86aPXv4vPquCZCMXUx7ZTINBnMGw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWFVNWZ3K0d4bWNFT1JRSFJYT2J2RXdKRXkrS0dlRnd5clJhUElOWlQ1cjEx?=
 =?utf-8?B?VDVpNmpKK21FR3RrblNkTzJhRFMxMlpkTmVrWVF0eEZ5NU5IT0FuOGlHd3Zt?=
 =?utf-8?B?ckxsb21RN2UrUFlNemVjUXpsZkUybitpbUY0dUV4RXRBdTQzbSt2b1VhRWpr?=
 =?utf-8?B?N2M0SmZFTDJjTDMvTXRNam5TNE5NQzh3UzFubTFjUEtuaDNNQTlPT1Q2M3NM?=
 =?utf-8?B?NkVPSEYxTjVUTk8veXhnU3BqNU5WUENFRDU4YmFLVU1yKzZ4SlQ1UEMxVHZi?=
 =?utf-8?B?Y0NuYjhMZGNrVlZjZ0ZiU3pNTmkwMmE0Ly9LSzUwTlg3NW9wUDZMdVYxdk04?=
 =?utf-8?B?UTdmMC90SHN2bDBzdTJXc2JXUXVvSnA1ZGhVQVgzVVJxRzIyS05TQUFvdGlP?=
 =?utf-8?B?Z1o3bWJEQjlnVEFIUExwQktuZ0twR2o4c25xNERMV3RpQnBscGZ4Vnc0NHBu?=
 =?utf-8?B?SDByUnJOS2RaYnhQNnhOWm9NZTRqbEkydEtobnBNSnZVOUZIMjltYjFkUmtS?=
 =?utf-8?B?ZlNpZ3dmYVdaUE1KT0RORzZnWEtneDhyRDRoR3pRZ3ZkcGlJRzlXL1NiWEcr?=
 =?utf-8?B?M2tGWUMydks4SFlQQUJnSk9XeGlFY05ZazBHQmIwYWZ5Wit0Y0RscG1BUHBj?=
 =?utf-8?B?eitEam55aFc4OW5OWHU4aXZuM0ljWE1pUjZ6ZFd3RlFYaEgzbkNDajdSRFZ1?=
 =?utf-8?B?SXY3Vi9LZ0g3aXg0bml2UWJobXd1L3BSZStsQ0FrY3JYYW9qWkRpNmVhQytQ?=
 =?utf-8?B?Z2NBREZJaG43SFoxZXVqSkxxbUNSenpPL20zczN6MkN3NXUrY00zZis0ZGZU?=
 =?utf-8?B?VlE5Y2VoNTZkQ0pDWW1PM0c0ZVdNdWVmZlkzY3JnQStHMnRjTzRldTAveERM?=
 =?utf-8?B?dWNxYTNmMzlITzNocFgraTl4Q3NEMGRoUFlFak5qa3R2eXRQU00wQjUreWVx?=
 =?utf-8?B?dG5CT1pLNTFkOG5jTjZUUzljc3h1YlNUVlZkVmpwMEN3Z05wSWNzcEtBdzdN?=
 =?utf-8?B?Y0VNU1MrQWhhblAycUo4WXh0R0hLYWlOa0JoNzVZdXIzRHh6MTIveTJmdzI2?=
 =?utf-8?B?ejNYeTA0WjBsYmNwWDhISEMzWjdpNmdEWGd5aUJ6V0JobWpNa3J0SVlsY1Vy?=
 =?utf-8?B?NWFjaU9OV09GZDNOOUZ3andGekZ2TVJXek9ZWTZFaGh0Z1ExcGtna3J2bUV5?=
 =?utf-8?B?dW1EOWFKbUdIa2dKUjFnYlg1am5MRWhFMFZyYWRZS2oxOGMrYWdMcHdlZnht?=
 =?utf-8?B?eDNDTEZCR0d0SE9XSGE5ZTVHeFBNWjEydU5Bd2N0S3Mwc0VQcUVIK2tFR3Uv?=
 =?utf-8?B?L1RhcEcvbjgyWmtZaUt3UGhIRkQ0MVpLd09tbVNlMWozVnF4NnNCVVhNZUx6?=
 =?utf-8?B?N2hmZ1p1WHpWcUxpa095QmliRnNZSWJNdFBxRHd2SW9yK0xLQk1mcVIwcEJi?=
 =?utf-8?B?WG5wNVdUY0k2cGs4cGR5VEVHVDk3b25jaC9xZCtUa3NmVG9KamlZY2Jzak9t?=
 =?utf-8?B?cXNnQ1huS0ZnRk1taEd6czMrVVk0ZDVFd1NXZnkwWWZ1WU0xbUNhS0tCN2lq?=
 =?utf-8?B?d1psK3VKVk1DUTA0aHNNaVYwZEhRVnExV2xZKzhnaUJiVHF2UkNlbmNPbHB0?=
 =?utf-8?B?NTdqSjdHYWt3Q1NOek9FSklHVWk4OXllV2JDZVR1dXlLOWRUckxRVnYrcGVR?=
 =?utf-8?B?Tjh5YnBjbmtuVFR5QTkvMlFVMjZCREQ2OFpCWExKUVB5M3AzOXFqdkdvWk8w?=
 =?utf-8?B?T0E0Qk1ZUTNFK1l3bng1K0ZtdW5qV3dlWkV3aStMZWk0SHdZeDUzWFhTL3kx?=
 =?utf-8?B?R0diN0w3cC9oK3E2RHJZSHFjb2Y2NG5oUTNpV0hEUHdnaVkrWW9peG92a1VV?=
 =?utf-8?B?ZDFpWWdFVk01eGFjUlZBSTBFejNwdFZWZ1grMndaaEtEaXJmR0tyc0hmVzlI?=
 =?utf-8?B?WDdXRzY1OXREU2tYWTRaaHZwTWNIOHJsbnFRcDNGak80d040NGZtZVRwK1Rn?=
 =?utf-8?B?dkZmMmxFTG90Y25UK1g3akovMTY0bE9sUmxhZlRQdEFPdnQ1NWZ6eUF6bEdo?=
 =?utf-8?B?QVI3b0tEZzhabHA4K2Z6WVU5eVVOVXBsTExaUkF6cWtZSXh0ZXlmUVBVNktH?=
 =?utf-8?B?a1VwSkZ0YXFFOU9WVjduZkt4VUtQZzVGakZyUllTU1NBUFFDdFJIUlBRSnMv?=
 =?utf-8?B?NHgvR0hTc05oQkV0UGhKcjZ1OFFrRGNxTWJDZ2JqZkVsM0tCRlVhTG9yOW5y?=
 =?utf-8?B?RkdhNW5Md0ZLeG5jbnRoVExaemdxWlRTT054NlkwVUE0WktJNDJ4Q2RrN1lG?=
 =?utf-8?B?cERMT3BSWEdqU1NDUVFjVGdSci9GMEcvWVphdUV0Sy9LbXNVUWFFUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D92358F48546444975F037465D5113D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c635300b-da83-4250-c904-08de782af211
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:11:37.8307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lavqjrUcF7taIwD9zRO8TSL8/PjIOsS6V3hlwrVB9oifxtQFsUfDMYYSAmQv09yOSsS7rhIct26/JXNj8KvEUUt1gTIG1+TwCN/JjNInSdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6983
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5024-lists,linux-watchdog=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: B255D1D3AF4
X-Rspamd-Action: no action

SGksDQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLg0KDQpPbiAyNy8wMi8yNiAxOjIyIHBtLCBB
bGV4YW5kcmUgQmVsbG9uaSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBz
YWZlDQo+IA0KPiBPbiAyNy8wMi8yMDI2IDEzOjAxOjE0KzA1MzAsIEJhbGFrcmlzaG5hbiBTYW1i
YXRoIHdyb3RlOg0KPj4gRnJvbTogQW5kcmVpIFNpbWlvbiA8YW5kcmVpLnNpbWlvbkBtaWNyb2No
aXAuY29tPg0KPj4NCj4+IFRoaXMgcGF0Y2ggcmVvcmdhbml6ZXMgdGhlIGhlYWRlciBmaWxlIGJ5
IHJlbmFtaW5nIHRoZSByZWdpc3RlcnMgdXNpbmcNCj4+IGEgZ2VuZXJhbCBwYXR0ZXJuIGFsc28g
dGhpcyBwYXRjaCBzaW1wbGlmaWVzIHRoZSB3YXRjaGRvZyBkaXNhYmxlIGxvZ2ljDQo+PiBpbiB0
aGUgYXQ5MXNhbTlfd2R0LmggaGVhZGVyIGJ5IGRpZmZlcmVudGlhdGluZyBiZXR3ZWVuIG1vZGVy
bg0KPj4gKFNBTTlYNjAsIFNBTUE3RzUsIFNBTTlYNykgYW5kIGxlZ2FjeSAoU0FNQTUsIEFUOTFT
QU05MjYxKSBjaGlwcyBiYXNlZA0KPj4gb24gdGhlIHdhdGNoZG9nIGRpc2FibGUgYml0Lg0KPj4g
Rm9yIG1vZGVybiBjaGlwcywgdGhlIGRpc2FibGUgYml0IGlzIGF0IGJpdCAxMiwgd2hpbGUgZm9y
IGxlZ2FjeSBjaGlwcw0KPj4gaXQgaXMgYXQgYml0IDE1Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJlaSBTaW1pb24gPGFuZHJlaS5zaW1pb25AbWljcm9jaGlwLmNvbT4NCj4+IFtSZW1vdmUg
S2NvbmZpZy1iYXNlZCBXRERJUyBzZWxlY3Rpb24gYW5kIGRlZmluZSBleHBsaWNpdCBsZWdhY3kg
YW5kDQo+PiBtb2Rlcm4gbWFza3NdDQo+PiBTaWduZWQtb2ZmLWJ5OiBCYWxha3Jpc2huYW4gU2Ft
YmF0aCA8YmFsYWtyaXNobmFuLnNAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJz
L3dhdGNoZG9nL2F0OTFzYW05X3dkdC5oIHwgNjUgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9hdDkxc2FtOV93ZHQu
aCBiL2RyaXZlcnMvd2F0Y2hkb2cvYXQ5MXNhbTlfd2R0LmgNCj4+IGluZGV4IDI5OGQ1NDVkZjFh
MS4uMWUwYWVlY2I0ODlmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9hdDkxc2Ft
OV93ZHQuaA0KPj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9hdDkxc2FtOV93ZHQuaA0KPj4gQEAg
LTMsNTkgKzMsNTggQEANCj4+ICAgICogZHJpdmVycy93YXRjaGRvZy9hdDkxc2FtOV93ZHQuaA0K
Pj4gICAgKg0KPj4gICAgKiBDb3B5cmlnaHQgKEMpIDIwMDcgQW5kcmV3IFZpY3Rvcg0KPj4gICAg
KiBDb3B5cmlnaHQgKEMpIDIwMDcgQXRtZWwgQ29ycG9yYXRpb24uDQo+PiAgICAqIENvcHlyaWdo
dCAoQykgMjAxOSBNaWNyb2NoaXAgVGVjaG5vbG9neSBJbmMuIGFuZCBpdHMgc3Vic2lkaWFyaWVz
DQo+PiAgICAqDQo+PiAgICAqIFdhdGNoZG9nIFRpbWVyIChXRFQpIC0gU3lzdGVtIHBlcmlwaGVy
YWxzIHJlZ3N0ZXJzLg0KPj4gICAgKiBCYXNlZCBvbiBBVDkxU0FNOTI2MSBkYXRhc2hlZXQgcmV2
aXNpb24gRC4NCj4+ICAgICogQmFzZWQgb24gU0FNOVg2MCBkYXRhc2hlZXQuDQo+PiArICogQmFz
ZWQgb24gU0FNQTdHNSBkYXRhc2hlZXQuDQo+PiArICogQmFzZWQgb24gU0FNOVg3NSBkYXRhc2hl
ZXQuDQo+PiAgICAqDQo+PiAgICAqLw0KPj4NCj4+ICAgI2lmbmRlZiBBVDkxX1dEVF9IDQo+PiAg
ICNkZWZpbmUgQVQ5MV9XRFRfSA0KPj4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4NCj4+
DQo+PiAtI2RlZmluZSBBVDkxX1dEVF9DUiAgICAgICAgICAweDAwICAgICAgICAgICAgICAgICAg
ICAvKiBXYXRjaGRvZyBDb250cm9sIFJlZ2lzdGVyICovDQo+PiAtI2RlZmluZSAgQVQ5MV9XRFRf
V0RSU1RUICAgICBCSVQoMCkgICAgICAgICAgICAgICAgICAvKiBSZXN0YXJ0ICovDQo+PiAtI2Rl
ZmluZSAgQVQ5MV9XRFRfS0VZICAgICAgICAgICAgICAgICgweGE1VUwgPDwgMjQpICAgICAgICAg
IC8qIEtFWSBQYXNzd29yZCAqLw0KPj4gLQ0KPj4gLSNkZWZpbmUgQVQ5MV9XRFRfTVIgICAgICAg
ICAgMHgwNCAgICAgICAgICAgICAgICAgICAgLyogV2F0Y2hkb2cgTW9kZSBSZWdpc3RlciAqLw0K
Pj4gLSNkZWZpbmUgIEFUOTFfV0RUX1dEViAgICAgICAgICAgICAgICAoMHhmZmZVTCA8PCAwKSAg
ICAgICAgICAvKiBDb3VudGVyIFZhbHVlICovDQo+PiAtI2RlZmluZSAgQVQ5MV9XRFRfU0VUX1dE
Vih4KSAoKHgpICYgQVQ5MV9XRFRfV0RWKQ0KPj4gLSNkZWZpbmUgIEFUOTFfU0FNOVg2MF9QRVJJ
T0RSU1QgICAgICBCSVQoNCkgICAgICAgICAgLyogUGVyaW9kIFJlc2V0ICovDQo+PiAtI2RlZmlu
ZSAgQVQ5MV9TQU05WDYwX1JQVEhSU1QgICAgICAgIEJJVCg1KSAgICAgICAgICAvKiBNaW5pbXVt
IFJlc3RhcnQgUGVyaW9kICovDQo+PiArI2RlZmluZSBBVDkxX1dEVF9DUiAgICAgICAgICAweDAw
ICAgICAgICAgICAgLyogV2F0Y2hkb2cgQ29udHJvbCBSZWdpc3RlciAqLw0KPj4gKyNkZWZpbmUg
IEFUOTFfV0RUX1dEUlNUVCAgICAgQklUKDApICAgICAgICAgIC8qIFJlc3RhcnQgKi8NCj4+ICsj
ZGVmaW5lICBBVDkxX1dEVF9LRVkgICAgICAgICAgICAgICAgKDB4YTVVTCA8PCAyNCkgIC8qIEtF
WSBQYXNzd29yZCAqLw0KPj4gKyNkZWZpbmUgQVQ5MV9XRFRfTVIgICAgICAgICAgMHgwNCAgICAg
ICAgICAgIC8qIFdhdGNoZG9nIE1vZGUgUmVnaXN0ZXIgKi8NCj4+ICsjZGVmaW5lICBBVDkxX1dE
VF9XRFYgICAgICAgICAgICAgICAgKDB4ZmZmVUwgPDwgMCkgIC8qIENvdW50ZXIgVmFsdWUgKi8N
Cj4+ICAgI2RlZmluZSAgQVQ5MV9XRFRfV0RGSUVOICAgICBCSVQoMTIpICAgICAgICAgLyogRmF1
bHQgSW50ZXJydXB0IEVuYWJsZSAqLw0KPj4gLSNkZWZpbmUgIEFUOTFfU0FNOVg2MF9XRERJUyAg
QklUKDEyKSAgICAgICAgIC8qIFdhdGNoZG9nIERpc2FibGUgKi8NCj4+IC0jZGVmaW5lICBBVDkx
X1dEVF9XRFJTVEVOICAgIEJJVCgxMykgICAgICAgICAvKiBSZXNldCBQcm9jZXNzb3IgKi8NCj4+
IC0jZGVmaW5lICBBVDkxX1dEVF9XRFJQUk9DICAgIEJJVCgxNCkgICAgICAgICAvKiBUaW1lciBS
ZXN0YXJ0ICovDQo+PiAtI2RlZmluZSAgQVQ5MV9XRFRfV0RESVMgICAgICAgICAgICAgIEJJVCgx
NSkgICAgICAgICAvKiBXYXRjaGRvZyBEaXNhYmxlICovDQo+PiAtI2RlZmluZSAgQVQ5MV9XRFRf
V0REICAgICAgICAgICAgICAgICgweGZmZlVMIDw8IDE2KSAgICAgICAgIC8qIERlbHRhIFZhbHVl
ICovDQo+PiAtI2RlZmluZSAgQVQ5MV9XRFRfU0VUX1dERCh4KSAoKCh4KSA8PCAxNikgJiBBVDkx
X1dEVF9XREQpDQo+PiAtI2RlZmluZSAgQVQ5MV9XRFRfV0REQkdITFQgICBCSVQoMjgpICAgICAg
ICAgLyogRGVidWcgSGFsdCAqLw0KPj4gLSNkZWZpbmUgIEFUOTFfV0RUX1dESURMRUhMVCAgQklU
KDI5KSAgICAgICAgIC8qIElkbGUgSGFsdCAqLw0KPj4gLQ0KPj4gKyNkZWZpbmUgIEFUOTFfV0RU
X1dEUlNURU4gICAgQklUKDEzKQ0KPj4gKyNkZWZpbmUgIEFUOTFfV0RUX1dEUlBST0MgICAgQklU
KDE0KQ0KPj4gKyNkZWZpbmUgIEFUOTFfV0RUX1dERCAgICAgICAgICAgICAgICAoMHhmZmZVTCA8
PCAxNikNCj4+ICsjZGVmaW5lICBBVDkxX1dEVF9XRERCR0hMVCAgIEJJVCgyOCkNCj4+ICsjZGVm
aW5lICBBVDkxX1dEVF9XRElETEVITFQgIEJJVCgyOSkNCj4+ICAgI2RlZmluZSBBVDkxX1dEVF9T
UiAgICAgICAgICAweDA4ICAgICAgICAgICAgLyogV2F0Y2hkb2cgU3RhdHVzIFJlZ2lzdGVyICov
DQo+PiAgICNkZWZpbmUgIEFUOTFfV0RUX1dEVU5GICAgICAgICAgICAgICBCSVQoMCkgICAgICAg
ICAgLyogV2F0Y2hkb2cgVW5kZXJmbG93ICovDQo+PiAgICNkZWZpbmUgIEFUOTFfV0RUX1dERVJS
ICAgICAgICAgICAgICBCSVQoMSkgICAgICAgICAgLyogV2F0Y2hkb2cgRXJyb3IgKi8NCj4+DQo+
PiAtLyogV2F0Y2hkb2cgVGltZXIgVmFsdWUgUmVnaXN0ZXIgKi8NCj4+IC0jZGVmaW5lIEFUOTFf
U0FNOVg2MF9WUiAgICAgICAgICAgICAgMHgwOA0KPj4gKyNkZWZpbmUgIEFUOTFfV0RUX1NFVF9X
RFYoeCkgKCh4KSAmIEFUOTFfV0RUX1dEVikNCj4+ICsjZGVmaW5lICBBVDkxX1dEVF9TRVRfV0RE
KHgpICgoKHgpIDw8IDE2KSAmIEFUOTFfV0RUX1dERCkNCj4+DQo+PiAtLyogV2F0Y2hkb2cgV2lu
ZG93IExldmVsIFJlZ2lzdGVyICovDQo+PiAtI2RlZmluZSBBVDkxX1NBTTlYNjBfV0xSICAgICAw
eDBjDQo+PiAtLyogV2F0Y2hkb2cgUGVyaW9kIFZhbHVlICovDQo+PiAtI2RlZmluZSAgQVQ5MV9T
QU05WDYwX0NPVU5URVIgICAgICAgICgweGZmZlVMIDw8IDApDQo+PiAtI2RlZmluZSAgQVQ5MV9T
QU05WDYwX1NFVF9DT1VOVEVSKHgpICgoeCkgJiBBVDkxX1NBTTlYNjBfQ09VTlRFUikNCj4+ICsj
ZGVmaW5lIEFUOTFfV0RUX1ZSICAgICAgICAgIDB4MDggICAgLyogV2F0Y2hkb2cgVGltZXIgVmFs
dWUgUmVnaXN0ZXIgKi8NCj4+ICsjZGVmaW5lIEFUOTFfV0RUX0lTUiAgICAgICAgIDB4MWMgICAg
LyogSW50ZXJydXB0IFN0YXR1cyBSZWdpc3RlciAqLw0KPj4gKyNkZWZpbmUgQVQ5MV9XRFRfSUVS
ICAgICAgICAgMHgxNCAgICAvKiBJbnRlcnJ1cHQgRW5hYmxlIFJlZ2lzdGVyICovDQo+PiArI2Rl
ZmluZSBBVDkxX1dEVF9JRFIgICAgICAgICAweDE4ICAgIC8qIEludGVycnVwdCBEaXNhYmxlIFJl
Z2lzdGVyICovDQo+PiArI2RlZmluZSBBVDkxX1dEVF9XTFIgICAgICAgICAweDBjICAgIC8qIFdh
dGNoZG9nIFdpbmRvdyBMZXZlbCBSZWdpc3RlciAqLw0KPj4gKyNkZWZpbmUgQVQ5MV9XRFRfUEVS
SU9EUlNUICAgQklUKDQpICAvKiBQZXJpb2QgUmVzZXQgKi8NCj4+ICsjZGVmaW5lIEFUOTFfV0RU
X1JQVEhSU1QgICAgIEJJVCg1KSAgICAgICAgICAvKiBNaW5pbXVtIFJlc3RhcnQgUGVyaW9kICov
DQo+PiArI2RlZmluZSAgQVQ5MV9XRFRfUEVSSU5UICAgICBCSVQoMCkgIC8qIFBlcmlvZCBJbnRl
cnJ1cHQgRW5hYmxlICovDQo+PiArI2RlZmluZSAgQVQ5MV9XRFRfQ09VTlRFUiAgICAoMHhmZmZV
TCA8PCAwKSAgLyogV2F0Y2hkb2cgUGVyaW9kIFZhbHVlICovDQo+PiArI2RlZmluZSAgQVQ5MV9X
RFRfU0VUX0NPVU5URVIoeCkgICAgICgoeCkgJiBBVDkxX1dEVF9DT1VOVEVSKQ0KPj4NCj4+IC0v
KiBJbnRlcnJ1cHQgRW5hYmxlIFJlZ2lzdGVyICovDQo+PiAtI2RlZmluZSBBVDkxX1NBTTlYNjBf
SUVSICAgICAweDE0DQo+PiAtLyogUGVyaW9kIEludGVycnVwdCBFbmFibGUgKi8NCj4+IC0jZGVm
aW5lICBBVDkxX1NBTTlYNjBfUEVSSU5UIEJJVCgwKQ0KPj4gLS8qIEludGVycnVwdCBEaXNhYmxl
IFJlZ2lzdGVyICovDQo+PiAtI2RlZmluZSBBVDkxX1NBTTlYNjBfSURSICAgICAweDE4DQo+PiAt
LyogSW50ZXJydXB0IFN0YXR1cyBSZWdpc3RlciAqLw0KPj4gLSNkZWZpbmUgQVQ5MV9TQU05WDYw
X0lTUiAgICAgMHgxYw0KPj4gKy8qDQo+PiArICogV0RESVMgYml0IGRpZmZlcnMgYnkgU29DOg0K
Pj4gKyAqICAgLSBTQU1BNSwgQVQ5MVNBTTkyNjE6IGJpdCAxNQ0KPj4gKyAqICAgLSBTQU05WDYw
LCBTQU1BN0c1LCBTQU05WDc1OiBiaXQgMTINCj4+ICsgKiBTZWxlY3QgYXQgcnVudGltZSB2aWEg
Y29tcGF0aWJsZSBzdHJpbmcuDQo+PiArICovDQo+PiArI2RlZmluZSBBVDkxX1dEVF9XRERJU19M
RUdBQ1kgICBCSVQoMTUpDQo+PiArI2RlZmluZSBBVDkxX1dEVF9XRERJU19NT0RFUk4gICBCSVQo
MTIpDQo+IA0KPiBUaGlzIGlzIGJhZCBuYW1pbmcsIHdlIGFyZSBnb2luZyB0byBlbmQgdXAgd2l0
aA0KPiBBVDkxX1dEVF9XRERJU19MRUdBQ1lfTEVHQUNZLCBBVDkxX1dEVF9XRERJU19NT0RFUk5f
TEVHQUNZIGFuZA0KPiBBVDkxX1dEVF9XRERJU19NT0RFUk4gbmV4dCB0aW1lLiBUaGUgcHJvcGVy
IG5hbWUgd291bGQgdXNlIHRoZSBuYW1lIG9mDQo+IHRoZSBTb0MgaW50cm9kdWNpbmcgdGhlIG5l
dyBwb3NpdGlvbi4NCg0KT2theSBnb3QgaXQuIElmIHRoYXQncyB0aGUgY2FzZSBJJ2xsIHJldGFp
biB0aGUgc29DIHNwZWNpZmljIG5hbWluZ3MgDQpldmVyeXdoZXJlIGluIHYyLg0KDQo+IA0KPj4N
Cj4+ICAgI2VuZGlmDQo+PiAtLQ0KPj4gMi4zNC4xDQo+Pg0KPiANCj4gLS0NCj4gQWxleGFuZHJl
IEJlbGxvbmksIGNvLW93bmVyIGFuZCBDT08sIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

