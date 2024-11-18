Return-Path: <linux-watchdog+bounces-2449-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8525B9D10D8
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2024 13:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E883BB21148
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2024 12:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C7F18EFDE;
	Mon, 18 Nov 2024 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="anVe2L9N"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2101.outbound.protection.outlook.com [40.107.215.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A8026AD0;
	Mon, 18 Nov 2024 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731934014; cv=fail; b=cpt7Nw/CqI5gWPPNCWJfhOmuQjlD73X55biogNnaQlGvhuSLG/ITiWSLQj9bLklASdZ61I4J+xQvMd9onXk/861kLtUgiXtIXRoToOI8JWkAxNjJKj04Ip9tp+5zTCjj1JOAVZxCyMfEHBk2zYkPg7JP3vV+XoHCO0GPRIJ2LmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731934014; c=relaxed/simple;
	bh=fP5qIRAKXWEeYDUgOHtU8Cl0m3FDaYdSS6jiqfocYlU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nq/O1lFSPDVE5mRTh4p9KYAk4H6Oty2upXg6DtuHeq95419x3GAgz9cUsBRvJOLVskqUZmhlXnAqSqjkBUhBeULGwljaPslP5UsFg3ievN1hf7rHcwaf1C3jEURS4vwL/L4CyBiO1JK63AATGGON1bPunqVOX2aBeS+7rhpjvoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=anVe2L9N; arc=fail smtp.client-ip=40.107.215.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xob6IRWBALUvic7qVlCT5mJbGwvBkqtPDQoH4RNc+ToaS7KTHOYy5mFhrvhvz6Ce3HbuVqqUOkN+c0ajR0vixwTPq7T5mDRt10xTam4RTn/Tu5U9XzV9xIkKNKyPLGpYBH9meEG9C3ZlmYb9osiriqPCCWHtDPWYZjWh4CGiGck6TWpsdbXddNtno7OEILlsGNA8881UcfvIXrvhXryiQM7YAiaHPLYOi7voDp/XzdqTt5gzdGt36SwU2nYLDLPysGrj5yviyOEux/R8YDjmSacbdLTnKblg08ysZ5ihouSXGaijXvndQMsIcXlrbBaxi1OQ++7wOTRPtpTWDPN87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP5qIRAKXWEeYDUgOHtU8Cl0m3FDaYdSS6jiqfocYlU=;
 b=RU+coIsuPmM2BHnbINMX/P8GvljxHV+4bQhCEucHQe2GvcyEzv5UJLFkVd7KeYW8si+4COu/Z+2lI1znIwXDvKOt/ui/89PjXJvy/9KvWy/0vT6IuHnF1kVsXNz2rY3knQa3x6i7MlqqIHLwZQxDd/bz48vjllezoI5K72FN5pvdII6uVSirQ7qSCGGlDBgakAZeUNtvkhWHSbhTfMniXURMGqBmPSy8hovNLLlojkqwl0nueDCUHweR4J2jFYAWKi49GfEXAd3OsaX0DbSLCazRwa4I8WhWzfdEGB2+h8smYYpR3Jl8v79Yc/8VLB0ffsqzyPEhxW6+VMTib/Gn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP5qIRAKXWEeYDUgOHtU8Cl0m3FDaYdSS6jiqfocYlU=;
 b=anVe2L9N5wMP/GlafJJ1bAREU9CMO57ar/WVWIFVFR87m+8ui9FQt5dJJ5khc/skzED51ErAJgKUoaWxta/39/OFCgmVTS5Zg5qbB1pC0UUU0PlpD5khiKOlKBnUpqzIGqHSBDv5S+NjVdR7CTdoAZxHFWS8JbSWEO4LO4bF48fEgpHLVPUgRn8+PfOYSr6Zw+sd1qWUUl37KXj4JL+MuVITY/0PchTXnSC0xqbOrRN95UGZ+80z+MQYOspWjjb+K9JrKVh8bU1vmiKBq/xrgiccdEB/q0Tj+I47w7ZtHjtp8QkbBGZhoZ56mk52CgmXE5i8SBW5jfIukFyeosSbrg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TY0PR06MB5031.apcprd06.prod.outlook.com (2603:1096:400:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.11; Mon, 18 Nov
 2024 12:46:44 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8182.011; Mon, 18 Nov 2024
 12:46:43 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Patrick Williams <patrick@stwcx.xyz>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC: "joel@jms.id.au" <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org"
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
Thread-Index:
 AQHbLFdFSiy5MyUwCUe0YBcXjsWUGrKivQQAgAOD0oCABQ7T0IABNwoAgABcoTCAAJM4gIAPnzag
Date: Mon, 18 Nov 2024 12:46:43 +0000
Message-ID:
 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
In-Reply-To: <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TY0PR06MB5031:EE_
x-ms-office365-filtering-correlation-id: c3be78e1-0434-4fb7-9133-08dd07cf0e83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3NJcHhJUDFJTmlXMThPbjNwQS9zdHdnYWtyY1piWVVKN3NtYytTRXc5eEkz?=
 =?utf-8?B?UHYxWE1FbWFyMHBQeThObHk1dGdoWlVScnVpdVRUR29LR3gxR2dqQ2NjTmVV?=
 =?utf-8?B?amQ4OFRqRlU4eXFRbmJpc2hWZWh5U0IySWFRc0dwNU5QbDJrb05CQlRrU3B1?=
 =?utf-8?B?MGJybU1SdUI1M3lWTzRpZ3VtR2tGWjNJOEEyUzBtdCtURHBKdWVmbEhZR3Yr?=
 =?utf-8?B?Q2Q5MnFuL1JtNWtuMmN1MlU2MisyMlFYWkpvLzJhQjM2cDA5Z3NKWUpUY1BD?=
 =?utf-8?B?VGl4a3hPYkhGeGg2cG5RcC90QUtlTnJ1WVlXZlFIWEtLQlNxNVNJL293d2oy?=
 =?utf-8?B?SXNIUW9Ydm9BZjMzQU50ZXZFeGtuQWxVVzNxbjVIbFcwYVpiamRNM2hEenV3?=
 =?utf-8?B?V2hET01sUjVSMEZFSkhYZk4yUS9SR1lkUEZDaUJGTnR5TGxvZjMrSG1aT29z?=
 =?utf-8?B?emV4bVhLRDBFTTJNdWdDQ2Z3OFdTbk5ROFZJYVJWVmxOQ0FjcWFzb004Sk83?=
 =?utf-8?B?OTNKUkNHWFRxQ2JEd1VCUVYzTis1VWl0YWs2a3FVOVh0V2g2dnFicFdKR2lX?=
 =?utf-8?B?Q3IzQTMvQ2F6UVlmS1FDLzhNNzdvVzlRVUU2YVgydTBJcDlmZnYwdnVqaGgy?=
 =?utf-8?B?QTdqeGxZVUhmbzRCVnBZMXdyMkFNOHlxczhUQnpmdEZsUWZsUlFtakNuQ3Vy?=
 =?utf-8?B?RllWNDBxN3VYY0xENERoRFdrVEwxUk9HblFWanpDUTZITThQUkxGZUJ2Q0dv?=
 =?utf-8?B?NFBVUDByYjFxZ2VxclNOQ0pIMnRQMGhWUGpGVVdSSDhHTUYzM3UyOXowWm14?=
 =?utf-8?B?UUk5RTBsYzZJSzFRQmFiWGd5a3BPeWJHSXpPa1dGV3pGU1pXSnJsQzcvMDBT?=
 =?utf-8?B?NGFqNWNpWnRkSitkY2RVTmhyaExiY1BFVUhiWlVLZzBXVmpmNEtPZXlIeUJI?=
 =?utf-8?B?TTJwUkhBZmt6cWhrSmloVW14V2d0enI3Z3E0T1NFMHlUNC8zUFFKTEdvb29R?=
 =?utf-8?B?U1VseXY3clZOS05xblQyUmJ2cWxEd2tsRDJJS1dsb0lVclZLMTBZL1FOZ1VC?=
 =?utf-8?B?VGtXSEMvUSsyVldNZFRNMzY4MDh0UmlqK3Q0RlRXMXZIMWJKOW53WWRxclVu?=
 =?utf-8?B?R0tmTnJJSzhSWHZDSXN4dTB5L1U4RVRrQ21mQlZnZ1RXLy81aFVnZFpmaFR0?=
 =?utf-8?B?SXloVUF6aFFYNmI0TnFkVDJJcEhZSjk1Skp5YWtaYnVNcWZpYWQzVjNKYVp2?=
 =?utf-8?B?aFRGT0hvNzBpMUNsdmFoK1RrZWI0UmRISStIcGhjcEIrMEJsSGtoYkk2K1p2?=
 =?utf-8?B?L3RETG9hcW1OaGFZUGtXSG9CdGcwUjdrQmdPNU1ZcWg3MnIxaWdPQ1RCd1NO?=
 =?utf-8?B?dXozOVlDdllYNjZCZW8zSW9mZXlRaXFpVXdKSlo4QVR4V3E2T2tkNGp4Z0ZX?=
 =?utf-8?B?c29mYkRacGRBMG9IaDVXaEZrZUNNbGVvdHk4RzVucVR5RTdZd2cwVmpEckhN?=
 =?utf-8?B?WW5IUnFhL1dJS2s4cEhNN1JjaEJNUm1PdFMvR1dVSjlMd21ES0F2QUN4TlFN?=
 =?utf-8?B?MHRGUG84Lzl0bXBoV01aRlcwTGRReWJoWlgrejZlYVppWUx1SDJtdkJHWlJu?=
 =?utf-8?B?UTNnSFM1Rnk4K1BUQzFRRlZMTXF5TUk4WC9WYmtlUHhEaUFUUnNHN3Mxc1cy?=
 =?utf-8?B?SjdLQlVtTHdPRGViK1RhZXdDNHd2bE1FTlJxT0J5ekFlK3BkTHd4VWhUUkE4?=
 =?utf-8?B?dnhsb2o5SlVrU3p4TlN6bkhvR1NHVFBmeDdQV0twU3QvQ29YMW5FdEExY0hL?=
 =?utf-8?Q?7dR6j2uTe4tnjtojeEUxs81h8wvn57UUzkawU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QitHeEN4bmJkNXpNM1M0SyswZlNxMDRBZ003Y2FzdGJtV3hNazdKRlFyb2k2?=
 =?utf-8?B?ZWwxWWtGSnRLT3JTZk5LWUoxSnVYLzVBTVAvanI2SWx0YnE3SEo3bEU3U1lw?=
 =?utf-8?B?VVhZZFhIbUlLM1gzQWl1RmdXdkxjaGh2Sll3WkR3K1hIc2xOZUk1OWlnbENS?=
 =?utf-8?B?VmRvY3dYOU5KOHZzVzE1MzlPYkVTbzNHVkE1SS9DN1hwSVdySk9NWlQ1clM5?=
 =?utf-8?B?YlJjeWxUaFBqYk8rb0w4ZmUzVkdDYjRyVmZUTUhGSzB3RWR3dnZWbnp3Mmo0?=
 =?utf-8?B?dWtOU1BacDdjU0JaTTlaeGVWQjdON1QzNVdxNHNpWnVQWEpTTEsvWDVHNEJ4?=
 =?utf-8?B?eXk0cG5FWHlZeXA1a2JjZWU1M0VOU0ZCV29FWTFOTEpVSHBsZ3RvY2NCN2pQ?=
 =?utf-8?B?NWhBTzJ6dUl3aEc4b3pqT2dnN244Y095bDdSWHhLbVUwV29uSldYS1RGOU91?=
 =?utf-8?B?U0hiWjNaU3Zab3U0Vk9lWVcyeVdDNUR0QzNtZlU2NkpmdFVac1hOcEgrb29R?=
 =?utf-8?B?bTJKcHNkY1BMUWF2enNtSy9IdVJHcmJoSzNBS3FhZ0V1Tys5bjl3bnprQ1Ju?=
 =?utf-8?B?ZjU3UWppL0d3Z2FOWDVwQkNoV01NV1ZSNC9oY0RUSStlVlo4andhbzkzZXE3?=
 =?utf-8?B?ZDc2bGlORHd6R2ViR3VyM3lNQ21JTTRpREl3MnZaZEFxR3VJdHFIblZDY09U?=
 =?utf-8?B?eUNDSURhUW00aFRDLy94akdwVHJnTFNQeFhGV2pYaUE4NnBFTVhQZ1UwWnRB?=
 =?utf-8?B?bFdOeHFYUU5GYlY1VFBkb3hWK0V6MmJFRS93V1BlU2t3bWJILzdhU3YzZW1L?=
 =?utf-8?B?b3BDS3pNM2ozcGxsTVBXUElWaFozeitrUHYvQm9BejFhOE9tY3RSRForekMy?=
 =?utf-8?B?cThndERUeXZ3R2ZGLytSU0htSW03dzJQQzUyYUNET3lSM01ZeDJFRldscVY5?=
 =?utf-8?B?UGVuWGptSjFhMFBESW1GR2FORFJXbDIrb2pvMHJKWElSdHBMU3RBWEVyMnJn?=
 =?utf-8?B?VVdGbXJmSlVTSGJtL3RsNllzbXJ0WmluSEFJUVQwOHlKbnUvZm1TMlNCR0pV?=
 =?utf-8?B?bmlTWTJORWJBMXFWSHNsL2Y5alAxbkQrRnVHMmI2NVkyNWI1RDNid0xydnJp?=
 =?utf-8?B?TzNNaDNIeitUSEZ2aG42a2oxR2dVVW01eE5ZWTU0d3B1Z2MwQ0g3d0s2c1VE?=
 =?utf-8?B?OVJNTjZ6bmpOOGJxTjB0eVBNZ09WTGtKQVprWUpKSmo2MWNiUGJJWmV4YXdV?=
 =?utf-8?B?akRnTEpwYkxPTFZDMkE1V0F1LzJhckxsamVSYmdUVjgxUTZWc1pnemkzSzgz?=
 =?utf-8?B?YmJNemxxMlJGYUlSWHkyc3JORE01WEdzbmZpaHYrMm5LazB0bXptbnR4NnFz?=
 =?utf-8?B?dWJKdG52aHJ4NWFBR09YNHVKUkUrQTdDN0NocUxXZU9qMnMvWkVDbXBtMXU3?=
 =?utf-8?B?RzhvdnphOW9STVpHSFo4dzliQnBqUDUreUhoT244QURjN3N4dVR6bmtrRkJm?=
 =?utf-8?B?aHNvLzNzL1JteEFsUjdRck8rQWNEQjdEVTRsUXQ3dkxSQkhucElTMFhUVU9v?=
 =?utf-8?B?b2hsRXorUGVhaU1Sc1BTL0hWV2tBNm9mcHJnempaZVFSK1hrT09hR2lwTHlv?=
 =?utf-8?B?SU9yMkl5TDhDNmxBMHpJektXT3VWZWlUZXFnb2s0eDdMdklWRStoeTkvaXNC?=
 =?utf-8?B?a3hITUpqSWE4MEh6VXc2b2N3dHRkSFhwOGxmOXRRQTdZbjNxbWNELzgrcjJk?=
 =?utf-8?B?WW55azB3T0t3eXZ2WlhUTHdBWll1M2NuNHpjMmJXcENCaEY0MEhrTkNJYU03?=
 =?utf-8?B?b0VoWm1aQW5iNjRHNVk3b1lPMVplSDNyR0J6TTdNeTdCbjFCV2s4Rjl4aEp0?=
 =?utf-8?B?TG9LRDRuNVlWLytBUk5ZOEc0NXJnTm52Q3BBQ2wxVGpGUVN6NGJCS2xZK0ZD?=
 =?utf-8?B?U3I1NnZmbFV0V0FPNUI3UHE4MlNzT3hwTHU0YVpaN293MEQrdmlsM3dFMXhS?=
 =?utf-8?B?QTVQUisycFRoQTJoR0hpR1l3OUZsWDk1VXdramtmOWl3UkVRV2JPdXcxL2FY?=
 =?utf-8?B?amFoeGZpdi9Rc3N3TWZzckcwamNYbm1aL0ZaS25uS2Fwc3pKWm5aOW0yVm9O?=
 =?utf-8?B?S3BJcnVXNlg0UktQUFArdWY3Zm1EZ2M2OGdqV240VDkzVWlMaHJFUmRpUU9Y?=
 =?utf-8?B?K1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c3be78e1-0434-4fb7-9133-08dd07cf0e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 12:46:43.9587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9CoE3W4BSVH922TNElFqbY7y9G1YqjUSYZi9Rv1paNscvMajprsNXcIIdrmvnqM827viulgSn7dlcCWkFFZL8JhrL8rpebLbEITG54/AGig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5031

SGkgR3VlbnRlciwNCg0KVGhhbmtzIGZvciB0aGUgcmVwbHkuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+IE9u
IEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgOCwgMjAy
NCAxMDowOCBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvM10gd2F0Y2hkb2c6IGFzcGVl
ZDogVXBkYXRlIGJvb3RzdGF0dXMgaGFuZGxpbmcNCj4gDQo+IE9uIDExLzcvMjQgMjE6NDIsIENo
aW4tVGluZyBLdW8gd3JvdGU6DQo+IA0KPiA+IEJ1dCBub3csIEkgdGhpbmsgaXQgd2lsbCBiZSBi
ZXR0ZXIgdG8gYWRkIGEgcGF0Y2ggZm9yIGNyZWF0aW5nIGEgbmV3DQo+ID4gcmVzZXQgcmVhc29u
LCBlLmcuLCBXRElPRl9SRUJPT1Qgb3IgV0RJT0ZfUkVTVEFSVCwgaW4gd2F0Y2hkb2cuaCBvZg0K
PiA+IHVhcGkuIENhbiBJIGluY2x1ZGUgdGhpcyBjaGFuZ2UsIGNyZWF0aW5nIGEgbmV3IHJlc2V0
IHJlYXNvbiwgaW4gdGhpcw0KPiA+IHBhdGNoIHNlcmllcz8gT3IsIHNob3VsZCBJIGNyZWF0ZSBh
biBleHRyYSBuZXcgcGF0Y2ggc2VyaWVzIGZvciB0aGlzDQo+ID4gcHVycG9zZT8NCj4gPg0KPiAN
Cj4gVGhpcyBpcyBhIFVBUEkgY2hhbmdlLiBUaGF0IGlzIGEgbWFqb3IgY2hhbmdlLiBJdCBuZWVk
cyB0byBiZSBkaXNjdXNzZWQNCj4gc2VwYXJhdGVseSwgb24gaXRzIG93biwgYW5kIGNhbiBub3Qg
YmUgc25lYWtlZCBpbiBsaWtlIHRoaXMuDQo+IA0KDQpBZ3JlZS4gSG93ZXZlciwgaG93IHRvIHRy
aWdnZXIgdGhpcyBkaXNjdXNzaW9uPyBDYW4gSSBqdXN0IHNlbmQgYSBuZXcNCnBhdGNoIHNlcGFy
YXRlbHkgd2l0aCBvbmx5IHRoaXMgVUFQSSBtb2RpZmljYXRpb24/IFRoaXMgaXMgdGhlIGZpcnN0
IHRpbWUNCkkgY2hhbmdlIHN1Y2ggY29tbW9uIHNvdXJjZSBjb2RlLg0KDQo+IEd1ZW50ZXINCg0K
Q2hpbi1UaW5nDQo=

