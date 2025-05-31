Return-Path: <linux-watchdog+bounces-3596-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE2AC9937
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 May 2025 06:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0834D4E1044
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 May 2025 04:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54051B0F17;
	Sat, 31 May 2025 04:08:56 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F62528AAFD;
	Sat, 31 May 2025 04:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748664535; cv=fail; b=KWxErVShQDhsV4zSfyGDJIuS3TTmSnmXR0SKUNQDXr7DTF/6U239VDL3+BYPL+fmNUKZB230ghpVZhrR4S+b3+Y0UWon5MK/dA+13ip15nJHNryrY9lvBoZIcCtwvcq6pmZWgWWhCkNoZXcIRgLUN5cCvXmFqQ+Gy3CPZ31IIJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748664535; c=relaxed/simple;
	bh=PJCvnD7ke1QdssJORyZkeookc2PCezIjanll0ZD3/ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q/nXiCLBEyboEoXnmrHxOnFz8sQJP+EqY6sLd1jjKTKzFpsORQG8WFv1kVqZtxW8InwLJp89yvK2epMpTKPs+RCvqKSf0UBts0qr58HPcn4t/25mI40d5fd5NF2Cgkv7h++DkyYMPwPlStiSZc92xH8r9RUsN4QG1Wlzjg/DGmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V3o4Yu032718;
	Sat, 31 May 2025 04:08:07 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46yq00r3rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 04:08:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWKjKBGTccfWbMu1z+xfinwtANHf5Rz1xid127GCYqTXZQfKSOnBNWAObTSE+zR17gr6V/2igs8ptXIuWjT9jya1mkwba+hyDB87JyjBlDQZAwL04MijOk8Kxrgw7NVdqhLn9PNwrjg8vrZ4U5LhhPaQ6A00sVVcT9sl83BlvaUa66zc7Qk/IguvHRQ9glGO4qhbHyzuUl9SZMFemySuvs7JkOUPo+lvhxBGjC0GBPWEWYfGkbZAeKqEUrQDCtv3BVKDXAavbp9vJI+z+VqMwNXkK1LEYFfz+JC9i09AB4RKk5p720DstXctTLlS6v1yE2oyClaPZQ15Uii0xZkfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsscOpBOMXd4iEm+YTwdM7KH4PCC4H+KksyhPGmwJ2Y=;
 b=MfPLo9SAwWj24A5VII2aXVpGos/FOf/XqdnEaYteX6UXQR8gnb5OQE4FndroyGV0zmozAsvXWs1AW7XPBmBrK+6gZsR5wB+Riiqs5P64Su/avmrESDERch/f9NpEmj5zg+KcSLIVIdmLjYzVQ6LoEsCVR9dWFiHnsSY4Np5efuRwSR0421INSPQQ/BkQxP9UJHcEM4h/m/DSHgQgeL1X04lQL5XLTFv8KoOYAJ5XdqGXWtvMJd8p7XpJbHmug1/gt7DcCewtA5yn/cA3vcpAKC4zyVvEl5XiHIlCtKAWE4I+bpScxBY1uXzILv7rDbrSTrLUtcaFeS5VZpgTv6olpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Sat, 31 May
 2025 04:08:05 +0000
Received: from DS0PR11MB8763.namprd11.prod.outlook.com
 ([fe80::efb3:ec61:3036:be3]) by DS0PR11MB8763.namprd11.prod.outlook.com
 ([fe80::efb3:ec61:3036:be3%7]) with mapi id 15.20.8769.025; Sat, 31 May 2025
 04:08:05 +0000
From: Meng Li <Meng.Li@windriver.com>
To: imx@lists.linux.dev, linux-watchdog@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, s.hauer@pengutronix.de, wim@linux-watchdog.org,
        linux@roeck-us.net, shawnguo@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v2 PATCH 3/3] dt-bindings: watchdog: fsl-imx-wdt: enable 'big-endian' property for NXP ls1046a platform
Date: Sat, 31 May 2025 12:02:13 +0800
Message-Id: <20250531040213.2589292-4-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531040213.2589292-1-Meng.Li@windriver.com>
References: <20250531040213.2589292-1-Meng.Li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To DS0PR11MB8763.namprd11.prod.outlook.com
 (2603:10b6:8:1bb::12)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8763:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fde7db4-b0f9-454e-afea-08dd9ff8be2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U68RFYsn0ILMSdNYofzF5lyXnbPvhWeW+y63EYRfnPvbw4QqMLiosoIyRM/E?=
 =?us-ascii?Q?v40jQMlLgnf22bBUFJyfkCA9/T4ahFLmaYA5negza0HzPhvhwc1/6tdXo7A2?=
 =?us-ascii?Q?WHiKm43pEMCQ6KdJNOyB70w+xxtJE3zoUyOplff4AMYC4yd0UlTFGmBI90lm?=
 =?us-ascii?Q?+o2kzTEulXoCwLdhmgakyLAsoH8fasVaa1t5PeGrP7BJYMh/xfMmd6v1Z8aV?=
 =?us-ascii?Q?HY+BshsU4R+DZ/DOonix6j2/wAKej0rR4RZ6eF7/FJsUxLY9rOEZIJBPLgyo?=
 =?us-ascii?Q?Nmkpu0HUW80uvWWJadbU0wQKgAJDgJQQkcf/H95JyLC6U8gKKM4E5e+f1AeU?=
 =?us-ascii?Q?vtM0OpTwjFK6rkujMR8Uf9juD8JfbfDq3f4L2FlxcGrAW0Nz/CYwk/bcrQ2h?=
 =?us-ascii?Q?y5rWtaE54yLKA6JT+a+21wAd/AHkAWm8Iz4cN/m/hFb3u8m0QBrGVsn7Srp9?=
 =?us-ascii?Q?opnyPNXB49qSACb77Wa8AKT/vlI209LVuEWuihsJCnRuMGyUUGWhZSpb01Fq?=
 =?us-ascii?Q?K13+ecKeOTp4gXTdZzqy4KAl6ho2AeCSk5lOd5lLoqgaSN5kJ9yXTxNeNTSr?=
 =?us-ascii?Q?hOB8hk1tbhRf2AE6J7VpcV4dTl4LbCFKks/YfjBMvipsaApkz4b+diVax/lW?=
 =?us-ascii?Q?1VB3BBQ9ulgZkqSAjmhm1yDV2a8+8t0YPbT1Xrj+vp0PxWXV1jABShMUlIB8?=
 =?us-ascii?Q?VP9beXkCT8oGiBpXG4cUBgYTFHvREuSQnFl3ODfDidRoIIhE1Xp5HF6rGDHW?=
 =?us-ascii?Q?QZih6myHoAQ2w8tFTWwK3+YIlSaya4saMddp6AjTs3ln4/KofuvCJAru3B/Y?=
 =?us-ascii?Q?xQkoFRBqbNHAAqp+7fa8VKyPnaugT9m8zv/pFRvd0FjHCngMwV5VFowzhRh5?=
 =?us-ascii?Q?nO8a5Pr+hECvKApbBsuV5Ydn1FwHsCNZR4c7FJ/EzJyM+d40xPNqHw5pc9yI?=
 =?us-ascii?Q?H4dfb0Gi3kuChtjOStegaoDTIYa7yBSG+vbNnAViFnCjOFQ3t6s07MEXspNi?=
 =?us-ascii?Q?A40RLitIn/Ux00h1qH2O6jj+AGPms1GNMDLN9wzkTGUPRiIRR0rqALekfXJ4?=
 =?us-ascii?Q?/jc6K9h5SEugvPriQZ8nB9sTmhUMA8NycQ2/QOxDcr0JVcHHSCWs8Q63z+xS?=
 =?us-ascii?Q?Drv5ThZATQeDFFHlYa20wrZySb/sdWWXey3YPC/wTJajzrmN/3rPf8pE8oLn?=
 =?us-ascii?Q?qKY/sxsnGSomw5a3ktC5V0WraCn9XIl36pZpMyKcjW5Cl6ykz1WXYrfmDhlR?=
 =?us-ascii?Q?H+jMcwOULFJzvguSKXAJ5WjMPYaISbI2otTlaTYGHUHfsQ3JvO9ZI/bT88UT?=
 =?us-ascii?Q?VUym+3v5VuUSEtnjGOHHIGXTa7wvxh2ep3u2OpxpdXtVvZMCjeRKK84GkL0K?=
 =?us-ascii?Q?iQSbDALvGq2jRyU7uu/NBN4N33TzSLdrUfUlqaK4e6d746CQYdHw5ASWFn+5?=
 =?us-ascii?Q?NCW6QofCRtxs+J5FyEibc1jxHvSnH+ymRk57H6FZAp+0nk2prom60/kFlYII?=
 =?us-ascii?Q?2jJfgaFwbqEMGSA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8763.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ect1CXGrdhTZeFkK8zA9kRNjtCVU8nOYHfGgpS0ToBgkth2wNJBuU0D0wu3i?=
 =?us-ascii?Q?hiMgnq4d/ShAkUI9mlroiibW9LFbq+SRihC27d6aqTTyu9s6YikyBgn9rVgA?=
 =?us-ascii?Q?iGaZRvq/0nshAUVHaS6RcsHvTdZuzz/FwDH5ogsyLiopOMFdibNtd/B5RNWn?=
 =?us-ascii?Q?qi2/DnO7vsGIrWraIGD1A9I7iMHn7wz55OTAPIA78H/zpXMkJScIG3vynJWv?=
 =?us-ascii?Q?lhi1UX0BflrMTgNLGwbb55d+ytok0YMRkXzqGR3/UvYEtvgrD5N4floBqri/?=
 =?us-ascii?Q?k3GulggT+nTvxxffKYeV7XQbE70X5AJSrsrQVEVeQWUFlSNDfrSYFLXX8BlP?=
 =?us-ascii?Q?jmrW8B/dlgdW0upDBwFtPvberp+z7qcxaECf2It7BkWJgxGjp9Ln3s2nTOsH?=
 =?us-ascii?Q?TqlrsAP4NEJKucDBAieDa5eddrEg1A9ubpn2BNWlPWUK8g/wgTd+WM9YgEMO?=
 =?us-ascii?Q?+FRy/pdiq36KfZw0FShDM62+g5nVQY382BsBS8MZUWB0IpQ7EMs7Am9cbTiQ?=
 =?us-ascii?Q?JF9tDoDMJsuz6z6EG3X0+igG+NyW3dGiu81Zzhnc/Z/Ih9JCVxskxuMXdQeO?=
 =?us-ascii?Q?uy5+6YxSFmfRQ2Om9xPgJXA3wQUG8q8v2S0zT8OqbIMzBxqIcE7cY7SJCU28?=
 =?us-ascii?Q?iJo3drPclerWQm5EzS/IUTKgBBsHFK/+N7g6tKEXozmHDlnhTy3QBgAdT55B?=
 =?us-ascii?Q?TrGYPcuoYlGCfgbOsq6JU4nuZYlume26ynDEV8iuVFGr67w05mij8RKrx04x?=
 =?us-ascii?Q?Y5mSL2dSLv00eSE/smRcjU4HOwpdkWHIa/ArEBqBnVG34AAPJ/MwwjyOnGPo?=
 =?us-ascii?Q?6HUmlS/VI14W955N2sU5GgZ+l5ne0TIOarE7wfdupwIWJtrkSR3UwZdRnzTn?=
 =?us-ascii?Q?del3BzlIJp2kfjXUoFaIlpprGzAjOMrqcYxl7rJkULWIaFayrWVGfoFc7MHL?=
 =?us-ascii?Q?ResR/HH0Ry0P+m5F9zGFRVpxdnkmTjTbgtuecnuXRTVSn78eryGFbz4rm23W?=
 =?us-ascii?Q?7huyk/8QViJbL8BzaWGOAFqb+mKQQKUnLwJl5u7e58sk+XaEj49omqqSiNeU?=
 =?us-ascii?Q?lv/2kW6zgnz0uW+B4L1P2QKewLLr8KAMkXQpjcUfuPDbN3FIrS8J/FOFGp2z?=
 =?us-ascii?Q?PS+HLzGMOVnrhC72dUWWgMNwZ/LD5UhWqxFWGCuzKW1/3Xb/zOXZFoZ+WgkB?=
 =?us-ascii?Q?k+bDT2X0hUANBtx4TuhkuYOD8IXO9UWvlz6XLZVqcNNj5Zswd7LmZqfh+OJk?=
 =?us-ascii?Q?5b54Lrdr9O+K/CsPwPydO2l/8/fRjXxuAeIpWZ0RNucRp0W5uhEOEi3Vf9f1?=
 =?us-ascii?Q?Ou+92uyfkzYmW1Zb+iW5lGMpdYFTnGusn3fAPU9ZDp9UcZ89x0NNpYy7D/yu?=
 =?us-ascii?Q?hlS4BfTvGPmO/HBhQVUU5nPAr+GjiuZ2Cl5jsUk//qo+xbeUZkHvQE/rCXfS?=
 =?us-ascii?Q?6gf25Ur40G55gdbe8vKwesvO7zQOxEt/0jn1NLf7sptNt9JNCl0zsNRvjxdM?=
 =?us-ascii?Q?s3olalH24nt7lN2u84HG+RxWNV9EIqnfn9fxqexGQRKHrc14WlSeoNvtfCjX?=
 =?us-ascii?Q?Xdu/Sh/dZelXyyvTzRmgv/ZFZs3DeVvvKha64zfg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fde7db4-b0f9-454e-afea-08dd9ff8be2a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8763.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 04:08:05.2057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82bzMH8sP7ZaAPsHvr6p2sHP8bwCd6v9M4KAftY1kVunQnJAw7YcX2qXkz4UCCQ9VbzU61yBa05K7tqXdiJD5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
X-Authority-Analysis: v=2.4 cv=EtXSrTcA c=1 sm=1 tr=0 ts=683a80a7 cx=c_pps a=/wE8qVhL3yOOyAy5PcWrvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=URNpuo5YYlQxU1XLGkUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 99lEQN4P5PrEVligiikUc4gbwpkWunZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDAzMiBTYWx0ZWRfXwCHMffPCNv+w sOrj7T1bDah4iioL2DaFo/iL2BIawtxnu39rmAHATw4CuTCxcpjwFQELsYnEBtb8dOaKPsHwQTC /OCoARj+KaD8Z2fkGA5yq4Pg50AgD56WxVuBe8ZDDiXQrcAQ0pe4BR9EHevdb2mN8XpxAv3DKD+
 5y06PX9Ulgy3GJNfM9RPn6OXA/76sLab0OrxoAY6LVuR79R5fpSiqOiBq3u+9HJjwuPS+0FW9kQ JhHhTbBy9izbCsNF9RuTy70iqiQ8GWEQjfx/1I0NG2zhVtJDeVnKqIePW1+6fOeR4IKjr/1TBgJ XIpXBnCl2hnay46Bt8FdBl6FnY54DwpSbFC20F/92/XgEqttcGcCRPHiPV0ZiADIJpAxUBHtK0Y
 qrupATKtApA0I1fs4X+B6ZiVLnIpZ+0AuRWeEFo3EUW0AlglgZz6JSpai53Spq418OKOLv1O
X-Proofpoint-ORIG-GUID: 99lEQN4P5PrEVligiikUc4gbwpkWunZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 mlxlogscore=724 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505310032

The watchdog of ls1046a SoC is a big-endian device. So enable big-endian
property for it, so that avoid below dtbs_check errors.
arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000
(fsl,imx21-wdt): big-endian: False schema does not allow True

Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 0da953cb7127..8006efb69ec7 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -36,6 +36,7 @@ properties:
               - fsl,imx8mq-wdt
               - fsl,ls1012a-wdt
               - fsl,ls1043a-wdt
+              - fsl,ls1046a-wdt
               - fsl,vf610-wdt
           - const: fsl,imx21-wdt
 
@@ -103,6 +104,7 @@ allOf:
               enum:
                 - fsl,ls1012a-wdt
                 - fsl,ls1043a-wdt
+                - fsl,ls1046a-wdt
     then:
       properties:
         big-endian: false
-- 
2.34.1


