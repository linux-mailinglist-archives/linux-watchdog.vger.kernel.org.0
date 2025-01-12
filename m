Return-Path: <linux-watchdog+bounces-2665-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DA2A0A777
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Jan 2025 08:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3511888CAD
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Jan 2025 07:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34B4148FF2;
	Sun, 12 Jan 2025 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="heHhG9TT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2112.outbound.protection.outlook.com [40.107.215.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4525763;
	Sun, 12 Jan 2025 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736667807; cv=fail; b=dD81KBRC5LRDwyI/3Dq+u7XpqR5f3cW3hOwXXTP0OxdNiIx0KI1ByJsCKlxThSyI2pvrV7R00jXqtmf89Yljpe5D6JkqqxSLdJ9SweLTK/3r7NMjP27CBSZEv8E5qzSBxIPdtbswERS3Vtxbft2Q+Z/Y7kdTgvIEh1HiY7E1RiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736667807; c=relaxed/simple;
	bh=dRaOg2OhnpTINfBvaMkDnY1QoCPeH0wX7V/l9Gu4Fu8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Le9hOdwlTL+2wa//rifM14HbTYI7R4969ZuK+IfmbH2X1Q9qqEqh/XyDsDKh8h1B4t7CgIUqheOEDcO7ZuepZnwM5QH5r0TsJovW2yj8wTDGZL2u1wcwjbyTF5jbguMEgfPSLz3jLrPMIDReZNFESnbAGcZ1A5hI4z2DHgUa6hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=heHhG9TT; arc=fail smtp.client-ip=40.107.215.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqdSi8ZzG80vmbLRANz2TYlAEmQCFVzHpqKPjp+fBSf6YCwntmOk9bWPUsRgHFiavLczoWj8BtBAU82+yf4kZLLN0Gz2mL4+KC+ZBKEe5jcT2eRoISiwHiWa09iF/gR9WOKdra6CQvUqusmrDxBXejzwX/nXQvib9H6Vx8pMQQiCSPDm6DMJBEY9VLxqOLXj2YvQa61s4UPVjrLDf/Q+WT46Q8YIAJWAYKUmtFmt5OlB1VqDP+dbKDkpSXpyFXamQ7+1+2sCmf8KPP+hCS6bk0FsWb73+uMUPgyfidgBR3SIbJ4/OUQ1kV67zx1rmTWO7vvYWMYa6ofoYbeLbDgW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRaOg2OhnpTINfBvaMkDnY1QoCPeH0wX7V/l9Gu4Fu8=;
 b=ORazsuekDhBu9YxdW7Q799EKvpE0/vAjYO+eHl9Od15HxeWsMEI6XHGH5mInj3XUaFcKuWeeYTls8GwsbLHPc9WyogYb9bqx318YAbvbv4VMOJ9Z6aLO2GjxLC/gb7LL9XELh55SKGNx3Vk4LV5lQI+urjpuxKMdIyMEnYvcEjFMPlkvZpUIKi15JnU+lbJI1p03FwtoiV1nv2+I21BqztE78RgF+D0JzT5SKPH62bDUAF0QZLtcQA1tBlpruHE2JrW0i5t6Mar88wyB8OAvD35PBawW94vslxIPjksbIvFTu+/f7pays5T28cX32pmDZn9QieRXVYGDOYg8xa2oow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRaOg2OhnpTINfBvaMkDnY1QoCPeH0wX7V/l9Gu4Fu8=;
 b=heHhG9TTiXk7t6Sm/2SC8EO+ezO41G+9i0C213CenxMVHaJ0i9LhV7ip7oOm7X+S5bBrk7G2mLR+AHH29lM55aHDDa1+JbIBidZcpd8bu+oLKfFpXgAFjj0MEXLPolKrYp1JoXnK9K2ZidcBTHezxuQ8zd/VAmji6Wqo8F3qo30LQ/Xji7jm6zD63F3ah7LGaOApjIfOdVpo2/itynDpdf0fwgZC3aVPdXDGdTRt4OXkni55pVSGs7VayuZqUpmUzn8+JYO+Nios/spSVSQUObg6baelrvk0IWmHmptQN9d3TK3BEcJcT57AhE9VhLDDWwWTFDqxieitWeXI1u6Rmg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SEZPR06MB5021.apcprd06.prod.outlook.com (2603:1096:101:4a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.6; Sun, 12 Jan
 2025 07:43:16 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%5]) with mapi id 15.20.8356.010; Sun, 12 Jan 2025
 07:43:16 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, "patrick@stwcx.xyz"
	<patrick@stwcx.xyz>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
	"Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>, BMC-SW
	<BMC-SW@aspeedtech.com>, "chnguyen@amperecomputing.com"
	<chnguyen@amperecomputing.com>, Aaron Lee <aaron_lee@aspeedtech.com>
Subject: RE: [PATCH v5 1/1] watchdog: aspeed: Update bootstatus handling
Thread-Topic: [PATCH v5 1/1] watchdog: aspeed: Update bootstatus handling
Thread-Index: AQHbXBr5kXEBndu370CHPkl6wvwsJ7MKrCiAgAgl6ZA=
Date: Sun, 12 Jan 2025 07:43:16 +0000
Message-ID:
 <TYZPR06MB5203E67A63085A477165DC7DB21E2@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20250101070116.2287171-1-chin-ting_kuo@aspeedtech.com>
 <20250101070116.2287171-2-chin-ting_kuo@aspeedtech.com>
 <80b400b5-0dec-4643-9503-a21a35af5bcb@roeck-us.net>
In-Reply-To: <80b400b5-0dec-4643-9503-a21a35af5bcb@roeck-us.net>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SEZPR06MB5021:EE_
x-ms-office365-filtering-correlation-id: 80b4175c-e2e3-4feb-0c43-08dd32dcc694
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QU13YWZ0a0dPNlUrM2JHdUJJY3ZielNOdHo2Wkt0dTBGSnBGODEyQWk1ek9w?=
 =?utf-8?B?SmxoRFNDZVl1NUhNeWY2UUp0WkdQUEZvc3lLSnNvTzFZU3RoQnZTK1lXSUtP?=
 =?utf-8?B?dXgvNDRoZDFhcTIveVVWd2c5ZVloMXhRK1EraXNvMUMvOVB1R1VxdTFwUzFV?=
 =?utf-8?B?MGNZUkpmcVdFdGRlUTFabnZjeHRkQjRNSTlFQnlQUk10SUxLazgwYU1FTmdq?=
 =?utf-8?B?MEdjV0lRMDloZWVZYzRnZFY2dEE3MGxZZXE4SEEvUE01ZVRJTHNZdndsVERs?=
 =?utf-8?B?NUJNZ0xlMzRsSXRDVTE0czgzbnBBVEFGRG5HU0ZJVFBIWC9Dbm4yRHZFcjBG?=
 =?utf-8?B?aFkybWJzZmZkZk1abi9UYzFHZWdpaU9PMG9MYXQ5UnhIVkI5bFFBSHVPR21I?=
 =?utf-8?B?Ykg4dEtDcUJuWk9ZeUNLR1czSjFwczVFQ3FpN2hiaVAyRTROUFg0Q0NCSWVH?=
 =?utf-8?B?dDZCamZWMHMxZG9LSk50TEVtbytuYldMR0srZStOS3pSS1Y5NlpjWUNCT3hD?=
 =?utf-8?B?bFVId0FpSkpVaTRsZTFtRlB3NFFLVGYxcWhnSVl6VFBxUElicDdWWjdsUUUz?=
 =?utf-8?B?cE8wdDg4ZkZpeEc2M09TckJia0JGdTUrSGtQS096ckliU0VFbzVTZENodVpF?=
 =?utf-8?B?bXd4K1lSU0hncmc5YWdQOUJmSll1TzlSSUFaRWFvcW84bXJVQ2RjeHRrMDhV?=
 =?utf-8?B?cGJ0YU9zT0k5Y2w4U3RHOWFWVWF0cjgvS2dzazhBQ2trUEFJaVd6bDA3YkxW?=
 =?utf-8?B?WFFwMEJzSUFpcFl6VkQ5Y0EzYUhlck05SC9NMzcyY2gvcU9LWjRSWlQ3eDEx?=
 =?utf-8?B?eWc3NXg3K0VWRkZSRlF2UW9hMXhhYVNIWTFrMWVWWkVPcFZLaW5TVno0NXNF?=
 =?utf-8?B?M2lBNllVazc1OFdyRjdzSk50bjlTbzlaaVhPTXFjVWt5eEsxRmNrZUpEbXRw?=
 =?utf-8?B?SzhrN0pWNkNLanRDQXg3SEdBbjNsSkgwMWVrUnB5UTZwUFVQZkhQU1N3RW1F?=
 =?utf-8?B?OWVqSHZ6K3dHSkRxZ1FRYVpaWnFxVW4zbktQZXZ4L0JvVkN4aXNyRmJ6RWVj?=
 =?utf-8?B?cWoxYzlPVXgvN1pBVHBpanRuUVlrMjVwMXYzc1ZBd24vWGwyVjBvV01NcjQ3?=
 =?utf-8?B?S2E5NUJsSkVPYU1wOUxzaWt5bmF1RUpMUVFoV0pnb0ZKTjVhTmpZbEZJajh0?=
 =?utf-8?B?bk8xOTBPbFFiZDVURVZmYTJlbGt1Z1ZCaG1CR21GZW0vY0tMU2M0OFcxNHJF?=
 =?utf-8?B?TUQ3dnBYa2JaMFA4ZDkzVnE5VkhVc0RVdVRDMU96YXFtUWZCQ0hHRnNPelhW?=
 =?utf-8?B?OHlBTEljZ3o4WG1EdkNsYlRUV1BVWWdraEhpQmdnMDZZZ1F3UW9xeXphTXVU?=
 =?utf-8?B?Tys5NDV3bkNFNXhvSFZ4NkZDK2tHWmhBcW8wK3Ixak9sVDNQalQvaTRUUUNR?=
 =?utf-8?B?bC95aHBVTUt0Rld6Rm1USHFlcjlxdjJLcGRJblBKYVNJYzlzaHpyTHhKTk94?=
 =?utf-8?B?NFlhakxROWN6THdRSXEwWXE4eWRNeDk2azNtRTBuUVFDOWxQeTUydnF4NjFW?=
 =?utf-8?B?aGhTbUIrL3Qzc01BY2M2RTIzSkVJL0JxTGFLd0twSjlFendMRlNrRXdLUEtS?=
 =?utf-8?B?anhWMDNQVnR2VjFSNFZDbVh0NHNkaVlSZW5YSTcxaGlOUUp4RjlTSGJZcGtp?=
 =?utf-8?B?NEh3Sm9uM1RuS3V2eVArU2lNUVVxdUNpY1oza1Bsb0ZvblJjK1R0endHZHEv?=
 =?utf-8?B?L00yTm1XSnllVGh2bDhtZW9XUG9Na1BZWXYwOTZkNlE4d1VhYTNKdi9IU0I4?=
 =?utf-8?B?d3pnU3c4TWVKb1NYZkorUzF6SlhTd0hZUWRJVVV4VzhhdVc3cjl2dXNuaW4y?=
 =?utf-8?B?dEEwVGd4cGtCQ3VwaGszdnYxRlg0d2pRYmM5NHpoVUtNM2NqUWhmYXgxTE1E?=
 =?utf-8?Q?BQarKmixia23BXF38D4k5PMEfNJkRvfc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3FHeDY3NTY5TWZrV1kvdWkvUTFkYzQ1VHFJU0QxNkwrcmo0OHYyS0hDNUFZ?=
 =?utf-8?B?SUJnTXhuVWZRRzZvQXdKMmx6SDFKQzJONXNRWmZSWUZTSzIrVHBrMGN0c01R?=
 =?utf-8?B?NXdtMDMyWisvdU1nWUpVVS8wTjVvaitRZUorbGM2NitxN2ZjSnB5UzdGdmVQ?=
 =?utf-8?B?VUlybFU1Mmx1SUFjVlR1ZE5UQmhEMGxsWldOaUtkbEJEYzZ1K0dlNzl5ZDN1?=
 =?utf-8?B?L01KRTBmL3F2SExKZHdBZXpMcUNDVll3dlMxUnMvbG44RDFvUHpzWmFkQmF2?=
 =?utf-8?B?ZUE4WDU4b005VTNYU3YyRngrbG9aYU94T1czZ1J4dnJVaHNQVVBvaGRYMVBv?=
 =?utf-8?B?SzNUc3hlOXg0Nks5STJxaUllUDJ4Zk9PYVJjanorU0hpMUtTWU8xdUdNRm9D?=
 =?utf-8?B?MC9vMGRBa0J3aDIwMWs1ZWlCd2hGZ2JVRjZNbVJ3Y3AzU2UvaGtaVHpWejhP?=
 =?utf-8?B?NnVCcWo2cVFTWE0vMFV3SE5VdEJoZ1duODlNSDlhL0xkRUpKL2w1N0tVVHox?=
 =?utf-8?B?azZOZDlMT0Q1a0hCMFJ4U1NBTnBJOHV5TFZrcHlNczRUMzZBWUVqRk5wYnln?=
 =?utf-8?B?Y2xZdTNHZmQxeGdZL2tLbWwyeUp5a2s4U0V2L0R5bEJicEhoK3VmRUhkYXF4?=
 =?utf-8?B?dFI1K3I5dXlyeXBvMnNVVFZYRERGSTJacVNTWDFJRHlwT1ZIL095M3pmTy9v?=
 =?utf-8?B?TWZUZmxZZDIvNkVaSU1ZdjZDMDNCZWM5SGFidWFwR3QyZlNkVzdQcVk5V0RK?=
 =?utf-8?B?czlMdnJUaXdEbkJyM3Nia1NtVjE0dnFXbk1ISWFOWHF5ZE5xNHlMTWNZNERs?=
 =?utf-8?B?NG04dXJtdXZBMzloOVZ0am5JRm0vT1BnOUJLQlhFcGM3N0RJVzlhWFdIMEFO?=
 =?utf-8?B?RUtRbVVzSUpWWFdaNFFrUTBXM0RBZXh2RjFqZ0t2KzliNHFjSm9hUmRnS2FX?=
 =?utf-8?B?RFdoQkNVREMwSFN0QzFFK1NqMHB5MWh0VW9GN2E1VFNFOFNua2Y2aHgrS3Z5?=
 =?utf-8?B?bVJZc3U1a0pQdkRXWTdlV2djM3l3VnNxSnBLa3Yvek1ieXp3RnpVNzJzWkVr?=
 =?utf-8?B?UXJxOVJBZFBaL0NKUzlFWXlPcUxvVEp2L1JoOG1vdlI3K0ZndURUcjljeHk1?=
 =?utf-8?B?K2YrNlVGMTRMeUZjOEdJNVZLWUlwd1BYQVR4VzROR2xnQi9UbFRQaFhwdENK?=
 =?utf-8?B?ekswZ01ndWNrNUZ3UWE2aS90V0FMbGx1YU95VVhrMmxNYUhRTUVHZTc0Zkp6?=
 =?utf-8?B?dStIV0tzNFZJQUJ3WkpxZFp2bmNvamZSaGlYeWFDOFZjL1hjT20rYmZMWDdo?=
 =?utf-8?B?cTBPaXNLdUVLN1hVTC9FNURhS2o3TGV2bVNKNjF2Ri85SGhaRU0zRmZjck1z?=
 =?utf-8?B?djZOR1FPOXorVU1vMFBhNmY2ZURWYnh1OWNpTVBYeVFSOHFHeGE1c0tQd0ZH?=
 =?utf-8?B?UEkzdG5YRzE1NGlpQnYrR2o0VWRzWDVGS3ZGSlFQZmFETHIwNGRUVnhLdTVO?=
 =?utf-8?B?eENrTC9QY2R3bnVEeEN5ZHFaOGcxRlFXV29rdVFYYWgvSVJjZU1oeko3dW14?=
 =?utf-8?B?c2pGVFVOOU1ERy9pOE1FVUFNU2VFWjBHSEpQSEZvZjY3SzlXaFI0MDd3a2JW?=
 =?utf-8?B?Nm1Ea3hLMm43RGIyaXM5N0xBRzRkaDREZ2ZwT1lRTmhRU0JmUDVPbTc3aE1p?=
 =?utf-8?B?QzAvam1CMURWUk1WdUZWYW5RcU40cHU5WDZPYUZGbTc1Y2oxSHBLdStzc2JS?=
 =?utf-8?B?cHN6bE5jWjBJQVY4T085RklzYkRpRXducjR4dXJUS2tMQWsxVmZHU09VNmlx?=
 =?utf-8?B?NG90RnNWaFViWU5pNXpUVFRmSGUxZGc0dnE4aEZ5aUtBeGtIWHJLZk1na084?=
 =?utf-8?B?eWlHdm5lMlIyd0JuMXhJc1hybU9PQjVrbHI3ZlVLSERJQUZoekl4d3JYYTZX?=
 =?utf-8?B?WnFwMG9YTyszRkwwY2oySnR4NHRSZVpVQjJvcXhqbG81c0owalVGbHBSTG0v?=
 =?utf-8?B?a1o0U1NEYXE3WWMxeGIzc0d4SDRlVjFCb0dLWE4yWE5IRXByMHVKMzdLdk9j?=
 =?utf-8?B?SVF0azAzSWlwTzFLZlpZRTFSU2NBalFSSnJTMDdmOEVZcHpYZnhzbFVPQ0dE?=
 =?utf-8?B?WnpPazE3T1V3UmhkUmxZMzBncHV3bzlBYW8rb2dETlUrTGJvaDFTTjBmUXo3?=
 =?utf-8?B?Y0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b4175c-e2e3-4feb-0c43-08dd32dcc694
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 07:43:16.2174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CuLXdQykKtUsf6HVz7Vb0PUgks5wF1u+6V65mAQX1IyRea0VxGlspJPDKwzhfIqA8z5lHAOSQP0/yCDGkaPLst2MQ9W8U2q+f/nODoyZUNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5021

SGkgR3VlbnRlciwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBP
biBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDcsIDIw
MjUgMTE6MTQgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzFdIHdhdGNoZG9nOiBhc3Bl
ZWQ6IFVwZGF0ZSBib290c3RhdHVzIGhhbmRsaW5nDQo+IA0KPiBPbiAxMi8zMS8yNCAyMzowMSwg
Q2hpbi1UaW5nIEt1byB3cm90ZToNCj4gPiBUaGUgYm9vdCBzdGF0dXMgaW4gdGhlIHdhdGNoZG9n
IGRldmljZSBzdHJ1Y3QgaXMgdXBkYXRlZCBkdXJpbmcNCj4gPiBjb250cm9sbGVyIHByb2JlIHN0
YWdlLiBBcHBsaWNhdGlvbiBsYXllciBjYW4gZ2V0IHRoZSBib290IHN0YXR1cw0KPiA+IHRocm91
Z2ggdGhlIGNvbW1hbmQsIGNhdCAvc3lzL2NsYXNzL3dhdGNoZG9nL3dhdGNoZG9nWC9ib290c3Rh
dHVzLg0KPiA+IFRoZSBib290c3RhdHVzIGNhbiBiZSwNCj4gPiBXRElPRl9DQVJEUkVTRVQgPT4g
dGhlIHN5c3RlbSBpcyByZXNldCBieSBXRFQgU29DIHJlc2V0Lg0KPiA+IE90aGVycyAgICAgICAg
ICA9PiBvdGhlciByZXNldCBldmVudHMsIGUuZy4sIHBvd2VyIG9uIHJlc2V0Lg0KPiA+DQo+ID4g
T24gQVNQRUVEIHBsYXRmb3JtLCB0aGUgYm9vdCBzdGF0dXMgaXMgcmVjb3JkZWQgaW4gdGhlIFND
VSByZWdpc3RlcnMuDQo+ID4gLSBBU1QyNDAwOiBPbmx5IGEgYml0IHJlcHJlc2VudHMgZm9yIGFu
eSBXRFQgcmVzZXQuDQo+ID4gLSBBU1QyNTAwL0FTVDI2MDA6IFRoZSByZXNldCB0cmlnZ2VyZWQg
YnkgZGlmZmVyZW50IFdEVCBjb250cm9sbGVycw0KPiA+ICAgICAgICAgICAgICAgICAgICAgY2Fu
IGJlIGRpc3Rpbmd1aXNoZWQgYnkgZGlmZmVyZW50IFNDVSBiaXRzLg0KPiA+DQo+ID4gQmVzaWRl
cywgb24gQVNUMjQwMCBhbmQgQVNUMjUwMCwgc2luY2UgYWx0ZXJuYXRpbmcgYm9vdCBldmVudCBp
cw0KPiA+IHRyaWdnZXJlZCBieSBXRFQgU29DIHJlc2V0LCBpdCBpcyBjbGFzc2lmaWVkIGFzIFdE
SU9GX0NBUkRSRVNFVC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoaW4tVGluZyBLdW8gPGNo
aW4tdGluZ19rdW9AYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3dhdGNo
ZG9nL2FzcGVlZF93ZHQuYyB8IDg1DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2FzcGVlZF93ZHQuYw0K
PiA+IGIvZHJpdmVycy93YXRjaGRvZy9hc3BlZWRfd2R0LmMgaW5kZXggYjQ3NzNhNmFhZjhjLi4x
ZmFlNzBiMmZhNmINCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2FzcGVl
ZF93ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVkX3dkdC5jDQo+ID4gQEAg
LTExLDIxICsxMSwzMCBAQA0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gICAjaW5j
bHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgva3N0cnRveC5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gICAjaW5jbHVkZSA8
bGludXgvb2ZfaXJxLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC93
YXRjaGRvZy5oPg0KPiA+DQo+ID4gICBzdGF0aWMgYm9vbCBub3dheW91dCA9IFdBVENIRE9HX05P
V0FZT1VUOw0KPiA+ICAgbW9kdWxlX3BhcmFtKG5vd2F5b3V0LCBib29sLCAwKTsNCj4gPiAgIE1P
RFVMRV9QQVJNX0RFU0Mobm93YXlvdXQsICJXYXRjaGRvZyBjYW5ub3QgYmUgc3RvcHBlZCBvbmNl
DQo+IHN0YXJ0ZWQgKGRlZmF1bHQ9Ig0KPiA+ICAgCQkJCV9fTU9EVUxFX1NUUklORyhXQVRDSERP
R19OT1dBWU9VVCkgIikiKTsNCj4gPiArc3RydWN0IGFzcGVlZF93ZHRfc2N1IHsNCj4gPiArCWNv
bnN0IGNoYXIgKmNvbXBhdGlibGU7DQo+ID4gKwl1MzIgcmVzZXRfc3RhdHVzX3JlZzsNCj4gPiAr
CXUzMiB3ZHRfcmVzZXRfbWFzazsNCj4gPiArCXUzMiB3ZHRfcmVzZXRfbWFza19zaGlmdDsNCj4g
PiArfTsNCj4gPg0KPiA+ICAgc3RydWN0IGFzcGVlZF93ZHRfY29uZmlnIHsNCj4gPiAgIAl1MzIg
ZXh0X3B1bHNlX3dpZHRoX21hc2s7DQo+ID4gICAJdTMyIGlycV9zaGlmdDsNCj4gPiAgIAl1MzIg
aXJxX21hc2s7DQo+ID4gKwlzdHJ1Y3QgYXNwZWVkX3dkdF9zY3Ugc2N1Ow0KPiA+ICAgfTsNCj4g
Pg0KPiA+ICAgc3RydWN0IGFzcGVlZF93ZHQgew0KPiA+IEBAIC0zOSwxOCArNDgsMzYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZw0KPiBhc3QyNDAwX2NvbmZpZyA9IHsN
Cj4gPiAgIAkuZXh0X3B1bHNlX3dpZHRoX21hc2sgPSAweGZmLA0KPiA+ICAgCS5pcnFfc2hpZnQg
PSAwLA0KPiA+ICAgCS5pcnFfbWFzayA9IDAsDQo+ID4gKwkuc2N1ID0gew0KPiA+ICsJCS5jb21w
YXRpYmxlID0gImFzcGVlZCxhc3QyNDAwLXNjdSIsDQo+ID4gKwkJLnJlc2V0X3N0YXR1c19yZWcg
PSAweDNjLA0KPiA+ICsJCS53ZHRfcmVzZXRfbWFzayA9IDB4MSwNCj4gPiArCQkud2R0X3Jlc2V0
X21hc2tfc2hpZnQgPSAxLA0KPiA+ICsJfSwNCj4gPiAgIH07DQo+ID4NCj4gPiAgIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgYXNwZWVkX3dkdF9jb25maWcgYXN0MjUwMF9jb25maWcgPSB7DQo+ID4gICAJ
LmV4dF9wdWxzZV93aWR0aF9tYXNrID0gMHhmZmZmZiwNCj4gPiAgIAkuaXJxX3NoaWZ0ID0gMTIs
DQo+ID4gICAJLmlycV9tYXNrID0gR0VOTUFTSygzMSwgMTIpLA0KPiA+ICsJLnNjdSA9IHsNCj4g
PiArCQkuY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1zY3UiLA0KPiA+ICsJCS5yZXNldF9z
dGF0dXNfcmVnID0gMHgzYywNCj4gPiArCQkud2R0X3Jlc2V0X21hc2sgPSAweDEsDQo+ID4gKwkJ
LndkdF9yZXNldF9tYXNrX3NoaWZ0ID0gMiwNCj4gPiArCX0sDQo+ID4gICB9Ow0KPiA+DQo+ID4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF93ZHRfY29uZmlnIGFzdDI2MDBfY29uZmlnID0g
ew0KPiA+ICAgCS5leHRfcHVsc2Vfd2lkdGhfbWFzayA9IDB4ZmZmZmYsDQo+ID4gICAJLmlycV9z
aGlmdCA9IDAsDQo+ID4gICAJLmlycV9tYXNrID0gR0VOTUFTSygzMSwgMTApLA0KPiA+ICsJLnNj
dSA9IHsNCj4gPiArCQkuY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1zY3UiLA0KPiA+ICsJ
CS5yZXNldF9zdGF0dXNfcmVnID0gMHg3NCwNCj4gPiArCQkud2R0X3Jlc2V0X21hc2sgPSAweGYs
DQo+ID4gKwkJLndkdF9yZXNldF9tYXNrX3NoaWZ0ID0gMTYsDQo+ID4gKwl9LA0KPiA+ICAgfTsN
Cj4gPg0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXNwZWVkX3dkdF9v
Zl90YWJsZVtdID0geyBAQCAtMjEzLDYNCj4gPiArMjQwLDYwIEBAIHN0YXRpYyBpbnQgYXNwZWVk
X3dkdF9yZXN0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkZCwNCj4gPiAgIAlyZXR1cm4g
MDsNCj4gPiAgIH0NCj4gPg0KPiA+ICtzdGF0aWMgdm9pZCBhc3BlZWRfd2R0X3VwZGF0ZV9ib290
c3RhdHVzKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ID4gKwkJCQkJIHN0cnVjdCBh
c3BlZWRfd2R0ICp3ZHQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiA+
ICsJc3RydWN0IGFzcGVlZF93ZHRfc2N1IHNjdSA9IHdkdC0+Y2ZnLT5zY3U7DQo+ID4gKwlzdHJ1
Y3QgcmVnbWFwICpzY3VfYmFzZTsNCj4gPiArCXUzMiByZXNldF9tYXNrX3dpZHRoOw0KPiA+ICsJ
dTMyIHJlc2V0X21hc2tfc2hpZnQ7DQo+ID4gKwl1MzIgcmVnX3NpemU7DQo+ID4gKwl1MzIgaWR4
ID0gMDsNCj4gPiArCXUzMiBzdGF0dXM7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCWlm
ICghb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUocGRldi0+ZGV2Lm9mX25vZGUsICJhc3BlZWQsYXN0
MjQwMC13ZHQiKSkNCj4gew0KPiA+ICsJCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2
LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ID4gKwkJaWYgKHJlcykgew0KPiA+ICsJCQlyZWdfc2l6
ZSA9IHJlcy0+ZW5kIC0gcmVzLT5zdGFydDsNCj4gDQo+IElzIHRoaXMgY29ycmVjdCA/IE5vcm1h
bGx5IG9uZSB3b3VsZCB1c2UgcmVzb3VyY2Vfc2l6ZSgpIHdoaWNoIGlzDQo+IHJlcy0+ZW5kIC0g
cmVzLT5zdGFydCArIDEuDQo+IA0KDQpZb3UgYXJlIGNvcnJlY3QuIFRoaXMgd2lsbCBiZSB1cGRh
dGVkIGluIHRoZSBuZXh0IHBhdGNoIHZlcnNpb24uDQoNCj4gPiArCQkJaWYgKHJlZ19zaXplKQ0K
PiANCj4gLi4uIGFuZCB0aGVuIHRoaXMgaWYoKSB3b3VsZCBub3QgYmUgbmVlZGVkLiBFaXRoZXIg
Y2FzZSwgaWYgcmVzLT5lbmQgLSByZXMtPnN0YXJ0IGlzDQo+IDEsIHRoZXJlIGFyZSBhY3R1YWxs
eSAyIHJlZ2lzdGVycywgc28gdGhlIGNhbGN1bGF0aW9uIHNlZW1zIG9mZi4NCj4gDQoNClRoYW5r
cyBmb3IgdGhlIHJlbWluZGVyLiBUaGlzIHdpbGwgYmUgdXBkYXRlZCBpbiB0aGUgbmV4dCBwYXRj
aCB2ZXJzaW9uLg0KDQo+ID4gKwkJCQlpZHggPSAoKGludHB0cl90KXdkdC0+YmFzZSAmIDB4MDAw
MDBmZmYpIC8gcmVnX3NpemU7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXdkdC0+
d2RkLmJvb3RzdGF0dXMgPSBXRElPU19VTktOT1dOOw0KPiA+ICsJc2N1X2Jhc2UgPSBzeXNjb25f
cmVnbWFwX2xvb2t1cF9ieV9jb21wYXRpYmxlKHNjdS5jb21wYXRpYmxlKTsNCj4gPiArCWlmIChJ
U19FUlIoc2N1X2Jhc2UpKQ0KPiA+ICsJCXJldHVybjsNCj4gDQo+IFRoaXMgc2hvdWxkIGJlDQo+
IAlpZiAoSVNfRVJSKHNjdV9iYXNlKSkgew0KPiAJCXdkdC0+d2RkLmJvb3RzdGF0dXMgPSBXRElP
U19VTktOT1dOOw0KPiAJCXJldHVybjsNCj4gCX0NCj4gDQoNCk9rYXksIHdpbGwgYmUgdXBkYXRl
ZC4NCg0KPiB0byBhdm9pZCBoYXZpbmcgdG8gY2xlYXIgaXQgYmVsb3cuDQo+IA0KPiA+ICsNCj4g
PiArCXJldCA9IHJlZ21hcF9yZWFkKHNjdV9iYXNlLCBzY3UucmVzZXRfc3RhdHVzX3JlZywgJnN0
YXR1cyk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwlyZXNl
dF9tYXNrX3dpZHRoID0gaHdlaWdodDMyKHNjdS53ZHRfcmVzZXRfbWFzayk7DQo+ID4gKwlyZXNl
dF9tYXNrX3NoaWZ0ID0gc2N1LndkdF9yZXNldF9tYXNrX3NoaWZ0ICsNCj4gPiArCQkJICAgcmVz
ZXRfbWFza193aWR0aCAqIGlkeDsNCj4gPiArDQo+ID4gKwlpZiAoc3RhdHVzICYgKHNjdS53ZHRf
cmVzZXRfbWFzayA8PCByZXNldF9tYXNrX3NoaWZ0KSkNCj4gPiArCQl3ZHQtPndkZC5ib290c3Rh
dHVzID0gV0RJT0ZfQ0FSRFJFU0VUOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCXdkdC0+d2RkLmJvb3Rz
dGF0dXMgPSAwOw0KPiA+ICsNCj4gPiArCS8qIGNsZWFyIHdkdCByZXNldCBldmVudCBmbGFnICov
DQo+ID4gKwlpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUocGRldi0+ZGV2Lm9mX25vZGUsICJh
c3BlZWQsYXN0MjQwMC13ZHQiKSB8fA0KPiA+ICsJICAgIG9mX2RldmljZV9pc19jb21wYXRpYmxl
KHBkZXYtPmRldi5vZl9ub2RlLCAiYXNwZWVkLGFzdDI1MDAtd2R0IikpDQo+IHsNCj4gPiArCQly
ZXQgPSByZWdtYXBfcmVhZChzY3VfYmFzZSwgc2N1LnJlc2V0X3N0YXR1c19yZWcsICZzdGF0dXMp
Ow0KPiA+ICsJCWlmICghcmV0KSB7DQo+ID4gKwkJCXN0YXR1cyAmPSB+KHNjdS53ZHRfcmVzZXRf
bWFzayA8PCByZXNldF9tYXNrX3NoaWZ0KTsNCj4gPiArCQkJcmVnbWFwX3dyaXRlKHNjdV9iYXNl
LCBzY3UucmVzZXRfc3RhdHVzX3JlZywgc3RhdHVzKTsNCj4gPiArCQl9DQo+ID4gKwl9IGVsc2Ug
ew0KPiA+ICsJCXJlZ21hcF93cml0ZShzY3VfYmFzZSwgc2N1LnJlc2V0X3N0YXR1c19yZWcsDQo+
ID4gKwkJCSAgICAgc2N1LndkdF9yZXNldF9tYXNrIDw8IHJlc2V0X21hc2tfc2hpZnQpOw0KPiA+
ICsJfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgLyogYWNjZXNzX2NzMCBzaG93cyBpZiBjczAgaXMg
YWNjZXNzaWJsZSwgaGVuY2UgdGhlIHJldmVydGVkIGJpdCAqLw0KPiA+ICAgc3RhdGljIHNzaXpl
X3QgYWNjZXNzX2NzMF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiAgIAkJCSAgICAgICBz
dHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKSBAQA0KPiAtNDU4LDEwDQo+
ID4gKzUzOSwxMCBAQCBzdGF0aWMgaW50IGFzcGVlZF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiAgIAkJd3JpdGVsKGR1cmF0aW9uIC0gMSwgd2R0LT5iYXNlICsg
V0RUX1JFU0VUX1dJRFRIKTsNCj4gPiAgIAl9DQo+ID4NCj4gPiArCWFzcGVlZF93ZHRfdXBkYXRl
X2Jvb3RzdGF0dXMocGRldiwgd2R0KTsNCj4gPiArDQo+ID4gICAJc3RhdHVzID0gcmVhZGwod2R0
LT5iYXNlICsgV0RUX1RJTUVPVVRfU1RBVFVTKTsNCj4gPiAgIAlpZiAoc3RhdHVzICYgV0RUX1RJ
TUVPVVRfU1RBVFVTX0JPT1RfU0VDT05EQVJZKSB7DQo+ID4gLQkJd2R0LT53ZGQuYm9vdHN0YXR1
cyA9IFdESU9GX0NBUkRSRVNFVDsNCj4gPiAtDQo+ID4gICAJCWlmIChvZl9kZXZpY2VfaXNfY29t
cGF0aWJsZShucCwgImFzcGVlZCxhc3QyNDAwLXdkdCIpIHx8DQo+ID4gICAJCSAgICBvZl9kZXZp
Y2VfaXNfY29tcGF0aWJsZShucCwgImFzcGVlZCxhc3QyNTAwLXdkdCIpKQ0KPiA+ICAgCQkJd2R0
LT53ZGQuZ3JvdXBzID0gYnN3aXRjaF9ncm91cHM7DQoNCkJlc3QgV2lzaGVzLA0KQ2hpbi1UaW5n
DQo=

