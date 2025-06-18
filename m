Return-Path: <linux-watchdog+bounces-3666-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DAADECEC
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Jun 2025 14:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DABC33A9FC9
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Jun 2025 12:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE65328B503;
	Wed, 18 Jun 2025 12:44:10 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2DE288C25;
	Wed, 18 Jun 2025 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250650; cv=fail; b=Wz7JdCbYql9IfjQ79YSyfFBdYgsC7d/f5S5NtPuornPy0SVLd6mLFavRuW2w7ot2W80cNLMd9jf7qkGcvzr2t1PaYssMv4kTSu78kjzbQ/6oi0FeNIK1cgmk8TeRoEw9x6MYThguhfJvMuAa0PNYW1ydPYXiDcwhGWqp4MOv8cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250650; c=relaxed/simple;
	bh=TVEs0N51OMZ3+ZPurLBu4euzHApJqatPVc/mlQgPr9U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nhQ8Jhl3VDMHEenUD0jC/HJYrqTxmmpeuULbjhU9O2ULtbE926zFIYT1ECK3PZrjAYbkyjWi5a+29yguoVPvPsXZAHaKhc0dfMdv30y+bMfNt+y6XCiXYykg3tmSNpcUIWgejmFBC2Iys7Pivb31epCqPbiz0IALfS2RC9y6Hoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I6YkvN001788;
	Wed, 18 Jun 2025 12:43:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1mk1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 12:43:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/r6I2GglwBZ/0jmJRBMQp0oLr0AC4MISNOWlg00RpKtEJtqAXkGrYBs+0DvXpH6W+oo4MBWVxdhoEKAbWDVLGbvXjn94fxePVb4gjq93+a3QR/yxJqIQFg5M/YjBpJUuIg9w+ciTo6ob2XSvyaXGodkuGQFuFII7JFgibLWUgrCT+mEwTfCLADUNOtpIYAzimaTWSemI+9Kfngx/Izj37VxbUz9O2V9H7jaR/xDqbt686vHTugUzqQMctMNGbmj50rDqkAYp6N46NhyLBTUlR9eCyfIEJ7IgT5bzhJz91YWBSF67sAfjS4GU0WAdcHxDhCVbyUmikPdxHoKNpxY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CFvfUZyX2dtL2TCTDVXIvuKtzzqsCPskFENXh+hmWc=;
 b=AK8fTnk4RvhrukpnSpSVKFeTMLteUYj88zJzFeZMtFnS0JO5mTQuTQqJdIFT5854uTh7TZSleZvwGk0BHhO3FyJsi+IVkZJYob+Wbd4SpPeJFo+vqVRhCRM96ISuwHxtlZLjQhMjMi78OCl4eou5+woPT93GikZgqFtmbNdkNV8kY3KdwLOh11/wARjKxQ/6HJxBmpOowxszmGa5g0ttI9GXGFs1+shmSauFbZ9ZwQZ1bhDHwnVsnGQUCWLyQqSYvWRWAF7EgUTpdZcTsmtf7wsgDjLAjO8uvY0j4aUOGD/pysv3HM3v5qCjP2tqZpnjIFmujIoXnD6wnGGKStptvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by PH3PPFBA2AA2BA3.namprd11.prod.outlook.com (2603:10b6:518:1::d46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.36; Wed, 18 Jun
 2025 12:43:25 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 12:43:25 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "linux@roeck-us.net"
	<linux@roeck-us.net>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Frank.Li@nxp.com"
	<Frank.Li@nxp.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
 feature
Thread-Topic: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
 feature
Thread-Index: AQHb2CJdA+pbH/hxfUaUS7jVTkuv7bQI69VQ
Date: Wed, 18 Jun 2025 12:43:24 +0000
Message-ID:
 <CH3PR11MB877377065C04B1BC2C963AA1F172A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
In-Reply-To: <20250608030616.3874517-1-Meng.Li@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|PH3PPFBA2AA2BA3:EE_
x-ms-office365-filtering-correlation-id: d8972e1b-ca35-45c5-3181-08ddae65b793
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Odr6S9vsMlpv9fr0hz9qnsN4i39wfvvD7skwSiSF5CF8RpEM+GEpe8bv6hYv?=
 =?us-ascii?Q?D5y7uYPQSJBLsJ7NO/wJ+rYQU9LjZJA+c53mdxQRXE9/ib1g8QB0io6mrVhW?=
 =?us-ascii?Q?ly0t/6IEbAkqDsfscXw6athYpiiI1ImLoEQTepGJEtoSRaqOUjbafh9xce21?=
 =?us-ascii?Q?kMsy1Bi/wj/hCtrO2VmtK72w6UVveu61OGX1gn5MXeQ1L/DfNvzqW4oV7C+K?=
 =?us-ascii?Q?LMsG6cyR2g2XV16hWGIT8CtyFjfX7NDytbmp+zaQVZ+EhkwoBQosJcTsnzDu?=
 =?us-ascii?Q?DLT9+qj2NKRB4sy1z6M3SIZ5FGf4qOEi8ZFDd8Cgyh2cTl166RMs6VOHGys/?=
 =?us-ascii?Q?ltdrikM8zYgx1mNHjdKZTEJsXtp1PRzB/7uvGZ+i4Ym6yjqioLftCs476yh2?=
 =?us-ascii?Q?iUF0WbeE+aSHhOW2aUFEjA6KLal4UKQ9hRhXlsQMmD73BT95XOpW0uqdatz6?=
 =?us-ascii?Q?ABOtALX/0m8Ie50UspZshCgRfexOT78TNcVTMydmR8ZaaVH1WfJZbJwE1MTs?=
 =?us-ascii?Q?SMyIKhE23b+oT90/bAIIMBBGyc1mpBEvTYGuQYNCyi0sJRxn8+O09sYJY7NL?=
 =?us-ascii?Q?WVU/6CdynStv/N2tCEOf4HYJs4eEw7EjiJJunf4x5E6Fr+cvy9ilIpjDCN8X?=
 =?us-ascii?Q?iPAKsy6VAmRvadNdsr28ps8sNsqmAu/6NoBZYOc4TgHQ4NM7FLa0WPCAqK2L?=
 =?us-ascii?Q?dWW0StHhhoDugM/c/6aEKUnKTzVdC3kdAlPJ5+horIimaX0hAdi+g6AiJxEh?=
 =?us-ascii?Q?GgauwuU9tHZzzL9Nupxzd+S4mt18GQ/w60WgfS9frohWLt/s5XuMhV9Cc4o6?=
 =?us-ascii?Q?WYEWkuPjJes6UILCkenp0DHOWp3koga0XV82sOHPg2ujYL3cFkfJMzhpduaY?=
 =?us-ascii?Q?Hga0Q4qdmUO9J7NeOSudeRXn41dDR5S4BqG5I8tzEu227PzccaDBWM0/oH3+?=
 =?us-ascii?Q?jnC5GeCRP1Ldz42IpUIKKa6R/l0NBIczdmxlvz3ZI6gksEOJ71aaz9pCsY6X?=
 =?us-ascii?Q?lOQaucaek4rtdun74gQjL3raSVaIKVc1jcUKqHGqIvmSliE/6usgEmJ9extW?=
 =?us-ascii?Q?wCwSBhN3LIxhNVhCXVEFO7ThTJUnkkeupTRQUmpMzEwXRQozPK/Rue05kfZS?=
 =?us-ascii?Q?t7fUN0jrMZUYvZvPwzXl2kdO5wkq6aygZTl9zohRu2zI9+QPPe4ElJZ5+tET?=
 =?us-ascii?Q?I2OpZJkceHpOOsUoPfdlFC1BPqX1MIU+w8ClJOpG4pIQh0viWPPBWGI6Psha?=
 =?us-ascii?Q?LcTuLDrKgFKhjrrzo//HHCVphvu+9s3e59rmhcIJO+BTATDvGBXDvq7hXo9J?=
 =?us-ascii?Q?BNQFYAj/HLU3P14t5UMHXEVQX0lRRGyK9cSvKnoFD2hlnVNeKmIqccZ5GH3m?=
 =?us-ascii?Q?6PSOpM32HGYDBdQK7b2e8I6WBq57BhXEEfeg6HzoLzctKkf1jWeIJ5ozRzrd?=
 =?us-ascii?Q?g/lfP8aPm4Ji7CfY30CvWi4LFH+v/CqSLpZ3zf0c9BtFfvWFjlitwLt3UKYx?=
 =?us-ascii?Q?SchgwJrjKVM2kWM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?i012+pEWsjWPx+R3dmb8JZfi3TBJYvA0NeThIfFJ+LwI9La+hxa1q3pFdDHA?=
 =?us-ascii?Q?5zsYDaT8DMr688qcGLiwkQgr6m1pbeQafQOlA9115VTu9dZ9g10igXrXpFtP?=
 =?us-ascii?Q?I+kCdVbl4T3EovEHa0lWeEdaYM81WCiiX8YDznX/THNnhoF4+acYs8eLnvkS?=
 =?us-ascii?Q?FoF0G2BglTkllf1WgtMGZe0mo19e+0usqd17Rg5NGDyrnD5oYKVhvp6Use0n?=
 =?us-ascii?Q?V7J9uSAnk7pujlQ6qCRy/F3U/YdcHxghkH4qyd4FdYja4sMYi0W1VRJkiFS3?=
 =?us-ascii?Q?cXe9euJrdb9GueWyl6P9WMwGEXQXa1mC9XLkKCrCizrQ/6ZLEw0bcM8JYJWT?=
 =?us-ascii?Q?25w0Ta/Tpe8fIyt0NAsgcbQG2MdH8V5+jvGGg6fkaSTKSJ81KVtEXD/APG4K?=
 =?us-ascii?Q?YsM80Yh8xx5GJRpNhHXWdrFGzWLPDaXxLxLrML6HByoY3re4wUBNbQ92L2Sd?=
 =?us-ascii?Q?H/R0JA66dkBYxOYsIOGwu22k8yDIPOlNHG09PUxRQrGq0IewFfYWSeD2TkSi?=
 =?us-ascii?Q?SqXUg0ckZG9Op0SRoU3WQfFGAzjdFlRndyu/90WgczJVQ4FrlZjyXPLzsvdW?=
 =?us-ascii?Q?yhZ77wvP4DAspSoRfLISVPyVD9ojuEtDr2Wp0WdAS+gc6h5MXLn55n5wJgFz?=
 =?us-ascii?Q?IjdztEOA+jHrH/XsIyNdELG63Lf21wgQ0CZ8nHW4hNzsIwyxA3rbGatWz09b?=
 =?us-ascii?Q?3EzP6CGUIP4yB7uTFj04JH9ypYYVcr6FnknrAlP8k8aDcs0yr7Axh/ZVaVSh?=
 =?us-ascii?Q?MfyJJ+QOEtE4j6Sc53zT71tNAB6FigX6bhHl7Tzg3rTzIPDDtGv1URnOdzKC?=
 =?us-ascii?Q?DJrpoefV9jVp6yJMlsBvHO5dJtkt+Wuf47p2/kcWJPwUf26vY5jV9avHHRyR?=
 =?us-ascii?Q?uXc5pV7uQuktHLNkVuQJ+Xih5DtXrVS4qDiUc305WMNlQho4pMQ7Ue3eNAvv?=
 =?us-ascii?Q?KBFRKIh/x9v9brzecfCO2iOzoYf+N/BYQqWaiBzka0DEHtN4d2/1VgVWNABY?=
 =?us-ascii?Q?mlyrJY7xnnERGhUgb6y0ekO8xPgWPIeOVvWjbjCHWga4ZiK23b/RQZ4Ot7lI?=
 =?us-ascii?Q?rpQQzwlOhz/n6URKqU1Gh2/b9eVX5UBl8ACniUBU4/nP55T73ReS4oqnnIvY?=
 =?us-ascii?Q?8x2tV2pSzdUglooAhen6Du3K4COp03YHHwF8drne5VHFCEXbiIeLlzWtakKh?=
 =?us-ascii?Q?Z4zUUF6feF+vcm3MhVO0iW3qRY4gAlwIC/5XdG3cxmLMJOhmoqzkampSZDpy?=
 =?us-ascii?Q?eQ/IzhUqwDCa3cFBuGzXL5hCRS2UNe3wlnxkpCgMdaLRd6e2qpUGx+5NT6yb?=
 =?us-ascii?Q?0ZZRxhPEZTdEpjd8BWFwBWe7/yTjAwxu2gmE2FvEEfOghnlPYgLCeIuglnqi?=
 =?us-ascii?Q?Zb1qNkRLztyD6zTOJ3exJlmskIOFkH94gqcrliNWGQiwP5ThB03I9Ye8I6wz?=
 =?us-ascii?Q?aHWtEDgorzupFBpSjmED1aEk4kxaTMFhihfRZL8WU5ATz4KWRldnPa9k7wJu?=
 =?us-ascii?Q?OnhpQ7SC2IASe/BQ47Ohy8gvO+8P/YxiKUrDdYT3oWdvudg99y4s/nSiK3No?=
 =?us-ascii?Q?/nlfuyvfRXAb8PddCUzQ8khNydrznYaZa5AR7MsL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8972e1b-ca35-45c5-3181-08ddae65b793
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 12:43:25.0730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wiG4XOvOMpWLRp4tPUf/r7wFQorM5dMRf/dfafoT5HZeTfuBoJZrO5Bge3BKxjbqj+NWlJHHQq8FjF7HnnUAAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFBA2AA2BA3
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=6852b470 cx=c_pps a=Ubn8NgXdbfquypQWsLw3nQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=8AirrxEcAAAA:8 a=JfrnYn6hAAAA:8 a=who4opk85_ACAUyb05EA:9 a=CjuIK1q_8ugA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=nlm17XC03S6CtCLSeiRr:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: greIcYrW38EBFtI7sDKifLTtFB-Sv5v3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNyBTYWx0ZWRfXxzV6eAX5S1+v e6ER7v7BTw/9QBgiKDH5N93mqTu3F93aC2kzPXB7IqmjDS4OquBV0cFwa2HJ67u39un5gsQoSHJ jyXaZH9RCIWNN2+SYr4bCOsepz49nxAXu5hnP1Bp6iD4d1lPz1QfTwvdHDGTZk84PwCytwtVRKF
 qkau95yZEz6wqJQOUzcePC6z1s2nXmBLRDGliLAVHiuOhPqRt9GjM3izzqSDXau07GOcvl988Ka dHyEaoKhP7VBtOqdKGrM+9Nx4REGhxxhXIo/THkgLFxgFMRSsWS7+6WiQTtwyUTMmJCfxCvreT2 wTfkLiE0VCc5T786xNEjwWFDBQSsb/NRgHQ/KOxy0XNeoNMfEF852Ktw2Y/sU6Nhf/JxcUm6umu
 4KYA6IXGB++YuSCyvyEIbicDlEw6Y3ePUN8pe3NaouqAJ8z1d5WaAVHLztTG5urif8Kea44F
X-Proofpoint-GUID: greIcYrW38EBFtI7sDKifLTtFB-Sv5v3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=951 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180107

I had resent the whole patch and include all the maintainers
More than ten days have passed, but there is no any progress and reply in u=
pstream.
Is there any comment on these patches, do I need to improve these patches?

Thanks,
LImeng

> -----Original Message-----
> From: Li, Meng <Meng.Li@windriver.com>
> Sent: Sunday, June 8, 2025 11:06 AM
> To: krzk+dt@kernel.org; linux@roeck-us.net; s.hauer@pengutronix.de;
> kernel@pengutronix.de; linux-watchdog@vger.kernel.org; imx@lists.linux.de=
v;
> shawnguo@kernel.org; robh@kernel.org; conor+dt@kernel.org;
> Frank.Li@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; lin=
ux-
> kernel@vger.kernel.org; Li, Meng <Meng.Li@windriver.com>
> Subject: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
> feature
>=20
> v4:
>  - Improve commit log of patch0002
>=20
> v3:
>  - merge patch 0002 into patch 0001
>  - improve the commit log of patches
>=20
> v2:
>  - improve the commit log of patch 0001
>  - add another 2 patches to fix below warning
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb:
> watchdog@2ad0000(fsl,imx21-wdt): big-endian: False schema does not allow
> True
>=20
> v1:
>  - create patch 0001-arch-arm64-dts-add-big-endian-property-back-into-
> wat.patch
>=20
> Meng Li (2):
>   dt-bindings: watchdog: fsl-imx-wdt: add compatible string
>     fsl,ls1046a-wdt
>   arch: arm64: dts: add big-endian property back into watchdog node
>=20
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi              | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> --
> 2.34.1


