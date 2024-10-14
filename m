Return-Path: <linux-watchdog+bounces-2202-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8E99BD98
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 04:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E796D281409
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 02:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCD9200A0;
	Mon, 14 Oct 2024 02:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="qsb09PND"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2125.outbound.protection.outlook.com [40.107.255.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208A1BC2A;
	Mon, 14 Oct 2024 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728871673; cv=fail; b=gkk7AkhazcpMJ0DyRkwT7bwTpy5NI7hHIw/QfZExSx9q8Yf1RCXOomzoFQXSqPksKnIT7MjqSKW+2XYTd3Ud3Ul3AG3IdHEDVjTbmHN2aEv8j6jHPIp8Wf1yszK+uFoO+f/EkfzvSQ2qeGDgDy4ij/WzBxVKCpOLeRwDB27t7sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728871673; c=relaxed/simple;
	bh=bABYMirw3ECz3eNmuDhgaz1FN4gzPCK/gxn/UPk/9tI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QtFe7/FQTISHwmuHE3XCRqKGahIAcBNQYd6c4XDHeDZpCj5FSMPqN1TK+hrkDilINk662Qrryru4654DNSzb+IKvXYiBWZnE+iU1iKgaRPGc8yNN58y4cRM0ST2mv+4ti0pPYmst4ND+XhCQGe0fOTFlnOwq4wpEuVd4wSnCbWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=qsb09PND; arc=fail smtp.client-ip=40.107.255.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTxDQVBXzuLRuT3LKamgTCxPCCmrcMq0VRyg1exh+zDiNdDS0rIoH0UQ+Ey2ZiTn5C96U+eQ+GIeprjfNGOkdIjLKI+RbtXOtomoE8/2895N8CNU7/QnJF1b4YX3NQKAqDGyL5A5HmiswVFZMtXRa/vDnGbBS8QbTs/RIu01IFLZb2GUBUZhinM7t0smaYmw7+EzwcqrXRbU++jS0SPJ5CrTibJiVa4AFkJwkkXnTtMaKbVv+k2CXZZ/M6kK8RymeopK5LM3L9mlQ6pZv32mLHwkOBJouBO4oQkt005BaMdwX8Hrc1Nwepy1SW/HVRePxcuWEKi2J3Se0Q5gh0lx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bABYMirw3ECz3eNmuDhgaz1FN4gzPCK/gxn/UPk/9tI=;
 b=ZIqhaTnZX1r0eHRIouitFGOavtR387u6fzBDZm5LYkeWNoEbhpJD4Kr2la5VjQILjn67X4hb6VQu0tAQpRryh73zYv5Us152hOl1TbJPGlhvJA0Du1jPUDmukwYwOAb+yL2wW4Uh8zyWuNk+OgvK35OrDCevJXJX85xLFPpH+Bzv8pHxeOAypfOrSVb0pDBNVIEOgvhoew+B5ezXjwy0PCJDu8JfaWuZ1eEMUMMFCKH6XTri2yY/RQAR1vOjoOMuWJq9zktkY2ItnfDQRU3/LZQXEGRgvRAuLE+4tKiXJPlXp7GoD2MX6j9xEIxYx/Z7aP6gpacFEy2y4c021E7zTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bABYMirw3ECz3eNmuDhgaz1FN4gzPCK/gxn/UPk/9tI=;
 b=qsb09PNDb4W9PML3WhKSfuo7ub8h7qJ50ep5rmhXY0svicWQoxyvNlD0BS1PWIKtPQyDxW6FUMDwHjmzNjmu92XJ+6u1gofSVPwZ9RlSIty0jmtDzxBoY0wh26GkiEYeMGEtoJJGUTisMk0fZ4M/sFl2rMUlGTU0RlqQw+BHsY9kFXT4zd3KjQi2AJdyb87gMbWxlvMBOz0PyaNMwB7vR0c+bl0D0VMIadWGhjczrQFx6FaIGFeV07QncVbYEMqkkql9fCtoiD/PhQ2xv1FVMx1nVNWsznXSkAb+rgtSN6Z+wq6jCyCDJiFX/+Ubys6Dh8T38TkQrUgyFfdEPECwlg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TYZPR06MB6356.apcprd06.prod.outlook.com (2603:1096:400:41b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.13; Mon, 14 Oct
 2024 02:07:46 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8069.009; Mon, 14 Oct 2024
 02:07:45 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "patrick@stwcx.xyz"
	<patrick@stwcx.xyz>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
	"Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
	"Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>, "DELPHINE_CHIU@wiwynn.com"
	<DELPHINE_CHIU@wiwynn.com>, BMC-SW <BMC-SW@aspeedtech.com>, Aaron Lee
	<aaron_lee@aspeedtech.com>
Subject: RE: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Thread-Topic: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Thread-Index: AQHbGILwQgrDNDHU9U+K+QITBzViybJ625kAgAqiwiA=
Date: Mon, 14 Oct 2024 02:07:45 +0000
Message-ID:
 <TYZPR06MB5203B274C68C34FD478EA162B2442@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
 <6bb599b4-141c-43a5-8b9f-4cf6ca6c3384@kernel.org>
In-Reply-To: <6bb599b4-141c-43a5-8b9f-4cf6ca6c3384@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TYZPR06MB6356:EE_
x-ms-office365-filtering-correlation-id: 7ec3cc00-28dd-4d1b-c59e-08dcebf4feb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?UnMzQldMdEYrT2hydmc3VzFpekl4STkrcnhIVVBVaisxQlBiZVd5RUNtV0Nq?=
 =?utf-8?B?c003azdnSDBzUUJBamVQWExON04vRzdxZjFOZEpZNllodTJmMVY2bi85M0xy?=
 =?utf-8?B?ZHlpR282NU8xSTRDeThlNWxPSjRtRW9uYk5veHRhUFBobkREb1ZvNVpZOUNu?=
 =?utf-8?B?VS9SVWZSenpidUxVQkpDTzJFWDRxMnhsM2pQZGZPZkYvQ3R1VkJLUVd5dGNB?=
 =?utf-8?B?cFRRaW5SQVNaNVVsRTRSMXZ5K1ZyeXRGVlhURkJSU3o4dGUrYk5GSGVUWDBp?=
 =?utf-8?B?T2kxZGZlTE50QTMxZ05YVEgwZ2s0L2tqSkJuQ3puMDlIUHpVKzBVdlBKWmlK?=
 =?utf-8?B?YVA2YlVWWTZUVDQxeFVBSUgwV3JyTEl0YlVjV043UzJJMHFoZHY2ek1IZlR2?=
 =?utf-8?B?RVhsdE5sc1Bhdk1Heks0ckIwenMvdWR2MmQvWFAwSHRtRjRhbDlaSUN5UzJ0?=
 =?utf-8?B?UkEyb0E2ZDNZbEhGWkVsUHM3UThTSEl0WmVCdHp2MTdWYVV4L2o2RFZkWHJO?=
 =?utf-8?B?VG9wd1VRWU1wejlCVHNsTVlnZVFVRy81WnYrMTk5UFFRR3diNWVIT2tGNXFa?=
 =?utf-8?B?UHE0cXY0QlRjMTZ1eHpwNzdrZ1E5aVArMHhudWVHSzB1LzVkc1U5eU5DZXFm?=
 =?utf-8?B?UzB1TDB6cXBYVG54ZlFqRmswQVNNcm9NNXBHa2gwQWRENGxIRDRaVVk3TExO?=
 =?utf-8?B?L1VHTVN0MDczQXZSbHQ0bEFMdVM2UlVmYmluK2pWZ1dFSmdCUThNYnZFVTg5?=
 =?utf-8?B?VDZOdUw1cno5RXVtM1U3TlArU0hmR2NTVm1ZRFpESkpRaDQ1Zms4Y1VQd1dL?=
 =?utf-8?B?T25ucGIvQ2d6SVF3bEE3L3lRY29EcjQ2TWF4N1NtQVowY1NRNW5mMzJ3RzJz?=
 =?utf-8?B?L1l4WFJKb3hLUE0rZ0twS2l2TmZoSUh1N2JTZ0lYQXl5dVdZMmZiUFg4UjV1?=
 =?utf-8?B?a0RTNDhubSs1SHNHS3JIM3N0V1ZPdDE1MUU3Q3M1dUYxcGpEZldKWVR1Vk9T?=
 =?utf-8?B?MWgvTnpiUGZrNk9iUklrUGNYOStwWDY1Rjg0eGMwNmFXOU9XZjdGZWwybVRk?=
 =?utf-8?B?d2JhOTlXbEFsRzJHQ3JQWXJPd1FoM1VsVnBVbDkwTWpJOWYwb2tTSmpKenZB?=
 =?utf-8?B?YWhHck9aQ3JSTzZEelgxV1pkR2V3amxXcWErVFFPNFo1OUdPbkVQNkQrU3VB?=
 =?utf-8?B?T2hhUDNIelU1TXBCdHNBT3luV3g2NCtVL283RFpWbmRiZ1FlSG9JcWNQQ2Fm?=
 =?utf-8?B?bXZhQnZSVGJHMVVtVGhCTmVKNUF1cmtlZjlPS2Z4Q3lEdEZBK0lLdUM4a3Vm?=
 =?utf-8?B?QUtFZDNxaE84N2pwOTMzVDdNQnY3SWNFbW9vQUg2Tk5aS1hqSlRWYStHajBa?=
 =?utf-8?B?QS9GTXU5cHNhU1U2cVMycENuSGx4Vjh2VVE3THRPRlZCbmw1NWc0OHlVcFB5?=
 =?utf-8?B?VFgrY1NNUWhOTVgrUTlMVE1pRnZ0OUxpcTRVd2tMcnhyYTJVMTg4eXFzVUR5?=
 =?utf-8?B?VGMzdno2ai9QQStKQzh5L1Q0ZSt3VDdRcGxIQ2JTQ1F6TVRGU21zdE50c1dL?=
 =?utf-8?B?Sml4Y055UWpYR2ptQ1A3U1k1YnlzK2VQTWpxa1JrQXVINnBpSGhIT3JRd09k?=
 =?utf-8?B?eko0MnB2Q3BqRjlacTlnQmNtMU5Nd2UvcTljVkpQUTJoM1BYdi9aWjhyRitO?=
 =?utf-8?B?V1RxYzU1ekhDdUZJRUJTUVpnS3ZIUkk1N0ZHS2EvVUhFRHc0Qi9Sb3RHa3BT?=
 =?utf-8?B?L0hMeDVPK0djYUVEcjdoam1sL1IyN1U0amFUREtoYkw3UjN3TXZrQmI2eUNB?=
 =?utf-8?Q?WXHSjoJkb3LzYxgAyRfx1cvF5tfhGcs7X/jLE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzNobjdGUFFERld3WVU2elo3SUd1WjhKQWN5ZEg3QkgzeFR0TUFUYW5yWUtL?=
 =?utf-8?B?L20wU0tBb2pMZTVNSUp0VU9JdlFVRVRHV1V1L3NqWU9mcmJxSGFuWUcvb2FL?=
 =?utf-8?B?TzE1L1BtdWM1d3NXSnRRZWtUT1FZSEpJVHJWRElJRHVnNUsyemRyMjhWVUJK?=
 =?utf-8?B?YUZ0Zm9aQm5uR2xmOEllcTN5L1ptUDlxSFRCQlIwcWxUWHdRNTlGMzQxaUhZ?=
 =?utf-8?B?Sm00dG9ldXRZUFIrdHNxdUwweGUxa3lVcytFK2hZQ0RXV3VQZXZ5cXRCZHZC?=
 =?utf-8?B?OGdGclFVN2NyRVd2b2gza1BVdHdrWWFwWW14d0lLbGxLNmtOTTZxaVp6RGVn?=
 =?utf-8?B?TmxEUll4QXlIUUt5QWY4ZHVlQnIrS2UvU1BwdllKR2tSd3ZoZ01xTUFnc09W?=
 =?utf-8?B?WkFUS1VSVWhYaDZ6NUN5bzUzMmZUQkxncXNnakdJRmIrbFhxM295Sm9UeXRZ?=
 =?utf-8?B?WC82S2NTSEZ4Y2FObWRISmZnWkFHdkNDUEVTV3MvNWdzcWlLc1MvaUNtaWdR?=
 =?utf-8?B?aG0veU05Q3psd2ZHUzlTVVVTSlppY1N3WUUzUk55TjlNdmxiMWZZdVBDRE9D?=
 =?utf-8?B?a1hOVXR6Qno3WEpMZkVuaTVUc1NGQmFiMnJPclNvQjMwTWNwdlhrM0RJZEN1?=
 =?utf-8?B?VEZ3Q29mS214aU53dGttVC9oZ2I4Z0J3dzRZQUtmKzV1cVJEMXIyb0IrbElF?=
 =?utf-8?B?QlQwb0NuZ2JXemlHRWJrNWpPYUZEdis4TTQxMUhqb0dhSVl6R2tuMUQwMndN?=
 =?utf-8?B?RXRmajNRdTV5Q1VQeW9oZTFTUEErRURnRHNPbWdlMDFZYkdZaVpibS9KWTlV?=
 =?utf-8?B?ZXNXNS9PSGMyTEdMQlRCUUJtdkFOdk5kbUF2UlhuZDJBL0ZEN3QwN01vaGRZ?=
 =?utf-8?B?bzcwaHlEelFsQUs0ZEpwTFZseXVIWkxXL2U2ZGNSclIrbVUyOWpPVkR3Tlly?=
 =?utf-8?B?WDRHdzlSZjBOZVBkc0xLRk1FbkNidGpmTHY1QXJ3c3R6OS9sY1BVY2tiNDE3?=
 =?utf-8?B?dlk0WDVrN3pDQ2xKcEIvL0Rnd2lPaXlKcXZKNXIyRnMrNjFsc254R001RTlK?=
 =?utf-8?B?ajhyTGk5SzBqL3NCZkVJUHcyZEJnbmFJeVhRd0x1YlhZQjZqZkRqVnJoZ2Zl?=
 =?utf-8?B?NXB6M1J6QW94SUJsbWpZOXpMdWIrdllvcUZqT1h0NHJqZ2tVZUpQOVlvVHNi?=
 =?utf-8?B?eEwyV28zY09wQ3FZZTJuZHlSalo0VEtvZTMrS0VkM1JFMnpjUlZ3UnpTTkZ6?=
 =?utf-8?B?WnU4ZW1hZXg4RmxLaFpJWVkvN0VDeEE3UDhEUUVnL1hWNzZFeVpoMTlTNjcr?=
 =?utf-8?B?cDZpOWN4Mngrczl5VlJ2cFhQeHYxZVBzQnBuOTlzMEs0RFdiSjRxVmM1cVJK?=
 =?utf-8?B?SXhEMDB1MG5QTnduNjZGUTdUbnYyY1lTWDh4U1lEUlI3Z3VYVThjRWgybDZH?=
 =?utf-8?B?TzU3N3VvcDZUeVkyT1FBQWpsMjZnUkw4U0xaeGRSN2lEUGNlTnB5QzJrdThJ?=
 =?utf-8?B?Qi9iZm9HeDNSeEJnNTVqeW44UUxQR3AxY0RTd3NYb0xwZUEvNTNQV0RMUmNU?=
 =?utf-8?B?U2k5RG0xNXp4THlLTGg4Ym5ITFBTVWxHVEtzUXdEcjZJTjRhRE5Cd3JnUkhG?=
 =?utf-8?B?M203UXZXbEQ1bUsxeFgrU1RLZC95em5Ra1ZLMzFyRE9UbTV1T0pKeGdPV1Fu?=
 =?utf-8?B?YjZNVTlNVDZlR2NVTXU5WjJ4ZklRdlk0TGpCam1VN2xWTm1MNVBsNVE2Qk9s?=
 =?utf-8?B?ZlR4aytEK0JPV25Zc1dxR25XNzVHRlZOZ2tDa3QySTI4MytJaEs3QTFwbENv?=
 =?utf-8?B?Q2NtdnpSTWZEdncxZlFpNG55ZE8xTktBbG5Ed3VGdnhqRmtURytNc0Q4dkNN?=
 =?utf-8?B?djJ6dC9NOTJWOTYxZ3I3U2l1Y2xBd3paUlp1UG1zcTdTY1kzWTdRTEFFVXM3?=
 =?utf-8?B?cHpNeVo1RTFzRklkRkIrdWk0K1luMmg2TlYzKzBhOFZRMlZkSG9POURsclpX?=
 =?utf-8?B?akluMlpIK3pyVFIvazMvV1BVR252TEpkd1pZRUtkWHo3NlNzQUJZbUZDOGs3?=
 =?utf-8?B?NjZHdi9sN0tzS3dhaElZdExyeElySWxMbjNEUUxPQklpaUU2dmxwamQ5Snlw?=
 =?utf-8?B?UjJkd1FWNC9tKzY5ZnNKU1hRaXRtaHltL2o1Qk42ZTN6UTg0bEpHS3BpdGFM?=
 =?utf-8?B?cHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec3cc00-28dd-4d1b-c59e-08dcebf4feb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 02:07:45.7574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NpTBzJbilfVyzxUpuYI5rsOYWiMVzUUzemlLEXRIICIS/UKhJ++p21sL3F1Q+OtDgrbivckymMvMlVbqGoHNvADo+K58qhAwDlG7OiIJLUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6356

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwu
b3JnPg0KPiBTZW50OiBNb25kYXksIE9jdG9iZXIgNywgMjAyNCAyOjU4IFBNDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMS80XSBkdC1iaW5kaW5nczogd2F0Y2hkb2c6IGFzcGVlZDogQWRkIHByb3Bl
cnR5IGZvciBXRFQNCj4gU1cgcmVzZXQNCj4gDQo+IE9uIDA3LzEwLzIwMjQgMDg6MzQsIENoaW4t
VGluZyBLdW8gd3JvdGU6DQo+ID4gQWRkICJhc3BlZWQscmVzdGFydC1zdyIgcHJvcGVydHkgdG8g
ZGlzdGluZ3Vpc2ggbm9ybWFsIFdEVCByZXNldCBmcm9tDQo+ID4gc3lzdGVtIHJlc3RhcnQgdHJp
Z2dlcmVkIGJ5IFNXIGNvbnNjaW91c2x5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hpbi1U
aW5nIEt1byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4u
L2JpbmRpbmdzL3dhdGNoZG9nL2FzcGVlZCxhc3QyNDAwLXdkdC55YW1sICAgICAgICAgfCAxMQ0K
PiArKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3dhdGNoZG9nL2FzcGVlZCxhc3QyNDAwLXdkdC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvYXNwZWVkLGFzdDI0MDAtd2R0LnlhbWwNCj4gPiBp
bmRleCBiZTc4YTk4NjU1ODQuLjZjYzM2MDRjMjk1YSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9hc3BlZWQsYXN0MjQwMC13
ZHQueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRj
aGRvZy9hc3BlZWQsYXN0MjQwMC13ZHQueWENCj4gPiArKysgbWwNCj4gPiBAQCAtOTUsNiArOTUs
MTcgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgYXJyYXkgd2l0aCB0aGUgZmlyc3Qgd29yZCBk
ZWZpbmVkIHVzaW5nIHRoZSBBU1QyNjAwX1dEVF9SRVNFVDFfKg0KPiBtYWNyb3MsDQo+ID4gICAg
ICAgIGFuZCB0aGUgc2Vjb25kIHdvcmQgZGVmaW5lZCB1c2luZyB0aGUgQVNUMjYwMF9XRFRfUkVT
RVQyXyoNCj4gbWFjcm9zLg0KPiA+DQo+ID4gKyAgYXNwZWVkLHJlc3RhcnQtc3c6DQo+ID4gKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnDQo+ID4gKyAgICBk
ZXNjcmlwdGlvbjogPg0KPiANCj4gV2h5ID4/DQo+IA0KDQoiPiIgd2lsbCBiZSByZW1vdmVkIGlu
IHRoZSBuZXh0IHBhdGNoIHNlcmllcyBhbmQgdGhlIGRlc2NyaXB0aW9uIGNvbnRlbnQgd2lsbCBi
ZQ0KY29uY2F0ZW5hdGVkIGFmdGVyIHRoZSBjb2xvbiwgIjoiLg0KDQo+ID4gKyAgICAgIE5vcm1h
bGx5LCBBU1BFRUQgV0RUIHJlc2V0IG1heSBvY2N1ciB3aGVuIHN5c3RlbSBoYW5ncyBvcg0KPiBy
ZWJvb3QNCj4gPiArICAgICAgdHJpZ2dlcmVkIGJ5IFNXIGNvbnNjaW91c2x5LiBIb3dldmVyLCBz
eXN0ZW0gZG9lc24ndCBrbm93IHdoZXRoZXINCj4gdGhlDQo+ID4gKyAgICAgIHJlc3RhcnQgaXMg
dHJpZ2dlcmVkIGJ5IFNXIGNvbnNjaW91c2x5IHNpbmNlIHRoZSByZXNldCBldmVudCBmbGFnIGlz
DQo+ID4gKyAgICAgIHRoZSBzYW1lIGFzIG5vcm1hbCBXRFQgdGltZW91dCByZXNldC4gV2l0aCB0
aGlzIHByb3BlcnR5LCBTVw0KPiA+ICsgY2FuDQo+IA0KPiBTbyBEVFMgaGFzIHRoaXMgcHJvcGVy
dHkgYW5kIHdhdGNoZG9nIGJpdGVzICh0aW1lb3V0KSBidXQgeW91IHdpbGwgaWdub3JlIGl0DQo+
IGFuZCBjbGFpbSB0aGF0IGl0IHdhcyBzb2Z0d2FyZSBjaG9pY2U/DQo+IA0KDQpOby4gTm9ybWFs
bHksIHdoZW4gV0RUIGlzIGVuYWJsZWQsIGEgY291bnRlciBpcyBhbHNvIGJlIGVuYWJsZWQuIFdo
ZW4gdGhlIGNvdW50ZXINCmlzIGVxdWFsIHRvIGFuIGV4cGVjdGVkIHZhbHVlLCB0aW1lb3V0IGV2
ZW50IG9jY3Vycy4gQVNUMjYwMCBoYXJkd2FyZSBzdXBwb3J0cyBhIFNXDQptb2RlLCB3aGVuIGEg
bWFnaWMgbnVtYmVyIGlzIGZpbGxlZCBpbnRvIGEgc3BlY2lmaWMgcmVnaXN0ZXIsIFdEVCByZXNl
dCBpcyB0cmlnZ2VyZWQNCmltbWVkaWF0ZWx5IHdpdGhvdXQgY29udHJvbGxpbmcgdGhlIGNvdW50
ZXIgYW5kIHRoZSBjb3VudGVyIGlzIG5vdCBjb3VudGVkLg0KVGh1cywgV0RUIHRpbWVvdXQgZG9l
c24ndCBvY2N1ci4NCg0KPiBUaGlzIGRvZXMgbm90IG1ha2UgbXVjaCBzZW5zZSB0byBtZSwgYXQg
bGVhc3QgYmFzZWQgb24gdGhpcyBleHBsYW5hdGlvbg0KPiANCj4gPiArICAgICAgcmVzdGFydCB0
aGUgc3lzdGVtIGltbWVkaWF0ZWx5IGFuZCBkaXJlY3RseSB3aXRob3V0IHdhaXQgZm9yIFdEVA0K
PiA+ICsgICAgICB0aW1lb3V0IG9jY3Vycy4gVGhlIHJlc2V0IGV2ZW50IGZsYWcgaXMgYWxzbyBk
aWZmZXJlbnQgZnJvbSB0aGUNCj4gbm9ybWFsDQo+ID4gKyAgICAgIFdEVCByZXNldC4gVGhpcyBw
cm9wZXJ0eSBpcyBvbmx5IHN1cHBvcnRlZCBzaW5jZSBBU1QyNjAwIHBsYXRmb3JtLg0KPiANCj4g
U3VwcG9ydGVkIGFzIGRyaXZlcnM/IEhvdyBpcyB0aGlzIHJlbGF0ZWQ/IE9yIHlvdSBtZWFuIGhh
cmR3YXJlPyBUaGVuDQo+IHByb3BlcnR5IHNob3VsZCBiZSByZXN0cmljdGVkIHRoZXJlLg0KPiAN
Cg0KSXQgaXMgYSBoYXJkd2FyZSBzdXBwb3J0ZWQgZnVuY3Rpb24gb24gQVNUMjYwMC4gRm9yIHBs
YXRmb3JtIGNvbXBhdGliaWxpdHksIHdpdGhvdXQNCnRoaXMgcHJvcGVydHksIGFsbCBiZWhhdmlv
cnMgYXJlIHRoZSBzYW1lIGFzIHRoZSBwcmV2aW91cyBnZW5lcmF0aW9uIHBsYXRmb3JtLCBBU1Qy
NTAwLg0KDQpUaGlzIHByb3BlcnR5IG1heSBiZSByZW1vdmVkIGluIHRoZSBuZXh0IHBhdGNoIHNl
cmllcyB3aXRoIHJlZmVycmluZyB0byBSb2Igc3VnZ2VzdGlvbg0KaW4gdGhlIG90aGVyIHJlcGx5
LiBBZnRlciBjaGVja2luZyB3aXRoIHRoZSBtYWpvciB1c2VycywgaXQgaXMgZmVhc2libGUgdG8g
cmVtb3ZlIHRoaXMNCnByb3BlcnR5IGFuZCB1c2luZyBTVyByZXNldCBieSBkZWZhdWx0IHdoZW4g
dGhlIHJlc3RhcnQgb3BlcmF0aW9uIGlzIHRyaWdnZXJlZCBieSBTVw0KZGVsaWJlcmF0ZWx5IG9u
IEFTVDI2MDAgcGxhdGZvcm0uDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KQmVz
dCBXaXNoZXMsDQpDaGluLVRpbmcNCg==

