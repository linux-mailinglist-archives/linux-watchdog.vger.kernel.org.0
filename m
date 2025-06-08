Return-Path: <linux-watchdog+bounces-3645-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EADAD10D5
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Jun 2025 05:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55C0E3ADB60
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Jun 2025 03:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8C7156F3C;
	Sun,  8 Jun 2025 03:07:32 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B03BBF0;
	Sun,  8 Jun 2025 03:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749352051; cv=fail; b=IiFEJ8E02146qraU1aXMBu79G+K/KH5aaQGWcG07LBafit10kmJFZ9vot75pQF57tlAZbni3KpFTIDKiZMts4VSgL0jwYrfQ0HVh+XaCEZfQMEgfe9iyN+s06av0ZsuZkpJJfOugJKyr6IebCRxofNJCJQDiypN4F2B1X9pH+bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749352051; c=relaxed/simple;
	bh=TmHpdgB41lxSXvF9aWnTpEpmchxx7jUBYtgntsB6YME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QbxAhfLavUPTFdIfXG2xA/wtxaNrmJuFjb6crz6ofz9DFYWeM84MtsYBPlDNyBpERIO69uuim4I17sa7ICFwAPpkOlAh2yCUd6MRyvFJfe4g3q17xx3WNnZ/HS3Q//65v0lPsffJVFNR6e24DNqE+utoS55nQOat4MaZ3qyaRgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55836qkR029776;
	Sat, 7 Jun 2025 20:06:52 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm0cvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Jun 2025 20:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8LaCMr9IRSTnA3k+suypmzslL+Ool8tS4XPpnQN5DL2DUVLd3wCbbxV3FGaoTFOSJQezl3xlEIXJfYvSC9Djdwf4sMpO1LhKy1oQrzV2X2+GX6TAA9MV7XAtrisrAh4bVhgXEp0IYzM1y92tvm2jklivRkcjfI4pv9okd8wdULUYsk1WdYnCy60k8pBusaC9L/+xA1Unh2Z+YjHWQi3vJoIY8I2pWc60GwSmNIBE8AOyLd2oKSQ2ROnQZBgRD8i3eqEPcuMjGQXFLAOnUwfLvAZQflpbnUolLcGo6HIPxh8FMphDW5+4br/0tfAvrWuKqj/B4uPfT0bJi4NxfXYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvd2UZqMM3qvBf1gaOLfcUffPGu141LJJApJEuiiUGI=;
 b=BfZ0JwIMg0OmABZSA4zZnHPWg+tdM3r8IRrivY2zSTJqWFFXSOGt/XQZzFAfF0JyOV6++PFoEM0SJtC2huBaBdo2oGjKdUu9gtT09WLBjIsVPXotvSORUUyBbvjwdjkAeRrrUe8Cw7LNNr3UoAbdJp65MokOWZmsk9C68/XAGWVFlZTayfXGalh6i5C8/2zAhGBcvNPb1zR4bbqufj6vjLAzAjIcSgHqj50NKzPfN8y3Y721Py5mUqWGLz1EE8qO0lwzOrM8bDu+gHbx4vyAeDvAQd+UWSK4zTVanbUHvyeK9vQnskRUFBBmA5EHo01TIXvvIQxKfDeCSskfAvj34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sun, 8 Jun
 2025 03:06:50 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8813.020; Sun, 8 Jun 2025
 03:06:50 +0000
From: Meng Li <Meng.Li@windriver.com>
To: krzk+dt@kernel.org, linux@roeck-us.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
        imx@lists.linux.dev, shawnguo@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add compatible string fsl,ls1046a-wdt
Date: Sun,  8 Jun 2025 11:06:15 +0800
Message-Id: <20250608030616.3874517-2-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250608030616.3874517-1-Meng.Li@windriver.com>
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To CH3PR11MB8773.namprd11.prod.outlook.com
 (2603:10b6:610:1cb::13)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8773:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 412e7125-5cd3-4a35-9088-08dda639831b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YhVEcetKbPyenoVvCgLqhJAFghtPWM4wnf5s1YeMGr3nAy5kcJJ6Xsvtw8YO?=
 =?us-ascii?Q?+lJcfNbDpzcuSVMjHpZU6A2H91dj+hTqXmaXq8WvlssmUV6wPVyH4uJhKvpV?=
 =?us-ascii?Q?H4cwH4TCkU7DVyd94iul/akKyCqirIYCXhkYHSOYLnnByWeEBF+AWjWbP29K?=
 =?us-ascii?Q?Y7YDNzYTzTvkzkW/r1GNo7HxQsOAQ9wyQtikc7AaNYrAZS2UoYEMJAqj64Wh?=
 =?us-ascii?Q?HhdmNhzOsSsoDtnSxaepN5Iv/BAeL2IG01sla5xTDeUYXLsS+U8mfGZA6Udu?=
 =?us-ascii?Q?zRraJSt0pSIBxi7jW/Ci/oVm+q2G3ecoOOvDfX+65cr1XNT9ghGXiNg/sbHo?=
 =?us-ascii?Q?ub5H07T0lqRlj5BlNZgkQVftt9isfPdN/qWs5ZK7klEY1OAaUmNHMXbPoRlC?=
 =?us-ascii?Q?8MIJLnDbF+8qxIrVq6zDb3omkRl9r4ftVBOV/S/CkzU7HdTO4znViC9VXgX+?=
 =?us-ascii?Q?jpsfK7c4feDRdYuE/X4KztcInQxFG1VmROIVFQnNqFBqp240/lOneNMqZ9pq?=
 =?us-ascii?Q?BZ1ItnPbOpwTiD8Ai+Q6ApS13jtVKUtRqHUw0HsveK5RzVH0yWXNhDyn1Bzc?=
 =?us-ascii?Q?a7Qf16SN9XuzkLgk51ISYiDT1IyKmNSKCPOjQSanguT9NTWTwGhOmE5p5grz?=
 =?us-ascii?Q?zfMMp4vYRlka2rfSwcQqHVmjAsxKyv2/2i70MbMMIFyz+N4aSmoe0+eNdagU?=
 =?us-ascii?Q?5mBD6AWYRWh7CYYLe65UkG8d4rZ3/VVoIRFFBBm00+Qsd60KbEK30d5a/CgO?=
 =?us-ascii?Q?pM6ei+2+NwRlCvZZireLyYSObhNLhlk/Hby7Z+3jT3lezqgABu6EwUGQCbIZ?=
 =?us-ascii?Q?t37Q0f5tmquZXzbpkODSwjJV71vR+T5lFbx8q6oRXT3X4zCbolKD8FF/EwDr?=
 =?us-ascii?Q?uBiC64MswqYkPELfZ03HPmdnTbqqhegXFX87197Wn6/ux4LN3bObpqRnU/Jo?=
 =?us-ascii?Q?T5Ld3WYknLh4sHgJqKe+Z458PlegSLc1E1dQDv/PmUCQQ6LE7I2j8jpKcbK1?=
 =?us-ascii?Q?PsTWxlCmNBcpOAHAt8Y6/Xk5BQtlnXIyPMZuQ1qdS6kWdx/XeSTBXlFLdCSd?=
 =?us-ascii?Q?rG9otLo5xuVl59HeiNnhvAthbIy+WQLOh++ukJQ8p6G9ED13Xcyf3jRSWyem?=
 =?us-ascii?Q?JQ7wOtRpgYGmDx/fsWNSOn13Z8EdPklQwNYHSeHVkNOULvMqGfJGR3wi1B2l?=
 =?us-ascii?Q?S10zIoRP9IOrDzgrKHBmGuKo7vDEQwHMUzox0MzILhMtkUR7DhDGJq36852U?=
 =?us-ascii?Q?ibLCVOwEeV6U+oa/jnaMBtE95qK2Lf59j3RGECu45/d4aUvsPw0ArcwFMODS?=
 =?us-ascii?Q?/w4FNHMJA01+MnUsbFuQdLibnJMNHMWsV7JDys9cBIgHnjogz5TNO2rHiCnv?=
 =?us-ascii?Q?/Coa9cY1ngpPvhMo57ouETNKKPK6lZ6EdQ3FkgUlf6ZQnDpp+HZ9MIgqNzsR?=
 =?us-ascii?Q?Ffteq7rLdeAOS5Nq0qS/CF2gIZ8xQibLCpQiMG7GnA+5CxqR90VbM3mGZ3ds?=
 =?us-ascii?Q?ieHTYI6ZDhqs/y0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RILxurqqYLUzKq2Rp6ZKiOM1e1tOfB3IIUt0WzUKKsTjsAnP7fj/ODNcpG9c?=
 =?us-ascii?Q?DuUU0PsHGY0XS8E87tSv30v4tHhDo+p9T2UVwDd9g4bKbgrW1E9veelqWkaf?=
 =?us-ascii?Q?wXOd/+w9REroFJF9KNN9C1FNTK6aH+x+agPPAFCXsIsg/GKw9pR+QO9j2Frg?=
 =?us-ascii?Q?mwSJY3RiShehnxwSAtpaEsvSVV96teuMoXkEpD8/b43svM6ThHAMsZUH7t1+?=
 =?us-ascii?Q?hBXoJDXm4VlW4Ki8eAiCUko4RUsvwuk5tPGuVtRHlVpSzZUiwfNyCe7up/KI?=
 =?us-ascii?Q?4IMl7eAQBnI7Ds5OFuDfwhkWsbFdBhSGzUs7njRTnpNGstyjgWlt/G06JeT9?=
 =?us-ascii?Q?NUjxEAn7ZmNxRsaejE/XHPdIYLW1tg9iAmACONM5yF279i9rlu/bUiI3HJ4y?=
 =?us-ascii?Q?I0ZY9GFn8WbdXFoHQYBH6MYR/734oF6lcadVhbstGwGhywsiVCKmNN6eiF+W?=
 =?us-ascii?Q?gLxyBhvON1K6CFPgCju9hEVc1/3tQI1O2FdH7oOpov6rc30QXwkF0Eup264s?=
 =?us-ascii?Q?MCZFwJWQNLjcI9TYjcU2m/gf+qPVE7YfdBYuhnn5yjIUOjTAGSJgZsq09tLC?=
 =?us-ascii?Q?KaTU+a/uXE/Jl5FwfSdAP2ct+Hnib4hgesWy4a9bRykXDgQxIEEhInwrya/F?=
 =?us-ascii?Q?xX9JwpWXWZ3gt/nzXuM2G99BgqxBhH4Mu2Yd9giX+2u0VZfySP0Y3B9sccCE?=
 =?us-ascii?Q?KkGU3O9X54Do3Hqi01ioX7CAdsyVZNEJ4n8e2JDjHd+ixYkv+gAi/+Ir7kpS?=
 =?us-ascii?Q?7u/6VFcpcFW8MhS1gs8a3cXPX7v6x687nqHUNjt4ZcTBIJ2vRaL74xFqcGQs?=
 =?us-ascii?Q?LmtN+QX7BUBXdk5kbHT3ftKUtNcz+CmUtPrDFEMuly1GmlqPDeFvUrccpH+x?=
 =?us-ascii?Q?7XTBYM8rS59ZQ0l6XuojDrADbRzG55EFnrhB267Cy0zDE0zLtDBGyXD/vNOF?=
 =?us-ascii?Q?ykdBLZ3nG1gCZom2Dj4+pYwVXO+tXtauFFmR5XcLWaAKMA9VV1hzRGaZBnoF?=
 =?us-ascii?Q?DpuBJJYXqRfB5d5tnYvANPEKpB/HK/OBZhaQRpwFuyy0h5J/9jYoxOJItBYn?=
 =?us-ascii?Q?anuJBbRJMlJ1kyZY+uS1SDweTZnnWOIQs2GbsFjyMvNVh80pgb669x9oMRcZ?=
 =?us-ascii?Q?IOBSd4Q5LKQ0O9Ei2knBKg4U+IHwznnTlilhNypsSKrMPs5SfEwCP13DP+v3?=
 =?us-ascii?Q?ts7gHLhDZ81TLxCzshPR/ew7WDCtBzkLxJZp0L+VrBlxyRZ2uepFdLRU1ZCD?=
 =?us-ascii?Q?zwXLFPNF/aZcG5ms66UUirgturnjHnMSRMTqVAD9+aqt4HQ8LZZDPKByvzS0?=
 =?us-ascii?Q?jHxwBB6VN+0Kql2trFJm8TR3ZsJJaozjAOzF+c8XqHhPVQORpbQMER6e2aem?=
 =?us-ascii?Q?3ginaUJPMSvLfl9SMuFwFdlcwW2DrVZNlhnGH1PtiRSrVEai5WiHold7v2qD?=
 =?us-ascii?Q?htzefRXUrIzwlPQkOMSQ9mYWQPBX35QB02UvbsELwv1Bh459uQNCTeJdMXOT?=
 =?us-ascii?Q?SCpn8rJ7Ugb1cwwFtsm0qiQutgpdvXQBsIDES4O8bnTtZkE/xeb+jYVuXRMW?=
 =?us-ascii?Q?l6ho9+V5MPn4MvalsRDpkBH7plx5qo9+1zU/QCSX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412e7125-5cd3-4a35-9088-08dda639831b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 03:06:50.4896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3OgK+wUC8pX3chm8L1m/z8bDBWeBZYa6GUa7UBOEb+0byUW3MMftqNeZ2ODhdZQeaXRuFmx0EY0KTTbiuS1eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
X-Proofpoint-GUID: Q1-hFsv2d9yrYjxFU6mLFZe_K6xVXbP7
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6844fe4c cx=c_pps a=Pyh3CA1es36lNkRVDm3xrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=URNpuo5YYlQxU1XLGkUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDAyMSBTYWx0ZWRfX7/yeJf3GB0tA bvq/JIHGGb50vyTerX8yr2GKs4bscXLTAoGiTLgfXV6MEIFYFxQtVWI11xzgntdC+ofjcc4tkS6 AMiGg8faRKQVnuqP4f5w9FbGVXPcFkDidn4kMo4g2gVyK/Gp4VucsH/dpEZ/8eUR17G6IyE+jCI
 1y4ong5JV/TRnGkYwiU+4eWXMJWACcUOXGS4qqYL6ThLcO/hu6XbSb3MKyQ3v7SG5EMhhnJUPLq 0TKHlRkGikw0OZrSBF66GwrcsexdTKZAq3iCN690GWpGBVZoZgk1ndzEsGnIa168MPffyrR+wdh rWaFFjBdeZ+qOpN9d1CbA9kCOANeJA9TS7yfA5Y6ThY8v2FP4R77iEJErclccFAz8UXr3yWwXVj
 lzIec9Xe33IT8Z33WRFEXkvoqSVpY0Oiwlf0ZY6zGPRSyg0qeLFNzUGk+p3k94+Ey+NKXSnx
X-Proofpoint-ORIG-GUID: Q1-hFsv2d9yrYjxFU6mLFZe_K6xVXbP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506080021

Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
allows big-endian property.

Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 8a6c3a75a547..34951783a633 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -37,6 +37,7 @@ properties:
               - fsl,ls1012a-wdt
               - fsl,ls1021a-wdt
               - fsl,ls1043a-wdt
+              - fsl,ls1046a-wdt
               - fsl,vf610-wdt
           - const: fsl,imx21-wdt
 
@@ -105,6 +106,7 @@ allOf:
                 - fsl,ls1012a-wdt
                 - fsl,ls1021a-wdt
                 - fsl,ls1043a-wdt
+                - fsl,ls1046a-wdt
     then:
       properties:
         big-endian: false
-- 
2.34.1


