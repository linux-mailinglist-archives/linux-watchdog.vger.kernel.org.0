Return-Path: <linux-watchdog+bounces-3644-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4CAAD10D2
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Jun 2025 05:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3754416B289
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Jun 2025 03:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C980136327;
	Sun,  8 Jun 2025 03:07:31 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D8D33EA;
	Sun,  8 Jun 2025 03:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749352051; cv=fail; b=QJG2iGcNzWXIHm16N52Zl2HxqhK2ZE00LJBnGJXX5DJs3X3XfAWeLErlCeiRGGRjvkLg3YkbFUMtgyFyQg+LDWksfnwu+W3cDE0Xqvav6eL5SaP84qBCI5g/D/yuYUBj0gOa60VeStWR/eF0TfTYhk/w0CCjoHcRk8ICNQVDkcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749352051; c=relaxed/simple;
	bh=S7aM4OoHDPhw9kDuYMBIDDYf9zT3ImvTK8uzoUzgmdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nvv3hgzRKG5makLymo0E0R/3QUMmcGN39xX/EW/bwUp3ZyKLF1+9S9CEt837TZjCHu4mgGZW+HGHDSK01N3qShMOij1DCFzthCXwFh/RHWIDBzqG/gwrSdoe3WRjckphwkEE3AEPFW5RBX4Z0ecb9wqEgpW88QzdTjL81r7RsRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558307Ls019181;
	Sat, 7 Jun 2025 20:06:58 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm0cvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Jun 2025 20:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQ4Jen0hhFutdwHJsVEalJorRoDPRqxApiB0C6QRRQnyhYRav+IRF1BW8AxpwUDif0ydCFsGQ/omF1GrKwkK+nvXvUhaJFiL1FVejK3pKBhKXuRC08DOnW1uOrNbOCzLa/16bBA01Zsq8Np+4kAe+uUHWI4TtBKVWXSkM22ibmiWiXkrbDtzwJ+XT3zis3Pw6IvBGVrL429YruetGsh8VgD61qklmFTbbyFdCG3fGefHvPCieptGhQrSRrbnE2KQ45WgcyB1KmYCZnby3xZltrwEBLjjDukscoC7+LhQYmZfo5lkhIa7HiEEVzPKALQOOWd2ZZjTbSa0S1KMPCeupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UofLa+nxjS/n8/AQ1hc8UOYntVw2z+dR5ZERE2/H8xY=;
 b=bnph9EZ+FLhIGSedh3nfq0D+gxwEub6LQKnNu/274j/5csBr9i1w9cul6hQ8dMaV1eTfeA4eEK3CjCYL+xlXoPPvt5tQLi3zoZkIkBvy4PBCEztKGWv1bKvN9Cdp4EWjY8hgJJVQt8FPjITIjIcM1GQ8dL+tywSs/fu/W/yri4p6wGFdzd8iS2+p5cfHwFe2+oiGI8WZHl9pl5iCW9n21zOWk6Xasrnb4hjkwRK1xjAy7SHHR5iEP29zXskn23LqyifcRfdL0JzuXd4++g2cRbka+k/SMPTRiVpmR+mX8FEyfYOMC4lTnZ225oeiB9XRdSMN9o09OKQ7pv2wf7bDgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sun, 8 Jun
 2025 03:06:56 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8813.020; Sun, 8 Jun 2025
 03:06:56 +0000
From: Meng Li <Meng.Li@windriver.com>
To: krzk+dt@kernel.org, linux@roeck-us.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
        imx@lists.linux.dev, shawnguo@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v4 PATCH 2/2] arch: arm64: dts: add big-endian property back into watchdog node
Date: Sun,  8 Jun 2025 11:06:16 +0800
Message-Id: <20250608030616.3874517-3-Meng.Li@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: e67b322d-354b-4d43-cab9-08dda6398657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CNbNLhFC3ziwdlNEXT5gOP5nG5PnVtlvBJicsoYJ8ETCTf3kdEh8le68p9KR?=
 =?us-ascii?Q?nqtGgKWuUkJAemDUqKpd8S5r4MeQnrx0JEPa5z2h0DrG0+FpSuFRF8ugu0HN?=
 =?us-ascii?Q?Z7oH7M6Tn8P88XgcstO4wqDomsq/WYcEQ/INJTdgUPn/FjYcs+ZgRn+Z8Tv6?=
 =?us-ascii?Q?JUbBBgtDOmbFDEeLjefrEZydoMs7wbp/MpWz+1egYgi/7u2sAdq8bUcZ1wNT?=
 =?us-ascii?Q?ag/KC8QXuHdvtH3Phfq3xUZVPMFqGe7Adyz1KwdoXSqsRYTn4SJKRGJQKhdU?=
 =?us-ascii?Q?2v0CncDQOaCav/OxF2jcM4+p3Xx4ZfQqIMI5t1x1BLjQ6WMqvCq9jMFQ5TnJ?=
 =?us-ascii?Q?ovvFoedGpl8ePlbLkwneoACBnP2AYdOcq/fZl+CllKdKezG7t8eBhto0X8zt?=
 =?us-ascii?Q?GyuinU3LQajC1E0wBLFHuxLGk1goSI7WMqQRIrGt1hVekIBefhFOb/kXpcFi?=
 =?us-ascii?Q?jOlWalLwh7nclPBCaB/k3NBowABx43niWexZROS6ymXHt/YxBCV5tq1rI6Ng?=
 =?us-ascii?Q?s8HLJPPkvD5K2jH1V/XxbA6hKNy+OsAFn49laAiH07GZ1pVv1RvbW+TTuAgS?=
 =?us-ascii?Q?gf2rqOm4D+tjJO2UFMlzOD4rJ8J6y9CPqI6yVhuRY+PVUP90uVnABi5XTM0N?=
 =?us-ascii?Q?7W4qpBQplGEbM8vIK/p/h8h6zqCjy9YP4xJVcPgdOAIv5ZmMZkgMXKyV/gyW?=
 =?us-ascii?Q?ZtmHlbddkiFu4OQpzoJKbjV+w8OCpPqp2OZTVEYV7s9yGSII84JT1fAxZk26?=
 =?us-ascii?Q?pQVzjHRS8byTCp9KtkXRLOPhhbAWtO+UngRQ0SzBWoTmvlra4XJH2TTBDWCu?=
 =?us-ascii?Q?y+2oEgQKGJDbN0khO5VacGdbYs87xiEIFGGLMJ1xxcyKzCVYh0YSzr5b5drw?=
 =?us-ascii?Q?ebHySPSfKOd+knh9gu0zuOKhazMEtsD6+aKDv9mAQ5rbiFzl8iS6KhHtlzQW?=
 =?us-ascii?Q?uYpDdKe+ZOVRPiK+mVV48jjMTLpPfMyv2z3E2VQGro6IQCozrLO6vdO/F4g4?=
 =?us-ascii?Q?u7PpLOX9Jo3qB7jBvFVqV1Mzk2cAB5O0PNSdTDdYyabEE906UiTX2ruRXPrw?=
 =?us-ascii?Q?YXm1PPlpID4K9g+g2zenysztGvDXgS2jtWOZdqPV23c1L9LLKSLy7YCldQYU?=
 =?us-ascii?Q?qIFivswDyYA9aMTIxvxHIfgvfvsltlzKoXOv+7X7u69navvVVadDjS4Yk4V7?=
 =?us-ascii?Q?YOTi504Bw5o7l7wu48iV35xLQx+zD+nbEIckvdqu0eeJ/z+dlnOMzeAfN8bY?=
 =?us-ascii?Q?VnKRC/QMrsCNL7S8MHujH5SQ4lZouKioGmJcbBtzLhqqE5fivyOZrhi/hHFp?=
 =?us-ascii?Q?0lKEPbtHCsCmlrkQh8TRvs7dhS7qorEZFKZWHnA1/MkResU2sN6+K0DJNS7b?=
 =?us-ascii?Q?NadtsyBwLLs8Zhiv9MlEs+Ln18W6LGJQg32bTdXwFzqJfkdYmIYBzoFbuOfn?=
 =?us-ascii?Q?4LV9w63RWM6+8tv2VVtMNwO69qyxFHTmDZPbpquh3bEPThSFVGamMNk15dxU?=
 =?us-ascii?Q?3+p4oX2Zw836ahc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2SiNT8WUGsCx0tqxUX1Am/1DJB05D4jpnPyTAQ2W9+mpMJbVNR1I/yYpG1s1?=
 =?us-ascii?Q?Qaenu2TAY2t+WsYF5qhGG4dEzpORc/ppOSG2zBHC1hbWqmIYN1/j7T0J0ikV?=
 =?us-ascii?Q?QtxyfQL7YDnNOOuinUhFbBY/TNEJGNcLzQMKfZpP6VF9qLz1pa1IZcvTj2l5?=
 =?us-ascii?Q?MwAP7N50lhaDJyBgoBCuSmqL2k3/XxA2R8P/nd/4mPk2X6KyKJhQ2o9RNGf6?=
 =?us-ascii?Q?IXysYWr6QtIqsueyo1VMcLilM3OtzblDB7oYpVRh1ebK7StZYjJK7Jk1GLUV?=
 =?us-ascii?Q?yT0aY6N5vTKdffLjoZsf0XZ0xEO+QBsh/BIpLpyom50pBo5njUJts28hHcRK?=
 =?us-ascii?Q?RrKkWPS0yY39HgfQb4s55YleB0+OtHEr9GsRSdtxTy6BtSI1cazwdQwGnBM0?=
 =?us-ascii?Q?6w9aWeEkSzRUhhfhtyxY0v7R4mRcqoxB5npO0/TD28oxiIOPvTG2JMVnoKMD?=
 =?us-ascii?Q?shGMCFMm5suZmK6qS78qZsfc9RiWf97wKra8aySvtJELCnBA+nd0vLLek5ov?=
 =?us-ascii?Q?ejik9Zyq+bTctc/2jKwCwUJddBKkbgiIKFbWbUFt6Tacr+jOhtpw18neHYMo?=
 =?us-ascii?Q?yOrPEVoPiIoqWHqhe6ljIxuJt0dRvk0mJgbvyjEVqU8LcLK+w3uBOHKJXEXt?=
 =?us-ascii?Q?grwvrd3+J6hlxq/Rm/zEmeCj+AsWhKx2+ESI0a+Rzu7TX2cAF4Wvi7v4aCT+?=
 =?us-ascii?Q?CFIwiSwq+TwWJbaHFKraqy2ZZ4SAxb4wkQNJy+KLVpBXt1mwTYw4jaSw/DXs?=
 =?us-ascii?Q?arFFHrne9wG38IRnCM9/QZwFxabGLsTjhXZAlmyPRLObmh2SodBkKMMWLBbO?=
 =?us-ascii?Q?zG07CcCiq+f0ahDS1Y/MtRTuhbXl4JvqUiB62HQ8agHUHAFyFdGEhRHqiVIT?=
 =?us-ascii?Q?lwUbyD5nLkZZwYGCF/pn7rtgwmgUmOUgkkKZbT5y+KHGWgOT4PGlwS5Wrq3U?=
 =?us-ascii?Q?YPhzMAtwMABTc1OY7MPV+6/Pb/GNSq2QYaTkhlf1fHs5uZE/MrP9nj7Lzh2v?=
 =?us-ascii?Q?XNZ8LyY9LLTtMEoVy3o2fVTLu09CX9sHmleY7L+w1xVFE0AmYqY2/NlqWtUE?=
 =?us-ascii?Q?ohPu/fK8Jkc7s5SxMlkSqDqP2dTLwtDDox6H8xCbKeQalYwCw+2GT6aF37Qx?=
 =?us-ascii?Q?mDOWpjKRwp2aRGwjGCSjja9UJO4WF3QSKMOgjqH4gXyrwGBb0CJv5DizE7VM?=
 =?us-ascii?Q?P+BI7JuqpY1qosmwJEgKvhKDW0Etgqmwm38Pf1HG3PwgLkiGm52FXLW7YZ10?=
 =?us-ascii?Q?yIt5u6CLV7ZEswMsf6+sLXpA99XLjkPuwv0YHMSGxaGBwav4j0hqp0Li3FbZ?=
 =?us-ascii?Q?1afCrrkslH7AHC5AZQbNnwh1aAcV3357tP+DS8fhjHnUEY4b/w5FtIUxNxKc?=
 =?us-ascii?Q?jnhkv2bX0tXpq7unUjeCgX6lcLXX1t9d9VSSNQzaFnylJzZwPtRqUNkH/fQ4?=
 =?us-ascii?Q?NTFizbEsNqtLVtnxw9mfMxLDwjLXWG2lClz4H3+xKGzbgWcGdxjaCdSfaAOY?=
 =?us-ascii?Q?p18nQlVX+cc26Jg0Pi9fq33dj7eFeCHm9TYo8yPOIvEOdUN3TAacTZMbGUvW?=
 =?us-ascii?Q?JWnVDcDVXGxFo6Wa64u/aE6OM3yX2YfGKoB5Qp+y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67b322d-354b-4d43-cab9-08dda6398657
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 03:06:56.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svl2D8wuy1Q2aNPl9LmOvEWts4LIwg9Hy1ZNCTVqEr9pFEj51fdYAI2bzBj1Z/p+PKeVr7RbZCzSB7tjrHIKIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
X-Proofpoint-GUID: b1Gu2fV2EW8ORcI86lPLO80qhoKYNpqk
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6844fe52 cx=c_pps a=YXQ/WW643sj4zjPNXnoT/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=N8_2f3WcjlOfNawuRIgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDAyMSBTYWx0ZWRfX/qEE6HMHEBRA w/Burf/Usp5Bs+e0tm68w9jUgt9I2XuccekDGA9E/JBO4mwzFf3nRr5mlG57Z/E+w7PqyXPu6gm lRqXB2r5WOFScRAp1i5bIfrgf88KkYrdmSjXT03CHfii6Sqx6nDPr+Wp6f6RhVugEBL82RFf0W+
 MXpLjK3PUNb62X93YTMbKc9rpz4sf4tm+9h7ZZc/2ZcOLXpwG4fk6/1p5goFm+nk6IKy8qSwoc/ ILkyd97BCHVFHlS8COK1UNylkOEIypgKCjAIcFSQQ0ndx3XHwx0xzPyEr5Gyak0OoLgUv5Y3A9G 5RW9NJa0hnqsk42+BEHS2aYbuCTFcijoIvmDHrkAjzr3eyRJfCThS1KwmKI5A7//jOeWpXjMZLY
 kTx/RuxlovauTazsn9ZwuGWMqXnvsIoI9jU8EMAXViobY5JYyLgcUJ3LNF89RpANS+GhCAIf
X-Proofpoint-ORIG-GUID: b1Gu2fV2EW8ORcI86lPLO80qhoKYNpqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=940 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506080021

Watchdog doesn't work on NXP ls1046ardb board because in commit
7c8ffc5555cb("arm64: dts: layerscape: remove big-endian for mmc nodes"),
it intended to remove the big-endian from mmc node, but the big-endian of
watchdog node is also removed by accident. So, add watchdog big-endian
property back.

In addition, add compatible string fsl,ls1046a-wdt, which allow big-endian
property.

Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0baf256b4400..983b2f0e8797 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -687,11 +687,12 @@ lpuart5: serial@29a0000 {
 		};
 
 		wdog0: watchdog@2ad0000 {
-			compatible = "fsl,imx21-wdt";
+			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
 			reg = <0x0 0x2ad0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
+			big-endian;
 		};
 
 		edma0: dma-controller@2c00000 {
-- 
2.34.1


