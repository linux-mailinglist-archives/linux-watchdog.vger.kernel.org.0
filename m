Return-Path: <linux-watchdog+bounces-3642-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12592ACFADB
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jun 2025 03:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDDF167E69
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jun 2025 01:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D7C7D07D;
	Fri,  6 Jun 2025 01:49:26 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9C2746A;
	Fri,  6 Jun 2025 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749174566; cv=fail; b=P5RIOqCJzCGKkil8sphVsn2M8NK/qm+lGw5jOHFubjGKWTYd6vaGyXOSmgVFArhi+CA/sGMeG/6LrwhyvQQMeVQYF6g3Go5VqLxzBpU6T1qFxu/8wVdC9qkFGgD9B6cGPFCseH/gJxvL56tgur/n5VlFn6FtdDLaAzSDlAzPJaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749174566; c=relaxed/simple;
	bh=LWYfLnbhGobiDViXiWjJYHyz6Cp185JNVdE1jC9aPLs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ivd0q/d5Q6K5UIYgQPYpsDX6c5dvcVkhyhPbdbpPUqyWA0ltt8gnUHraG0josVUmJv4RVDvQPDHMJWwKQxnh5xOUS2TjagvQ2vCCeYrLPVYezYbC3Eic/A245WTl42/csYqSsonii0YQW6gU+J0f3guNX/YPjO2/J9vEYjRxIxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5561e5Vu021275;
	Fri, 6 Jun 2025 01:49:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q4rwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 01:49:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOcyWjQiBEAFxkvFGZhb18C3CTJi6HHtl/lKjHudvFnx6ORLonIrryVwSbIhmV411NmOmKMWW+aKPWtlQnmkqLnPzKMl2KrNxEB+R+tXgulwXK8mLeWCW0qVljUv1e125JqCIqdiLv1cpbMVpUO8doPxDb68HPdA7FuHvVYXgFIfpRB11D9O7pz28smAyU3PKbBt3PM9CTGsVJOxbM7iZfa3V6081Fawxdf17e1evvfrjvQpTTv3mOxsVGCdgAPQMWKdVk5SRSzIzpFUSZXbAlSXeF8D95rFh78bozh83DjSpBd6tzwHMwDkmdZEa/ba+viZ0hy0xd+ORf2+6elf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoUoBfKZlYK7+fNhHFh53GAtGUecKCvXIq2dFjw+Zjs=;
 b=i4tZGcz75sGVetrNoczdZjZMtGkjgZNApbmBUmsgVbjjXAc9mSgObzYZBiMjnD2FLlVkJ3ecRDlLzFhu5xOsHlK2gcOMpjFBonAcTsskpxbC/RcUQBRD5AKuiLVdsvjMtdMt+5KueIop5wyFuVr9Dy6WFXWDDhMHdZPraeIyhj2oqx18tiqfxTdVeOE0z0ejwDyFA/wO1HTX6iZoV5BKQU2HQeJLYXooFjOPTCG4LLJZHo/mBm19wttf/cNowtlRDR4lWJscZpcQdK6HRuXy1u6c19CrFmFP1fYxSZtdt1C81K0QbYyt15IbiEC9PQTT+Yis72wK1mdaYqkgNanxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by IA1PR11MB6345.namprd11.prod.outlook.com (2603:10b6:208:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 01:48:59 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 01:48:59 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
        "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Frank.Li@nxp.com"
	<Frank.Li@nxp.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add compatible
 string fsl,ls1046a-wdt
Thread-Topic: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Thread-Index: AQHb1QLLGXm4Wb9XyUqhsr9BHWwP1rP1YAyQ
Date: Fri, 6 Jun 2025 01:48:59 +0000
Message-ID:
 <CH3PR11MB8773C92AAD2714371193034AF16EA@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250604034246.3234837-1-Meng.Li@windriver.com>
 <20250604034246.3234837-2-Meng.Li@windriver.com>
In-Reply-To: <20250604034246.3234837-2-Meng.Li@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|IA1PR11MB6345:EE_
x-ms-office365-filtering-correlation-id: 4da58ad1-5c81-4163-cd5e-08dda49c4e51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OeSjL1J8HXT7iEkg6ZsJ98BKoo2Df3fAmob3yRLO0+ag2yhdFzN01z2Xu7gS?=
 =?us-ascii?Q?aP7qohEF86Gl6ySkDukkDSyUEk2SUEp/waA21ER91tFzgqqojRPe6sT7zWKR?=
 =?us-ascii?Q?ttOb4Nydaka+Va6m5hoJq0EZVpgq1cvfmIkwOJxxvFxsy00r9fVRlRfBSrDs?=
 =?us-ascii?Q?/NWBj5oQhZ1CFbjkkC1BqwzHHXHZt+YGWU6/4Dms+2PE0yrG0+AqeKnoouyC?=
 =?us-ascii?Q?5oDaM3aiu52W8cO0ZE10JngToN/qfMfmjcR6NWSAhNnbsqi6GvL2coPHflPP?=
 =?us-ascii?Q?gthUJ9W+NYOUHR4zcCHJkAInEaNES9ddM4OR9VOtrulepPu1Qam/qoC8t69R?=
 =?us-ascii?Q?TwUXl67Gp0b5RJSMwnl+D/a6cJY6DRcaAdHk7vqQy06KIABpWJZzuWx7ut17?=
 =?us-ascii?Q?G6qDtjAGduJCmy6qdeBedTeSsujD8z2mPYKFxarisHC5+Hh+oy2tl6mbQuxg?=
 =?us-ascii?Q?VgbeKrqb5nGOdfGl8EItoe7fVLHAL9uu4n2NjWTSUDUq5IpcJyuRH/1kCXT8?=
 =?us-ascii?Q?N1SyuOWMn2AAESsJVxq+gNd3z3LAvMr4rvsyBvZX9k2wPCCnjIEVfHcR2M06?=
 =?us-ascii?Q?cUPWycLAeBX6jQMXvMIO5txnIS/twnD6+5TK3hQB0uPj649ktEwywm8Mk2Aj?=
 =?us-ascii?Q?P9zzBC91LLbCag5gFKlnV7uWC6NbIYl32hJxWh4rSAVe8aOlSiameoHR7w5N?=
 =?us-ascii?Q?Sx9+7ulJUn2ECo9fWn+t+GBxHiWdGN6OfUYJnl6Pt39aIHlSTGbh+QifjhQG?=
 =?us-ascii?Q?YtGjcv4vYUs8stI8g0eVMBch+DnwUM9wLXOy7oqy4q2exc8cGhyuK5r/APnv?=
 =?us-ascii?Q?sWmcAuhxUPnM1oljXAhqlknO33swdw+FooPZmXhQ8w06AqoAqnSyuYLThW0x?=
 =?us-ascii?Q?BwUsnqaeBEfVqY9FmoPBYvKJ8D9kgNPtxpV5VTCqXevcFxa0dOe+CQVVtt3F?=
 =?us-ascii?Q?Y5hVsl/ORXZwEdUftRKVNKUFV2CzY6jRrN0mMHoWHWWnZ/xM7UN+dgEHfw13?=
 =?us-ascii?Q?kPTRYW8PfqcWuC+6LKstvGfqdcNFBg97WJzdP51blBdJ5FsXQWxcOCWlds4A?=
 =?us-ascii?Q?YH/NPY0lUIyr4OSNkYVForI17ItFQpi8r+rvfwmWdie3Kcf36A6qv6AwQT2q?=
 =?us-ascii?Q?aKiIFkAvqISjVMHxetl2flmedOikn0rNgd3jkN5WJ23DCAzMwFsOmuy+1Irt?=
 =?us-ascii?Q?6DV6uTfboJJCxSrOkMKRzrpVuat+u9mE90htdOaogLHBZnxC8WoEUvNFWMi3?=
 =?us-ascii?Q?LAuz2uEDFF5DVOzYpzP33KBQ7DcWbdVOcH+tJt2K4eoWCQmxYR89HEmXzjAy?=
 =?us-ascii?Q?Q4KuBZjz/th+iamWw9IRdrDNlZSljLDzVe9uZXHQPWpHPQjgnNfbm/Xhxvim?=
 =?us-ascii?Q?trnVmZYn5P6AuClmVqQuN6krH3cCZJhUGq3yr/GGhgZPcIj00Ul3tAYItbeF?=
 =?us-ascii?Q?X2hgHZv3qC4VQbVZLD0UxeYug530hkvym9G4YqRjib4r6enoaxBoh/KJmmmW?=
 =?us-ascii?Q?Kvj8Lx2DOQjY6AI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5haeu8Nusmi0VcZlH477Xq6/Rqr0EY/rc/WKn1iiqv39YtApKYfJRz5dFfGY?=
 =?us-ascii?Q?yxhUKBpPwGVa2IioesH6761JGX1Anzzvrb8+AY0oJIQceUXH4RMBF7cpEqzq?=
 =?us-ascii?Q?SeN/2GuotW2NN752OyWqzeP52fMFYppfGkKh3cg5fgd/MUqWsqQ49XXDnsU/?=
 =?us-ascii?Q?Ezpkr9lsoRjiQLMC+Pz/4snmkGAm1EgaAyXCUb7AoFBDwB5HPZ86obVbZumI?=
 =?us-ascii?Q?SUw9EE0+32X0KE2MWOkxBsZcCWEsvkz4yowEFHjdbKJXHB2Z/rTKgKpVnynb?=
 =?us-ascii?Q?Qi5EDpnxk5MxPC+LMlS023FSDLp4vkNCqCIf50PtfidBFD75vxhs+Ecj+xG7?=
 =?us-ascii?Q?psJcvLPl75NbB+V/YFHWklaXcgKV9krCHGam3Pec184wnXs+z5Sl3U6C+6Xm?=
 =?us-ascii?Q?2mV8WZhngHrlz3xQbFtl0w0xskLywqvKDtEZmr4vZHlCLr/E4sApWi5SXmMT?=
 =?us-ascii?Q?cX4FZPBaOFk1wWMoEBaSeCZ50Yrhw88H6f56msBZwNfW6Tyj8rBFpzUCZH+k?=
 =?us-ascii?Q?d4+2vu2Nfo+pmguKQ4smsKH2L+JwOEwWNwfgtgIsqPhBVIjtOu9K2rR1KGpK?=
 =?us-ascii?Q?DixnBVq8nxnayUO/pfXPYvzeAavFgpvuobRjdhUXLjwi7AVulYNYZ4KlBYUp?=
 =?us-ascii?Q?R3D/mpLHj8Rori13LKU00/3Eq7N2Dxbc84/xauOWUA96pEPTXQdDIVycA8w3?=
 =?us-ascii?Q?nhJb2Hy97ozxaIuyK0wxbZRvpQibaHSkiFd2pPgENBPwWCL6Kdz5SHmrq9Dt?=
 =?us-ascii?Q?ao+Q1EXoxXKs0GjcPXz+V/1LEfquDV3chRj9k6TCDYq4c7v5n0mo9cnDKu2f?=
 =?us-ascii?Q?R/yDM3f7K27DSLUzYvzUMbmO6+NhA/fdBh0siFmASm7V7A3kNvCNPR0jA5hX?=
 =?us-ascii?Q?yYsyDEe7BYbjZo0cw4oUGQGPatzfFDH4G7vxLmKpoo6qTHYwY+EwGIR9piPU?=
 =?us-ascii?Q?FOLPqRtqPzH1fAU9Q2weVT+gDM189wzU7jGn1zwSNTQJM1fsE7OrLnsWV8tf?=
 =?us-ascii?Q?+T7Q2Xa/TwvJTzV7BgggwRPkqFm1N4hW6HJwVK8nuaEnyJMG6PY4RRU1OrM9?=
 =?us-ascii?Q?eGL0MkgH4lwEfrjEkzCfcaRGYSJSW3qjxgo+tjRPMbyMykgZ8u12l2w9k5z+?=
 =?us-ascii?Q?syqHp3rLWih/cZeQPU19JjZHfl5BqT924hdMyxzPlUS1+9UHUm3JU+mpfUE6?=
 =?us-ascii?Q?5TZG9OM8rVQSm5GhJGa6f4P3RNMd03mcDpbmql2GEnEK6H9sznb7m87498bZ?=
 =?us-ascii?Q?AVtXSm1kKSady7TCFgaBi9A88nw8bW+HeAoXekyyQ+T9dAGyNwpVcDzzJDuV?=
 =?us-ascii?Q?OBy4OXwt4DIYpmKicIT4sFqz299gMVFTyNjxTM+0fjutSmRql6cGtyfJTE/X?=
 =?us-ascii?Q?0OzOyWOa0bJCF4axm7UtLDfwq3zhGkDqZ5gXEJDDbIIpezCN//oGtDREeIH/?=
 =?us-ascii?Q?IfcnnXCtv+KO82HgbhnA8aN3+vGHNiNqffWMybQdQZ8pJjtOlRfU4fFEZ4jN?=
 =?us-ascii?Q?Ipb5SQlPtRdUcj4LhZLX+q0pE5iXSdTm4lj7A1Sh5hPKSIJyPGHJ/m8yFLoe?=
 =?us-ascii?Q?HwF1XOYY75fEx9Xe07VpYToRtMgZ7WM25LfwSLfy?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da58ad1-5c81-4163-cd5e-08dda49c4e51
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 01:48:59.1976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vT2dxyQ91zpZEnY3bVvesnZRVIdwRizTxNY5zQ6KP6ZoSxyViY1dQv+wkjBZ0VseSyHQDLcU9Kv2WxVw+2WVJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6345
X-Proofpoint-GUID: jn_8gxN8YsUIw0Zc2YpacppGMD7wSdbV
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=6842490d cx=c_pps a=iNbKu3seLnfQiesHBt/AFA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=JfrnYn6hAAAA:8 a=YiTvw0wMBiQh34J2NJgA:9 a=CjuIK1q_8ugA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=nlm17XC03S6CtCLSeiRr:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAxNiBTYWx0ZWRfX+sMsEfgorj1b oRwz4xv6VYrlv7aNFNmAVRr2cpkvFy3Hc2WMMXNzMoceChjLhOHUSkslkXlv1UnyC90P8kBfGk2 a+YPeEKyTvdv0XTQHI2VE3o4BAHmo3IsaC358Iy71sO+rTKRdiIN492AJxT3Qgv5DyXHW9Zv5C6
 6q/3dd+ozPl9DrjJprJLrCHvJIqU+3gcjYZI7DTXdDWi/QtsbTKtxPE1cGbVnsJlTkDoIhGueUk zQy/KJJ814c6CyIT9Ln/o3MkfvOOsAoPdtgDVa7IyhZOF5M/t99NwRpcPdsLLywNOE+tz7I/W/E whMqFwZuz7IbVrKHZG3JQdByVEHu7ayPCfIx5lSWdd4Vqs2f4zHr6eUrFQ7+U1PwTjJ53KEnKIA
 J/Mc6RlfrwpAaQsIW7nvQ3H6YaDPyB99MEiifJIuIwGaDmWZli1YcTLsCyYMRxltWBTeXVWP
X-Proofpoint-ORIG-GUID: jn_8gxN8YsUIw0Zc2YpacppGMD7wSdbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060016

Add watchdog binding maintainer.

Thanks,
Limeng

> -----Original Message-----
> From: Li, Meng <Meng.Li@windriver.com>
> Sent: Wednesday, June 4, 2025 11:43 AM
> To: linux@roeck-us.net; s.hauer@pengutronix.de; kernel@pengutronix.de;
> linux-watchdog@vger.kernel.org; imx@lists.linux.dev; shawnguo@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; lin=
ux-
> kernel@vger.kernel.org; Li, Meng <Meng.Li@windriver.com>
> Subject: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add compatibl=
e
> string fsl,ls1046a-wdt
>=20
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt al=
lows
> big-endian property.
>=20
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> index 8a6c3a75a547..34951783a633 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -37,6 +37,7 @@ properties:
>                - fsl,ls1012a-wdt
>                - fsl,ls1021a-wdt
>                - fsl,ls1043a-wdt
> +              - fsl,ls1046a-wdt
>                - fsl,vf610-wdt
>            - const: fsl,imx21-wdt
>=20
> @@ -105,6 +106,7 @@ allOf:
>                  - fsl,ls1012a-wdt
>                  - fsl,ls1021a-wdt
>                  - fsl,ls1043a-wdt
> +                - fsl,ls1046a-wdt
>      then:
>        properties:
>          big-endian: false
> --
> 2.34.1


